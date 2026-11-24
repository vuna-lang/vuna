(* 手写 OCaml 对照：与 micro_tco.vuna 同算法（最小自递归尾调用）。 *)
let rec loop acc n = if n <= 0 then acc else loop (acc + n) (n - 1)

let () = print_endline (string_of_int (loop 0 20000000))