open Vuna_runtime
# 29 "Vuna/Ir/Direct.vuna"
let rec v_usesFuel = (fun (dtb_u_u1 : int) (dtb_u_u2 : Vuna_dIr_dModel.t_IrBinder) (dtb_u_u3 : Vuna_dIr_dModel.t_Ir) -> (if (dtb_u_u1 <= 0) then 0 else (match dtb_u_u3 with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u4) -> (if ((Vuna_dIr_dModel.v_sameBinderId dtb_u_u2) dtb_u_u4) then 1 else 0)
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u5, dtb_u_u6, dtb_u_u7, dtb_u_u8) -> (((v_usesList (dtb_u_u1 - 1)) dtb_u_u2) dtb_u_u8)
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u9, dtb_u_u10, dtb_u_u11) -> (((v_usesFields (dtb_u_u1 - 1)) dtb_u_u2) dtb_u_u11)
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb_u_u12, dtb_u_u13, dtb_u_u14, dtb_u_u15) -> (((v_usesFuel (dtb_u_u1 - 1)) dtb_u_u2) dtb_u_u12)
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb_u_u16, dtb_u_u17, dtb_u_u18, dtb_u_u19) -> ((((v_usesFuel (dtb_u_u1 - 1)) dtb_u_u2) dtb_u_u16) + (((v_usesFields (dtb_u_u1 - 1)) dtb_u_u2) dtb_u_u18))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u20, dtb_u_u21) -> (((v_usesList (dtb_u_u1 - 1)) dtb_u_u2) dtb_u_u21)
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u22, dtb_u_u23, dtb_u_u24) -> (((v_usesFuel (dtb_u_u1 - 1)) dtb_u_u2) dtb_u_u24)
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u25, dtb_u_u26, dtb_u_u27) -> ((((v_usesFuel (dtb_u_u1 - 1)) dtb_u_u2) dtb_u_u26) + (((v_usesFuel (dtb_u_u1 - 1)) dtb_u_u2) dtb_u_u27))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u28, dtb_u_u29, dtb_u_u30) -> (((v_usesFuel (dtb_u_u1 - 1)) dtb_u_u2) dtb_u_u30)
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u31, dtb_u_u32, dtb_u_u33) -> ((((v_usesFuel (dtb_u_u1 - 1)) dtb_u_u2) dtb_u_u32) + (((v_usesFuel (dtb_u_u1 - 1)) dtb_u_u2) dtb_u_u33))
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb_u_u34) -> (((v_usesFuel (dtb_u_u1 - 1)) dtb_u_u2) dtb_u_u34)
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb_u_u35, dtb_u_u36, dtb_u_u37) -> (((((v_usesFuel (dtb_u_u1 - 1)) dtb_u_u2) dtb_u_u35) + (((v_usesFuel (dtb_u_u1 - 1)) dtb_u_u2) dtb_u_u36)) + (((v_usesFuel (dtb_u_u1 - 1)) dtb_u_u2) dtb_u_u37))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u38, dtb_u_u39, dtb_u_u40, dtb_u_u41) -> ((((v_usesFuel (dtb_u_u1 - 1)) dtb_u_u2) dtb_u_u40) + (((v_usesAlts (dtb_u_u1 - 1)) dtb_u_u2) dtb_u_u41))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb_u_u42, dtb_u_u43, dtb_u_u44, dtb_u_u45, dtb_u_u46) -> ((((((v_usesFuel (dtb_u_u1 - 1)) dtb_u_u2) dtb_u_u42) + (((v_usesAltM (dtb_u_u1 - 1)) dtb_u_u2) dtb_u_u44)) + (((v_usesAltM (dtb_u_u1 - 1)) dtb_u_u2) dtb_u_u45)) + (((v_usesAltM (dtb_u_u1 - 1)) dtb_u_u2) dtb_u_u46))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb_u_u47) -> (((v_usesList (dtb_u_u1 - 1)) dtb_u_u2) dtb_u_u47)
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb_u_u48, dtb_u_u49, dtb_u_u50, dtb_u_u51, dtb_u_u52) -> (((v_usesFuel (dtb_u_u1 - 1)) dtb_u_u2) dtb_u_u52)
  | _ -> 0
)))
# 53 "Vuna/Ir/Direct.vuna"
and v_usesList = (fun (dtb_u_u53 : int) (dtb_u_u54 : Vuna_dIr_dModel.t_IrBinder) (dtb_u_u55 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (dtb_u_u53 <= 0) then 0 else (match dtb_u_u55 with
  | B_dData_dList.C_List_Nil -> 0
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u56, dtb_u_u57) -> ((((v_usesFuel (dtb_u_u53 - 1)) dtb_u_u54) dtb_u_u56) + (((v_usesList (dtb_u_u53 - 1)) dtb_u_u54) dtb_u_u57))
  | _ -> failwith "DT: impossible branch"
)))
# 62 "Vuna/Ir/Direct.vuna"
and v_usesFields = (fun (dtb_u_u58 : int) (dtb_u_u59 : Vuna_dIr_dModel.t_IrBinder) (dtb_u_u60 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u58 <= 0) then 0 else (match dtb_u_u60 with
  | B_dData_dList.C_List_Nil -> 0
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u61, dtb_u_u62) -> ((((v_usesFuel (dtb_u_u58 - 1)) dtb_u_u59) (B_dData_dPair.v_secondOf dtb_u_u61)) + (((v_usesFields (dtb_u_u58 - 1)) dtb_u_u59) dtb_u_u62))
  | _ -> failwith "DT: impossible branch"
)))
# 71 "Vuna/Ir/Direct.vuna"
and v_usesAlts = (fun (dtb_u_u63 : int) (dtb_u_u64 : Vuna_dIr_dModel.t_IrBinder) (dtb_u_u65 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (if (dtb_u_u63 <= 0) then 0 else (match dtb_u_u65 with
  | B_dData_dList.C_List_Nil -> 0
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u66, dtb_u_u67) -> ((((v_usesFuel (dtb_u_u63 - 1)) dtb_u_u64) (Vuna_dIr_dModel.v_irAltBodyOf dtb_u_u66)) + (((v_usesAlts (dtb_u_u63 - 1)) dtb_u_u64) dtb_u_u67))
  | _ -> failwith "DT: impossible branch"
)))
# 80 "Vuna/Ir/Direct.vuna"
and v_usesAltM = (fun (dtb_u_u68 : int) (dtb_u_u69 : Vuna_dIr_dModel.t_IrBinder) (dtb_u_u70 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (if (dtb_u_u68 <= 0) then 0 else (match dtb_u_u70 with
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u71) -> (((v_usesFuel (dtb_u_u68 - 1)) dtb_u_u69) (Vuna_dIr_dModel.v_irAltBodyOf dtb_u_u71))
  | _ -> failwith "DT: impossible branch"
)))

