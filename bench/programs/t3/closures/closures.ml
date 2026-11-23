(* 手写 OCaml 对照：与 closures.vuna 同算法（高阶函数 + 每次迭代新建闭包）。 *)
let twice f x = f (f x)

let dbl x = x * 2

let pipeline x = twice (fun y -> y + 3) (twice dbl x)

let () =
  print_endline
    (string_of_int
       (List.fold_left (fun acc x -> acc + pipeline x) 0 (List.init 200000 (fun i -> i))))