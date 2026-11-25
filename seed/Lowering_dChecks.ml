open Vuna_runtime
type t_UseFlags = { f_UseFlags_useFlagsFloat : bool; f_UseFlags_useFlagsTrace : bool; f_UseFlags_useFlagsObs : bool }
and t_TermUse = { f_TermUse_termUseDeps : string B_dData_dList.t_List; f_TermUse_termUseFlags : t_UseFlags; f_TermUse_termUseFloatLit : bool }

# 47 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_flattenAppSpineGo = (fun (mc0 : Core_dTerm.t_Term) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | Core_dTerm.C_Term_TApp (dtb__0, dtb__1, dtb__2) -> ((v_flattenAppSpineGo dtb__0) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1; B_dData_dPair.f_Pair_second = dtb__2 }, mc1)))
  | _ -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }
))

# 44 "Vuna/Compiler/Lowering/Checks.vuna"
let v_flattenAppSpine = (fun (t : Core_dTerm.t_Term) -> ((v_flattenAppSpineGo t) B_dData_dList.C_List_Nil))

# 34 "Vuna/Compiler/Lowering/Checks.vuna"
let v_flattenConApp = (fun (t : Core_dTerm.t_Term) -> (match (v_flattenAppSpine t) with
  | { B_dData_dPair.f_Pair_first = dtb__3; B_dData_dPair.f_Pair_second = dtb__4 } -> (match dtb__3 with
  | Core_dTerm.C_Term_TCon (dtb__5, dtb__6) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__5; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__6) dtb__4) }))
  | Core_dTerm.C_Term_TMk (dtb__7, dtb__8) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__7; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__8) dtb__4) }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_defTable = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__9, dtb__10) -> (match (Elab_dTypes.v_dtDefBody dtb__9) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__11) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName dtb__9); B_dData_dPair.f_Pair_second = dtb__11 }, (v_defTable dtb__10)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_defTable dtb__10)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_findDtDef = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> (if ((Elab_dTypes.v_dtDefName dtb__12) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__12)) else ((v_findDtDef mc0) dtb__13))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Lowering/Checks.vuna"
let v_isAxiomDef = (fun (d : Elab_dTypes.t_DtDef) -> (B_dData_dBool.v_not (Elab_dTypes.v_dtDefHasBody d)))

# 70 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_axiomNamesOf = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (if (v_isAxiomDef dtb__14) then (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.v_dtDefName dtb__14), (v_axiomNamesOf dtb__15))) else (v_axiomNamesOf dtb__15))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Lowering/Checks.vuna"
let v_isTypeLevelDef = (fun (tbl : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (d : Elab_dTypes.t_DtDef) -> (Elab_dUsage.v_isTypeForming ((((Core_dEval.v_force tbl) Core_dTerm.v_solsEmpty) Core_dTerm.v_defaultFuel) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtDefType d)))))

# 84 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_partitionDefsGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (mc2 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (if (v_isAxiomDef dtb__16) then ((((v_partitionDefsGo mc0) dtb__17) mc2) (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.v_dtDefName dtb__16), mc3))) else (if ((v_isTypeLevelDef mc0) dtb__16) then ((((v_partitionDefsGo mc0) dtb__17) mc2) (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.v_dtDefName dtb__16), mc3))) else ((((v_partitionDefsGo mc0) dtb__17) (B_dData_dList.C_List__x58__x58_ (dtb__16, mc2))) mc3)))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc2); B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse mc3) }
  | _ -> failwith "DT: impossible branch"
))

