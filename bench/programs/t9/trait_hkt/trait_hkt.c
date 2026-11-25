/* trait_hkt 的 C 对照：与 trait_hkt.vuna 同算法。
 *
 * 算法：N 轮（基准形状 N = 20 万）跑两条同形管线：
 *   Maybe：x 来自 Just j，a = fmap (2x+1)；b = liftA2 (+) a a；结果 = bind (+3)；
 *   List ：x 来自 [j; j + 1]，每个 x 各得 a = 2x+1，b 是所有两两之和，各 +3 后求和。
 * 两条管线的累加值最后相加。
 *
 * C 侧表示要点：
 *   - vuna 里同一份 `Monad m => m Int -> m Int` 先用 Maybe 字典、再用 List 字典实例化；
 *     C 没有隐式字典，按 `.ml` 写法把两个实例分别显式展开（Maybe 单值 / List 两个值）。
 *   - Maybe 管线恒成功，不存在 Nothing 分支；List 管线的 liftA2 是笛卡尔组合。
 *   - Int 是 64 位有符号 → int64_t；N 从 argv 读，避免 GCC 折成闭式。
 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

static int64_t pipe_maybe(int64_t j) {
  int64_t a = j * 2 + 1;
  int64_t b = a + a;
  return b + 3;
}

static int64_t pipe_list(int64_t j) {
  int64_t xs[2] = {j, j + 1};
  int64_t total = 0;
  for (int i = 0; i < 2; i++) {
    for (int k = 0; k < 2; k++) {
      int64_t a = xs[i] * 2 + 1;
      int64_t b = a + (xs[k] * 2 + 1);
      total += b + 3;
    }
  }
  return total;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  int64_t am = 0;
  int64_t al = 0;
  for (int64_t j = n; j > 0; j--) {
    am += pipe_maybe(j);
    al += pipe_list(j);
  }
  printf("%" PRId64 "\n", am + al);
  return 0;
}