(* 手写 OCaml 对照：与 trait_hkt.vuna 同算法。
   Maybe 管线用 Option.map / Option.bind，List 管线用 List.map / List.concat_map（= bind），
   两条同形：fmap (2x+1) → liftA2 (+) 自组合 → bind (+3)。 *)
let maybe_val = function None -> 0 | Some v -> v
let list_val xs = List.fold_left ( + ) 0 xs

let pipe_m m =
  let a = Option.map (fun x -> (x * 2) + 1) m in
  let b = Option.map (fun x -> x + x) a in
  Option.bind b (fun x -> Some (x + 3))

let pipe_l m =
  let a = List.map (fun x -> (x * 2) + 1) m in
  let b = List.concat_map (fun x -> List.map (fun y -> x + y) a) a in
  List.concat_map (fun x -> [ x + 3 ]) b

let rec loop j am al =
  if j <= 0 then (am, al)
  else loop (j - 1) (am + maybe_val (pipe_m (Some j))) (al + list_val (pipe_l [ j; j + 1 ]))

let () =
  let am, al = loop 200000 0 0 in
  print_endline (string_of_int (am + al))