# 26 "Vuna/Ir/Direct.vuna"
let v_usesOf = (fun (dtb_u_u72 : Vuna_dIr_dModel.t_IrBinder) (dtb_u_u73 : Vuna_dIr_dModel.t_Ir) -> (((v_usesFuel (64 + (4 * (Vuna_dIr_dModel.v_irSize dtb_u_u73)))) dtb_u_u72) dtb_u_u73))

# 92 "Vuna/Ir/Direct.vuna"
let rec v_substFuel = (fun (dtb_u_u74 : int) (dtb_u_u75 : Vuna_dIr_dModel.t_IrBinder) (dtb_u_u76 : Vuna_dIr_dModel.t_Ir) (dtb_u_u77 : Vuna_dIr_dModel.t_Ir) -> (if (dtb_u_u74 <= 0) then dtb_u_u77 else (match dtb_u_u77 with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u78) -> (if ((Vuna_dIr_dModel.v_sameBinderId dtb_u_u75) dtb_u_u78) then dtb_u_u76 else dtb_u_u77)
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u79, dtb_u_u80, dtb_u_u81, dtb_u_u82) -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u79, dtb_u_u80, dtb_u_u81, ((((v_substList (dtb_u_u74 - 1)) dtb_u_u75) dtb_u_u76) dtb_u_u82)))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u83, dtb_u_u84, dtb_u_u85) -> (Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u83, dtb_u_u84, ((((v_substFields (dtb_u_u74 - 1)) dtb_u_u75) dtb_u_u76) dtb_u_u85)))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb_u_u86, dtb_u_u87, dtb_u_u88, dtb_u_u89) -> (Vuna_dIr_dModel.C_Ir_IrProj (((((v_substFuel (dtb_u_u74 - 1)) dtb_u_u75) dtb_u_u76) dtb_u_u86), dtb_u_u87, dtb_u_u88, dtb_u_u89))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb_u_u90, dtb_u_u91, dtb_u_u92, dtb_u_u93) -> (Vuna_dIr_dModel.C_Ir_IrRecUpd (((((v_substFuel (dtb_u_u74 - 1)) dtb_u_u75) dtb_u_u76) dtb_u_u90), dtb_u_u91, ((((v_substFields (dtb_u_u74 - 1)) dtb_u_u75) dtb_u_u76) dtb_u_u92), dtb_u_u93))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u94, dtb_u_u95) -> (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u94, ((((v_substList (dtb_u_u74 - 1)) dtb_u_u75) dtb_u_u76) dtb_u_u95)))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u96, dtb_u_u97, dtb_u_u98) -> (Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u96, dtb_u_u97, ((((v_substFuel (dtb_u_u74 - 1)) dtb_u_u75) dtb_u_u76) dtb_u_u98)))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u99, dtb_u_u100, dtb_u_u101) -> (Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u99, ((((v_substFuel (dtb_u_u74 - 1)) dtb_u_u75) dtb_u_u76) dtb_u_u100), ((((v_substFuel (dtb_u_u74 - 1)) dtb_u_u75) dtb_u_u76) dtb_u_u101)))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u102, dtb_u_u103, dtb_u_u104) -> (Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u102, dtb_u_u103, ((((v_substFuel (dtb_u_u74 - 1)) dtb_u_u75) dtb_u_u76) dtb_u_u104)))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u105, dtb_u_u106, dtb_u_u107) -> (Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u105, ((((v_substFuel (dtb_u_u74 - 1)) dtb_u_u75) dtb_u_u76) dtb_u_u106), ((((v_substFuel (dtb_u_u74 - 1)) dtb_u_u75) dtb_u_u76) dtb_u_u107)))
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb_u_u108) -> (Vuna_dIr_dModel.C_Ir_IrTail (((((v_substFuel (dtb_u_u74 - 1)) dtb_u_u75) dtb_u_u76) dtb_u_u108)))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb_u_u109, dtb_u_u110, dtb_u_u111) -> (Vuna_dIr_dModel.C_Ir_IrIf (((((v_substFuel (dtb_u_u74 - 1)) dtb_u_u75) dtb_u_u76) dtb_u_u109), ((((v_substFuel (dtb_u_u74 - 1)) dtb_u_u75) dtb_u_u76) dtb_u_u110), ((((v_substFuel (dtb_u_u74 - 1)) dtb_u_u75) dtb_u_u76) dtb_u_u111)))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u112, dtb_u_u113, dtb_u_u114, dtb_u_u115) -> (Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u112, dtb_u_u113, ((((v_substFuel (dtb_u_u74 - 1)) dtb_u_u75) dtb_u_u76) dtb_u_u114), ((((v_substAlts (dtb_u_u74 - 1)) dtb_u_u75) dtb_u_u76) dtb_u_u115)))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb_u_u116, dtb_u_u117, dtb_u_u118, dtb_u_u119, dtb_u_u120) -> (Vuna_dIr_dModel.C_Ir_IrNatCase (((((v_substFuel (dtb_u_u74 - 1)) dtb_u_u75) dtb_u_u76) dtb_u_u116), dtb_u_u117, ((((v_substAltM (dtb_u_u74 - 1)) dtb_u_u75) dtb_u_u76) dtb_u_u118), ((((v_substAltM (dtb_u_u74 - 1)) dtb_u_u75) dtb_u_u76) dtb_u_u119), ((((v_substAltM (dtb_u_u74 - 1)) dtb_u_u75) dtb_u_u76) dtb_u_u120)))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb_u_u121) -> (Vuna_dIr_dModel.C_Ir_IrConcatMany (((((v_substList (dtb_u_u74 - 1)) dtb_u_u75) dtb_u_u76) dtb_u_u121)))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb_u_u122, dtb_u_u123, dtb_u_u124, dtb_u_u125, dtb_u_u126) -> (Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb_u_u122, dtb_u_u123, dtb_u_u124, dtb_u_u125, ((((v_substFuel (dtb_u_u74 - 1)) dtb_u_u75) dtb_u_u76) dtb_u_u126)))
  | _ -> dtb_u_u77
)))
# 116 "Vuna/Ir/Direct.vuna"
and v_substList = (fun (dtb_u_u127 : int) (dtb_u_u128 : Vuna_dIr_dModel.t_IrBinder) (dtb_u_u129 : Vuna_dIr_dModel.t_Ir) (dtb_u_u130 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (dtb_u_u127 <= 0) then dtb_u_u130 else (match dtb_u_u130 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u131, dtb_u_u132) -> (B_dData_dList.C_List__x58__x58_ (((((v_substFuel (dtb_u_u127 - 1)) dtb_u_u128) dtb_u_u129) dtb_u_u131), ((((v_substList (dtb_u_u127 - 1)) dtb_u_u128) dtb_u_u129) dtb_u_u132)))
  | _ -> failwith "DT: impossible branch"
)))
# 125 "Vuna/Ir/Direct.vuna"
and v_substFields = (fun (dtb_u_u133 : int) (dtb_u_u134 : Vuna_dIr_dModel.t_IrBinder) (dtb_u_u135 : Vuna_dIr_dModel.t_Ir) (dtb_u_u136 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u133 <= 0) then dtb_u_u136 else (match dtb_u_u136 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u137, dtb_u_u138) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u137); B_dData_dPair.f_Pair_second = ((((v_substFuel (dtb_u_u133 - 1)) dtb_u_u134) dtb_u_u135) (B_dData_dPair.v_secondOf dtb_u_u137)) }, ((((v_substFields (dtb_u_u133 - 1)) dtb_u_u134) dtb_u_u135) dtb_u_u138)))
  | _ -> failwith "DT: impossible branch"
)))
# 134 "Vuna/Ir/Direct.vuna"
and v_substAlts = (fun (dtb_u_u139 : int) (dtb_u_u140 : Vuna_dIr_dModel.t_IrBinder) (dtb_u_u141 : Vuna_dIr_dModel.t_Ir) (dtb_u_u142 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (if (dtb_u_u139 <= 0) then dtb_u_u142 else (match dtb_u_u142 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u143, dtb_u_u144) -> (B_dData_dList.C_List__x58__x58_ ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb_u_u143).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb_u_u143).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((((v_substFuel (dtb_u_u139 - 1)) dtb_u_u140) dtb_u_u141) (dtb_u_u143).Vuna_dIr_dModel.f_IrAlt_irAltBody) }, ((((v_substAlts (dtb_u_u139 - 1)) dtb_u_u140) dtb_u_u141) dtb_u_u144)))
  | _ -> failwith "DT: impossible branch"
)))
# 143 "Vuna/Ir/Direct.vuna"
and v_substAltM = (fun (dtb_u_u145 : int) (dtb_u_u146 : Vuna_dIr_dModel.t_IrBinder) (dtb_u_u147 : Vuna_dIr_dModel.t_Ir) (dtb_u_u148 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (if (dtb_u_u145 <= 0) then dtb_u_u148 else (match dtb_u_u148 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u149) -> (B_dData_dMaybe.C_Maybe_Just ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb_u_u149).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb_u_u149).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((((v_substFuel (dtb_u_u145 - 1)) dtb_u_u146) dtb_u_u147) (dtb_u_u149).Vuna_dIr_dModel.f_IrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 89 "Vuna/Ir/Direct.vuna"
let v_substIr = (fun (dtb_u_u150 : Vuna_dIr_dModel.t_IrBinder) (dtb_u_u151 : Vuna_dIr_dModel.t_Ir) (dtb_u_u152 : Vuna_dIr_dModel.t_Ir) -> ((((v_substFuel (64 + (4 * (Vuna_dIr_dModel.v_irSize dtb_u_u152)))) dtb_u_u150) dtb_u_u151) dtb_u_u152))

# 152 "Vuna/Ir/Direct.vuna"
let v_binderSafeName = (fun (dtb_u_u153 : Vuna_dIr_dModel.t_IrBinder) -> (if ((dtb_u_u153).Vuna_dIr_dModel.f_IrBinder_irBinderId < 0) then ("dtb__n" ^ (string_of_int (0 - (dtb_u_u153).Vuna_dIr_dModel.f_IrBinder_irBinderId))) else ("dtb__" ^ (string_of_int (dtb_u_u153).Vuna_dIr_dModel.f_IrBinder_irBinderId))))

# 159 "Vuna/Ir/Direct.vuna"
let v_safeBinder = (fun (dtb_u_u154 : Vuna_dIr_dModel.t_IrBinder) -> { Vuna_dIr_dModel.f_IrBinder_irBinderId = (dtb_u_u154).Vuna_dIr_dModel.f_IrBinder_irBinderId; Vuna_dIr_dModel.f_IrBinder_irBinderName = (Vuna_dIr_dModel.C_IrBName_IrBUser ((v_binderSafeName dtb_u_u154))); Vuna_dIr_dModel.f_IrBinder_irBinderErased = (dtb_u_u154).Vuna_dIr_dModel.f_IrBinder_irBinderErased; Vuna_dIr_dModel.f_IrBinder_irBinderTy = (dtb_u_u154).Vuna_dIr_dModel.f_IrBinder_irBinderTy })

# 162 "Vuna/Ir/Direct.vuna"
let v_sameIr = (fun (dtb_u_u155 : Vuna_dIr_dModel.t_IrBinder) (dtb_u_u156 : Vuna_dIr_dModel.t_Ir) -> (match dtb_u_u156 with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u157) -> ((Vuna_dIr_dModel.v_sameBinderId dtb_u_u155) dtb_u_u157)
  | _ -> false
))

# 166 "Vuna/Ir/Direct.vuna"
let v_isEffThunk = (fun (dtb_u_u158 : string) (dtb_u_u159 : string) -> (if (dtb_u_u158 = Vuna_dIr_dModel.v_irEffTypeName) then (dtb_u_u159 = Vuna_dIr_dModel.v_irEffMkCtor) else false))

# 169 "Vuna/Ir/Direct.vuna"
let v_effFieldOf = (fun (dtb_u_u160 : Vuna_dIr_dModel.t_Ir) -> (match dtb_u_u160 with
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u161, dtb_u_u162, dtb_u_u163, dtb_u_u164) -> (match dtb_u_u164 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u165, dtb_u_u166) -> (match dtb_u_u166 with
  | B_dData_dList.C_List_Nil -> (if ((v_isEffThunk dtb_u_u161) dtb_u_u162) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u165)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 178 "Vuna/Ir/Direct.vuna"
let rec v_applyAll = (fun (dtb_u_u167 : Vuna_dIr_dModel.t_Ir) (dtb_u_u168 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (match dtb_u_u168 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u169, dtb_u_u170) -> ((v_applyAll (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u167, dtb_u_u169))) dtb_u_u170)
  | B_dData_dList.C_List_Nil -> dtb_u_u167
  | _ -> failwith "DT: impossible branch"
))

# 182 "Vuna/Ir/Direct.vuna"
let rec v_listLen = (fun dtb_u_u172 -> (match dtb_u_u172 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u173, dtb_u_u174) -> (1 + (v_listLen dtb_u_u174))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Ir/Direct.vuna"
let rec v_flattenCall = (fun (dtb_u_u175 : Vuna_dIr_dModel.t_Ir) -> (match dtb_u_u175 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u176, dtb_u_u177, dtb_u_u178) -> (match (v_flattenCall dtb_u_u177) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u179; B_dData_dPair.f_Pair_second = dtb_u_u180 } -> { B_dData_dPair.f_Pair_first = dtb_u_u179; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb_u_u180) (B_dData_dList.C_List__x58__x58_ (dtb_u_u178, B_dData_dList.C_List_Nil))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { B_dData_dPair.f_Pair_first = dtb_u_u175; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
))

# 192 "Vuna/Ir/Direct.vuna"
let v_applyToken = (fun (dtb_u_u181 : (string) -> int B_dData_dMaybe.t_Maybe) (dtb_u_u182 : Vuna_dIr_dModel.t_Ir) (dtb_u_u183 : Vuna_dIr_dModel.t_Ir) -> (let dtb_u_u184 = (v_flattenCall dtb_u_u182) in (match dtb_u_u184 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u185; B_dData_dPair.f_Pair_second = dtb_u_u186 } -> (match dtb_u_u185 with
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u187) -> (match (dtb_u_u181 dtb_u_u187) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u188) -> (if ((v_listLen dtb_u_u186) = dtb_u_u188) then ((v_applyAll (Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u187))) ((B_dData_dList.v_append dtb_u_u186) (B_dData_dList.C_List__x58__x58_ (dtb_u_u183, B_dData_dList.C_List_Nil)))) else (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCast (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u182)), dtb_u_u183)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCast (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u182)), dtb_u_u183))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCast (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u182)), dtb_u_u183))
)
  | _ -> failwith "DT: impossible branch"
)))

