(* 手写 OCaml 对照：与 scalar_idiv.vuna 同算法（非 2 幂常量除法 + 负数被除数）。 *)
let rec loop acc n =
  if n <= 0 then acc else loop (acc + ((n - 5000000) / 1000)) (n - 1)

let () = print_endline (string_of_int (loop 0 10000000))