open Vuna_runtime
type 'a0 t_Foldable = C_Foldable_Foldable of (Obj.t)

# 13 "Base/Trait/Foldable.vuna"
let v_fold = (fun dtb_u_u2 dtb_u_u5 dtb_u_u6 dtb_u_u7 -> (match dtb_u_u2 with
  | C_Foldable_Foldable (dtb_u_u8) -> ((((Obj.magic dtb_u_u8) dtb_u_u5) dtb_u_u6) dtb_u_u7)
  | _ -> failwith "DT: impossible branch"
))

# 17 "Base/Trait/Foldable.vuna"
let v_foldMap = (fun dtb_u_u12 dtb_u_u13 dtb_u_u14 dtb_u_u15 dtb_u_u16 -> ((((v_fold dtb_u_u14) (fun dtb_u_u17 dtb_u_u18 -> (((B_dTrait_dMonoid.v_mappend dtb_u_u12) (dtb_u_u15 dtb_u_u17)) dtb_u_u18))) (B_dTrait_dMonoid.v_mempty dtb_u_u13)) dtb_u_u16))
