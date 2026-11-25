(* 手写 OCaml 对照：与 eff_named.vuna 同算法（两个命名实例 = 两个显式参数）。 *)
let rec loop n left right acc =
  if n = 0 then acc else loop (n - 1) left right (acc + (left * 10) + right)

let () = print_endline (string_of_int (loop 20000 3 4 0))