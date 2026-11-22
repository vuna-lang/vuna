(* 手写 OCaml 对照：哈希基准用标准库 Hashtbl（手写上限）。
   vuna 侧是 base 的持久 HashMap（1024 桶），差距同时反映库与表示。 *)
let () =
  let h = Hashtbl.create 8192 in
  let ks = List.init 5000 string_of_int in
  List.iteri (fun i k -> Hashtbl.replace h k (i * 3)) ks;
  let total =
    List.fold_left
      (fun acc k -> acc + (try Hashtbl.find h k with Not_found -> 0))
      0 ks
  in
  print_endline (string_of_int (total + Hashtbl.length h))