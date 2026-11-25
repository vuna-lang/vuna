(* 手写 OCaml 对照：与 gc_large_obj.vuna 同算法（每轮 Array.make 8192 槽位后丢弃）。 *)
let rec loop i acc =
  if i <= 0 then acc
  else
    let a = Array.make 8192 i in
    loop (i - 1) (acc + Array.get a 4096 + Array.length a)

let () = print_endline (string_of_int (loop 2000 0))