(* 手写 OCaml 对照：与 float_math.vuna 同算法（sqrt / abs / 除法 / 比较）。 *)
let rec loop acc n =
  if n <= 0 then acc
  else
    let step = (sqrt (abs_float (float_of_int n)) *. 0.25) -. 0.5 in
    loop (acc +. (step /. 3.0) +. (if acc < 50000000.0 then 1.0 else 0.0)) (n - 1)

let () = print_endline (string_of_int (int_of_float (loop 0.0 1000000)))