open Vuna_runtime
type ('a0, 'a1) t_Convert = C_Convert_Convert of (('a0) -> 'a1)
and ('a0, 'a1) t_ConvertMaybe = C_ConvertMaybe_ConvertMaybe of (('a0) -> 'a1 B_dData_dMaybe.t_Maybe)

# 13 "Base/Trait/Convert.vuna"
let v_convert = (fun _ud x0 -> (match _ud with
  | C_Convert_Convert (dtb__0) -> (dtb__0 x0)
  | _ -> failwith "DT: impossible branch"
))

# 18 "Base/Trait/Convert.vuna"
let v_convertMaybe = (fun _ud x0 -> (match _ud with
  | C_ConvertMaybe_ConvertMaybe (dtb__1) -> (dtb__1 x0)
  | _ -> failwith "DT: impossible branch"
))
