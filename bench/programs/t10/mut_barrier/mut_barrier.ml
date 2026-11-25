(* 手写 OCaml 对照：与 mut_barrier.vuna 同算法——512 槽的 Cell 数组在 major 堆里常驻，
   每轮分配一个新 record 写进槽里再读回；每 64 轮累加一次读到的字段。 *)
type cell = { a : int; b : int }
let cap = 512
let n = 2000

let () =
  let arr = Array.init cap (fun _ -> { a = 0; b = 0 }) in
  let acc = ref 0 in
  for i = 0 to n - 1 do
    let slot = i mod cap in
    Array.set arr slot { a = i; b = i + 1 };
    let c = arr.(slot) in
    if i mod 64 = 0 then acc := !acc + c.a
  done;
  acc := !acc + arr.(0).a + arr.(cap - 1).b;
  print_int !acc