open Vuna_runtime
type t_UseFlags = { f_UseFlags_useFlagsFloat : bool; f_UseFlags_useFlagsTrace : bool; f_UseFlags_useFlagsObs : bool; f_UseFlags_useFlagsHost : bool; f_UseFlags_useFlagsSched : bool; f_UseFlags_useFlagsEff : bool }
and t_TermUse = { f_TermUse_termUseDeps : string B_dData_dList.t_List; f_TermUse_termUseFlags : t_UseFlags; f_TermUse_termUseFloatLit : bool }

# 47 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_flattenAppSpineGo = (fun (dtb_u_u1 : Core_dTerm.t_Term) (dtb_u_u2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u1 with
  | Core_dTerm.C_Term_TApp (dtb_u_u3, dtb_u_u4, dtb_u_u5) -> ((v_flattenAppSpineGo dtb_u_u3) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u4; B_dData_dPair.f_Pair_second = dtb_u_u5 }, dtb_u_u2)))
  | _ -> { B_dData_dPair.f_Pair_first = dtb_u_u1; B_dData_dPair.f_Pair_second = dtb_u_u2 }
))

# 44 "Vuna/Compiler/Lowering/Checks.vuna"
let v_flattenAppSpine = (fun (dtb_u_u6 : Core_dTerm.t_Term) -> ((v_flattenAppSpineGo dtb_u_u6) B_dData_dList.C_List_Nil))

# 34 "Vuna/Compiler/Lowering/Checks.vuna"
let v_flattenConApp = (fun (dtb_u_u7 : Core_dTerm.t_Term) -> (match (v_flattenAppSpine dtb_u_u7) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u8; B_dData_dPair.f_Pair_second = dtb_u_u9 } -> (match dtb_u_u8 with
  | Core_dTerm.C_Term_TCon (dtb_u_u10, dtb_u_u11) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u10; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb_u_u11) dtb_u_u9) }))
  | Core_dTerm.C_Term_TMk (dtb_u_u12, dtb_u_u13) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u12; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb_u_u13) dtb_u_u9) }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Lowering/Checks.vuna"
let[@tail_mod_cons] rec v_defTable = (fun (dtb_u_u14 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u14 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u15, dtb_u_u16) -> (match (Elab_dTypes.v_dtDefBody dtb_u_u15) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u17) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName dtb_u_u15); B_dData_dPair.f_Pair_second = dtb_u_u17 }, (v_defTable dtb_u_u16)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_defTable dtb_u_u16)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_findDtDef = (fun (dtb_u_u18 : string) (dtb_u_u19 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u19 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u20, dtb_u_u21) -> (if ((Elab_dTypes.v_dtDefName dtb_u_u20) = dtb_u_u18) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u20)) else ((v_findDtDef dtb_u_u18) dtb_u_u21))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Lowering/Checks.vuna"
let v_isAxiomDef = (fun (dtb_u_u22 : Elab_dTypes.t_DtDef) -> (B_dData_dBool.v_not (Elab_dTypes.v_dtDefHasBody dtb_u_u22)))

# 70 "Vuna/Compiler/Lowering/Checks.vuna"
let[@tail_mod_cons] rec v_axiomNamesOf = (fun (dtb_u_u23 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u23 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u24, dtb_u_u25) -> (if (v_isAxiomDef dtb_u_u24) then (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.v_dtDefName dtb_u_u24), (v_axiomNamesOf dtb_u_u25))) else (v_axiomNamesOf dtb_u_u25))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Lowering/Checks.vuna"
let v_isTypeLevelDef = (fun (dtb_u_u26 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u27 : Elab_dTypes.t_DtDef) -> (Elab_dUsage.v_isTypeForming ((((Core_dEval.v_force dtb_u_u26) Core_dTerm.v_solsEmpty) Core_dTerm.v_defaultFuel) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtDefType dtb_u_u27)))))

# 84 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_partitionDefsGo = (fun (dtb_u_u28 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u29 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u30 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u31 : string B_dData_dList.t_List) -> (match dtb_u_u29 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u32, dtb_u_u33) -> (if (v_isAxiomDef dtb_u_u32) then ((((v_partitionDefsGo dtb_u_u28) dtb_u_u33) dtb_u_u30) (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.v_dtDefName dtb_u_u32), dtb_u_u31))) else (if ((v_isTypeLevelDef dtb_u_u28) dtb_u_u32) then ((((v_partitionDefsGo dtb_u_u28) dtb_u_u33) dtb_u_u30) (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.v_dtDefName dtb_u_u32), dtb_u_u31))) else ((((v_partitionDefsGo dtb_u_u28) dtb_u_u33) (B_dData_dList.C_List__x58__x58_ (dtb_u_u32, dtb_u_u30))) dtb_u_u31)))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u30); B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse dtb_u_u31) }
  | _ -> failwith "DT: impossible branch"
))

