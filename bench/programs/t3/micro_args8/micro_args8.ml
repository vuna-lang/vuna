(* 手写 OCaml 对照：与 micro_args8.vuna 同算法（每轮一次 8 参非尾直调 + 尾递归）。 *)
let mix8 a b c d e f g h =
  (a * 1) + (b * 2) + (c * 3) + (d * 4) + (e * 5) + (f * 6) + (g * 7) + (h * 8)

let rec loop n acc =
  if n <= 0 then acc else loop (n - 1) (acc + mix8 n 1 2 3 4 5 6 7)

let () = print_endline (string_of_int (loop 5000000 0))
