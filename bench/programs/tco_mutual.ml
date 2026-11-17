(* 手写 OCaml 对照：与 tco_mutual.vuna 同算法（互递归尾调用）。 *)
let rec even n = if n <= 0 then true else odd (n - 1)
and odd n = if n <= 0 then false else even (n - 1)

let () = print_endline (string_of_int (if even 4000000 then 1 else 0))