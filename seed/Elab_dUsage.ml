open Vuna_runtime
# 32 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_isTypeFormingFuel = (fun (dtb_u_u1 : int) (dtb_u_u2 : Core_dTerm.t_Value) -> (if (dtb_u_u1 <= 0) then false else (match dtb_u_u2 with
  | Core_dTerm.C_Value_VType (dtb_u_u3) -> true
  | Core_dTerm.C_Value_VPi (dtb_u_u4, dtb_u_u5, dtb_u_u6, dtb_u_u7, dtb_u_u8) -> ((v_isTypeFormingFuel (dtb_u_u1 - 1)) ((Core_dEval.v_applyClosure dtb_u_u8) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u4, 0, B_dData_dList.C_List_Nil))))))
  | _ -> false
)))

# 29 "Vuna/Compiler/Elab/Usage.vuna"
let v_isTypeForming = (fun (dtb_u_u9 : Core_dTerm.t_Value) -> ((v_isTypeFormingFuel 128) dtb_u_u9))

# 46 "Vuna/Compiler/Elab/Usage.vuna"
let[@tail_mod_cons] rec v_uZeroOf = (fun (dtb_u_u10 : int) -> (if (dtb_u_u10 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (Core_dTerm.C_Rig_Rig0, (v_uZeroOf (dtb_u_u10 - 1))))))

# 52 "Vuna/Compiler/Elab/Usage.vuna"
let[@tail_mod_cons] rec v_uVarAtGo = (fun (dtb_u_u11 : int) (dtb_u_u12 : int) -> (if (dtb_u_u11 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((if (dtb_u_u12 = 0) then Core_dTerm.C_Rig_Rig1 else Core_dTerm.C_Rig_Rig0), ((v_uVarAtGo (dtb_u_u11 - 1)) (dtb_u_u12 - 1))))))

# 49 "Vuna/Compiler/Elab/Usage.vuna"
let v_uVarAt = (fun (dtb_u_u13 : int) (dtb_u_u14 : int) -> (if (if (dtb_u_u14 < 0) then true else (dtb_u_u14 >= dtb_u_u13)) then (v_uZeroOf dtb_u_u13) else ((v_uVarAtGo dtb_u_u13) dtb_u_u14)))

# 56 "Vuna/Compiler/Elab/Usage.vuna"
let[@tail_mod_cons] rec v_uAdd = (fun (dtb_u_u15 : Core_dTerm.t_Rig B_dData_dList.t_List) (dtb_u_u16 : Core_dTerm.t_Rig B_dData_dList.t_List) -> (match dtb_u_u15 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u17, dtb_u_u18) -> (match dtb_u_u16 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u19, dtb_u_u20) -> (B_dData_dList.C_List__x58__x58_ (((Core_dTerm.v_rigAdd dtb_u_u17) dtb_u_u19), ((v_uAdd dtb_u_u18) dtb_u_u20)))
  | B_dData_dList.C_List_Nil -> dtb_u_u15
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u16
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Elab/Usage.vuna"
let v_uScale = (fun (dtb_u_u21 : Core_dTerm.t_Rig) (dtb_u_u22 : Core_dTerm.t_Rig B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (dtb_u_u23 : Core_dTerm.t_Rig) -> ((Core_dTerm.v_rigScale dtb_u_u21) dtb_u_u23))) dtb_u_u22))

# 64 "Vuna/Compiler/Elab/Usage.vuna"
let[@tail_mod_cons] rec v_uJoin = (fun (dtb_u_u24 : Core_dTerm.t_Rig B_dData_dList.t_List) (dtb_u_u25 : Core_dTerm.t_Rig B_dData_dList.t_List) -> (match dtb_u_u24 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u26, dtb_u_u27) -> (match dtb_u_u25 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u28, dtb_u_u29) -> (B_dData_dList.C_List__x58__x58_ (((Core_dTerm.v_rigJoin dtb_u_u26) dtb_u_u28), ((v_uJoin dtb_u_u27) dtb_u_u29)))
  | B_dData_dList.C_List_Nil -> dtb_u_u24
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u25
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_uDrop = (fun (dtb_u_u30 : int) (dtb_u_u31 : Core_dTerm.t_Rig B_dData_dList.t_List) -> (if (dtb_u_u30 <= 0) then dtb_u_u31 else (match dtb_u_u31 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u32, dtb_u_u33) -> ((v_uDrop (dtb_u_u30 - 1)) dtb_u_u33)
  | _ -> failwith "DT: impossible branch"
)))

# 102 "Vuna/Compiler/Elab/Usage.vuna"
let v_resolvedBinderSpan = (fun (dtb_u_u34 : Base_dSource.t_Span) (dtb_u_u35 : Base_dSource.t_Span) -> (if (Base_dSource.v_isSpanEmpty dtb_u_u34) then dtb_u_u35 else dtb_u_u34))

# 107 "Vuna/Compiler/Elab/Usage.vuna"
let v_binderEditSpan = (fun (dtb_u_u36 : string) (dtb_u_u37 : Base_dSource.t_Span) -> (let dtb_u_u38 = ((Base_dSource.v_spanEndOffset dtb_u_u37) - (Base_dSource.v_spanStartOffset dtb_u_u37)) in (if (if (Base_dSource.v_isSpanEmpty dtb_u_u37) then true else (dtb_u_u38 <> (String.length dtb_u_u36))) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb_u_u37)))))

# 268 "Vuna/Compiler/Elab/Usage.vuna"
let v_isRigZero = (fun (dtb_u_u39 : Core_dTerm.t_Rig) -> (match dtb_u_u39 with
  | Core_dTerm.C_Rig_Rig0 -> true
  | _ -> false
))

