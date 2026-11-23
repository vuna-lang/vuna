(* 手写 OCaml 对照：与 queue.vuna 同操作（标准库可变 Queue，上限实现）。 *)
let rec push_all k q =
  if k <= 0 then q
  else (
    Queue.push (k * 3 - 7) q;
    push_all (k - 1) q)

let rec pop_sum k q acc =
  if k <= 0 then acc
  else if Queue.is_empty q then acc
  else
    let x = Queue.pop q in
    pop_sum (k - 1) q ((acc * 31) + x)

let () =
  let q = push_all 50000 (Queue.create ()) in
  print_endline (string_of_int (pop_sum 50000 q 0 + Queue.length q))