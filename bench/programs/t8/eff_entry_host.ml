(* 与 eff_entry_host.vuna 同算法：每轮一次空写 + 计数。
   vuna 侧 `consolePrint ""` 每轮还会做一次零字节 write（syscall），`output_string ""`
   不产生系统调用，所以比值里含这部分常数；W5 的前后对比不受影响。 *)
let rec loop n acc =
  if n = 0 then acc
  else (
    output_string stdout "";
    loop (n - 1) (acc + 1))

let () = print_endline (string_of_int (loop 5000 0))