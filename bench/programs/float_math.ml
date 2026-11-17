(* 手写 OCaml 对照：与 float_math.vuna 同算法（Float 算术 + sqrt / abs / 转换）。 *)
let rec loop acc n =
  if n <= 0 then acc
  else loop (acc +. (sqrt (abs_float (float_of_int n)) *. 0.25) -. 0.5) (n - 1)

let () = print_endline (string_of_int (int_of_float (loop 0.0 1000000)))