open Vuna_runtime
# 92 "Vuna/Compiler/Ir/Represent.vuna"
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
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__3, dtb__4, dtb__5) -> ((fun args2 -> (match ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirSharedUnboxedOf dtb__3) (shared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUnboxed) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__6) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__7, dtb__8) -> (match dtb__8 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__7
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__3, dtb__4, args2))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__3, dtb__4, args2))
)) args2)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__3, dtb__4, args2))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared)) dtb__5))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__9, dtb__10) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__9, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) })) dtb__10)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__11, dtb__12, dtb__13) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__11), dtb__12, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) })) dtb__13)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__14, dtb__15, dtb__16) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__14), dtb__15, dtb__16))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__17, dtb__18) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__17, ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared)) dtb__18)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__19, dtb__20, dtb__21) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__19, dtb__20, ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__21)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__22, dtb__23, dtb__24) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__22, ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__23), ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__24)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__25, dtb__26, dtb__27) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__25, dtb__26, ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__27)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__28, dtb__29) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__28), ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__29)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__30, dtb__31, dtb__32) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__30), ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__31), ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__32)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__33, dtb__34) -> (((v_Vuna_dCompiler_dIr_dRepresent_drepresentCase shared) dtb__33) dtb__34)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__35, dtb__36, dtb__37, dtb__38, dtb__39) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__35), dtb__36, ((v_Vuna_dCompiler_dIr_dRepresent_drepresentAlt shared) dtb__37), ((v_Vuna_dCompiler_dIr_dRepresent_drepresentAlt shared) dtb__38), ((v_Vuna_dCompiler_dIr_dRepresent_drepresentAlt shared) dtb__39)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__40) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared)) dtb__40)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__41, dtb__42, dtb__43, dtb__44, dtb__45) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__41, dtb__42, dtb__43, dtb__44, ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__45)))
  | _ -> ir
))
# 74 "Vuna/Compiler/Ir/Represent.vuna"
and v_Vuna_dCompiler_dIr_dRepresent_drepresentCase = (fun shared scrut alts -> ((fun scrut2 -> (match alts with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__46, dtb__47) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (scrut2, ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dIr_dRepresent_drepresentAltIr shared)) alts)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__48) -> (match dtb__48 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__49; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__50 } -> (match ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirSharedUnboxedOf dtb__49) (shared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUnboxed) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__51) -> (if (v_Vuna_dCompiler_dIr_dRepresent_dallCatchAll dtb__47) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf dtb__46), scrut2, ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__46)))) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (scrut2, ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dIr_dRepresent_drepresentAltIr shared)) alts))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (scrut2, ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dIr_dRepresent_drepresentAltIr shared)) alts)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltCtorOf dtb__46))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (scrut2, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) scrut)))
# 99 "Vuna/Compiler/Ir/Represent.vuna"
and v_Vuna_dCompiler_dIr_dRepresent_drepresentAlt = (fun shared alt -> (match alt with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__52) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dIr_dRepresent_drepresentAltIr shared) dtb__52)))
  | _ -> failwith "DT: impossible branch"
))
# 105 "Vuna/Compiler/Ir/Represent.vuna"
and v_Vuna_dCompiler_dIr_dRepresent_drepresentAltIr = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrShared) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt) -> (match mc1 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = dtb__53; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = dtb__54; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__55 } -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = dtb__53; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = dtb__54; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr mc0) dtb__55) }
  | _ -> failwith "DT: impossible branch"
))

# 27 "Vuna/Compiler/Ir/Represent.vuna"
let v_Vuna_dCompiler_dIr_dRepresent_drepresentDef = (fun shared d -> (match d with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__56, dtb__57, dtb__58, dtb__59, dtb__60, dtb__61, dtb__62, dtb__63) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef (dtb__56, dtb__57, dtb__58, dtb__59, ((v_Vuna_dCompiler_dIr_dRepresent_drepresentIr shared) dtb__60), dtb__61, dtb__62, dtb__63))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef (dtb__64, dtb__65, dtb__66, dtb__67) -> d
  | _ -> failwith "DT: impossible branch"
))

# 24 "Vuna/Compiler/Ir/Represent.vuna"
let v_Vuna_dCompiler_dIr_dRepresent_drepresentGroup = (fun shared g -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = (g).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dIr_dRepresent_drepresentDef shared)) (g).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs) })

# 15 "Vuna/Compiler/Ir/Represent.vuna"
let v_Vuna_dCompiler_dIr_dRepresent_drepresentUnit = (fun shared u -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups = ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dIr_dRepresent_drepresentGroup shared)) (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry = (u).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry })
