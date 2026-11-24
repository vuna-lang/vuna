/* 手写 C 对照：与 gc_array_churn.vuna 同算法——每轮 fromList 建 1000 元素数组，
 * 再按下标的 copy-on-write 复制一份并改写首元，取长度与首元后丢弃，累计 N 轮（N 从 argv 读）。
 *
 * 口径：C 侧是 malloc/free 手工释放（中间 List、原数组、复制数组依次立即 free），RSS 对比
 * 反映 GC 元数据与高水位（大对象分配、复制后旧数组何时回收），而非同语义堆。
 * Int 是 64 位有符号：计数用 int64_t；本用例的累计值不依赖回绕。
 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct Cell {
  int64_t head;
  struct Cell *tail;
} Cell;

#define LIST_CELLS 1000

static void *xmalloc(size_t bytes) {
  void *p = malloc(bytes);
  if (!p) {
    fputs("out of memory\n", stderr);
    abort();
  }
  return p;
}

static Cell *range(int64_t cells) {
  Cell *xs = NULL;
  for (int64_t i = cells - 1; i >= 0; i -= 1) {
    Cell *c = xmalloc(sizeof *c);
    c->head = i;
    c->tail = xs;
    xs = c;
  }
  return xs;
}

static void free_list(Cell *xs) {
  while (xs) {
    Cell *tail = xs->tail;
    free(xs);
    xs = tail;
  }
}

static int64_t *from_list(const Cell *xs, int64_t cells) {
  int64_t *a = xmalloc((size_t)cells * sizeof *a);
  int64_t i = 0;
  for (; xs; xs = xs->tail) a[i++] = xs->head;
  return a;
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
    Cell *xs = range(LIST_CELLS);
    int64_t *a = from_list(xs, LIST_CELLS);
    free_list(xs);

    int64_t *b = xmalloc((size_t)LIST_CELLS * sizeof *b);
    for (int64_t i = 0; i < LIST_CELLS; i += 1) b[i] = a[i];
    b[0] = n;

    total += LIST_CELLS + b[0];

    free(b);
    free(a);
  }

  printf("%lld\n", (long long)total);
  return 0;
}