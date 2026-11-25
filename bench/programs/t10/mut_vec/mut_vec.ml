(* 手写 OCaml 对照：与 mut_vec.vuna 同算法（Array.init 按位置生成，第一遍读出加十写回
   并累加旧值，第二遍读出写回后的值）。 *)
let n = 1000

let () =
  let a = Array.init n (fun i -> i) in
  let sum1 = ref 0 in
  for i = 0 to n - 1 do
    let x = a.(i) in
    a.(i) <- x + 10;
    sum1 := !sum1 + x
  done;
  let sum2 = ref 0 in
  for i = 0 to n - 1 do
    sum2 := !sum2 + a.(i)
  done;
  print_int (!sum1 + !sum2)