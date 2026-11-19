(* 手写 OCaml 对照：与 eff_tick.vuna 同算法（Effect.Deep，顺序 perform + resume）。 *)
type _ Effect.t += Tick : int -> int Effect.t

let rec loop n acc =
  if n = 0 then acc
  else
    let x = Effect.perform (Tick 1) in
    loop (n - 1) (acc + x)

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
            | Tick n ->
                Some
                  (fun (k : (a, _) Effect.Deep.continuation) ->
                    Effect.Deep.continue k n)
            | _ -> None);
      }
  in
  print_endline (string_of_int v)