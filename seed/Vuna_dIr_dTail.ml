open Vuna_runtime
# 25 "Vuna/Ir/Tail.vuna"
let v_addDef = (fun (dtb_u_u1 : (string, int) B_dContainer_dHashMap.t_HashMap) (dtb_u_u2 : Vuna_dIr_dModel.t_IrDef) -> (match dtb_u_u2 with
  | Vuna_dIr_dModel.C_IrDef_IrExternDef (dtb_u_u3, dtb_u_u4, dtb_u_u5, dtb_u_u6) -> dtb_u_u1
  | Vuna_dIr_dModel.C_IrDef_IrDef (dtb_u_u7, dtb_u_u8, dtb_u_u9, dtb_u_u10, dtb_u_u11, dtb_u_u12, dtb_u_u13, dtb_u_u14) -> (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u7) dtb_u_u8) dtb_u_u1)
  | _ -> failwith "DT: impossible branch"
))

# 22 "Vuna/Ir/Tail.vuna"
let v_arityTableOf = (fun (dtb_u_u15 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (((B_dData_dList.v_foldl v_addDef) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) dtb_u_u15))

# 29 "Vuna/Ir/Tail.vuna"
let v_arityOfTable = (fun (dtb_u_u16 : (string, int) B_dContainer_dHashMap.t_HashMap) (dtb_u_u17 : string) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u17) dtb_u_u16))

# 32 "Vuna/Ir/Tail.vuna"
let v_tailFuelOf = (fun (dtb_u_u18 : Vuna_dIr_dModel.t_Ir) -> (64 + (16 * (Vuna_dIr_dModel.v_irSize dtb_u_u18))))

