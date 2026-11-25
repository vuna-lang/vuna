(* 手写 OCaml 对照：N 次 Domain.spawn/join。 *)
let rec go acc n =
  if n <= 0 then acc
  else
    let d = Domain.spawn (fun () -> 1) in
    go (acc + Domain.join d) (n - 1)

let () = print_endline (string_of_int (go 0 2000))
