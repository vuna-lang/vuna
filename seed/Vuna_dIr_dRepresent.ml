open Vuna_runtime
# 101 "Vuna/Ir/Represent.vuna"
let rec v_allCatchAll = (fun (dtb_u_u1 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (match dtb_u_u1 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2, dtb_u_u3) -> (match (Vuna_dIr_dModel.v_irAltCtorOf dtb_u_u2) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_allCatchAll dtb_u_u3)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u4) -> false
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Ir/Represent.vuna"
let rec v_representIr = (fun (dtb_u_u5 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u6 : Vuna_dIr_dModel.t_Ir) -> (match dtb_u_u6 with
  | Vuna_dIr_dModel.C_Ir_IrEffBind (dtb_u_u7, dtb_u_u8, dtb_u_u9) -> (Vuna_dIr_dModel.C_Ir_IrEffBind (dtb_u_u7, dtb_u_u8, dtb_u_u9))
  | Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb_u_u10) -> (Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb_u_u10))
  | Vuna_dIr_dModel.C_Ir_IrBool (dtb_u_u11) -> (Vuna_dIr_dModel.C_Ir_IrBool (dtb_u_u11))
  | Vuna_dIr_dModel.C_Ir_IrStr (dtb_u_u12) -> (Vuna_dIr_dModel.C_Ir_IrStr (dtb_u_u12))
  | Vuna_dIr_dModel.C_Ir_IrInt (dtb_u_u13) -> (Vuna_dIr_dModel.C_Ir_IrInt (dtb_u_u13))
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb_u_u14) -> (Vuna_dIr_dModel.C_Ir_IrRt (dtb_u_u14))
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u15) -> (Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u15))
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u16) -> (Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u16))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb_u_u17, dtb_u_u18, dtb_u_u19, dtb_u_u20, dtb_u_u21) -> (Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb_u_u17, dtb_u_u18, dtb_u_u19, dtb_u_u20, ((v_representIr dtb_u_u5) dtb_u_u21)))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb_u_u22) -> (Vuna_dIr_dModel.C_Ir_IrConcatMany (((B_dData_dList.v_map (v_representIr dtb_u_u5)) dtb_u_u22)))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb_u_u23, dtb_u_u24, dtb_u_u25, dtb_u_u26, dtb_u_u27) -> (Vuna_dIr_dModel.C_Ir_IrNatCase (((v_representIr dtb_u_u5) dtb_u_u23), dtb_u_u24, ((v_representAlt dtb_u_u5) dtb_u_u25), ((v_representAlt dtb_u_u5) dtb_u_u26), ((v_representAlt dtb_u_u5) dtb_u_u27)))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u28, dtb_u_u29, dtb_u_u30, dtb_u_u31) -> (((((v_representCase dtb_u_u5) dtb_u_u28) dtb_u_u29) dtb_u_u30) dtb_u_u31)
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb_u_u32, dtb_u_u33, dtb_u_u34) -> (Vuna_dIr_dModel.C_Ir_IrIf (((v_representIr dtb_u_u5) dtb_u_u32), ((v_representIr dtb_u_u5) dtb_u_u33), ((v_representIr dtb_u_u5) dtb_u_u34)))
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb_u_u35) -> (Vuna_dIr_dModel.C_Ir_IrTail (((v_representIr dtb_u_u5) dtb_u_u35)))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u36, dtb_u_u37, dtb_u_u38) -> (Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u36, ((v_representIr dtb_u_u5) dtb_u_u37), ((v_representIr dtb_u_u5) dtb_u_u38)))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u39, dtb_u_u40, dtb_u_u41) -> (Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u39, dtb_u_u40, ((v_representIr dtb_u_u5) dtb_u_u41)))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u42, dtb_u_u43, dtb_u_u44) -> (Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u42, ((v_representIr dtb_u_u5) dtb_u_u43), ((v_representIr dtb_u_u5) dtb_u_u44)))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u45, dtb_u_u46, dtb_u_u47) -> (Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u45, dtb_u_u46, ((v_representIr dtb_u_u5) dtb_u_u47)))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u48, dtb_u_u49) -> (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u48, ((B_dData_dList.v_map (v_representIr dtb_u_u5)) dtb_u_u49)))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb_u_u50, dtb_u_u51, dtb_u_u52, dtb_u_u53) -> (Vuna_dIr_dModel.C_Ir_IrProj (((v_representIr dtb_u_u5) dtb_u_u50), dtb_u_u51, dtb_u_u52, dtb_u_u53))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb_u_u54, dtb_u_u55, dtb_u_u56, dtb_u_u57) -> (Vuna_dIr_dModel.C_Ir_IrRecUpd (((v_representIr dtb_u_u5) dtb_u_u54), dtb_u_u55, ((B_dData_dList.v_map (fun (dtb_u_u58 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u58); B_dData_dPair.f_Pair_second = ((v_representIr dtb_u_u5) (B_dData_dPair.v_secondOf dtb_u_u58)) })) dtb_u_u56), dtb_u_u57))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u59, dtb_u_u60, dtb_u_u61) -> (Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u59, dtb_u_u60, ((B_dData_dList.v_map (fun (dtb_u_u62 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u62); B_dData_dPair.f_Pair_second = ((v_representIr dtb_u_u5) (B_dData_dPair.v_secondOf dtb_u_u62)) })) dtb_u_u61)))
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u63, dtb_u_u64, dtb_u_u65, dtb_u_u66) -> (let dtb_u_u67 = ((B_dData_dList.v_map (v_representIr dtb_u_u5)) dtb_u_u66) in (match ((Vuna_dIr_dModel.v_irSharedUnboxedOf dtb_u_u63) (dtb_u_u5).Vuna_dIr_dModel.f_IrShared_irSharedUnboxed) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u68) -> (let dtb_u_u69 = dtb_u_u67 in (match dtb_u_u69 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u70, dtb_u_u71) -> (match dtb_u_u71 with
  | B_dData_dList.C_List_Nil -> dtb_u_u70
  | _ -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u63, dtb_u_u64, dtb_u_u65, dtb_u_u67))
)
  | _ -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u63, dtb_u_u64, dtb_u_u65, dtb_u_u67))
))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u63, dtb_u_u64, dtb_u_u65, dtb_u_u67))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
# 83 "Vuna/Ir/Represent.vuna"
and v_representCase = (fun (dtb_u_u72 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u73 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u74 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u75 : Vuna_dIr_dModel.t_Ir) (dtb_u_u76 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (let dtb_u_u77 = ((v_representIr dtb_u_u72) dtb_u_u75) in (match dtb_u_u76 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u78, dtb_u_u79) -> (let dtb_u_u80 = (Vuna_dIr_dModel.v_irAltCtorOf dtb_u_u78) in (match dtb_u_u80 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u73, dtb_u_u74, dtb_u_u77, ((B_dData_dList.v_map (v_representAltIr dtb_u_u72)) dtb_u_u76)))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u81) -> (match dtb_u_u81 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u82; B_dData_dPair.f_Pair_second = dtb_u_u83 } -> (match ((Vuna_dIr_dModel.v_irSharedUnboxedOf dtb_u_u82) (dtb_u_u72).Vuna_dIr_dModel.f_IrShared_irSharedUnboxed) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u84) -> (if (v_allCatchAll dtb_u_u79) then (Vuna_dIr_dModel.C_Ir_IrLet ((Vuna_dIr_dModel.v_irAltBindersOf dtb_u_u78), dtb_u_u77, ((v_representIr dtb_u_u72) (Vuna_dIr_dModel.v_irAltBodyOf dtb_u_u78)))) else (Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u73, dtb_u_u74, dtb_u_u77, ((B_dData_dList.v_map (v_representAltIr dtb_u_u72)) dtb_u_u76))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u73, dtb_u_u74, dtb_u_u77, ((B_dData_dList.v_map (v_representAltIr dtb_u_u72)) dtb_u_u76)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u73, dtb_u_u74, dtb_u_u77, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)))
# 108 "Vuna/Ir/Represent.vuna"
and v_representAlt = (fun (dtb_u_u85 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u86 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match dtb_u_u86 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u87) -> (B_dData_dMaybe.C_Maybe_Just (((v_representAltIr dtb_u_u85) dtb_u_u87)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 112 "Vuna/Ir/Represent.vuna"
and v_representAltIr = (fun (dtb_u_u88 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u89 : Vuna_dIr_dModel.t_IrAlt) -> (match dtb_u_u89 with
  | { Vuna_dIr_dModel.f_IrAlt_irAltCtor = dtb_u_u90; Vuna_dIr_dModel.f_IrAlt_irAltBinders = dtb_u_u91; Vuna_dIr_dModel.f_IrAlt_irAltBody = dtb_u_u92 } -> { Vuna_dIr_dModel.f_IrAlt_irAltCtor = dtb_u_u90; Vuna_dIr_dModel.f_IrAlt_irAltBinders = dtb_u_u91; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((v_representIr dtb_u_u88) dtb_u_u92) }
  | _ -> failwith "DT: impossible branch"
))

# 27 "Vuna/Ir/Represent.vuna"
let v_representDef = (fun (dtb_u_u93 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u94 : Vuna_dIr_dModel.t_IrDef) -> (match dtb_u_u94 with
  | Vuna_dIr_dModel.C_IrDef_IrExternDef (dtb_u_u95, dtb_u_u96, dtb_u_u97, dtb_u_u98) -> dtb_u_u94
  | Vuna_dIr_dModel.C_IrDef_IrDef (dtb_u_u99, dtb_u_u100, dtb_u_u101, dtb_u_u102, dtb_u_u103, dtb_u_u104, dtb_u_u105, dtb_u_u106) -> (Vuna_dIr_dModel.C_IrDef_IrDef (dtb_u_u99, dtb_u_u100, dtb_u_u101, dtb_u_u102, ((v_representIr dtb_u_u93) dtb_u_u103), dtb_u_u104, dtb_u_u105, dtb_u_u106))
  | _ -> failwith "DT: impossible branch"
))

# 24 "Vuna/Ir/Represent.vuna"
let v_representGroup = (fun (dtb_u_u107 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u108 : Vuna_dIr_dModel.t_IrGroup) -> { Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = (dtb_u_u108).Vuna_dIr_dModel.f_IrGroup_irGroupIsRec; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = ((B_dData_dList.v_map (v_representDef dtb_u_u107)) (dtb_u_u108).Vuna_dIr_dModel.f_IrGroup_irGroupDefs) })

# 15 "Vuna/Ir/Represent.vuna"
let v_representUnit = (fun (dtb_u_u109 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u110 : Vuna_dIr_dModel.t_IrUnit) -> { Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls = (dtb_u_u110).Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls; Vuna_dIr_dModel.f_IrUnit_irUnitGroups = ((B_dData_dList.v_map (v_representGroup dtb_u_u109)) (dtb_u_u110).Vuna_dIr_dModel.f_IrUnit_irUnitGroups); Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily = (dtb_u_u110).Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily; Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs = (dtb_u_u110).Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs; Vuna_dIr_dModel.f_IrUnit_irUnitEntry = (dtb_u_u110).Vuna_dIr_dModel.f_IrUnit_irUnitEntry })
