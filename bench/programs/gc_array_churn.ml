(* 手写 OCaml 对照：与 gc_array_churn.vuna 同算法（Array.of_list + copy/set）。 *)
let rec churn n =
  if n <= 0 then 0
  else
    let a = Array.of_list (List.init 1000 (fun i -> i)) in
    let b = Array.copy a in
    Array.set b 0 n;
    Array.length b + Array.get b 0 + churn (n - 1)

let () = print_endline (string_of_int (churn 8000))