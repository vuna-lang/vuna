(* 手写 OCaml 对照：与 stream.vuna 同算法（unit -> step 的惰性序列：from_list / map /
   filter / take / foldl；take 取前 500 个产出后再 foldl 一遍）。 *)
type 'a step = End | One of 'a * 'a stream | Skip of 'a stream

and 'a stream = unit -> 'a step

let is_even x = x mod 2 = 0

let rec range_tail i k acc =
  if k <= 0 then List.rev acc else range_tail (i + 1) (k - 1) (i :: acc)

let rec from_list xs () =
  match xs with [] -> End | x :: rest -> One (x, from_list rest)

let rec map f s () =
  match s () with
  | End -> End
  | One (x, t) -> One (f x, map f t)
  | Skip t -> Skip (map f t)

let rec filter p s () =
  match s () with
  | End -> End
  | One (x, t) -> if p x then One (x, filter p t) else Skip (filter p t)
  | Skip t -> Skip t

let rec take n s =
  if n <= 0 then []
  else
    match s () with
    | End -> []
    | One (x, t) -> x :: take (n - 1) t
    | Skip t -> take n t

let rec foldl f acc s =
  match s () with
  | End -> acc
  | One (x, t) -> foldl f (f acc x) t
  | Skip t -> foldl f acc t

let () =
  let n = 10000 in
  let s = filter is_even (map (fun x -> x * 3) (from_list (range_tail 0 n []))) in
  let total = foldl ( + ) 0 s in
  let prefix = take 500 s in
  print_endline (string_of_int (total + List.fold_left ( + ) 0 prefix + List.length prefix))