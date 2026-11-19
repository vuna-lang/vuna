open Vuna_runtime
# 9 "Base/Data/Function.vuna"
let v_id = (fun x -> x)

# 13 "Base/Data/Function.vuna"
let v_const = (fun x _u -> x)

# 17 "Base/Data/Function.vuna"
let v_flip = (fun f x y -> ((f y) x))

# 21 "Base/Data/Function.vuna"
let v_compose = (fun f g x -> (f (g x)))

# 25 "Base/Data/Function.vuna"
let v__x36_ = (fun f x -> (f x))

# 29 "Base/Data/Function.vuna"
let v__x124__x62_ = (fun x f -> (f x))
