open Vuna_runtime
type 'a0 t_Base_dVec_dVec = C_Base_dVec_dVec_Base_dVec_dVNil | C_Base_dVec_dVec_Base_dVec_dVCons of ('a0) * ('a0 t_Base_dVec_dVec)

let v_Base_dVec_dvhead = (fun xs -> (match xs with
  | C_Base_dVec_dVec_Base_dVec_dVCons (dtb__0, dtb__1) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dVec_dvtail = (fun xs -> (match xs with
  | C_Base_dVec_dVec_Base_dVec_dVCons (dtb__2, dtb__3) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dVec_dvlen = (fun xs -> (match xs with
  | C_Base_dVec_dVec_Base_dVec_dVNil -> 0
  | C_Base_dVec_dVec_Base_dVec_dVCons (dtb__4, dtb__5) -> (bi_natAdd 1 (v_Base_dVec_dvlen dtb__5))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dVec_dvecToList = (fun mc0 -> (match mc0 with
  | C_Base_dVec_dVec_Base_dVec_dVCons (dtb__6, dtb__7) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__6, (v_Base_dVec_dvecToList dtb__7)))
  | C_Base_dVec_dVec_Base_dVec_dVNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dVec_dsubstTemplate = (fun template args -> ((Base_dList.dtp_substTemplate template) (v_Base_dVec_dvecToList args)))
