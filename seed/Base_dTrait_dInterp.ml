open Vuna_runtime
type 'a0 t_Dict_uBase_dTrait_dInterp_dInterp = C_Dict_uBase_dTrait_dInterp_dInterp_Interp of (('a0) -> string)

# 18 "Base/Trait/Interp.vuna"
let v_Interp_ua = (fun _uctx0 -> (C_Dict_uBase_dTrait_dInterp_dInterp_Interp ((fun x -> ((Base_dTrait_dShow.v_Base_dTrait_dShow_dshow _uctx0) x)))))

# 22 "Base/Trait/Interp.vuna"
let v_Interp_uString = (C_Dict_uBase_dTrait_dInterp_dInterp_Interp ((fun s -> s)))

# 15 "Base/Trait/Interp.vuna"
let v_Base_dTrait_dInterp_dinterp = (fun _ud x0 -> (match _ud with
  | C_Dict_uBase_dTrait_dInterp_dInterp_Interp (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
))
