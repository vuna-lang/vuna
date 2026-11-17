(* 手写 OCaml 对照：与 gc_low_live.vuna 同算法（每轮建列表与字符串后丢弃）。 *)
let rec count xs = match xs with [] -> 0 | _ :: rest -> 1 + count rest

let rec churn n =
  if n <= 0 then 0
  else
    let xs = List.init 1000 (fun i -> i) in
    let s = String.concat "" (List.init 100 (fun _ -> "0123456789")) in
    count xs + String.length s + churn (n - 1)

let () = print_endline (string_of_int (churn 10000))