# 235 "Vuna/Ir/Direct.vuna"
let v_applyCont = (fun (dtb_u_u189 : Vuna_dIr_dModel.t_Ir) (dtb_u_u190 : Vuna_dIr_dModel.t_Ir) -> (match dtb_u_u189 with
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u191, dtb_u_u192, dtb_u_u193) -> (match dtb_u_u191 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u194, dtb_u_u195) -> (match dtb_u_u195 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u196 = (v_safeBinder dtb_u_u194) in (Vuna_dIr_dModel.C_Ir_IrLet ((B_dData_dList.C_List__x58__x58_ (dtb_u_u196, B_dData_dList.C_List_Nil)), dtb_u_u190, (((v_substIr dtb_u_u194) (Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u196))) dtb_u_u193))))
  | _ -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u189, dtb_u_u190))
)
  | _ -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u189, dtb_u_u190))
)
  | _ -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u189, dtb_u_u190))
))

# 205 "Vuna/Ir/Direct.vuna"
let rec v_runAction = (fun (dtb_u_u197 : (string) -> int B_dData_dMaybe.t_Maybe) (dtb_u_u198 : int) (dtb_u_u199 : Vuna_dIr_dModel.t_Ir) (dtb_u_u200 : Vuna_dIr_dModel.t_Ir) -> (if (dtb_u_u198 <= 0) then (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u199, dtb_u_u200)) else (let dtb_u_u201 = dtb_u_u199 in (match dtb_u_u201 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u202, dtb_u_u203, dtb_u_u204) -> (match dtb_u_u203 with
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u205, dtb_u_u206, dtb_u_u207) -> (match dtb_u_u205 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u208, dtb_u_u209) -> (match dtb_u_u209 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u210 = (v_safeBinder dtb_u_u208) in ((((v_runAction dtb_u_u197) (dtb_u_u198 - 1)) (Vuna_dIr_dModel.C_Ir_IrLet ((B_dData_dList.C_List__x58__x58_ (dtb_u_u210, B_dData_dList.C_List_Nil)), dtb_u_u204, (((v_substIr dtb_u_u208) (Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u210))) dtb_u_u207)))) dtb_u_u200))
  | _ -> (match (((v_matchBind dtb_u_u197) dtb_u_u198) dtb_u_u199) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u211) -> ((((v_runAction dtb_u_u197) (dtb_u_u198 - 1)) dtb_u_u211) dtb_u_u200)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCast (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u199)), dtb_u_u200))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> (match (((v_matchBind dtb_u_u197) dtb_u_u198) dtb_u_u199) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u212) -> ((((v_runAction dtb_u_u197) (dtb_u_u198 - 1)) dtb_u_u212) dtb_u_u200)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCast (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u199)), dtb_u_u200))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> (match (((v_matchBind dtb_u_u197) dtb_u_u198) dtb_u_u199) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u213) -> ((((v_runAction dtb_u_u197) (dtb_u_u198 - 1)) dtb_u_u213) dtb_u_u200)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCast (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u199)), dtb_u_u200))
  | _ -> failwith "DT: impossible branch"
)
)
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u214, dtb_u_u215, dtb_u_u216) -> (Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u214, dtb_u_u215, ((((v_runAction dtb_u_u197) (dtb_u_u198 - 1)) dtb_u_u216) dtb_u_u200)))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u217, dtb_u_u218, dtb_u_u219, dtb_u_u220) -> (Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u217, dtb_u_u218, dtb_u_u219, ((((v_runAlt dtb_u_u197) (dtb_u_u198 - 1)) dtb_u_u220) dtb_u_u200)))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb_u_u221, dtb_u_u222, dtb_u_u223) -> (Vuna_dIr_dModel.C_Ir_IrIf (dtb_u_u221, ((((v_runAction dtb_u_u197) (dtb_u_u198 - 1)) dtb_u_u222) dtb_u_u200), ((((v_runAction dtb_u_u197) (dtb_u_u198 - 1)) dtb_u_u223) dtb_u_u200)))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u224, dtb_u_u225, dtb_u_u226) -> (Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u224, dtb_u_u225, ((((v_runAction dtb_u_u197) (dtb_u_u198 - 1)) dtb_u_u226) dtb_u_u200)))
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u227, dtb_u_u228, dtb_u_u229, dtb_u_u230) -> (match dtb_u_u230 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u231, dtb_u_u232) -> (match dtb_u_u231 with
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u233, dtb_u_u234, dtb_u_u235) -> (match dtb_u_u233 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u236, dtb_u_u237) -> (match dtb_u_u237 with
  | B_dData_dList.C_List_Nil -> (match dtb_u_u232 with
  | B_dData_dList.C_List_Nil -> (if ((v_isEffThunk dtb_u_u227) dtb_u_u228) then (((v_substIr dtb_u_u236) dtb_u_u200) dtb_u_u235) else (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u199, dtb_u_u200)))
  | _ -> (match (((v_matchBind dtb_u_u197) dtb_u_u198) dtb_u_u199) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u238) -> ((((v_runAction dtb_u_u197) (dtb_u_u198 - 1)) dtb_u_u238) dtb_u_u200)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCast (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u199)), dtb_u_u200))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> (match (((v_matchBind dtb_u_u197) dtb_u_u198) dtb_u_u199) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u239) -> ((((v_runAction dtb_u_u197) (dtb_u_u198 - 1)) dtb_u_u239) dtb_u_u200)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCast (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u199)), dtb_u_u200))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> (match (((v_matchBind dtb_u_u197) dtb_u_u198) dtb_u_u199) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u240) -> ((((v_runAction dtb_u_u197) (dtb_u_u198 - 1)) dtb_u_u240) dtb_u_u200)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCast (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u199)), dtb_u_u200))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> (match (((v_matchBind dtb_u_u197) dtb_u_u198) dtb_u_u199) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u241) -> ((((v_runAction dtb_u_u197) (dtb_u_u198 - 1)) dtb_u_u241) dtb_u_u200)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCast (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u199)), dtb_u_u200))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> (match (((v_matchBind dtb_u_u197) dtb_u_u198) dtb_u_u199) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u242) -> ((((v_runAction dtb_u_u197) (dtb_u_u198 - 1)) dtb_u_u242) dtb_u_u200)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCast (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u199)), dtb_u_u200))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> (match (((v_matchBind dtb_u_u197) dtb_u_u198) dtb_u_u199) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u243) -> ((((v_runAction dtb_u_u197) (dtb_u_u198 - 1)) dtb_u_u243) dtb_u_u200)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrCast (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u199)), dtb_u_u200))
  | _ -> failwith "DT: impossible branch"
)
))))
# 225 "Vuna/Ir/Direct.vuna"
and v_runAlt = (fun (dtb_u_u244 : (string) -> int B_dData_dMaybe.t_Maybe) (dtb_u_u245 : int) (dtb_u_u246 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) (dtb_u_u247 : Vuna_dIr_dModel.t_Ir) -> (if (dtb_u_u245 <= 0) then dtb_u_u246 else (match dtb_u_u246 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u248, dtb_u_u249) -> (B_dData_dList.C_List__x58__x58_ ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb_u_u248).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb_u_u248).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((((v_runAction dtb_u_u244) (dtb_u_u245 - 1)) (dtb_u_u248).Vuna_dIr_dModel.f_IrAlt_irAltBody) dtb_u_u247) }, ((((v_runAlt dtb_u_u244) (dtb_u_u245 - 1)) dtb_u_u249) dtb_u_u247)))
  | _ -> failwith "DT: impossible branch"
)))
# 243 "Vuna/Ir/Direct.vuna"
and v_matchBind = (fun (dtb_u_u250 : (string) -> int B_dData_dMaybe.t_Maybe) (dtb_u_u251 : int) (dtb_u_u252 : Vuna_dIr_dModel.t_Ir) -> (if (dtb_u_u251 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u253 = dtb_u_u252 in (match dtb_u_u253 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u254, dtb_u_u255, dtb_u_u256) -> (match dtb_u_u255 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u257, dtb_u_u258, dtb_u_u259) -> (match dtb_u_u258 with
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u260, dtb_u_u261, dtb_u_u262) -> (match dtb_u_u260 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u263, dtb_u_u264) -> (match dtb_u_u264 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u265, dtb_u_u266) -> (match dtb_u_u266 with
  | B_dData_dList.C_List_Nil -> (match dtb_u_u262 with
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u267, dtb_u_u268, dtb_u_u269, dtb_u_u270) -> (match dtb_u_u270 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u271, dtb_u_u272) -> (match dtb_u_u271 with
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u273, dtb_u_u274, dtb_u_u275) -> (match dtb_u_u273 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u276, dtb_u_u277) -> (match dtb_u_u277 with
  | B_dData_dList.C_List_Nil -> (match dtb_u_u272 with
  | B_dData_dList.C_List_Nil -> (if ((v_isEffThunk dtb_u_u267) dtb_u_u268) then (let dtb_u_u278 = dtb_u_u275 in (match dtb_u_u278 with
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u279, dtb_u_u280, dtb_u_u281, dtb_u_u282) -> (match dtb_u_u281 with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u283) -> (match dtb_u_u282 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u284, dtb_u_u285) -> (match dtb_u_u285 with
  | B_dData_dList.C_List_Nil -> (if ((Vuna_dIr_dModel.v_sameBinderId dtb_u_u263) dtb_u_u283) then (let dtb_u_u286 = (Vuna_dIr_dModel.v_irAltBindersOf dtb_u_u284) in (match dtb_u_u286 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u287, dtb_u_u288) -> (match dtb_u_u288 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u289 = (Vuna_dIr_dModel.v_irAltBodyOf dtb_u_u284) in (match dtb_u_u289 with
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u290, dtb_u_u291, dtb_u_u292, dtb_u_u293) -> (match dtb_u_u292 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u294, dtb_u_u295, dtb_u_u296) -> (match dtb_u_u295 with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u297) -> (match dtb_u_u296 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u298, dtb_u_u299, dtb_u_u300) -> (match dtb_u_u299 with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u301) -> (match dtb_u_u300 with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u302) -> (match dtb_u_u293 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u303, dtb_u_u304) -> (match dtb_u_u304 with
  | B_dData_dList.C_List_Nil -> (if (if (if ((Vuna_dIr_dModel.v_sameBinderId dtb_u_u265) dtb_u_u297) then ((Vuna_dIr_dModel.v_sameBinderId dtb_u_u287) dtb_u_u301) else false) then ((Vuna_dIr_dModel.v_sameBinderId dtb_u_u276) dtb_u_u302) else false) then (let dtb_u_u305 = (Vuna_dIr_dModel.v_irAltBindersOf dtb_u_u303) in (match dtb_u_u305 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u306, dtb_u_u307) -> (match dtb_u_u307 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u308 = (Vuna_dIr_dModel.v_irAltBodyOf dtb_u_u303) in (match dtb_u_u308 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u309, dtb_u_u310, dtb_u_u311) -> (match dtb_u_u310 with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u312) -> (match dtb_u_u311 with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u313) -> (if (if ((Vuna_dIr_dModel.v_sameBinderId dtb_u_u306) dtb_u_u312) then ((Vuna_dIr_dModel.v_sameBinderId dtb_u_u276) dtb_u_u313) else false) then (B_dData_dMaybe.C_Maybe_Just (((((((((v_fuse dtb_u_u250) dtb_u_u251) dtb_u_u259) dtb_u_u256) dtb_u_u267) dtb_u_u268) dtb_u_u276) dtb_u_u287))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))
# 276 "Vuna/Ir/Direct.vuna"
and v_fuse = (fun (dtb_u_u314 : (string) -> int B_dData_dMaybe.t_Maybe) (dtb_u_u315 : int) (dtb_u_u316 : Vuna_dIr_dModel.t_Ir) (dtb_u_u317 : Vuna_dIr_dModel.t_Ir) (dtb_u_u318 : string) (dtb_u_u319 : string) (dtb_u_u320 : Vuna_dIr_dModel.t_IrBinder) (dtb_u_u321 : Vuna_dIr_dModel.t_IrBinder) -> (let dtb_u_u322 = (v_safeBinder dtb_u_u320) in (let dtb_u_u323 = (v_safeBinder dtb_u_u321) in (let dtb_u_u324 = ((v_applyCont dtb_u_u317) (Vuna_dIr_dModel.C_Ir_IrApp (B_dData_dMaybe.C_Maybe_Nothing, (Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u323)), (Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u322))))) in (let dtb_u_u325 = ((((v_runAction dtb_u_u314) (dtb_u_u315 - 1)) dtb_u_u324) (Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u322))) in (let dtb_u_u326 = (match (v_effFieldOf dtb_u_u316) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u327) -> (Vuna_dIr_dModel.C_Ir_IrLet ((B_dData_dList.C_List__x58__x58_ (dtb_u_u323, B_dData_dList.C_List_Nil)), dtb_u_u327, dtb_u_u325))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrCase (B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u316, (B_dData_dList.C_List__x58__x58_ ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.v_irEffTypeName; B_dData_dPair.f_Pair_second = Vuna_dIr_dModel.v_irEffMkCtor })); Vuna_dIr_dModel.f_IrAlt_irAltBinders = (B_dData_dList.C_List__x58__x58_ (dtb_u_u323, B_dData_dList.C_List_Nil)); Vuna_dIr_dModel.f_IrAlt_irAltBody = dtb_u_u325 }, B_dData_dList.C_List_Nil))))
  | _ -> failwith "DT: impossible branch"
) in (Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u318, dtb_u_u319, B_dData_dMaybe.C_Maybe_Nothing, (B_dData_dList.C_List__x58__x58_ ((Vuna_dIr_dModel.C_Ir_IrLam ((B_dData_dList.C_List__x58__x58_ (dtb_u_u322, B_dData_dList.C_List_Nil)), B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u326)), B_dData_dList.C_List_Nil))))))))))

# 292 "Vuna/Ir/Direct.vuna"
let rec v_directIr = (fun (dtb_u_u328 : (string) -> int B_dData_dMaybe.t_Maybe) (dtb_u_u329 : int) (dtb_u_u330 : Vuna_dIr_dModel.t_Ir) -> (if (dtb_u_u329 <= 0) then dtb_u_u330 else (match (((v_matchBind dtb_u_u328) dtb_u_u329) dtb_u_u330) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u331) -> (((v_directIr dtb_u_u328) (dtb_u_u329 - 1)) dtb_u_u331)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u332 = (((v_directChildren dtb_u_u328) (dtb_u_u329 - 1)) dtb_u_u330) in dtb_u_u332)
  | _ -> failwith "DT: impossible branch"
)))
# 304 "Vuna/Ir/Direct.vuna"
and v_directChildren = (fun (dtb_u_u333 : (string) -> int B_dData_dMaybe.t_Maybe) (dtb_u_u334 : int) (dtb_u_u335 : Vuna_dIr_dModel.t_Ir) -> (if (dtb_u_u334 <= 0) then dtb_u_u335 else (match dtb_u_u335 with
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u336, dtb_u_u337, dtb_u_u338, dtb_u_u339) -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u336, dtb_u_u337, dtb_u_u338, (((v_directList dtb_u_u333) (dtb_u_u334 - 1)) dtb_u_u339)))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u340, dtb_u_u341, dtb_u_u342) -> (Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u340, dtb_u_u341, (((v_directFields dtb_u_u333) (dtb_u_u334 - 1)) dtb_u_u342)))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb_u_u343, dtb_u_u344, dtb_u_u345, dtb_u_u346) -> (Vuna_dIr_dModel.C_Ir_IrProj ((((v_directIr dtb_u_u333) (dtb_u_u334 - 1)) dtb_u_u343), dtb_u_u344, dtb_u_u345, dtb_u_u346))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb_u_u347, dtb_u_u348, dtb_u_u349, dtb_u_u350) -> (Vuna_dIr_dModel.C_Ir_IrRecUpd ((((v_directIr dtb_u_u333) (dtb_u_u334 - 1)) dtb_u_u347), dtb_u_u348, (((v_directFields dtb_u_u333) (dtb_u_u334 - 1)) dtb_u_u349), dtb_u_u350))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u351, dtb_u_u352) -> (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u351, (((v_directList dtb_u_u333) (dtb_u_u334 - 1)) dtb_u_u352)))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u353, dtb_u_u354, dtb_u_u355) -> (Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u353, dtb_u_u354, (((v_directIr dtb_u_u333) (dtb_u_u334 - 1)) dtb_u_u355)))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u356, dtb_u_u357, dtb_u_u358) -> (Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u356, (((v_directIr dtb_u_u333) (dtb_u_u334 - 1)) dtb_u_u357), (((v_directIr dtb_u_u333) (dtb_u_u334 - 1)) dtb_u_u358)))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u359, dtb_u_u360, dtb_u_u361) -> (Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u359, dtb_u_u360, (((v_directIr dtb_u_u333) (dtb_u_u334 - 1)) dtb_u_u361)))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u362, dtb_u_u363, dtb_u_u364) -> (Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u362, (((v_directIr dtb_u_u333) (dtb_u_u334 - 1)) dtb_u_u363), (((v_directIr dtb_u_u333) (dtb_u_u334 - 1)) dtb_u_u364)))
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb_u_u365) -> (Vuna_dIr_dModel.C_Ir_IrTail ((((v_directIr dtb_u_u333) (dtb_u_u334 - 1)) dtb_u_u365)))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb_u_u366, dtb_u_u367, dtb_u_u368) -> (Vuna_dIr_dModel.C_Ir_IrIf ((((v_directIr dtb_u_u333) (dtb_u_u334 - 1)) dtb_u_u366), (((v_directIr dtb_u_u333) (dtb_u_u334 - 1)) dtb_u_u367), (((v_directIr dtb_u_u333) (dtb_u_u334 - 1)) dtb_u_u368)))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u369, dtb_u_u370, dtb_u_u371, dtb_u_u372) -> (Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u369, dtb_u_u370, (((v_directIr dtb_u_u333) (dtb_u_u334 - 1)) dtb_u_u371), (((v_directAlts dtb_u_u333) (dtb_u_u334 - 1)) dtb_u_u372)))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb_u_u373, dtb_u_u374, dtb_u_u375, dtb_u_u376, dtb_u_u377) -> (Vuna_dIr_dModel.C_Ir_IrNatCase ((((v_directIr dtb_u_u333) (dtb_u_u334 - 1)) dtb_u_u373), dtb_u_u374, (((v_directAltM dtb_u_u333) (dtb_u_u334 - 1)) dtb_u_u375), (((v_directAltM dtb_u_u333) (dtb_u_u334 - 1)) dtb_u_u376), (((v_directAltM dtb_u_u333) (dtb_u_u334 - 1)) dtb_u_u377)))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb_u_u378) -> (Vuna_dIr_dModel.C_Ir_IrConcatMany ((((v_directList dtb_u_u333) (dtb_u_u334 - 1)) dtb_u_u378)))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb_u_u379, dtb_u_u380, dtb_u_u381, dtb_u_u382, dtb_u_u383) -> (Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb_u_u379, dtb_u_u380, dtb_u_u381, dtb_u_u382, (((v_directIr dtb_u_u333) (dtb_u_u334 - 1)) dtb_u_u383)))
  | _ -> dtb_u_u335
)))
# 327 "Vuna/Ir/Direct.vuna"
and v_directList = (fun (dtb_u_u384 : (string) -> int B_dData_dMaybe.t_Maybe) (dtb_u_u385 : int) (dtb_u_u386 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (dtb_u_u385 <= 0) then dtb_u_u386 else (match dtb_u_u386 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u387, dtb_u_u388) -> (B_dData_dList.C_List__x58__x58_ ((((v_directIr dtb_u_u384) (dtb_u_u385 - 1)) dtb_u_u387), (((v_directList dtb_u_u384) (dtb_u_u385 - 1)) dtb_u_u388)))
  | _ -> failwith "DT: impossible branch"
)))
# 336 "Vuna/Ir/Direct.vuna"
and v_directFields = (fun (dtb_u_u389 : (string) -> int B_dData_dMaybe.t_Maybe) (dtb_u_u390 : int) (dtb_u_u391 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u390 <= 0) then dtb_u_u391 else (match dtb_u_u391 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u392, dtb_u_u393) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u392); B_dData_dPair.f_Pair_second = (((v_directIr dtb_u_u389) (dtb_u_u390 - 1)) (B_dData_dPair.v_secondOf dtb_u_u392)) }, (((v_directFields dtb_u_u389) (dtb_u_u390 - 1)) dtb_u_u393)))
  | _ -> failwith "DT: impossible branch"
)))
# 345 "Vuna/Ir/Direct.vuna"
and v_directAlts = (fun (dtb_u_u394 : (string) -> int B_dData_dMaybe.t_Maybe) (dtb_u_u395 : int) (dtb_u_u396 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (if (dtb_u_u395 <= 0) then dtb_u_u396 else (match dtb_u_u396 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u397, dtb_u_u398) -> (B_dData_dList.C_List__x58__x58_ ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb_u_u397).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb_u_u397).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = (((v_directIr dtb_u_u394) (dtb_u_u395 - 1)) (dtb_u_u397).Vuna_dIr_dModel.f_IrAlt_irAltBody) }, (((v_directAlts dtb_u_u394) (dtb_u_u395 - 1)) dtb_u_u398)))
  | _ -> failwith "DT: impossible branch"
)))
# 354 "Vuna/Ir/Direct.vuna"
and v_directAltM = (fun (dtb_u_u399 : (string) -> int B_dData_dMaybe.t_Maybe) (dtb_u_u400 : int) (dtb_u_u401 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (if (dtb_u_u400 <= 0) then dtb_u_u401 else (match dtb_u_u401 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u402) -> (B_dData_dMaybe.C_Maybe_Just ({ Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb_u_u402).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb_u_u402).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = (((v_directIr dtb_u_u399) (dtb_u_u400 - 1)) (dtb_u_u402).Vuna_dIr_dModel.f_IrAlt_irAltBody) }))
  | _ -> failwith "DT: impossible branch"
)))

