(* 手写 OCaml 对照：与 list_recursion.vuna 同算法（range/sum/foldl/append/reverse）。 *)
let rec range i n = if i >= n then [] else i :: range (i + 1) n

let rec sum xs = match xs with [] -> 0 | x :: rest -> x + sum rest

let rec foldl f acc xs =
  match xs with [] -> acc | x :: rest -> foldl f (f acc x) rest

let rec append xs ys =
  match xs with [] -> ys | x :: rest -> x :: append rest ys

let () =
  let xs = range 0 100000 in
  print_endline
    (string_of_int
       (sum xs
       + foldl (fun acc x -> acc + x) 0 (append xs (List.rev xs))
       + List.length xs))