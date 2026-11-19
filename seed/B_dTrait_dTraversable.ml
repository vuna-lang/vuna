open Vuna_runtime
type ('a0, 'a1) t_Traversable = C_Traversable_Traversable of (Obj.t)

# 13 "Base/Trait/Traversable.vuna"
let v_mapM = (fun _ud x2 x3 -> (match _ud with
  | C_Traversable_Traversable (dtb__0) -> (((Obj.magic dtb__0) x2) x3)
  | _ -> failwith "DT: impossible branch"
))
