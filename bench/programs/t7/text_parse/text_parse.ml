(* 手写 OCaml 对照：与 text_parse.vuna 同算法（string_of_int / int_of_string 往返）。 *)
let rec loop i n acc =
  if i >= n then acc
  else
    let s = string_of_int ((i * 37) + 7) in
    let a = int_of_string s in
    let b = int_of_string s in
    let t = string_of_int a in
    loop (i + 1) n (acc + a + b + String.length t)

let () = print_endline (string_of_int (loop 0 200000 0))