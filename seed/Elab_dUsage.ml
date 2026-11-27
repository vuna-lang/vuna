open Vuna_runtime
# 32 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_isTypeFormingFuel = (fun (fuel : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match v with
  | Core_dTerm.C_Value_VType (dtb__0) -> true
  | Core_dTerm.C_Value_VPi (dtb__1, dtb__2, dtb__3, dtb__4, dtb__5) -> ((v_isTypeFormingFuel (fuel - 1)) ((Core_dEval.v_applyClosure dtb__5) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__1, 0, B_dData_dList.C_List_Nil))))))
  | _ -> false
)))

# 29 "Vuna/Compiler/Elab/Usage.vuna"
let v_isTypeForming = (fun (v : Core_dTerm.t_Value) -> ((v_isTypeFormingFuel 128) v))

# 46 "Vuna/Compiler/Elab/Usage.vuna"
let[@tail_mod_cons] rec v_uZeroOf = (fun (n : int) -> (if (n <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (Core_dTerm.C_Rig_Rig0, (v_uZeroOf (n - 1))))))

# 52 "Vuna/Compiler/Elab/Usage.vuna"
let[@tail_mod_cons] rec v_uVarAtGo = (fun (n : int) (i : int) -> (if (n <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((if (i = 0) then Core_dTerm.C_Rig_Rig1 else Core_dTerm.C_Rig_Rig0), ((v_uVarAtGo (n - 1)) (i - 1))))))

# 49 "Vuna/Compiler/Elab/Usage.vuna"
let v_uVarAt = (fun (depth : int) (i : int) -> (if (if (i < 0) then true else (i >= depth)) then (v_uZeroOf depth) else ((v_uVarAtGo depth) i)))

# 56 "Vuna/Compiler/Elab/Usage.vuna"
let[@tail_mod_cons] rec v_uAdd = (fun (mc0 : Core_dTerm.t_Rig B_dData_dList.t_List) (mc1 : Core_dTerm.t_Rig B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (B_dData_dList.C_List__x58__x58_ (((Core_dTerm.v_rigAdd dtb__6) dtb__8), ((v_uAdd dtb__7) dtb__9)))
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Elab/Usage.vuna"
let v_uScale = (fun (rig : Core_dTerm.t_Rig) (us : Core_dTerm.t_Rig B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (u : Core_dTerm.t_Rig) -> ((Core_dTerm.v_rigScale rig) u))) us))

