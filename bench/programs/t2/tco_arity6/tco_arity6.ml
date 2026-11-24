(* 手写 OCaml 对照：与 tco_arity6.vuna 同算法（6 参自递归尾调用）。 *)
let rec step a b c d e n =
  if n <= 0 then a + b + c + d + e
  else step b c d e (a + n) (n - 1)

let () = print_endline (string_of_int (step 0 0 0 0 0 10000000))