/* thread_trylock 的 C 对照：4 个 pthread 用 pthread_mutex_trylock + sched_yield 争用。 */
#define _POSIX_C_SOURCE 200809L
#include <pthread.h>
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>

static pthread_mutex_t mu = PTHREAD_MUTEX_INITIALIZER;
static long counter = 0;
static long per = 0;

static void *work(void *p) {
  (void)p;
  for (long i = 0; i < per; i++) {
    while (pthread_mutex_trylock(&mu) != 0) sched_yield();
    counter++;
    pthread_mutex_unlock(&mu);
  }
  return NULL;
}

int main(int argc, char **argv) {
  per = argc > 1 ? strtol(argv[1], NULL, 10) : 0;
  pthread_t ts[4];
  for (int i = 0; i < 4; i++)
    if (pthread_create(&ts[i], NULL, work, NULL) != 0) return 1;
  for (int i = 0; i < 4; i++) pthread_join(ts[i], NULL);
  printf("%ld\n", counter);
  return 0;
}