# 64 "Vuna/Compiler/Elab/Usage.vuna"
let[@tail_mod_cons] rec v_uJoin = (fun (mc0 : Core_dTerm.t_Rig B_dData_dList.t_List) (mc1 : Core_dTerm.t_Rig B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> (B_dData_dList.C_List__x58__x58_ (((Core_dTerm.v_rigJoin dtb__10) dtb__12), ((v_uJoin dtb__11) dtb__13)))
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_uDrop = (fun (n : int) (us : Core_dTerm.t_Rig B_dData_dList.t_List) -> (if (n <= 0) then us else (match us with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> ((v_uDrop (n - 1)) dtb__15)
  | _ -> failwith "DT: impossible branch"
)))

# 102 "Vuna/Compiler/Elab/Usage.vuna"
let v_resolvedBinderSpan = (fun (binderSp : Base_dSource.t_Span) (fallback : Base_dSource.t_Span) -> (if (Base_dSource.v_isSpanEmpty binderSp) then fallback else binderSp))

# 107 "Vuna/Compiler/Elab/Usage.vuna"
let v_binderEditSpan = (fun (name : string) (binderSp : Base_dSource.t_Span) -> (let width = ((Base_dSource.v_spanEndOffset binderSp) - (Base_dSource.v_spanStartOffset binderSp)) in (if (if (Base_dSource.v_isSpanEmpty binderSp) then true else (width <> (String.length name))) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (binderSp)))))

# 268 "Vuna/Compiler/Elab/Usage.vuna"
let v_isRigZero = (fun (mc0 : Core_dTerm.t_Rig) -> (match mc0 with
  | Core_dTerm.C_Rig_Rig0 -> true
  | _ -> false
))

# 134 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_shadowedByRuntime = (fun (mc0 : string) (mc1 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (match dtb__16 with
  | { B_dData_dPair.f_Pair_first = dtb__18; B_dData_dPair.f_Pair_second = dtb__19 } -> (if (v_isRigZero dtb__19) then ((v_shadowedByRuntime mc0) dtb__17) else (if (dtb__18 = mc0) then true else ((v_shadowedByRuntime mc0) dtb__17)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 309 "Vuna/Compiler/Elab/Usage.vuna"
let v_capCheckFuelMax = 1000000

# 303 "Vuna/Compiler/Elab/Usage.vuna"
let v_capCheckFuelFor = (fun (t : Core_dTerm.t_Term) -> (let scaled = (1024 + (4 * (Core_dTerm.v_termSize t))) in (if (scaled > v_capCheckFuelMax) then v_capCheckFuelMax else scaled)))

# 361 "Vuna/Compiler/Elab/Usage.vuna"
let v_ctorFamilyLinear = (fun (ec : Elab_dTypes.t_Ec) (c : string) -> (match ((Elab_dMeta.v_dtCtorLookupEc ec) c) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__20) -> (match ((Elab_dMeta.v_dtDataLookup (Elab_dTypes.v_dtCtorFamily dtb__20)) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__21) -> (Elab_dTypes.v_dtDataLinear dtb__21)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 312 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_capCheckFuel = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (t : Core_dTerm.t_Term) (allowed : bool) -> (if (fuel <= 0) then ((Base_dDiagnostics_dTc.v_tcErr0 sp) Base_dDiagnostics_dTc.C_TcErr_CaptureFuel) else (match t with
  | Core_dTerm.C_Term_TVar (dtb__22, dtb__23, dtb__24) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TGlobal (dtb__25) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TInt (dtb__26) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TStr (dtb__27) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TFloat (dtb__28) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TBool (dtb__29) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TMeta (dtb__30) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TType (dtb__31) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TPi (dtb__32, dtb__33, dtb__34, dtb__35, dtb__36) -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Term_TLam (dtb__37, dtb__38, dtb__39, dtb__40, dtb__41) -> (match (Core_dTerm.v_lamMarkOf dtb__39) with
  | Core_dTerm.C_LamMark_LamLinearClosure -> (if allowed then (((((v_capCheckFuel (fuel - 1)) ec) sp) dtb__41) false) else (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_LinearCaptureEscapes (dtb__37))) dtb__37))
  | Core_dTerm.C_LamMark_LamPlain -> (((((v_capCheckFuel (fuel - 1)) ec) sp) dtb__41) false)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TApp (dtb__42, dtb__43, dtb__44) -> ((Base_dCommon.v_bind (((((v_capCheckFuel (fuel - 1)) ec) sp) dtb__42) true)) (fun (_u : int) -> (if (v_isRigZero dtb__44) then (((((v_capCheckFuel (fuel - 1)) ec) sp) dtb__43) false) else (((((v_capCheckFuel (fuel - 1)) ec) sp) dtb__43) (Core_dTerm.v_rigIsLinear dtb__44)))))
  | Core_dTerm.C_Term_TCon (dtb__45, dtb__46) -> (((((v_capArgsFuel fuel) ec) sp) dtb__45) dtb__46)
  | Core_dTerm.C_Term_TMk (dtb__47, dtb__48) -> (((((v_capArgsFuel fuel) ec) sp) dtb__47) dtb__48)
  | Core_dTerm.C_Term_TRecord (dtb__49, dtb__50) -> (((((v_capArgsFuel fuel) ec) sp) dtb__49) dtb__50)
  | Core_dTerm.C_Term_TIf (dtb__51, dtb__52, dtb__53) -> ((Base_dCommon.v_bind (((((v_capCheckFuel (fuel - 1)) ec) sp) dtb__51) true)) (fun (_u : int) -> ((Base_dCommon.v_bind (((((v_capCheckFuel (fuel - 1)) ec) sp) dtb__52) allowed)) (fun (_u : int) -> (((((v_capCheckFuel (fuel - 1)) ec) sp) dtb__53) allowed)))))
  | Core_dTerm.C_Term_TProj (dtb__54, dtb__55, dtb__56, dtb__57, dtb__58) -> (((((v_capCheckFuel (fuel - 1)) ec) sp) dtb__54) true)
  | Core_dTerm.C_Term_TRecUpd (dtb__59, dtb__60, dtb__61, dtb__62, dtb__63) -> ((Base_dCommon.v_bind (((((v_capCheckFuel (fuel - 1)) ec) sp) dtb__59) true)) (fun (_u : int) -> (((((v_capCheckFuel (fuel - 1)) ec) sp) dtb__63) allowed)))
  | Core_dTerm.C_Term_TCase (dtb__64, dtb__65) -> ((Base_dCommon.v_bind (((((v_capCheckFuel (fuel - 1)) ec) sp) dtb__64) true)) (fun (_u : int) -> (((((v_capAltsFuel fuel) ec) sp) allowed) dtb__65)))
  | _ -> failwith "DT: impossible branch"
)))
# 341 "Vuna/Compiler/Elab/Usage.vuna"
and v_capArgsFuel = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (c : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_capArgsGo fuel) ec) sp) ((v_ctorFamilyLinear ec) c)) args))
# 344 "Vuna/Compiler/Elab/Usage.vuna"
and v_capArgsGo = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Base_dSource.t_Span) (mc3 : bool) (mc4 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__66, dtb__67) -> (match dtb__66 with
  | { B_dData_dPair.f_Pair_first = dtb__68; B_dData_dPair.f_Pair_second = dtb__69 } -> (let allowed = (if mc3 then (Core_dTerm.v_rigIsLinear dtb__69) else false) in ((Base_dCommon.v_bind (((((v_capCheckFuel (mc0 - 1)) mc1) mc2) dtb__68) allowed)) (fun (_u : int) -> (((((v_capArgsGo (mc0 - 1)) mc1) mc2) mc3) dtb__67))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))
# 353 "Vuna/Compiler/Elab/Usage.vuna"
and v_capAltsFuel = (fun (mc0 : int) (mc1 : Elab_dTypes.t_Ec) (mc2 : Base_dSource.t_Span) (mc3 : bool) (mc4 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__70, dtb__71) -> (match dtb__70 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__72; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__73; Core_dTerm.f_CaseAlt_caseAltBody = dtb__74 } -> ((Base_dCommon.v_bind (((((v_capCheckFuel (mc0 - 1)) mc1) mc2) dtb__74) mc3)) (fun (_u : int) -> (((((v_capAltsFuel (mc0 - 1)) mc1) mc2) mc3) dtb__71)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 297 "Vuna/Compiler/Elab/Usage.vuna"
let v_capCheck = (fun (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (t : Core_dTerm.t_Term) (allowed : bool) -> (((((v_capCheckFuel (v_capCheckFuelFor t)) ec) sp) t) allowed))

# 374 "Vuna/Compiler/Elab/Usage.vuna"
let v_isTypeLevelDef = (fun (ec : Elab_dTypes.t_Ec) (d : Elab_dTypes.t_DtDef) -> (v_isTypeForming ((((Core_dEval.v_force (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) Core_dTerm.v_defaultFuel) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtDefType d)))))

# 400 "Vuna/Compiler/Elab/Usage.vuna"
let v_defSpanOf = (fun (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefSpan d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__75) -> dtb__75
  | B_dData_dMaybe.C_Maybe_Nothing -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }
  | _ -> failwith "DT: impossible branch"
))

# 371 "Vuna/Compiler/Elab/Usage.vuna"
let v_checkDefCapture = (fun (ec : Elab_dTypes.t_Ec) (d : Elab_dTypes.t_DtDef) (body : Core_dTerm.t_Term) -> ((((v_capCheck ec) (v_defSpanOf d)) body) false))

# 412 "Vuna/Compiler/Elab/Usage.vuna"
let v_renameSuggestion = (fun (mc0 : string) (mc1 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (mc2 : Base_dDiag.t_Diagnostic) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__76) -> ((Base_dDiag.v_withSuggestion { Base_dDiag.f_Suggestion_suggestionTitle = (String.concat "" ["rename unused binder `"; mc0; "` to `_"; mc0; "`"]); Base_dDiag.f_Suggestion_suggestionApplicability = Base_dDiag.C_Applicability_MachineApplicable; Base_dDiag.f_Suggestion_suggestionEdits = (B_dData_dList.C_List__x58__x58_ ({ Base_dDiag.f_DiagEdit_editSpan = dtb__76; Base_dDiag.f_DiagEdit_editNewText = ("_" ^ mc0) }, B_dData_dList.C_List_Nil)) }) mc2)
  | B_dData_dMaybe.C_Maybe_Nothing -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 424 "Vuna/Compiler/Elab/Usage.vuna"
let v_resetUseSpans = (fun (ec : Elab_dTypes.t_Ec) -> ((Elab_dTypes.v_ecPutUseSpans ec) B_dData_dList.C_List_Nil))

# 428 "Vuna/Compiler/Elab/Usage.vuna"
let v_recordUseSpan = (fun (ec : Elab_dTypes.t_Ec) (name : string) (sp : Base_dSource.t_Span) -> ((Elab_dTypes.v_ecPutUseSpans ec) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = name; B_dData_dPair.f_Pair_second = sp }, (Elab_dTypes.v_ecUseSpans ec)))))

# 432 "Vuna/Compiler/Elab/Usage.vuna"
let v_usesOf = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (B_dData_dList.v_reverse ((B_dData_dList.v_map B_dData_dPair.v_secondOf) ((B_dData_dList.v_filter (fun (p : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> ((B_dData_dPair.v_firstOf (Obj.magic p)) = name))) (Elab_dTypes.v_ecUseSpans ec)))))

# 440 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_withUseSpans = (fun (mc0 : Base_dSource.t_Span B_dData_dList.t_List) (mc1 : Base_dDiag.t_Diagnostic) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__77, dtb__78) -> ((v_withUseSpans dtb__78) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldSpan ("use", dtb__77))) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 436 "Vuna/Compiler/Elab/Usage.vuna"
let v_withUseFields = (fun (ec : Elab_dTypes.t_Ec) (name : string) (d : Base_dDiag.t_Diagnostic) -> ((v_withUseSpans ((v_usesOf ec) name)) d))

# 80 "Vuna/Compiler/Elab/Usage.vuna"
let v_checkBinderRig = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Base_dSource.t_Span) (mc2 : string) (mc3 : Core_dTerm.t_Rig) (mc4 : Core_dTerm.t_Rig) -> (match mc3 with
  | Core_dTerm.C_Rig_RigOmega -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Rig_Rig1 -> (match mc4 with
  | Core_dTerm.C_Rig_Rig0 -> ((Base_dDiag.v_onErrDiag (fun (d : Base_dDiag.t_Diagnostic) -> (((v_withUseFields mc0) mc2) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldQuantity (mc2, 1, 0))) d)))) (((Base_dDiagnostics_dTc.v_tcErr1 mc1) (Base_dDiagnostics_dTc.C_TcErr_LinearUnused (mc2))) mc2))
  | Core_dTerm.C_Rig_Rig1 -> (Base_dDiag.C_Check_OkC (0))
  | Core_dTerm.C_Rig_RigOmega -> ((Base_dDiag.v_onErrDiag (fun (d : Base_dDiag.t_Diagnostic) -> (((v_withUseFields mc0) mc2) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldQuantity (mc2, 1, 2))) d)))) (((Base_dDiagnostics_dTc.v_tcErr1 mc1) (Base_dDiagnostics_dTc.C_TcErr_LinearOverused (mc2))) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Rig_Rig0 -> (if (v_isRigZero mc4) then (Base_dDiag.C_Check_OkC (0)) else ((Base_dDiag.v_onErrDiag (fun (d : Base_dDiag.t_Diagnostic) -> (((v_withUseFields mc0) mc2) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldQuantity (mc2, 0, 1))) d)))) (((Base_dDiagnostics_dTc.v_tcErr1 mc1) (Base_dDiagnostics_dTc.C_TcErr_ErasedBinderUsed (mc2))) mc2)))
  | _ -> failwith "DT: impossible branch"
))

