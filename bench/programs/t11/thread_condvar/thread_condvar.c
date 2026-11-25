/* thread_condvar 的 C 对照：Mutex + notEmpty/notFull 两个 Condvar 交接 4 槽环。 */
#define _POSIX_C_SOURCE 200809L
#include <errno.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define CAP 4

static pthread_mutex_t mu = PTHREAD_MUTEX_INITIALIZER;
static pthread_cond_t not_empty = PTHREAD_COND_INITIALIZER;
static pthread_cond_t not_full = PTHREAD_COND_INITIALIZER;
static long ring[CAP];
static long count = 0;
static long head = 0;
static long tail = 0;
static long n = 0;

/* 等一次通知；10 秒内没有新通知就判定死锁并退出（失败出口）。 */
static void wait_on(pthread_cond_t *c) {
  struct timespec ts;
  clock_gettime(CLOCK_REALTIME, &ts);
  ts.tv_sec += 10;
  if (pthread_cond_timedwait(c, &mu, &ts) == ETIMEDOUT) {
    fprintf(stderr, "condvar timeout\n");
    exit(2);
  }
}

static void *producer(void *p) {
  (void)p;
  for (long i = 1; i <= n; i++) {
    pthread_mutex_lock(&mu);
    while (count == CAP) wait_on(&not_full);
    ring[tail] = i;
    tail = (tail + 1) % CAP;
    count++;
    pthread_cond_signal(&not_empty);
    pthread_mutex_unlock(&mu);
  }
  return NULL;
}

static void *consumer(void *p) {
  (void)p;
  long sum = 0;
  for (long i = 0; i < n; i++) {
    pthread_mutex_lock(&mu);
    while (count == 0) wait_on(&not_empty);
    sum += ring[head];
    head = (head + 1) % CAP;
    count--;
    pthread_cond_signal(&not_full);
    pthread_mutex_unlock(&mu);
  }
  return (void *)sum;
}

int main(int argc, char **argv) {
  n = argc > 1 ? strtol(argv[1], NULL, 10) : 0;
  pthread_t p, c;
  if (pthread_create(&p, NULL, producer, NULL) != 0) return 1;
  if (pthread_create(&c, NULL, consumer, NULL) != 0) return 1;
  if (pthread_join(p, NULL) != 0) return 1;
  void *r = NULL;
  if (pthread_join(c, &r) != 0) return 1;
  printf("%ld\n", (long)r);
  return 0;
}