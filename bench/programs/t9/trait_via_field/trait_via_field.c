/* trait_via_field 的 C 对照：与 trait_via_field.vuna 同算法。
 *
 * 算法：N 轮（基准形状 N = 20000）由 j 造包装值 uid = j % 23，累加单值稳定贡献
 * （show 长度 + 一次严格小于 + 一次相等），并插入集合；输出累加值 + 集合大小。
 *
 * C 侧表示要点：
 *   - `alias record Uid { uid : Int }` 是透明包装：Show / Eq / Ord / Hashable 都委托给
 *     底层 Int，所以这里就是 int64 值（对应 .ml 的 `Uid of int`）；"show" 即十进制长度。
 *   - 集合是 1024 桶链；哈希只决定挂哪条链，不参与输出。
 *   - Int 是 64 位有符号 → int64_t；N 从 argv 读，避免 GCC 折成闭式。
 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

static int64_t show_len(int64_t v) {
  char buf[32];
  return (int64_t)snprintf(buf, sizeof buf, "%" PRId64, v);
}

typedef struct Node {
  int64_t v;
  struct Node *next;
} Node;

static Node *buckets[1024];
static int64_t set_size;

static void set_insert(int64_t v) {
  size_t b = (size_t)(v % 1024);
  for (Node *p = buckets[b]; p != NULL; p = p->next) {
    if (p->v == v) {
      return;
    }
  }
  Node *n = malloc(sizeof *n);
  if (n == NULL) {
    perror("malloc");
    exit(1);
  }
  n->v = v;
  n->next = buckets[b];
  buckets[b] = n;
  set_size++;
}

static int64_t step(int64_t prev, int64_t v) {
  return show_len(v) + (v < prev ? 1 : 0) + (v == prev ? 1 : 0);
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  int64_t prev = 0;
  int64_t acc = 0;
  for (int64_t j = n; j > 0; j--) {
    int64_t u = j - (j / 23) * 23;
    acc += step(prev, u);
    set_insert(u);
    prev = u;
  }
  printf("%" PRId64 "\n", acc + set_size);
  return 0;
}