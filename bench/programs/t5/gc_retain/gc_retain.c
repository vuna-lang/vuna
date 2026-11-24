/* 手写 C 对照：与 gc_retain.vuna 同算法——先保留 600 个千元素 List（存活集，全程不释放），
 * 再 churn N 轮：每轮分配同尺寸的临时 List，计数后丢弃；最后对存活集求和（N 从 argv 读）。
 *
 * 口径：C 侧是 malloc/free 手工释放（临时表立即 free，存活集保留到结尾），RSS 对比反映
 * GC 元数据与高水位（整堆回收重扫存活集、堆预留与碎片），而非同语义堆。
 * Int 是 64 位有符号：计数用 int64_t；本用例的累计值不依赖回绕。
 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct Cell {
  int64_t head;
  struct Cell *tail;
} Cell;

#define LIVE_LISTS 600
#define LIST_CELLS 1000

static void *xmalloc(size_t bytes) {
  void *p = malloc(bytes);
  if (!p) {
    fputs("out of memory\n", stderr);
    abort();
  }
  return p;
}

static Cell *build(int64_t cells) {
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

  Cell *live[LIVE_LISTS];
  for (int i = 0; i < LIVE_LISTS; i += 1) live[i] = build(LIST_CELLS);

  int64_t churn = 0;
  for (int64_t n = rounds; n > 0; n -= 1) {
    Cell *tmp = build(LIST_CELLS);
    churn += count(tmp);
    free_list(tmp);
  }

  int64_t live_sum = 0;
  for (int i = 0; i < LIVE_LISTS; i += 1) live_sum += count(live[i]);

  printf("%lld\n", (long long)(live_sum + churn));

  for (int i = 0; i < LIVE_LISTS; i += 1) free_list(live[i]);
  return 0;
}