# 81 "Vuna/Compiler/Lowering/Checks.vuna"
let v_partitionDefs = (fun (table : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((((v_partitionDefsGo (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) table)) defs) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 97 "Vuna/Compiler/Lowering/Checks.vuna"
let v_defLocDiag = (fun (d : Elab_dTypes.t_DtDef) (e : Base_dDiag.t_Diagnostic) -> (((Base_dDiag.v_withContext (Elab_dTypes.v_dtDefSpan d)) (Elab_dTypes.v_dtDefName d)) e))

# 139 "Vuna/Compiler/Lowering/Checks.vuna"
let v_showMetaHint = (fun (m : int) -> (" ?" ^ (bi_strFromInt m)))

# 200 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_binderAt = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (if (mc0 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__18)) else ((v_binderAt (mc0 - 1)) dtb__19))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 142 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_checkErasureNode = (fun (fuel : int) (typeNames : string B_dData_dList.t_List) (binders : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "erasure") else (match t with
  | Core_dTerm.C_Term_TVar (dtb__20, dtb__21, dtb__22) -> (let nd_uscrut7 = ((v_binderAt dtb__21) binders) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal (String.concat "" ["unbound runtime variable "; dtb__20; " (index "; (bi_strFromInt dtb__21); ", binders "; (bi_strFromInt (B_dData_dList.v_length binders)); ")"]))
  | B_dData_dMaybe.C_Maybe_Just (dtb__23) -> (match dtb__23 with
  | { B_dData_dPair.f_Pair_first = dtb__24; B_dData_dPair.f_Pair_second = dtb__25 } -> (if (Core_dTerm.v_rigIsErased dtb__25) then ((Base_dDiagnostics_dCg.v_cgErr1 (Base_dDiagnostics_dCg.C_CgErr_TypeLevelBindingRuntime (dtb__20))) dtb__20) else (Base_dDiag.C_Check_OkC (0)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Core_dTerm.C_Term_TGlobal (dtb__26) -> (if ((B_dData_dList.v_memName dtb__26) typeNames) then ((Base_dDiagnostics_dCg.v_cgErr1 (Base_dDiagnostics_dCg.C_CgErr_TypeLevelNameRuntime (dtb__26))) dtb__26) else (Base_dDiag.C_Check_OkC (0)))
  | Core_dTerm.C_Term_TType (dtb__27) -> (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_TypeUsedAtRuntime)
  | Core_dTerm.C_Term_TPi (dtb__28, dtb__29, dtb__30, dtb__31, dtb__32) -> (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_TypeUsedAtRuntime)
  | Core_dTerm.C_Term_TMeta (dtb__33) -> ((Base_dDiagnostics_dCg.v_cgErr1 (Base_dDiagnostics_dCg.C_CgErr_UnsolvedMetavarRuntime ((v_showMetaHint dtb__33)))) (v_showMetaHint dtb__33))
  | Core_dTerm.C_Term_TLam (dtb__34, dtb__35, dtb__36, dtb__37, dtb__38) -> ((((v_checkErasureFuel (fuel - 1)) typeNames) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__34; B_dData_dPair.f_Pair_second = dtb__35 }, binders))) dtb__38)
  | Core_dTerm.C_Term_TApp (dtb__39, dtb__40, dtb__41) -> (let nd_uscrut7 = (v_flattenConApp t) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Core_dTerm.v_rigIsErased dtb__41) then ((((v_checkErasureFuel (fuel - 1)) typeNames) binders) dtb__39) else ((Base_dCommon.v_bind ((((v_checkErasureFuel (fuel - 1)) typeNames) binders) dtb__39)) (fun (_u : int) -> ((((v_checkErasureFuel (fuel - 1)) typeNames) binders) dtb__40))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__42) -> (match dtb__42 with
  | { B_dData_dPair.f_Pair_first = dtb__43; B_dData_dPair.f_Pair_second = dtb__44 } -> ((((v_checkConArgsErasureFuel (fuel - 1)) typeNames) binders) dtb__44)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Core_dTerm.C_Term_TCon (dtb__45, dtb__46) -> ((((v_checkConArgsErasureFuel (fuel - 1)) typeNames) binders) dtb__46)
  | Core_dTerm.C_Term_TMk (dtb__47, dtb__48) -> ((((v_checkConArgsErasureFuel (fuel - 1)) typeNames) binders) dtb__48)
  | Core_dTerm.C_Term_TRecord (dtb__49, dtb__50) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TProj (dtb__51, dtb__52, dtb__53, dtb__54, dtb__55) -> ((((v_checkErasureFuel (fuel - 1)) typeNames) binders) dtb__51)
  | Core_dTerm.C_Term_TRecUpd (dtb__56, dtb__57, dtb__58, dtb__59, dtb__60) -> ((Base_dCommon.v_bind ((((v_checkErasureFuel (fuel - 1)) typeNames) binders) dtb__56)) (fun (_u : int) -> ((((v_checkAltErasureFuel (fuel - 1)) typeNames) binders) (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = dtb__57; Core_dTerm.f_CaseAlt_caseAltBinders = (Core_dTerm.v_bindersOfPairs dtb__58); Core_dTerm.f_CaseAlt_caseAltBody = dtb__60 }, B_dData_dList.C_List_Nil)))))
  | Core_dTerm.C_Term_TCase (dtb__61, dtb__62) -> ((Base_dCommon.v_bind ((((v_checkErasureFuel (fuel - 1)) typeNames) binders) dtb__61)) (fun (_u : int) -> ((((v_checkAltErasureFuel (fuel - 1)) typeNames) binders) dtb__62)))
  | Core_dTerm.C_Term_TInt (dtb__63) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TStr (dtb__64) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TFloat (dtb__65) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TBool (dtb__66) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TIf (dtb__67, dtb__68, dtb__69) -> ((Base_dCommon.v_bind ((((v_checkErasureFuel (fuel - 1)) typeNames) binders) dtb__67)) (fun (_u : int) -> ((Base_dCommon.v_bind ((((v_checkErasureFuel (fuel - 1)) typeNames) binders) dtb__68)) (fun (_u : int) -> ((((v_checkErasureFuel (fuel - 1)) typeNames) binders) dtb__69)))))
  | _ -> failwith "DT: impossible branch"
)))
# 177 "Vuna/Compiler/Lowering/Checks.vuna"
and v_checkConArgsErasureFuel = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__70, dtb__71) -> (match dtb__70 with
  | { B_dData_dPair.f_Pair_first = dtb__72; B_dData_dPair.f_Pair_second = dtb__73 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "erasure") else (if (Core_dTerm.v_rigIsErased dtb__73) then ((((v_checkConArgsErasureFuel (mc0 - 1)) mc1) mc2) dtb__71) else ((Base_dCommon.v_bind ((((v_checkErasureFuel (mc0 - 1)) mc1) mc2) dtb__72)) (fun (_u : int) -> ((((v_checkConArgsErasureFuel (mc0 - 1)) mc1) mc2) dtb__71)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "erasure") else (Base_dDiag.C_Check_OkC (0)))
  | _ -> failwith "DT: impossible branch"
))
# 189 "Vuna/Compiler/Lowering/Checks.vuna"
and v_checkAltErasureFuel = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "erasure") else (let altBinders = (Core_dTerm.v_binderPairs (Core_dTerm.v_caseAltBinders dtb__74)) in (let env = ((B_dData_dList.v_append (B_dData_dList.v_reverse altBinders)) mc2) in ((Base_dCommon.v_bind ((((v_checkErasureFuel (mc0 - 1)) mc1) env) (Core_dTerm.v_caseAltBody dtb__74))) (fun (_u : int) -> ((((v_checkAltErasureFuel (mc0 - 1)) mc1) mc2) dtb__75))))))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "erasure") else (Base_dDiag.C_Check_OkC (0)))
  | _ -> failwith "DT: impossible branch"
))
# 457 "Vuna/Compiler/Lowering/Checks.vuna"
and v_checkErasureFuel = (fun (fuel : int) (typeNames : string B_dData_dList.t_List) (binders : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "erasure") else (match (Core_dTerm.v_natChainValue t) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__76) -> (Base_dDiag.C_Check_OkC (0))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_checkErasureNode fuel) typeNames) binders) t)
  | _ -> failwith "DT: impossible branch"
)))

