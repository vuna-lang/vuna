(* 手写 OCaml 对照：与 trait_via_field.vuna 同算法。
   透明包装 `uid`：show / 比较 / 相等 / 哈希都委托给底层 Int（对应 deriving via field），
   集合用 Hashtbl.Make 按底层 Int 的 hash / eq 去重计数。 *)
type uid = Uid of int

let show (Uid n) = string_of_int n
let cmp (Uid a) (Uid b) = compare a b
let eq = ( = )

module UidTbl = Hashtbl.Make (struct
  type t = uid

  let equal = eq
  let hash (Uid n) = n
end)

let step prev u =
  String.length (show u)
  + (if cmp u prev < 0 then 1 else 0)
  + (if eq u prev then 1 else 0)

let () =
  let set = UidTbl.create 1024 in
  let rec loop j prev acc =
    if j <= 0 then (acc, UidTbl.length set)
    else
      let u = Uid (j - ((j / 23) * 23)) in
      UidTbl.replace set u ();
      loop (j - 1) u (acc + step prev u)
  in
  let acc, size = loop 20000 (Uid 0) 0 in
  print_endline (string_of_int (acc + size))