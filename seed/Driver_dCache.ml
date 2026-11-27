open Vuna_runtime
type t_CachedProgram = { f_CachedProgram_cachedDatas : Elab_dTypes.t_DtData B_dData_dList.t_List; f_CachedProgram_cachedDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List; f_CachedProgram_cachedGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List; f_CachedProgram_cachedInsts : Elab_dTypes.t_DtInst B_dData_dList.t_List; f_CachedProgram_cachedClasses : Elab_dTypes.t_DtClass B_dData_dList.t_List; f_CachedProgram_cachedOpaque : string B_dData_dList.t_List }

# 37 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedOpaqueOf = (fun (mc0 : t_CachedProgram) -> (match mc0 with
  | { f_CachedProgram_cachedDatas = dtb__0; f_CachedProgram_cachedDefs = dtb__1; f_CachedProgram_cachedGlobals = dtb__2; f_CachedProgram_cachedInsts = dtb__3; f_CachedProgram_cachedClasses = dtb__4; f_CachedProgram_cachedOpaque = dtb__5 } -> dtb__5
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Driver/Cache.vuna"
let v_withCachedOpaque = (fun (mc0 : string B_dData_dList.t_List) (mc1 : t_CachedProgram) -> (match mc1 with
  | { f_CachedProgram_cachedDatas = dtb__6; f_CachedProgram_cachedDefs = dtb__7; f_CachedProgram_cachedGlobals = dtb__8; f_CachedProgram_cachedInsts = dtb__9; f_CachedProgram_cachedClasses = dtb__10; f_CachedProgram_cachedOpaque = dtb__11 } -> { f_CachedProgram_cachedDatas = dtb__6; f_CachedProgram_cachedDefs = dtb__7; f_CachedProgram_cachedGlobals = dtb__8; f_CachedProgram_cachedInsts = dtb__9; f_CachedProgram_cachedClasses = dtb__10; f_CachedProgram_cachedOpaque = mc0 }
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Driver/Cache.vuna"
let v_fixTerm = (fun (tbl : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (depth : int) (t : Core_dTerm.t_Term) -> (((Core_dEval.v_substSolvedMetasAtTbl tbl) depth) t))

# 50 "Vuna/Compiler/Driver/Cache.vuna"
let v_fixDef = (fun (mc0 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (mc1 : Elab_dTypes.t_DtDef) -> (match mc1 with
  | Elab_dTypes.C_DtDef_DtExtern (dtb__12, dtb__13, dtb__14, dtb__15) -> (Elab_dTypes.C_DtDef_DtExtern (dtb__12, (((v_fixTerm mc0) 0) dtb__13), dtb__14, dtb__15))
  | Elab_dTypes.C_DtDef_DtAxiom (dtb__16, dtb__17, dtb__18) -> (Elab_dTypes.C_DtDef_DtAxiom (dtb__16, (((v_fixTerm mc0) 0) dtb__17), dtb__18))
  | Elab_dTypes.C_DtDef_DtDef (dtb__19, dtb__20, dtb__21, dtb__22) -> (Elab_dTypes.C_DtDef_DtDef (dtb__19, (((v_fixTerm mc0) 0) dtb__20), (((v_fixTerm mc0) 0) dtb__21), dtb__22))
  | _ -> failwith "DT: impossible branch"
))

# 55 "Vuna/Compiler/Driver/Cache.vuna"
let v_fixCtor = (fun (mc0 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (mc1 : Elab_dTypes.t_DtCtor) -> (match mc1 with
  | { Elab_dTypes.f_DtCtor_dtCtorName = dtb__23; Elab_dTypes.f_DtCtor_dtCtorFamily = dtb__24; Elab_dTypes.f_DtCtor_dtCtorTelescope = dtb__25; Elab_dTypes.f_DtCtor_dtCtorType = dtb__26; Elab_dTypes.f_DtCtor_dtCtorSpan = dtb__27 } -> { Elab_dTypes.f_DtCtor_dtCtorName = dtb__23; Elab_dTypes.f_DtCtor_dtCtorFamily = dtb__24; Elab_dTypes.f_DtCtor_dtCtorTelescope = dtb__25; Elab_dTypes.f_DtCtor_dtCtorType = (((v_fixTerm mc0) 0) dtb__26); Elab_dTypes.f_DtCtor_dtCtorSpan = dtb__27 }
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Driver/Cache.vuna"
let v_fixFieldMeta = (fun (mc0 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (mc1 : Elab_dTypes.t_DtFieldMeta) -> (match mc1 with
  | { Elab_dTypes.f_DtFieldMeta_dtFieldName = dtb__28; Elab_dTypes.f_DtFieldMeta_dtFieldIndex = dtb__29; Elab_dTypes.f_DtFieldMeta_dtFieldType = dtb__30 } -> { Elab_dTypes.f_DtFieldMeta_dtFieldName = dtb__28; Elab_dTypes.f_DtFieldMeta_dtFieldIndex = dtb__29; Elab_dTypes.f_DtFieldMeta_dtFieldType = (((v_fixTerm mc0) 0) dtb__30) }
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Driver/Cache.vuna"
let v_fixData = (fun (mc0 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (mc1 : Elab_dTypes.t_DtData) -> (match mc1 with
  | { Elab_dTypes.f_DtData_dtDataName = dtb__31; Elab_dTypes.f_DtData_dtDataParams = dtb__32; Elab_dTypes.f_DtData_dtDataCtors = dtb__33; Elab_dTypes.f_DtData_dtDataKind = dtb__34; Elab_dTypes.f_DtData_dtDataViaClasses = dtb__35; Elab_dTypes.f_DtData_dtDataLinear = dtb__36; Elab_dTypes.f_DtData_dtDataRepr = dtb__37; Elab_dTypes.f_DtData_dtDataFields = dtb__38; Elab_dTypes.f_DtData_dtDataIsRecord = dtb__39 } -> { Elab_dTypes.f_DtData_dtDataName = dtb__31; Elab_dTypes.f_DtData_dtDataParams = dtb__32; Elab_dTypes.f_DtData_dtDataCtors = ((B_dData_dList.v_map (v_fixCtor mc0)) dtb__33); Elab_dTypes.f_DtData_dtDataKind = (((v_fixTerm mc0) 0) dtb__34); Elab_dTypes.f_DtData_dtDataViaClasses = dtb__35; Elab_dTypes.f_DtData_dtDataLinear = dtb__36; Elab_dTypes.f_DtData_dtDataRepr = dtb__37; Elab_dTypes.f_DtData_dtDataFields = ((B_dData_dList.v_map (v_fixFieldMeta mc0)) dtb__38); Elab_dTypes.f_DtData_dtDataIsRecord = dtb__39 }
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Driver/Cache.vuna"
let v_fixClass = (fun (mc0 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (mc1 : Elab_dTypes.t_DtClass) -> (match mc1 with
  | { Elab_dTypes.f_DtClass_dtClassName = dtb__40; Elab_dTypes.f_DtClass_dtClassParams = dtb__41; Elab_dTypes.f_DtClass_dtClassSupers = dtb__42; Elab_dTypes.f_DtClass_dtClassMethods = dtb__43; Elab_dTypes.f_DtClass_dtClassFieldTys = dtb__44; Elab_dTypes.f_DtClass_dtClassMethodSpans = dtb__45 } -> { Elab_dTypes.f_DtClass_dtClassName = dtb__40; Elab_dTypes.f_DtClass_dtClassParams = dtb__41; Elab_dTypes.f_DtClass_dtClassSupers = ((B_dData_dList.v_map ((v_fixTerm mc0) (B_dData_dList.v_length dtb__41))) dtb__42); Elab_dTypes.f_DtClass_dtClassMethods = ((B_dData_dList.v_map (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf (Obj.magic p)); B_dData_dPair.f_Pair_second = (((v_fixTerm mc0) 0) (B_dData_dPair.v_secondOf (Obj.magic p))) })) dtb__43); Elab_dTypes.f_DtClass_dtClassFieldTys = ((B_dData_dList.v_map ((v_fixTerm mc0) (B_dData_dList.v_length dtb__41))) dtb__44); Elab_dTypes.f_DtClass_dtClassMethodSpans = dtb__45 }
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Driver/Cache.vuna"
let[@tail_mod_cons] rec v_fixTele = (fun (mc0 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (mc1 : int) (mc2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__46, dtb__47) -> (match dtb__46 with
  | { B_dData_dPair.f_Pair_first = dtb__48; B_dData_dPair.f_Pair_second = dtb__49 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__48; B_dData_dPair.f_Pair_second = (((v_fixTerm mc0) mc1) dtb__49) }, (((v_fixTele mc0) (mc1 + 1)) dtb__47)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 92 "Vuna/Compiler/Driver/Cache.vuna"
let v_fixInst = (fun (mc0 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (mc1 : Elab_dTypes.t_DtInst) -> (match mc1 with
  | { Elab_dTypes.f_DtInst_dtInstName = dtb__50; Elab_dTypes.f_DtInst_dtInstSym = dtb__51; Elab_dTypes.f_DtInst_dtInstKey = dtb__52; Elab_dTypes.f_DtInst_dtInstTele = dtb__53; Elab_dTypes.f_DtInst_dtInstCtx = dtb__54; Elab_dTypes.f_DtInst_dtInstHead = dtb__55; Elab_dTypes.f_DtInst_dtInstSpan = dtb__56 } -> (let nTele = (B_dData_dList.v_length dtb__53) in { Elab_dTypes.f_DtInst_dtInstName = dtb__50; Elab_dTypes.f_DtInst_dtInstSym = dtb__51; Elab_dTypes.f_DtInst_dtInstKey = dtb__52; Elab_dTypes.f_DtInst_dtInstTele = (((v_fixTele mc0) 0) dtb__53); Elab_dTypes.f_DtInst_dtInstCtx = ((B_dData_dList.v_map ((v_fixTerm mc0) nTele)) dtb__54); Elab_dTypes.f_DtInst_dtInstHead = (((v_fixTerm mc0) nTele) dtb__55); Elab_dTypes.f_DtInst_dtInstSpan = dtb__56 })
  | _ -> failwith "DT: impossible branch"
))

# 111 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedOfProgramWith = (fun (tbl : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (prog : Elab_dTypes.t_DtProgram) -> { f_CachedProgram_cachedDatas = ((B_dData_dList.v_map (v_fixData tbl)) (Elab_dTypes.v_dtProgDatas prog)); f_CachedProgram_cachedDefs = ((B_dData_dList.v_map (v_fixDef tbl)) (Elab_dTypes.v_dtProgDefs prog)); f_CachedProgram_cachedGlobals = ((B_dData_dList.v_map (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf (Obj.magic p)); B_dData_dPair.f_Pair_second = (((v_fixTerm tbl) 0) (B_dData_dPair.v_secondOf (Obj.magic p))) })) (Elab_dTypes.v_dtProgGlobals prog)); f_CachedProgram_cachedInsts = ((B_dData_dList.v_map (v_fixInst tbl)) (Elab_dTypes.v_dtProgInsts prog)); f_CachedProgram_cachedClasses = ((B_dData_dList.v_map (v_fixClass tbl)) (Elab_dTypes.v_dtProgClasses prog)); f_CachedProgram_cachedOpaque = B_dData_dList.C_List_Nil })

# 105 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedOfProgram = (fun (prog : Elab_dTypes.t_DtProgram) -> ((v_cachedOfProgramWith (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (Elab_dTypes.v_dtProgSols prog))) prog))

# 126 "Vuna/Compiler/Driver/Cache.vuna"
let v_termValidAt = (fun (depth : int) (t : Core_dTerm.t_Term) -> (if (if ((B_dData_dList.v_length (Elab_dMeta.v_termMetasAll t)) = 0) then (B_dData_dBool.v_not ((Core_dTerm.v_hasFreeTermVar depth) t)) else false) then (B_dData_dBool.v_not (Core_dTerm.v_hasNegativeVar t)) else false))

# 130 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_ctorsValid = (fun (mc0 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> (if ((v_termValidAt 0) (Elab_dTypes.v_dtCtorType dtb__57)) then (v_ctorsValid dtb__58) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 135 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_fieldsValid = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__60) -> (if ((v_termValidAt mc0) (dtb__59).Elab_dTypes.f_DtFieldMeta_dtFieldType) then ((v_fieldsValid mc0) dtb__60) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 139 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_datasValid = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__61, dtb__62) -> (if (if (if ((v_termValidAt 0) (Elab_dTypes.v_dtDataKind dtb__61)) then (v_ctorsValid (Elab_dTypes.v_dtDataCtors dtb__61)) else false) then ((v_fieldsValid (B_dData_dList.v_length (dtb__61).Elab_dTypes.f_DtData_dtDataParams)) (Elab_dTypes.v_dtDataFields dtb__61)) else false) then (v_datasValid dtb__62) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Driver/Cache.vuna"
let v_bodyValid = (fun (t : Core_dTerm.t_Term) -> (if (if ((B_dData_dList.v_length (Elab_dMeta.v_termMetasRuntime t)) = 0) then (B_dData_dBool.v_not ((Core_dTerm.v_hasFreeTermVar 0) t)) else false) then (B_dData_dBool.v_not (Core_dTerm.v_hasNegativeVar t)) else false))

# 146 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_defsValid = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64) -> (match (Elab_dTypes.v_dtDefBody dtb__63) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__65) -> (if (if ((v_termValidAt 0) (Elab_dTypes.v_dtDefType dtb__63)) then (v_bodyValid dtb__65) else false) then (v_defsValid dtb__64) else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((v_termValidAt 0) (Elab_dTypes.v_dtDefType dtb__63)) then (v_defsValid dtb__64) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 158 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_globalsValid = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__66, dtb__67) -> (match dtb__66 with
  | { B_dData_dPair.f_Pair_first = dtb__68; B_dData_dPair.f_Pair_second = dtb__69 } -> (if ((v_termValidAt 0) dtb__69) then (v_globalsValid dtb__67) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 162 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_teleValid = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__70, dtb__71) -> (match dtb__70 with
  | { B_dData_dPair.f_Pair_first = dtb__72; B_dData_dPair.f_Pair_second = dtb__73 } -> (if ((v_termValidAt mc0) dtb__73) then ((v_teleValid (mc0 + 1)) dtb__71) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 166 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_termsValidAt = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (if ((v_termValidAt mc0) dtb__74) then ((v_termsValidAt mc0) dtb__75) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 170 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_instsValid = (fun (mc0 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> (let nTele = (B_dData_dList.v_length (dtb__76).Elab_dTypes.f_DtInst_dtInstTele) in (if (if (if ((v_teleValid 0) (dtb__76).Elab_dTypes.f_DtInst_dtInstTele) then ((v_termsValidAt nTele) (dtb__76).Elab_dTypes.f_DtInst_dtInstCtx) else false) then ((v_termValidAt nTele) (dtb__76).Elab_dTypes.f_DtInst_dtInstHead) else false) then (v_instsValid dtb__77) else false))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 178 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_classesValid = (fun (mc0 : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__78, dtb__79) -> (let projs = ((B_dData_dList.v_map (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf (Obj.magic p)))) (dtb__78).Elab_dTypes.f_DtClass_dtClassMethods) in (if (if (if ((v_termsValidAt 0) projs) then ((v_termsValidAt (B_dData_dList.v_length (dtb__78).Elab_dTypes.f_DtClass_dtClassParams)) (dtb__78).Elab_dTypes.f_DtClass_dtClassSupers) else false) then ((v_termsValidAt (B_dData_dList.v_length (dtb__78).Elab_dTypes.f_DtClass_dtClassParams)) (dtb__78).Elab_dTypes.f_DtClass_dtClassFieldTys) else false) then (v_classesValid dtb__79) else false))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedProgramValid = (fun (mc0 : t_CachedProgram) -> (match mc0 with
  | { f_CachedProgram_cachedDatas = dtb__80; f_CachedProgram_cachedDefs = dtb__81; f_CachedProgram_cachedGlobals = dtb__82; f_CachedProgram_cachedInsts = dtb__83; f_CachedProgram_cachedClasses = dtb__84; f_CachedProgram_cachedOpaque = dtb__85 } -> (if (if (if (if (v_datasValid dtb__80) then (v_defsValid dtb__81) else false) then (v_globalsValid dtb__82) else false) then (v_instsValid dtb__83) else false) then (v_classesValid dtb__84) else false)
  | _ -> failwith "DT: impossible branch"
))

# 195 "Vuna/Compiler/Driver/Cache.vuna"
let v_termIssueAt = (fun (depth : int) (t : Core_dTerm.t_Term) -> (if ((B_dData_dList.v_length (Elab_dMeta.v_termMetasAll t)) > 0) then "meta" else (if (Core_dTerm.v_hasNegativeVar t) then "negative-index" else (if ((Core_dTerm.v_hasFreeTermVar depth) t) then "free-var" else ""))))

# 214 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_ctorIssues = (fun (mc0 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__86, dtb__87) -> (let issue = ((v_termIssueAt 0) (Elab_dTypes.v_dtCtorType dtb__86)) in (if (issue = "") then (v_ctorIssues dtb__87) else (String.concat "" [(Elab_dTypes.v_dtCtorName dtb__86); " ctor:"; issue])))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 221 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_fieldIssues = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__88, dtb__89) -> (let issue = ((v_termIssueAt mc0) (dtb__88).Elab_dTypes.f_DtFieldMeta_dtFieldType) in (if (issue = "") then ((v_fieldIssues mc0) dtb__89) else (String.concat "" [(dtb__88).Elab_dTypes.f_DtFieldMeta_dtFieldName; " field:"; issue])))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 203 "Vuna/Compiler/Driver/Cache.vuna"
let v_dataIssue = (fun (d : Elab_dTypes.t_DtData) -> (let kindIssue = ((v_termIssueAt 0) (Elab_dTypes.v_dtDataKind d)) in (if (kindIssue = "") then (let ctorResult = (v_ctorIssues (Elab_dTypes.v_dtDataCtors d)) in (if (ctorResult = "") then ((v_fieldIssues (B_dData_dList.v_length (d).Elab_dTypes.f_DtData_dtDataParams)) (Elab_dTypes.v_dtDataFields d)) else ctorResult)) else (String.concat "" [(Elab_dTypes.v_dtDataName d); " kind:"; kindIssue]))))

# 228 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_datasIssue = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__90, dtb__91) -> (let issue = (v_dataIssue dtb__90) in (if (issue = "") then (v_datasIssue dtb__91) else issue))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 235 "Vuna/Compiler/Driver/Cache.vuna"
let v_bodyIssueAt = (fun (t : Core_dTerm.t_Term) -> (if ((B_dData_dList.v_length (Elab_dMeta.v_termMetasRuntime t)) > 0) then "meta" else (if (Core_dTerm.v_hasNegativeVar t) then "negative-index" else (if ((Core_dTerm.v_hasFreeTermVar 0) t) then "free-var" else ""))))

# 241 "Vuna/Compiler/Driver/Cache.vuna"
let v_defIssue = (fun (d : Elab_dTypes.t_DtDef) -> (let typeIssue = ((v_termIssueAt 0) (Elab_dTypes.v_dtDefType d)) in (if (typeIssue = "") then (match (Elab_dTypes.v_dtDefBody d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__92) -> (let bodyIssue = (v_bodyIssueAt dtb__92) in (if (bodyIssue = "") then "" else (String.concat "" [(Elab_dTypes.v_dtDefName d); " body:"; bodyIssue])))
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
) else (String.concat "" [(Elab_dTypes.v_dtDefName d); " type:"; typeIssue]))))

# 255 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_defsIssue = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__93, dtb__94) -> (let issue = (v_defIssue dtb__93) in (if (issue = "") then (v_defsIssue dtb__94) else issue))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 262 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_globalsIssue = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__95, dtb__96) -> (match dtb__95 with
  | { B_dData_dPair.f_Pair_first = dtb__97; B_dData_dPair.f_Pair_second = dtb__98 } -> (let issue = ((v_termIssueAt 0) dtb__98) in (if (issue = "") then (v_globalsIssue dtb__96) else (String.concat "" [dtb__97; ":"; issue])))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 286 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_teleIssueGo = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__99, dtb__100) -> (match dtb__99 with
  | { B_dData_dPair.f_Pair_first = dtb__101; B_dData_dPair.f_Pair_second = dtb__102 } -> (let issue = ((v_termIssueAt mc0) dtb__102) in (if (issue = "") then ((v_teleIssueGo (mc0 + 1)) dtb__100) else (String.concat "" [dtb__101; ":"; issue])))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 293 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_ctxIssues = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__103, dtb__104) -> (let issue = ((v_termIssueAt mc0) dtb__103) in (if (issue = "") then ((v_ctxIssues mc0) dtb__104) else issue))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 269 "Vuna/Compiler/Driver/Cache.vuna"
let v_instIssue = (fun (i : Elab_dTypes.t_DtInst) -> (let nTele = (B_dData_dList.v_length (i).Elab_dTypes.f_DtInst_dtInstTele) in (let teleIssue = ((v_teleIssueGo 0) (i).Elab_dTypes.f_DtInst_dtInstTele) in (if (teleIssue <> "") then (String.concat "" [(Elab_dTypes.v_dtInstName i); " tele:"; teleIssue]) else (let ctxIssue = ((v_ctxIssues nTele) (i).Elab_dTypes.f_DtInst_dtInstCtx) in (if (ctxIssue <> "") then (String.concat "" [(Elab_dTypes.v_dtInstName i); " ctx:"; ctxIssue]) else (let headIssue = ((v_termIssueAt nTele) (i).Elab_dTypes.f_DtInst_dtInstHead) in (if (headIssue = "") then "" else (String.concat "" [(Elab_dTypes.v_dtInstName i); " head:"; headIssue])))))))))

# 300 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_instsIssue = (fun (mc0 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__105, dtb__106) -> (let issue = (v_instIssue dtb__105) in (if (issue = "") then (v_instsIssue dtb__106) else issue))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 307 "Vuna/Compiler/Driver/Cache.vuna"
let v_classIssue = (fun (c : Elab_dTypes.t_DtClass) -> (let projIssue = ((v_ctxIssues 0) ((B_dData_dList.v_map (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf (Obj.magic p)))) (c).Elab_dTypes.f_DtClass_dtClassMethods)) in (if (projIssue <> "") then (String.concat "" [(Elab_dTypes.v_dtClassName c); " proj:"; projIssue]) else (let superIssue = ((v_ctxIssues (B_dData_dList.v_length (c).Elab_dTypes.f_DtClass_dtClassParams)) (c).Elab_dTypes.f_DtClass_dtClassSupers) in (if (superIssue <> "") then (String.concat "" [(Elab_dTypes.v_dtClassName c); " super:"; superIssue]) else (let fieldIssue = ((v_ctxIssues (B_dData_dList.v_length (c).Elab_dTypes.f_DtClass_dtClassParams)) (c).Elab_dTypes.f_DtClass_dtClassFieldTys) in (if (fieldIssue = "") then "" else (String.concat "" [(Elab_dTypes.v_dtClassName c); " field:"; fieldIssue]))))))))

# 323 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_classesIssue = (fun (mc0 : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__107, dtb__108) -> (let issue = (v_classIssue dtb__107) in (if (issue = "") then (v_classesIssue dtb__108) else issue))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 330 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedProgramIssue = (fun (mc0 : t_CachedProgram) -> (match mc0 with
  | { f_CachedProgram_cachedDatas = dtb__109; f_CachedProgram_cachedDefs = dtb__110; f_CachedProgram_cachedGlobals = dtb__111; f_CachedProgram_cachedInsts = dtb__112; f_CachedProgram_cachedClasses = dtb__113; f_CachedProgram_cachedOpaque = dtb__114 } -> (let datasI = (v_datasIssue dtb__109) in (let defsI = (v_defsIssue dtb__110) in (let globalsI = (v_globalsIssue dtb__111) in (let instsI = (v_instsIssue dtb__112) in (let classesI = (v_classesIssue dtb__113) in (if (datasI <> "") then ("datas " ^ datasI) else (if (defsI <> "") then ("defs " ^ defsI) else (if (globalsI <> "") then ("globals " ^ globalsI) else (if (instsI <> "") then ("insts " ^ instsI) else (if (classesI <> "") then ("classes " ^ classesI) else ""))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 356 "Vuna/Compiler/Driver/Cache.vuna"
let v_summaryMetaSegment = 1073741824

# 370 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_shiftTermFuel = (fun (fuel : int) (off : int) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "meta-shift") else (match t with
  | Core_dTerm.C_Term_TVar (dtb__115, dtb__116, dtb__117) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TVar (dtb__115, dtb__116, dtb__117))))
  | Core_dTerm.C_Term_TMeta (dtb__118) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TMeta ((dtb__118 + off)))))
  | Core_dTerm.C_Term_TGlobal (dtb__119) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TGlobal (dtb__119))))
  | Core_dTerm.C_Term_TType (dtb__120) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TType (dtb__120))))
  | Core_dTerm.C_Term_TPi (dtb__121, dtb__122, dtb__123, dtb__124, dtb__125) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__124)) (fun (d2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__125)) (fun (c2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TPi (dtb__121, dtb__122, dtb__123, d2, c2))))))))
  | Core_dTerm.C_Term_TLam (dtb__126, dtb__127, dtb__128, dtb__129, dtb__130) -> ((Base_dCommon.v_bind (((v_shiftLamTyFuel (fuel - 1)) off) dtb__128)) (fun (slot2 : (Core_dTerm.t_LamMark, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__130)) (fun (b2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TLam (dtb__126, dtb__127, slot2, dtb__129, b2))))))))
  | Core_dTerm.C_Term_TApp (dtb__131, dtb__132, dtb__133) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__131)) (fun (f2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__132)) (fun (a2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TApp (f2, a2, dtb__133))))))))
  | Core_dTerm.C_Term_TCon (dtb__134, dtb__135) -> ((Base_dCommon.v_bind (((v_shiftArgs (fuel - 1)) off) dtb__135)) (fun (args2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TCon (dtb__134, args2))))))
  | Core_dTerm.C_Term_TMk (dtb__136, dtb__137) -> ((Base_dCommon.v_bind (((v_shiftArgs (fuel - 1)) off) dtb__137)) (fun (args2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TMk (dtb__136, args2))))))
  | Core_dTerm.C_Term_TRecord (dtb__138, dtb__139) -> ((Base_dCommon.v_bind (((v_shiftArgs (fuel - 1)) off) dtb__139)) (fun (args2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TRecord (dtb__138, args2))))))
  | Core_dTerm.C_Term_TCase (dtb__140, dtb__141) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__140)) (fun (s2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftAlts (fuel - 1)) off) dtb__141)) (fun (alts2 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TCase (s2, alts2))))))))
  | Core_dTerm.C_Term_TProj (dtb__142, dtb__143, dtb__144, dtb__145, dtb__146) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__142)) (fun (base2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TProj (base2, dtb__143, dtb__144, dtb__145, dtb__146))))))
  | Core_dTerm.C_Term_TRecUpd (dtb__147, dtb__148, dtb__149, dtb__150, dtb__151) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__147)) (fun (base2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__151)) (fun (body2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TRecUpd (base2, dtb__148, dtb__149, dtb__150, body2))))))))
  | Core_dTerm.C_Term_TInt (dtb__152) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TInt (dtb__152))))
  | Core_dTerm.C_Term_TStr (dtb__153) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TStr (dtb__153))))
  | Core_dTerm.C_Term_TBool (dtb__154) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TBool (dtb__154))))
  | Core_dTerm.C_Term_TIf (dtb__155, dtb__156, dtb__157) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__155)) (fun (c2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__156)) (fun (th2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__157)) (fun (el2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TIf (c2, th2, el2))))))))))
  | Core_dTerm.C_Term_TFloat (dtb__158) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TFloat (dtb__158))))
  | _ -> failwith "DT: impossible branch"
)))
# 396 "Vuna/Compiler/Driver/Cache.vuna"
and v_shiftLamTyFuel = (fun (mc0 : int) (mc1 : int) (mc2 : (Core_dTerm.t_LamMark, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__159) -> (let tys = (B_dData_dPair.v_secondOf dtb__159) in ((Base_dCommon.v_bind (((v_shiftTermMaybeFuel mc0) mc1) (B_dData_dPair.v_firstOf tys))) (fun (b : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind (((v_shiftTermMaybeFuel mc0) mc1) (B_dData_dPair.v_secondOf tys))) (fun (r : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__159); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = b; B_dData_dPair.f_Pair_second = r } })))))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 406 "Vuna/Compiler/Driver/Cache.vuna"
and v_shiftTermMaybeFuel = (fun (mc0 : int) (mc1 : int) (mc2 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__160) -> ((Base_dCommon.v_bind (((v_shiftTermFuel mc0) mc1) dtb__160)) (fun (t2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (t2))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 412 "Vuna/Compiler/Driver/Cache.vuna"
and v_shiftArgs = (fun (mc0 : int) (mc1 : int) (mc2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__161, dtb__162) -> (match dtb__161 with
  | { B_dData_dPair.f_Pair_first = dtb__163; B_dData_dPair.f_Pair_second = dtb__164 } -> ((Base_dCommon.v_bind (((v_shiftTermFuel mc0) mc1) dtb__163)) (fun (a2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftArgs mc0) mc1) dtb__162)) (fun (rest2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = a2; B_dData_dPair.f_Pair_second = dtb__164 }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 419 "Vuna/Compiler/Driver/Cache.vuna"
and v_shiftAlts = (fun (mc0 : int) (mc1 : int) (mc2 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__165, dtb__166) -> (match dtb__165 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__167; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__168; Core_dTerm.f_CaseAlt_caseAltBody = dtb__169 } -> ((Base_dCommon.v_bind (((v_shiftTermFuel mc0) mc1) dtb__169)) (fun (b2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftAlts mc0) mc1) dtb__166)) (fun (rest2 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = dtb__167; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__168; Core_dTerm.f_CaseAlt_caseAltBody = b2 }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 367 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftTerm = (fun (off : int) (t : Core_dTerm.t_Term) -> (((v_shiftTermFuel ((Core_dTerm.v_termSize t) + 16)) off) t))

# 426 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftDef = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtDef) -> (match mc1 with
  | Elab_dTypes.C_DtDef_DtExtern (dtb__170, dtb__171, dtb__172, dtb__173) -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__171)) (fun (ty2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Elab_dTypes.C_DtDef_DtExtern (dtb__170, ty2, dtb__172, dtb__173))))))
  | Elab_dTypes.C_DtDef_DtAxiom (dtb__174, dtb__175, dtb__176) -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__175)) (fun (ty2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Elab_dTypes.C_DtDef_DtAxiom (dtb__174, ty2, dtb__176))))))
  | Elab_dTypes.C_DtDef_DtDef (dtb__177, dtb__178, dtb__179, dtb__180) -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__178)) (fun (ty2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__179)) (fun (body2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Elab_dTypes.C_DtDef_DtDef (dtb__177, ty2, body2, dtb__180))))))))
  | _ -> failwith "DT: impossible branch"
))