# 256 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_addName = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__77, dtb__78) -> (if (dtb__77 = mc0) then (B_dData_dList.C_List__x58__x58_ (dtb__77, dtb__78)) else (B_dData_dList.C_List__x58__x58_ (dtb__77, ((v_addName mc0) dtb__78))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_termDepsIntoFuel = (fun (fuel : int) (runtimeNames : (string, bool) B_dContainer_dHashMap.t_HashMap) (acc : string B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then acc else (match t with
  | Core_dTerm.C_Term_TGlobal (dtb__79) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__79) runtimeNames) then ((v_addName dtb__79) acc) else acc)
  | Core_dTerm.C_Term_TVar (dtb__80, dtb__81, dtb__82) -> acc
  | Core_dTerm.C_Term_TMeta (dtb__83) -> acc
  | Core_dTerm.C_Term_TType (dtb__84) -> acc
  | Core_dTerm.C_Term_TPi (dtb__85, dtb__86, dtb__87, dtb__88, dtb__89) -> acc
  | Core_dTerm.C_Term_TLam (dtb__90, dtb__91, dtb__92, dtb__93, dtb__94) -> ((((v_termDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__94)
  | Core_dTerm.C_Term_TApp (dtb__95, dtb__96, dtb__97) -> (let nd_uscrut7 = (v_flattenConApp t) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Core_dTerm.v_rigIsErased dtb__97) then ((((v_termDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__95) else ((((v_termDepsIntoFuel (fuel - 1)) runtimeNames) ((((v_termDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__95)) dtb__96))
  | B_dData_dMaybe.C_Maybe_Just (dtb__98) -> (match dtb__98 with
  | { B_dData_dPair.f_Pair_first = dtb__99; B_dData_dPair.f_Pair_second = dtb__100 } -> ((((v_termDepsArgsFuel (fuel - 1)) runtimeNames) acc) dtb__100)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Core_dTerm.C_Term_TCon (dtb__101, dtb__102) -> ((((v_termDepsArgsFuel (fuel - 1)) runtimeNames) acc) dtb__102)
  | Core_dTerm.C_Term_TMk (dtb__103, dtb__104) -> ((((v_termDepsArgsFuel (fuel - 1)) runtimeNames) acc) dtb__104)
  | Core_dTerm.C_Term_TRecord (dtb__105, dtb__106) -> acc
  | Core_dTerm.C_Term_TProj (dtb__107, dtb__108, dtb__109, dtb__110, dtb__111) -> ((((v_termDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__107)
  | Core_dTerm.C_Term_TRecUpd (dtb__112, dtb__113, dtb__114, dtb__115, dtb__116) -> ((((v_termDepsAltsFuel (fuel - 1)) runtimeNames) ((((v_termDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__112)) (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = dtb__113; Core_dTerm.f_CaseAlt_caseAltBinders = (Core_dTerm.v_bindersOfPairs dtb__114); Core_dTerm.f_CaseAlt_caseAltBody = dtb__116 }, B_dData_dList.C_List_Nil)))
  | Core_dTerm.C_Term_TCase (dtb__117, dtb__118) -> ((((v_termDepsAltsFuel (fuel - 1)) runtimeNames) ((((v_termDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__117)) dtb__118)
  | Core_dTerm.C_Term_TInt (dtb__119) -> acc
  | Core_dTerm.C_Term_TStr (dtb__120) -> acc
  | Core_dTerm.C_Term_TFloat (dtb__121) -> acc
  | Core_dTerm.C_Term_TBool (dtb__122) -> acc
  | Core_dTerm.C_Term_TIf (dtb__123, dtb__124, dtb__125) -> ((((v_termDepsIntoFuel (fuel - 1)) runtimeNames) ((((v_termDepsIntoFuel (fuel - 1)) runtimeNames) ((((v_termDepsIntoFuel (fuel - 1)) runtimeNames) acc) dtb__123)) dtb__124)) dtb__125)
  | _ -> failwith "DT: impossible branch"
)))
# 234 "Vuna/Compiler/Lowering/Checks.vuna"
and v_termDepsArgsFuel = (fun (mc0 : int) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : string B_dData_dList.t_List) (mc3 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__126, dtb__127) -> (match dtb__126 with
  | { B_dData_dPair.f_Pair_first = dtb__128; B_dData_dPair.f_Pair_second = dtb__129 } -> (if (mc0 <= 0) then mc2 else (if (Core_dTerm.v_rigIsErased dtb__129) then ((((v_termDepsArgsFuel (mc0 - 1)) mc1) mc2) dtb__127) else ((((v_termDepsArgsFuel (mc0 - 1)) mc1) ((((v_termDepsIntoFuel (mc0 - 1)) mc1) mc2) dtb__128)) dtb__127)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc2 else mc2)
  | _ -> failwith "DT: impossible branch"
))
# 244 "Vuna/Compiler/Lowering/Checks.vuna"
and v_termDepsAltsFuel = (fun (mc0 : int) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : string B_dData_dList.t_List) (mc3 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__130, dtb__131) -> (if (mc0 <= 0) then mc2 else ((((v_termDepsAltsFuel (mc0 - 1)) mc1) ((((v_termDepsIntoFuel (mc0 - 1)) mc1) mc2) (Core_dTerm.v_caseAltBody dtb__130))) dtb__131))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then mc2 else mc2)
  | _ -> failwith "DT: impossible branch"
))

# 273 "Vuna/Compiler/Lowering/Checks.vuna"
let v_noUseFlags = { f_UseFlags_useFlagsFloat = false; f_UseFlags_useFlagsTrace = false; f_UseFlags_useFlagsObs = false }

# 276 "Vuna/Compiler/Lowering/Checks.vuna"
let v_orUseFlags = (fun (a : t_UseFlags) (b : t_UseFlags) -> { f_UseFlags_useFlagsFloat = (if (a).f_UseFlags_useFlagsFloat then true else (b).f_UseFlags_useFlagsFloat); f_UseFlags_useFlagsTrace = (if (a).f_UseFlags_useFlagsTrace then true else (b).f_UseFlags_useFlagsTrace); f_UseFlags_useFlagsObs = (if (a).f_UseFlags_useFlagsObs then true else (b).f_UseFlags_useFlagsObs) })

# 294 "Vuna/Compiler/Lowering/Checks.vuna"
let v_useBudgetFor = (fun (size : int) -> (512 + (4 * size)))

# 297 "Vuna/Compiler/Lowering/Checks.vuna"
let v_addRuntimeDep = (fun (names : (string, bool) B_dContainer_dHashMap.t_HashMap) (live : bool) (n : string) (u : t_TermUse) -> (if (if live then ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) n) names) else false) then { f_TermUse_termUseDeps = ((v_addName n) (u).f_TermUse_termUseDeps); f_TermUse_termUseFlags = (u).f_TermUse_termUseFlags; f_TermUse_termUseFloatLit = (u).f_TermUse_termUseFloatLit } else u))

# 304 "Vuna/Compiler/Lowering/Checks.vuna"
let v_withFlags = (fun (f : t_UseFlags) (u : t_TermUse) -> { f_TermUse_termUseDeps = (u).f_TermUse_termUseDeps; f_TermUse_termUseFlags = ((v_orUseFlags (u).f_TermUse_termUseFlags) f); f_TermUse_termUseFloatLit = (u).f_TermUse_termUseFloatLit })

# 307 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_termUseFuel = (fun (fuel : int) (names : (string, bool) B_dContainer_dHashMap.t_HashMap) (flagOf : (string) -> t_UseFlags) (live : bool) (acc : t_TermUse) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then acc else (match t with
  | Core_dTerm.C_Term_TGlobal (dtb__132) -> ((v_withFlags (flagOf dtb__132)) ((((v_addRuntimeDep names) live) dtb__132) acc))
  | Core_dTerm.C_Term_TFloat (dtb__133) -> { f_TermUse_termUseDeps = (acc).f_TermUse_termUseDeps; f_TermUse_termUseFlags = (acc).f_TermUse_termUseFlags; f_TermUse_termUseFloatLit = true }
  | Core_dTerm.C_Term_TVar (dtb__134, dtb__135, dtb__136) -> acc
  | Core_dTerm.C_Term_TMeta (dtb__137) -> acc
  | Core_dTerm.C_Term_TType (dtb__138) -> acc
  | Core_dTerm.C_Term_TInt (dtb__139) -> acc
  | Core_dTerm.C_Term_TStr (dtb__140) -> acc
  | Core_dTerm.C_Term_TBool (dtb__141) -> acc
  | Core_dTerm.C_Term_TPi (dtb__142, dtb__143, dtb__144, dtb__145, dtb__146) -> ((((((v_termUseFuel (fuel - 1)) names) flagOf) false) ((((((v_termUseFuel (fuel - 1)) names) flagOf) false) acc) dtb__145)) dtb__146)
  | Core_dTerm.C_Term_TLam (dtb__147, dtb__148, dtb__149, dtb__150, dtb__151) -> ((((((v_termUseFuel (fuel - 1)) names) flagOf) live) acc) dtb__151)
  | Core_dTerm.C_Term_TApp (dtb__152, dtb__153, dtb__154) -> ((((((v_termUseFuel (fuel - 1)) names) flagOf) (if live then (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased dtb__154)) else false)) ((((((v_termUseFuel (fuel - 1)) names) flagOf) live) acc) dtb__152)) dtb__153)
  | Core_dTerm.C_Term_TCon (dtb__155, dtb__156) -> ((((((v_termUseArgsFuel (fuel - 1)) names) flagOf) live) acc) dtb__156)
  | Core_dTerm.C_Term_TMk (dtb__157, dtb__158) -> ((((((v_termUseArgsFuel (fuel - 1)) names) flagOf) live) acc) dtb__158)
  | Core_dTerm.C_Term_TRecord (dtb__159, dtb__160) -> ((((((v_termUseArgsFuel (fuel - 1)) names) flagOf) false) acc) dtb__160)
  | Core_dTerm.C_Term_TProj (dtb__161, dtb__162, dtb__163, dtb__164, dtb__165) -> ((((((v_termUseFuel (fuel - 1)) names) flagOf) live) acc) dtb__161)
  | Core_dTerm.C_Term_TRecUpd (dtb__166, dtb__167, dtb__168, dtb__169, dtb__170) -> ((((((v_termUseFuel (fuel - 1)) names) flagOf) live) ((((((v_termUseFuel (fuel - 1)) names) flagOf) live) acc) dtb__166)) dtb__170)
  | Core_dTerm.C_Term_TCase (dtb__171, dtb__172) -> ((((((v_termUseAltsFuel (fuel - 1)) names) flagOf) live) ((((((v_termUseFuel (fuel - 1)) names) flagOf) live) acc) dtb__171)) dtb__172)
  | Core_dTerm.C_Term_TIf (dtb__173, dtb__174, dtb__175) -> ((((((v_termUseFuel (fuel - 1)) names) flagOf) live) ((((((v_termUseFuel (fuel - 1)) names) flagOf) live) ((((((v_termUseFuel (fuel - 1)) names) flagOf) live) acc) dtb__173)) dtb__174)) dtb__175)
  | _ -> failwith "DT: impossible branch"
)))
# 332 "Vuna/Compiler/Lowering/Checks.vuna"
and v_termUseArgsFuel = (fun (mc0 : int) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : (string) -> t_UseFlags) (mc3 : bool) (mc4 : t_TermUse) (mc5 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__176, dtb__177) -> (match dtb__176 with
  | { B_dData_dPair.f_Pair_first = dtb__178; B_dData_dPair.f_Pair_second = dtb__179 } -> (if (mc0 <= 0) then mc4 else ((((((v_termUseArgsFuel (mc0 - 1)) mc1) mc2) mc3) ((((((v_termUseFuel (mc0 - 1)) mc1) mc2) (if mc3 then (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased dtb__179)) else false)) mc4) dtb__178)) dtb__177))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))
# 346 "Vuna/Compiler/Lowering/Checks.vuna"
and v_termUseAltsFuel = (fun (mc0 : int) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : (string) -> t_UseFlags) (mc3 : bool) (mc4 : t_TermUse) (mc5 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__180, dtb__181) -> (if (mc0 <= 0) then mc4 else ((((((v_termUseAltsFuel (mc0 - 1)) mc1) mc2) mc3) ((((((v_termUseFuel (mc0 - 1)) mc1) mc2) mc3) mc4) (Core_dTerm.v_caseAltBody dtb__180))) dtb__181))
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 289 "Vuna/Compiler/Lowering/Checks.vuna"
let v_termUseInto = (fun (runtimeNames : (string, bool) B_dContainer_dHashMap.t_HashMap) (flagOf : (string) -> t_UseFlags) (t : Core_dTerm.t_Term) -> ((((((v_termUseFuel (v_useBudgetFor (Core_dTerm.v_termSize t))) runtimeNames) flagOf) true) { f_TermUse_termUseDeps = B_dData_dList.C_List_Nil; f_TermUse_termUseFlags = v_noUseFlags; f_TermUse_termUseFloatLit = false }) t))

# 360 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_runtimeNamesOf = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__182, dtb__183) -> (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.v_dtDefName dtb__182), (v_runtimeNamesOf dtb__183)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 369 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_checkTermScopes = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TCase (dtb__184, dtb__185) -> ((Base_dCommon.v_bind ((v_checkTermScopes mc0) dtb__184)) (fun (_u : int) -> ((v_checkAltScopes mc0) dtb__185)))
  | Core_dTerm.C_Term_TRecUpd (dtb__186, dtb__187, dtb__188, dtb__189, dtb__190) -> ((Base_dCommon.v_bind ((v_checkTermScopes mc0) dtb__186)) (fun (_u : int) -> ((v_checkTermScopes (mc0 + (B_dData_dList.v_length dtb__188))) dtb__190)))
  | Core_dTerm.C_Term_TProj (dtb__191, dtb__192, dtb__193, dtb__194, dtb__195) -> ((v_checkTermScopes mc0) dtb__191)
  | Core_dTerm.C_Term_TIf (dtb__196, dtb__197, dtb__198) -> ((Base_dCommon.v_bind ((v_checkTermScopes mc0) dtb__196)) (fun (_u : int) -> ((Base_dCommon.v_bind ((v_checkTermScopes mc0) dtb__197)) (fun (_u : int) -> ((v_checkTermScopes mc0) dtb__198)))))
  | Core_dTerm.C_Term_TPi (dtb__199, dtb__200, dtb__201, dtb__202, dtb__203) -> ((Base_dCommon.v_bind ((v_checkTermScopes mc0) dtb__202)) (fun (_u : int) -> ((v_checkTermScopes (mc0 + 1)) dtb__203)))
  | Core_dTerm.C_Term_TLam (dtb__204, dtb__205, dtb__206, dtb__207, dtb__208) -> ((Base_dCommon.v_bind ((v_checkTermScopesSlot mc0) dtb__206)) (fun (_u : int) -> ((v_checkTermScopes (mc0 + 1)) dtb__208)))
  | Core_dTerm.C_Term_TRecord (dtb__209, dtb__210) -> ((v_checkTermScopesArgs mc0) dtb__210)
  | Core_dTerm.C_Term_TMk (dtb__211, dtb__212) -> ((v_checkTermScopesArgs mc0) dtb__212)
  | Core_dTerm.C_Term_TCon (dtb__213, dtb__214) -> ((v_checkTermScopesArgs mc0) dtb__214)
  | Core_dTerm.C_Term_TApp (dtb__215, dtb__216, dtb__217) -> ((Base_dCommon.v_bind ((v_checkTermScopes mc0) dtb__215)) (fun (_u : int) -> ((v_checkTermScopes mc0) dtb__216)))
  | Core_dTerm.C_Term_TMeta (dtb__218) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TType (dtb__219) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TBool (dtb__220) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TFloat (dtb__221) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TStr (dtb__222) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TInt (dtb__223) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TGlobal (dtb__224) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TVar (dtb__225, dtb__226, dtb__227) -> (if (dtb__226 >= 0) then (if (dtb__226 < mc0) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal (String.concat "" ["out-of-scope de Bruijn index "; (bi_strFromInt dtb__226); " (depth "; (bi_strFromInt mc0); ")"]))) else (Base_dDiag.v_icInternal ("negative de Bruijn index " ^ (bi_strFromInt dtb__226))))
  | _ -> failwith "DT: impossible branch"
))
# 407 "Vuna/Compiler/Lowering/Checks.vuna"
and v_checkTermScopesMaybe = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__228) -> ((v_checkTermScopes mc0) dtb__228)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))
# 411 "Vuna/Compiler/Lowering/Checks.vuna"
and v_checkTermScopesSlot = (fun (mc0 : int) (mc1 : (Core_dTerm.t_LamMark, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__229) -> ((Base_dCommon.v_bind ((v_checkTermScopesMaybe mc0) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__229)))) (fun (_u : int) -> ((v_checkTermScopesMaybe (mc0 + 1)) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__229)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))
# 418 "Vuna/Compiler/Lowering/Checks.vuna"
and v_checkTermScopesArgs = (fun (mc0 : int) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__230, dtb__231) -> (match dtb__230 with
  | { B_dData_dPair.f_Pair_first = dtb__232; B_dData_dPair.f_Pair_second = dtb__233 } -> ((Base_dCommon.v_bind ((v_checkTermScopes mc0) dtb__232)) (fun (_u : int) -> ((v_checkTermScopesArgs mc0) dtb__231)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))
# 423 "Vuna/Compiler/Lowering/Checks.vuna"
and v_checkAltScopes = (fun (mc0 : int) (mc1 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__234, dtb__235) -> ((Base_dCommon.v_bind ((v_checkTermScopes (mc0 + (B_dData_dList.v_length (Core_dTerm.v_caseAltBinders dtb__234)))) (Core_dTerm.v_caseAltBody dtb__234))) (fun (_u : int) -> ((v_checkAltScopes mc0) dtb__235)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 430 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_checkAllDefScopes = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__236, dtb__237) -> (match (Elab_dTypes.v_dtDefBody dtb__236) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_checkAllDefScopes dtb__237)
  | B_dData_dMaybe.C_Maybe_Just (dtb__238) -> (match ((v_checkTermScopes 0) dtb__238) with
  | Base_dDiag.C_Check_ErrC (dtb__239) -> (Base_dDiag.C_Check_ErrC (((v_defLocDiag dtb__236) dtb__239)))
  | Base_dDiag.C_Check_OkC (dtb__240) -> (v_checkAllDefScopes dtb__237)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 442 "Vuna/Compiler/Lowering/Checks.vuna"
let v_termDepsInto = (fun (a1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (a2 : string B_dData_dList.t_List) (a3 : Core_dTerm.t_Term) -> ((((v_termDepsIntoFuel (v_useBudgetFor (Core_dTerm.v_termSize a3))) a1) a2) a3))

# 105 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_checkNoAxiomRuntimeGo = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__241, dtb__242) -> (match (Elab_dTypes.v_dtDefBody dtb__241) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_checkNoAxiomRuntimeGo mc0) dtb__242)
  | B_dData_dMaybe.C_Maybe_Just (dtb__243) -> (match (((v_termDepsInto mc0) B_dData_dList.C_List_Nil) dtb__243) with
  | B_dData_dList.C_List_Nil -> ((v_checkNoAxiomRuntimeGo mc0) dtb__242)
  | B_dData_dList.C_List__x58__x58_ (dtb__244, dtb__245) -> ((((Base_dDiagnostics_dCg.v_cgErrDefAt (Elab_dTypes.v_dtDefSpan dtb__241)) (Elab_dTypes.v_dtDefName dtb__241)) (Base_dDiagnostics_dCg.C_CgErr_AxiomAtRuntime (dtb__244))) (B_dData_dVec.C_Vec_VCons (dtb__244, B_dData_dVec.C_Vec_Nil)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 102 "Vuna/Compiler/Lowering/Checks.vuna"
let v_checkNoAxiomRuntime = (fun (axiomNames : string B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((v_checkNoAxiomRuntimeGo (B_dContainer_dHashMap.v_ofNames axiomNames)) defs))

# 445 "Vuna/Compiler/Lowering/Checks.vuna"
let v_termDepsArgs = (fun (a1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (a2 : string B_dData_dList.t_List) (a3 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((v_termDepsArgsFuel 100000) a1) a2) a3))

# 448 "Vuna/Compiler/Lowering/Checks.vuna"
let v_termDepsAlts = (fun (a1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (a2 : string B_dData_dList.t_List) (a3 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> ((((v_termDepsAltsFuel 100000) a1) a2) a3))

# 474 "Vuna/Compiler/Lowering/Checks.vuna"
let v_erasureFuelMax = 1000000

# 468 "Vuna/Compiler/Lowering/Checks.vuna"
let v_erasureFuelFor = (fun (size : int) -> (let scaled = (512 + (4 * size)) in (if (scaled > v_erasureFuelMax) then v_erasureFuelMax else scaled)))

# 451 "Vuna/Compiler/Lowering/Checks.vuna"
let v_checkErasure = (fun (typeNames : string B_dData_dList.t_List) (binders : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> ((((v_checkErasureFuel (v_erasureFuelFor (Core_dTerm.v_termSize t))) typeNames) binders) t))

# 125 "Vuna/Compiler/Lowering/Checks.vuna"
let v_checkOneErasure = (fun (typeNames : string B_dData_dList.t_List) (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefExtern d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__246) -> (Base_dDiag.C_Check_OkC (0))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Elab_dTypes.v_dtDefBody d) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "axiom reached the runtime erasure check (partition must erase it)")
  | B_dData_dMaybe.C_Maybe_Just (dtb__247) -> (match (((v_checkErasure typeNames) B_dData_dList.C_List_Nil) dtb__247) with
  | Base_dDiag.C_Check_ErrC (dtb__248) -> (Base_dDiag.C_Check_ErrC (((v_defLocDiag d) dtb__248)))
  | Base_dDiag.C_Check_OkC (dtb__249) -> (Base_dDiag.C_Check_OkC (dtb__249))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_checkAllErasure = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__250, dtb__251) -> ((Base_dCommon.v_bind ((v_checkOneErasure mc0) dtb__250)) (fun (_u : int) -> ((v_checkAllErasure mc0) dtb__251)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 477 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_erasureFuelForArgs = (fun (mc0 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__252, dtb__253) -> (match dtb__252 with
  | { B_dData_dPair.f_Pair_first = dtb__254; B_dData_dPair.f_Pair_second = dtb__255 } -> (let total = ((Core_dTerm.v_termSize dtb__254) + (v_erasureFuelForArgs dtb__253)) in (if (total > v_erasureFuelMax) then v_erasureFuelMax else total))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 484 "Vuna/Compiler/Lowering/Checks.vuna"
let v_checkConArgsErasure = (fun (a1 : string B_dData_dList.t_List) (a2 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (a3 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((v_checkConArgsErasureFuel (v_erasureFuelFor (v_erasureFuelForArgs a3))) a1) a2) a3))

# 491 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_erasureFuelForAlts = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__256, dtb__257) -> (let total = ((Core_dTerm.v_termSize (Core_dTerm.v_caseAltBody dtb__256)) + (v_erasureFuelForAlts dtb__257)) in (if (total > v_erasureFuelMax) then v_erasureFuelMax else total))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 488 "Vuna/Compiler/Lowering/Checks.vuna"
let v_checkAltErasure = (fun (a1 : string B_dData_dList.t_List) (a2 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (a3 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> ((((v_checkAltErasureFuel (v_erasureFuelFor (v_erasureFuelForAlts a3))) a1) a2) a3))

# 268 "Vuna/Compiler/Lowering/Checks.vuna"
let v_useFlagsFloat = (fun (p : t_UseFlags) -> (match p with
  | { f_UseFlags_useFlagsFloat = dtb__258; f_UseFlags_useFlagsTrace = dtb__259; f_UseFlags_useFlagsObs = dtb__260 } -> dtb__258
  | _ -> failwith "DT: impossible branch"
))

# 269 "Vuna/Compiler/Lowering/Checks.vuna"
let v_useFlagsTrace = (fun (p : t_UseFlags) -> (match p with
  | { f_UseFlags_useFlagsFloat = dtb__261; f_UseFlags_useFlagsTrace = dtb__262; f_UseFlags_useFlagsObs = dtb__263 } -> dtb__262
  | _ -> failwith "DT: impossible branch"
))

# 270 "Vuna/Compiler/Lowering/Checks.vuna"
let v_useFlagsObs = (fun (p : t_UseFlags) -> (match p with
  | { f_UseFlags_useFlagsFloat = dtb__264; f_UseFlags_useFlagsTrace = dtb__265; f_UseFlags_useFlagsObs = dtb__266 } -> dtb__266
  | _ -> failwith "DT: impossible branch"
))

# 284 "Vuna/Compiler/Lowering/Checks.vuna"
let v_termUseDeps = (fun (p : t_TermUse) -> (match p with
  | { f_TermUse_termUseDeps = dtb__267; f_TermUse_termUseFlags = dtb__268; f_TermUse_termUseFloatLit = dtb__269 } -> dtb__267
  | _ -> failwith "DT: impossible branch"
))

# 285 "Vuna/Compiler/Lowering/Checks.vuna"
let v_termUseFlags = (fun (p : t_TermUse) -> (match p with
  | { f_TermUse_termUseDeps = dtb__270; f_TermUse_termUseFlags = dtb__271; f_TermUse_termUseFloatLit = dtb__272 } -> dtb__271
  | _ -> failwith "DT: impossible branch"
))

# 286 "Vuna/Compiler/Lowering/Checks.vuna"
let v_termUseFloatLit = (fun (p : t_TermUse) -> (match p with
  | { f_TermUse_termUseDeps = dtb__273; f_TermUse_termUseFlags = dtb__274; f_TermUse_termUseFloatLit = dtb__275 } -> dtb__275
  | _ -> failwith "DT: impossible branch"
))
