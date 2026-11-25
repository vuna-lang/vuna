/* thread_spawn_join 的 C 对照：N 次 pthread_create/join。 */
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

static void *work(void *p) {
  (void)p;
  return (void *)1;
}

int main(int argc, char **argv) {
  long n = argc > 1 ? strtol(argv[1], NULL, 10) : 0;
  long acc = 0;
  for (long i = 0; i < n; i++) {
    pthread_t t;
    void *r = NULL;
    if (pthread_create(&t, NULL, work, NULL) != 0) return 1;
    if (pthread_join(t, &r) != 0) return 1;
    acc += (long)r;
  }
  printf("%ld\n", acc);
  return 0;
}
