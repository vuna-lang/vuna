(* 手写 OCaml 对照：与 eff_install.vuna 同算法（每轮安装一次 handler）。 *)
type _ Effect.t += P : int -> int Effect.t

let once () =
  Effect.Deep.match_with
    (fun () -> Effect.perform (P 1))
    ()
    {
      retc = (fun x -> x);
      exnc = raise;
      effc =
        (fun (type a) (e : a Effect.t) ->
          match e with
          | P v ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  Effect.Deep.continue k v)
          | _ -> None);
    }

let rec loop n = if n = 0 then 0 else once () + loop (n - 1)

let () = print_endline (string_of_int (loop 10000))