# 450 "Vuna/Compiler/Elab/Usage.vuna"
let v_warnAt = (fun (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (e : Base_dDiagnostics_dWarning.t_WarnErr) (args : string B_dData_dVec.t_Vec) -> ((Elab_dTypes.v_ecAddWarning ec) (((Base_dDiagnostics_dWarning.v_warnDiagAt sp) e) args)))

# 454 "Vuna/Compiler/Elab/Usage.vuna"
let v_warnAt0 = (fun (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (e : Base_dDiagnostics_dWarning.t_WarnErr) -> ((((v_warnAt ec) sp) e) B_dData_dVec.C_Vec_Nil))

# 458 "Vuna/Compiler/Elab/Usage.vuna"
let v_warnAt1 = (fun (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (e : Base_dDiagnostics_dWarning.t_WarnErr) (a0 : string) -> ((((v_warnAt ec) sp) e) (B_dData_dVec.C_Vec__x58__x58_ (a0, B_dData_dVec.C_Vec_Nil))))

# 462 "Vuna/Compiler/Elab/Usage.vuna"
let v_warnAt1Mod = (fun (ec : Elab_dTypes.t_Ec) (f : (Base_dDiag.t_Diagnostic) -> Base_dDiag.t_Diagnostic) (sp : Base_dSource.t_Span) (e : Base_dDiagnostics_dWarning.t_WarnErr) (a0 : string) -> ((Elab_dTypes.v_ecAddWarning ec) ((((Base_dDiagnostics_dWarning.v_warnDiagAtMod f) sp) e) (B_dData_dVec.C_Vec__x58__x58_ (a0, B_dData_dVec.C_Vec_Nil)))))

# 408 "Vuna/Compiler/Elab/Usage.vuna"
let v_warnUnusedBinder = (fun (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (mEdit : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (name : string) -> (((((v_warnAt1Mod ec) ((v_renameSuggestion name) mEdit)) sp) (Base_dDiagnostics_dWarning.C_WarnErr_UnusedBinder (name))) name))

# 115 "Vuna/Compiler/Elab/Usage.vuna"
let v_checkLamBinder = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Base_dSource.t_Span) (mc2 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (mc3 : string) (mc4 : Core_dTerm.t_Rig) (mc5 : Core_dTerm.t_Rig B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__79, dtb__80) -> (let ec1 = (if (if (v_isRigZero dtb__79) then (B_dData_dBool.v_not ((B_dData_dString.v_startsWith "_") mc3)) else false) then (match mc4 with
  | Core_dTerm.C_Rig_RigOmega -> ((((v_warnUnusedBinder mc0) mc1) mc2) mc3)
  | _ -> mc0
) else mc0) in ((Base_dCommon.v_bind (((((v_checkBinderRig ec1) mc1) mc3) mc4) dtb__79)) (fun (_u : int) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__80; B_dData_dPair.f_Pair_second = ec1 })))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "usage vector lost lambda binder")
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_checkAltBindersGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Base_dSource.t_Span) (mc2 : Core_dTerm.t_Binder B_dData_dList.t_List) (mc3 : Core_dTerm.t_Rig B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__81, dtb__82) -> (let name = (Core_dTerm.v_binderNameOf dtb__81) in (let rig = (Core_dTerm.v_binderRigOf dtb__81) in (let bsp = ((v_resolvedBinderSpan (Core_dTerm.v_binderSpanOf dtb__81)) mc1) in (let mEdit = ((v_binderEditSpan name) (Core_dTerm.v_binderSpanOf dtb__81)) in (let restRuntime = (Core_dTerm.v_binderPairs dtb__82) in (match mc3 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "usage vector lost case binder")
  | B_dData_dList.C_List__x58__x58_ (dtb__83, dtb__84) -> (let ec1 = (if (if (name <> "_") then ((v_shadowedByRuntime name) restRuntime) else false) then ((((v_warnAt1 mc0) bsp) (Base_dDiagnostics_dWarning.C_WarnErr_ShadowedBinder (name))) name) else mc0) in (let ec2 = (if (if (v_isRigZero dtb__83) then (B_dData_dBool.v_not ((B_dData_dString.v_startsWith "_") name)) else false) then (match rig with
  | Core_dTerm.C_Rig_RigOmega -> ((((v_warnUnusedBinder ec1) bsp) mEdit) name)
  | _ -> ec1
) else ec1) in ((Base_dCommon.v_bind (((((v_checkBinderRig ec2) bsp) name) rig) dtb__83)) (fun (_u : int) -> ((((v_checkAltBindersGo ec2) mc1) dtb__82) dtb__84)))))
  | _ -> failwith "DT: impossible branch"
))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc3; B_dData_dPair.f_Pair_second = mc0 }))
  | _ -> failwith "DT: impossible branch"
))

