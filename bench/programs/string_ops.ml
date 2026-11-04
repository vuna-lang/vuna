(* 手写 OCaml 对照：与 string_ops.vuna 同算法（String.concat 批拼 + String.sub）。 *)
let () =
  let s = String.concat "" (List.init 3000 (fun _ -> "0123456789")) in
  let rep = String.concat "" (List.init 2000 (fun _ -> "xy")) in
  print_endline
    (string_of_int
       (String.length s + String.length rep + String.length (String.sub s 100 20000)))