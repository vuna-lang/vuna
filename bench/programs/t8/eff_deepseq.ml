(* 手写 OCaml 对照：与 eff_deepseq.vuna 同算法（每层 perform 一次）。 *)
type _ Effect.t += P : int -> int Effect.t

let rec sum n =
  if n = 0 then 0
  else
    let x = Effect.perform (P 1) in
    let y = sum (n - 1) in
    x + y

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
            | P n ->
                Some
                  (fun (k : (a, _) Effect.Deep.continuation) ->
                    Effect.Deep.continue k n)
            | _ -> None);
      }
  in
  print_endline (string_of_int v)