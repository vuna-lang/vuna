/* trait_hasfield 的 C 对照：与 trait_hasfield.vuna 同算法。
 *
 * 算法：N 轮（基准形状 N = 20 万）构造两个不同 struct（都含 id 字段），
 * 通过同一份泛型读访问取 id 并累加：acc += u.id + it.id。
 *
 * C 侧表示要点：
 *   - vuna 的 `getId : HasField (Field "id") a Int => a -> Int` 在两个 record 上分别由
 *     自动生成的实例填充字典；C 没有字典，直接读 struct 的 id 字段（等价于实例体）。
 *   - 其余字段（rank / qty）只为让两个 record 形状不同，同样按 vuna 的除法赋值。
 *   - Int 是 64 位有符号 → int64_t；N 从 argv 读，避免 GCC 折成闭式。
 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct {
  int64_t id;
  int64_t rank;
} User;

typedef struct {
  int64_t id;
  int64_t qty;
} Item;

static int64_t get_id_user(User u) { return u.id; }
static int64_t get_id_item(Item i) { return i.id; }

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  int64_t acc = 0;
  for (int64_t j = n; j > 0; j--) {
    User u = {j, j / 3};
    Item it = {j * 2, j / 5};
    acc += get_id_user(u) + get_id_item(it);
  }
  printf("%" PRId64 "\n", acc);
  return 0;
}