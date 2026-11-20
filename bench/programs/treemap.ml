(* 手写 OCaml 对照：与 treemap.vuna 同输入、同操作（标准库 Map = 平衡树上限）。 *)
module IntMap = Map.Make (Int)

let scramble i =
  let x = i * 7919 in
  x - (x / 100003 * 100003)

let rec build k t = if k <= 0 then t else build (k - 1) (IntMap.add (scramble k) k t)

let rec lookup_sum k t acc =
  if k <= 0 then acc
  else
    match IntMap.find_opt (scramble k) t with
    | None -> lookup_sum (k - 1) t acc
    | Some v -> lookup_sum (k - 1) t ((acc * 31) + v)

let asc_sum t = IntMap.fold (fun k _ acc -> (acc * 31) + k) t 0

let () =
  let t = build 20000 IntMap.empty in
  print_endline
    (string_of_int (lookup_sum 20000 t 0 + asc_sum t + IntMap.cardinal t))