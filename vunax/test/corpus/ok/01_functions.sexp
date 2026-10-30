(program
  (sig add (app (var ->) (var Nat) (app (var ->) (var Nat) (var Nat))))
  (fun add ((pvar x) (pvar y)) (app (var +) (var x) (var y)))
  (sig twice (app (var ->) (var Nat) (var Nat)))
  (fun twice ((pvar x)) (app (var add) (var x) (var x)))
)
