/* records 的 C 对照：与 records.vuna 同算法（record 构造 / 按 tag 分派 / 记录更新）。
 * C 侧表示：Op 变体 = enum（Add / Mul 按 tag 分派），Point = 两个 Int 字段的值结构体，
 * step 每次按值返回新 record；bound 是 Int 取模 1000 的写法（全程非负）。
 * 规模 N 从 argv 读，避免 GCC 把常量循环折成闭式。 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef enum { Add, Mul } Op;

typedef struct {
  int64_t x;
  int64_t y;
} Point;

static int64_t apply(Op op, int64_t a, int64_t b) {
  switch (op) {
  case Add:
    return a + b;
  case Mul:
    return a * b;
  }
  return 0;
}

static int64_t bound(int64_t n) { return n - n / 1000 * 1000; }

static Point step(Op op, Point p) {
  Point q;
  q.x = bound(apply(op, p.x, p.y));
  q.y = bound(apply(op, p.y, p.x));
  return q;
}

static Point stepN(int64_t k, Point p) {
  while (k > 0) {
    p = step(k - k / 2 * 2 == 0 ? Add : Mul, p);
    k--;
  }
  return p;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  Point p = stepN(n, (Point){1, 2});
  printf("%ld\n", (long)(p.x + p.y));
  return 0;
}