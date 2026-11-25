/* text_base64 的 C 对照：与 text_base64.vuna 同算法。
 *
 * 算法：N 轮（基准形状 N = 20000）把 3 个确定性字节（i、i*7、i*13 各自按 256 取余）
 * 编码成 4 个 Base64 字符（RFC 4648 标准字母表），再严格解码回 3 字节，累加字节
 * 乘法校验和（acc * 31 + b）与编码长度（恒为 4）。
 *
 * C 侧表示要点：
 *   - 编解码是手写的字节循环；输入恒为 3 字节整数倍，末端不产生 padding 分支。
 *   - 解码结果这里是原样重算的 3 字节；校验和与 vuna 解码后的字节序列一致。
 *   - Int 是 64 位有符号 → int64_t；N 从 argv 读，避免 GCC 折成闭式。
 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

static const char ALPHA[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

static void encode3(const unsigned char *in, char *out) {
  out[0] = ALPHA[in[0] >> 2];
  out[1] = ALPHA[((in[0] & 3) << 4) | (in[1] >> 4)];
  out[2] = ALPHA[((in[1] & 15) << 2) | (in[2] >> 6)];
  out[3] = ALPHA[in[2] & 63];
}

static int digit(char c) {
  if (c >= 'A' && c <= 'Z') {
    return c - 'A';
  }
  if (c >= 'a' && c <= 'z') {
    return c - 'a' + 26;
  }
  if (c >= '0' && c <= '9') {
    return c - '0' + 52;
  }
  return c == '+' ? 62 : 63;
}

static void decode4(const char *in, unsigned char *out) {
  int a = digit(in[0]);
  int b = digit(in[1]);
  int c = digit(in[2]);
  int d = digit(in[3]);
  out[0] = (unsigned char)((a << 2) | (b >> 4));
  out[1] = (unsigned char)(((b & 15) << 4) | (c >> 2));
  out[2] = (unsigned char)(((c & 3) << 6) | d);
}

static int64_t step(int64_t i) {
  unsigned char raw[3] = {(unsigned char)(i % 256), (unsigned char)((i * 7) % 256),
                          (unsigned char)((i * 13) % 256)};
  char enc[5];
  unsigned char dec[3];
  encode3(raw, enc);
  enc[4] = '\0';
  decode4(enc, dec);
  int64_t acc = 0;
  for (int k = 0; k < 3; k++) {
    acc = acc * 31 + (int64_t)dec[k];
  }
  return acc + 4;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  int64_t acc = 0;
  for (int64_t j = n; j > 0; j--) {
    acc += step(j);
  }
  printf("%" PRId64 "\n", acc);
  return 0;
}