open Vuna_runtime
type ('a0, 'a1) t_Pair = { f_Pair_first : 'a0; f_Pair_second : 'a1 }

# 28 "Base/Data/Pair.vuna"
let v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub = (fun dtb_u_u3 dtb_u_u4 -> (B_dTrait_dShow.C_Show_Show ((fun dtb_u_u5 -> (match dtb_u_u5 with
  | { f_Pair_first = dtb_u_u6; f_Pair_second = dtb_u_u7 } -> (String.concat "" ["("; ((B_dTrait_dShow.v_show dtb_u_u3) dtb_u_u6); ", "; ((B_dTrait_dShow.v_show dtb_u_u4) dtb_u_u7); ")"])
  | _ -> failwith "DT: impossible branch"
)))))

# 34 "Base/Data/Pair.vuna"
let rec v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub = (fun dtb_u_u10 dtb_u_u11 -> (B_dTrait_dEq.C_Eq_Eq ((fun dtb_u_u12 dtb_u_u13 -> (match dtb_u_u12 with
  | { f_Pair_first = dtb_u_u14; f_Pair_second = dtb_u_u15 } -> (match dtb_u_u13 with
  | { f_Pair_first = dtb_u_u16; f_Pair_second = dtb_u_u17 } -> (if (((B_dTrait_dEq.v__x61__x61_ dtb_u_u10) dtb_u_u14) dtb_u_u16) then (((B_dTrait_dEq.v__x61__x61_ dtb_u_u11) dtb_u_u15) dtb_u_u17) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)), (fun dtb_u_u18 dtb_u_u19 -> (if (((B_dTrait_dEq.v__x61__x61_ ((v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub dtb_u_u10) dtb_u_u11)) dtb_u_u18) dtb_u_u19) then false else true)))))

# 38 "Base/Data/Pair.vuna"
let rec v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub = (fun dtb_u_u22 dtb_u_u23 -> (B_dTrait_dOrd.C_Ord_Ord ((fun dtb_u_u24 dtb_u_u25 -> (match dtb_u_u24 with
  | { f_Pair_first = dtb_u_u26; f_Pair_second = dtb_u_u27 } -> (match dtb_u_u25 with
  | { f_Pair_first = dtb_u_u28; f_Pair_second = dtb_u_u29 } -> (if (((B_dTrait_dOrd.v__x60_ dtb_u_u22) dtb_u_u26) dtb_u_u28) then true else (if (((B_dTrait_dOrd.v__x60_ dtb_u_u22) dtb_u_u28) dtb_u_u26) then false else (((B_dTrait_dOrd.v__x60_ dtb_u_u23) dtb_u_u27) dtb_u_u29)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)), (fun dtb_u_u30 dtb_u_u31 -> (if (((B_dTrait_dOrd.v__x60_ ((v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub dtb_u_u22) dtb_u_u23)) dtb_u_u30) dtb_u_u31) then true else (B_dData_dBool.v_not (((B_dTrait_dOrd.v__x60_ ((v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub dtb_u_u22) dtb_u_u23)) dtb_u_u31) dtb_u_u30)))), (fun dtb_u_u32 dtb_u_u33 -> (((B_dTrait_dOrd.v__x60_ ((v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub dtb_u_u22) dtb_u_u23)) dtb_u_u33) dtb_u_u32)), (fun dtb_u_u34 dtb_u_u35 -> (((B_dTrait_dOrd.v__x60__x61_ ((v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub dtb_u_u22) dtb_u_u23)) dtb_u_u35) dtb_u_u34)))))

# 44 "Base/Data/Pair.vuna"
let v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub = (fun dtb_u_u38 dtb_u_u39 -> (B_dTrait_dHashable.C_Hashable_Hashable ((fun dtb_u_u40 -> (match dtb_u_u40 with
  | { f_Pair_first = dtb_u_u41; f_Pair_second = dtb_u_u42 } -> ((B_dTrait_dHashable.v_hashCombine ((B_dTrait_dHashable.v_hash dtb_u_u38) dtb_u_u41)) ((B_dTrait_dHashable.v_hash dtb_u_u39) dtb_u_u42))
  | _ -> failwith "DT: impossible branch"
)))))

# 19 "Base/Data/Pair.vuna"
let v_firstOf = (fun dtb_u_u45 -> (match dtb_u_u45 with
  | { f_Pair_first = dtb_u_u46; f_Pair_second = dtb_u_u47 } -> dtb_u_u46
  | _ -> failwith "DT: impossible branch"
))

# 23 "Base/Data/Pair.vuna"
let v_secondOf = (fun dtb_u_u50 -> (match dtb_u_u50 with
  | { f_Pair_first = dtb_u_u51; f_Pair_second = dtb_u_u52 } -> dtb_u_u52
  | _ -> failwith "DT: impossible branch"
))

# 13 "Base/Data/Pair.vuna"
let v_first = (fun dtb_u_u55 -> (match dtb_u_u55 with
  | { f_Pair_first = dtb_u_u56; f_Pair_second = dtb_u_u57 } -> dtb_u_u56
  | _ -> failwith "DT: impossible branch"
))

# 15 "Base/Data/Pair.vuna"
let v_second = (fun dtb_u_u60 -> (match dtb_u_u60 with
  | { f_Pair_first = dtb_u_u61; f_Pair_second = dtb_u_u62 } -> dtb_u_u62
  | _ -> failwith "DT: impossible branch"
))
