(program
  (data Bool () (False 0) (True 0))
  (sig not (app (var ->) (var Bool) (var Bool)))
  (fun not ((pvar b)) (case (var b) (branch (pcon False) (var True)) (branch (pcon True) (var False))))
)
