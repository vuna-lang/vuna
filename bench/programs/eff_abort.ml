(* 手写 OCaml 对照：与 eff_abort.vuna 同算法（每轮 abort，cleanup 恰好一次）。 *)
exception Boom

let counter = ref 0

let bump () = incr counter

let abort_once k =
  (try Fun.protect ~finally:bump (fun () -> raise Boom) with Boom -> ());
  k

let rec loop n = if n = 0 then 0 else (ignore (abort_once n); loop (n - 1))

let () =
  ignore (loop 2000);
  print_endline (string_of_int !counter)