(* 手写 OCaml 对照：与 trait_derive.vuna 同算法。
   手写 show / 字典序 compare / 相等 / 哈希（对应 deriving 生成的四个实例），
   集合用 Hashtbl.Make 按手写 hash / eq 去重计数。 *)
type key = { a : int; b : int }

let show k = Printf.sprintf "(Key %d %d)" k.a k.b

let cmp x y = if x.a <> y.a then compare x.a y.a else compare x.b y.b
let eq x y = x.a = y.a && x.b = y.b
let hash k = (k.a * 31) + k.b

module KeyTbl = Hashtbl.Make (struct
  type t = key

  let equal = eq
  let hash = hash
end)

let key_of j =
  let g = j / 13 in
  { a = j - (g * 13); b = g - ((g / 17) * 17) }

let step prev k =
  String.length (show k)
  + (if cmp k prev < 0 then 1 else 0)
  + (if eq k prev then 1 else 0)

let () =
  let set = KeyTbl.create 1024 in
  let rec loop j prev acc =
    if j <= 0 then (acc, KeyTbl.length set)
    else
      let k = key_of j in
      KeyTbl.replace set k ();
      loop (j - 1) k (acc + step prev k)
  in
  let acc, size = loop 20000 { a = 0; b = 0 } 0 in
  print_endline (string_of_int (acc + size))