# 59 "Vuna/Ir/Tail.vuna"
let rec v_stripTailAt = (fun (dtb_u_u19 : int) (dtb_u_u20 : Vuna_dIr_dModel.t_Ir) -> (if (dtb_u_u19 <= 0) then dtb_u_u20 else (match dtb_u_u20 with
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb_u_u21) -> ((v_stripTailAt (dtb_u_u19 - 1)) dtb_u_u21)
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u22) -> dtb_u_u20
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u23) -> dtb_u_u20
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u24, dtb_u_u25, dtb_u_u26, dtb_u_u27) -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u24, dtb_u_u25, dtb_u_u26, ((B_dData_dList.v_map (v_stripTailAt (dtb_u_u19 - 1))) dtb_u_u27)))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u28, dtb_u_u29, dtb_u_u30) -> (Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u28, dtb_u_u29, ((B_dData_dList.v_map (v_stripField (dtb_u_u19 - 1))) dtb_u_u30)))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb_u_u31, dtb_u_u32, dtb_u_u33, dtb_u_u34) -> (Vuna_dIr_dModel.C_Ir_IrProj (((v_stripTailAt (dtb_u_u19 - 1)) dtb_u_u31), dtb_u_u32, dtb_u_u33, dtb_u_u34))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb_u_u35, dtb_u_u36, dtb_u_u37, dtb_u_u38) -> (Vuna_dIr_dModel.C_Ir_IrRecUpd (((v_stripTailAt (dtb_u_u19 - 1)) dtb_u_u35), dtb_u_u36, ((B_dData_dList.v_map (v_stripField (dtb_u_u19 - 1))) dtb_u_u37), dtb_u_u38))
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb_u_u39) -> dtb_u_u20
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u40, dtb_u_u41) -> (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u40, ((B_dData_dList.v_map (v_stripTailAt (dtb_u_u19 - 1))) dtb_u_u41)))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u42, dtb_u_u43, dtb_u_u44) -> (Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u42, dtb_u_u43, ((v_stripTailAt (dtb_u_u19 - 1)) dtb_u_u44)))
  | Vuna_dIr_dModel.C_Ir_IrInt (dtb_u_u45) -> dtb_u_u20
  | Vuna_dIr_dModel.C_Ir_IrStr (dtb_u_u46) -> dtb_u_u20
  | Vuna_dIr_dModel.C_Ir_IrBool (dtb_u_u47) -> dtb_u_u20
  | Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb_u_u48) -> dtb_u_u20
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u49, dtb_u_u50, dtb_u_u51) -> (Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u49, ((v_stripTailAt (dtb_u_u19 - 1)) dtb_u_u50), ((v_stripTailAt (dtb_u_u19 - 1)) dtb_u_u51)))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u52, dtb_u_u53, dtb_u_u54) -> (Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u52, dtb_u_u53, ((v_stripTailAt (dtb_u_u19 - 1)) dtb_u_u54)))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u55, dtb_u_u56, dtb_u_u57) -> (Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u55, ((v_stripTailAt (dtb_u_u19 - 1)) dtb_u_u56), ((v_stripTailAt (dtb_u_u19 - 1)) dtb_u_u57)))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb_u_u58, dtb_u_u59, dtb_u_u60) -> (Vuna_dIr_dModel.C_Ir_IrIf (((v_stripTailAt (dtb_u_u19 - 1)) dtb_u_u58), ((v_stripTailAt (dtb_u_u19 - 1)) dtb_u_u59), ((v_stripTailAt (dtb_u_u19 - 1)) dtb_u_u60)))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u61, dtb_u_u62, dtb_u_u63, dtb_u_u64) -> (Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u61, dtb_u_u62, ((v_stripTailAt (dtb_u_u19 - 1)) dtb_u_u63), ((B_dData_dList.v_map (v_stripAlt (dtb_u_u19 - 1))) dtb_u_u64)))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb_u_u65, dtb_u_u66, dtb_u_u67, dtb_u_u68, dtb_u_u69) -> (Vuna_dIr_dModel.C_Ir_IrNatCase (((v_stripTailAt (dtb_u_u19 - 1)) dtb_u_u65), dtb_u_u66, ((v_stripAltM (dtb_u_u19 - 1)) dtb_u_u67), ((v_stripAltM (dtb_u_u19 - 1)) dtb_u_u68), ((v_stripAltM (dtb_u_u19 - 1)) dtb_u_u69)))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb_u_u70) -> (Vuna_dIr_dModel.C_Ir_IrConcatMany (((B_dData_dList.v_map (v_stripTailAt (dtb_u_u19 - 1))) dtb_u_u70)))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb_u_u71, dtb_u_u72, dtb_u_u73, dtb_u_u74, dtb_u_u75) -> (Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb_u_u71, dtb_u_u72, dtb_u_u73, dtb_u_u74, ((v_stripTailAt (dtb_u_u19 - 1)) dtb_u_u75)))
  | Vuna_dIr_dModel.C_Ir_IrEffBind (dtb_u_u76, dtb_u_u77, dtb_u_u78) -> dtb_u_u20
  | _ -> failwith "DT: impossible branch"
)))
# 89 "Vuna/Ir/Tail.vuna"
and v_stripField = (fun (dtb_u_u79 : int) (dtb_u_u80 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u80); B_dData_dPair.f_Pair_second = ((v_stripTailAt dtb_u_u79) (B_dData_dPair.v_secondOf dtb_u_u80)) })
# 92 "Vuna/Ir/Tail.vuna"
and v_stripAlt = (fun (dtb_u_u81 : int) (dtb_u_u82 : Vuna_dIr_dModel.t_IrAlt) -> { Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb_u_u82).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb_u_u82).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((v_stripTailAt dtb_u_u81) (dtb_u_u82).Vuna_dIr_dModel.f_IrAlt_irAltBody) })
# 95 "Vuna/Ir/Tail.vuna"
and v_stripAltM = (fun (dtb_u_u83 : int) (dtb_u_u84 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match dtb_u_u84 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u85) -> (B_dData_dMaybe.C_Maybe_Just (((v_stripAlt dtb_u_u83) dtb_u_u85)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Ir/Tail.vuna"
let v_stripTail = (fun (dtb_u_u86 : Vuna_dIr_dModel.t_Ir) -> ((v_stripTailAt (v_tailFuelOf dtb_u_u86)) dtb_u_u86))

# 99 "Vuna/Ir/Tail.vuna"
let rec v_annotateAt = (fun (dtb_u_u87 : int) (dtb_u_u88 : (string) -> int B_dData_dMaybe.t_Maybe) (dtb_u_u89 : bool) (dtb_u_u90 : Vuna_dIr_dModel.t_Ir) -> (if (dtb_u_u87 <= 0) then dtb_u_u90 else (match dtb_u_u90 with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u91) -> dtb_u_u90
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u92) -> (if dtb_u_u89 then (let dtb_u_u93 = (dtb_u_u88 dtb_u_u92) in (match dtb_u_u93 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u94) -> (if (dtb_u_u94 = 0) then (Vuna_dIr_dModel.C_Ir_IrTail ((Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u92)))) else (Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u92)))
  | _ -> (Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u92))
)) else (Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u92)))
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u95, dtb_u_u96, dtb_u_u97, dtb_u_u98) -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u95, dtb_u_u96, dtb_u_u97, ((B_dData_dList.v_map (((v_annotateAt (dtb_u_u87 - 1)) dtb_u_u88) false)) dtb_u_u98)))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u99, dtb_u_u100, dtb_u_u101) -> (Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u99, dtb_u_u100, ((B_dData_dList.v_map ((v_annotateField (dtb_u_u87 - 1)) dtb_u_u88)) dtb_u_u101)))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb_u_u102, dtb_u_u103, dtb_u_u104, dtb_u_u105) -> (Vuna_dIr_dModel.C_Ir_IrProj (((((v_annotateAt (dtb_u_u87 - 1)) dtb_u_u88) false) dtb_u_u102), dtb_u_u103, dtb_u_u104, dtb_u_u105))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb_u_u106, dtb_u_u107, dtb_u_u108, dtb_u_u109) -> (Vuna_dIr_dModel.C_Ir_IrRecUpd (((((v_annotateAt (dtb_u_u87 - 1)) dtb_u_u88) false) dtb_u_u106), dtb_u_u107, ((B_dData_dList.v_map ((v_annotateField (dtb_u_u87 - 1)) dtb_u_u88)) dtb_u_u108), dtb_u_u109))
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb_u_u110) -> (if dtb_u_u89 then (Vuna_dIr_dModel.C_Ir_IrTail ((Vuna_dIr_dModel.C_Ir_IrRt (dtb_u_u110)))) else (Vuna_dIr_dModel.C_Ir_IrRt (dtb_u_u110)))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u111, dtb_u_u112) -> (let dtb_u_u113 = ((B_dData_dList.v_map (((v_annotateAt (dtb_u_u87 - 1)) dtb_u_u88) false)) dtb_u_u112) in (if dtb_u_u89 then (Vuna_dIr_dModel.C_Ir_IrTail ((Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u111, dtb_u_u113)))) else (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u111, dtb_u_u113))))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u114, dtb_u_u115, dtb_u_u116) -> (Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u114, dtb_u_u115, ((((v_annotateAt (dtb_u_u87 - 1)) dtb_u_u88) dtb_u_u89) dtb_u_u116)))
  | Vuna_dIr_dModel.C_Ir_IrInt (dtb_u_u117) -> dtb_u_u90
  | Vuna_dIr_dModel.C_Ir_IrStr (dtb_u_u118) -> dtb_u_u90
  | Vuna_dIr_dModel.C_Ir_IrBool (dtb_u_u119) -> dtb_u_u90
  | Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb_u_u120) -> dtb_u_u90
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u121, dtb_u_u122, dtb_u_u123) -> (Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u121, ((((v_annotateAt (dtb_u_u87 - 1)) dtb_u_u88) false) dtb_u_u122), ((((v_annotateAt (dtb_u_u87 - 1)) dtb_u_u88) dtb_u_u89) dtb_u_u123)))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u124, dtb_u_u125, dtb_u_u126) -> (Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u124, dtb_u_u125, ((((v_annotateAt (dtb_u_u87 - 1)) dtb_u_u88) true) dtb_u_u126)))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u127, dtb_u_u128, dtb_u_u129) -> (let dtb_u_u130 = ((((v_annotateAt (dtb_u_u87 - 1)) dtb_u_u88) false) dtb_u_u128) in (let dtb_u_u131 = ((((v_annotateAt (dtb_u_u87 - 1)) dtb_u_u88) false) dtb_u_u129) in (if dtb_u_u89 then (Vuna_dIr_dModel.C_Ir_IrTail ((Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u127, dtb_u_u130, dtb_u_u131)))) else (Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u127, dtb_u_u130, dtb_u_u131)))))
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb_u_u132) -> (Vuna_dIr_dModel.C_Ir_IrTail (((((v_annotateAt (dtb_u_u87 - 1)) dtb_u_u88) false) dtb_u_u132)))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb_u_u133, dtb_u_u134, dtb_u_u135) -> (Vuna_dIr_dModel.C_Ir_IrIf (((((v_annotateAt (dtb_u_u87 - 1)) dtb_u_u88) false) dtb_u_u133), ((((v_annotateAt (dtb_u_u87 - 1)) dtb_u_u88) dtb_u_u89) dtb_u_u134), ((((v_annotateAt (dtb_u_u87 - 1)) dtb_u_u88) dtb_u_u89) dtb_u_u135)))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u136, dtb_u_u137, dtb_u_u138, dtb_u_u139) -> (Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u136, dtb_u_u137, ((((v_annotateAt (dtb_u_u87 - 1)) dtb_u_u88) false) dtb_u_u138), ((B_dData_dList.v_map (((v_annotateAlt (dtb_u_u87 - 1)) dtb_u_u88) dtb_u_u89)) dtb_u_u139)))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb_u_u140, dtb_u_u141, dtb_u_u142, dtb_u_u143, dtb_u_u144) -> (Vuna_dIr_dModel.C_Ir_IrNatCase (((((v_annotateAt (dtb_u_u87 - 1)) dtb_u_u88) false) dtb_u_u140), dtb_u_u141, ((((v_annotateAltMaybe (dtb_u_u87 - 1)) dtb_u_u88) dtb_u_u89) dtb_u_u142), ((((v_annotateAltMaybe (dtb_u_u87 - 1)) dtb_u_u88) dtb_u_u89) dtb_u_u143), ((((v_annotateAltMaybe (dtb_u_u87 - 1)) dtb_u_u88) dtb_u_u89) dtb_u_u144)))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb_u_u145) -> (Vuna_dIr_dModel.C_Ir_IrConcatMany (((B_dData_dList.v_map (((v_annotateAt (dtb_u_u87 - 1)) dtb_u_u88) false)) dtb_u_u145)))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb_u_u146, dtb_u_u147, dtb_u_u148, dtb_u_u149, dtb_u_u150) -> (Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb_u_u146, dtb_u_u147, dtb_u_u148, dtb_u_u149, ((((v_annotateAt (dtb_u_u87 - 1)) dtb_u_u88) false) dtb_u_u150)))
  | Vuna_dIr_dModel.C_Ir_IrEffBind (dtb_u_u151, dtb_u_u152, dtb_u_u153) -> dtb_u_u90
  | _ -> failwith "DT: impossible branch"
)))
# 142 "Vuna/Ir/Tail.vuna"
and v_annotateField = (fun (dtb_u_u154 : int) (dtb_u_u155 : (string) -> int B_dData_dMaybe.t_Maybe) (dtb_u_u156 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u156); B_dData_dPair.f_Pair_second = ((((v_annotateAt dtb_u_u154) dtb_u_u155) false) (B_dData_dPair.v_secondOf dtb_u_u156)) })
# 145 "Vuna/Ir/Tail.vuna"
and v_annotateAlt = (fun (dtb_u_u157 : int) (dtb_u_u158 : (string) -> int B_dData_dMaybe.t_Maybe) (dtb_u_u159 : bool) (dtb_u_u160 : Vuna_dIr_dModel.t_IrAlt) -> { Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb_u_u160).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb_u_u160).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((((v_annotateAt dtb_u_u157) dtb_u_u158) dtb_u_u159) (dtb_u_u160).Vuna_dIr_dModel.f_IrAlt_irAltBody) })
# 149 "Vuna/Ir/Tail.vuna"
and v_annotateAltMaybe = (fun (dtb_u_u161 : int) (dtb_u_u162 : (string) -> int B_dData_dMaybe.t_Maybe) (dtb_u_u163 : bool) (dtb_u_u164 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match dtb_u_u164 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u165) -> (B_dData_dMaybe.C_Maybe_Just (((((v_annotateAlt dtb_u_u161) dtb_u_u162) dtb_u_u163) dtb_u_u165)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Ir/Tail.vuna"
let v_annotateDef = (fun (dtb_u_u166 : (string) -> int B_dData_dMaybe.t_Maybe) (dtb_u_u167 : Vuna_dIr_dModel.t_IrDef) -> (match dtb_u_u167 with
  | Vuna_dIr_dModel.C_IrDef_IrExternDef (dtb_u_u168, dtb_u_u169, dtb_u_u170, dtb_u_u171) -> dtb_u_u167
  | Vuna_dIr_dModel.C_IrDef_IrDef (dtb_u_u172, dtb_u_u173, dtb_u_u174, dtb_u_u175, dtb_u_u176, dtb_u_u177, dtb_u_u178, dtb_u_u179) -> (Vuna_dIr_dModel.C_IrDef_IrDef (dtb_u_u172, dtb_u_u173, dtb_u_u174, dtb_u_u175, ((((v_annotateAt (v_tailFuelOf dtb_u_u176)) dtb_u_u166) true) dtb_u_u176), dtb_u_u177, dtb_u_u178, dtb_u_u179))
  | _ -> failwith "DT: impossible branch"
))

# 35 "Vuna/Ir/Tail.vuna"
let v_annotateDefsWith = (fun (dtb_u_u180 : (string) -> int B_dData_dMaybe.t_Maybe) (dtb_u_u181 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> ((B_dData_dList.v_map (v_annotateDef dtb_u_u180)) dtb_u_u181))

# 44 "Vuna/Ir/Tail.vuna"
let v_annotateBody = (fun (dtb_u_u182 : (string) -> int B_dData_dMaybe.t_Maybe) (dtb_u_u183 : Vuna_dIr_dModel.t_Ir) -> ((((v_annotateAt (v_tailFuelOf dtb_u_u183)) dtb_u_u182) true) dtb_u_u183))

# 48 "Vuna/Ir/Tail.vuna"
let v_annotateDefs = (fun (dtb_u_u184 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (let dtb_u_u185 = (v_arityTableOf dtb_u_u184) in (B_dData_dResult.C_Result_Ok (((v_annotateDefsWith (v_arityOfTable dtb_u_u185)) dtb_u_u184)))))

# 175 "Vuna/Ir/Tail.vuna"
let rec v_tmcStripLams = (fun (dtb_u_u186 : Vuna_dIr_dModel.t_Ir) -> (match dtb_u_u186 with
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u187, dtb_u_u188, dtb_u_u189) -> (v_tmcStripLams dtb_u_u189)
  | _ -> dtb_u_u186
))

# 230 "Vuna/Ir/Tail.vuna"
let rec v_spineOf = (fun (dtb_u_u190 : int) (dtb_u_u191 : Vuna_dIr_dModel.t_Ir) (dtb_u_u192 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (dtb_u_u190 <= 0) then { B_dData_dPair.f_Pair_first = dtb_u_u191; B_dData_dPair.f_Pair_second = dtb_u_u192 } else (match dtb_u_u191 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u193, dtb_u_u194, dtb_u_u195) -> (((v_spineOf (dtb_u_u190 - 1)) dtb_u_u194) (B_dData_dList.C_List__x58__x58_ (dtb_u_u195, dtb_u_u192)))
  | _ -> { B_dData_dPair.f_Pair_first = dtb_u_u191; B_dData_dPair.f_Pair_second = dtb_u_u192 }
)))

# 266 "Vuna/Ir/Tail.vuna"
let v_tmcAnd2 = (fun (dtb_u_u196 : int) (dtb_u_u197 : string) (dtb_u_u198 : (bool, bool) B_dData_dPair.t_Pair) (dtb_u_u199 : (bool, bool) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (if (B_dData_dPair.v_firstOf dtb_u_u198) then (B_dData_dPair.v_firstOf dtb_u_u199) else false); B_dData_dPair.f_Pair_second = (if (B_dData_dPair.v_secondOf dtb_u_u198) then true else (B_dData_dPair.v_secondOf dtb_u_u199)) })

# 262 "Vuna/Ir/Tail.vuna"
let rec v_tmcEach = (fun (dtb_u_u200 : int) (dtb_u_u201 : string) (dtb_u_u202 : (bool, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u202 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u203, dtb_u_u204) -> ((((v_tmcAnd2 dtb_u_u200) dtb_u_u201) dtb_u_u203) (((v_tmcEach (dtb_u_u200 - 1)) dtb_u_u201) dtb_u_u204))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = false }
  | _ -> failwith "DT: impossible branch"
))

# 269 "Vuna/Ir/Tail.vuna"
let v_tmcAnd3 = (fun (dtb_u_u205 : int) (dtb_u_u206 : string) (dtb_u_u207 : (bool, bool) B_dData_dPair.t_Pair) (dtb_u_u208 : (bool, bool) B_dData_dPair.t_Pair) (dtb_u_u209 : (bool, bool) B_dData_dPair.t_Pair) -> ((((v_tmcAnd2 dtb_u_u205) dtb_u_u206) ((((v_tmcAnd2 dtb_u_u205) dtb_u_u206) dtb_u_u207) dtb_u_u208)) dtb_u_u209))

# 180 "Vuna/Ir/Tail.vuna"
let rec v_tmcProbe = (fun (dtb_u_u210 : int) (dtb_u_u211 : string) (dtb_u_u212 : bool) (dtb_u_u213 : bool) (dtb_u_u214 : Vuna_dIr_dModel.t_Ir) -> (if (dtb_u_u210 <= 0) then { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = false } else (match dtb_u_u214 with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u215) -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = false }
  | Vuna_dIr_dModel.C_Ir_IrInt (dtb_u_u216) -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = false }
  | Vuna_dIr_dModel.C_Ir_IrStr (dtb_u_u217) -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = false }
  | Vuna_dIr_dModel.C_Ir_IrBool (dtb_u_u218) -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = false }
  | Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb_u_u219) -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = false }
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb_u_u220) -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = false }
  | Vuna_dIr_dModel.C_Ir_IrEffBind (dtb_u_u221, dtb_u_u222, dtb_u_u223) -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = false }
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u224) -> (if (dtb_u_u224 = dtb_u_u211) then (if (if dtb_u_u212 then true else dtb_u_u213) then { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb_u_u213 } else { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = false }) else { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = false })
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb_u_u225) -> (((((v_tmcProbe (dtb_u_u210 - 1)) dtb_u_u211) true) dtb_u_u213) dtb_u_u225)
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u226, dtb_u_u227, dtb_u_u228) -> (((((v_tmcProbe (dtb_u_u210 - 1)) dtb_u_u211) dtb_u_u212) dtb_u_u213) dtb_u_u228)
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u229, dtb_u_u230, dtb_u_u231) -> (((((v_tmcApp (dtb_u_u210 - 1)) dtb_u_u211) dtb_u_u212) dtb_u_u213) dtb_u_u214)
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u232, dtb_u_u233, dtb_u_u234, dtb_u_u235) -> ((((v_tmcCtorArgs (dtb_u_u210 - 1)) dtb_u_u211) (if dtb_u_u212 then true else dtb_u_u213)) dtb_u_u235)
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb_u_u236, dtb_u_u237, dtb_u_u238, dtb_u_u239) -> (((((v_tmcProbe (dtb_u_u210 - 1)) dtb_u_u211) false) false) dtb_u_u236)
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u240, dtb_u_u241, dtb_u_u242) -> (((v_tmcFields (dtb_u_u210 - 1)) dtb_u_u211) ((B_dData_dList.v_map (fun (dtb_u_u243 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf dtb_u_u243))) dtb_u_u242))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb_u_u244, dtb_u_u245, dtb_u_u246, dtb_u_u247) -> ((((v_tmcAnd2 (dtb_u_u210 - 1)) dtb_u_u211) (((((v_tmcProbe (dtb_u_u210 - 1)) dtb_u_u211) false) false) dtb_u_u244)) (((v_tmcFields (dtb_u_u210 - 1)) dtb_u_u211) ((B_dData_dList.v_map (fun (dtb_u_u248 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf dtb_u_u248))) dtb_u_u246)))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u249, dtb_u_u250) -> (((v_tmcEach (dtb_u_u210 - 1)) dtb_u_u211) ((B_dData_dList.v_map (fun (dtb_u_u251 : Vuna_dIr_dModel.t_Ir) -> (((((v_tmcProbe (dtb_u_u210 - 1)) dtb_u_u211) false) false) dtb_u_u251))) dtb_u_u250))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb_u_u252) -> (((v_tmcEach (dtb_u_u210 - 1)) dtb_u_u211) ((B_dData_dList.v_map (fun (dtb_u_u253 : Vuna_dIr_dModel.t_Ir) -> (((((v_tmcProbe (dtb_u_u210 - 1)) dtb_u_u211) false) false) dtb_u_u253))) dtb_u_u252))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u254, dtb_u_u255, dtb_u_u256) -> ((((v_tmcAnd2 (dtb_u_u210 - 1)) dtb_u_u211) (((((v_tmcProbe (dtb_u_u210 - 1)) dtb_u_u211) false) false) dtb_u_u255)) (((((v_tmcProbe (dtb_u_u210 - 1)) dtb_u_u211) dtb_u_u212) dtb_u_u213) dtb_u_u256))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u257, dtb_u_u258, dtb_u_u259) -> (((((v_tmcProbe (dtb_u_u210 - 1)) dtb_u_u211) false) false) dtb_u_u259)
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb_u_u260, dtb_u_u261, dtb_u_u262) -> (((((v_tmcAnd3 (dtb_u_u210 - 1)) dtb_u_u211) (((((v_tmcProbe (dtb_u_u210 - 1)) dtb_u_u211) false) false) dtb_u_u260)) (((((v_tmcProbe (dtb_u_u210 - 1)) dtb_u_u211) dtb_u_u212) dtb_u_u213) dtb_u_u261)) (((((v_tmcProbe (dtb_u_u210 - 1)) dtb_u_u211) dtb_u_u212) dtb_u_u213) dtb_u_u262))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u263, dtb_u_u264, dtb_u_u265, dtb_u_u266) -> ((((v_tmcAnd2 (dtb_u_u210 - 1)) dtb_u_u211) (((((v_tmcProbe (dtb_u_u210 - 1)) dtb_u_u211) false) false) dtb_u_u265)) (((((v_tmcAlts (dtb_u_u210 - 1)) dtb_u_u211) dtb_u_u212) dtb_u_u213) dtb_u_u266))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb_u_u267, dtb_u_u268, dtb_u_u269, dtb_u_u270, dtb_u_u271) -> (((((v_tmcAnd3 (dtb_u_u210 - 1)) dtb_u_u211) (((((v_tmcProbe (dtb_u_u210 - 1)) dtb_u_u211) false) false) dtb_u_u267)) (((((v_tmcAltM (dtb_u_u210 - 1)) dtb_u_u211) dtb_u_u212) dtb_u_u213) dtb_u_u269)) ((((v_tmcAnd2 (dtb_u_u210 - 1)) dtb_u_u211) (((((v_tmcAltM (dtb_u_u210 - 1)) dtb_u_u211) dtb_u_u212) dtb_u_u213) dtb_u_u270)) (((((v_tmcAltM (dtb_u_u210 - 1)) dtb_u_u211) dtb_u_u212) dtb_u_u213) dtb_u_u271)))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb_u_u272, dtb_u_u273, dtb_u_u274, dtb_u_u275, dtb_u_u276) -> (((((v_tmcProbe (dtb_u_u210 - 1)) dtb_u_u211) false) false) dtb_u_u276)
  | _ -> failwith "DT: impossible branch"
)))
# 212 "Vuna/Ir/Tail.vuna"
and v_tmcApp = (fun (dtb_u_u277 : int) (dtb_u_u278 : string) (dtb_u_u279 : bool) (dtb_u_u280 : bool) (dtb_u_u281 : Vuna_dIr_dModel.t_Ir) -> (match (((v_spineOf dtb_u_u277) dtb_u_u281) B_dData_dList.C_List_Nil) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u282; B_dData_dPair.f_Pair_second = dtb_u_u283 } -> (match dtb_u_u282 with
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u284) -> (if (dtb_u_u284 = dtb_u_u278) then (match (((v_tmcEach (dtb_u_u277 - 1)) dtb_u_u278) ((B_dData_dList.v_map (fun (dtb_u_u285 : Vuna_dIr_dModel.t_Ir) -> (((((v_tmcProbe (dtb_u_u277 - 1)) dtb_u_u278) false) false) dtb_u_u285))) dtb_u_u283)) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u286; B_dData_dPair.f_Pair_second = dtb_u_u287 } -> { B_dData_dPair.f_Pair_first = (if dtb_u_u286 then (if dtb_u_u279 then true else dtb_u_u280) else false); B_dData_dPair.f_Pair_second = dtb_u_u280 }
  | _ -> failwith "DT: impossible branch"
) else (((v_tmcEach (dtb_u_u277 - 1)) dtb_u_u278) ((B_dData_dList.v_map (fun (dtb_u_u288 : Vuna_dIr_dModel.t_Ir) -> (((((v_tmcProbe (dtb_u_u277 - 1)) dtb_u_u278) false) false) dtb_u_u288))) dtb_u_u283)))
  | _ -> ((((v_tmcAnd2 (dtb_u_u277 - 1)) dtb_u_u278) (((((v_tmcProbe (dtb_u_u277 - 1)) dtb_u_u278) false) false) dtb_u_u282)) (((v_tmcEach (dtb_u_u277 - 1)) dtb_u_u278) ((B_dData_dList.v_map (fun (dtb_u_u289 : Vuna_dIr_dModel.t_Ir) -> (((((v_tmcProbe (dtb_u_u277 - 1)) dtb_u_u278) false) false) dtb_u_u289))) dtb_u_u283)))
)
  | _ -> failwith "DT: impossible branch"
))
# 240 "Vuna/Ir/Tail.vuna"
and v_tmcCtorArgs = (fun (dtb_u_u290 : int) (dtb_u_u291 : string) (dtb_u_u292 : bool) (dtb_u_u293 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (match (B_dData_dList.v_reverse dtb_u_u293) with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = false }
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u294, dtb_u_u295) -> (match (((v_tmcEach (dtb_u_u290 - 1)) dtb_u_u291) ((B_dData_dList.v_map (fun (dtb_u_u296 : Vuna_dIr_dModel.t_Ir) -> (((((v_tmcProbe (dtb_u_u290 - 1)) dtb_u_u291) false) false) dtb_u_u296))) dtb_u_u295)) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u297; B_dData_dPair.f_Pair_second = dtb_u_u298 } -> (match (((((v_tmcProbe (dtb_u_u290 - 1)) dtb_u_u291) false) dtb_u_u292) dtb_u_u294) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u299; B_dData_dPair.f_Pair_second = dtb_u_u300 } -> { B_dData_dPair.f_Pair_first = (if dtb_u_u297 then dtb_u_u299 else false); B_dData_dPair.f_Pair_second = dtb_u_u300 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 250 "Vuna/Ir/Tail.vuna"
and v_tmcFields = (fun (dtb_u_u301 : int) (dtb_u_u302 : string) (dtb_u_u303 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (((v_tmcEach (dtb_u_u301 - 1)) dtb_u_u302) ((B_dData_dList.v_map (fun (dtb_u_u304 : Vuna_dIr_dModel.t_Ir) -> (((((v_tmcProbe (dtb_u_u301 - 1)) dtb_u_u302) false) false) dtb_u_u304))) dtb_u_u303)))
# 254 "Vuna/Ir/Tail.vuna"
and v_tmcAlts = (fun (dtb_u_u305 : int) (dtb_u_u306 : string) (dtb_u_u307 : bool) (dtb_u_u308 : bool) (dtb_u_u309 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (((v_tmcEach (dtb_u_u305 - 1)) dtb_u_u306) ((B_dData_dList.v_map (fun (dtb_u_u310 : Vuna_dIr_dModel.t_IrAlt) -> (((((v_tmcProbe (dtb_u_u305 - 1)) dtb_u_u306) dtb_u_u307) dtb_u_u308) (Vuna_dIr_dModel.v_irAltBodyOf dtb_u_u310)))) dtb_u_u309)))
# 258 "Vuna/Ir/Tail.vuna"
and v_tmcAltM = (fun (dtb_u_u311 : int) (dtb_u_u312 : string) (dtb_u_u313 : bool) (dtb_u_u314 : bool) (dtb_u_u315 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match dtb_u_u315 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u316) -> (((((v_tmcProbe (dtb_u_u311 - 1)) dtb_u_u312) dtb_u_u313) dtb_u_u314) (Vuna_dIr_dModel.v_irAltBodyOf dtb_u_u316))
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = false }
  | _ -> failwith "DT: impossible branch"
))

# 166 "Vuna/Ir/Tail.vuna"
let v_tmcCandidate = (fun (dtb_u_u317 : Vuna_dIr_dModel.t_IrDef) -> (match dtb_u_u317 with
  | Vuna_dIr_dModel.C_IrDef_IrDef (dtb_u_u318, dtb_u_u319, dtb_u_u320, dtb_u_u321, dtb_u_u322, dtb_u_u323, dtb_u_u324, dtb_u_u325) -> (let dtb_u_u326 = (v_tmcStripLams dtb_u_u322) in (match (((((v_tmcProbe (64 + (16 * (Vuna_dIr_dModel.v_irSize dtb_u_u326)))) dtb_u_u318) true) false) dtb_u_u326) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u327; B_dData_dPair.f_Pair_second = dtb_u_u328 } -> (if dtb_u_u327 then dtb_u_u328 else false)
  | _ -> failwith "DT: impossible branch"
))
  | Vuna_dIr_dModel.C_IrDef_IrExternDef (dtb_u_u329, dtb_u_u330, dtb_u_u331, dtb_u_u332) -> false
  | _ -> failwith "DT: impossible branch"
))
