/* eff_entry_host 的 C 对照：与 eff_entry_host.vuna 同语义；入口宿主叶子，没有用户
 * handler：每轮 consolePrint "" 走一次零字节写，然后 acc+1。C 侧把宿主叶子内联成
 * 一次零长度 fwrite（与 `output_string ""` 一样不产生实际数据），次数与顺序一致。
 * 测效应机器每次 perform 派发 + opH 尾 resume 的固定成本。 */
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

/* loop 0 acc = pure acc；loop (Succ m) acc = do _ <- consolePrint ""; loop m (acc + 1)。 */
static int64_t loop(int64_t n, int64_t acc) {
  while (n > 0) {
    (void)fwrite("", 1, 0, stdout); /* 一次零字节写，无实际输出 */
    acc += 1;
    n--;
  }
  return acc;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  printf("%" PRId64 "\n", loop(n, 0)); /* golden 带尾换行 */
  return 0;
}