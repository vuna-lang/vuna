(* 手写 OCaml 对照：每轮由两参函数生成一个部分应用闭包再饱和应用（每次迭代一次
 * 闭包分配 + 一次应用）。 *)
let add a b = a + b

let apply1 g x = g x

let rec loop n acc =
  if n <= 0 then acc
  else loop (n - 1) (apply1 (add (n - (n / 1000) * 1000)) acc)

let () = print_endline (string_of_int (loop 5000000 0))
