/* 手写 C 对照：与 list_hof.vuna 同算法（map / filter / zip / concatMap / foldr 串成一条管线）。
   .vuna 与 .ml 都在单链表上组合高阶函数；这里用连续的 int64 数组做同样的五段处理
   （foldr 从尾部向前迭代），只依赖 libc。范围 0..N-1、各段变换与求和顺序都与 .vuna 一致。
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

int main(int argc, char **argv) {
  if (argc < 2) {
    fprintf(stderr, "usage: %s N\n", argv[0]);
    return 2;
  }
  int64_t n = strtoll(argv[1], NULL, 10);
  if (n < 0) n = 0;

  int64_t *xs = xmalloc((size_t)n * sizeof *xs);
  for (int64_t i = 0; i < n; i += 1) xs[i] = i;

  /* map (\x -> x*3 - 7) */
  int64_t *ys = xmalloc((size_t)n * sizeof *ys);
  for (int64_t i = 0; i < n; i += 1) ys[i] = xs[i] * 3 - 7;

  /* filter even */
  int64_t *zs = xmalloc((size_t)n * sizeof *zs);
  int64_t zn = 0;
  for (int64_t i = 0; i < n; i += 1) {
    if (xs[i] - xs[i] / 2 * 2 == 0) zs[zn++] = xs[i];
  }

  /* zip ys zs：长度取较短者 */
  int64_t pn = zn < n ? zn : n;
  int64_t pair_sum = 0;
  for (int64_t i = 0; i < pn; i += 1) pair_sum += ys[i] + zs[i];

  /* concatMap (\x -> [x, x+1]) zs */
  int64_t en = 2 * zn;
  int64_t *expanded = xmalloc((size_t)en * sizeof *expanded);
  for (int64_t i = 0; i < zn; i += 1) {
    expanded[2 * i] = zs[i];
    expanded[2 * i + 1] = zs[i] + 1;
  }

  /* foldr (\x a -> x - a) 0 expanded */
  int64_t folded = 0;
  for (int64_t i = en - 1; i >= 0; i -= 1) folded = expanded[i] - folded;

  printf("%" PRId64 "\n", pair_sum + folded + pn);

  free(expanded);
  free(zs);
  free(ys);
  free(xs);
  return 0;
}