# 436 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftCtor = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtCtor) -> (match mc1 with
  | { Elab_dTypes.f_DtCtor_dtCtorName = dtb__181; Elab_dTypes.f_DtCtor_dtCtorFamily = dtb__182; Elab_dTypes.f_DtCtor_dtCtorTelescope = dtb__183; Elab_dTypes.f_DtCtor_dtCtorType = dtb__184; Elab_dTypes.f_DtCtor_dtCtorSpan = dtb__185 } -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__184)) (fun (ty2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ Elab_dTypes.f_DtCtor_dtCtorName = dtb__181; Elab_dTypes.f_DtCtor_dtCtorFamily = dtb__182; Elab_dTypes.f_DtCtor_dtCtorTelescope = dtb__183; Elab_dTypes.f_DtCtor_dtCtorType = ty2; Elab_dTypes.f_DtCtor_dtCtorSpan = dtb__185 }))))
  | _ -> failwith "DT: impossible branch"
))

# 440 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftFieldMeta = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtFieldMeta) -> (match mc1 with
  | { Elab_dTypes.f_DtFieldMeta_dtFieldName = dtb__186; Elab_dTypes.f_DtFieldMeta_dtFieldIndex = dtb__187; Elab_dTypes.f_DtFieldMeta_dtFieldType = dtb__188 } -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__188)) (fun (fty2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ Elab_dTypes.f_DtFieldMeta_dtFieldName = dtb__186; Elab_dTypes.f_DtFieldMeta_dtFieldIndex = dtb__187; Elab_dTypes.f_DtFieldMeta_dtFieldType = fty2 }))))
  | _ -> failwith "DT: impossible branch"
))

