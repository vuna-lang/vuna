(program
  (sig add (app (var ->) (var Nat) (app (var ->) (var Nat) (var Nat))))
  (fun add ((pvar x) (pvar y)) (app (var +) (var x) (var y)))
  (sig sum (app (var ->) (app (var List) (var Nat)) (var Nat)))
  (fun sum ((pvar xs)) (case (var xs) (branch (pcon Nil) (int 0)) (branch (pcon Cons (pvar y) (pvar ys)) (app (var add) (var y) (app (var sum) (var ys))))))
)
