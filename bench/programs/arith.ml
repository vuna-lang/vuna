(* 手写 OCaml 对照：与 arith.vuna 同算法（尾递归 + 63 位整数算术）。 *)
let rec loop acc n =
  if n <= 0 then acc else loop (acc + n * 3 - n / 2) (n - 1)

let () = print_endline (string_of_int (loop 0 3000000))