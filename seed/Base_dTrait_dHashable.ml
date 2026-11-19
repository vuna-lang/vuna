open Vuna_runtime
type 'a0 t_Dict_uBase_dTrait_dHashable_dHashable = C_Dict_uBase_dTrait_dHashable_dHashable_Hashable of (('a0) -> int)

# 16 "Base/Trait/Hashable.vuna"
let v_Base_dTrait_dHashable_dhash = (fun _ud x0 -> (match _ud with
  | C_Dict_uBase_dTrait_dHashable_dHashable_Hashable (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
))

# 20 "Base/Trait/Hashable.vuna"
let v_Base_dTrait_dHashable_dhashStr = (fun (s : string) -> (dtp_strHash s))

# 24 "Base/Trait/Hashable.vuna"
let v_Base_dTrait_dHashable_dhashCombine = (fun (a : int) (b : int) -> ((a * 31) + b))
