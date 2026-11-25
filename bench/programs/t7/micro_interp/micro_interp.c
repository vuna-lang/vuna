/* micro_interp 的 C 对照：与 micro_interp.vuna 同算法。
 *
 * 算法：N 轮（基准形状 N = 30 万）把 n 与 n * 3 格式化成 "v=<n>;w=<n*3>;"，
 * 累加格式化结果的字节长度（3 + digits(n) + 3 + digits(n*3) + 1）。
 *
 * C 侧表示要点：
 *   - vuna 的模板降级成 `interp n ++ ";w=" ++ interp (n * 3) ++ ";"`，每段拼接都
 *     新建字符串；这里用一个 snprintf 得到同样的字节长度（长度是唯一被观察的量）。
 *   - Int 是 64 位有符号 → int64_t；N 从 argv 读，避免 GCC 把循环折成闭式。
 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

static int64_t loop(int64_t n, int64_t acc) {
  char buf[64];
  while (n > 0) {
    int len = snprintf(buf, sizeof buf, "v=%" PRId64 ";w=%" PRId64 ";", n, n * 3);
    acc += (int64_t)len;
    n--;
  }
  return acc;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  printf("%" PRId64 "\n", loop(n, 0));
  return 0;
}