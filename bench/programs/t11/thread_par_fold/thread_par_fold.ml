(* 手写 OCaml 对照：4 个 Domain 各对连续一块做同样的三角和累加（foldMap 的分块形状）。 *)
let n = 2048
let jobs = 4

let rec tri acc k = if k <= 0 then acc else tri (acc + k) (k - 1)

let chunk job =
  let lo = n * job / jobs in
  let hi = n * (job + 1) / jobs in
  let acc = ref 0 in
  for i = lo to hi - 1 do
    acc := !acc + tri 0 (3000 + (i mod 64))
  done;
  !acc

let () =
  let ts = List.init jobs (fun j -> Domain.spawn (fun () -> chunk j)) in
  let total = List.fold_left (fun a d -> a + Domain.join d) 0 ts in
  print_int total;
  print_newline ()