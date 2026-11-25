(* 手写 OCaml 对照：固定 8 元素数组。 *)
let v = [| 1; 2; 3; 4; 5; 6; 7; 8 |]

let read_all a = a.(0) + a.(1) + a.(2) + a.(3) + a.(4) + a.(5) + a.(6) + a.(7)

let rec go k acc = if k <= 0 then acc else go (k - 1) (acc + read_all v)

let () = print_endline (string_of_int (go 1_000_000 0))