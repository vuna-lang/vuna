(* 手写 OCaml 对照：与 gc_retain.vuna 同算法（保留 600 个千元素列表，再 churn 同样大小的
   临时列表后丢弃）。 *)
let rec count xs = match xs with [] -> 0 | _ :: rest -> 1 + count rest

let rec build n acc =
  if n <= 0 then acc else build (n - 1) (List.init 1000 (fun i -> i) :: acc)

let rec sum_all xs = match xs with [] -> 0 | ys :: rest -> count ys + sum_all rest

let rec churn n acc =
  if n <= 0 then acc else churn (n - 1) (acc + count (List.init 1000 (fun i -> i)))

let () =
  let live = build 600 [] in
  let n = churn 4000 0 in
  print_endline (string_of_int (sum_all live + n))
