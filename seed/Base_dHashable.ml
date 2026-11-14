open Vuna_runtime
type 'a0 t_Dict_uBase_dHashable_dHashable = C_Dict_uBase_dHashable_dHashable_Hashable of (('a0) -> int)

# 21 "Base/Hashable.vuna"
let v_Base_dHashable_dhash = (fun _ud x0 -> (match _ud with
  | C_Dict_uBase_dHashable_dHashable_Hashable (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
))

# 25 "Base/Hashable.vuna"
let v_Base_dHashable_dhashStr = (fun s -> (dtp_strHash s))

# 29 "Base/Hashable.vuna"
let v_Base_dHashable_dhashCombine = (fun a b -> ((a * 31) + b))
