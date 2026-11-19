open Vuna_runtime
type 'a0 t_Functor = C_Functor_Functor of (Obj.t)

# 9 "Base/Trait/Functor.vuna"
let v_fmap = (fun _ud x2 x3 -> (match _ud with
  | C_Functor_Functor (dtb__0) -> (((Obj.magic dtb__0) x2) x3)
  | _ -> failwith "DT: impossible branch"
))
