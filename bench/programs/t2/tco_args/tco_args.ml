(* 手写 OCaml 对照：与 tco_args.vuna 同算法（交叉依赖实参的尾递归）。 *)
let rec step a b c n =
  if n <= 0 then (a * 1000000) + (b * 1000) + c
  else
    let s = a + b + c in
    step b c (s - ((s / 1000) * 1000)) (n - 1)

let () = print_endline (string_of_int (step 1 2 3 5000000))