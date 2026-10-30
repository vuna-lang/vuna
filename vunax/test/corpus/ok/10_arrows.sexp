(program
  (sig flip (app (var ->) (app (var ->) (var a) (app (var ->) (var b) (var c))) (app (var ->) (var b) (app (var ->) (var a) (var c)))))
  (fun flip ((pvar f) (pvar x) (pvar y)) (app (var f) (var y) (var x)))
  (sig const (app (var ->) (var a) (app (var ->) (var b) (var a))))
  (fun const ((pvar x) (pvar y)) (var x))
)
