(* 手写 OCaml 对照：与 micro_interp.vuna 同算法（插值展开成 ^ + string_of_int）。 *)
let rec loop n acc =
  if n <= 0 then acc
  else loop (n - 1) (acc + String.length ("v=" ^ string_of_int n ^ ";w=" ^ string_of_int (n * 3) ^ ";"))

let () = print_endline (string_of_int (loop 300000 0))