(* 手写 OCaml 对照：与 trait_num.vuna 同算法。
   普通函数模拟 Mod 的 Num / FromInt（+ - * / 与字面量都走实例方法），
   Show 只用来取展示长度。 *)
let show v = Printf.sprintf "Mod %d" v

let step x =
  let y = (x * 5) + 3 in
  y - ((y / 1048576) * 1048576)

let () =
  let rec run n x = if n <= 0 then x else run (n - 1) (step x) in
  let r = run 300000 1 in
  print_endline (string_of_int (r + String.length (show r)))