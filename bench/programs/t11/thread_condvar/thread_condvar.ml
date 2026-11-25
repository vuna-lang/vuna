(* 手写 OCaml 对照：Mutex + notEmpty/notFull 两个 Condition 交接 4 槽环。 *)
let cap = 4
let n = 50000
let mu = Mutex.create ()
let not_empty = Condition.create ()
let not_full = Condition.create ()
let ring = Array.make cap 0
let count = ref 0
let head = ref 0
let tail = ref 0

(* 持锁等待谓词；燃料耗尽即失败退出，不会无限阻塞。 *)
let rec await cv ready fuel =
  if fuel <= 0 then failwith "condvar fuel exhausted"
  else if ready () then ()
  else begin
    Condition.wait cv mu;
    await cv ready (fuel - 1)
  end

let producer () =
  for i = 1 to n do
    Mutex.lock mu;
    await not_full (fun () -> !count < cap) 4096;
    ring.(!tail) <- i;
    tail := (!tail + 1) mod cap;
    incr count;
    Condition.signal not_empty;
    Mutex.unlock mu
  done

let consumer () =
  let sum = ref 0 in
  for _ = 1 to n do
    Mutex.lock mu;
    await not_empty (fun () -> !count > 0) 4096;
    sum := !sum + ring.(!head);
    head := (!head + 1) mod cap;
    decr count;
    Condition.signal not_full;
    Mutex.unlock mu
  done;
  !sum

let () =
  let p = Domain.spawn producer in
  let c = Domain.spawn consumer in
  Domain.join p;
  print_int (Domain.join c);
  print_newline ()