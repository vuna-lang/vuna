(* 手写 OCaml 对照：与 micro_concat.vuna 同算法（短串拼接 + 尾递归）。 *)
let rec loop s n acc = if n <= 0 then acc else loop s (n - 1) (acc + String.length (s ^ "0123456789"))

let () = print_endline (string_of_int (loop "abcdefghij" 1000000 0))
