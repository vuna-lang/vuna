/* 手写 C 对照：与 graph_bfs.vuna 同算法（BFS：邻接数组 + 访问标记 + 环形队列）。
   .vuna 用 Base.Container.Queue 存 (节点, 距离)、HashSet 去重；.ml 用标准库 Queue + Hashtbl。
   这里按 .ml 的口径用扁平邻接表（每节点 2 条边：(7i+3) mod N、(13i+5) mod N）、字节访问标记
   与 FIFO 数组队列，只依赖 libc。输出 = 所有可达节点的距离和 + 节点数，与 .vuna 一致。
   规模 N 从 argv[1] 读入。 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

static void *xmalloc(size_t n) {
  void *p = malloc(n);
  if (!p) {
    fprintf(stderr, "out of memory\n");
    exit(1);
  }
  return p;
}

int main(int argc, char **argv) {
  if (argc < 2) {
    fprintf(stderr, "usage: %s N\n", argv[0]);
    return 2;
  }
  int64_t n = strtoll(argv[1], NULL, 10);
  if (n <= 0) {
    fprintf(stderr, "N must be positive\n");
    return 2;
  }

  /* 扁平邻接表：节点 v 的两条边在 adj[2v]、adj[2v+1]。 */
  int64_t *adj = xmalloc((size_t)(2 * n) * sizeof *adj);
  for (int64_t i = 0; i < n; i += 1) {
    adj[2 * i] = (i * 7 + 3) % n;
    adj[2 * i + 1] = (i * 13 + 5) % n;
  }

  unsigned char *seen = xmalloc((size_t)n);
  for (int64_t i = 0; i < n; i += 1) seen[i] = 0;

  /* 队列里每一项是 (节点, 距离)。 */
  int64_t *qnode = xmalloc((size_t)n * sizeof *qnode);
  int64_t *qdist = xmalloc((size_t)n * sizeof *qdist);
  int64_t head = 0;
  int64_t tail = 0;

  seen[0] = 1;
  qnode[tail] = 0;
  qdist[tail] = 0;
  tail += 1;

  int64_t hits = 1;
  int64_t dist_sum = 0;

  while (head < tail) {
    int64_t v = qnode[head];
    int64_t d = qdist[head];
    head += 1;
    for (int e = 0; e < 2; e += 1) {
      int64_t u = adj[2 * v + e];
      if (!seen[u]) {
        seen[u] = 1;
        hits += 1;
        dist_sum += d + 1;
        qnode[tail] = u;
        qdist[tail] = d + 1;
        tail += 1;
      }
    }
  }

  printf("%" PRId64 "\n", dist_sum + hits);

  free(qdist);
  free(qnode);
  free(seen);
  free(adj);
  return 0;
}