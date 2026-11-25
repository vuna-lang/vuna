/* trait_num 的 C 对照：与 trait_num.vuna 同算法。
 *
 * 算法：N 轮（基准形状 N = 30 万）对 Mod 值做有界递推
 *   step x = y - (y / 2^20) * 2^20，其中 y = x * 5 + 3
 * 输出最终值 + `show x`（"Mod <v>"）的长度。
 *
 * C 侧表示要点：
 *   - vuna 里 + - * / 与字面量都走 Mod 的 Num / FromInt 实例；C 按 `.ml` 把每个方法
 *     写成 struct 上的普通函数（add / sub / mul / div），字面量显式构造。
 *   - 值域 [0, 2^20) 保证不触发 63 位回绕，不需要位宽模拟。
 *   - Int 是 64 位有符号 → int64_t；N 从 argv 读，避免 GCC 折成闭式。
 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct {
  int64_t v;
} Mod;

static Mod mk(int64_t v) {
  Mod m = {v};
  return m;
}

static Mod add(Mod a, Mod b) { return mk(a.v + b.v); }
static Mod sub(Mod a, Mod b) { return mk(a.v - b.v); }
static Mod mul(Mod a, Mod b) { return mk(a.v * b.v); }
static Mod divi(Mod a, Mod b) { return mk(a.v / b.v); }

static Mod step(Mod x) {
  Mod y = add(mul(x, mk(5)), mk(3));
  return sub(y, mul(divi(y, mk(1048576)), mk(1048576)));
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  Mod x = mk(1);
  for (int64_t i = 0; i < n; i++) {
    x = step(x);
  }
  char buf[32];
  int64_t len = (int64_t)snprintf(buf, sizeof buf, "Mod %" PRId64, x.v);
  printf("%" PRId64 "\n", x.v + len);
  return 0;
}