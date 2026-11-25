/* mut_buffer 的 C 对照：与 mut_buffer.vuna 同算法——realloc 按倍数扩容的字节缓冲，
 * memcpy 追加 8 字节分片 N 次，取快照、清零、再把快照追加回去，输出各阶段字节数。
 * N 从 argv 读。
 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static const char chunk[] = "abcdefgh";

static void grow(char **buf, size_t *cap, size_t need) {
  if (need <= *cap) return;
  size_t next = *cap == 0 ? 16 : *cap;
  while (next < need) next *= 2;
  char *grown = realloc(*buf, next);
  if (!grown) {
    free(*buf);
    exit(1);
  }
  *buf = grown;
  *cap = next;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  if (n < 0) return 1;
  size_t cap = 0;
  size_t len = 0;
  size_t clen = sizeof chunk - 1;
  char *buf = NULL;
  for (int64_t i = 0; i < n; i += 1) {
    grow(&buf, &cap, len + clen);
    memcpy(buf + len, chunk, clen);
    len += clen;
  }
  size_t n1 = len;
  char *snap = malloc(len + 1);
  if (!snap) {
    free(buf);
    return 1;
  }
  memcpy(snap, buf, len);
  snap[len] = '\0';
  len = 0;
  size_t n2 = len;
  grow(&buf, &cap, len + n1);
  memcpy(buf + len, snap, n1);
  len += n1;
  size_t n3 = len;
  int64_t tail = n1 > 0
                     ? (int64_t)(unsigned char)snap[0] +
                           (int64_t)(unsigned char)snap[n1 - 1]
                     : 0;
  printf("%" PRId64, (int64_t)(n1 + n2 + n3) + tail + (int64_t)n1);
  free(snap);
  free(buf);
  return 0;
}