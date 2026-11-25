(* 手写 OCaml 对照：单构造子 variant，每轮分配一个新块。 *)
type handle = Handle of int

let rec go k (Handle h) =
  if k <= 0 then h else go (k - 1) (Handle (h + 1))

let () = print_endline (string_of_int (go 500_000 (Handle 0)))