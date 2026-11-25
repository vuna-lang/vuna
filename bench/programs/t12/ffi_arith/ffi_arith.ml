(* 与 ffi_arith.vuna 同算法：每轮经 extern 调一次 C 侧 vuna_add，输出 N(N+1)。 *)
external vuna_add : int -> int -> int = "vuna_add"

let rec loop n acc = if n = 0 then acc else loop (n - 1) (acc + vuna_add n n)

let () = print_int (loop 1000000 0)