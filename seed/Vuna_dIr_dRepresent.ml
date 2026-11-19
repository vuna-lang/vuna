open Vuna_runtime
# 94 "Vuna/Ir/Represent.vuna"
let rec v_allCatchAll = (fun (mc0 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (match (Vuna_dIr_dModel.v_irAltCtorOf dtb__0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_allCatchAll dtb__1)
  | B_dData_dMaybe.C_Maybe_Just (dtb__2) -> false
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 34 "Vuna/Ir/Represent.vuna"
let rec v_representIr = (fun (shared : Vuna_dIr_dModel.t_IrShared) (ir : Vuna_dIr_dModel.t_Ir) -> (match ir with
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__3, dtb__4, dtb__5, dtb__6) -> ((fun args2 -> (match ((Vuna_dIr_dModel.v_irSharedUnboxedOf dtb__3) (shared).Vuna_dIr_dModel.f_IrShared_irSharedUnboxed) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__7) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (match dtb__9 with
  | B_dData_dList.C_List_Nil -> dtb__8
  | _ -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb__3, dtb__4, dtb__5, args2))
)
  | _ -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb__3, dtb__4, dtb__5, args2))
)) args2)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb__3, dtb__4, dtb__5, args2))
  | _ -> failwith "DT: impossible branch"
)) ((B_dData_dList.v_map (v_representIr shared)) dtb__6))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__10, dtb__11, dtb__12) -> (Vuna_dIr_dModel.C_Ir_IrRecord (dtb__10, dtb__11, ((B_dData_dList.v_map (fun (p : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ((v_representIr shared) (B_dData_dPair.v_secondOf p)) })) dtb__12)))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__13, dtb__14, dtb__15, dtb__16) -> (Vuna_dIr_dModel.C_Ir_IrRecUpd (((v_representIr shared) dtb__13), dtb__14, ((B_dData_dList.v_map (fun (p : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ((v_representIr shared) (B_dData_dPair.v_secondOf p)) })) dtb__15), dtb__16))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__17, dtb__18, dtb__19, dtb__20) -> (Vuna_dIr_dModel.C_Ir_IrProj (((v_representIr shared) dtb__17), dtb__18, dtb__19, dtb__20))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__21, dtb__22) -> (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__21, ((B_dData_dList.v_map (v_representIr shared)) dtb__22)))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__23, dtb__24, dtb__25) -> (Vuna_dIr_dModel.C_Ir_IrCast (dtb__23, dtb__24, ((v_representIr shared) dtb__25)))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__26, dtb__27, dtb__28) -> (Vuna_dIr_dModel.C_Ir_IrLet (dtb__26, ((v_representIr shared) dtb__27), ((v_representIr shared) dtb__28)))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__29, dtb__30, dtb__31) -> (Vuna_dIr_dModel.C_Ir_IrLam (dtb__29, dtb__30, ((v_representIr shared) dtb__31)))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__32, dtb__33, dtb__34) -> (Vuna_dIr_dModel.C_Ir_IrApp (dtb__32, ((v_representIr shared) dtb__33), ((v_representIr shared) dtb__34)))
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb__35) -> (Vuna_dIr_dModel.C_Ir_IrTail (((v_representIr shared) dtb__35)))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__36, dtb__37, dtb__38) -> (Vuna_dIr_dModel.C_Ir_IrIf (((v_representIr shared) dtb__36), ((v_representIr shared) dtb__37), ((v_representIr shared) dtb__38)))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__39, dtb__40, dtb__41, dtb__42) -> (((((v_representCase shared) dtb__39) dtb__40) dtb__41) dtb__42)
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__43, dtb__44, dtb__45, dtb__46, dtb__47) -> (Vuna_dIr_dModel.C_Ir_IrNatCase (((v_representIr shared) dtb__43), dtb__44, ((v_representAlt shared) dtb__45), ((v_representAlt shared) dtb__46), ((v_representAlt shared) dtb__47)))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__48) -> (Vuna_dIr_dModel.C_Ir_IrConcatMany (((B_dData_dList.v_map (v_representIr shared)) dtb__48)))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__49, dtb__50, dtb__51, dtb__52, dtb__53) -> (Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__49, dtb__50, dtb__51, dtb__52, ((v_representIr shared) dtb__53)))
  | _ -> ir
))
# 76 "Vuna/Ir/Represent.vuna"
and v_representCase = (fun (shared : Vuna_dIr_dModel.t_IrShared) (caseTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (resultTy : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (scrut : Vuna_dIr_dModel.t_Ir) (alts : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> ((fun scrut2 -> (match alts with
  | B_dData_dList.C_List__x58__x58_ (dtb__54, dtb__55) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrCase (caseTy, resultTy, scrut2, ((B_dData_dList.v_map (v_representAltIr shared)) alts)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__56) -> (match dtb__56 with
  | { B_dData_dPair.f_Pair_first = dtb__57; B_dData_dPair.f_Pair_second = dtb__58 } -> (match ((Vuna_dIr_dModel.v_irSharedUnboxedOf dtb__57) (shared).Vuna_dIr_dModel.f_IrShared_irSharedUnboxed) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__59) -> (if (v_allCatchAll dtb__55) then (Vuna_dIr_dModel.C_Ir_IrLet ((Vuna_dIr_dModel.v_irAltBindersOf dtb__54), scrut2, ((v_representIr shared) (Vuna_dIr_dModel.v_irAltBodyOf dtb__54)))) else (Vuna_dIr_dModel.C_Ir_IrCase (caseTy, resultTy, scrut2, ((B_dData_dList.v_map (v_representAltIr shared)) alts))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Vuna_dIr_dModel.C_Ir_IrCase (caseTy, resultTy, scrut2, ((B_dData_dList.v_map (v_representAltIr shared)) alts)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dIr_dModel.v_irAltCtorOf dtb__54))
  | B_dData_dList.C_List_Nil -> (Vuna_dIr_dModel.C_Ir_IrCase (caseTy, resultTy, scrut2, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)) ((v_representIr shared) scrut)))
# 101 "Vuna/Ir/Represent.vuna"
and v_representAlt = (fun (shared : Vuna_dIr_dModel.t_IrShared) (alt : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match alt with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__60) -> (B_dData_dMaybe.C_Maybe_Just (((v_representAltIr shared) dtb__60)))
  | _ -> failwith "DT: impossible branch"
))
# 107 "Vuna/Ir/Represent.vuna"
and v_representAltIr = (fun (mc0 : Vuna_dIr_dModel.t_IrShared) (mc1 : Vuna_dIr_dModel.t_IrAlt) -> (match mc1 with
  | { Vuna_dIr_dModel.f_IrAlt_irAltCtor = dtb__61; Vuna_dIr_dModel.f_IrAlt_irAltBinders = dtb__62; Vuna_dIr_dModel.f_IrAlt_irAltBody = dtb__63 } -> { Vuna_dIr_dModel.f_IrAlt_irAltCtor = dtb__61; Vuna_dIr_dModel.f_IrAlt_irAltBinders = dtb__62; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((v_representIr mc0) dtb__63) }
  | _ -> failwith "DT: impossible branch"
))

# 27 "Vuna/Ir/Represent.vuna"
let v_representDef = (fun (shared : Vuna_dIr_dModel.t_IrShared) (d : Vuna_dIr_dModel.t_IrDef) -> (match d with
  | Vuna_dIr_dModel.C_IrDef_IrDef (dtb__64, dtb__65, dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71) -> (Vuna_dIr_dModel.C_IrDef_IrDef (dtb__64, dtb__65, dtb__66, dtb__67, ((v_representIr shared) dtb__68), dtb__69, dtb__70, dtb__71))
  | Vuna_dIr_dModel.C_IrDef_IrExternDef (dtb__72, dtb__73, dtb__74, dtb__75) -> d
  | _ -> failwith "DT: impossible branch"
))

# 24 "Vuna/Ir/Represent.vuna"
let v_representGroup = (fun (shared : Vuna_dIr_dModel.t_IrShared) (g : Vuna_dIr_dModel.t_IrGroup) -> { Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = (g).Vuna_dIr_dModel.f_IrGroup_irGroupIsRec; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = ((B_dData_dList.v_map (v_representDef shared)) (g).Vuna_dIr_dModel.f_IrGroup_irGroupDefs) })

# 15 "Vuna/Ir/Represent.vuna"
let v_representUnit = (fun (shared : Vuna_dIr_dModel.t_IrShared) (u : Vuna_dIr_dModel.t_IrUnit) -> { Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls = (u).Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls; Vuna_dIr_dModel.f_IrUnit_irUnitGroups = ((B_dData_dList.v_map (v_representGroup shared)) (u).Vuna_dIr_dModel.f_IrUnit_irUnitGroups); Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily = (u).Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily; Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs = (u).Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs; Vuna_dIr_dModel.f_IrUnit_irUnitEntry = (u).Vuna_dIr_dModel.f_IrUnit_irUnitEntry })
