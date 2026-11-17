(* 手写 OCaml 对照：与 records.vuna 同算法（variant + record 更新）。 *)
type op = Add | Mul

type point = { x : int; y : int }

let apply op a b = match op with Add -> a + b | Mul -> a * b

let bound n = n - ((n / 1000) * 1000)

let step op p = { x = bound (apply op p.x p.y); y = bound (apply op p.y p.x) }

let rec step_n k p =
  if k <= 0 then p
  else step_n (k - 1) (step (if k - k / 2 * 2 = 0 then Add else Mul) p)

let () =
  let p = step_n 800000 { x = 1; y = 2 } in
  print_endline (string_of_int (p.x + p.y))