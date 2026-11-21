(* 手写 OCaml 对照：与 micro_apply.vuna 同算法（闭包调用 + 尾递归）。 *)
let f x = x + 1

let rec loop g n acc = if n <= 0 then acc else loop g (n - 1) (g acc)

let () = print_endline (string_of_int (loop f 5000000 0))
