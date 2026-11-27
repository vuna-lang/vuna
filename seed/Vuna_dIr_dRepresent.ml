open Vuna_runtime
# 101 "Vuna/Ir/Represent.vuna"
let rec v_allCatchAll = (fun (mc0 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (match (Vuna_dIr_dModel.v_irAltCtorOf dtb__0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_allCatchAll dtb__1)
  | B_dData_dMaybe.C_Maybe_Just (dtb__2) -> false
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Ir/Represent.vuna"
let rec v_representIr = (fun (mc0 : Vuna_dIr_dModel.t_IrShared) (mc1 : Vuna_dIr_dModel.t_Ir) -> (match mc1 with
  | Vuna_dIr_dModel.C_Ir_IrEffBind (dtb__3, dtb__4, dtb__5) -> (Vuna_dIr_dModel.C_Ir_IrEffBind (dtb__3, dtb__4, dtb__5))
  | Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb__6) -> (Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb__6))
  | Vuna_dIr_dModel.C_Ir_IrBool (dtb__7) -> (Vuna_dIr_dModel.C_Ir_IrBool (dtb__7))
  | Vuna_dIr_dModel.C_Ir_IrStr (dtb__8) -> (Vuna_dIr_dModel.C_Ir_IrStr (dtb__8))
  | Vuna_dIr_dModel.C_Ir_IrInt (dtb__9) -> (Vuna_dIr_dModel.C_Ir_IrInt (dtb__9))
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb__10) -> (Vuna_dIr_dModel.C_Ir_IrRt (dtb__10))
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__11) -> (Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__11))
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb__12) -> (Vuna_dIr_dModel.C_Ir_IrVar (dtb__12))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__13, dtb__14, dtb__15, dtb__16, dtb__17) -> (Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__13, dtb__14, dtb__15, dtb__16, ((v_representIr mc0) dtb__17)))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__18) -> (Vuna_dIr_dModel.C_Ir_IrConcatMany (((B_dData_dList.v_map (v_representIr mc0)) dtb__18)))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> (Vuna_dIr_dModel.C_Ir_IrNatCase (((v_representIr mc0) dtb__19), dtb__20, ((v_representAlt mc0) dtb__21), ((v_representAlt mc0) dtb__22), ((v_representAlt mc0) dtb__23)))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__24, dtb__25, dtb__26, dtb__27) -> (((((v_representCase mc0) dtb__24) dtb__25) dtb__26) dtb__27)
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__28, dtb__29, dtb__30) -> (Vuna_dIr_dModel.C_Ir_IrIf (((v_representIr mc0) dtb__28), ((v_representIr mc0) dtb__29), ((v_representIr mc0) dtb__30)))
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb__31) -> (Vuna_dIr_dModel.C_Ir_IrTail (((v_representIr mc0) dtb__31)))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__32, dtb__33, dtb__34) -> (Vuna_dIr_dModel.C_Ir_IrApp (dtb__32, ((v_representIr mc0) dtb__33), ((v_representIr mc0) dtb__34)))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__35, dtb__36, dtb__37) -> (Vuna_dIr_dModel.C_Ir_IrLam (dtb__35, dtb__36, ((v_representIr mc0) dtb__37)))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__38, dtb__39, dtb__40) -> (Vuna_dIr_dModel.C_Ir_IrLet (dtb__38, ((v_representIr mc0) dtb__39), ((v_representIr mc0) dtb__40)))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__41, dtb__42, dtb__43) -> (Vuna_dIr_dModel.C_Ir_IrCast (dtb__41, dtb__42, ((v_representIr mc0) dtb__43)))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__44, dtb__45) -> (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__44, ((B_dData_dList.v_map (v_representIr mc0)) dtb__45)))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__46, dtb__47, dtb__48, dtb__49) -> (Vuna_dIr_dModel.C_Ir_IrProj (((v_representIr mc0) dtb__46), dtb__47, dtb__48, dtb__49))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__50, dtb__51, dtb__52, dtb__53) -> (Vuna_dIr_dModel.C_Ir_IrRecUpd (((v_representIr mc0) dtb__50), dtb__51, ((B_dData_dList.v_map (fun (p : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf (Obj.magic p)); B_dData_dPair.f_Pair_second = ((v_representIr mc0) (B_dData_dPair.v_secondOf (Obj.magic p))) })) dtb__52), dtb__53))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__54, dtb__55, dtb__56) -> (Vuna_dIr_dModel.C_Ir_IrRecord (dtb__54, dtb__55, ((B_dData_dList.v_map (fun (p : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf (Obj.magic p)); B_dData_dPair.f_Pair_second = ((v_representIr mc0) (B_dData_dPair.v_secondOf (Obj.magic p))) })) dtb__56)))
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__57, dtb__58, dtb__59, dtb__60) -> (let args2 = ((B_dData_dList.v_map (v_representIr mc0)) dtb__60) in (match ((Vuna_dIr_dModel.v_irSharedUnboxedOf dtb__57) (mc0).Vuna_dIr_dModel.f_IrShared_irSharedUnboxed) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__61) -> (let nd_uscrut9 = args2 in (match nd_uscrut9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__62, dtb__63) -> (match dtb__63 with
  | B_dData_dList.C_List_Nil -> dtb__62
  | _ -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb__57, dtb__58, dtb__59, args2))
)
  | _ -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb__57, dtb__58, dtb__59, args2))
))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb__57, dtb__58, dtb__59, args2))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
# 83 "Vuna/Ir/Represent.vuna"
and v_representCase = (fun (shared : Vuna_dIr_dModel.t_IrShared) (caseTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (resultTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (scrut : Vuna_dIr_dModel.t_Ir) (alts : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (let scrut2 = ((v_representIr shared) scrut) in (match alts with
  | B_dData_dList.C_List__x58__x58_ (dtb__64, dtb__65) -> (let nd_uscrut9 = (Vuna_dIr_dModel.v_irAltCtorOf dtb__64) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrCase (caseTy, resultTy, scrut2, ((B_dData_dList.v_map (v_representAltIr shared)) alts)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__66) -> (match dtb__66 with
  | { B_dData_dPair.f_Pair_first = dtb__67; B_dData_dPair.f_Pair_second = dtb__68 } -> (match ((Vuna_dIr_dModel.v_irSharedUnboxedOf dtb__67) (shared).Vuna_dIr_dModel.f_IrShared_irSharedUnboxed) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__69) -> (if (v_allCatchAll dtb__65) then (Vuna_dIr_dModel.C_Ir_IrLet ((Vuna_dIr_dModel.v_irAltBindersOf dtb__64), scrut2, ((v_representIr shared) (Vuna_dIr_dModel.v_irAltBodyOf dtb__64)))) else (Vuna_dIr_dModel.C_Ir_IrCase (caseTy, resultTy, scrut2, ((B_dData_dList.v_map (v_representAltIr shared)) alts))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrCase (caseTy, resultTy, scrut2, ((B_dData_dList.v_map (v_representAltIr shared)) alts)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (Vuna_dIr_dModel.C_Ir_IrCase (caseTy, resultTy, scrut2, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)))
# 108 "Vuna/Ir/Represent.vuna"
and v_representAlt = (fun (mc0 : Vuna_dIr_dModel.t_IrShared) (mc1 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__70) -> (B_dData_dMaybe.C_Maybe_Just (((v_representAltIr mc0) dtb__70)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 112 "Vuna/Ir/Represent.vuna"
and v_representAltIr = (fun (mc0 : Vuna_dIr_dModel.t_IrShared) (mc1 : Vuna_dIr_dModel.t_IrAlt) -> (match mc1 with
  | { Vuna_dIr_dModel.f_IrAlt_irAltCtor = dtb__71; Vuna_dIr_dModel.f_IrAlt_irAltBinders = dtb__72; Vuna_dIr_dModel.f_IrAlt_irAltBody = dtb__73 } -> { Vuna_dIr_dModel.f_IrAlt_irAltCtor = dtb__71; Vuna_dIr_dModel.f_IrAlt_irAltBinders = dtb__72; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((v_representIr mc0) dtb__73) }
  | _ -> failwith "DT: impossible branch"
))

# 27 "Vuna/Ir/Represent.vuna"
let v_representDef = (fun (mc0 : Vuna_dIr_dModel.t_IrShared) (mc1 : Vuna_dIr_dModel.t_IrDef) -> (match mc1 with
  | Vuna_dIr_dModel.C_IrDef_IrExternDef (dtb__74, dtb__75, dtb__76, dtb__77) -> mc1
  | Vuna_dIr_dModel.C_IrDef_IrDef (dtb__78, dtb__79, dtb__80, dtb__81, dtb__82, dtb__83, dtb__84, dtb__85) -> (Vuna_dIr_dModel.C_IrDef_IrDef (dtb__78, dtb__79, dtb__80, dtb__81, ((v_representIr mc0) dtb__82), dtb__83, dtb__84, dtb__85))
  | _ -> failwith "DT: impossible branch"
))

# 24 "Vuna/Ir/Represent.vuna"
let v_representGroup = (fun (shared : Vuna_dIr_dModel.t_IrShared) (g : Vuna_dIr_dModel.t_IrGroup) -> { Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = (g).Vuna_dIr_dModel.f_IrGroup_irGroupIsRec; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = ((B_dData_dList.v_map (v_representDef shared)) (g).Vuna_dIr_dModel.f_IrGroup_irGroupDefs) })

# 15 "Vuna/Ir/Represent.vuna"
let v_representUnit = (fun (shared : Vuna_dIr_dModel.t_IrShared) (u : Vuna_dIr_dModel.t_IrUnit) -> { Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls = (u).Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls; Vuna_dIr_dModel.f_IrUnit_irUnitGroups = ((B_dData_dList.v_map (v_representGroup shared)) (u).Vuna_dIr_dModel.f_IrUnit_irUnitGroups); Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily = (u).Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily; Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs = (u).Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs; Vuna_dIr_dModel.f_IrUnit_irUnitEntry = (u).Vuna_dIr_dModel.f_IrUnit_irUnitEntry })
