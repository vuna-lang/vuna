/* trait_derive 的 C 对照：与 trait_derive.vuna 同算法。
 *
 * 算法：N 轮（基准形状 N = 20000）由 j 造键 (a = j % 13, b = (j / 13) % 17)，
 * 累加单键稳定贡献（show 长度 + 一次字典序严格小于 + 一次相等），并把键插入集合；
 * 输出累加值 + 集合大小（去重后的不同键数）。
 *
 * C 侧表示要点：
 *   - 手写 Show（"(Key <a> <b>)"）/ 字典序比较 / 相等 / 哈希，对应 deriving 生成的实例；
 *     展示长度用 snprintf 的长度，与 vuna 侧 `strLength (show k)` 逐字节一致。
 *   - 集合是 1024 桶链（与 base HashMap 的桶数同档），哈希只决定挂哪条链，不参与输出。
 *   - Int 是 64 位有符号 → int64_t；N 从 argv 读，避免 GCC 折成闭式。
 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct {
  int64_t a;
  int64_t b;
} Key;

static int64_t show_len(Key k) {
  char buf[64];
  return (int64_t)snprintf(buf, sizeof buf, "(Key %" PRId64 " %" PRId64 ")", k.a, k.b);
}

static int key_lt(Key x, Key y) {
  if (x.a != y.a) {
    return x.a < y.a;
  }
  return x.b < y.b;
}

static int key_eq(Key x, Key y) { return x.a == y.a && x.b == y.b; }

static size_t key_hash(Key k) { return (size_t)((k.a * 31 + k.b) % 1024); }

typedef struct Node {
  Key k;
  struct Node *next;
} Node;

static Node *buckets[1024];
static int64_t set_size;

static void set_insert(Key k) {
  size_t b = key_hash(k);
  for (Node *p = buckets[b]; p != NULL; p = p->next) {
    if (key_eq(p->k, k)) {
      return;
    }
  }
  Node *n = malloc(sizeof *n);
  if (n == NULL) {
    perror("malloc");
    exit(1);
  }
  n->k = k;
  n->next = buckets[b];
  buckets[b] = n;
  set_size++;
}

static Key key_of(int64_t j) {
  int64_t g = j / 13;
  Key k = {j - g * 13, g - (g / 17) * 17};
  return k;
}

static int64_t step(Key prev, Key k) {
  return show_len(k) + (key_lt(k, prev) ? 1 : 0) + (key_eq(k, prev) ? 1 : 0);
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  Key prev = {0, 0};
  int64_t acc = 0;
  for (int64_t j = n; j > 0; j--) {
    Key k = key_of(j);
    acc += step(prev, k);
    set_insert(k);
    prev = k;
  }
  printf("%" PRId64 "\n", acc + set_size);
  return 0;
}