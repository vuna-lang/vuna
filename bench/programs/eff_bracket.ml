(* 手写 OCaml 对照：与 eff_bracket.vuna 同算法（acquire/use/release 直接内联）。 *)
let use () = 1
let release () = 1

let rec loop n acc =
  if n = 0 then acc
  else
    let x = use () in
    let _ = release () in
    loop (n - 1) (acc + x)

let () = print_endline (string_of_int (loop 10000 0))