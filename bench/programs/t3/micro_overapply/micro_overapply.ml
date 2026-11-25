(* 手写 OCaml 对照：每轮一次过度应用（柯里化闭包一次给足两层实参，首参捕获进闭包）。 *)
let mk k = fun x -> fun y -> x + y + k

let apply2 f x = f x x

let rec loop n acc =
  if n <= 0 then acc
  else loop (n - 1) (acc + apply2 (mk (n - n / 1000 * 1000)) (n - n / 1000 * 1000))

let () = print_endline (string_of_int (loop 5000000 0))