# 134 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_shadowedByRuntime = (fun (dtb_u_u40 : string) (dtb_u_u41 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u41 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u42, dtb_u_u43) -> (match dtb_u_u42 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u44; B_dData_dPair.f_Pair_second = dtb_u_u45 } -> (if (v_isRigZero dtb_u_u45) then ((v_shadowedByRuntime dtb_u_u40) dtb_u_u43) else (if (dtb_u_u44 = dtb_u_u40) then true else ((v_shadowedByRuntime dtb_u_u40) dtb_u_u43)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 309 "Vuna/Compiler/Elab/Usage.vuna"
let v_capCheckFuelMax = 1000000

# 303 "Vuna/Compiler/Elab/Usage.vuna"
let v_capCheckFuelFor = (fun (dtb_u_u46 : Core_dTerm.t_Term) -> (let dtb_u_u47 = (1024 + (4 * (Core_dTerm.v_termSize dtb_u_u46))) in (if (dtb_u_u47 > v_capCheckFuelMax) then v_capCheckFuelMax else dtb_u_u47)))

# 361 "Vuna/Compiler/Elab/Usage.vuna"
let v_ctorFamilyLinear = (fun (dtb_u_u48 : Elab_dTypes.t_Ec) (dtb_u_u49 : string) -> (match ((Elab_dMeta.v_dtCtorLookupEc dtb_u_u48) dtb_u_u49) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u50) -> (match ((Elab_dMeta.v_dtDataLookup (Elab_dTypes.v_dtCtorFamily dtb_u_u50)) (Elab_dTypes.v_ecDatas dtb_u_u48)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u51) -> (Elab_dTypes.v_dtDataLinear dtb_u_u51)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 312 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_capCheckFuel = (fun (dtb_u_u52 : int) (dtb_u_u53 : Elab_dTypes.t_Ec) (dtb_u_u54 : Base_dSource.t_Span) (dtb_u_u55 : Core_dTerm.t_Term) (dtb_u_u56 : bool) -> (if (dtb_u_u52 <= 0) then ((Base_dDiagnostics_dTc.v_tcErr0 dtb_u_u54) Base_dDiagnostics_dTc.C_TcErr_CaptureFuel) else (match dtb_u_u55 with
  | Core_dTerm.C_Term_TVar (dtb_u_u57, dtb_u_u58, dtb_u_u59) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TGlobal (dtb_u_u60) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TInt (dtb_u_u61) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TStr (dtb_u_u62) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TFloat (dtb_u_u63) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TBool (dtb_u_u64) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TMeta (dtb_u_u65) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TType (dtb_u_u66) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TPi (dtb_u_u67, dtb_u_u68, dtb_u_u69, dtb_u_u70, dtb_u_u71) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TLam (dtb_u_u72, dtb_u_u73, dtb_u_u74, dtb_u_u75, dtb_u_u76) -> (match (Core_dTerm.v_lamMarkOf dtb_u_u74) with
  | Core_dTerm.C_LamMark_LamLinearClosure -> (if dtb_u_u56 then (((((v_capCheckFuel (dtb_u_u52 - 1)) dtb_u_u53) dtb_u_u54) dtb_u_u76) false) else (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u54) (Base_dDiagnostics_dTc.C_TcErr_LinearCaptureEscapes (dtb_u_u72))) dtb_u_u72))
  | Core_dTerm.C_LamMark_LamPlain -> (((((v_capCheckFuel (dtb_u_u52 - 1)) dtb_u_u53) dtb_u_u54) dtb_u_u76) false)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TApp (dtb_u_u77, dtb_u_u78, dtb_u_u79) -> ((Base_dCommon.v_bind (((((v_capCheckFuel (dtb_u_u52 - 1)) dtb_u_u53) dtb_u_u54) dtb_u_u77) true)) (fun (dtb_u_u80 : int) -> (if (v_isRigZero dtb_u_u79) then (((((v_capCheckFuel (dtb_u_u52 - 1)) dtb_u_u53) dtb_u_u54) dtb_u_u78) false) else (((((v_capCheckFuel (dtb_u_u52 - 1)) dtb_u_u53) dtb_u_u54) dtb_u_u78) (Core_dTerm.v_rigIsLinear dtb_u_u79)))))
  | Core_dTerm.C_Term_TCon (dtb_u_u81, dtb_u_u82) -> (((((v_capArgsFuel dtb_u_u52) dtb_u_u53) dtb_u_u54) dtb_u_u81) dtb_u_u82)
  | Core_dTerm.C_Term_TMk (dtb_u_u83, dtb_u_u84) -> (((((v_capArgsFuel dtb_u_u52) dtb_u_u53) dtb_u_u54) dtb_u_u83) dtb_u_u84)
  | Core_dTerm.C_Term_TRecord (dtb_u_u85, dtb_u_u86) -> (((((v_capArgsFuel dtb_u_u52) dtb_u_u53) dtb_u_u54) dtb_u_u85) dtb_u_u86)
  | Core_dTerm.C_Term_TIf (dtb_u_u87, dtb_u_u88, dtb_u_u89) -> ((Base_dCommon.v_bind (((((v_capCheckFuel (dtb_u_u52 - 1)) dtb_u_u53) dtb_u_u54) dtb_u_u87) true)) (fun (dtb_u_u90 : int) -> ((Base_dCommon.v_bind (((((v_capCheckFuel (dtb_u_u52 - 1)) dtb_u_u53) dtb_u_u54) dtb_u_u88) dtb_u_u56)) (fun (dtb_u_u91 : int) -> (((((v_capCheckFuel (dtb_u_u52 - 1)) dtb_u_u53) dtb_u_u54) dtb_u_u89) dtb_u_u56)))))
  | Core_dTerm.C_Term_TProj (dtb_u_u92, dtb_u_u93, dtb_u_u94, dtb_u_u95, dtb_u_u96) -> (((((v_capCheckFuel (dtb_u_u52 - 1)) dtb_u_u53) dtb_u_u54) dtb_u_u92) true)
  | Core_dTerm.C_Term_TRecUpd (dtb_u_u97, dtb_u_u98, dtb_u_u99, dtb_u_u100, dtb_u_u101) -> ((Base_dCommon.v_bind (((((v_capCheckFuel (dtb_u_u52 - 1)) dtb_u_u53) dtb_u_u54) dtb_u_u97) true)) (fun (dtb_u_u102 : int) -> (((((v_capCheckFuel (dtb_u_u52 - 1)) dtb_u_u53) dtb_u_u54) dtb_u_u101) dtb_u_u56)))
  | Core_dTerm.C_Term_TCase (dtb_u_u103, dtb_u_u104) -> ((Base_dCommon.v_bind (((((v_capCheckFuel (dtb_u_u52 - 1)) dtb_u_u53) dtb_u_u54) dtb_u_u103) true)) (fun (dtb_u_u105 : int) -> (((((v_capAltsFuel dtb_u_u52) dtb_u_u53) dtb_u_u54) dtb_u_u56) dtb_u_u104)))
  | _ -> failwith "DT: impossible branch"
)))
# 341 "Vuna/Compiler/Elab/Usage.vuna"
and v_capArgsFuel = (fun (dtb_u_u106 : int) (dtb_u_u107 : Elab_dTypes.t_Ec) (dtb_u_u108 : Base_dSource.t_Span) (dtb_u_u109 : string) (dtb_u_u110 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_capArgsGo dtb_u_u106) dtb_u_u107) dtb_u_u108) ((v_ctorFamilyLinear dtb_u_u107) dtb_u_u109)) dtb_u_u110))
# 344 "Vuna/Compiler/Elab/Usage.vuna"
and v_capArgsGo = (fun (dtb_u_u111 : int) (dtb_u_u112 : Elab_dTypes.t_Ec) (dtb_u_u113 : Base_dSource.t_Span) (dtb_u_u114 : bool) (dtb_u_u115 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u115 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u116, dtb_u_u117) -> (match dtb_u_u116 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u118; B_dData_dPair.f_Pair_second = dtb_u_u119 } -> (let dtb_u_u120 = (if dtb_u_u114 then (Core_dTerm.v_rigIsLinear dtb_u_u119) else false) in ((Base_dCommon.v_bind (((((v_capCheckFuel (dtb_u_u111 - 1)) dtb_u_u112) dtb_u_u113) dtb_u_u118) dtb_u_u120)) (fun (dtb_u_u121 : int) -> (((((v_capArgsGo (dtb_u_u111 - 1)) dtb_u_u112) dtb_u_u113) dtb_u_u114) dtb_u_u117))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))
# 353 "Vuna/Compiler/Elab/Usage.vuna"
and v_capAltsFuel = (fun (dtb_u_u122 : int) (dtb_u_u123 : Elab_dTypes.t_Ec) (dtb_u_u124 : Base_dSource.t_Span) (dtb_u_u125 : bool) (dtb_u_u126 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u126 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u127, dtb_u_u128) -> (match dtb_u_u127 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u129; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u130; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u131 } -> ((Base_dCommon.v_bind (((((v_capCheckFuel (dtb_u_u122 - 1)) dtb_u_u123) dtb_u_u124) dtb_u_u131) dtb_u_u125)) (fun (dtb_u_u132 : int) -> (((((v_capAltsFuel (dtb_u_u122 - 1)) dtb_u_u123) dtb_u_u124) dtb_u_u125) dtb_u_u128)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 297 "Vuna/Compiler/Elab/Usage.vuna"
let v_capCheck = (fun (dtb_u_u133 : Elab_dTypes.t_Ec) (dtb_u_u134 : Base_dSource.t_Span) (dtb_u_u135 : Core_dTerm.t_Term) (dtb_u_u136 : bool) -> (((((v_capCheckFuel (v_capCheckFuelFor dtb_u_u135)) dtb_u_u133) dtb_u_u134) dtb_u_u135) dtb_u_u136))

# 374 "Vuna/Compiler/Elab/Usage.vuna"
let v_isTypeLevelDef = (fun (dtb_u_u137 : Elab_dTypes.t_Ec) (dtb_u_u138 : Elab_dTypes.t_DtDef) -> (v_isTypeForming ((((Core_dEval.v_force (Elab_dTypes.v_ecDefTbl dtb_u_u137)) (Elab_dTypes.v_ecSolsP dtb_u_u137)) Core_dTerm.v_defaultFuel) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtDefType dtb_u_u138)))))

# 400 "Vuna/Compiler/Elab/Usage.vuna"
let v_defSpanOf = (fun (dtb_u_u139 : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefSpan dtb_u_u139) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u140) -> dtb_u_u140
  | B_dData_dMaybe.C_Maybe_Nothing -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }
  | _ -> failwith "DT: impossible branch"
))

# 371 "Vuna/Compiler/Elab/Usage.vuna"
let v_checkDefCapture = (fun (dtb_u_u141 : Elab_dTypes.t_Ec) (dtb_u_u142 : Elab_dTypes.t_DtDef) (dtb_u_u143 : Core_dTerm.t_Term) -> ((((v_capCheck dtb_u_u141) (v_defSpanOf dtb_u_u142)) dtb_u_u143) false))

# 412 "Vuna/Compiler/Elab/Usage.vuna"
let v_renameSuggestion = (fun (dtb_u_u144 : string) (dtb_u_u145 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (dtb_u_u146 : Base_dDiag.t_Diagnostic) -> (match dtb_u_u145 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u147) -> ((Base_dDiag.v_withSuggestion { Base_dDiag.f_Suggestion_suggestionTitle = (String.concat "" ["rename unused binder `"; dtb_u_u144; "` to `_"; dtb_u_u144; "`"]); Base_dDiag.f_Suggestion_suggestionApplicability = Base_dDiag.C_Applicability_MachineApplicable; Base_dDiag.f_Suggestion_suggestionEdits = (B_dData_dList.C_List__x58__x58_ ({ Base_dDiag.f_DiagEdit_editSpan = dtb_u_u147; Base_dDiag.f_DiagEdit_editNewText = ("_" ^ dtb_u_u144) }, B_dData_dList.C_List_Nil)) }) dtb_u_u146)
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u146
  | _ -> failwith "DT: impossible branch"
))

