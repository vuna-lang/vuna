(* 手写 OCaml 对照：与 micro_capture.vuna 同算法（每轮构造捕获 k 的闭包后饱和调用）。 *)
let mk k = fun x -> x + k

let apply1 g x = g x

let rec loop n acc =
  if n <= 0 then acc
  else loop (n - 1) (apply1 (mk (n - (n / 1000) * 1000)) acc)

let () = print_endline (string_of_int (loop 5000000 0))
