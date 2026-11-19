(* 手写 OCaml 对照：与 traits.vuna 同算法（显式字典 record）。 *)
type 'a stepper = { step : 'a -> 'a; score : 'a -> int }

let stepper_int = { step = (fun x -> x + 1); score = (fun x -> x) }
let stepper_box = { step = (fun b -> b + 1); score = (fun b -> b) }

let rec run d n x = if n <= 0 then x else run d (n - 1) (d.step x)

let () =
  print_endline
    (string_of_int (stepper_int.score (run stepper_int 500000 0)
                   + stepper_box.score (run stepper_box 500000 0)))