(* 手写 OCaml 对照：与 scalar_ilp.vuna 同算法（4 个独立累加器 + 循环计数）。 *)
let rec loop a b c d n =
  if n <= 0 then a + b + c + d
  else loop (a + n * 3) (b lxor n) (c + n / 8) ((d * 5 + 7) land 65535) (n - 1)

let () = print_endline (string_of_int (loop 0 0 0 0 10000000))