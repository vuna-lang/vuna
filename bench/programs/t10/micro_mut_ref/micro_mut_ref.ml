(* 手写 OCaml 对照：与 micro_mut_ref.vuna 同算法（ref 原地读-改-写 N 次）。 *)
let n = 200000

let () =
  let cell = ref 0 in
  for _ = 1 to n do
    let v = !cell in
    cell := v + 1
  done;
  print_int !cell