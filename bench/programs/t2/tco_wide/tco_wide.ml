(* 手写 OCaml 对照：与 tco_wide.vuna 同算法（9 参数尾递归）。 *)
let rec step a b c d e f g h n =
  if n <= 0 then a + b + c + d + e + f + g + h
  else step (a + 1) (b + 2) (c + 3) (d + 4) (e + 5) (f + 6) (g + 7) (h + n) (n - 1)

let () = print_endline (string_of_int (step 0 0 0 0 0 0 0 0 5000000))