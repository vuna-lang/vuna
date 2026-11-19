open Vuna_runtime
type 'a0 t_Interp = C_Interp_Interp of (('a0) -> string)

# 18 "Base/Trait/Interp.vuna"
let v_Interp_ua = (fun _uctx0 -> (C_Interp_Interp ((fun x -> ((B_dTrait_dShow.v_show _uctx0) x)))))

# 22 "Base/Trait/Interp.vuna"
let v_Interp_uString = (C_Interp_Interp ((fun s -> s)))

# 15 "Base/Trait/Interp.vuna"
let v_interp = (fun _ud x0 -> (match _ud with
  | C_Interp_Interp (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
))