# 444 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftData = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtData) -> (match mc1 with
  | { Elab_dTypes.f_DtData_dtDataName = dtb__189; Elab_dTypes.f_DtData_dtDataParams = dtb__190; Elab_dTypes.f_DtData_dtDataCtors = dtb__191; Elab_dTypes.f_DtData_dtDataKind = dtb__192; Elab_dTypes.f_DtData_dtDataViaClasses = dtb__193; Elab_dTypes.f_DtData_dtDataLinear = dtb__194; Elab_dTypes.f_DtData_dtDataRepr = dtb__195; Elab_dTypes.f_DtData_dtDataFields = dtb__196; Elab_dTypes.f_DtData_dtDataIsRecord = dtb__197 } -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftCtor mc0)) dtb__191)) (fun (ctors2 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__192)) (fun (kind2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftFieldMeta mc0)) dtb__196)) (fun (fields2 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ Elab_dTypes.f_DtData_dtDataName = dtb__189; Elab_dTypes.f_DtData_dtDataParams = dtb__190; Elab_dTypes.f_DtData_dtDataCtors = ctors2; Elab_dTypes.f_DtData_dtDataKind = kind2; Elab_dTypes.f_DtData_dtDataViaClasses = dtb__193; Elab_dTypes.f_DtData_dtDataLinear = dtb__194; Elab_dTypes.f_DtData_dtDataRepr = dtb__195; Elab_dTypes.f_DtData_dtDataFields = fields2; Elab_dTypes.f_DtData_dtDataIsRecord = dtb__197 }))))))))
  | _ -> failwith "DT: impossible branch"
))

