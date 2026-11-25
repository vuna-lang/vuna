/* fs_roundtrip 的 C 对照：与 fs_roundtrip.vuna 同语义；路径取 TMPDIR（空则 /tmp），
 * 每轮 open/write/close、open/read/close、unlink，累加读回字节数。 */
#include <fcntl.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

static const char content[] = "vuna-bench-fs-roundtrip";
static const char suffix[] = "/vuna-bench-fs-roundtrip.tmp";

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

static int64_t one_round(const char *path) {
  char buf[64];
  int64_t got = 0;
  int fd = open(path, O_WRONLY | O_CREAT | O_TRUNC, 0600);
  if (fd < 0) return -1;
  if (write(fd, content, sizeof content - 1) != (ssize_t)(sizeof content - 1)) {
    close(fd);
    return -1;
  }
  close(fd);
  fd = open(path, O_RDONLY);
  if (fd < 0) return -1;
  for (;;) {
    ssize_t n = read(fd, buf, sizeof buf);
    if (n <= 0) break;
    got += n;
  }
  close(fd);
  if (unlink(path) != 0) return -1;
  return got;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  char path[4096];
  int64_t acc = 0;
  if (make_path(path, sizeof path) != 0) return 1;
  for (int64_t k = 0; k < n; k++) {
    int64_t got = one_round(path);
    if (got < 0) return 1;
    acc += got;
  }
  printf("%" PRId64, acc); /* golden 无尾换行 */
  return 0;
}