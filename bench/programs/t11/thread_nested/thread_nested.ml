(* 手写 OCaml 对照：4 个父 Domain 各派生 4 个子 Domain 并 join，再汇总。 *)
let per = 250000
let kids = 4

let rec sum acc n = if n <= 0 then acc else sum (acc + n) (n - 1)

let child () = sum 0 per

let worker () =
  let ts = List.init kids (fun _ -> Domain.spawn child) in
  List.fold_left (fun a d -> a + Domain.join d) 0 ts

let () =
  let ws = List.init 4 (fun _ -> Domain.spawn worker) in
  let total = List.fold_left (fun a d -> a + Domain.join d) 0 ws in
  print_int total;
  print_newline ()