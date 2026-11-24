/* traits 的 C 对照：与 traits.vuna 同算法，约束多态 loop 单态展开。
 *
 * 算法：`run : Stepper a => Int -> a -> a` 是 N 次 `step`；两个实例各跑 N 次
 * （基准形状 N = 50 万），最后 `score` 相加：
 *   score (run N 0) + score (run N Box { v = 0 })          = 1000000
 *
 * C 侧表示要点：
 *   - vuna 靠字典派发同一份 `run`；C 没有隐式字典，按 `.ml` 的显式字典 record
 *     语义做单态展开：Int 一组、Box 一组，各自静态 step/score/run，run 里直调
 *     对应实例的 step（等价于把字典字段内联成常量后特化）。
 *   - Int 是 64 位有符号 → int64_t。
 *   - Box 是单字段 record → 只含一个 int64_t 的 struct，按值传递/返回；`{ b | v =
 *     b.v + 1 }` 写成拷贝一份再改字段（不分配堆对象，与 `.ml` 把 Box 退化成 int
 *     的数值语义一致）。
 *   - N 从 argv 读；loop 里的 asm 屏障告诉 GCC 每轮的值都可能被外部改写，避免它
 *     把“纯递增”的循环折叠成闭式、直接跳过 N 次迭代。
 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct {
  int64_t v;
} Box;

/* Int 实例。 */
static int64_t step_int(int64_t x) { return x + 1; }
static int64_t score_int(int64_t x) { return x; }

/* Box 实例。 */
static Box step_box(Box b) {
  Box next = {b.v + 1};
  return next;
}
static int64_t score_box(Box b) { return b.v; }

static int64_t run_int(int64_t n, int64_t x) {
  while (n > 0) {
    x = step_int(x);
    __asm__ volatile("" : "+r"(x));
    n--;
  }
  return x;
}

static Box run_box(int64_t n, Box x) {
  while (n > 0) {
    x = step_box(x);
    __asm__ volatile("" : "+r"(x.v));
    n--;
  }
  return x;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  Box zero = {0};
  /* golden 无行尾换行：run.sh 用命令替换比较，这里按 .out 逐字节对齐。 */
  printf("%" PRId64, score_int(run_int(n, 0)) + score_box(run_box(n, zero)));
  return 0;
}