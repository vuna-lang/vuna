/* thread_atomic_counter 的 C 对照：4 个 pthread + atomic_fetch_add。 */
#include <pthread.h>
#include <stdatomic.h>
#include <stdio.h>
#include <stdlib.h>

static atomic_long cell;
static long per = 0;

static void *work(void *p) {
  (void)p;
  for (long i = 0; i < per; i++) atomic_fetch_add(&cell, 1);
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
