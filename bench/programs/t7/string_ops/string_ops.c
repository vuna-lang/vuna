/* string_ops 的 C 对照：与 string_ops.vuna 同算法。
 *
 * 算法（基准形状 N = 3000）：
 *   s   = strConcatMany (map (\_ => "0123456789") (range 0 N))     30000 字节
 *   rep = repeat (N * 2 / 3) "xy"                                   4000 字节
 *   sub = substring 100 (N / 3 * 20) s                             20000 字节
 *   输出 = strLength s + strLength rep + strLength sub              54000
 * N = 3000 时三段分别对应 .vuna 里的 3000 段 / repeat 2000 次 / 20000 字节；N
 * 缩放三段，保证规模减半时耗时近似减半。
 *
 * C 侧表示要点：
 *   - `strConcatMany` 在 native 运行时是两遍：先遍历求和，再按总长分配一次、逐段
 *     memcpy。这里同样实现两遍，不做几何增长，也不复用缓冲。
 *   - `strSubstring start len s` 把 start 夹到 [0, n]、len 夹到 [0, n - start]，
 *     再按夹取后的长度分配并拷贝；这里原样复现。
 *   - keep() 的 asm 屏障让分配/拷贝真正发生：三段结果都只取长度，GCC 否则可以把
 *     整个缓冲区连同 memcpy 一起消掉。
 *   - Int 是 64 位有符号 → int64_t；N 从 argv 读，避免被折叠成常量。
 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define PART "0123456789"
#define PART_LEN 10
#define REPEAT_UNIT "xy"
#define REPEAT_UNIT_LEN 2

static void keep(void *p) { __asm__ volatile("" : : "r"(p) : "memory"); }

/* `strConcatMany [unit; ...; unit]`：先求和，再一次性分配逐段拷贝。 */
static char *concat_many(const char *unit, int64_t unit_len, int64_t count,
                         int64_t *out_len) {
  int64_t total = 0;
  for (int64_t i = 0; i < count; i++) {
    total += unit_len;
  }
  char *buf = malloc((size_t)total + 1);
  if (buf == NULL) {
    perror("malloc");
    exit(1);
  }
  int64_t off = 0;
  for (int64_t i = 0; i < count; i++) {
    memcpy(buf + off, unit, (size_t)unit_len);
    off += unit_len;
  }
  buf[total] = '\0';
  keep(buf);
  *out_len = total;
  return buf;
}

/* `strSubstring start len s`：start / len 分别夹取后分配拷贝。 */
static char *substring(const char *s, int64_t s_len, int64_t start, int64_t len,
                       int64_t *out_len) {
  if (start < 0) {
    start = 0;
  } else if (start > s_len) {
    start = s_len;
  }
  if (len < 0) {
    len = 0;
  } else if (len > s_len - start) {
    len = s_len - start;
  }
  char *buf = malloc((size_t)len + 1);
  if (buf == NULL) {
    perror("malloc");
    exit(1);
  }
  memcpy(buf, s + start, (size_t)len);
  buf[len] = '\0';
  keep(buf);
  *out_len = len;
  return buf;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  int64_t s_len = 0;
  int64_t rep_len = 0;
  int64_t sub_len = 0;

  char *s = concat_many(PART, PART_LEN, n, &s_len);
  char *rep = concat_many(REPEAT_UNIT, REPEAT_UNIT_LEN, n * 2 / 3, &rep_len);
  char *sub = substring(s, s_len, 100, n / 3 * 20, &sub_len);

  printf("%" PRId64 "\n", s_len + rep_len + sub_len);
  free(s);
  free(rep);
  free(sub);
  return 0;
}