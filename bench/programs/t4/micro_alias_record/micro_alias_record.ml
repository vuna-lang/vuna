(* 手写 OCaml 对照：alias / 自动去装箱的单字段 record 都退化成 int。 *)
type user_id = int
type wrap = int

let apply_sel f u = f u

let rec go k u w =
  if k <= 0 then apply_sel (fun x -> x) u + w
  else go (k - 1) (u + 1) (w + 2)

let () = print_endline (string_of_int (go 1_000_000 0 0))