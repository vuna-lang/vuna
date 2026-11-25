(* 手写 OCaml 对照：与 micro_closure8.vuna 同算法（8 参捕获闭包经形参传入后饱和应用）。 *)
let mk8 k = fun a b c d e f g h -> k + a + b + c + d + e + f + g + h

let rec loop g n acc =
  if n <= 0 then acc
  else loop g (n - 1) (acc + g 1 2 3 4 5 6 7 8)

let () = print_endline (string_of_int (loop (mk8 3) 500000 0))