# 141 "Vuna/Compiler/Elab/Usage.vuna"
let v_checkAltBinders = (fun (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (binders : Core_dTerm.t_Binder B_dData_dList.t_List) (us : Core_dTerm.t_Rig B_dData_dList.t_List) -> ((((v_checkAltBindersGo ec) sp) (B_dData_dList.v_reverse binders)) us))

# 176 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_checkTerm = (fun (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (env : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (match t with
  | Core_dTerm.C_Term_TVar (dtb__85, dtb__86, dtb__87) -> (let ec2 = (if ((dtb__87).Base_dSource.f_Span_spanStartLine = 0) then ec else (((v_recordUseSpan ec) dtb__85) dtb__87)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_uVarAt (B_dData_dList.v_length env)) dtb__86); B_dData_dPair.f_Pair_second = ec2 })))
  | Core_dTerm.C_Term_TMeta (dtb__88) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_uZeroOf (B_dData_dList.v_length env)); B_dData_dPair.f_Pair_second = ec }))
  | Core_dTerm.C_Term_TGlobal (dtb__89) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_uZeroOf (B_dData_dList.v_length env)); B_dData_dPair.f_Pair_second = ec }))
  | Core_dTerm.C_Term_TType (dtb__90) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_uZeroOf (B_dData_dList.v_length env)); B_dData_dPair.f_Pair_second = ec }))
  | Core_dTerm.C_Term_TPi (dtb__91, dtb__92, dtb__93, dtb__94, dtb__95) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_uZeroOf (B_dData_dList.v_length env)); B_dData_dPair.f_Pair_second = ec }))
  | Core_dTerm.C_Term_TLam (dtb__96, dtb__97, dtb__98, dtb__99, dtb__100) -> (let bsp = ((v_resolvedBinderSpan dtb__99) sp) in (let mEdit = ((v_binderEditSpan dtb__96) dtb__99) in (let ecW = (if (if (dtb__96 <> "_") then ((v_shadowedByRuntime dtb__96) env) else false) then ((((v_warnAt1 ec) bsp) (Base_dDiagnostics_dWarning.C_WarnErr_ShadowedBinder (dtb__96))) dtb__96) else ec) in (let env2 = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__96; B_dData_dPair.f_Pair_second = dtb__97 }, env)) in ((Base_dCommon.v_step ((((v_checkTerm ecW) sp) env2) dtb__100)) (fun (u : Core_dTerm.t_Rig B_dData_dList.t_List) (ec2 : Elab_dTypes.t_Ec) -> ((Base_dCommon.v_step ((((((v_checkLamBinder ec2) bsp) mEdit) dtb__96) dtb__97) u)) (fun (rest : Core_dTerm.t_Rig B_dData_dList.t_List) (ec3 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = rest; B_dData_dPair.f_Pair_second = ec3 }))))))))))
  | Core_dTerm.C_Term_TApp (dtb__101, dtb__102, dtb__103) -> ((Base_dCommon.v_step ((((v_checkTerm ec) sp) env) dtb__101)) (fun (uf : Core_dTerm.t_Rig B_dData_dList.t_List) (ec1 : Elab_dTypes.t_Ec) -> (if (v_isRigZero dtb__103) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = uf; B_dData_dPair.f_Pair_second = ec1 })) else ((Base_dCommon.v_step ((((v_checkTerm ec1) sp) env) dtb__102)) (fun (ua : Core_dTerm.t_Rig B_dData_dList.t_List) (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_uAdd uf) ((v_uScale dtb__103) ua)); B_dData_dPair.f_Pair_second = ec2 })))))))
  | Core_dTerm.C_Term_TCon (dtb__104, dtb__105) -> ((((v_checkArgs ec) sp) env) dtb__105)
  | Core_dTerm.C_Term_TMk (dtb__106, dtb__107) -> ((((v_checkArgs ec) sp) env) dtb__107)
  | Core_dTerm.C_Term_TRecord (dtb__108, dtb__109) -> ((((v_checkArgs ec) sp) env) dtb__109)
  | Core_dTerm.C_Term_TProj (dtb__110, dtb__111, dtb__112, dtb__113, dtb__114) -> ((((v_checkTerm ec) sp) env) dtb__110)
  | Core_dTerm.C_Term_TRecUpd (dtb__115, dtb__116, dtb__117, dtb__118, dtb__119) -> ((Base_dCommon.v_step ((((v_checkTerm ec) sp) env) dtb__115)) (fun (ub : Core_dTerm.t_Rig B_dData_dList.t_List) (ec1 : Elab_dTypes.t_Ec) -> ((Base_dCommon.v_step ((((v_checkTerm ec1) sp) ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb__117)) env)) dtb__119)) (fun (ua : Core_dTerm.t_Rig B_dData_dList.t_List) (ec2 : Elab_dTypes.t_Ec) -> ((Base_dCommon.v_step ((((v_checkAltBinders ec2) sp) (Core_dTerm.v_bindersOfPairs dtb__117)) ua)) (fun (outer : Core_dTerm.t_Rig B_dData_dList.t_List) (ec3 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_uAdd ub) outer); B_dData_dPair.f_Pair_second = ec3 }))))))))
  | Core_dTerm.C_Term_TCase (dtb__120, dtb__121) -> ((Base_dCommon.v_step ((((v_checkTerm ec) sp) env) dtb__120)) (fun (us : Core_dTerm.t_Rig B_dData_dList.t_List) (ec1 : Elab_dTypes.t_Ec) -> ((Base_dCommon.v_step ((((v_checkAlts ec1) sp) env) dtb__121)) (fun (ua : Core_dTerm.t_Rig B_dData_dList.t_List) (ec2 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_uAdd us) ua); B_dData_dPair.f_Pair_second = ec2 }))))))
  | Core_dTerm.C_Term_TIf (dtb__122, dtb__123, dtb__124) -> ((Base_dCommon.v_step ((((v_checkTerm ec) sp) env) dtb__122)) (fun (uc : Core_dTerm.t_Rig B_dData_dList.t_List) (ec1 : Elab_dTypes.t_Ec) -> ((Base_dCommon.v_step ((((v_checkTerm ec1) sp) env) dtb__123)) (fun (ut : Core_dTerm.t_Rig B_dData_dList.t_List) (ec2 : Elab_dTypes.t_Ec) -> ((Base_dCommon.v_step ((((v_checkTerm ec2) sp) env) dtb__124)) (fun (ue : Core_dTerm.t_Rig B_dData_dList.t_List) (ec3 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_uAdd uc) ((v_uJoin ut) ue)); B_dData_dPair.f_Pair_second = ec3 }))))))))
  | Core_dTerm.C_Term_TInt (dtb__125) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_uZeroOf (B_dData_dList.v_length env)); B_dData_dPair.f_Pair_second = ec }))
  | Core_dTerm.C_Term_TStr (dtb__126) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_uZeroOf (B_dData_dList.v_length env)); B_dData_dPair.f_Pair_second = ec }))
  | Core_dTerm.C_Term_TFloat (dtb__127) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_uZeroOf (B_dData_dList.v_length env)); B_dData_dPair.f_Pair_second = ec }))
  | Core_dTerm.C_Term_TBool (dtb__128) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_uZeroOf (B_dData_dList.v_length env)); B_dData_dPair.f_Pair_second = ec }))
  | _ -> failwith "DT: impossible branch"
))
# 226 "Vuna/Compiler/Elab/Usage.vuna"
and v_checkArgs = (fun (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (env : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((((v_checkArgsGo ec) sp) env) args) (v_uZeroOf (B_dData_dList.v_length env))))
# 229 "Vuna/Compiler/Elab/Usage.vuna"
and v_checkArgsGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Base_dSource.t_Span) (mc2 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Core_dTerm.t_Rig B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__129, dtb__130) -> (match dtb__129 with
  | { B_dData_dPair.f_Pair_first = dtb__131; B_dData_dPair.f_Pair_second = dtb__132 } -> (if (v_isRigZero dtb__132) then (((((v_checkArgsGo mc0) mc1) mc2) dtb__130) mc4) else ((Base_dCommon.v_step ((((v_checkTerm mc0) mc1) mc2) dtb__131)) (fun (ua : Core_dTerm.t_Rig B_dData_dList.t_List) (ec1 : Elab_dTypes.t_Ec) -> (((((v_checkArgsGo ec1) mc1) mc2) dtb__130) ((v_uAdd mc4) ((v_uScale dtb__132) ua))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc0 }))
  | _ -> failwith "DT: impossible branch"
))
# 239 "Vuna/Compiler/Elab/Usage.vuna"
and v_checkAlts = (fun (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (env : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (alts : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (((((v_checkAltsGo ec) sp) env) alts) B_dData_dMaybe.C_Maybe_Nothing))
# 242 "Vuna/Compiler/Elab/Usage.vuna"
and v_checkAltsGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Base_dSource.t_Span) (mc2 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) (mc4 : Core_dTerm.t_Rig B_dData_dList.t_List B_dData_dMaybe.t_Maybe) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__133, dtb__134) -> (match dtb__133 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__135; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__136; Core_dTerm.f_CaseAlt_caseAltBody = dtb__137 } -> (let env2 = ((B_dData_dList.v_append (B_dData_dList.v_reverse (Core_dTerm.v_binderPairs dtb__136))) mc2) in (let k = (B_dData_dList.v_length dtb__136) in ((Base_dCommon.v_step ((((v_checkTerm mc0) mc1) env2) dtb__137)) (fun (u : Core_dTerm.t_Rig B_dData_dList.t_List) (ec1 : Elab_dTypes.t_Ec) -> ((Base_dCommon.v_step ((((v_checkAltBinders ec1) mc1) dtb__136) u)) (fun (outer : Core_dTerm.t_Rig B_dData_dList.t_List) (ec2 : Elab_dTypes.t_Ec) -> (((((v_checkAltsGo ec2) mc1) mc2) dtb__134) (B_dData_dMaybe.C_Maybe_Just ((match mc4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__138) -> ((v_uJoin dtb__138) outer)
  | B_dData_dMaybe.C_Maybe_Nothing -> outer
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match mc4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__139) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__139; B_dData_dPair.f_Pair_second = mc0 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_uZeroOf (B_dData_dList.v_length mc2)); B_dData_dPair.f_Pair_second = mc0 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 274 "Vuna/Compiler/Elab/Usage.vuna"
let v_checkDefUsage = (fun (ec : Elab_dTypes.t_Ec) (msp : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (name : string) (body : Core_dTerm.t_Term) -> (let sp = (match msp with
  | B_dData_dMaybe.C_Maybe_Just (dtb__140) -> dtb__140
  | B_dData_dMaybe.C_Maybe_Nothing -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }
  | _ -> failwith "DT: impossible branch"
) in (let ec0 = (v_resetUseSpans ec) in ((Base_dCommon.v_step ((((v_checkTerm ec0) sp) B_dData_dList.C_List_Nil) body)) (fun (_urest : Core_dTerm.t_Rig B_dData_dList.t_List) (ec1 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC (ec1)))))))

# 383 "Vuna/Compiler/Elab/Usage.vuna"
let rec v_checkProgramUsageGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__141, dtb__142) -> (if ((v_isTypeLevelDef mc0) dtb__141) then ((v_checkProgramUsageGo mc0) dtb__142) else (if ((Elab_dMeta.v_isLinearType mc0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtDefType dtb__141))) then (((Base_dDiagnostics_dTc.v_tcErr1 (v_defSpanOf dtb__141)) (Base_dDiagnostics_dTc.C_TcErr_LinearTopLevel ((Elab_dTypes.v_dtDefName dtb__141)))) (Elab_dTypes.v_dtDefName dtb__141)) else (match (Elab_dTypes.v_dtDefBody dtb__141) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_checkProgramUsageGo mc0) dtb__142)
  | B_dData_dMaybe.C_Maybe_Just (dtb__143) -> (let ec0 = (v_resetUseSpans mc0) in ((Base_dCommon.v_bind (((v_checkDefCapture ec0) dtb__141) dtb__143)) (fun (_u : int) -> ((Base_dCommon.v_bind ((((v_checkDefUsage ec0) (Elab_dTypes.v_dtDefSpan dtb__141)) (Elab_dTypes.v_dtDefName dtb__141)) dtb__143)) (fun (ec2 : Elab_dTypes.t_Ec) -> ((v_checkProgramUsageGo ec2) dtb__142))))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (mc0))
  | _ -> failwith "DT: impossible branch"
))

# 380 "Vuna/Compiler/Elab/Usage.vuna"
let v_checkProgramUsage = (fun (ec : Elab_dTypes.t_Ec) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((v_checkProgramUsageGo ec) defs))

# 466 "Vuna/Compiler/Elab/Usage.vuna"
let v_warnAt0Mod = (fun (ec : Elab_dTypes.t_Ec) (f : (Base_dDiag.t_Diagnostic) -> Base_dDiag.t_Diagnostic) (sp : Base_dSource.t_Span) (e : Base_dDiagnostics_dWarning.t_WarnErr) -> ((Elab_dTypes.v_ecAddWarning ec) ((((Base_dDiagnostics_dWarning.v_warnDiagAtMod f) sp) e) B_dData_dVec.C_Vec_Nil)))
