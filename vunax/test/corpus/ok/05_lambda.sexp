(program
  (sig apply (app (var ->) (app (var ->) (var Nat) (var Nat)) (app (var ->) (var Nat) (var Nat))))
  (fun apply ((pvar f) (pvar x)) (app (var f) (var x)))
  (sig compose (app (var ->) (app (var ->) (var b) (var c)) (app (var ->) (app (var ->) (var a) (var b)) (app (var ->) (var a) (var c)))))
  (fun compose ((pvar f) (pvar g)) (lam (x) (app (var f) (app (var g) (var x)))))
)
