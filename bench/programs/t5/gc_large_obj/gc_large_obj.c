/* 手写 C 对照：与 gc_large_obj.vuna 同算法——每轮 malloc 8192 个 int64 槽位（64 KB），
 * 读一个槽位与长度后 free，累计 N 轮（N 从 argv 读）。
 *
 * 口径：C 侧是 malloc/free 手工释放（分配 → 用 → 立即 free），RSS 对比反映 GC 元数据
 * 与高水位（大对象直分配与回收），而非同语义堆。
 * Int 是 64 位有符号：累计用 int64_t；本用例的累计值不依赖回绕。
 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#define SLOTS 8192

static void *xmalloc(size_t bytes) {
  void *p = malloc(bytes);
  if (!p) {
    fputs("out of memory\n", stderr);
    abort();
  }
  return p;
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
    int64_t *a = xmalloc((size_t)SLOTS * sizeof *a);
    for (int64_t i = 0; i < SLOTS; i += 1) a[i] = n;
    total += a[SLOTS / 2] + SLOTS;
    free(a);
  }

  printf("%lld\n", (long long)total);
  return 0;
}