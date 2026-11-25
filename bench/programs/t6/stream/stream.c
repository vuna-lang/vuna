/* 手写 C 对照：与 stream.vuna 同算法（拉式流：fromList / map / filter / take / foldl）。
   .vuna 每步显式推进一个 thunk（MkStream (Unit -> StreamStep)），.ml 用同形的
   unit -> step；这里按 .ml 的口径逐元素推进同一个状态机：输入 0..N-1 尾构造，
   map (*3)、filter even、整条流 foldl 求和，再 take 前 500 个求和。
   规模 N 从 argv[1] 读入。 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

static void *xmalloc(size_t n) {
  void *p = malloc(n);
  if (!p) {
    fprintf(stderr, "out of memory\n");
    exit(1);
  }
  return p;
}

/* 已推进的流位置：from_list / map / filter 三层都对同一个下标推进。 */
typedef struct {
  int64_t pos; /* 已消费的输入元素个数 */
  int64_t n;
} Stream;

/* 推进一格（跳过被 filter 滤掉的元素），返回 1 并写出产出值，耗尽返回 0。 */
static int stream_next(Stream *s, int64_t *out) {
  while (s->pos < s->n) {
    int64_t x = s->pos;
    s->pos += 1;
    if (x - x / 2 * 2 == 0) {
      *out = x * 3;
      return 1;
    }
  }
  return 0;
}

int main(int argc, char **argv) {
  if (argc < 2) {
    fprintf(stderr, "usage: %s N\n", argv[0]);
    return 2;
  }
  int64_t n = strtoll(argv[1], NULL, 10);
  if (n < 0) n = 0;

  /* 整条流 foldl (+) 0 */
  Stream s = {0, n};
  int64_t total = 0;
  int64_t x;
  while (stream_next(&s, &x)) total += x;

  /* take 500：新建一条流，取前 500 个产出后 foldl (+) 0 */
  Stream t = {0, n};
  int64_t *prefix = xmalloc((size_t)500 * sizeof *prefix);
  int64_t pn = 0;
  while (pn < 500 && stream_next(&t, &x)) prefix[pn++] = x;
  int64_t prefix_sum = 0;
  for (int64_t i = 0; i < pn; i += 1) prefix_sum += prefix[i];

  printf("%" PRId64 "\n", total + prefix_sum + pn);

  free(prefix);
  return 0;
}