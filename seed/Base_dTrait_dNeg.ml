open Vuna_runtime
type 'a0 t_Dict_uBase_dTrait_dNeg_dNeg = C_Dict_uBase_dTrait_dNeg_dNeg_Neg of (('a0) -> 'a0)

# 10 "Base/Trait/Neg.vuna"
let v_Base_dTrait_dNeg_dnegate = (fun _ud x0 -> (match _ud with
  | C_Dict_uBase_dTrait_dNeg_dNeg_Neg (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
))
