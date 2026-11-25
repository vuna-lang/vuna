/* thread_nested 的 C 对照：4 个父线程各创建 4 个子线程并 join，再汇总。 */
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

#define KIDS 4

static long per = 0;

static void *child(void *p) {
  (void)p;
  long acc = 0;
  for (long i = 1; i <= per; i++) acc += i;
  return (void *)acc;
}

static void *worker(void *p) {
  (void)p;
  pthread_t ts[KIDS];
  long acc = 0;
  for (int i = 0; i < KIDS; i++)
    if (pthread_create(&ts[i], NULL, child, NULL) != 0) return (void *)0;
  for (int i = 0; i < KIDS; i++) {
    void *r = NULL;
    if (pthread_join(ts[i], &r) != 0) return (void *)0;
    acc += (long)r;
  }
  return (void *)acc;
}

int main(int argc, char **argv) {
  per = argc > 1 ? strtol(argv[1], NULL, 10) : 0;
  pthread_t ws[4];
  long total = 0;
  for (int i = 0; i < 4; i++)
    if (pthread_create(&ws[i], NULL, worker, NULL) != 0) return 1;
  for (int i = 0; i < 4; i++) {
    void *r = NULL;
    if (pthread_join(ws[i], &r) != 0) return 1;
    total += (long)r;
  }
  printf("%ld\n", total);
  return 0;
}