# 450 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_shiftTele = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__198, dtb__199) -> (match dtb__198 with
  | { B_dData_dPair.f_Pair_first = dtb__200; B_dData_dPair.f_Pair_second = dtb__201 } -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__201)) (fun (t2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((v_shiftTele mc0) dtb__199)) (fun (rest2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__200; B_dData_dPair.f_Pair_second = t2 }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 457 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftClass = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtClass) -> (match mc1 with
  | { Elab_dTypes.f_DtClass_dtClassName = dtb__202; Elab_dTypes.f_DtClass_dtClassParams = dtb__203; Elab_dTypes.f_DtClass_dtClassSupers = dtb__204; Elab_dTypes.f_DtClass_dtClassMethods = dtb__205; Elab_dTypes.f_DtClass_dtClassFieldTys = dtb__206; Elab_dTypes.f_DtClass_dtClassMethodSpans = dtb__207 } -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftTerm mc0)) dtb__204)) (fun (supers2 : Core_dTerm.t_Term B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_shiftTele mc0) dtb__205)) (fun (projs2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftTerm mc0)) dtb__206)) (fun (tys2 : Core_dTerm.t_Term B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ Elab_dTypes.f_DtClass_dtClassName = dtb__202; Elab_dTypes.f_DtClass_dtClassParams = dtb__203; Elab_dTypes.f_DtClass_dtClassSupers = supers2; Elab_dTypes.f_DtClass_dtClassMethods = projs2; Elab_dTypes.f_DtClass_dtClassFieldTys = tys2; Elab_dTypes.f_DtClass_dtClassMethodSpans = dtb__207 }))))))))
  | _ -> failwith "DT: impossible branch"
))

