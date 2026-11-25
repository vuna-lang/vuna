/* mut_barrier 的 C 对照：与 mut_barrier.vuna 同算法——512 个槽的 Cell* 数组常驻，
 * 每轮 malloc 一个新 Cell 写进槽里（替换的旧 Cell 立即 free），再读回该槽；
 * 每 64 轮累加一次读到的字段。N 从 argv 读。
 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#define CAP 512

typedef struct {
  int64_t a;
  int64_t b;
} Cell;

static Cell *new_cell(int64_t a, int64_t b) {
  Cell *c = malloc(sizeof *c);
  if (!c) {
    fputs("out of memory\n", stderr);
    abort();
  }
  c->a = a;
  c->b = b;
  return c;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  if (n < 0) return 1;
  Cell *arr[CAP];
  for (int i = 0; i < CAP; i += 1) arr[i] = new_cell(0, 0);
  int64_t acc = 0;
  for (int64_t i = 0; i < n; i += 1) {
    int64_t slot = i % CAP;
    Cell *c = new_cell(i, i + 1);
    free(arr[slot]);
    arr[slot] = c;
    const Cell *r = arr[slot];
    if (i % 64 == 0) acc += r->a;
  }
  acc += arr[0]->a + arr[CAP - 1]->b;
  printf("%" PRId64, acc);
  for (int i = 0; i < CAP; i += 1) free(arr[i]);
  return 0;
}