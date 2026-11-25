(* 手写 OCaml 对照：4 个 Domain 各 Atomic.fetch_and_add 200000 次。 *)
let per = 50000
let cell = Atomic.make 0

let work () =
  for _ = 1 to per do
    ignore (Atomic.fetch_and_add cell 1)
  done

let () =
  let ts = List.init 4 (fun _ -> Domain.spawn work) in
  List.iter Domain.join ts;
  print_int (Atomic.get cell);
  print_newline ()
