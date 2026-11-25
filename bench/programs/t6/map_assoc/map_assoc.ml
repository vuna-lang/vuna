(* 手写 OCaml 对照：与 map_assoc.vuna 同算法（assoc list：覆盖保留原位置、新键追加到末尾）。 *)
let scramble i =
  let x = i * 7919 in
  x - (x / 100003 * 100003)

let rec insert key v xs =
  match xs with
  | [] -> [ (key, v) ]
  | (k, _) :: rest when k = key -> (key, v) :: rest
  | kv :: rest -> kv :: insert key v rest

let rec lookup key xs =
  match xs with
  | [] -> None
  | (k, v) :: rest -> if k = key then Some v else lookup key rest

let rec remove key xs =
  match xs with
  | [] -> []
  | (k, _) :: rest when k = key -> rest
  | kv :: rest -> kv :: remove key rest

let rec insert_all k m =
  if k <= 0 then m else insert_all (k - 1) (insert (scramble k) k m)

let rec lookup_sum k m acc =
  if k <= 0 then acc
  else
    match lookup (scramble k) m with
    | None -> lookup_sum (k - 1) m acc
    | Some v -> lookup_sum (k - 1) m ((acc * 31) + v)

let rec remove_half k m =
  if k <= 0 then m else remove_half (k - 1) (remove (scramble (k * 2)) m)

let () =
  let n = 800 in
  let m0 = insert_all n [] in
  let m1 = remove_half (n / 2) m0 in
  print_endline (string_of_int (lookup_sum n m0 0 + List.length m1))