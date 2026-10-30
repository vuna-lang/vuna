(program
  (sig add3 (app (var ->) (var Nat) (app (var ->) (var Nat) (app (var ->) (var Nat) (var Nat)))))
  (fun add3 ((pvar x) (pvar y) (pvar z)) (let (bind (pvar s) (app (var add) (var x) (var y))) (bind (pvar t) (app (var add) (var s) (var z))) (var t)))
)