# 81 "Vuna/Compiler/Lowering/Checks.vuna"
let v_partitionDefs = (fun (dtb_u_u34 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u35 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((((v_partitionDefsGo (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u34)) dtb_u_u35) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 97 "Vuna/Compiler/Lowering/Checks.vuna"
let v_defLocDiag = (fun (dtb_u_u36 : Elab_dTypes.t_DtDef) (dtb_u_u37 : Base_dDiag.t_Diagnostic) -> (((Base_dDiag.v_withContext (Elab_dTypes.v_dtDefSpan dtb_u_u36)) (Elab_dTypes.v_dtDefName dtb_u_u36)) dtb_u_u37))

# 139 "Vuna/Compiler/Lowering/Checks.vuna"
let v_showMetaHint = (fun (dtb_u_u38 : int) -> (" ?" ^ (string_of_int dtb_u_u38)))

# 200 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_binderAt = (fun (dtb_u_u39 : int) (dtb_u_u40 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u40 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u41, dtb_u_u42) -> (if (dtb_u_u39 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u41)) else ((v_binderAt (dtb_u_u39 - 1)) dtb_u_u42))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 142 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_checkErasureNode = (fun (dtb_u_u43 : int) (dtb_u_u44 : string B_dData_dList.t_List) (dtb_u_u45 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u46 : Core_dTerm.t_Term) -> (if (dtb_u_u43 <= 0) then (Base_dDiag.v_icFuel "erasure") else (match dtb_u_u46 with
  | Core_dTerm.C_Term_TVar (dtb_u_u47, dtb_u_u48, dtb_u_u49) -> (let dtb_u_u50 = ((v_binderAt dtb_u_u48) dtb_u_u45) in (match dtb_u_u50 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal (String.concat "" ["unbound runtime variable "; dtb_u_u47; " (index "; (string_of_int dtb_u_u48); ", binders "; (string_of_int (B_dData_dList.v_length dtb_u_u45)); ")"]))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u51) -> (match dtb_u_u51 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u52; B_dData_dPair.f_Pair_second = dtb_u_u53 } -> (if (Core_dTerm.v_rigIsErased dtb_u_u53) then ((Base_dDiagnostics_dCg.v_cgErr1 (Base_dDiagnostics_dCg.C_CgErr_TypeLevelBindingRuntime (dtb_u_u47))) dtb_u_u47) else (Base_dDiag.C_Check_OkC (0)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Core_dTerm.C_Term_TGlobal (dtb_u_u54) -> (if ((B_dData_dList.v_memName dtb_u_u54) dtb_u_u44) then ((Base_dDiagnostics_dCg.v_cgErr1 (Base_dDiagnostics_dCg.C_CgErr_TypeLevelNameRuntime (dtb_u_u54))) dtb_u_u54) else (Base_dDiag.C_Check_OkC (0)))
  | Core_dTerm.C_Term_TType (dtb_u_u55) -> (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_TypeUsedAtRuntime)
  | Core_dTerm.C_Term_TPi (dtb_u_u56, dtb_u_u57, dtb_u_u58, dtb_u_u59, dtb_u_u60) -> (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_TypeUsedAtRuntime)
  | Core_dTerm.C_Term_TMeta (dtb_u_u61) -> ((Base_dDiagnostics_dCg.v_cgErr1 (Base_dDiagnostics_dCg.C_CgErr_UnsolvedMetavarRuntime ((v_showMetaHint dtb_u_u61)))) (v_showMetaHint dtb_u_u61))
  | Core_dTerm.C_Term_TLam (dtb_u_u62, dtb_u_u63, dtb_u_u64, dtb_u_u65, dtb_u_u66) -> ((((v_checkErasureFuel (dtb_u_u43 - 1)) dtb_u_u44) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u62; B_dData_dPair.f_Pair_second = dtb_u_u63 }, dtb_u_u45))) dtb_u_u66)
  | Core_dTerm.C_Term_TApp (dtb_u_u67, dtb_u_u68, dtb_u_u69) -> (let dtb_u_u70 = (v_flattenConApp dtb_u_u46) in (match dtb_u_u70 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Core_dTerm.v_rigIsErased dtb_u_u69) then ((((v_checkErasureFuel (dtb_u_u43 - 1)) dtb_u_u44) dtb_u_u45) dtb_u_u67) else ((Base_dCommon.v_bind ((((v_checkErasureFuel (dtb_u_u43 - 1)) dtb_u_u44) dtb_u_u45) dtb_u_u67)) (fun (dtb_u_u71 : int) -> ((((v_checkErasureFuel (dtb_u_u43 - 1)) dtb_u_u44) dtb_u_u45) dtb_u_u68))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u72) -> (match dtb_u_u72 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u73; B_dData_dPair.f_Pair_second = dtb_u_u74 } -> ((((v_checkConArgsErasureFuel (dtb_u_u43 - 1)) dtb_u_u44) dtb_u_u45) dtb_u_u74)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Core_dTerm.C_Term_TCon (dtb_u_u75, dtb_u_u76) -> ((((v_checkConArgsErasureFuel (dtb_u_u43 - 1)) dtb_u_u44) dtb_u_u45) dtb_u_u76)
  | Core_dTerm.C_Term_TMk (dtb_u_u77, dtb_u_u78) -> ((((v_checkConArgsErasureFuel (dtb_u_u43 - 1)) dtb_u_u44) dtb_u_u45) dtb_u_u78)
  | Core_dTerm.C_Term_TRecord (dtb_u_u79, dtb_u_u80) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TProj (dtb_u_u81, dtb_u_u82, dtb_u_u83, dtb_u_u84, dtb_u_u85) -> ((((v_checkErasureFuel (dtb_u_u43 - 1)) dtb_u_u44) dtb_u_u45) dtb_u_u81)
  | Core_dTerm.C_Term_TRecUpd (dtb_u_u86, dtb_u_u87, dtb_u_u88, dtb_u_u89, dtb_u_u90) -> ((Base_dCommon.v_bind ((((v_checkErasureFuel (dtb_u_u43 - 1)) dtb_u_u44) dtb_u_u45) dtb_u_u86)) (fun (dtb_u_u91 : int) -> ((((v_checkAltErasureFuel (dtb_u_u43 - 1)) dtb_u_u44) dtb_u_u45) (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u87; Core_dTerm.f_CaseAlt_caseAltBinders = (Core_dTerm.v_bindersOfPairs dtb_u_u88); Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u90 }, B_dData_dList.C_List_Nil)))))
  | Core_dTerm.C_Term_TCase (dtb_u_u92, dtb_u_u93) -> ((Base_dCommon.v_bind ((((v_checkErasureFuel (dtb_u_u43 - 1)) dtb_u_u44) dtb_u_u45) dtb_u_u92)) (fun (dtb_u_u94 : int) -> ((((v_checkAltErasureFuel (dtb_u_u43 - 1)) dtb_u_u44) dtb_u_u45) dtb_u_u93)))
  | Core_dTerm.C_Term_TInt (dtb_u_u95) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TStr (dtb_u_u96) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TFloat (dtb_u_u97) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TBool (dtb_u_u98) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TIf (dtb_u_u99, dtb_u_u100, dtb_u_u101) -> ((Base_dCommon.v_bind ((((v_checkErasureFuel (dtb_u_u43 - 1)) dtb_u_u44) dtb_u_u45) dtb_u_u99)) (fun (dtb_u_u102 : int) -> ((Base_dCommon.v_bind ((((v_checkErasureFuel (dtb_u_u43 - 1)) dtb_u_u44) dtb_u_u45) dtb_u_u100)) (fun (dtb_u_u103 : int) -> ((((v_checkErasureFuel (dtb_u_u43 - 1)) dtb_u_u44) dtb_u_u45) dtb_u_u101)))))
  | _ -> failwith "DT: impossible branch"
)))
# 177 "Vuna/Compiler/Lowering/Checks.vuna"
and v_checkConArgsErasureFuel = (fun (dtb_u_u104 : int) (dtb_u_u105 : string B_dData_dList.t_List) (dtb_u_u106 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u107 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u107 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u108, dtb_u_u109) -> (match dtb_u_u108 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u110; B_dData_dPair.f_Pair_second = dtb_u_u111 } -> (if (dtb_u_u104 <= 0) then (Base_dDiag.v_icFuel "erasure") else (if (Core_dTerm.v_rigIsErased dtb_u_u111) then ((((v_checkConArgsErasureFuel (dtb_u_u104 - 1)) dtb_u_u105) dtb_u_u106) dtb_u_u109) else ((Base_dCommon.v_bind ((((v_checkErasureFuel (dtb_u_u104 - 1)) dtb_u_u105) dtb_u_u106) dtb_u_u110)) (fun (dtb_u_u112 : int) -> ((((v_checkConArgsErasureFuel (dtb_u_u104 - 1)) dtb_u_u105) dtb_u_u106) dtb_u_u109)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u104 <= 0) then (Base_dDiag.v_icFuel "erasure") else (Base_dDiag.C_Check_OkC (0)))
  | _ -> failwith "DT: impossible branch"
))
# 189 "Vuna/Compiler/Lowering/Checks.vuna"
and v_checkAltErasureFuel = (fun (dtb_u_u113 : int) (dtb_u_u114 : string B_dData_dList.t_List) (dtb_u_u115 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u116 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u116 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u117, dtb_u_u118) -> (if (dtb_u_u113 <= 0) then (Base_dDiag.v_icFuel "erasure") else (let dtb_u_u119 = (Core_dTerm.v_binderPairs (Core_dTerm.v_caseAltBinders dtb_u_u117)) in (let dtb_u_u120 = ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb_u_u119)) dtb_u_u115) in ((Base_dCommon.v_bind ((((v_checkErasureFuel (dtb_u_u113 - 1)) dtb_u_u114) dtb_u_u120) (Core_dTerm.v_caseAltBody dtb_u_u117))) (fun (dtb_u_u121 : int) -> ((((v_checkAltErasureFuel (dtb_u_u113 - 1)) dtb_u_u114) dtb_u_u115) dtb_u_u118))))))
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u113 <= 0) then (Base_dDiag.v_icFuel "erasure") else (Base_dDiag.C_Check_OkC (0)))
  | _ -> failwith "DT: impossible branch"
))
# 463 "Vuna/Compiler/Lowering/Checks.vuna"
and v_checkErasureFuel = (fun (dtb_u_u122 : int) (dtb_u_u123 : string B_dData_dList.t_List) (dtb_u_u124 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u125 : Core_dTerm.t_Term) -> (if (dtb_u_u122 <= 0) then (Base_dDiag.v_icFuel "erasure") else (match (Core_dTerm.v_natChainValue dtb_u_u125) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u126) -> (Base_dDiag.C_Check_OkC (0))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_checkErasureNode dtb_u_u122) dtb_u_u123) dtb_u_u124) dtb_u_u125)
  | _ -> failwith "DT: impossible branch"
)))

