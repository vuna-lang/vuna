(* 手写 OCaml 对照：与 treeset.vuna 同操作（标准库 Set = 平衡树上限，Int 键）。 *)
module IntSet = Set.Make (Int)

let scramble i =
  let x = i * 7919 in
  x - (x / 100003 * 100003)

let rec insert_all k s =
  if k <= 0 then s else insert_all (k - 1) (IntSet.add (scramble k) s)

let rec remove_even k s =
  if k <= 0 then s else remove_even (k - 1) (IntSet.remove (scramble (k * 2)) s)

let rec hit_sum k s acc =
  if k <= 0 then acc
  else if IntSet.mem (scramble k) s then hit_sum (k - 1) s ((acc * 31) + k)
  else hit_sum (k - 1) s acc

let asc_sum s = IntSet.fold (fun x acc -> (acc * 31) + x) s 0

let () =
  let n = 10000 in
  let s0 = insert_all n IntSet.empty in
  let s1 = remove_even n s0 in
  print_endline
    (string_of_int (hit_sum n s1 0 + asc_sum s1 + IntSet.cardinal s1))