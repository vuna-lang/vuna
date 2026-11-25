/* fs_cursor 的 C 对照：与 fs_cursor.vuna 同语义；路径取 TMPDIR（空则 /tmp），
 * 写 64 KiB 确定内容后按 4 KiB 块读 N 遍，累加字节和。 */
#include <fcntl.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define CHUNK 4096
#define TOTAL 65536

static const char alphabet[] = "0123456789abcdef";
static const char suffix[] = "/vuna-bench-fs-cursor.tmp";

static int make_path(char *out, size_t cap) {
  const char *tmp = getenv("TMPDIR");
  size_t tl;
  if (tmp == NULL || tmp[0] == '\0') tmp = "/tmp";
  tl = strlen(tmp);
  if (tl + sizeof suffix > cap) return -1;
  memcpy(out, tmp, tl);
  memcpy(out + tl, suffix, sizeof suffix);
  return 0;
}

static int write_content(const char *path) {
  char buf[TOTAL];
  size_t off = 0;
  int fd;
  for (int i = 0; i < TOTAL; i++) buf[i] = alphabet[i % 16];
  fd = open(path, O_WRONLY | O_CREAT | O_TRUNC, 0600);
  if (fd < 0) return -1;
  while (off < (size_t)TOTAL) {
    ssize_t n = write(fd, buf + off, (size_t)TOTAL - off);
    if (n <= 0) {
      close(fd);
      return -1;
    }
    off += (size_t)n;
  }
  close(fd);
  return 0;
}

static int64_t read_pass(const char *path) {
  char buf[CHUNK];
  int64_t sum = 0;
  int fd = open(path, O_RDONLY);
  if (fd < 0) return -1;
  for (;;) {
    ssize_t n = read(fd, buf, CHUNK);
    if (n <= 0) break;
    for (ssize_t i = 0; i < n; i++) sum += (unsigned char)buf[i];
  }
  close(fd);
  return sum;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  char path[4096];
  int64_t sum = 0;
  if (make_path(path, sizeof path) != 0) return 1;
  if (write_content(path) != 0) return 1;
  for (int64_t k = 0; k < n; k++) {
    int64_t got = read_pass(path);
    if (got < 0) return 1;
    sum += got;
  }
  if (unlink(path) != 0) return 1;
  printf("%" PRId64, sum); /* golden 无尾换行 */
  return 0;
}