# 256 "Vuna/Compiler/Lowering/Checks.vuna"
let[@tail_mod_cons] rec v_addName = (fun (dtb_u_u127 : string) (dtb_u_u128 : string B_dData_dList.t_List) -> (match dtb_u_u128 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u129, dtb_u_u130) -> (if (dtb_u_u129 = dtb_u_u127) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u129, dtb_u_u130)) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u129, ((v_addName dtb_u_u127) dtb_u_u130))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u127, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_termDepsIntoFuel = (fun (dtb_u_u131 : int) (dtb_u_u132 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u133 : string B_dData_dList.t_List) (dtb_u_u134 : Core_dTerm.t_Term) -> (if (dtb_u_u131 <= 0) then dtb_u_u133 else (match dtb_u_u134 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u135) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u135) dtb_u_u132) then ((v_addName dtb_u_u135) dtb_u_u133) else dtb_u_u133)
  | Core_dTerm.C_Term_TVar (dtb_u_u136, dtb_u_u137, dtb_u_u138) -> dtb_u_u133
  | Core_dTerm.C_Term_TMeta (dtb_u_u139) -> dtb_u_u133
  | Core_dTerm.C_Term_TType (dtb_u_u140) -> dtb_u_u133
  | Core_dTerm.C_Term_TPi (dtb_u_u141, dtb_u_u142, dtb_u_u143, dtb_u_u144, dtb_u_u145) -> dtb_u_u133
  | Core_dTerm.C_Term_TLam (dtb_u_u146, dtb_u_u147, dtb_u_u148, dtb_u_u149, dtb_u_u150) -> ((((v_termDepsIntoFuel (dtb_u_u131 - 1)) dtb_u_u132) dtb_u_u133) dtb_u_u150)
  | Core_dTerm.C_Term_TApp (dtb_u_u151, dtb_u_u152, dtb_u_u153) -> (let dtb_u_u154 = (v_flattenConApp dtb_u_u134) in (match dtb_u_u154 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Core_dTerm.v_rigIsErased dtb_u_u153) then ((((v_termDepsIntoFuel (dtb_u_u131 - 1)) dtb_u_u132) dtb_u_u133) dtb_u_u151) else ((((v_termDepsIntoFuel (dtb_u_u131 - 1)) dtb_u_u132) ((((v_termDepsIntoFuel (dtb_u_u131 - 1)) dtb_u_u132) dtb_u_u133) dtb_u_u151)) dtb_u_u152))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u155) -> (match dtb_u_u155 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u156; B_dData_dPair.f_Pair_second = dtb_u_u157 } -> ((((v_termDepsArgsFuel (dtb_u_u131 - 1)) dtb_u_u132) dtb_u_u133) dtb_u_u157)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Core_dTerm.C_Term_TCon (dtb_u_u158, dtb_u_u159) -> ((((v_termDepsArgsFuel (dtb_u_u131 - 1)) dtb_u_u132) dtb_u_u133) dtb_u_u159)
  | Core_dTerm.C_Term_TMk (dtb_u_u160, dtb_u_u161) -> ((((v_termDepsArgsFuel (dtb_u_u131 - 1)) dtb_u_u132) dtb_u_u133) dtb_u_u161)
  | Core_dTerm.C_Term_TRecord (dtb_u_u162, dtb_u_u163) -> dtb_u_u133
  | Core_dTerm.C_Term_TProj (dtb_u_u164, dtb_u_u165, dtb_u_u166, dtb_u_u167, dtb_u_u168) -> ((((v_termDepsIntoFuel (dtb_u_u131 - 1)) dtb_u_u132) dtb_u_u133) dtb_u_u164)
  | Core_dTerm.C_Term_TRecUpd (dtb_u_u169, dtb_u_u170, dtb_u_u171, dtb_u_u172, dtb_u_u173) -> ((((v_termDepsAltsFuel (dtb_u_u131 - 1)) dtb_u_u132) ((((v_termDepsIntoFuel (dtb_u_u131 - 1)) dtb_u_u132) dtb_u_u133) dtb_u_u169)) (B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u170; Core_dTerm.f_CaseAlt_caseAltBinders = (Core_dTerm.v_bindersOfPairs dtb_u_u171); Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u173 }, B_dData_dList.C_List_Nil)))
  | Core_dTerm.C_Term_TCase (dtb_u_u174, dtb_u_u175) -> ((((v_termDepsAltsFuel (dtb_u_u131 - 1)) dtb_u_u132) ((((v_termDepsIntoFuel (dtb_u_u131 - 1)) dtb_u_u132) dtb_u_u133) dtb_u_u174)) dtb_u_u175)
  | Core_dTerm.C_Term_TInt (dtb_u_u176) -> dtb_u_u133
  | Core_dTerm.C_Term_TStr (dtb_u_u177) -> dtb_u_u133
  | Core_dTerm.C_Term_TFloat (dtb_u_u178) -> dtb_u_u133
  | Core_dTerm.C_Term_TBool (dtb_u_u179) -> dtb_u_u133
  | Core_dTerm.C_Term_TIf (dtb_u_u180, dtb_u_u181, dtb_u_u182) -> ((((v_termDepsIntoFuel (dtb_u_u131 - 1)) dtb_u_u132) ((((v_termDepsIntoFuel (dtb_u_u131 - 1)) dtb_u_u132) ((((v_termDepsIntoFuel (dtb_u_u131 - 1)) dtb_u_u132) dtb_u_u133) dtb_u_u180)) dtb_u_u181)) dtb_u_u182)
  | _ -> failwith "DT: impossible branch"
)))
# 234 "Vuna/Compiler/Lowering/Checks.vuna"
and v_termDepsArgsFuel = (fun (dtb_u_u183 : int) (dtb_u_u184 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u185 : string B_dData_dList.t_List) (dtb_u_u186 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u186 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u187, dtb_u_u188) -> (match dtb_u_u187 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u189; B_dData_dPair.f_Pair_second = dtb_u_u190 } -> (if (dtb_u_u183 <= 0) then dtb_u_u185 else (if (Core_dTerm.v_rigIsErased dtb_u_u190) then ((((v_termDepsArgsFuel (dtb_u_u183 - 1)) dtb_u_u184) dtb_u_u185) dtb_u_u188) else ((((v_termDepsArgsFuel (dtb_u_u183 - 1)) dtb_u_u184) ((((v_termDepsIntoFuel (dtb_u_u183 - 1)) dtb_u_u184) dtb_u_u185) dtb_u_u189)) dtb_u_u188)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u183 <= 0) then dtb_u_u185 else dtb_u_u185)
  | _ -> failwith "DT: impossible branch"
))
# 244 "Vuna/Compiler/Lowering/Checks.vuna"
and v_termDepsAltsFuel = (fun (dtb_u_u191 : int) (dtb_u_u192 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u193 : string B_dData_dList.t_List) (dtb_u_u194 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u194 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u195, dtb_u_u196) -> (if (dtb_u_u191 <= 0) then dtb_u_u193 else ((((v_termDepsAltsFuel (dtb_u_u191 - 1)) dtb_u_u192) ((((v_termDepsIntoFuel (dtb_u_u191 - 1)) dtb_u_u192) dtb_u_u193) (Core_dTerm.v_caseAltBody dtb_u_u195))) dtb_u_u196))
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u191 <= 0) then dtb_u_u193 else dtb_u_u193)
  | _ -> failwith "DT: impossible branch"
))

