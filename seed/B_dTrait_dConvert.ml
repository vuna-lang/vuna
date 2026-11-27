open Vuna_runtime
type ('a0, 'a1) t_Convert = C_Convert_Convert of (('a0) -> 'a1)
and ('a0, 'a1) t_ConvertMaybe = C_ConvertMaybe_ConvertMaybe of (('a0) -> 'a1 B_dData_dMaybe.t_Maybe)

# 13 "Base/Trait/Convert.vuna"
let v_convert = (fun dtb_u_u3 dtb_u_u4 -> (match dtb_u_u3 with
  | C_Convert_Convert (dtb_u_u5) -> (dtb_u_u5 dtb_u_u4)
  | _ -> failwith "DT: impossible branch"
))

# 18 "Base/Trait/Convert.vuna"
let v_convertMaybe = (fun dtb_u_u8 dtb_u_u9 -> (match dtb_u_u8 with
  | C_ConvertMaybe_ConvertMaybe (dtb_u_u10) -> (dtb_u_u10 dtb_u_u9)
  | _ -> failwith "DT: impossible branch"
))
