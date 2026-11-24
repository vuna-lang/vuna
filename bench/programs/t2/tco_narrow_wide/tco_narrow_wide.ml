(* 手写 OCaml 对照：与 tco_narrow_wide.vuna 同算法（窄调宽 / 宽调窄的互递归）。 *)
let rec narrow acc n =
  if n <= 0 then acc else wide acc n 1 2 3 4 5 6 7 8

and wide acc n a b c d e f g h =
  if n <= 0 then acc
  else narrow (acc + a + b + c + d + e + f + g + h) (n - 1)

let () = print_endline (string_of_int (narrow 0 1000000))