# 276 "Vuna/Compiler/Lowering/Checks.vuna"
let v_noUseFlags = { f_UseFlags_useFlagsFloat = false; f_UseFlags_useFlagsTrace = false; f_UseFlags_useFlagsObs = false; f_UseFlags_useFlagsHost = false; f_UseFlags_useFlagsSched = false; f_UseFlags_useFlagsEff = false }

# 279 "Vuna/Compiler/Lowering/Checks.vuna"
let v_orUseFlags = (fun (dtb_u_u197 : t_UseFlags) (dtb_u_u198 : t_UseFlags) -> { f_UseFlags_useFlagsFloat = (if (dtb_u_u197).f_UseFlags_useFlagsFloat then true else (dtb_u_u198).f_UseFlags_useFlagsFloat); f_UseFlags_useFlagsTrace = (if (dtb_u_u197).f_UseFlags_useFlagsTrace then true else (dtb_u_u198).f_UseFlags_useFlagsTrace); f_UseFlags_useFlagsObs = (if (dtb_u_u197).f_UseFlags_useFlagsObs then true else (dtb_u_u198).f_UseFlags_useFlagsObs); f_UseFlags_useFlagsHost = (if (dtb_u_u197).f_UseFlags_useFlagsHost then true else (dtb_u_u198).f_UseFlags_useFlagsHost); f_UseFlags_useFlagsSched = (if (dtb_u_u197).f_UseFlags_useFlagsSched then true else (dtb_u_u198).f_UseFlags_useFlagsSched); f_UseFlags_useFlagsEff = (if (dtb_u_u197).f_UseFlags_useFlagsEff then true else (dtb_u_u198).f_UseFlags_useFlagsEff) })

# 300 "Vuna/Compiler/Lowering/Checks.vuna"
let v_useBudgetFor = (fun (dtb_u_u199 : int) -> (512 + (4 * dtb_u_u199)))

# 303 "Vuna/Compiler/Lowering/Checks.vuna"
let v_addRuntimeDep = (fun (dtb_u_u200 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u201 : bool) (dtb_u_u202 : string) (dtb_u_u203 : t_TermUse) -> (if (if dtb_u_u201 then ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u202) dtb_u_u200) else false) then { f_TermUse_termUseDeps = ((v_addName dtb_u_u202) (dtb_u_u203).f_TermUse_termUseDeps); f_TermUse_termUseFlags = (dtb_u_u203).f_TermUse_termUseFlags; f_TermUse_termUseFloatLit = (dtb_u_u203).f_TermUse_termUseFloatLit } else dtb_u_u203))

# 310 "Vuna/Compiler/Lowering/Checks.vuna"
let v_withFlags = (fun (dtb_u_u204 : t_UseFlags) (dtb_u_u205 : t_TermUse) -> { f_TermUse_termUseDeps = (dtb_u_u205).f_TermUse_termUseDeps; f_TermUse_termUseFlags = ((v_orUseFlags (dtb_u_u205).f_TermUse_termUseFlags) dtb_u_u204); f_TermUse_termUseFloatLit = (dtb_u_u205).f_TermUse_termUseFloatLit })