# 424 "Vuna/Compiler/Elab/Usage.vuna"
let v_resetUseSpans = (fun (dtb_u_u148 : Elab_dTypes.t_Ec) -> ((Elab_dTypes.v_ecPutUseSpans dtb_u_u148) B_dData_dList.C_List_Nil))

# 428 "Vuna/Compiler/Elab/Usage.vuna"
let v_recordUseSpan = (fun (dtb_u_u149 : Elab_dTypes.t_Ec) (dtb_u_u150 : string) (dtb_u_u151 : Base_dSource.t_Span) -> ((Elab_dTypes.v_ecPutUseSpans dtb_u_u149) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u150; B_dData_dPair.f_Pair_second = dtb_u_u151 }, (Elab_dTypes.v_ecUseSpans dtb_u_u149)))))

# 432 "Vuna/Compiler/Elab/Usage.vuna"
let v_usesOf = (fun (dtb_u_u152 : Elab_dTypes.t_Ec) (dtb_u_u153 : string) -> (B_dData_dList.v_reverse ((B_dData_dList.v_map B_dData_dPair.v_secondOf) ((B_dData_dList.v_filter (fun (dtb_u_u154 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> ((B_dData_dPair.v_firstOf dtb_u_u154) = dtb_u_u153))) (Elab_dTypes.v_ecUseSpans dtb_u_u152)))))

# 440 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_withUseSpans = (fun (dtb_u_u155 : Base_dSource.t_Span B_dData_dList.t_List) (dtb_u_u156 : Base_dDiag.t_Diagnostic) -> (match dtb_u_u155 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u157, dtb_u_u158) -> ((v_withUseSpans dtb_u_u158) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldSpan ("use", dtb_u_u157))) dtb_u_u156))
  | B_dData_dList.C_List_Nil -> dtb_u_u156
  | _ -> failwith "DT: impossible branch"
))

# 436 "Vuna/Compiler/Elab/Usage.vuna"
let v_withUseFields = (fun (dtb_u_u159 : Elab_dTypes.t_Ec) (dtb_u_u160 : string) (dtb_u_u161 : Base_dDiag.t_Diagnostic) -> ((v_withUseSpans ((v_usesOf dtb_u_u159) dtb_u_u160)) dtb_u_u161))

# 80 "Vuna/Compiler/Elab/Usage.vuna"
let v_checkBinderRig = (fun (dtb_u_u162 : Elab_dTypes.t_Ec) (dtb_u_u163 : Base_dSource.t_Span) (dtb_u_u164 : string) (dtb_u_u165 : Core_dTerm.t_Rig) (dtb_u_u166 : Core_dTerm.t_Rig) -> (match dtb_u_u165 with
  | Core_dTerm.C_Rig_RigOmega -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Rig_Rig1 -> (match dtb_u_u166 with
  | Core_dTerm.C_Rig_Rig0 -> ((Base_dDiag.v_onErrDiag (fun (dtb_u_u167 : Base_dDiag.t_Diagnostic) -> (((v_withUseFields dtb_u_u162) dtb_u_u164) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldQuantity (dtb_u_u164, 1, 0))) dtb_u_u167)))) (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u163) (Base_dDiagnostics_dTc.C_TcErr_LinearUnused (dtb_u_u164))) dtb_u_u164))
  | Core_dTerm.C_Rig_Rig1 -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Rig_RigOmega -> ((Base_dDiag.v_onErrDiag (fun (dtb_u_u168 : Base_dDiag.t_Diagnostic) -> (((v_withUseFields dtb_u_u162) dtb_u_u164) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldQuantity (dtb_u_u164, 1, 2))) dtb_u_u168)))) (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u163) (Base_dDiagnostics_dTc.C_TcErr_LinearOverused (dtb_u_u164))) dtb_u_u164))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Rig_Rig0 -> (if (v_isRigZero dtb_u_u166) then (Base_dDiag.C_Check_OkC (0)) else ((Base_dDiag.v_onErrDiag (fun (dtb_u_u169 : Base_dDiag.t_Diagnostic) -> (((v_withUseFields dtb_u_u162) dtb_u_u164) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldQuantity (dtb_u_u164, 0, 1))) dtb_u_u169)))) (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u163) (Base_dDiagnostics_dTc.C_TcErr_ErasedBinderUsed (dtb_u_u164))) dtb_u_u164)))
  | _ -> failwith "DT: impossible branch"
))

# 450 "Vuna/Compiler/Elab/Usage.vuna"
let v_warnAt = (fun (dtb_u_u171 : Elab_dTypes.t_Ec) (dtb_u_u172 : Base_dSource.t_Span) (dtb_u_u174 : Base_dDiagnostics_dWarning.t_WarnErr) (dtb_u_u175 : string B_dData_dVec.t_Vec) -> ((Elab_dTypes.v_ecAddWarning dtb_u_u171) (((Base_dDiagnostics_dWarning.v_warnDiagAt dtb_u_u172) dtb_u_u174) dtb_u_u175)))

# 454 "Vuna/Compiler/Elab/Usage.vuna"
let v_warnAt0 = (fun (dtb_u_u176 : Elab_dTypes.t_Ec) (dtb_u_u177 : Base_dSource.t_Span) (dtb_u_u178 : Base_dDiagnostics_dWarning.t_WarnErr) -> ((((v_warnAt dtb_u_u176) dtb_u_u177) dtb_u_u178) B_dData_dVec.C_Vec_Nil))

