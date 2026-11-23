(* 手写 OCaml 对照：与 nat_bits.vuna 同算法（Nat 饱和算术 + 63-bit 位运算）。 *)
let rec loop acc n = if n <= 0 then acc else loop (acc + ((n - 1) * 3)) (n - 1)

let band a b = a land b
let bxor a b = a lxor b
let shl a n = a lsl n
let shr a n = a lsr n

let rec rotr x k =
  if k <= 0 then x else rotr (bxor (shr x 1) (shl (band x 1) 62)) (k - 1)

let () =
  let n = loop 0 800000 in
  let r = rotr 123456789 64 in
  print_endline (string_of_int (n + band r 65535))