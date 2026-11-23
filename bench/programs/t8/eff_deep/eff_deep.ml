(* 手写 OCaml 对照：与 eff_deep.vuna 同算法（非尾递归到最深处 perform 一次）。 *)
type _ Effect.t += Tick : int -> int Effect.t

let rec sum n = if n = 0 then Effect.perform (Tick 1) else 1 + sum (n - 1)

let () =
  let v =
    Effect.Deep.match_with
      sum
      2000
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