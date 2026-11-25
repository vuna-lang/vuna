(* 与 host_clock.vuna 同算法：每轮读一次宿主时钟并丢弃，输出循环次数。
   Sys.time 是 OCaml 标准库时钟（不解锁 Unix 库），覆盖「每轮一次宿主时钟读」。 *)
let rec loop n acc =
  if n = 0 then acc
  else
    let _ = Sys.time () in
    loop (n - 1) (acc + 1)

let () = print_int (loop 200000 0)