# 396 "Vuna/Ir/Direct.vuna"
let rec v_renameAll = (fun (dtb_u_u403 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u404 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u405 : Vuna_dIr_dModel.t_Ir) -> (match dtb_u_u403 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u406, dtb_u_u407) -> (match dtb_u_u404 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u408, dtb_u_u409) -> (((v_renameAll dtb_u_u407) dtb_u_u409) (((v_substIr dtb_u_u406) (Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u408))) dtb_u_u405))
  | _ -> dtb_u_u405
)
  | B_dData_dList.C_List_Nil -> dtb_u_u405
  | _ -> failwith "DT: impossible branch"
))

# 366 "Vuna/Ir/Direct.vuna"
let rec v_safeIr = (fun (dtb_u_u410 : int) (dtb_u_u411 : Vuna_dIr_dModel.t_Ir) -> (if (dtb_u_u410 <= 0) then dtb_u_u411 else (match dtb_u_u411 with
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u412, dtb_u_u413, dtb_u_u414) -> (let dtb_u_u415 = ((B_dData_dList.v_map v_safeBinder) dtb_u_u412) in (let dtb_u_u416 = (((v_renameAll dtb_u_u412) dtb_u_u415) dtb_u_u414) in (Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u415, dtb_u_u413, ((v_safeIr (dtb_u_u410 - 1)) dtb_u_u416)))))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u417, dtb_u_u418, dtb_u_u419) -> (let dtb_u_u420 = ((B_dData_dList.v_map v_safeBinder) dtb_u_u417) in (let dtb_u_u421 = (((v_renameAll dtb_u_u417) dtb_u_u420) dtb_u_u419) in (Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u420, ((v_safeIr (dtb_u_u410 - 1)) dtb_u_u418), ((v_safeIr (dtb_u_u410 - 1)) dtb_u_u421)))))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u422, dtb_u_u423, dtb_u_u424, dtb_u_u425) -> (Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u422, dtb_u_u423, ((v_safeIr (dtb_u_u410 - 1)) dtb_u_u424), ((v_safeAlts (dtb_u_u410 - 1)) dtb_u_u425)))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb_u_u426, dtb_u_u427, dtb_u_u428, dtb_u_u429, dtb_u_u430) -> (Vuna_dIr_dModel.C_Ir_IrNatCase (((v_safeIr (dtb_u_u410 - 1)) dtb_u_u426), dtb_u_u427, ((v_safeAltM (dtb_u_u410 - 1)) dtb_u_u428), ((v_safeAltM (dtb_u_u410 - 1)) dtb_u_u429), ((v_safeAltM (dtb_u_u410 - 1)) dtb_u_u430)))
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u431, dtb_u_u432, dtb_u_u433, dtb_u_u434) -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u431, dtb_u_u432, dtb_u_u433, ((v_safeList (dtb_u_u410 - 1)) dtb_u_u434)))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u435, dtb_u_u436, dtb_u_u437) -> (Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u435, dtb_u_u436, ((v_safeFields (dtb_u_u410 - 1)) dtb_u_u437)))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb_u_u438, dtb_u_u439, dtb_u_u440, dtb_u_u441) -> (Vuna_dIr_dModel.C_Ir_IrProj (((v_safeIr (dtb_u_u410 - 1)) dtb_u_u438), dtb_u_u439, dtb_u_u440, dtb_u_u441))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb_u_u442, dtb_u_u443, dtb_u_u444, dtb_u_u445) -> (Vuna_dIr_dModel.C_Ir_IrRecUpd (((v_safeIr (dtb_u_u410 - 1)) dtb_u_u442), dtb_u_u443, ((v_safeFields (dtb_u_u410 - 1)) dtb_u_u444), dtb_u_u445))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u446, dtb_u_u447, dtb_u_u448) -> (Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u446, dtb_u_u447, ((v_safeIr (dtb_u_u410 - 1)) dtb_u_u448)))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u449, dtb_u_u450, dtb_u_u451) -> (Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u449, ((v_safeIr (dtb_u_u410 - 1)) dtb_u_u450), ((v_safeIr (dtb_u_u410 - 1)) dtb_u_u451)))
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb_u_u452) -> (Vuna_dIr_dModel.C_Ir_IrTail (((v_safeIr (dtb_u_u410 - 1)) dtb_u_u452)))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb_u_u453, dtb_u_u454, dtb_u_u455) -> (Vuna_dIr_dModel.C_Ir_IrIf (((v_safeIr (dtb_u_u410 - 1)) dtb_u_u453), ((v_safeIr (dtb_u_u410 - 1)) dtb_u_u454), ((v_safeIr (dtb_u_u410 - 1)) dtb_u_u455)))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb_u_u456) -> (Vuna_dIr_dModel.C_Ir_IrConcatMany (((v_safeList (dtb_u_u410 - 1)) dtb_u_u456)))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb_u_u457, dtb_u_u458, dtb_u_u459, dtb_u_u460, dtb_u_u461) -> (Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb_u_u457, dtb_u_u458, dtb_u_u459, dtb_u_u460, ((v_safeIr (dtb_u_u410 - 1)) dtb_u_u461)))
  | _ -> dtb_u_u411
)))
# 401 "Vuna/Ir/Direct.vuna"
and v_safeList = (fun (dtb_u_u462 : int) (dtb_u_u463 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (dtb_u_u462 <= 0) then dtb_u_u463 else (match dtb_u_u463 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u464, dtb_u_u465) -> (B_dData_dList.C_List__x58__x58_ (((v_safeIr (dtb_u_u462 - 1)) dtb_u_u464), ((v_safeList (dtb_u_u462 - 1)) dtb_u_u465)))
  | _ -> failwith "DT: impossible branch"
)))
# 410 "Vuna/Ir/Direct.vuna"
and v_safeFields = (fun (dtb_u_u466 : int) (dtb_u_u467 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u466 <= 0) then dtb_u_u467 else (match dtb_u_u467 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u468, dtb_u_u469) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u468); B_dData_dPair.f_Pair_second = ((v_safeIr (dtb_u_u466 - 1)) (B_dData_dPair.v_secondOf dtb_u_u468)) }, ((v_safeFields (dtb_u_u466 - 1)) dtb_u_u469)))
  | _ -> failwith "DT: impossible branch"
)))
# 419 "Vuna/Ir/Direct.vuna"
and v_safeAlts = (fun (dtb_u_u470 : int) (dtb_u_u471 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (if (dtb_u_u470 <= 0) then dtb_u_u471 else (match dtb_u_u471 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u472, dtb_u_u473) -> (B_dData_dList.C_List__x58__x58_ (((v_safeAlt (dtb_u_u470 - 1)) dtb_u_u472), ((v_safeAlts (dtb_u_u470 - 1)) dtb_u_u473)))
  | _ -> failwith "DT: impossible branch"
)))
# 428 "Vuna/Ir/Direct.vuna"
and v_safeAltM = (fun (dtb_u_u474 : int) (dtb_u_u475 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (if (dtb_u_u474 <= 0) then dtb_u_u475 else (match dtb_u_u475 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u476) -> (B_dData_dMaybe.C_Maybe_Just (((v_safeAlt (dtb_u_u474 - 1)) dtb_u_u476)))
  | _ -> failwith "DT: impossible branch"
)))
# 437 "Vuna/Ir/Direct.vuna"
and v_safeAlt = (fun (dtb_u_u477 : int) (dtb_u_u478 : Vuna_dIr_dModel.t_IrAlt) -> (let dtb_u_u479 = (dtb_u_u478).Vuna_dIr_dModel.f_IrAlt_irAltBinders in (let dtb_u_u480 = ((B_dData_dList.v_map v_safeBinder) dtb_u_u479) in (let dtb_u_u481 = (((v_renameAll dtb_u_u479) dtb_u_u480) (dtb_u_u478).Vuna_dIr_dModel.f_IrAlt_irAltBody) in { Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb_u_u478).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = dtb_u_u480; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((v_safeIr (dtb_u_u477 - 1)) dtb_u_u481) }))))

