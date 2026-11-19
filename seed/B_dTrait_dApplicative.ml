open Vuna_runtime
type 'a0 t_Applicative = C_Applicative_Applicative of (Obj.t) * (Obj.t) * (Obj.t)

# 14 "Base/Trait/Applicative.vuna"
let v_pure = (fun _ud x1 -> (match _ud with
  | C_Applicative_Applicative (dtb__0, dtb__1, dtb__2) -> ((Obj.magic dtb__0) x1)
  | _ -> failwith "DT: impossible branch"
))

# 16 "Base/Trait/Applicative.vuna"
let v_ap = (fun _ud x2 x3 -> (match _ud with
  | C_Applicative_Applicative (dtb__3, dtb__4, dtb__5) -> (((Obj.magic dtb__4) x2) x3)
  | _ -> failwith "DT: impossible branch"
))

# 18 "Base/Trait/Applicative.vuna"
let v_liftA2 = (fun _ud x3 x4 x5 -> (match _ud with
  | C_Applicative_Applicative (dtb__6, dtb__7, dtb__8) -> ((((Obj.magic dtb__8) x3) x4) x5)
  | _ -> failwith "DT: impossible branch"
))