# 458 "Vuna/Compiler/Elab/Usage.vuna"
let v_warnAt1 = (fun (dtb_u_u179 : Elab_dTypes.t_Ec) (dtb_u_u180 : Base_dSource.t_Span) (dtb_u_u181 : Base_dDiagnostics_dWarning.t_WarnErr) (dtb_u_u182 : string) -> ((((v_warnAt dtb_u_u179) dtb_u_u180) dtb_u_u181) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u182, B_dData_dVec.C_Vec_Nil))))

# 462 "Vuna/Compiler/Elab/Usage.vuna"
let v_warnAt1Mod = (fun (dtb_u_u183 : Elab_dTypes.t_Ec) (dtb_u_u184 : (Base_dDiag.t_Diagnostic) -> Base_dDiag.t_Diagnostic) (dtb_u_u185 : Base_dSource.t_Span) (dtb_u_u186 : Base_dDiagnostics_dWarning.t_WarnErr) (dtb_u_u187 : string) -> ((Elab_dTypes.v_ecAddWarning dtb_u_u183) ((((Base_dDiagnostics_dWarning.v_warnDiagAtMod dtb_u_u184) dtb_u_u185) dtb_u_u186) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u187, B_dData_dVec.C_Vec_Nil)))))

# 408 "Vuna/Compiler/Elab/Usage.vuna"
let v_warnUnusedBinder = (fun (dtb_u_u188 : Elab_dTypes.t_Ec) (dtb_u_u189 : Base_dSource.t_Span) (dtb_u_u190 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (dtb_u_u191 : string) -> (((((v_warnAt1Mod dtb_u_u188) ((v_renameSuggestion dtb_u_u191) dtb_u_u190)) dtb_u_u189) (Base_dDiagnostics_dWarning.C_WarnErr_UnusedBinder (dtb_u_u191))) dtb_u_u191))

# 115 "Vuna/Compiler/Elab/Usage.vuna"
let v_checkLamBinder = (fun (dtb_u_u192 : Elab_dTypes.t_Ec) (dtb_u_u193 : Base_dSource.t_Span) (dtb_u_u194 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (dtb_u_u195 : string) (dtb_u_u196 : Core_dTerm.t_Rig) (dtb_u_u197 : Core_dTerm.t_Rig B_dData_dList.t_List) -> (match dtb_u_u197 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u198, dtb_u_u199) -> (let dtb_u_u200 = (if (if (v_isRigZero dtb_u_u198) then (B_dData_dBool.v_not ((B_dData_dString.v_startsWith "_") dtb_u_u195)) else false) then (match dtb_u_u196 with
  | Core_dTerm.C_Rig_RigOmega -> ((((v_warnUnusedBinder dtb_u_u192) dtb_u_u193) dtb_u_u194) dtb_u_u195)
  | _ -> dtb_u_u192
) else dtb_u_u192) in ((Base_dCommon.v_bind (((((v_checkBinderRig dtb_u_u200) dtb_u_u193) dtb_u_u195) dtb_u_u196) dtb_u_u198)) (fun (dtb_u_u201 : int) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u199; B_dData_dPair.f_Pair_second = dtb_u_u200 })))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "usage vector lost lambda binder")
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_checkAltBindersGo = (fun (dtb_u_u202 : Elab_dTypes.t_Ec) (dtb_u_u203 : Base_dSource.t_Span) (dtb_u_u204 : Core_dTerm.t_Binder B_dData_dList.t_List) (dtb_u_u205 : Core_dTerm.t_Rig B_dData_dList.t_List) -> (match dtb_u_u204 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u206, dtb_u_u207) -> (let dtb_u_u208 = (Core_dTerm.v_binderNameOf dtb_u_u206) in (let dtb_u_u209 = (Core_dTerm.v_binderRigOf dtb_u_u206) in (let dtb_u_u210 = ((v_resolvedBinderSpan (Core_dTerm.v_binderSpanOf dtb_u_u206)) dtb_u_u203) in (let dtb_u_u211 = ((v_binderEditSpan dtb_u_u208) (Core_dTerm.v_binderSpanOf dtb_u_u206)) in (let dtb_u_u212 = (Core_dTerm.v_binderPairs dtb_u_u207) in (match dtb_u_u205 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "usage vector lost case binder")
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u213, dtb_u_u214) -> (let dtb_u_u215 = (if (if (dtb_u_u208 <> "_") then ((v_shadowedByRuntime dtb_u_u208) dtb_u_u212) else false) then ((((v_warnAt1 dtb_u_u202) dtb_u_u210) (Base_dDiagnostics_dWarning.C_WarnErr_ShadowedBinder (dtb_u_u208))) dtb_u_u208) else dtb_u_u202) in (let dtb_u_u216 = (if (if (v_isRigZero dtb_u_u213) then (B_dData_dBool.v_not ((B_dData_dString.v_startsWith "_") dtb_u_u208)) else false) then (match dtb_u_u209 with
  | Core_dTerm.C_Rig_RigOmega -> ((((v_warnUnusedBinder dtb_u_u215) dtb_u_u210) dtb_u_u211) dtb_u_u208)
  | _ -> dtb_u_u215
) else dtb_u_u215) in ((Base_dCommon.v_bind (((((v_checkBinderRig dtb_u_u216) dtb_u_u210) dtb_u_u208) dtb_u_u209) dtb_u_u213)) (fun (dtb_u_u217 : int) -> ((((v_checkAltBindersGo dtb_u_u216) dtb_u_u203) dtb_u_u207) dtb_u_u214)))))
  | _ -> failwith "DT: impossible branch"
))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u205; B_dData_dPair.f_Pair_second = dtb_u_u202 }))
  | _ -> failwith "DT: impossible branch"
))

# 141 "Vuna/Compiler/Elab/Usage.vuna"
let v_checkAltBinders = (fun (dtb_u_u218 : Elab_dTypes.t_Ec) (dtb_u_u219 : Base_dSource.t_Span) (dtb_u_u220 : Core_dTerm.t_Binder B_dData_dList.t_List) (dtb_u_u221 : Core_dTerm.t_Rig B_dData_dList.t_List) -> ((((v_checkAltBindersGo dtb_u_u218) dtb_u_u219) (B_dData_dList.v_reverse dtb_u_u220)) dtb_u_u221))

