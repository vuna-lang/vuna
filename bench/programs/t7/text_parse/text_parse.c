/* text_parse 的 C 对照：与 text_parse.vuna 同算法。
 *
 * 算法：N 轮（基准形状 N = 20 万）把 i * 37 + 7 格式化成十进制串，再解析回整数
 * （parseInt 与 parseNat 各一次，值相同），再格式化一次；累加两个解析值与第二次
 * 格式化结果的字节长度。
 *
 * C 侧表示要点：
 *   - `strFromInt` 的非负输入等价于 "%lld"；`parseInt` / `parseNat` 对同一串给出同一
 *     值，这里都用 strtoll 复现（输入恒为非负十进制，不触发符号 / 进制分支）。
 *   - Int 是 64 位有符号 → int64_t；N 从 argv 读，避免 GCC 折成闭式。
 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

static int64_t loop(int64_t n, int64_t acc) {
  char buf[32];
  for (int64_t i = 0; i < n; i++) {
    snprintf(buf, sizeof buf, "%" PRId64, i * 37 + 7);
    int64_t a = strtoll(buf, NULL, 10);
    int64_t b = strtoll(buf, NULL, 10);
    int len = snprintf(buf, sizeof buf, "%" PRId64, a);
    acc += a + b + (int64_t)len;
  }
  return acc;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  printf("%" PRId64 "\n", loop(n, 0));
  return 0;
}