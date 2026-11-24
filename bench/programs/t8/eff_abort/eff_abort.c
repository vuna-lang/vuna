/* eff_abort 的 C 对照：与 eff_abort.vuna 同语义；C 侧把 bracket + runExn 内联成
 * 状态机：use 立刻 abort（短路，跳过 use 之后的 `pure k`），bracket 的 release
 * 在异常路径上仍然执行，每轮恰好一次。测 abort 短路与 cleanup 收尾的成本。 */
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

static volatile int64_t counter = 0;

/* use：throwExn "boom" —— 置 abort 位并短路，`pure k` 不再执行。 */
static int64_t use_may_throw(int64_t k, int *threw) {
  *threw = 1;
  return k;
}

/* bracket (pure 0) (\_ => bump ref 0) (\_ => throw "boom")，由 runExn 捕获。 */
static int64_t bracket_abort(int64_t k) {
  int threw = 0; /* acquire：pure 0，无副作用 */
  int64_t r = use_may_throw(k, &threw);
  counter += 1; /* release / cleanup：正常与 abort 路径都恰好执行一次 */
  if (threw) return k; /* runExn 捕获后 abortOnce 的 `pure k` */
  return r;
}

/* loop ref 0 = pure 0；loop ref (Succ m) = do _ <- abortOnce ref m; loop ref m。 */
static void loop(int64_t n) {
  while (n > 0) {
    (void)bracket_abort(0);
    n--;
  }
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  loop(n);
  printf("%" PRId64, counter); /* golden 无尾换行 */
  return 0;
}