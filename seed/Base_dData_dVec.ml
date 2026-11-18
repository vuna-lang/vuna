open Vuna_runtime
type 'a0 t_Base_dData_dVec_dVec = C_Base_dData_dVec_dVec_Nil | C_Base_dData_dVec_dVec_VCons of ('a0) * ('a0 t_Base_dData_dVec_dVec)

# 20 "Base/Data/Vec.vuna"
let v_Base_dData_dVec_dvhead = (fun xs -> (match xs with
  | C_Base_dData_dVec_dVec_VCons (dtb__0, dtb__1) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 26 "Base/Data/Vec.vuna"
let v_Base_dData_dVec_dvtail = (fun xs -> (match xs with
  | C_Base_dData_dVec_dVec_VCons (dtb__2, dtb__3) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 32 "Base/Data/Vec.vuna"
let rec v_Base_dData_dVec_dvlen = (fun xs -> (match xs with
  | C_Base_dData_dVec_dVec_Nil -> 0
  | C_Base_dData_dVec_dVec_VCons (dtb__4, dtb__5) -> (bi_natAdd 1 (v_Base_dData_dVec_dvlen dtb__5))
  | _ -> failwith "DT: impossible branch"
))

# 48 "Base/Data/Vec.vuna"
let rec v_Base_dData_dVec_dvecToList = (fun (mc0 : string t_Base_dData_dVec_dVec) -> (match mc0 with
  | C_Base_dData_dVec_dVec_VCons (dtb__6, dtb__7) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__6, (v_Base_dData_dVec_dvecToList dtb__7)))
  | C_Base_dData_dVec_dVec_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 44 "Base/Data/Vec.vuna"
let v_Base_dData_dVec_dsubstTemplate = (fun template args -> ((Base_dData_dList.dtp_substTemplate template) (v_Base_dData_dVec_dvecToList args)))
