open Vuna_runtime
type 'a0 t_Hashable = C_Hashable_Hashable of (('a0) -> int)

# 16 "Base/Trait/Hashable.vuna"
let v_hash = (fun _ud x0 -> (match _ud with
  | C_Hashable_Hashable (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
))

# 20 "Base/Trait/Hashable.vuna"
let v_hashStr = (fun (s : string) -> (dtp_strHash s))

# 24 "Base/Trait/Hashable.vuna"
let v_hashCombine = (fun (a : int) (b : int) -> ((a * 31) + b))
