/* 手写 C 对照：与 queue.vuna 同算法（FIFO：push / pop / size）。
   .vuna 用 Base.Container.Queue（双列表），.ml 用标准库可变 Queue；按 .ml 的口径这里手写
   环形缓冲队列（2 倍扩容），只依赖 libc。push 值 k*3-7、FIFO 弹出顺序、累加与 size 口径
   都与 .vuna 一致（vuna 的队列是持久结构，主程序加的是弹出前原始队列的 size = N）。
   规模 N 从 argv[1] 读入。 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

/* vuna Int 是 63 位二进制补码（与 OCaml int 相同），先按 2^64 运算再符号扩展到 63 位。 */
static int64_t wrap63(uint64_t u) {
  const uint64_t mask = (UINT64_C(1) << 63) - 1;
  u &= mask;
  if (u & (UINT64_C(1) << 62)) u |= ~mask;
  return (int64_t)u;
}

static void *xmalloc(size_t n) {
  void *p = malloc(n);
  if (!p) {
    fprintf(stderr, "out of memory\n");
    exit(1);
  }
  return p;
}

typedef struct {
  int64_t *buf;
  size_t cap;
  size_t head;
  size_t len;
} Queue;

static void queue_init(Queue *q) {
  q->cap = 1024;
  q->buf = xmalloc(q->cap * sizeof(int64_t));
  q->head = 0;
  q->len = 0;
}

static void queue_push(Queue *q, int64_t v) {
  if (q->len == q->cap) {
    size_t nc = q->cap * 2;
    int64_t *nb = xmalloc(nc * sizeof(int64_t));
    for (size_t i = 0; i < q->len; i++) nb[i] = q->buf[(q->head + i) % q->cap];
    free(q->buf);
    q->buf = nb;
    q->cap = nc;
    q->head = 0;
  }
  q->buf[(q->head + q->len) % q->cap] = v;
  q->len++;
}

static int queue_pop(Queue *q, int64_t *out) {
  if (q->len == 0) return 0;
  *out = q->buf[q->head];
  q->head = (q->head + 1) % q->cap;
  q->len--;
  return 1;
}

int main(int argc, char **argv) {
  if (argc < 2) {
    fprintf(stderr, "usage: %s N\n", argv[0]);
    return 2;
  }
  int64_t n = strtoll(argv[1], NULL, 10);
  if (n < 0) n = 0;

  Queue q;
  queue_init(&q);

  for (int64_t k = n; k > 0; k--) queue_push(&q, k * 3 - 7);

  int64_t acc = 0;
  for (int64_t k = 0; k < n; k++) {
    int64_t x;
    if (!queue_pop(&q, &x)) break;
    acc = wrap63((uint64_t)acc * 31u + (uint64_t)x);
  }

  /* vuna 侧 Queue 不可变，弹完后原队列仍有 N 个元素。 */
  int64_t out = wrap63((uint64_t)acc + (uint64_t)n);
  printf("%" PRId64 "\n", out);

  free(q.buf);
  return 0;
}