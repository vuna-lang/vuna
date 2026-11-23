(* 手写 OCaml 对照：与 sorting.vuna 同算法（归并排序 + 非尾递归求和）。 *)
let rec split left right xs =
  match xs with
  | [] -> (left, right)
  | [ x ] -> (x :: left, right)
  | x :: y :: more -> split (x :: left) (y :: right) more

let rec merge a b =
  match a with
  | [] -> b
  | x :: xs -> (
      match b with
      | [] -> a
      | y :: ys -> if x <= y then x :: merge xs b else y :: merge a ys)

let rec msort fuel xs =
  if fuel <= 0 then xs
  else
    match xs with
    | [] -> []
    | [ _ ] -> xs
    | _ ->
        let left, right = split [] [] xs in
        merge (msort (fuel - 1) left) (msort (fuel - 1) right)

let rec sum xs =
  match xs with
  | [] -> 0
  | x :: rest -> x + sum rest

let rec desc i k = if k <= 0 then [] else i :: desc (i + 1) (k - 1)

let () = print_endline (string_of_int (sum (msort 40000 (desc 0 40000))))