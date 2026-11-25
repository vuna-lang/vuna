(* 手写 OCaml 对照：4 个 Domain 各自做同一段纯累加。 *)
let per = 1500000

let rec sum acc n = if n <= 0 then acc else sum (acc + n) (n - 1)

let () =
  let ts = List.init 4 (fun _ -> Domain.spawn (fun () -> sum 0 per)) in
  let total = List.fold_left (fun a d -> a + Domain.join d) 0 ts in
  print_int total;
  print_newline ()
