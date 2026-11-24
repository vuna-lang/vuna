/* 手写 C 对照：与 sort_lib.vuna 同输入、同排序语义。
   .vuna 用 Base.Data.Sort.sortBy（混合归并：有序探测 + 小表插入 + 归并），.ml 用标准库
   List.sort 作为手写上限；这里手写自顶向下归并排序（临时数组，稳定），只依赖 libc。
   输入是 scramble(k)（k = 1..N）的集合，排序后按 acc = acc*31 + x 折叠，与 .vuna 逐位一致。
   伪随机键 scramble(i) = i*7919 - (i*7919)/100003*100003。规模 N 从 argv[1] 读入。 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

/* vuna Int 是 63 位二进制补码（与 OCaml int 相同），先按 2^64 运算再符号扩展到 63 位。 */
static int64_t wrap63(uint64_t u) {
  const uint64_t mask = (UINT64_C(1) << 63) - 1;
  u &= mask;
  if (u & (UINT64_C(1) << 62)) u |= ~mask;
  return (int64_t)u;
}

static void *xmalloc(size_t n) {
  void *p = malloc(n);
  if (!p) {
    fprintf(stderr, "out of memory\n");
    exit(1);
  }
  return p;
}

static int64_t scramble(int64_t i) {
  int64_t x = i * 7919;
  return x - x / 100003 * 100003;
}

static void merge_sort(int64_t *a, int64_t *tmp, size_t lo, size_t hi) {
  if (hi - lo < 2) return;
  size_t mid = lo + (hi - lo) / 2;
  merge_sort(a, tmp, lo, mid);
  merge_sort(a, tmp, mid, hi);
  size_t i = lo;
  size_t j = mid;
  size_t k = lo;
  while (i < mid && j < hi) {
    if (a[i] <= a[j])
      tmp[k++] = a[i++];
    else
      tmp[k++] = a[j++];
  }
  while (i < mid) tmp[k++] = a[i++];
  while (j < hi) tmp[k++] = a[j++];
  for (k = lo; k < hi; k++) a[k] = tmp[k];
}

int main(int argc, char **argv) {
  if (argc < 2) {
    fprintf(stderr, "usage: %s N\n", argv[0]);
    return 2;
  }
  int64_t n = strtoll(argv[1], NULL, 10);
  if (n < 0) n = 0;

  size_t len = (size_t)n;
  int64_t *a = xmalloc((len ? len : 1) * sizeof(int64_t));
  int64_t *tmp = xmalloc((len ? len : 1) * sizeof(int64_t));
  for (int64_t k = 1; k <= n; k++) a[(size_t)(k - 1)] = scramble(k);

  merge_sort(a, tmp, 0, len);

  int64_t acc = 0;
  for (size_t i = 0; i < len; i++)
    acc = wrap63((uint64_t)acc * 31u + (uint64_t)a[i]);
  printf("%" PRId64 "\n", acc);

  free(a);
  free(tmp);
  return 0;
}