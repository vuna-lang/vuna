(program
  (sig max (app (var ->) (var Nat) (app (var ->) (var Nat) (var Nat))))
  (fun max ((pvar x) (pvar y)) (if (app (var <) (var x) (var y)) (var y) (var x)))
)