# 463 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftInst = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtInst) -> (match mc1 with
  | { Elab_dTypes.f_DtInst_dtInstName = dtb__208; Elab_dTypes.f_DtInst_dtInstSym = dtb__209; Elab_dTypes.f_DtInst_dtInstKey = dtb__210; Elab_dTypes.f_DtInst_dtInstTele = dtb__211; Elab_dTypes.f_DtInst_dtInstCtx = dtb__212; Elab_dTypes.f_DtInst_dtInstHead = dtb__213; Elab_dTypes.f_DtInst_dtInstSpan = dtb__214 } -> ((Base_dCommon.v_bind ((v_shiftTele mc0) dtb__211)) (fun (tele2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftTerm mc0)) dtb__212)) (fun (ctx2 : Core_dTerm.t_Term B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__213)) (fun (head2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ Elab_dTypes.f_DtInst_dtInstName = dtb__208; Elab_dTypes.f_DtInst_dtInstSym = dtb__209; Elab_dTypes.f_DtInst_dtInstKey = dtb__210; Elab_dTypes.f_DtInst_dtInstTele = tele2; Elab_dTypes.f_DtInst_dtInstCtx = ctx2; Elab_dTypes.f_DtInst_dtInstHead = head2; Elab_dTypes.f_DtInst_dtInstSpan = dtb__214 }))))))))
  | _ -> failwith "DT: impossible branch"
))

