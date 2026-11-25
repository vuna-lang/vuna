/* thread_mutex_counter 的 C 对照：4 个 pthread + pthread_mutex。 */
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

static pthread_mutex_t mu = PTHREAD_MUTEX_INITIALIZER;
static long counter = 0;
static long per = 0;

static void *work(void *p) {
  (void)p;
  for (long i = 0; i < per; i++) {
    pthread_mutex_lock(&mu);
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
