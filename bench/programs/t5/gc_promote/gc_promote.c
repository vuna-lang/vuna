/* 手写 C 对照：与 gc_promote.vuna 同算法——每轮建一个 16 节点 List，只保留最近 128 个
 * （固定存活集 = 2048 个节点），最旧的丢弃；最后把保留环里的元素求和，累计 N 轮（N 从 argv 读）。
 *
 * 口径：C 侧是 malloc/free 手工释放（被挤出环的 List 立即 free），RSS 对比反映 GC 元数据
 * 与高水位（晋升与 major 回收），而非同语义堆。
 * Int 是 64 位有符号：累计用 int64_t；本用例的累计值不依赖回绕。
 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Cell {
  int64_t head;
  struct Cell *tail;
} Cell;

#define RING_LISTS 128
#define LIST_CELLS 16

static void *xmalloc(size_t bytes) {
  void *p = malloc(bytes);
  if (!p) {
    fputs("out of memory\n", stderr);
    abort();
  }
  return p;
}

/* 建 [start, start + cells) 的单链表（前插，与 vuna 的尾构造等价）。 */
static Cell *build(int64_t start, int64_t cells) {
  Cell *xs = NULL;
  for (int64_t i = 0; i < cells; i += 1) {
    Cell *c = xmalloc(sizeof *c);
    c->head = start + i;
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

static int64_t sum_list(const Cell *xs) {
  int64_t total = 0;
  for (; xs; xs = xs->tail) total += xs->head;
  return total;
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

  Cell *ring[RING_LISTS];
  for (int i = 0; i < RING_LISTS; i += 1) ring[i] = NULL;

  int64_t total = 0;
  for (int64_t i = rounds; i > 0; i -= 1) {
    Cell *xs = build(i, LIST_CELLS);
    total += sum_list(xs);

    free_list(ring[RING_LISTS - 1]);
    memmove(&ring[1], &ring[0], (RING_LISTS - 1) * sizeof ring[0]);
    ring[0] = xs;
  }

  int64_t ring_sum = 0;
  for (int i = 0; i < RING_LISTS; i += 1) ring_sum += sum_list(ring[i]);
  printf("%lld\n", (long long)(total + ring_sum));

  for (int i = 0; i < RING_LISTS; i += 1) free_list(ring[i]);
  return 0;
}