(* 手写 OCaml 对照：与 closure_pipeline.vuna 同算法（闭包表 fold + 尾递归）。
   一组部分应用闭包逐轮 fold，每次 op 是表内一次动态应用。 *)
let plus a b = a + b

let mul a b = a * b

let wrap x = x - (x / 1000 * 1000)

let apply_op op x = op x

let ops = [ plus 1; mul 2; wrap; plus 3 ]

let step x = List.fold_left (fun acc op -> apply_op op acc) x ops

let rec loop n acc = if n <= 0 then acc else loop (n - 1) (step acc)

let () = print_endline (string_of_int (loop 200000 0))
