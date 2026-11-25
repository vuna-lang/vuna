/* host_clock 的 C 对照：与 host_clock.vuna 同语义；每轮 clock_gettime 一次，
 * 结果写进 volatile sink（不可被优化掉），最后只输出循环次数。 */
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

static volatile int64_t sink;

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  struct timespec ts;
  int64_t acc = 0;
  while (n > 0) {
    if (clock_gettime(CLOCK_MONOTONIC, &ts) == 0) sink = (int64_t)ts.tv_nsec;
    acc += 1;
    n--;
  }
  printf("%" PRId64, acc); /* golden 无尾换行 */
  return 0;
}