# 469 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftGlobal = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__215; B_dData_dPair.f_Pair_second = dtb__216 } -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__216)) (fun (t2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__215; B_dData_dPair.f_Pair_second = t2 }))))
  | _ -> failwith "DT: impossible branch"
))

# 472 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftCachedProgram = (fun (mc0 : int) (mc1 : t_CachedProgram) -> (match mc1 with
  | { f_CachedProgram_cachedDatas = dtb__217; f_CachedProgram_cachedDefs = dtb__218; f_CachedProgram_cachedGlobals = dtb__219; f_CachedProgram_cachedInsts = dtb__220; f_CachedProgram_cachedClasses = dtb__221; f_CachedProgram_cachedOpaque = dtb__222 } -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftData mc0)) dtb__217)) (fun (datas2 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftDef mc0)) dtb__218)) (fun (defs2 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftGlobal mc0)) dtb__219)) (fun (globals2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftInst mc0)) dtb__220)) (fun (insts2 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftClass mc0)) dtb__221)) (fun (classes2 : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ f_CachedProgram_cachedDatas = datas2; f_CachedProgram_cachedDefs = defs2; f_CachedProgram_cachedGlobals = globals2; f_CachedProgram_cachedInsts = insts2; f_CachedProgram_cachedClasses = classes2; f_CachedProgram_cachedOpaque = B_dData_dList.C_List_Nil }))))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 495 "Vuna/Compiler/Driver/Cache.vuna"
