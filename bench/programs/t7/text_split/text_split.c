/* text_split 的 C 对照：与 text_split.vuna 同算法。
 *
 * 算法（基准形状 N = 2000 行）：
 *   文本 = 每行 "  w<i>,alpha  " 后接 '\n'（i = 0..N-1），拼成一段；
 *   按 '\n' 切行（末尾换行产生一个空尾行）；每行 trim 空格后按 ',' 切词，
 *   保留以 'w' 开头或以 "ha" 结尾的词（即各行的 w<i> 与 alpha）；
 *   按字典序排序保留词，用 ':' 连接；输出 = 词数 + 连接串长度 + 各行补 '\n' 后的总长。
 *
 * C 侧表示要点：
 *   - 切行 / 切词的扫描与 trim 都是手写字节循环（对应 vuna 的 split / trim）。
 *   - 排序用 qsort + strcmp：ASCII 字节序与 Ord String 的字典序一致。
 *   - unlines 的长度 = 各行原始长度之和 + 行数（空尾行也补一个 '\n'）。
 *   - Int 是 64 位有符号 → int64_t；N 从 argv 读，避免 GCC 折成闭式。
 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static int cmp_word(const void *a, const void *b) {
  return strcmp(*(const char *const *)a, *(const char *const *)b);
}

static int is_space(char c) { return c == ' ' || c == '\t' || c == '\r'; }

static int keep_word(const char *s, size_t len) {
  if (len > 0 && s[0] == 'w') {
    return 1;
  }
  return len >= 2 && s[len - 2] == 'h' && s[len - 1] == 'a';
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  size_t cap = (size_t)n * 32 + 1;
  char *text = malloc(cap);
  if (text == NULL) {
    perror("malloc");
    return 1;
  }
  size_t off = 0;
  for (int64_t i = 0; i < n; i++) {
    off += (size_t)snprintf(text + off, cap - off, "  w%" PRId64 ",alpha  \n", i);
  }
  text[off] = '\0';

  const char **words = malloc((size_t)n * 2 * sizeof *words);
  if (words == NULL) {
    perror("malloc");
    return 1;
  }
  size_t nwords = 0;
  int64_t unlines_len = 0;
  int64_t nlines = 0;

  size_t start = 0;
  while (start <= off) {
    size_t end = start;
    while (end < off && text[end] != '\n') {
      end++;
    }
    unlines_len += (int64_t)(end - start) + 1;
    nlines++;

    size_t lo = start;
    size_t hi = end;
    while (lo < hi && is_space(text[lo])) {
      lo++;
    }
    while (hi > lo && is_space(text[hi - 1])) {
      hi--;
    }
    size_t wstart = lo;
    for (size_t k = lo; k <= hi; k++) {
      if (k == hi || text[k] == ',') {
        if (keep_word(text + wstart, k - wstart)) {
          size_t len = k - wstart;
          char *w = malloc(len + 1);
          if (w == NULL) {
            perror("malloc");
            return 1;
          }
          memcpy(w, text + wstart, len);
          w[len] = '\0';
          words[nwords++] = w;
        }
        wstart = k + 1;
      }
    }
    start = end + 1;
  }

  qsort(words, nwords, sizeof *words, cmp_word);
  int64_t joined_len = nwords > 0 ? (int64_t)nwords - 1 : 0;
  for (size_t k = 0; k < nwords; k++) {
    joined_len += (int64_t)strlen(words[k]);
    free((void *)words[k]);
  }
  printf("%" PRId64 "\n", (int64_t)nwords + joined_len + unlines_len);
  free((void *)words);
  free(text);
  (void)nlines;
  return 0;
}