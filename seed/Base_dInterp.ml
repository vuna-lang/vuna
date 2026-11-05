open Vuna_runtime
type 'a0 t_Dict_uBase_dInterp_dInterp = C_Dict_uBase_dInterp_dInterp_MkDict_uBase_dInterp_dInterp of (('a0) -> string)

let v_Interp_ua = (fun _uctx0 -> (C_Dict_uBase_dInterp_dInterp_MkDict_uBase_dInterp_dInterp ((fun x -> ((Base_dShow.v_Base_dShow_dshow _uctx0) x)))))

let v_Interp_uString = (C_Dict_uBase_dInterp_dInterp_MkDict_uBase_dInterp_dInterp ((fun s -> s)))

let v_Base_dInterp_dinterp = (fun _ud x0 -> (match _ud with
  | C_Dict_uBase_dInterp_dInterp_MkDict_uBase_dInterp_dInterp (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
))
