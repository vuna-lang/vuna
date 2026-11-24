/* array 的 C 对照：与 array.vuna 同算法（build 前缀列表 → fromList → set 返回新数组 →
 * 逐元素 get 求和，最后加原数组长度）。
 * C 侧表示：不可变数组 = {数据指针, 长度} 结构体；set 用 malloc + memcpy 复制整块再写，
 * 与 copy-on-write 语义一致（长度 Nat 用 int64_t，非负）。
 * 规模 N 从 argv 读（等价 build 0 N），避免 GCC 把常量循环折成闭式。 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
  int64_t *data;
  int64_t len;
} Array;

static Array from_build(int64_t n) {
  Array a;
  a.len = n;
  a.data = malloc((size_t)n * sizeof(int64_t));
  for (int64_t i = 0; i < n; i++) a.data[i] = i;
  return a;
}

static Array set(Array a, int64_t i, int64_t v) {
  Array b;
  b.len = a.len;
  b.data = malloc((size_t)a.len * sizeof(int64_t));
  memcpy(b.data, a.data, (size_t)a.len * sizeof(int64_t));
  if (i < a.len) b.data[i] = v;
  return b;
}

static int64_t get(Array a, int64_t i) { return a.data[i]; }

static int64_t sumGet(Array a, int64_t i, int64_t k, int64_t acc) {
  while (k > 0) {
    acc += get(a, i);
    i++;
    k--;
  }
  return acc;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  Array a = from_build(n);
  Array b = set(a, 0, 7);
  int64_t total = sumGet(b, 0, b.len, 0) + a.len;
  printf("%ld\n", (long)total);
  free(b.data);
  free(a.data);
  return 0;
}