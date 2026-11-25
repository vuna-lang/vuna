(* 手写 OCaml 对照：4 个 Domain 各用 Atomic.compare_and_set 自增 50000 次。 *)
let per = 50000
let cell = Atomic.make 0

let rec bump n =
  if n > 0 then
    let old = Atomic.get cell in
    if Atomic.compare_and_set cell old (old + 1) then bump (n - 1) else bump n

let () =
  let ts = List.init 4 (fun _ -> Domain.spawn (fun () -> bump per)) in
  List.iter Domain.join ts;
  print_int (Atomic.get cell);
  print_newline ()