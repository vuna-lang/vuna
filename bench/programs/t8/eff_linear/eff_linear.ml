(* 手写 OCaml 对照：与 eff_linear.vuna 同算法（每轮构造一次性闭包并恰好应用一次）。 *)
let rec step n acc =
  if n = 0 then acc
  else
    let k = fun x -> 1 + x in
    step (n - 1) (acc + k 1)

let () = print_endline (string_of_int (step 10000 0))