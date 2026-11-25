(* 手写 OCaml 对照：与 eff_exn.vuna 同算法（try/with + Fun.protect）：
   正常与抛出路径都走 protect，release 恰好一次；每轮另外 +1。 *)
exception Boom

let cleanups = ref 0

let release () = incr cleanups

let ok_once () = Fun.protect ~finally:release (fun () -> 1)

let throw_once () =
  try Fun.protect ~finally:release (fun () -> raise Boom) with Boom -> 0

let rec loop n acc =
  if n = 0 then acc
  else
    let v = if n - (n / 2) * 2 = 0 then throw_once () else ok_once () in
    loop (n - 1) (acc + v + 1)

let () =
  let total = loop 4000 0 in
  print_endline (string_of_int ((total * 100000) + !cleanups))