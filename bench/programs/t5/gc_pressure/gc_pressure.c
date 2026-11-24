/* 手写 C 对照：与 gc_pressure.vuna 同算法——每轮分配一个 int 的十进制字符串与一个
 * 16 字节串，取长度后丢弃，累计 N 轮（N 从 argv 读）。
 *
 * 口径：C 侧是 malloc/free 手工释放（分配 → 用 → 立即 free），RSS 对比反映 GC 元数据
 * 与高水位（GC 何时把内存还给 OS、堆预留与碎片），而非同语义堆。
 * Int 是 64 位有符号：计数用 int64_t；本用例的累计值不依赖回绕。
 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SMALL_BYTES 16

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
    char digits[24];
    int len = snprintf(digits, sizeof digits, "%lld", (long long)n);
    char *s = xmalloc((size_t)len + 1);
    memcpy(s, digits, (size_t)len + 1);

    char *t = xmalloc(SMALL_BYTES + 1);
    memcpy(t, "0123456789abcdef", SMALL_BYTES);
    t[SMALL_BYTES] = '\0';

    total += (int64_t)strlen(s) + (int64_t)strlen(t);

    free(t);
    free(s);
  }

  printf("%lld\n", (long long)total);
  return 0;
}