# 176 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_checkTerm = (fun (dtb_u_u222 : Elab_dTypes.t_Ec) (dtb_u_u223 : Base_dSource.t_Span) (dtb_u_u224 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u225 : Core_dTerm.t_Term) -> (match dtb_u_u225 with
  | Core_dTerm.C_Term_TVar (dtb_u_u226, dtb_u_u227, dtb_u_u228) -> (let dtb_u_u229 = (if ((dtb_u_u228).Base_dSource.f_Span_spanStartLine = 0) then dtb_u_u222 else (((v_recordUseSpan dtb_u_u222) dtb_u_u226) dtb_u_u228)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_uVarAt (B_dData_dList.v_length dtb_u_u224)) dtb_u_u227); B_dData_dPair.f_Pair_second = dtb_u_u229 })))
  | Core_dTerm.C_Term_TMeta (dtb_u_u230) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_uZeroOf (B_dData_dList.v_length dtb_u_u224)); B_dData_dPair.f_Pair_second = dtb_u_u222 }))
  | Core_dTerm.C_Term_TGlobal (dtb_u_u231) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_uZeroOf (B_dData_dList.v_length dtb_u_u224)); B_dData_dPair.f_Pair_second = dtb_u_u222 }))
  | Core_dTerm.C_Term_TType (dtb_u_u232) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_uZeroOf (B_dData_dList.v_length dtb_u_u224)); B_dData_dPair.f_Pair_second = dtb_u_u222 }))
  | Core_dTerm.C_Term_TPi (dtb_u_u233, dtb_u_u234, dtb_u_u235, dtb_u_u236, dtb_u_u237) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_uZeroOf (B_dData_dList.v_length dtb_u_u224)); B_dData_dPair.f_Pair_second = dtb_u_u222 }))
  | Core_dTerm.C_Term_TLam (dtb_u_u238, dtb_u_u239, dtb_u_u240, dtb_u_u241, dtb_u_u242) -> (let dtb_u_u243 = ((v_resolvedBinderSpan dtb_u_u241) dtb_u_u223) in (let dtb_u_u244 = ((v_binderEditSpan dtb_u_u238) dtb_u_u241) in (let dtb_u_u245 = (if (if (dtb_u_u238 <> "_") then ((v_shadowedByRuntime dtb_u_u238) dtb_u_u224) else false) then ((((v_warnAt1 dtb_u_u222) dtb_u_u243) (Base_dDiagnostics_dWarning.C_WarnErr_ShadowedBinder (dtb_u_u238))) dtb_u_u238) else dtb_u_u222) in (let dtb_u_u246 = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u238; B_dData_dPair.f_Pair_second = dtb_u_u239 }, dtb_u_u224)) in ((Base_dCommon.v_step ((((v_checkTerm dtb_u_u245) dtb_u_u223) dtb_u_u246) dtb_u_u242)) (fun (dtb_u_u247 : Core_dTerm.t_Rig B_dData_dList.t_List) (dtb_u_u248 : Elab_dTypes.t_Ec) -> ((Base_dCommon.v_step ((((((v_checkLamBinder dtb_u_u248) dtb_u_u243) dtb_u_u244) dtb_u_u238) dtb_u_u239) dtb_u_u247)) (fun (dtb_u_u249 : Core_dTerm.t_Rig B_dData_dList.t_List) (dtb_u_u250 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u249; B_dData_dPair.f_Pair_second = dtb_u_u250 }))))))))))
  | Core_dTerm.C_Term_TApp (dtb_u_u251, dtb_u_u252, dtb_u_u253) -> ((Base_dCommon.v_step ((((v_checkTerm dtb_u_u222) dtb_u_u223) dtb_u_u224) dtb_u_u251)) (fun (dtb_u_u254 : Core_dTerm.t_Rig B_dData_dList.t_List) (dtb_u_u255 : Elab_dTypes.t_Ec) -> (if (v_isRigZero dtb_u_u253) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u254; B_dData_dPair.f_Pair_second = dtb_u_u255 })) else ((Base_dCommon.v_step ((((v_checkTerm dtb_u_u255) dtb_u_u223) dtb_u_u224) dtb_u_u252)) (fun (dtb_u_u256 : Core_dTerm.t_Rig B_dData_dList.t_List) (dtb_u_u257 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_uAdd dtb_u_u254) ((v_uScale dtb_u_u253) dtb_u_u256)); B_dData_dPair.f_Pair_second = dtb_u_u257 })))))))
  | Core_dTerm.C_Term_TCon (dtb_u_u258, dtb_u_u259) -> ((((v_checkArgs dtb_u_u222) dtb_u_u223) dtb_u_u224) dtb_u_u259)
  | Core_dTerm.C_Term_TMk (dtb_u_u260, dtb_u_u261) -> ((((v_checkArgs dtb_u_u222) dtb_u_u223) dtb_u_u224) dtb_u_u261)
  | Core_dTerm.C_Term_TRecord (dtb_u_u262, dtb_u_u263) -> ((((v_checkArgs dtb_u_u222) dtb_u_u223) dtb_u_u224) dtb_u_u263)
  | Core_dTerm.C_Term_TProj (dtb_u_u264, dtb_u_u265, dtb_u_u266, dtb_u_u267, dtb_u_u268) -> ((((v_checkTerm dtb_u_u222) dtb_u_u223) dtb_u_u224) dtb_u_u264)
  | Core_dTerm.C_Term_TRecUpd (dtb_u_u269, dtb_u_u270, dtb_u_u271, dtb_u_u272, dtb_u_u273) -> ((Base_dCommon.v_step ((((v_checkTerm dtb_u_u222) dtb_u_u223) dtb_u_u224) dtb_u_u269)) (fun (dtb_u_u274 : Core_dTerm.t_Rig B_dData_dList.t_List) (dtb_u_u275 : Elab_dTypes.t_Ec) -> ((Base_dCommon.v_step ((((v_checkTerm dtb_u_u275) dtb_u_u223) ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb_u_u271)) dtb_u_u224)) dtb_u_u273)) (fun (dtb_u_u276 : Core_dTerm.t_Rig B_dData_dList.t_List) (dtb_u_u277 : Elab_dTypes.t_Ec) -> ((Base_dCommon.v_step ((((v_checkAltBinders dtb_u_u277) dtb_u_u223) (Core_dTerm.v_bindersOfPairs dtb_u_u271)) dtb_u_u276)) (fun (dtb_u_u278 : Core_dTerm.t_Rig B_dData_dList.t_List) (dtb_u_u279 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_uAdd dtb_u_u274) dtb_u_u278); B_dData_dPair.f_Pair_second = dtb_u_u279 }))))))))
  | Core_dTerm.C_Term_TCase (dtb_u_u280, dtb_u_u281) -> ((Base_dCommon.v_step ((((v_checkTerm dtb_u_u222) dtb_u_u223) dtb_u_u224) dtb_u_u280)) (fun (dtb_u_u282 : Core_dTerm.t_Rig B_dData_dList.t_List) (dtb_u_u283 : Elab_dTypes.t_Ec) -> ((Base_dCommon.v_step ((((v_checkAlts dtb_u_u283) dtb_u_u223) dtb_u_u224) dtb_u_u281)) (fun (dtb_u_u284 : Core_dTerm.t_Rig B_dData_dList.t_List) (dtb_u_u285 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_uAdd dtb_u_u282) dtb_u_u284); B_dData_dPair.f_Pair_second = dtb_u_u285 }))))))
  | Core_dTerm.C_Term_TIf (dtb_u_u286, dtb_u_u287, dtb_u_u288) -> ((Base_dCommon.v_step ((((v_checkTerm dtb_u_u222) dtb_u_u223) dtb_u_u224) dtb_u_u286)) (fun (dtb_u_u289 : Core_dTerm.t_Rig B_dData_dList.t_List) (dtb_u_u290 : Elab_dTypes.t_Ec) -> ((Base_dCommon.v_step ((((v_checkTerm dtb_u_u290) dtb_u_u223) dtb_u_u224) dtb_u_u287)) (fun (dtb_u_u291 : Core_dTerm.t_Rig B_dData_dList.t_List) (dtb_u_u292 : Elab_dTypes.t_Ec) -> ((Base_dCommon.v_step ((((v_checkTerm dtb_u_u292) dtb_u_u223) dtb_u_u224) dtb_u_u288)) (fun (dtb_u_u293 : Core_dTerm.t_Rig B_dData_dList.t_List) (dtb_u_u294 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_uAdd dtb_u_u289) ((v_uJoin dtb_u_u291) dtb_u_u293)); B_dData_dPair.f_Pair_second = dtb_u_u294 }))))))))
  | Core_dTerm.C_Term_TInt (dtb_u_u295) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_uZeroOf (B_dData_dList.v_length dtb_u_u224)); B_dData_dPair.f_Pair_second = dtb_u_u222 }))
  | Core_dTerm.C_Term_TStr (dtb_u_u296) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_uZeroOf (B_dData_dList.v_length dtb_u_u224)); B_dData_dPair.f_Pair_second = dtb_u_u222 }))
  | Core_dTerm.C_Term_TFloat (dtb_u_u297) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_uZeroOf (B_dData_dList.v_length dtb_u_u224)); B_dData_dPair.f_Pair_second = dtb_u_u222 }))
  | Core_dTerm.C_Term_TBool (dtb_u_u298) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_uZeroOf (B_dData_dList.v_length dtb_u_u224)); B_dData_dPair.f_Pair_second = dtb_u_u222 }))
  | _ -> failwith "DT: impossible branch"
))
# 226 "Vuna/Compiler/Elab/Usage.vuna"
and v_checkArgs = (fun (dtb_u_u299 : Elab_dTypes.t_Ec) (dtb_u_u300 : Base_dSource.t_Span) (dtb_u_u301 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u302 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_checkArgsGo dtb_u_u299) dtb_u_u300) dtb_u_u301) dtb_u_u302) (v_uZeroOf (B_dData_dList.v_length dtb_u_u301))))
# 229 "Vuna/Compiler/Elab/Usage.vuna"
and v_checkArgsGo = (fun (dtb_u_u303 : Elab_dTypes.t_Ec) (dtb_u_u304 : Base_dSource.t_Span) (dtb_u_u305 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u306 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u307 : Core_dTerm.t_Rig B_dData_dList.t_List) -> (match dtb_u_u306 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u308, dtb_u_u309) -> (match dtb_u_u308 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u310; B_dData_dPair.f_Pair_second = dtb_u_u311 } -> (if (v_isRigZero dtb_u_u311) then (((((v_checkArgsGo dtb_u_u303) dtb_u_u304) dtb_u_u305) dtb_u_u309) dtb_u_u307) else ((Base_dCommon.v_step ((((v_checkTerm dtb_u_u303) dtb_u_u304) dtb_u_u305) dtb_u_u310)) (fun (dtb_u_u312 : Core_dTerm.t_Rig B_dData_dList.t_List) (dtb_u_u313 : Elab_dTypes.t_Ec) -> (((((v_checkArgsGo dtb_u_u313) dtb_u_u304) dtb_u_u305) dtb_u_u309) ((v_uAdd dtb_u_u307) ((v_uScale dtb_u_u311) dtb_u_u312))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u307; B_dData_dPair.f_Pair_second = dtb_u_u303 }))
  | _ -> failwith "DT: impossible branch"
))
# 239 "Vuna/Compiler/Elab/Usage.vuna"
and v_checkAlts = (fun (dtb_u_u314 : Elab_dTypes.t_Ec) (dtb_u_u315 : Base_dSource.t_Span) (dtb_u_u316 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u317 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (((((v_checkAltsGo dtb_u_u314) dtb_u_u315) dtb_u_u316) dtb_u_u317) B_dData_dMaybe.C_Maybe_Nothing))
# 242 "Vuna/Compiler/Elab/Usage.vuna"
and v_checkAltsGo = (fun (dtb_u_u318 : Elab_dTypes.t_Ec) (dtb_u_u319 : Base_dSource.t_Span) (dtb_u_u320 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u321 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) (dtb_u_u322 : Core_dTerm.t_Rig B_dData_dList.t_List B_dData_dMaybe.t_Maybe) -> (match dtb_u_u321 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u323, dtb_u_u324) -> (match dtb_u_u323 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u325; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u326; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u327 } -> (let dtb_u_u328 = ((B_dData_dList.v_append (B_dData_dList.v_reverse (Core_dTerm.v_binderPairs dtb_u_u326))) dtb_u_u320) in (let dtb_u_u329 = (B_dData_dList.v_length dtb_u_u326) in ((Base_dCommon.v_step ((((v_checkTerm dtb_u_u318) dtb_u_u319) dtb_u_u328) dtb_u_u327)) (fun (dtb_u_u330 : Core_dTerm.t_Rig B_dData_dList.t_List) (dtb_u_u331 : Elab_dTypes.t_Ec) -> ((Base_dCommon.v_step ((((v_checkAltBinders dtb_u_u331) dtb_u_u319) dtb_u_u326) dtb_u_u330)) (fun (dtb_u_u332 : Core_dTerm.t_Rig B_dData_dList.t_List) (dtb_u_u333 : Elab_dTypes.t_Ec) -> (((((v_checkAltsGo dtb_u_u333) dtb_u_u319) dtb_u_u320) dtb_u_u324) (B_dData_dMaybe.C_Maybe_Just ((match dtb_u_u322 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u334) -> ((v_uJoin dtb_u_u334) dtb_u_u332)
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u332
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match dtb_u_u322 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u335) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u335; B_dData_dPair.f_Pair_second = dtb_u_u318 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_uZeroOf (B_dData_dList.v_length dtb_u_u320)); B_dData_dPair.f_Pair_second = dtb_u_u318 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 274 "Vuna/Compiler/Elab/Usage.vuna"
let v_checkDefUsage = (fun (dtb_u_u336 : Elab_dTypes.t_Ec) (dtb_u_u337 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (dtb_u_u338 : string) (dtb_u_u339 : Core_dTerm.t_Term) -> (let dtb_u_u340 = (match dtb_u_u337 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u344) -> dtb_u_u344
  | B_dData_dMaybe.C_Maybe_Nothing -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u341 = (v_resetUseSpans dtb_u_u336) in ((Base_dCommon.v_step ((((v_checkTerm dtb_u_u341) dtb_u_u340) B_dData_dList.C_List_Nil) dtb_u_u339)) (fun (dtb_u_u342 : Core_dTerm.t_Rig B_dData_dList.t_List) (dtb_u_u343 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC (dtb_u_u343)))))))

# 383 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_checkProgramUsageGo = (fun (dtb_u_u345 : Elab_dTypes.t_Ec) (dtb_u_u346 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u346 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u347, dtb_u_u348) -> (if ((v_isTypeLevelDef dtb_u_u345) dtb_u_u347) then ((v_checkProgramUsageGo dtb_u_u345) dtb_u_u348) else (if ((Elab_dMeta.v_isLinearType dtb_u_u345) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtDefType dtb_u_u347))) then (((Base_dDiagnostics_dTc.v_tcErr1 (v_defSpanOf dtb_u_u347)) (Base_dDiagnostics_dTc.C_TcErr_LinearTopLevel ((Elab_dTypes.v_dtDefName dtb_u_u347)))) (Elab_dTypes.v_dtDefName dtb_u_u347)) else (match (Elab_dTypes.v_dtDefBody dtb_u_u347) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_checkProgramUsageGo dtb_u_u345) dtb_u_u348)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u349) -> (let dtb_u_u350 = (v_resetUseSpans dtb_u_u345) in ((Base_dCommon.v_bind (((v_checkDefCapture dtb_u_u350) dtb_u_u347) dtb_u_u349)) (fun (dtb_u_u351 : int) -> ((Base_dCommon.v_bind ((((v_checkDefUsage dtb_u_u350) (Elab_dTypes.v_dtDefSpan dtb_u_u347)) (Elab_dTypes.v_dtDefName dtb_u_u347)) dtb_u_u349)) (fun (dtb_u_u352 : Elab_dTypes.t_Ec) -> ((v_checkProgramUsageGo dtb_u_u352) dtb_u_u348))))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb_u_u345))
  | _ -> failwith "DT: impossible branch"
))

# 380 "Vuna/Compiler/Elab/Usage.vuna"
let v_checkProgramUsage = (fun (dtb_u_u353 : Elab_dTypes.t_Ec) (dtb_u_u354 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((v_checkProgramUsageGo dtb_u_u353) dtb_u_u354))

# 466 "Vuna/Compiler/Elab/Usage.vuna"
let v_warnAt0Mod = (fun (dtb_u_u355 : Elab_dTypes.t_Ec) (dtb_u_u356 : (Base_dDiag.t_Diagnostic) -> Base_dDiag.t_Diagnostic) (dtb_u_u357 : Base_dSource.t_Span) (dtb_u_u358 : Base_dDiagnostics_dWarning.t_WarnErr) -> ((Elab_dTypes.v_ecAddWarning dtb_u_u355) ((((Base_dDiagnostics_dWarning.v_warnDiagAtMod dtb_u_u356) dtb_u_u357) dtb_u_u358) B_dData_dVec.C_Vec_Nil)))
