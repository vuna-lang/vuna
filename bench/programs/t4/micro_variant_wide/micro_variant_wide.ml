(* 手写 OCaml 对照：16 个 nullary 构造子 + next/code。 *)
type tag =
  | T0 | T1 | T2 | T3 | T4 | T5 | T6 | T7
  | T8 | T9 | T10 | T11 | T12 | T13 | T14 | T15

let next = function
  | T0 -> T1 | T1 -> T2 | T2 -> T3 | T3 -> T4
  | T4 -> T5 | T5 -> T6 | T6 -> T7 | T7 -> T8
  | T8 -> T9 | T9 -> T10 | T10 -> T11 | T11 -> T12
  | T12 -> T13 | T13 -> T14 | T14 -> T15 | T15 -> T0

let code = function
  | T0 -> 0 | T1 -> 1 | T2 -> 2 | T3 -> 3
  | T4 -> 4 | T5 -> 5 | T6 -> 6 | T7 -> 7
  | T8 -> 8 | T9 -> 9 | T10 -> 10 | T11 -> 11
  | T12 -> 12 | T13 -> 13 | T14 -> 14 | T15 -> 15

let rec go k t acc =
  if k <= 0 then acc else go (k - 1) (next t) (acc + code t)

let () = print_endline (string_of_int (go 1_000_000 T0 0))