# 448 "Vuna/Ir/Direct.vuna"
let v_directDef = (fun (dtb_u_u482 : (string) -> int B_dData_dMaybe.t_Maybe) (dtb_u_u483 : Vuna_dIr_dModel.t_IrDef) -> (match dtb_u_u483 with
  | Vuna_dIr_dModel.C_IrDef_IrDef (dtb_u_u484, dtb_u_u485, dtb_u_u486, dtb_u_u487, dtb_u_u488, dtb_u_u489, dtb_u_u490, dtb_u_u491) -> (let dtb_u_u492 = (((v_directIr dtb_u_u482) (128 + (8 * (Vuna_dIr_dModel.v_irSize dtb_u_u488)))) dtb_u_u488) in (Vuna_dIr_dModel.C_IrDef_IrDef (dtb_u_u484, dtb_u_u485, dtb_u_u486, dtb_u_u487, ((v_safeIr (256 + (8 * (Vuna_dIr_dModel.v_irSize dtb_u_u492)))) dtb_u_u492), dtb_u_u489, dtb_u_u490, dtb_u_u491)))
  | _ -> dtb_u_u483
))

# 455 "Vuna/Ir/Direct.vuna"
let v_directGroup = (fun (dtb_u_u493 : (string) -> int B_dData_dMaybe.t_Maybe) (dtb_u_u494 : Vuna_dIr_dModel.t_IrGroup) -> { Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = (dtb_u_u494).Vuna_dIr_dModel.f_IrGroup_irGroupIsRec; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = ((B_dData_dList.v_map (v_directDef dtb_u_u493)) (dtb_u_u494).Vuna_dIr_dModel.f_IrGroup_irGroupDefs) })

# 458 "Vuna/Ir/Direct.vuna"
let v_directUnit = (fun (dtb_u_u495 : (string) -> int B_dData_dMaybe.t_Maybe) (dtb_u_u496 : Vuna_dIr_dModel.t_IrUnit) -> { Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls = (dtb_u_u496).Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls; Vuna_dIr_dModel.f_IrUnit_irUnitGroups = ((B_dData_dList.v_map (v_directGroup dtb_u_u495)) (dtb_u_u496).Vuna_dIr_dModel.f_IrUnit_irUnitGroups); Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily = (dtb_u_u496).Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily; Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs = (dtb_u_u496).Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs; Vuna_dIr_dModel.f_IrUnit_irUnitEntry = (dtb_u_u496).Vuna_dIr_dModel.f_IrUnit_irUnitEntry })
