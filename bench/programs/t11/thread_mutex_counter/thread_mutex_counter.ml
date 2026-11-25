(* 手写 OCaml 对照：4 个 Domain，锁保护下自增。 *)
let per = 50000
let m = Mutex.create ()
let counter = ref 0

let work () =
  for _ = 1 to per do
    Mutex.lock m;
    incr counter;
    Mutex.unlock m
  done

let () =
  let ts = List.init 4 (fun _ -> Domain.spawn work) in
  List.iter Domain.join ts;
  print_int !counter;
  print_newline ()
