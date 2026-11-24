(* 手写 OCaml 对照：与 tco_nat.vuna 同算法（Nat 结构递归的尾调用）。 *)
let rec loop acc n = if n <= 0 then acc else loop (acc + (n - 1)) (n - 1)

let () = print_endline (string_of_int (loop 0 10000000))