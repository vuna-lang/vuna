/* T0 纯地板的 C 对照：静态、无 libc，与 native 产物同为裸 syscall。
 * 用 `cc_flags=-nostdlib` 编译；不读 argv。 */
static const char msg[] = "42\n";

void _start(void) {
  __asm__ volatile("syscall"
                   :
                   : "a"(1L), "D"(1L), "S"(msg), "d"(sizeof msg - 1)
                   : "rcx", "r11", "memory");
  __asm__ volatile("syscall" : : "a"(231L), "D"(0L) : "rcx", "r11", "memory");
  __builtin_unreachable();
}