let v_encGlobalPair = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__223; B_dData_dPair.f_Pair_second = dtb__224 } -> ((Base_dBytes.v_encStr dtb__223) ((Core_dCanonical.v_encTerm dtb__224) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 488 "Vuna/Compiler/Driver/Cache.vuna"
let v_encCachedProgram = (fun (cp : t_CachedProgram) (acc : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList Elab_dCanonical.v_encDtData) (cp).f_CachedProgram_cachedDatas) (((Base_dBytes.v_encList Elab_dCanonical.v_encDtDef) (cp).f_CachedProgram_cachedDefs) (((Base_dBytes.v_encList v_encGlobalPair) (cp).f_CachedProgram_cachedGlobals) (((Base_dBytes.v_encList Elab_dCanonical.v_encDtInst) (cp).f_CachedProgram_cachedInsts) (((Base_dBytes.v_encList Elab_dCanonical.v_encDtClass) (cp).f_CachedProgram_cachedClasses) (((Base_dBytes.v_encList Base_dBytes.v_encStr) (cp).f_CachedProgram_cachedOpaque) acc)))))))

# 511 "Vuna/Compiler/Driver/Cache.vuna"
let v_decGlobalPair = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (n : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Core_dCanonical.v_decTerm (fuel - 1)) b1)) (fun (t : Core_dTerm.t_Term) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = t }; B_dData_dPair.f_Pair_second = b2 })))))))

