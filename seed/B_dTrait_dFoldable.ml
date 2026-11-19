open Vuna_runtime
type 'a0 t_Foldable = C_Foldable_Foldable of (Obj.t)

# 13 "Base/Trait/Foldable.vuna"
let v_fold = (fun _ud x2 x3 x4 -> (match _ud with
  | C_Foldable_Foldable (dtb__0) -> ((((Obj.magic dtb__0) x2) x3) x4)
  | _ -> failwith "DT: impossible branch"
))

# 17 "Base/Trait/Foldable.vuna"
let v_foldMap = (fun _uctx0 _uctx1 _uctx2 f xs -> ((((v_fold _uctx2) (fun v acc -> (((B_dTrait_dMonoid.v_mappend _uctx0) (f v)) acc))) (B_dTrait_dMonoid.v_mempty _uctx1)) xs))
