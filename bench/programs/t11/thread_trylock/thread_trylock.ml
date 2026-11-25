(* 手写 OCaml 对照：4 个 Domain 用 Mutex.try_lock 争用，失败时 cpu_relax 重试。 *)
let per = 20000
let m = Mutex.create ()
let counter = ref 0

let rec bump n =
  if n > 0 then
    if Mutex.try_lock m then begin
      incr counter;
      Mutex.unlock m;
      bump (n - 1)
    end
    else begin
      Domain.cpu_relax ();
      bump n
    end

let () =
  let ts = List.init 4 (fun _ -> Domain.spawn (fun () -> bump per)) in
  List.iter Domain.join ts;
  print_int !counter;
  print_newline ()