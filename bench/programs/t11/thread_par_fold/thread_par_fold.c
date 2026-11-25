/* thread_par_fold 的 C 对照：4 个 pthread 各对连续一块做同样的三角和累加。 */
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

#define JOBS 4

static long n = 0;
static long total = 0;

static long tri(long k) { return k * (k + 1) / 2; }

static void *work(void *p) {
  long job = (long)p;
  long lo = n * job / JOBS;
  long hi = n * (job + 1) / JOBS;
  long acc = 0;
  for (long i = lo; i < hi; i++) acc += tri(3000 + i % 64);
  return (void *)acc;
}

int main(int argc, char **argv) {
  n = argc > 1 ? strtol(argv[1], NULL, 10) : 0;
  pthread_t ts[JOBS];
  for (long j = 0; j < JOBS; j++)
    if (pthread_create(&ts[j], NULL, work, (void *)j) != 0) return 1;
  for (long j = 0; j < JOBS; j++) {
    void *r = NULL;
    if (pthread_join(ts[j], &r) != 0) return 1;
    total += (long)r;
  }
  printf("%ld\n", total);
  return 0;
}