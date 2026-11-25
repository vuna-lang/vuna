/* host_env 的 C 对照：与 host_env.vuna 同语义；每轮 getenv("HOME") 一次，
 * 结果写进 volatile sink（不可被优化掉），最后只输出循环次数。 */
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

static volatile const char *sink;

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  int64_t acc = 0;
  while (n > 0) {
    sink = getenv("HOME");
    acc += 1;
    n--;
  }
  printf("%" PRId64, acc); /* golden 无尾换行 */
  return 0;
}