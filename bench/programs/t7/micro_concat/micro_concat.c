/* micro_concat 的 C 对照：与 micro_concat.vuna 同算法。
 *
 * 算法：s 固定为 "abcdefghij"，每轮累加 `strLength (s ++ "0123456789")`（20），
 * 尾递归 N 轮（基准形状 N = 100 万）。
 *
 * C 侧表示要点：
 *   - vuna 的 `++` 每次按两段精确总长新建字符串再拷两段（native 运行时的
 *     str_concat：一次 str_alloc + 两段 rep movsb），不复用旧缓冲；这里同样每轮
 *     malloc / 两次 memcpy / free，保持“每次拼接都重新分配”的代价模型。
 *   - keep() 的 asm 屏障阻止 GCC 发现缓冲区内容不逃逸后把 malloc+memcpy+free
 *     整组消除（否则测到的就只剩加法）。
 *   - Int 是 64 位有符号 → int64_t；N 从 argv 读，避免被折叠成闭式。
 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SUFFIX "0123456789"

static void keep(void *p) { __asm__ volatile("" : : "r"(p) : "memory"); }

static int64_t loop(const char *s, int64_t n, int64_t acc) {
  const size_t slen = strlen(s);
  const size_t tlen = strlen(SUFFIX);
  const size_t total = slen + tlen;

  while (n > 0) {
    char *buf = malloc(total);
    if (buf == NULL) {
      perror("malloc");
      exit(1);
    }
    memcpy(buf, s, slen);
    memcpy(buf + slen, SUFFIX, tlen);
    keep(buf);
    acc += (int64_t)total;
    free(buf);
    n--;
  }
  return acc;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  printf("%" PRId64 "\n", loop("abcdefghij", n, 0));
  return 0;
}