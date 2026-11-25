(* 手写 OCaml 对照：运行期在两个闭包之间选择后饱和应用（每次迭代一次动态应用）。 *)
let inc x = x + 1

let add2 x = x + 2

let pick k = if k = 0 then inc else add2

let apply1 g x = g x

let rec loop n acc =
  if n <= 0 then acc
  else loop (n - 1) (acc + apply1 (pick (n - (n / 2) * 2)) (n - (n / 2) * 2))

let () = print_endline (string_of_int (loop 5000000 0))
