(* 手写 OCaml 对照：与 eff_nested.vuna 同算法（N 层 handler 嵌套）。 *)
type _ Effect.t += P : int -> int Effect.t

let rec layer n =
  if n = 0 then 0
  else
    Effect.Deep.match_with
      (fun () ->
        let x = layer (n - 1) in
        Effect.perform (P x))
      ()
      {
        retc = (fun x -> x);
        exnc = raise;
        effc =
          (fun (type a) (e : a Effect.t) ->
            match e with
            | P x ->
                Some
                  (fun (k : (a, _) Effect.Deep.continuation) ->
                    Effect.Deep.continue k (x + 1))
            | _ -> None);
      }

let () =
  let v =
    Effect.Deep.match_with
      layer
      2000
      {
        retc = (fun x -> x);
        exnc = raise;
        effc =
          (fun (type a) (e : a Effect.t) ->
            match e with
            | P x ->
                Some
                  (fun (k : (a, _) Effect.Deep.continuation) ->
                    Effect.Deep.continue k x)
            | _ -> None);
      }
  in
  print_endline (string_of_int v)