(* 手写 OCaml 对照：与 hashmap_collide.vuna 同算法（单桶 assoc list，键退化成它的 id）。
   所有键哈希相同，插入 / 查找 / 删除都是桶内线性扫描；.ml 的键就是 record 的 id 字段。 *)
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

let rec insert_all k t =
  if k <= 0 then t else insert_all (k - 1) (insert k k t)

let rec lookup_sum k t acc =
  if k <= 0 then acc
  else
    match lookup k t with
    | None -> lookup_sum (k - 1) t acc
    | Some v -> lookup_sum (k - 1) t ((acc * 31) + v)

let rec remove_half k t =
  if k <= 0 then t else remove_half (k - 1) (remove (k * 2) t)

let () =
  let n = 1500 in
  let t0 = insert_all n [] in
  let t1 = remove_half (n / 2) t0 in
  print_endline (string_of_int (lookup_sum n t0 0 + List.length t1))