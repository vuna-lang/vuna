(* 手写 OCaml 对照：与 priority_queue.vuna 同操作（标准库 Set 当有序多重集）。 *)
module IntSet = Set.Make (Int)

let scramble i =
  let x = i * 7919 in
  x - (x / 100003 * 100003)

let rec push_all k s = if k <= 0 then s else push_all (k - 1) (IntSet.add (scramble k) s)

let rec pop_sum k s acc =
  if k <= 0 then acc
  else if IntSet.is_empty s then acc
  else
    let x = IntSet.min_elt s in
    pop_sum (k - 1) (IntSet.remove x s) ((acc * 31) + x)

let () =
  let s = push_all 20000 IntSet.empty in
  print_endline (string_of_int (pop_sum 20000 s 0 + IntSet.cardinal s))