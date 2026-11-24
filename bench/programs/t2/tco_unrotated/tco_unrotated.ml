(* 手写 OCaml 对照：与 tco_unrotated.vuna 同算法（不旋转的尾递归形状）。 *)
let rec step flag acc n =
  if n <= 0 then acc
  else if flag then step false (acc + n) (n - 1)
  else step true (acc - n) (n - 1)

let rec guard acc n =
  if n <= 0 then acc
  else if n > 2500000 && n land 1 == 0 then guard (acc + 1) (n - 1)
  else guard (acc + 2) (n - 1)

let () = print_endline (string_of_int (step true 0 5000000 + guard 0 5000000))