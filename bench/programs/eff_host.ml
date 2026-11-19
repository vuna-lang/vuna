(* 手写 OCaml 对照：与 eff_host.vuna 同算法（内层 Console handler 的 opH 发 Tick）。 *)
type _ Effect.t += Print : string -> int Effect.t
type _ Effect.t += Tick : int -> int Effect.t

let rec loop n =
  if n = 0 then 0
  else
    let _ = Effect.perform (Print "x") in
    1 + loop (n - 1)

let () =
  let v =
    Effect.Deep.match_with
      (fun () ->
        Effect.Deep.match_with
          loop
          5000
          {
            retc = (fun x -> x);
            exnc = raise;
            effc =
              (fun (type a) (e : a Effect.t) ->
                match e with
                | Print _ ->
                    Some
                      (fun (k : (a, _) Effect.Deep.continuation) ->
                        let _ = Effect.perform (Tick 1) in
                        Effect.Deep.continue k 0)
                | _ -> None);
          })
      ()
      {
        retc = (fun x -> x);
        exnc = raise;
        effc =
          (fun (type a) (e : a Effect.t) ->
            match e with
            | Tick n ->
                Some
                  (fun (k : (a, _) Effect.Deep.continuation) ->
                    Effect.Deep.continue k n)
            | _ -> None);
      }
  in
  print_endline (string_of_int v)