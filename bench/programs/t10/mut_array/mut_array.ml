(* 手写 OCaml 对照：与 mut_array.vuna 同算法（填下标值，再逐槽读出、加一写回并累加旧值）。 *)
let n = 2000

let () =
  let a = Array.init n (fun i -> i) in
  let acc = ref 0 in
  for i = 0 to n - 1 do
    let v = a.(i) in
    a.(i) <- v + 1;
    acc := !acc + v
  done;
  print_int !acc