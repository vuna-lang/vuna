open Vuna_runtime
type 'a0 t_Monad = C_Monad_Monad of (Obj.t)

# 15 "Base/Trait/Monad.vuna"
let v__x62__x62__x61_ = (fun _ud x2 x3 -> (match _ud with
  | C_Monad_Monad (dtb__0) -> (((Obj.magic dtb__0) x2) x3)
  | _ -> failwith "DT: impossible branch"
))

# 19 "Base/Trait/Monad.vuna"
let v__x62__x62_ = (fun _uctx0 a b -> (((v__x62__x62__x61_ _uctx0) a) (fun _u -> b)))
