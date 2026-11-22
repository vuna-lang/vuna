(* 手写 OCaml 对照：与 array.vuna 同算法（Array.of_list / Array.copy+set / Array.get）。 *)
let rec build i k = if k <= 0 then [] else i :: build (i + 1) (k - 1)

let rec sumGet a i k acc =
  if k <= 0 then acc else sumGet a (i + 1) (k - 1) (acc + a.(i))

let () =
  let xs = build 0 200000 in
  let a = Array.of_list xs in
  let b = Array.copy a in
  Array.set b 0 7;
  print_endline
    (string_of_int (sumGet b 0 (Array.length b) 0 + Array.length a))