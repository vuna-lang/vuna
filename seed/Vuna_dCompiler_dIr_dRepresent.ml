open Vuna_runtime
# 93 "Vuna/Compiler/Ir/Represent.vuna"
let rec v_Vuna_dCompiler_dIr_dRepresent_dallCatchAll = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltCtorOf dtb__0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dIr_dRepresent_dallCatchAll dtb__1)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__2) -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 34 "Vuna/Compiler/Ir/Represent.vuna"
let rec v_Vuna_dCompiler_dIr_dRepresent_drepresentIr = (fun shared ir -> (match ir with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__3, dtb__4, dtb__5, dtb__6) -> ((fun args2 -> (match ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirSharedUnboxedOf dtb__3) (shared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUnboxed) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__7) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__8, dtb__9) -> (match dtb__9 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__8
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__3, dtb__4, dtb__5, args2))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__3, dtb__4, dtb__5, args2))
)) args2)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__3, dtb__4, dtb__5, args2))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared)) dtb__6))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__10, dtb__11, dtb__12) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__10, dtb__11, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) })) dtb__12)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__13, dtb__14, dtb__15, dtb__16) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__13), dtb__14, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) })) dtb__15), dtb__16))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__17, dtb__18, dtb__19, dtb__20) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__17), dtb__18, dtb__19, dtb__20))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__21, dtb__22) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__21, ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared)) dtb__22)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__23, dtb__24, dtb__25) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__23, dtb__24, ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__25)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__26, dtb__27, dtb__28) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__26, ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__27), ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__28)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__29, dtb__30, dtb__31) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__29, dtb__30, ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__31)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__32, dtb__33, dtb__34) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__32, ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__33), ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__34)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__35, dtb__36, dtb__37) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__35), ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__36), ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__37)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__38, dtb__39, dtb__40, dtb__41) -> (((((v_Vuna_dCompiler_dIr_dRepresent_drepresentCase shared) dtb__38) dtb__39) dtb__40) dtb__41)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__42, dtb__43, dtb__44, dtb__45, dtb__46) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__42), dtb__43, ((v_Vuna_dCompiler_dIr_dRepresent_drepresentAlt shared) dtb__44), ((v_Vuna_dCompiler_dIr_dRepresent_drepresentAlt shared) dtb__45), ((v_Vuna_dCompiler_dIr_dRepresent_drepresentAlt shared) dtb__46)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__47) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared)) dtb__47)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__48, dtb__49, dtb__50, dtb__51, dtb__52) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__48, dtb__49, dtb__50, dtb__51, ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__52)))
  | _ -> ir
))
# 75 "Vuna/Compiler/Ir/Represent.vuna"
and v_Vuna_dCompiler_dIr_dRepresent_drepresentCase = (fun shared caseTy resultTy scrut alts -> ((fun scrut2 -> (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__53, dtb__54) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (caseTy, resultTy, scrut2, ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dIr_dRepresent_drepresentAltIr shared)) alts)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__55) -> (match dtb__55 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__56; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__57 } -> (match ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirSharedUnboxedOf dtb__56) (shared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUnboxed) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__58) -> (if (v_Vuna_dCompiler_dIr_dRepresent_dallCatchAll dtb__54) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf dtb__53), scrut2, ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__53)))) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (caseTy, resultTy, scrut2, ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dIr_dRepresent_drepresentAltIr shared)) alts))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (caseTy, resultTy, scrut2, ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dIr_dRepresent_drepresentAltIr shared)) alts)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltCtorOf dtb__53))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (caseTy, resultTy, scrut2, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) scrut)))
# 100 "Vuna/Compiler/Ir/Represent.vuna"
and v_Vuna_dCompiler_dIr_dRepresent_drepresentAlt = (fun shared alt -> (match alt with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__59) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dIr_dRepresent_drepresentAltIr shared) dtb__59)))
  | _ -> failwith "DT: impossible branch"
))
# 106 "Vuna/Compiler/Ir/Represent.vuna"
and v_Vuna_dCompiler_dIr_dRepresent_drepresentAltIr = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrShared) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt) -> (match mc1 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = dtb__60; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = dtb__61; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__62 } -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = dtb__60; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = dtb__61; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr mc0) dtb__62) }
  | _ -> failwith "DT: impossible branch"
))

# 27 "Vuna/Compiler/Ir/Represent.vuna"
let v_Vuna_dCompiler_dIr_dRepresent_drepresentDef = (fun shared d -> (match d with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__63, dtb__64, dtb__65, dtb__66, dtb__67, dtb__68, dtb__69, dtb__70) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__63, dtb__64, dtb__65, dtb__66, ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__67), dtb__68, dtb__69, dtb__70))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__71, dtb__72, dtb__73, dtb__74) -> d
  | _ -> failwith "DT: impossible branch"
))

# 24 "Vuna/Compiler/Ir/Represent.vuna"
let v_Vuna_dCompiler_dIr_dRepresent_drepresentGroup = (fun shared g -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = (g).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dIr_dRepresent_drepresentDef shared)) (g).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs) })

# 15 "Vuna/Compiler/Ir/Represent.vuna"
let v_Vuna_dCompiler_dIr_dRepresent_drepresentUnit = (fun shared u -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups = ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dIr_dRepresent_drepresentGroup shared)) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry })
