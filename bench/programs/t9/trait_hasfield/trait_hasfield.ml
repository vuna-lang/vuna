(* 手写 OCaml 对照：与 trait_hasfield.vuna 同算法。
   两个 record 都有 id : Int；泛型读访问在 OCaml 里就是直接投影（零字典）。 *)
type user = { id : int; rank : int }
type item = { id : int; qty : int }

let get_id_user (u : user) = u.id
let get_id_item (i : item) = i.id

let () =
  let rec loop j acc =
    if j <= 0 then acc
    else
      let u = { id = j; rank = j / 3 } in
      let it = { id = j * 2; qty = j / 5 } in
      loop (j - 1) (acc + get_id_user u + get_id_item it)
  in
  print_endline (string_of_int (loop 200000 0))