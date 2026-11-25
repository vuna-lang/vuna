/* thread_cas 的 C 对照：4 个 pthread 各用 compare_exchange_weak 自增 50000 次。 */
#include <pthread.h>
#include <stdatomic.h>
#include <stdio.h>
#include <stdlib.h>

static atomic_long cell;
static long per = 0;

static void *work(void *p) {
  (void)p;
  for (long i = 0; i < per; i++) {
    long old = atomic_load(&cell);
    while (!atomic_compare_exchange_weak(&cell, &old, old + 1)) {
    }
  }
  return NULL;
}

int main(int argc, char **argv) {
  per = argc > 1 ? strtol(argv[1], NULL, 10) : 0;
  pthread_t ts[4];
  for (int i = 0; i < 4; i++)
    if (pthread_create(&ts[i], NULL, work, NULL) != 0) return 1;
  for (int i = 0; i < 4; i++) pthread_join(ts[i], NULL);
  printf("%ld\n", atomic_load(&cell));
  return 0;
}