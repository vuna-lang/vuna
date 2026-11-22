(* 手写 OCaml 对照：与 gc_pressure.vuna 同算法（每轮分配 string_of_int 与 16 字节串）。 *)
let () =
  let base = "0123456789abcdef" in
  let rec churn n =
    if n <= 0 then 0
    else
      String.length (string_of_int n)
      + String.length (String.init 16 (fun i -> base.[i]))
      + churn (n - 1)
  in
  print_endline (string_of_int (churn 200000))