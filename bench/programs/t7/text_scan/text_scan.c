/* text_scan 的 C 对照：与 text_scan.vuna 同算法。
 *
 * 算法：先把 "0123456789" 重复 N 次拼成一个串（N 是基准里的 16000，
 * 即 160000 字节），然后从头逐字节扫描整串：
 *   acc = acc * 31 + 字节；acc = acc - acc / 1000003 * 1000003
 * 扫描步数与串长相同（引擎里的 fuel 只是终止性保险）。
 *
 * C 侧表示要点：
 *   - `repeat` 走 `strConcatMany`：native 运行时先求和、按总长分配一次、再逐段
 *     memcpy。这里同样两遍，不做几何增长。
 *   - `strAt` 在界内返回 0..255 的字节值，越界才返回 -1；扫描范围恒为界内，
 *     所以取 (unsigned char)。
 *   - 取余用 `next - next / 1000003 * 1000003` 原样复现：C 与 OCaml 的有符号
 *     除法都向零截断，负数时余数同为负。
 *   - Int 是 64 位有符号 → int64_t；N 从 argv 读，避免被折叠。
 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BLOCK "0123456789"
#define BLOCK_LEN 10

static void keep(void *p) { __asm__ volatile("" : : "r"(p) : "memory"); }

/* `strConcatMany [BLOCK; ...; BLOCK]`：先求和，再一次性分配逐段拷贝。 */
static char *build_text(int64_t blocks, int64_t *out_len) {
  int64_t total = 0;
  for (int64_t i = 0; i < blocks; i++) {
    total += BLOCK_LEN;
  }
  char *s = malloc((size_t)total + 1);
  if (s == NULL) {
    perror("malloc");
    exit(1);
  }
  int64_t off = 0;
  for (int64_t i = 0; i < blocks; i++) {
    memcpy(s + off, BLOCK, BLOCK_LEN);
    off += BLOCK_LEN;
  }
  s[total] = '\0';
  keep(s);
  *out_len = total;
  return s;
}

static int64_t scan(const char *s, int64_t i, int64_t n, int64_t acc) {
  while (i < n) {
    int64_t next = acc * 31 + (int64_t)(unsigned char)s[i];
    acc = next - next / 1000003 * 1000003;
    i++;
  }
  return acc;
}

int main(int argc, char **argv) {
  int64_t blocks = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  int64_t len = 0;
  char *s = build_text(blocks, &len);
  printf("%" PRId64 "\n", scan(s, 0, len, 0));
  free(s);
  return 0;
}