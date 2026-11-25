/* thread_parallel_sum 的 C 对照：4 个 pthread 各自做同一段纯累加。 */
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

static long per = 0;

static void *work(void *p) {
  (void)p;
  long acc = 0;
  for (long i = 1; i <= per; i++) acc += i;
  return (void *)acc;
}

int main(int argc, char **argv) {
  per = argc > 1 ? strtol(argv[1], NULL, 10) : 0;
  pthread_t ts[4];
  long total = 0;
  for (int i = 0; i < 4; i++)
    if (pthread_create(&ts[i], NULL, work, NULL) != 0) return 1;
  for (int i = 0; i < 4; i++) {
    void *r = NULL;
    pthread_join(ts[i], &r);
    total += (long)r;
  }
  printf("%ld\n", total);
  return 0;
}
