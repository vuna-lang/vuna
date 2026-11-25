(* 手写 OCaml 对照：闭包存在 record 字段里，每轮一次字段投影后饱和应用 + 尾递归。 *)
type step = { run : int -> int }

let mk_step k = { run = (fun x -> x + k) }

let apply_step s x = s.run x

let rec loop s n acc =
  if n <= 0 then acc else loop s (n - 1) (apply_step s acc)

let () = print_endline (string_of_int (loop (mk_step 3) 5000000 0))
