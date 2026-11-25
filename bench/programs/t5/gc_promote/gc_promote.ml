(* 手写 OCaml 对照：与 gc_promote.vuna 同算法（保留最近 128 个 16 元素列表，存活集恒定）。 *)
let rec range_tail i k acc =
  if k <= 0 then List.rev acc else range_tail (i + 1) (k - 1) (i :: acc)

let sum_list xs = List.fold_left ( + ) 0 xs

let rec keep k xs =
  match xs with
  | [] -> []
  | y :: rest -> if k <= 0 then [] else y :: keep (k - 1) rest

let rec loop i acc held =
  if i <= 0 then acc + List.fold_left (fun a ys -> a + sum_list ys) 0 held
  else
    let xs = range_tail i 16 [] in
    let held2 = keep 128 (xs :: held) in
    loop (i - 1) (acc + sum_list xs) held2

let () = print_endline (string_of_int (loop 50000 0 []))