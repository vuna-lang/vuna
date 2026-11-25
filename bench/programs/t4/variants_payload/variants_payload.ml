(* 手写 OCaml 对照：带 payload 的递归 variant 与同形求值。 *)
type expr =
  | Lit of int
  | Add of expr * expr
  | Mul of expr * expr
  | Max of expr * expr
  | Min of expr * expr

let bound x = x - (x / 1_000_003 * 1_000_003)

let rec build d seed =
  if d <= 0 then Lit (bound seed)
  else
    Add
      ( build (d - 1) ((seed * 2) + 1),
        Max
          ( Mul (build (d - 1) ((seed * 3) + 1), Lit (seed + 7)),
            Min (Lit seed, Lit 7) ) )

let rec eval e =
  match e with
  | Lit n -> n
  | Add (a, b) -> bound (eval a + eval b)
  | Mul (a, b) -> bound (bound (eval a) * bound (eval b))
  | Max (a, b) -> if eval a > eval b then eval a else eval b
  | Min (a, b) -> if eval a < eval b then eval a else eval b

let () = print_endline (string_of_int (eval (build 16 1)))