# 505 "Vuna/Compiler/Driver/Cache.vuna"
let v_decCachedProgram = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Elab_dCanonical.v_decDtData) (fuel - 1)) c)) (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Elab_dCanonical.v_decDtDef) (fuel - 1)) b1)) (fun (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decGlobalPair) (fuel - 1)) b2)) (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (b3 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Elab_dCanonical.v_decDtInst) (fuel - 1)) b3)) (fun (insts : Elab_dTypes.t_DtInst B_dData_dList.t_List) (b4 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Elab_dCanonical.v_decDtClass) (fuel - 1)) b4)) (fun (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (b5 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) b5)) (fun (names : string B_dData_dList.t_List) (b6 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { f_CachedProgram_cachedDatas = datas; f_CachedProgram_cachedDefs = defs; f_CachedProgram_cachedGlobals = globals; f_CachedProgram_cachedInsts = insts; f_CachedProgram_cachedClasses = classes; f_CachedProgram_cachedOpaque = names }; B_dData_dPair.f_Pair_second = b6 })))))))))))))))

# 499 "Vuna/Compiler/Driver/Cache.vuna"
let v_decCachedProgramComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decCachedProgram (String.length s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__225) -> (match dtb__225 with
  | { B_dData_dPair.f_Pair_first = dtb__226; B_dData_dPair.f_Pair_second = dtb__227 } -> (if (Base_dBytes.v_curAtEnd dtb__227) then (B_dData_dMaybe.C_Maybe_Just (dtb__226)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 29 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedDatas = (fun (p : t_CachedProgram) -> (match p with
  | { f_CachedProgram_cachedDatas = dtb__228; f_CachedProgram_cachedDefs = dtb__229; f_CachedProgram_cachedGlobals = dtb__230; f_CachedProgram_cachedInsts = dtb__231; f_CachedProgram_cachedClasses = dtb__232; f_CachedProgram_cachedOpaque = dtb__233 } -> dtb__228
  | _ -> failwith "DT: impossible branch"
))

# 30 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedDefs = (fun (p : t_CachedProgram) -> (match p with
  | { f_CachedProgram_cachedDatas = dtb__234; f_CachedProgram_cachedDefs = dtb__235; f_CachedProgram_cachedGlobals = dtb__236; f_CachedProgram_cachedInsts = dtb__237; f_CachedProgram_cachedClasses = dtb__238; f_CachedProgram_cachedOpaque = dtb__239 } -> dtb__235
  | _ -> failwith "DT: impossible branch"
))

# 31 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedGlobals = (fun (p : t_CachedProgram) -> (match p with
  | { f_CachedProgram_cachedDatas = dtb__240; f_CachedProgram_cachedDefs = dtb__241; f_CachedProgram_cachedGlobals = dtb__242; f_CachedProgram_cachedInsts = dtb__243; f_CachedProgram_cachedClasses = dtb__244; f_CachedProgram_cachedOpaque = dtb__245 } -> dtb__242
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedInsts = (fun (p : t_CachedProgram) -> (match p with
  | { f_CachedProgram_cachedDatas = dtb__246; f_CachedProgram_cachedDefs = dtb__247; f_CachedProgram_cachedGlobals = dtb__248; f_CachedProgram_cachedInsts = dtb__249; f_CachedProgram_cachedClasses = dtb__250; f_CachedProgram_cachedOpaque = dtb__251 } -> dtb__249
  | _ -> failwith "DT: impossible branch"
))

# 33 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedClasses = (fun (p : t_CachedProgram) -> (match p with
  | { f_CachedProgram_cachedDatas = dtb__252; f_CachedProgram_cachedDefs = dtb__253; f_CachedProgram_cachedGlobals = dtb__254; f_CachedProgram_cachedInsts = dtb__255; f_CachedProgram_cachedClasses = dtb__256; f_CachedProgram_cachedOpaque = dtb__257 } -> dtb__256
  | _ -> failwith "DT: impossible branch"
))

# 34 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedOpaque = (fun (p : t_CachedProgram) -> (match p with
  | { f_CachedProgram_cachedDatas = dtb__258; f_CachedProgram_cachedDefs = dtb__259; f_CachedProgram_cachedGlobals = dtb__260; f_CachedProgram_cachedInsts = dtb__261; f_CachedProgram_cachedClasses = dtb__262; f_CachedProgram_cachedOpaque = dtb__263 } -> dtb__263
  | _ -> failwith "DT: impossible branch"
))
