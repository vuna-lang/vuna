/* 手写 C 对照：与 gc_low_live.vuna 同算法——每轮分配 1000 个 List 单元 + 1000 字节
 * 字符串，取长度后全部丢弃，累计 N 轮（N 从 argv 读）。
 *
 * 口径：C 侧是 malloc/free 手工释放（分配 → 用 → 立即 free），RSS 对比反映 GC 元数据
 * 与高水位（GC 何时把内存还给 OS、堆预留与碎片），而非同语义堆。
 * Int 是 64 位有符号：累加用 int64_t；本用例的累计值不依赖回绕。
 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Cell {
  int64_t head;
  struct Cell *tail;
} Cell;

#define ROUND_CELLS 1000
#define ROUND_BYTES 1000

static void *xmalloc(size_t bytes) {
  void *p = malloc(bytes);
  if (!p) {
    fputs("out of memory\n", stderr);
    abort();
  }
  return p;
}

static Cell *cons(int64_t head, Cell *tail) {
  Cell *c = xmalloc(sizeof *c);
  c->head = head;
  c->tail = tail;
  return c;
}

static void free_list(Cell *xs) {
  while (xs) {
    Cell *tail = xs->tail;
    free(xs);
    xs = tail;
  }
}

static int64_t count(const Cell *xs) {
  int64_t n = 0;
  for (; xs; xs = xs->tail) n += 1;
  return n;
}

int main(int argc, char **argv) {
  if (argc < 2) {
    fprintf(stderr, "usage: %s N\n", argv[0]);
    return 2;
  }
  char *end = NULL;
  int64_t rounds = strtoll(argv[1], &end, 10);
  if (!end || *end != '\0') {
    fprintf(stderr, "invalid N: %s\n", argv[1]);
    return 2;
  }

  int64_t total = 0;
  for (int64_t n = rounds; n > 0; n -= 1) {
    Cell *xs = NULL;
    for (int64_t i = ROUND_CELLS - 1; i >= 0; i -= 1) xs = cons(i, xs);

    char *s = xmalloc(ROUND_BYTES + 1);
    for (int i = 0; i < 100; i += 1) memcpy(s + i * 10, "0123456789", 10);
    s[ROUND_BYTES] = '\0';

    total += count(xs) + (int64_t)strlen(s);

    free(s);
    free_list(xs);
  }

  printf("%lld\n", (long long)total);
  return 0;
}