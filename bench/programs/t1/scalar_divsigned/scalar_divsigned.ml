(* 手写 OCaml 对照：与 scalar_divsigned.vuna 同算法（被除数可能为负的常量除法）。 *)
let rec loop sum acc n =
  if n <= 0 then sum else loop (sum + acc) ((acc - n) / 8) (n - 1)

let () = print_endline (string_of_int (loop 0 0 10000000))