# 313 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_termUseFuel = (fun (dtb_u_u206 : int) (dtb_u_u207 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u208 : (string) -> t_UseFlags) (dtb_u_u209 : bool) (dtb_u_u210 : t_TermUse) (dtb_u_u211 : Core_dTerm.t_Term) -> (if (dtb_u_u206 <= 0) then dtb_u_u210 else (match dtb_u_u211 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u212) -> ((v_withFlags (dtb_u_u208 dtb_u_u212)) ((((v_addRuntimeDep dtb_u_u207) dtb_u_u209) dtb_u_u212) dtb_u_u210))
  | Core_dTerm.C_Term_TFloat (dtb_u_u213) -> { f_TermUse_termUseDeps = (dtb_u_u210).f_TermUse_termUseDeps; f_TermUse_termUseFlags = (dtb_u_u210).f_TermUse_termUseFlags; f_TermUse_termUseFloatLit = true }
  | Core_dTerm.C_Term_TVar (dtb_u_u214, dtb_u_u215, dtb_u_u216) -> dtb_u_u210
  | Core_dTerm.C_Term_TMeta (dtb_u_u217) -> dtb_u_u210
  | Core_dTerm.C_Term_TType (dtb_u_u218) -> dtb_u_u210
  | Core_dTerm.C_Term_TInt (dtb_u_u219) -> dtb_u_u210
  | Core_dTerm.C_Term_TStr (dtb_u_u220) -> dtb_u_u210
  | Core_dTerm.C_Term_TBool (dtb_u_u221) -> dtb_u_u210
  | Core_dTerm.C_Term_TPi (dtb_u_u222, dtb_u_u223, dtb_u_u224, dtb_u_u225, dtb_u_u226) -> ((((((v_termUseFuel (dtb_u_u206 - 1)) dtb_u_u207) dtb_u_u208) false) ((((((v_termUseFuel (dtb_u_u206 - 1)) dtb_u_u207) dtb_u_u208) false) dtb_u_u210) dtb_u_u225)) dtb_u_u226)
  | Core_dTerm.C_Term_TLam (dtb_u_u227, dtb_u_u228, dtb_u_u229, dtb_u_u230, dtb_u_u231) -> ((((((v_termUseFuel (dtb_u_u206 - 1)) dtb_u_u207) dtb_u_u208) dtb_u_u209) dtb_u_u210) dtb_u_u231)
  | Core_dTerm.C_Term_TApp (dtb_u_u232, dtb_u_u233, dtb_u_u234) -> ((((((v_termUseFuel (dtb_u_u206 - 1)) dtb_u_u207) dtb_u_u208) (if dtb_u_u209 then (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased dtb_u_u234)) else false)) ((((((v_termUseFuel (dtb_u_u206 - 1)) dtb_u_u207) dtb_u_u208) dtb_u_u209) dtb_u_u210) dtb_u_u232)) dtb_u_u233)
  | Core_dTerm.C_Term_TCon (dtb_u_u235, dtb_u_u236) -> ((((((v_termUseArgsFuel (dtb_u_u206 - 1)) dtb_u_u207) dtb_u_u208) dtb_u_u209) dtb_u_u210) dtb_u_u236)
  | Core_dTerm.C_Term_TMk (dtb_u_u237, dtb_u_u238) -> ((((((v_termUseArgsFuel (dtb_u_u206 - 1)) dtb_u_u207) dtb_u_u208) dtb_u_u209) dtb_u_u210) dtb_u_u238)
  | Core_dTerm.C_Term_TRecord (dtb_u_u239, dtb_u_u240) -> ((((((v_termUseArgsFuel (dtb_u_u206 - 1)) dtb_u_u207) dtb_u_u208) false) dtb_u_u210) dtb_u_u240)
  | Core_dTerm.C_Term_TProj (dtb_u_u241, dtb_u_u242, dtb_u_u243, dtb_u_u244, dtb_u_u245) -> ((((((v_termUseFuel (dtb_u_u206 - 1)) dtb_u_u207) dtb_u_u208) dtb_u_u209) dtb_u_u210) dtb_u_u241)
  | Core_dTerm.C_Term_TRecUpd (dtb_u_u246, dtb_u_u247, dtb_u_u248, dtb_u_u249, dtb_u_u250) -> ((((((v_termUseFuel (dtb_u_u206 - 1)) dtb_u_u207) dtb_u_u208) dtb_u_u209) ((((((v_termUseFuel (dtb_u_u206 - 1)) dtb_u_u207) dtb_u_u208) dtb_u_u209) dtb_u_u210) dtb_u_u246)) dtb_u_u250)
  | Core_dTerm.C_Term_TCase (dtb_u_u251, dtb_u_u252) -> ((((((v_termUseAltsFuel (dtb_u_u206 - 1)) dtb_u_u207) dtb_u_u208) dtb_u_u209) ((((((v_termUseFuel (dtb_u_u206 - 1)) dtb_u_u207) dtb_u_u208) dtb_u_u209) dtb_u_u210) dtb_u_u251)) dtb_u_u252)
  | Core_dTerm.C_Term_TIf (dtb_u_u253, dtb_u_u254, dtb_u_u255) -> ((((((v_termUseFuel (dtb_u_u206 - 1)) dtb_u_u207) dtb_u_u208) dtb_u_u209) ((((((v_termUseFuel (dtb_u_u206 - 1)) dtb_u_u207) dtb_u_u208) dtb_u_u209) ((((((v_termUseFuel (dtb_u_u206 - 1)) dtb_u_u207) dtb_u_u208) dtb_u_u209) dtb_u_u210) dtb_u_u253)) dtb_u_u254)) dtb_u_u255)
  | _ -> failwith "DT: impossible branch"
)))
# 338 "Vuna/Compiler/Lowering/Checks.vuna"
and v_termUseArgsFuel = (fun (dtb_u_u256 : int) (dtb_u_u257 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u258 : (string) -> t_UseFlags) (dtb_u_u259 : bool) (dtb_u_u260 : t_TermUse) (dtb_u_u261 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u261 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u262, dtb_u_u263) -> (match dtb_u_u262 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u264; B_dData_dPair.f_Pair_second = dtb_u_u265 } -> (if (dtb_u_u256 <= 0) then dtb_u_u260 else ((((((v_termUseArgsFuel (dtb_u_u256 - 1)) dtb_u_u257) dtb_u_u258) dtb_u_u259) ((((((v_termUseFuel (dtb_u_u256 - 1)) dtb_u_u257) dtb_u_u258) (if dtb_u_u259 then (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased dtb_u_u265)) else false)) dtb_u_u260) dtb_u_u264)) dtb_u_u263))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u260
  | _ -> failwith "DT: impossible branch"
))
# 352 "Vuna/Compiler/Lowering/Checks.vuna"
and v_termUseAltsFuel = (fun (dtb_u_u266 : int) (dtb_u_u267 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u268 : (string) -> t_UseFlags) (dtb_u_u269 : bool) (dtb_u_u270 : t_TermUse) (dtb_u_u271 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u271 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u272, dtb_u_u273) -> (if (dtb_u_u266 <= 0) then dtb_u_u270 else ((((((v_termUseAltsFuel (dtb_u_u266 - 1)) dtb_u_u267) dtb_u_u268) dtb_u_u269) ((((((v_termUseFuel (dtb_u_u266 - 1)) dtb_u_u267) dtb_u_u268) dtb_u_u269) dtb_u_u270) (Core_dTerm.v_caseAltBody dtb_u_u272))) dtb_u_u273))
  | B_dData_dList.C_List_Nil -> dtb_u_u270
  | _ -> failwith "DT: impossible branch"
))

