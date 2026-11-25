(* 与 host_env.vuna 同算法：每轮读一次 HOME 并丢弃，输出循环次数。 *)
let rec loop n acc =
  if n = 0 then acc
  else
    let _ = Sys.getenv_opt "HOME" in
    loop (n - 1) (acc + 1)

let () = print_int (loop 200000 0)