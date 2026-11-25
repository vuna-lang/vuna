(* 手写 OCaml 对照：与 list_hof.vuna 同算法（map / filter / zip / concat_map / fold_right，
   输入是尾构造的 2000 元素列表；fold_right 非尾递归，深度与列表长度同阶）。 *)
let is_even x = x mod 2 = 0

let rec range_tail i k acc =
  if k <= 0 then List.rev acc else range_tail (i + 1) (k - 1) (i :: acc)

let rec zip xs ys =
  match (xs, ys) with
  | x :: xs', y :: ys' -> (x, y) :: zip xs' ys'
  | _ -> []

let () =
  let n = 2000 in
  let xs = range_tail 0 n [] in
  let ys = List.map (fun x -> (x * 3) - 7) xs in
  let zs = List.filter is_even xs in
  let pairs = zip ys zs in
  let expanded = List.concat_map (fun x -> [ x; x + 1 ]) zs in
  let pair_sum = List.fold_left (fun a (p, q) -> a + p + q) 0 pairs in
  let folded = List.fold_right (fun x a -> x - a) expanded 0 in
  print_endline (string_of_int (pair_sum + folded + List.length pairs))