# 295 "Vuna/Compiler/Lowering/Checks.vuna"
let v_termUseInto = (fun (dtb_u_u274 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u275 : (string) -> t_UseFlags) (dtb_u_u276 : Core_dTerm.t_Term) -> ((((((v_termUseFuel (v_useBudgetFor (Core_dTerm.v_termSize dtb_u_u276))) dtb_u_u274) dtb_u_u275) true) { f_TermUse_termUseDeps = B_dData_dList.C_List_Nil; f_TermUse_termUseFlags = v_noUseFlags; f_TermUse_termUseFloatLit = false }) dtb_u_u276))

# 366 "Vuna/Compiler/Lowering/Checks.vuna"
let[@tail_mod_cons] rec v_runtimeNamesOf = (fun (dtb_u_u277 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u277 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u278, dtb_u_u279) -> (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.v_dtDefName dtb_u_u278), (v_runtimeNamesOf dtb_u_u279)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 375 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_checkTermScopes = (fun (dtb_u_u280 : int) (dtb_u_u281 : Core_dTerm.t_Term) -> (match dtb_u_u281 with
  | Core_dTerm.C_Term_TCase (dtb_u_u282, dtb_u_u283) -> ((Base_dCommon.v_bind ((v_checkTermScopes dtb_u_u280) dtb_u_u282)) (fun (dtb_u_u284 : int) -> ((v_checkAltScopes dtb_u_u280) dtb_u_u283)))
  | Core_dTerm.C_Term_TRecUpd (dtb_u_u285, dtb_u_u286, dtb_u_u287, dtb_u_u288, dtb_u_u289) -> ((Base_dCommon.v_bind ((v_checkTermScopes dtb_u_u280) dtb_u_u285)) (fun (dtb_u_u290 : int) -> ((v_checkTermScopes (dtb_u_u280 + (B_dData_dList.v_length dtb_u_u287))) dtb_u_u289)))
  | Core_dTerm.C_Term_TProj (dtb_u_u291, dtb_u_u292, dtb_u_u293, dtb_u_u294, dtb_u_u295) -> ((v_checkTermScopes dtb_u_u280) dtb_u_u291)
  | Core_dTerm.C_Term_TIf (dtb_u_u296, dtb_u_u297, dtb_u_u298) -> ((Base_dCommon.v_bind ((v_checkTermScopes dtb_u_u280) dtb_u_u296)) (fun (dtb_u_u299 : int) -> ((Base_dCommon.v_bind ((v_checkTermScopes dtb_u_u280) dtb_u_u297)) (fun (dtb_u_u300 : int) -> ((v_checkTermScopes dtb_u_u280) dtb_u_u298)))))
  | Core_dTerm.C_Term_TPi (dtb_u_u301, dtb_u_u302, dtb_u_u303, dtb_u_u304, dtb_u_u305) -> ((Base_dCommon.v_bind ((v_checkTermScopes dtb_u_u280) dtb_u_u304)) (fun (dtb_u_u306 : int) -> ((v_checkTermScopes (dtb_u_u280 + 1)) dtb_u_u305)))
  | Core_dTerm.C_Term_TLam (dtb_u_u307, dtb_u_u308, dtb_u_u309, dtb_u_u310, dtb_u_u311) -> ((Base_dCommon.v_bind ((v_checkTermScopesSlot dtb_u_u280) dtb_u_u309)) (fun (dtb_u_u312 : int) -> ((v_checkTermScopes (dtb_u_u280 + 1)) dtb_u_u311)))
  | Core_dTerm.C_Term_TRecord (dtb_u_u313, dtb_u_u314) -> ((v_checkTermScopesArgs dtb_u_u280) dtb_u_u314)
  | Core_dTerm.C_Term_TMk (dtb_u_u315, dtb_u_u316) -> ((v_checkTermScopesArgs dtb_u_u280) dtb_u_u316)
  | Core_dTerm.C_Term_TCon (dtb_u_u317, dtb_u_u318) -> ((v_checkTermScopesArgs dtb_u_u280) dtb_u_u318)
  | Core_dTerm.C_Term_TApp (dtb_u_u319, dtb_u_u320, dtb_u_u321) -> ((Base_dCommon.v_bind ((v_checkTermScopes dtb_u_u280) dtb_u_u319)) (fun (dtb_u_u322 : int) -> ((v_checkTermScopes dtb_u_u280) dtb_u_u320)))
  | Core_dTerm.C_Term_TMeta (dtb_u_u323) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TType (dtb_u_u324) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TBool (dtb_u_u325) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TFloat (dtb_u_u326) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TStr (dtb_u_u327) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TInt (dtb_u_u328) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TGlobal (dtb_u_u329) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TVar (dtb_u_u330, dtb_u_u331, dtb_u_u332) -> (if (dtb_u_u331 >= 0) then (if (dtb_u_u331 < dtb_u_u280) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal (String.concat "" ["out-of-scope de Bruijn index "; (string_of_int dtb_u_u331); " (depth "; (string_of_int dtb_u_u280); ")"]))) else (Base_dDiag.v_icInternal ("negative de Bruijn index " ^ (string_of_int dtb_u_u331))))
  | _ -> failwith "DT: impossible branch"
))
# 413 "Vuna/Compiler/Lowering/Checks.vuna"
and v_checkTermScopesMaybe = (fun (dtb_u_u333 : int) (dtb_u_u334 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match dtb_u_u334 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u335) -> ((v_checkTermScopes dtb_u_u333) dtb_u_u335)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))
# 417 "Vuna/Compiler/Lowering/Checks.vuna"
and v_checkTermScopesSlot = (fun (dtb_u_u336 : int) (dtb_u_u337 : (Core_dTerm.t_LamMark, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match dtb_u_u337 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u338) -> ((Base_dCommon.v_bind ((v_checkTermScopesMaybe dtb_u_u336) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb_u_u338)))) (fun (dtb_u_u339 : int) -> ((v_checkTermScopesMaybe (dtb_u_u336 + 1)) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb_u_u338)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))
# 424 "Vuna/Compiler/Lowering/Checks.vuna"
and v_checkTermScopesArgs = (fun (dtb_u_u340 : int) (dtb_u_u341 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u341 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u342, dtb_u_u343) -> (match dtb_u_u342 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u344; B_dData_dPair.f_Pair_second = dtb_u_u345 } -> ((Base_dCommon.v_bind ((v_checkTermScopes dtb_u_u340) dtb_u_u344)) (fun (dtb_u_u346 : int) -> ((v_checkTermScopesArgs dtb_u_u340) dtb_u_u343)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))
# 429 "Vuna/Compiler/Lowering/Checks.vuna"
and v_checkAltScopes = (fun (dtb_u_u347 : int) (dtb_u_u348 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u348 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u349, dtb_u_u350) -> ((Base_dCommon.v_bind ((v_checkTermScopes (dtb_u_u347 + (B_dData_dList.v_length (Core_dTerm.v_caseAltBinders dtb_u_u349)))) (Core_dTerm.v_caseAltBody dtb_u_u349))) (fun (dtb_u_u351 : int) -> ((v_checkAltScopes dtb_u_u347) dtb_u_u350)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 436 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_checkAllDefScopes = (fun (dtb_u_u352 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u352 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u353, dtb_u_u354) -> (match (Elab_dTypes.v_dtDefBody dtb_u_u353) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_checkAllDefScopes dtb_u_u354)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u355) -> (match ((v_checkTermScopes 0) dtb_u_u355) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u356) -> (Base_dDiag.C_Check_ErrC (((v_defLocDiag dtb_u_u353) dtb_u_u356)))
  | Base_dDiag.C_Check_OkC (dtb_u_u357) -> (v_checkAllDefScopes dtb_u_u354)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 448 "Vuna/Compiler/Lowering/Checks.vuna"
let v_termDepsInto = (fun (dtb_u_u358 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u359 : string B_dData_dList.t_List) (dtb_u_u360 : Core_dTerm.t_Term) -> ((((v_termDepsIntoFuel (v_useBudgetFor (Core_dTerm.v_termSize dtb_u_u360))) dtb_u_u358) dtb_u_u359) dtb_u_u360))

# 105 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_checkNoAxiomRuntimeGo = (fun (dtb_u_u361 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u362 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u362 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u363, dtb_u_u364) -> (match (Elab_dTypes.v_dtDefBody dtb_u_u363) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_checkNoAxiomRuntimeGo dtb_u_u361) dtb_u_u364)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u365) -> (match (((v_termDepsInto dtb_u_u361) B_dData_dList.C_List_Nil) dtb_u_u365) with
  | B_dData_dList.C_List_Nil -> ((v_checkNoAxiomRuntimeGo dtb_u_u361) dtb_u_u364)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u366, dtb_u_u367) -> ((((Base_dDiagnostics_dCg.v_cgErrDefAt (Elab_dTypes.v_dtDefSpan dtb_u_u363)) (Elab_dTypes.v_dtDefName dtb_u_u363)) (Base_dDiagnostics_dCg.C_CgErr_AxiomAtRuntime (dtb_u_u366))) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u366, B_dData_dVec.C_Vec_Nil)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 102 "Vuna/Compiler/Lowering/Checks.vuna"
let v_checkNoAxiomRuntime = (fun (dtb_u_u368 : string B_dData_dList.t_List) (dtb_u_u369 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((v_checkNoAxiomRuntimeGo (B_dContainer_dHashMap.v_ofNames dtb_u_u368)) dtb_u_u369))

# 451 "Vuna/Compiler/Lowering/Checks.vuna"
let v_termDepsArgs = (fun (dtb_u_u370 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u371 : string B_dData_dList.t_List) (dtb_u_u372 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((v_termDepsArgsFuel 100000) dtb_u_u370) dtb_u_u371) dtb_u_u372))

# 454 "Vuna/Compiler/Lowering/Checks.vuna"
let v_termDepsAlts = (fun (dtb_u_u373 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u374 : string B_dData_dList.t_List) (dtb_u_u375 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> ((((v_termDepsAltsFuel 100000) dtb_u_u373) dtb_u_u374) dtb_u_u375))

# 480 "Vuna/Compiler/Lowering/Checks.vuna"
let v_erasureFuelMax = 1000000

# 474 "Vuna/Compiler/Lowering/Checks.vuna"
let v_erasureFuelFor = (fun (dtb_u_u376 : int) -> (let dtb_u_u377 = (512 + (4 * dtb_u_u376)) in (if (dtb_u_u377 > v_erasureFuelMax) then v_erasureFuelMax else dtb_u_u377)))

# 457 "Vuna/Compiler/Lowering/Checks.vuna"
let v_checkErasure = (fun (dtb_u_u378 : string B_dData_dList.t_List) (dtb_u_u379 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u380 : Core_dTerm.t_Term) -> ((((v_checkErasureFuel (v_erasureFuelFor (Core_dTerm.v_termSize dtb_u_u380))) dtb_u_u378) dtb_u_u379) dtb_u_u380))

# 125 "Vuna/Compiler/Lowering/Checks.vuna"
let v_checkOneErasure = (fun (dtb_u_u381 : string B_dData_dList.t_List) (dtb_u_u382 : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefExtern dtb_u_u382) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u383) -> (Base_dDiag.C_Check_OkC (0))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Elab_dTypes.v_dtDefBody dtb_u_u382) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "axiom reached the runtime erasure check (partition must erase it)")
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u384) -> (match (((v_checkErasure dtb_u_u381) B_dData_dList.C_List_Nil) dtb_u_u384) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u385) -> (Base_dDiag.C_Check_ErrC (((v_defLocDiag dtb_u_u382) dtb_u_u385)))
  | Base_dDiag.C_Check_OkC (dtb_u_u386) -> (Base_dDiag.C_Check_OkC (dtb_u_u386))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_checkAllErasure = (fun (dtb_u_u387 : string B_dData_dList.t_List) (dtb_u_u388 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u388 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u389, dtb_u_u390) -> ((Base_dCommon.v_bind ((v_checkOneErasure dtb_u_u387) dtb_u_u389)) (fun (dtb_u_u391 : int) -> ((v_checkAllErasure dtb_u_u387) dtb_u_u390)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 483 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_erasureFuelForArgs = (fun (dtb_u_u392 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u392 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u393, dtb_u_u394) -> (match dtb_u_u393 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u395; B_dData_dPair.f_Pair_second = dtb_u_u396 } -> (let dtb_u_u397 = ((Core_dTerm.v_termSize dtb_u_u395) + (v_erasureFuelForArgs dtb_u_u394)) in (if (dtb_u_u397 > v_erasureFuelMax) then v_erasureFuelMax else dtb_u_u397))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 490 "Vuna/Compiler/Lowering/Checks.vuna"
let v_checkConArgsErasure = (fun (dtb_u_u398 : string B_dData_dList.t_List) (dtb_u_u399 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u400 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((v_checkConArgsErasureFuel (v_erasureFuelFor (v_erasureFuelForArgs dtb_u_u400))) dtb_u_u398) dtb_u_u399) dtb_u_u400))

# 497 "Vuna/Compiler/Lowering/Checks.vuna"
let rec v_erasureFuelForAlts = (fun (dtb_u_u401 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u401 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u402, dtb_u_u403) -> (let dtb_u_u404 = ((Core_dTerm.v_termSize (Core_dTerm.v_caseAltBody dtb_u_u402)) + (v_erasureFuelForAlts dtb_u_u403)) in (if (dtb_u_u404 > v_erasureFuelMax) then v_erasureFuelMax else dtb_u_u404))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 494 "Vuna/Compiler/Lowering/Checks.vuna"
let v_checkAltErasure = (fun (dtb_u_u405 : string B_dData_dList.t_List) (dtb_u_u406 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u407 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> ((((v_checkAltErasureFuel (v_erasureFuelFor (v_erasureFuelForAlts dtb_u_u407))) dtb_u_u405) dtb_u_u406) dtb_u_u407))

# 268 "Vuna/Compiler/Lowering/Checks.vuna"
let v_useFlagsFloat = (fun (dtb_u_u408 : t_UseFlags) -> (match dtb_u_u408 with
  | { f_UseFlags_useFlagsFloat = dtb_u_u409; f_UseFlags_useFlagsTrace = dtb_u_u410; f_UseFlags_useFlagsObs = dtb_u_u411; f_UseFlags_useFlagsHost = dtb_u_u412; f_UseFlags_useFlagsSched = dtb_u_u413; f_UseFlags_useFlagsEff = dtb_u_u414 } -> dtb_u_u409
  | _ -> failwith "DT: impossible branch"
))

# 269 "Vuna/Compiler/Lowering/Checks.vuna"
let v_useFlagsTrace = (fun (dtb_u_u415 : t_UseFlags) -> (match dtb_u_u415 with
  | { f_UseFlags_useFlagsFloat = dtb_u_u416; f_UseFlags_useFlagsTrace = dtb_u_u417; f_UseFlags_useFlagsObs = dtb_u_u418; f_UseFlags_useFlagsHost = dtb_u_u419; f_UseFlags_useFlagsSched = dtb_u_u420; f_UseFlags_useFlagsEff = dtb_u_u421 } -> dtb_u_u417
  | _ -> failwith "DT: impossible branch"
))

# 270 "Vuna/Compiler/Lowering/Checks.vuna"
let v_useFlagsObs = (fun (dtb_u_u422 : t_UseFlags) -> (match dtb_u_u422 with
  | { f_UseFlags_useFlagsFloat = dtb_u_u423; f_UseFlags_useFlagsTrace = dtb_u_u424; f_UseFlags_useFlagsObs = dtb_u_u425; f_UseFlags_useFlagsHost = dtb_u_u426; f_UseFlags_useFlagsSched = dtb_u_u427; f_UseFlags_useFlagsEff = dtb_u_u428 } -> dtb_u_u425
  | _ -> failwith "DT: impossible branch"
))

# 271 "Vuna/Compiler/Lowering/Checks.vuna"
let v_useFlagsHost = (fun (dtb_u_u429 : t_UseFlags) -> (match dtb_u_u429 with
  | { f_UseFlags_useFlagsFloat = dtb_u_u430; f_UseFlags_useFlagsTrace = dtb_u_u431; f_UseFlags_useFlagsObs = dtb_u_u432; f_UseFlags_useFlagsHost = dtb_u_u433; f_UseFlags_useFlagsSched = dtb_u_u434; f_UseFlags_useFlagsEff = dtb_u_u435 } -> dtb_u_u433
  | _ -> failwith "DT: impossible branch"
))

# 272 "Vuna/Compiler/Lowering/Checks.vuna"
let v_useFlagsSched = (fun (dtb_u_u436 : t_UseFlags) -> (match dtb_u_u436 with
  | { f_UseFlags_useFlagsFloat = dtb_u_u437; f_UseFlags_useFlagsTrace = dtb_u_u438; f_UseFlags_useFlagsObs = dtb_u_u439; f_UseFlags_useFlagsHost = dtb_u_u440; f_UseFlags_useFlagsSched = dtb_u_u441; f_UseFlags_useFlagsEff = dtb_u_u442 } -> dtb_u_u441
  | _ -> failwith "DT: impossible branch"
))

# 273 "Vuna/Compiler/Lowering/Checks.vuna"
let v_useFlagsEff = (fun (dtb_u_u443 : t_UseFlags) -> (match dtb_u_u443 with
  | { f_UseFlags_useFlagsFloat = dtb_u_u444; f_UseFlags_useFlagsTrace = dtb_u_u445; f_UseFlags_useFlagsObs = dtb_u_u446; f_UseFlags_useFlagsHost = dtb_u_u447; f_UseFlags_useFlagsSched = dtb_u_u448; f_UseFlags_useFlagsEff = dtb_u_u449 } -> dtb_u_u449
  | _ -> failwith "DT: impossible branch"
))

# 290 "Vuna/Compiler/Lowering/Checks.vuna"
let v_termUseDeps = (fun (dtb_u_u450 : t_TermUse) -> (match dtb_u_u450 with
  | { f_TermUse_termUseDeps = dtb_u_u451; f_TermUse_termUseFlags = dtb_u_u452; f_TermUse_termUseFloatLit = dtb_u_u453 } -> dtb_u_u451
  | _ -> failwith "DT: impossible branch"
))

# 291 "Vuna/Compiler/Lowering/Checks.vuna"
let v_termUseFlags = (fun (dtb_u_u454 : t_TermUse) -> (match dtb_u_u454 with
  | { f_TermUse_termUseDeps = dtb_u_u455; f_TermUse_termUseFlags = dtb_u_u456; f_TermUse_termUseFloatLit = dtb_u_u457 } -> dtb_u_u456
  | _ -> failwith "DT: impossible branch"
))

# 292 "Vuna/Compiler/Lowering/Checks.vuna"
let v_termUseFloatLit = (fun (dtb_u_u458 : t_TermUse) -> (match dtb_u_u458 with
  | { f_TermUse_termUseDeps = dtb_u_u459; f_TermUse_termUseFlags = dtb_u_u460; f_TermUse_termUseFloatLit = dtb_u_u461 } -> dtb_u_u461
  | _ -> failwith "DT: impossible branch"
))
