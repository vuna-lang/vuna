(* 手写 OCaml 对照：与 state_machine.vuna 同算法（9 状态线性分派 + 尾递归）。 *)
let rec step s acc n =
  if n <= 0 then acc
  else
    match s with
    | 0 -> step 1 (acc + 1) (n - 1)
    | 1 -> step 2 (acc + 2) (n - 1)
    | 2 -> step 3 (acc + 3) (n - 1)
    | 3 -> step 4 (acc + 5) (n - 1)
    | 4 -> step 5 (acc + 8) (n - 1)
    | 5 -> step 6 (acc + 13) (n - 1)
    | 6 -> step 7 (acc + 21) (n - 1)
    | 7 -> step 8 (acc + 34) (n - 1)
    | _ -> step (if acc > 1000000 then 0 else 1) (acc + 55) (n - 1)

let () = print_endline (string_of_int (step 0 0 5000000))