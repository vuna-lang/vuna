(* 手写 OCaml 对照：与 eff_payload.vuna 同算法（variant payload 里带 record）。 *)
type span = { lo : int; hi : int; step : int }
type _ Effect.t += AskSpan : span -> int Effect.t

let rec loop n acc =
  if n = 0 then acc
  else
    let v = Effect.perform (AskSpan { lo = 1; hi = 2; step = 3 }) in
    loop (n - 1) (acc + v)

let () =
  let v =
    Effect.Deep.match_with
      (fun n -> loop n 0)
      20000
      {
        retc = (fun x -> x);
        exnc = raise;
        effc =
          (fun (type a) (e : a Effect.t) ->
            match e with
            | AskSpan p ->
                Some
                  (fun (k : (a, _) Effect.Deep.continuation) ->
                    Effect.Deep.continue k
                      ((p.lo * 100) + (p.hi * 10) + p.step))
            | _ -> None);
      }
  in
  print_endline (string_of_int v)