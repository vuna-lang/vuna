(* 手写 OCaml 对照：与 scalar_cmp.vuna 同算法（六种比较关系物化成 0/1 后累加）。 *)
let rec loop acc lt le eq ne gt ge n =
  if n <= 0 then acc
  else
    loop
      (acc + (if lt then 1 else 0) + (if le then 1 else 0) + (if eq then 1 else 0)
     + (if ne then 1 else 0) + (if gt then 1 else 0) + (if ge then 1 else 0))
      (n < 500000) (n <= 1000000) (n = 1500000) (n <> 1500000) (n > 1200000)
      (n >= 1800000) (n - 1)

let () = print_endline (string_of_int (loop 0 true true true true true true 2000000))