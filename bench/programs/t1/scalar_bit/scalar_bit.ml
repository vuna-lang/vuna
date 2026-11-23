(* 手写 OCaml 对照：与 scalar_bit.vuna 同算法（位或 / 按位取反 / 立即数异或）。 *)
let rec loop acc inv orv x n =
  if n <= 0 then acc
  else loop (acc + inv) (lnot orv) (x lor n) (x lxor 12345) (n - 1)

let () = print_endline (string_of_int (loop 0 0 0 1 20000000))