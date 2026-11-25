(* 手写 OCaml 对照：与 mut_dyn.vuna 同算法（Dynarray.add_last N 个值，再逐项读出、
   加一写回并累加新值，最后 clear）。 *)
let n = 2000

let () =
  let xs = Dynarray.create () in
  for i = 0 to n - 1 do
    Dynarray.add_last xs i
  done;
  let sum = ref 0 in
  for i = 0 to n - 1 do
    let v = Dynarray.get xs i in
    Dynarray.set xs i (v + 1);
    sum := !sum + v + 1
  done;
  let n1 = Dynarray.length xs in
  Dynarray.clear xs;
  let m = Dynarray.length xs in
  print_int (!sum + n1 + m)