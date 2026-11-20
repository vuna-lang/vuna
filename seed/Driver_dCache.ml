open Vuna_runtime
type t_CachedProgram = { f_CachedProgram_cachedDatas : Elab_dTypes.t_DtData B_dData_dList.t_List; f_CachedProgram_cachedDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List; f_CachedProgram_cachedGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List; f_CachedProgram_cachedInsts : Elab_dTypes.t_DtInst B_dData_dList.t_List; f_CachedProgram_cachedClasses : Elab_dTypes.t_DtClass B_dData_dList.t_List; f_CachedProgram_cachedOpaque : string B_dData_dList.t_List }

# 37 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedDatas = (fun (mc0 : t_CachedProgram) -> (match mc0 with
  | { f_CachedProgram_cachedDatas = dtb__0; f_CachedProgram_cachedDefs = dtb__1; f_CachedProgram_cachedGlobals = dtb__2; f_CachedProgram_cachedInsts = dtb__3; f_CachedProgram_cachedClasses = dtb__4; f_CachedProgram_cachedOpaque = dtb__5 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedDefs = (fun (mc0 : t_CachedProgram) -> (match mc0 with
  | { f_CachedProgram_cachedDatas = dtb__6; f_CachedProgram_cachedDefs = dtb__7; f_CachedProgram_cachedGlobals = dtb__8; f_CachedProgram_cachedInsts = dtb__9; f_CachedProgram_cachedClasses = dtb__10; f_CachedProgram_cachedOpaque = dtb__11 } -> dtb__7
  | _ -> failwith "DT: impossible branch"
))

# 43 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedGlobals = (fun (mc0 : t_CachedProgram) -> (match mc0 with
  | { f_CachedProgram_cachedDatas = dtb__12; f_CachedProgram_cachedDefs = dtb__13; f_CachedProgram_cachedGlobals = dtb__14; f_CachedProgram_cachedInsts = dtb__15; f_CachedProgram_cachedClasses = dtb__16; f_CachedProgram_cachedOpaque = dtb__17 } -> dtb__14
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedInsts = (fun (mc0 : t_CachedProgram) -> (match mc0 with
  | { f_CachedProgram_cachedDatas = dtb__18; f_CachedProgram_cachedDefs = dtb__19; f_CachedProgram_cachedGlobals = dtb__20; f_CachedProgram_cachedInsts = dtb__21; f_CachedProgram_cachedClasses = dtb__22; f_CachedProgram_cachedOpaque = dtb__23 } -> dtb__21
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedClasses = (fun (mc0 : t_CachedProgram) -> (match mc0 with
  | { f_CachedProgram_cachedDatas = dtb__24; f_CachedProgram_cachedDefs = dtb__25; f_CachedProgram_cachedGlobals = dtb__26; f_CachedProgram_cachedInsts = dtb__27; f_CachedProgram_cachedClasses = dtb__28; f_CachedProgram_cachedOpaque = dtb__29 } -> dtb__28
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedOpaqueOf = (fun (mc0 : t_CachedProgram) -> (match mc0 with
  | { f_CachedProgram_cachedDatas = dtb__30; f_CachedProgram_cachedDefs = dtb__31; f_CachedProgram_cachedGlobals = dtb__32; f_CachedProgram_cachedInsts = dtb__33; f_CachedProgram_cachedClasses = dtb__34; f_CachedProgram_cachedOpaque = dtb__35 } -> dtb__35
  | _ -> failwith "DT: impossible branch"
))

# 55 "Vuna/Compiler/Driver/Cache.vuna"
let v_withCachedOpaque = (fun (mc0 : string B_dData_dList.t_List) (mc1 : t_CachedProgram) -> (match mc1 with
  | { f_CachedProgram_cachedDatas = dtb__36; f_CachedProgram_cachedDefs = dtb__37; f_CachedProgram_cachedGlobals = dtb__38; f_CachedProgram_cachedInsts = dtb__39; f_CachedProgram_cachedClasses = dtb__40; f_CachedProgram_cachedOpaque = dtb__41 } -> { f_CachedProgram_cachedDatas = dtb__36; f_CachedProgram_cachedDefs = dtb__37; f_CachedProgram_cachedGlobals = dtb__38; f_CachedProgram_cachedInsts = dtb__39; f_CachedProgram_cachedClasses = dtb__40; f_CachedProgram_cachedOpaque = mc0 }
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Driver/Cache.vuna"
let v_fixTerm = (fun (tbl : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (depth : int) (t : Core_dTerm.t_Term) -> (((Core_dEval.v_substSolvedMetasAtTbl tbl) depth) t))

# 65 "Vuna/Compiler/Driver/Cache.vuna"
let v_fixDef = (fun (mc0 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (mc1 : Elab_dTypes.t_DtDef) -> (match mc1 with
  | Elab_dTypes.C_DtDef_DtExtern (dtb__42, dtb__43, dtb__44, dtb__45) -> (Elab_dTypes.C_DtDef_DtExtern (dtb__42, (((v_fixTerm mc0) 0) dtb__43), dtb__44, dtb__45))
  | Elab_dTypes.C_DtDef_DtAxiom (dtb__46, dtb__47, dtb__48) -> (Elab_dTypes.C_DtDef_DtAxiom (dtb__46, (((v_fixTerm mc0) 0) dtb__47), dtb__48))
  | Elab_dTypes.C_DtDef_DtDef (dtb__49, dtb__50, dtb__51, dtb__52) -> (Elab_dTypes.C_DtDef_DtDef (dtb__49, (((v_fixTerm mc0) 0) dtb__50), (((v_fixTerm mc0) 0) dtb__51), dtb__52))
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Driver/Cache.vuna"
let v_fixCtor = (fun (mc0 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (mc1 : Elab_dTypes.t_DtCtor) -> (match mc1 with
  | { Elab_dTypes.f_DtCtor_dtCtorName = dtb__53; Elab_dTypes.f_DtCtor_dtCtorFamily = dtb__54; Elab_dTypes.f_DtCtor_dtCtorTelescope = dtb__55; Elab_dTypes.f_DtCtor_dtCtorType = dtb__56; Elab_dTypes.f_DtCtor_dtCtorSpan = dtb__57 } -> { Elab_dTypes.f_DtCtor_dtCtorName = dtb__53; Elab_dTypes.f_DtCtor_dtCtorFamily = dtb__54; Elab_dTypes.f_DtCtor_dtCtorTelescope = dtb__55; Elab_dTypes.f_DtCtor_dtCtorType = (((v_fixTerm mc0) 0) dtb__56); Elab_dTypes.f_DtCtor_dtCtorSpan = dtb__57 }
  | _ -> failwith "DT: impossible branch"
))

# 73 "Vuna/Compiler/Driver/Cache.vuna"
let v_fixFieldMeta = (fun (mc0 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (mc1 : Elab_dTypes.t_DtFieldMeta) -> (match mc1 with
  | { Elab_dTypes.f_DtFieldMeta_dtFieldName = dtb__58; Elab_dTypes.f_DtFieldMeta_dtFieldIndex = dtb__59; Elab_dTypes.f_DtFieldMeta_dtFieldType = dtb__60 } -> { Elab_dTypes.f_DtFieldMeta_dtFieldName = dtb__58; Elab_dTypes.f_DtFieldMeta_dtFieldIndex = dtb__59; Elab_dTypes.f_DtFieldMeta_dtFieldType = (((v_fixTerm mc0) 0) dtb__60) }
  | _ -> failwith "DT: impossible branch"
))

# 76 "Vuna/Compiler/Driver/Cache.vuna"
let v_fixData = (fun (mc0 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (mc1 : Elab_dTypes.t_DtData) -> (match mc1 with
  | { Elab_dTypes.f_DtData_dtDataName = dtb__61; Elab_dTypes.f_DtData_dtDataParams = dtb__62; Elab_dTypes.f_DtData_dtDataCtors = dtb__63; Elab_dTypes.f_DtData_dtDataKind = dtb__64; Elab_dTypes.f_DtData_dtDataViaClasses = dtb__65; Elab_dTypes.f_DtData_dtDataLinear = dtb__66; Elab_dTypes.f_DtData_dtDataRepr = dtb__67; Elab_dTypes.f_DtData_dtDataFields = dtb__68; Elab_dTypes.f_DtData_dtDataIsRecord = dtb__69 } -> { Elab_dTypes.f_DtData_dtDataName = dtb__61; Elab_dTypes.f_DtData_dtDataParams = dtb__62; Elab_dTypes.f_DtData_dtDataCtors = ((B_dData_dList.v_map (v_fixCtor mc0)) dtb__63); Elab_dTypes.f_DtData_dtDataKind = (((v_fixTerm mc0) 0) dtb__64); Elab_dTypes.f_DtData_dtDataViaClasses = dtb__65; Elab_dTypes.f_DtData_dtDataLinear = dtb__66; Elab_dTypes.f_DtData_dtDataRepr = dtb__67; Elab_dTypes.f_DtData_dtDataFields = ((B_dData_dList.v_map (v_fixFieldMeta mc0)) dtb__68); Elab_dTypes.f_DtData_dtDataIsRecord = dtb__69 }
  | _ -> failwith "DT: impossible branch"
))

# 92 "Vuna/Compiler/Driver/Cache.vuna"
let v_fixClass = (fun (mc0 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (mc1 : Elab_dTypes.t_DtClass) -> (match mc1 with
  | { Elab_dTypes.f_DtClass_dtClassName = dtb__70; Elab_dTypes.f_DtClass_dtClassParams = dtb__71; Elab_dTypes.f_DtClass_dtClassSupers = dtb__72; Elab_dTypes.f_DtClass_dtClassMethods = dtb__73; Elab_dTypes.f_DtClass_dtClassFieldTys = dtb__74; Elab_dTypes.f_DtClass_dtClassMethodSpans = dtb__75 } -> { Elab_dTypes.f_DtClass_dtClassName = dtb__70; Elab_dTypes.f_DtClass_dtClassParams = dtb__71; Elab_dTypes.f_DtClass_dtClassSupers = ((B_dData_dList.v_map ((v_fixTerm mc0) (B_dData_dList.v_length dtb__71))) dtb__72); Elab_dTypes.f_DtClass_dtClassMethods = ((B_dData_dList.v_map (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = (((v_fixTerm mc0) 0) (B_dData_dPair.v_secondOf p)) })) dtb__73); Elab_dTypes.f_DtClass_dtClassFieldTys = ((B_dData_dList.v_map ((v_fixTerm mc0) (B_dData_dList.v_length dtb__71))) dtb__74); Elab_dTypes.f_DtClass_dtClassMethodSpans = dtb__75 }
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_fixTele = (fun (mc0 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (mc1 : int) (mc2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> (match dtb__76 with
  | { B_dData_dPair.f_Pair_first = dtb__78; B_dData_dPair.f_Pair_second = dtb__79 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__78; B_dData_dPair.f_Pair_second = (((v_fixTerm mc0) mc1) dtb__79) }, (((v_fixTele mc0) (mc1 + 1)) dtb__77)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Driver/Cache.vuna"
let v_fixInst = (fun (mc0 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (mc1 : Elab_dTypes.t_DtInst) -> (match mc1 with
  | { Elab_dTypes.f_DtInst_dtInstName = dtb__80; Elab_dTypes.f_DtInst_dtInstTele = dtb__81; Elab_dTypes.f_DtInst_dtInstCtx = dtb__82; Elab_dTypes.f_DtInst_dtInstHead = dtb__83; Elab_dTypes.f_DtInst_dtInstSpan = dtb__84 } -> ((fun nTele -> { Elab_dTypes.f_DtInst_dtInstName = dtb__80; Elab_dTypes.f_DtInst_dtInstTele = (((v_fixTele mc0) 0) dtb__81); Elab_dTypes.f_DtInst_dtInstCtx = ((B_dData_dList.v_map ((v_fixTerm mc0) nTele)) dtb__82); Elab_dTypes.f_DtInst_dtInstHead = (((v_fixTerm mc0) nTele) dtb__83); Elab_dTypes.f_DtInst_dtInstSpan = dtb__84 }) (B_dData_dList.v_length dtb__81))
  | _ -> failwith "DT: impossible branch"
))

# 120 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedOfProgramWith = (fun (tbl : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (prog : Elab_dTypes.t_DtProgram) -> { f_CachedProgram_cachedDatas = ((B_dData_dList.v_map (v_fixData tbl)) (Elab_dTypes.v_dtProgDatas prog)); f_CachedProgram_cachedDefs = ((B_dData_dList.v_map (v_fixDef tbl)) (Elab_dTypes.v_dtProgDefs prog)); f_CachedProgram_cachedGlobals = ((B_dData_dList.v_map (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = (((v_fixTerm tbl) 0) (B_dData_dPair.v_secondOf p)) })) (Elab_dTypes.v_dtProgGlobals prog)); f_CachedProgram_cachedInsts = ((B_dData_dList.v_map (v_fixInst tbl)) (Elab_dTypes.v_dtProgInsts prog)); f_CachedProgram_cachedClasses = ((B_dData_dList.v_map (v_fixClass tbl)) (Elab_dTypes.v_dtProgClasses prog)); f_CachedProgram_cachedOpaque = B_dData_dList.C_List_Nil })

# 114 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedOfProgram = (fun (prog : Elab_dTypes.t_DtProgram) -> ((v_cachedOfProgramWith (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) (Elab_dTypes.v_dtProgSols prog))) prog))

# 135 "Vuna/Compiler/Driver/Cache.vuna"
let v_termValidAt = (fun (depth : int) (t : Core_dTerm.t_Term) -> (if (if ((B_dData_dList.v_length (Elab_dMeta.v_termMetasAll t)) = 0) then (B_dData_dBool.v_not ((Core_dTerm.v_hasFreeTermVar depth) t)) else false) then (B_dData_dBool.v_not (Core_dTerm.v_hasNegativeVar t)) else false))

# 139 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_ctorsValid = (fun (mc0 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__85, dtb__86) -> (if ((v_termValidAt 0) (Elab_dTypes.v_dtCtorType dtb__85)) then (v_ctorsValid dtb__86) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 143 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_datasValid = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__87, dtb__88) -> (if (if ((v_termValidAt 0) (Elab_dTypes.v_dtDataKind dtb__87)) then (v_ctorsValid (Elab_dTypes.v_dtDataCtors dtb__87)) else false) then (v_datasValid dtb__88) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 157 "Vuna/Compiler/Driver/Cache.vuna"
let v_bodyValid = (fun (t : Core_dTerm.t_Term) -> (if (if ((B_dData_dList.v_length (Elab_dMeta.v_termMetasRuntime t)) = 0) then (B_dData_dBool.v_not ((Core_dTerm.v_hasFreeTermVar 0) t)) else false) then (B_dData_dBool.v_not (Core_dTerm.v_hasNegativeVar t)) else false))

# 148 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_defsValid = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__89, dtb__90) -> (match (Elab_dTypes.v_dtDefBody dtb__89) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__91) -> (if (if ((v_termValidAt 0) (Elab_dTypes.v_dtDefType dtb__89)) then (v_bodyValid dtb__91) else false) then (v_defsValid dtb__90) else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((v_termValidAt 0) (Elab_dTypes.v_dtDefType dtb__89)) then (v_defsValid dtb__90) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 160 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_globalsValid = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__92, dtb__93) -> (match dtb__92 with
  | { B_dData_dPair.f_Pair_first = dtb__94; B_dData_dPair.f_Pair_second = dtb__95 } -> (if ((v_termValidAt 0) dtb__95) then (v_globalsValid dtb__93) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 164 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_teleValid = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__96, dtb__97) -> (match dtb__96 with
  | { B_dData_dPair.f_Pair_first = dtb__98; B_dData_dPair.f_Pair_second = dtb__99 } -> (if ((v_termValidAt mc0) dtb__99) then ((v_teleValid (mc0 + 1)) dtb__97) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 168 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_termsValidAt = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101) -> (if ((v_termValidAt mc0) dtb__100) then ((v_termsValidAt mc0) dtb__101) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_instsValid = (fun (mc0 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__102, dtb__103) -> ((fun nTele -> (if (if (if ((v_teleValid 0) (dtb__102).Elab_dTypes.f_DtInst_dtInstTele) then ((v_termsValidAt nTele) (dtb__102).Elab_dTypes.f_DtInst_dtInstCtx) else false) then ((v_termValidAt nTele) (dtb__102).Elab_dTypes.f_DtInst_dtInstHead) else false) then (v_instsValid dtb__103) else false)) (B_dData_dList.v_length (dtb__102).Elab_dTypes.f_DtInst_dtInstTele))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 180 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_classesValid = (fun (mc0 : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__104, dtb__105) -> ((fun projs -> (if (if (if ((v_termsValidAt 0) projs) then ((v_termsValidAt (B_dData_dList.v_length (dtb__104).Elab_dTypes.f_DtClass_dtClassParams)) (dtb__104).Elab_dTypes.f_DtClass_dtClassSupers) else false) then ((v_termsValidAt (B_dData_dList.v_length (dtb__104).Elab_dTypes.f_DtClass_dtClassParams)) (dtb__104).Elab_dTypes.f_DtClass_dtClassFieldTys) else false) then (v_classesValid dtb__105) else false)) ((B_dData_dList.v_map (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf p))) (dtb__104).Elab_dTypes.f_DtClass_dtClassMethods))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 189 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedProgramValid = (fun (mc0 : t_CachedProgram) -> (match mc0 with
  | { f_CachedProgram_cachedDatas = dtb__106; f_CachedProgram_cachedDefs = dtb__107; f_CachedProgram_cachedGlobals = dtb__108; f_CachedProgram_cachedInsts = dtb__109; f_CachedProgram_cachedClasses = dtb__110; f_CachedProgram_cachedOpaque = dtb__111 } -> (if (if (if (if (v_datasValid dtb__106) then (v_defsValid dtb__107) else false) then (v_globalsValid dtb__108) else false) then (v_instsValid dtb__109) else false) then (v_classesValid dtb__110) else false)
  | _ -> failwith "DT: impossible branch"
))

# 197 "Vuna/Compiler/Driver/Cache.vuna"
let v_termIssueAt = (fun (depth : int) (t : Core_dTerm.t_Term) -> (if ((B_dData_dList.v_length (Elab_dMeta.v_termMetasAll t)) > 0) then "meta" else (if (Core_dTerm.v_hasNegativeVar t) then "negative-index" else (if ((Core_dTerm.v_hasFreeTermVar depth) t) then "free-var" else ""))))

# 211 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_ctorIssues = (fun (mc0 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__112, dtb__113) -> ((fun issue -> (if (issue = "") then (v_ctorIssues dtb__113) else (String.concat "" [(Elab_dTypes.v_dtCtorName dtb__112); " ctor:"; issue]))) ((v_termIssueAt 0) (Elab_dTypes.v_dtCtorType dtb__112)))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Driver/Cache.vuna"
let v_dataIssue = (fun (d : Elab_dTypes.t_DtData) -> ((fun kindIssue -> (if (kindIssue = "") then (v_ctorIssues (Elab_dTypes.v_dtDataCtors d)) else (String.concat "" [(Elab_dTypes.v_dtDataName d); " kind:"; kindIssue]))) ((v_termIssueAt 0) (Elab_dTypes.v_dtDataKind d))))

# 218 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_datasIssue = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__114, dtb__115) -> ((fun issue -> (if (issue = "") then (v_datasIssue dtb__115) else issue)) (v_dataIssue dtb__114))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 225 "Vuna/Compiler/Driver/Cache.vuna"
let v_bodyIssueAt = (fun (t : Core_dTerm.t_Term) -> (if ((B_dData_dList.v_length (Elab_dMeta.v_termMetasRuntime t)) > 0) then "meta" else (if (Core_dTerm.v_hasNegativeVar t) then "negative-index" else (if ((Core_dTerm.v_hasFreeTermVar 0) t) then "free-var" else ""))))

# 231 "Vuna/Compiler/Driver/Cache.vuna"
let v_defIssue = (fun (d : Elab_dTypes.t_DtDef) -> ((fun typeIssue -> (if (typeIssue = "") then (match (Elab_dTypes.v_dtDefBody d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__116) -> ((fun bodyIssue -> (if (bodyIssue = "") then "" else (String.concat "" [(Elab_dTypes.v_dtDefName d); " body:"; bodyIssue]))) (v_bodyIssueAt dtb__116))
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
) else (String.concat "" [(Elab_dTypes.v_dtDefName d); " type:"; typeIssue]))) ((v_termIssueAt 0) (Elab_dTypes.v_dtDefType d))))

# 245 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_defsIssue = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__117, dtb__118) -> ((fun issue -> (if (issue = "") then (v_defsIssue dtb__118) else issue)) (v_defIssue dtb__117))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 252 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_globalsIssue = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__119, dtb__120) -> (match dtb__119 with
  | { B_dData_dPair.f_Pair_first = dtb__121; B_dData_dPair.f_Pair_second = dtb__122 } -> ((fun issue -> (if (issue = "") then (v_globalsIssue dtb__120) else (String.concat "" [dtb__121; ":"; issue]))) ((v_termIssueAt 0) dtb__122))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 276 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_teleIssueGo = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__123, dtb__124) -> (match dtb__123 with
  | { B_dData_dPair.f_Pair_first = dtb__125; B_dData_dPair.f_Pair_second = dtb__126 } -> ((fun issue -> (if (issue = "") then ((v_teleIssueGo (mc0 + 1)) dtb__124) else (String.concat "" [dtb__125; ":"; issue]))) ((v_termIssueAt mc0) dtb__126))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 283 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_ctxIssues = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__127, dtb__128) -> ((fun issue -> (if (issue = "") then ((v_ctxIssues mc0) dtb__128) else issue)) ((v_termIssueAt mc0) dtb__127))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 259 "Vuna/Compiler/Driver/Cache.vuna"
let v_instIssue = (fun (i : Elab_dTypes.t_DtInst) -> ((fun nTele -> ((fun teleIssue -> (if (teleIssue <> "") then (String.concat "" [(Elab_dTypes.v_dtInstName i); " tele:"; teleIssue]) else ((fun ctxIssue -> (if (ctxIssue <> "") then (String.concat "" [(Elab_dTypes.v_dtInstName i); " ctx:"; ctxIssue]) else ((fun headIssue -> (if (headIssue = "") then "" else (String.concat "" [(Elab_dTypes.v_dtInstName i); " head:"; headIssue]))) ((v_termIssueAt nTele) (i).Elab_dTypes.f_DtInst_dtInstHead)))) ((v_ctxIssues nTele) (i).Elab_dTypes.f_DtInst_dtInstCtx)))) ((v_teleIssueGo 0) (i).Elab_dTypes.f_DtInst_dtInstTele))) (B_dData_dList.v_length (i).Elab_dTypes.f_DtInst_dtInstTele)))

# 290 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_instsIssue = (fun (mc0 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__129, dtb__130) -> ((fun issue -> (if (issue = "") then (v_instsIssue dtb__130) else issue)) (v_instIssue dtb__129))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 297 "Vuna/Compiler/Driver/Cache.vuna"
let v_classIssue = (fun (c : Elab_dTypes.t_DtClass) -> ((fun projIssue -> (if (projIssue <> "") then (String.concat "" [(Elab_dTypes.v_dtClassName c); " proj:"; projIssue]) else ((fun superIssue -> (if (superIssue <> "") then (String.concat "" [(Elab_dTypes.v_dtClassName c); " super:"; superIssue]) else ((fun fieldIssue -> (if (fieldIssue = "") then "" else (String.concat "" [(Elab_dTypes.v_dtClassName c); " field:"; fieldIssue]))) ((v_ctxIssues (B_dData_dList.v_length (c).Elab_dTypes.f_DtClass_dtClassParams)) (c).Elab_dTypes.f_DtClass_dtClassFieldTys)))) ((v_ctxIssues (B_dData_dList.v_length (c).Elab_dTypes.f_DtClass_dtClassParams)) (c).Elab_dTypes.f_DtClass_dtClassSupers)))) ((v_ctxIssues 0) ((B_dData_dList.v_map (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf p))) (c).Elab_dTypes.f_DtClass_dtClassMethods))))

# 313 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_classesIssue = (fun (mc0 : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__131, dtb__132) -> ((fun issue -> (if (issue = "") then (v_classesIssue dtb__132) else issue)) (v_classIssue dtb__131))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 320 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedProgramIssue = (fun (mc0 : t_CachedProgram) -> (match mc0 with
  | { f_CachedProgram_cachedDatas = dtb__133; f_CachedProgram_cachedDefs = dtb__134; f_CachedProgram_cachedGlobals = dtb__135; f_CachedProgram_cachedInsts = dtb__136; f_CachedProgram_cachedClasses = dtb__137; f_CachedProgram_cachedOpaque = dtb__138 } -> ((fun datasI -> ((fun defsI -> ((fun globalsI -> ((fun instsI -> ((fun classesI -> (if (datasI <> "") then ("datas " ^ datasI) else (if (defsI <> "") then ("defs " ^ defsI) else (if (globalsI <> "") then ("globals " ^ globalsI) else (if (instsI <> "") then ("insts " ^ instsI) else (if (classesI <> "") then ("classes " ^ classesI) else "")))))) (v_classesIssue dtb__137))) (v_instsIssue dtb__136))) (v_globalsIssue dtb__135))) (v_defsIssue dtb__134))) (v_datasIssue dtb__133))
  | _ -> failwith "DT: impossible branch"
))

# 346 "Vuna/Compiler/Driver/Cache.vuna"
let v_summaryMetaSegment = 1073741824

# 360 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_shiftTermFuel = (fun (fuel : int) (off : int) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "meta-shift") else (match t with
  | Core_dTerm.C_Term_TVar (dtb__139, dtb__140, dtb__141) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TVar (dtb__139, dtb__140, dtb__141))))
  | Core_dTerm.C_Term_TMeta (dtb__142) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TMeta ((dtb__142 + off)))))
  | Core_dTerm.C_Term_TGlobal (dtb__143) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TGlobal (dtb__143))))
  | Core_dTerm.C_Term_TType (dtb__144) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TType (dtb__144))))
  | Core_dTerm.C_Term_TPi (dtb__145, dtb__146, dtb__147, dtb__148, dtb__149) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__148)) (fun (d2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__149)) (fun (c2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TPi (dtb__145, dtb__146, dtb__147, d2, c2))))))))
  | Core_dTerm.C_Term_TLam (dtb__150, dtb__151, dtb__152, dtb__153, dtb__154) -> ((Base_dCommon.v_bind (((v_shiftLamTyFuel (fuel - 1)) off) dtb__152)) (fun (slot2 : (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__154)) (fun (b2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TLam (dtb__150, dtb__151, slot2, dtb__153, b2))))))))
  | Core_dTerm.C_Term_TApp (dtb__155, dtb__156, dtb__157) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__155)) (fun (f2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__156)) (fun (a2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TApp (f2, a2, dtb__157))))))))
  | Core_dTerm.C_Term_TCon (dtb__158, dtb__159) -> ((Base_dCommon.v_bind (((v_shiftArgs (fuel - 1)) off) dtb__159)) (fun (args2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TCon (dtb__158, args2))))))
  | Core_dTerm.C_Term_TMk (dtb__160, dtb__161) -> ((Base_dCommon.v_bind (((v_shiftArgs (fuel - 1)) off) dtb__161)) (fun (args2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TMk (dtb__160, args2))))))
  | Core_dTerm.C_Term_TRecord (dtb__162, dtb__163) -> ((Base_dCommon.v_bind (((v_shiftArgs (fuel - 1)) off) dtb__163)) (fun (args2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TRecord (dtb__162, args2))))))
  | Core_dTerm.C_Term_TCase (dtb__164, dtb__165) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__164)) (fun (s2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftAlts (fuel - 1)) off) dtb__165)) (fun (alts2 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TCase (s2, alts2))))))))
  | Core_dTerm.C_Term_TProj (dtb__166, dtb__167, dtb__168, dtb__169, dtb__170) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__166)) (fun (base2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TProj (base2, dtb__167, dtb__168, dtb__169, dtb__170))))))
  | Core_dTerm.C_Term_TRecUpd (dtb__171, dtb__172, dtb__173, dtb__174, dtb__175) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__171)) (fun (base2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__175)) (fun (body2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TRecUpd (base2, dtb__172, dtb__173, dtb__174, body2))))))))
  | Core_dTerm.C_Term_TInt (dtb__176) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TInt (dtb__176))))
  | Core_dTerm.C_Term_TStr (dtb__177) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TStr (dtb__177))))
  | Core_dTerm.C_Term_TBool (dtb__178) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TBool (dtb__178))))
  | Core_dTerm.C_Term_TIf (dtb__179, dtb__180, dtb__181) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__179)) (fun (c2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__180)) (fun (th2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__181)) (fun (el2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TIf (c2, th2, el2))))))))))
  | Core_dTerm.C_Term_TFloat (dtb__182) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TFloat (dtb__182))))
  | _ -> failwith "DT: impossible branch"
)))
# 386 "Vuna/Compiler/Driver/Cache.vuna"
and v_shiftLamTyFuel = (fun (mc0 : int) (mc1 : int) (mc2 : (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__183) -> ((Base_dCommon.v_bind (((v_shiftTermMaybeFuel mc0) mc1) (B_dData_dPair.v_firstOf dtb__183))) (fun (b : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind (((v_shiftTermMaybeFuel mc0) mc1) (B_dData_dPair.v_secondOf dtb__183))) (fun (r : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (Base_dDiag.C_Check_OkC (((Core_dTerm.v_lamTyOf b) r)))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 394 "Vuna/Compiler/Driver/Cache.vuna"
and v_shiftTermMaybeFuel = (fun (mc0 : int) (mc1 : int) (mc2 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__184) -> ((Base_dCommon.v_bind (((v_shiftTermFuel mc0) mc1) dtb__184)) (fun (t2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (t2))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 400 "Vuna/Compiler/Driver/Cache.vuna"
and v_shiftArgs = (fun (mc0 : int) (mc1 : int) (mc2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__185, dtb__186) -> (match dtb__185 with
  | { B_dData_dPair.f_Pair_first = dtb__187; B_dData_dPair.f_Pair_second = dtb__188 } -> ((Base_dCommon.v_bind (((v_shiftTermFuel mc0) mc1) dtb__187)) (fun (a2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftArgs mc0) mc1) dtb__186)) (fun (rest2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = a2; B_dData_dPair.f_Pair_second = dtb__188 }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 407 "Vuna/Compiler/Driver/Cache.vuna"
and v_shiftAlts = (fun (mc0 : int) (mc1 : int) (mc2 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__189, dtb__190) -> (match dtb__189 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__191; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__192; Core_dTerm.f_CaseAlt_caseAltBody = dtb__193 } -> ((Base_dCommon.v_bind (((v_shiftTermFuel mc0) mc1) dtb__193)) (fun (b2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftAlts mc0) mc1) dtb__190)) (fun (rest2 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = dtb__191; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__192; Core_dTerm.f_CaseAlt_caseAltBody = b2 }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 357 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftTerm = (fun (off : int) (t : Core_dTerm.t_Term) -> (((v_shiftTermFuel ((Core_dTerm.v_termSize t) + 16)) off) t))

# 414 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftDef = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtDef) -> (match mc1 with
  | Elab_dTypes.C_DtDef_DtExtern (dtb__194, dtb__195, dtb__196, dtb__197) -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__195)) (fun (ty2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Elab_dTypes.C_DtDef_DtExtern (dtb__194, ty2, dtb__196, dtb__197))))))
  | Elab_dTypes.C_DtDef_DtAxiom (dtb__198, dtb__199, dtb__200) -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__199)) (fun (ty2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Elab_dTypes.C_DtDef_DtAxiom (dtb__198, ty2, dtb__200))))))
  | Elab_dTypes.C_DtDef_DtDef (dtb__201, dtb__202, dtb__203, dtb__204) -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__202)) (fun (ty2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__203)) (fun (body2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Elab_dTypes.C_DtDef_DtDef (dtb__201, ty2, body2, dtb__204))))))))
  | _ -> failwith "DT: impossible branch"
))

# 424 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftCtor = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtCtor) -> (match mc1 with
  | { Elab_dTypes.f_DtCtor_dtCtorName = dtb__205; Elab_dTypes.f_DtCtor_dtCtorFamily = dtb__206; Elab_dTypes.f_DtCtor_dtCtorTelescope = dtb__207; Elab_dTypes.f_DtCtor_dtCtorType = dtb__208; Elab_dTypes.f_DtCtor_dtCtorSpan = dtb__209 } -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__208)) (fun (ty2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ Elab_dTypes.f_DtCtor_dtCtorName = dtb__205; Elab_dTypes.f_DtCtor_dtCtorFamily = dtb__206; Elab_dTypes.f_DtCtor_dtCtorTelescope = dtb__207; Elab_dTypes.f_DtCtor_dtCtorType = ty2; Elab_dTypes.f_DtCtor_dtCtorSpan = dtb__209 }))))
  | _ -> failwith "DT: impossible branch"
))

# 428 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftFieldMeta = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtFieldMeta) -> (match mc1 with
  | { Elab_dTypes.f_DtFieldMeta_dtFieldName = dtb__210; Elab_dTypes.f_DtFieldMeta_dtFieldIndex = dtb__211; Elab_dTypes.f_DtFieldMeta_dtFieldType = dtb__212 } -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__212)) (fun (fty2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ Elab_dTypes.f_DtFieldMeta_dtFieldName = dtb__210; Elab_dTypes.f_DtFieldMeta_dtFieldIndex = dtb__211; Elab_dTypes.f_DtFieldMeta_dtFieldType = fty2 }))))
  | _ -> failwith "DT: impossible branch"
))

# 432 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftData = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtData) -> (match mc1 with
  | { Elab_dTypes.f_DtData_dtDataName = dtb__213; Elab_dTypes.f_DtData_dtDataParams = dtb__214; Elab_dTypes.f_DtData_dtDataCtors = dtb__215; Elab_dTypes.f_DtData_dtDataKind = dtb__216; Elab_dTypes.f_DtData_dtDataViaClasses = dtb__217; Elab_dTypes.f_DtData_dtDataLinear = dtb__218; Elab_dTypes.f_DtData_dtDataRepr = dtb__219; Elab_dTypes.f_DtData_dtDataFields = dtb__220; Elab_dTypes.f_DtData_dtDataIsRecord = dtb__221 } -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftCtor mc0)) dtb__215)) (fun (ctors2 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__216)) (fun (kind2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftFieldMeta mc0)) dtb__220)) (fun (fields2 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ Elab_dTypes.f_DtData_dtDataName = dtb__213; Elab_dTypes.f_DtData_dtDataParams = dtb__214; Elab_dTypes.f_DtData_dtDataCtors = ctors2; Elab_dTypes.f_DtData_dtDataKind = kind2; Elab_dTypes.f_DtData_dtDataViaClasses = dtb__217; Elab_dTypes.f_DtData_dtDataLinear = dtb__218; Elab_dTypes.f_DtData_dtDataRepr = dtb__219; Elab_dTypes.f_DtData_dtDataFields = fields2; Elab_dTypes.f_DtData_dtDataIsRecord = dtb__221 }))))))))
  | _ -> failwith "DT: impossible branch"
))

# 438 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_shiftTele = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__222, dtb__223) -> (match dtb__222 with
  | { B_dData_dPair.f_Pair_first = dtb__224; B_dData_dPair.f_Pair_second = dtb__225 } -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__225)) (fun (t2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((v_shiftTele mc0) dtb__223)) (fun (rest2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__224; B_dData_dPair.f_Pair_second = t2 }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 445 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftClass = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtClass) -> (match mc1 with
  | { Elab_dTypes.f_DtClass_dtClassName = dtb__226; Elab_dTypes.f_DtClass_dtClassParams = dtb__227; Elab_dTypes.f_DtClass_dtClassSupers = dtb__228; Elab_dTypes.f_DtClass_dtClassMethods = dtb__229; Elab_dTypes.f_DtClass_dtClassFieldTys = dtb__230; Elab_dTypes.f_DtClass_dtClassMethodSpans = dtb__231 } -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftTerm mc0)) dtb__228)) (fun (supers2 : Core_dTerm.t_Term B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_shiftTele mc0) dtb__229)) (fun (projs2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftTerm mc0)) dtb__230)) (fun (tys2 : Core_dTerm.t_Term B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ Elab_dTypes.f_DtClass_dtClassName = dtb__226; Elab_dTypes.f_DtClass_dtClassParams = dtb__227; Elab_dTypes.f_DtClass_dtClassSupers = supers2; Elab_dTypes.f_DtClass_dtClassMethods = projs2; Elab_dTypes.f_DtClass_dtClassFieldTys = tys2; Elab_dTypes.f_DtClass_dtClassMethodSpans = dtb__231 }))))))))
  | _ -> failwith "DT: impossible branch"
))

# 451 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftInst = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtInst) -> (match mc1 with
  | { Elab_dTypes.f_DtInst_dtInstName = dtb__232; Elab_dTypes.f_DtInst_dtInstTele = dtb__233; Elab_dTypes.f_DtInst_dtInstCtx = dtb__234; Elab_dTypes.f_DtInst_dtInstHead = dtb__235; Elab_dTypes.f_DtInst_dtInstSpan = dtb__236 } -> ((Base_dCommon.v_bind ((v_shiftTele mc0) dtb__233)) (fun (tele2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftTerm mc0)) dtb__234)) (fun (ctx2 : Core_dTerm.t_Term B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__235)) (fun (head2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ Elab_dTypes.f_DtInst_dtInstName = dtb__232; Elab_dTypes.f_DtInst_dtInstTele = tele2; Elab_dTypes.f_DtInst_dtInstCtx = ctx2; Elab_dTypes.f_DtInst_dtInstHead = head2; Elab_dTypes.f_DtInst_dtInstSpan = dtb__236 }))))))))
  | _ -> failwith "DT: impossible branch"
))

# 457 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftGlobal = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__237; B_dData_dPair.f_Pair_second = dtb__238 } -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__238)) (fun (t2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__237; B_dData_dPair.f_Pair_second = t2 }))))
  | _ -> failwith "DT: impossible branch"
))

# 461 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftCachedProgram = (fun (mc0 : int) (mc1 : t_CachedProgram) -> (match mc1 with
  | { f_CachedProgram_cachedDatas = dtb__239; f_CachedProgram_cachedDefs = dtb__240; f_CachedProgram_cachedGlobals = dtb__241; f_CachedProgram_cachedInsts = dtb__242; f_CachedProgram_cachedClasses = dtb__243; f_CachedProgram_cachedOpaque = dtb__244 } -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftData mc0)) dtb__239)) (fun (datas2 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftDef mc0)) dtb__240)) (fun (defs2 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftGlobal mc0)) dtb__241)) (fun (globals2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftInst mc0)) dtb__242)) (fun (insts2 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftClass mc0)) dtb__243)) (fun (classes2 : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ f_CachedProgram_cachedDatas = datas2; f_CachedProgram_cachedDefs = defs2; f_CachedProgram_cachedGlobals = globals2; f_CachedProgram_cachedInsts = insts2; f_CachedProgram_cachedClasses = classes2; f_CachedProgram_cachedOpaque = B_dData_dList.C_List_Nil }))))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 484 "Vuna/Compiler/Driver/Cache.vuna"
let v_encGlobalPair = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__245; B_dData_dPair.f_Pair_second = dtb__246 } -> ((Base_dBytes.v_encStr dtb__245) ((Core_dCanonical.v_encTerm dtb__246) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 477 "Vuna/Compiler/Driver/Cache.vuna"
let v_encCachedProgram = (fun (cp : t_CachedProgram) (acc : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList Elab_dCanonical.v_encDtData) (cp).f_CachedProgram_cachedDatas) (((Base_dBytes.v_encList Elab_dCanonical.v_encDtDef) (cp).f_CachedProgram_cachedDefs) (((Base_dBytes.v_encList v_encGlobalPair) (cp).f_CachedProgram_cachedGlobals) (((Base_dBytes.v_encList Elab_dCanonical.v_encDtInst) (cp).f_CachedProgram_cachedInsts) (((Base_dBytes.v_encList Elab_dCanonical.v_encDtClass) (cp).f_CachedProgram_cachedClasses) (((Base_dBytes.v_encList Base_dBytes.v_encStr) (cp).f_CachedProgram_cachedOpaque) acc)))))))

# 500 "Vuna/Compiler/Driver/Cache.vuna"
let v_decGlobalPair = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (n : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Core_dCanonical.v_decTerm (fuel - 1)) b1)) (fun (t : Core_dTerm.t_Term) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = t }; B_dData_dPair.f_Pair_second = b2 })))))))

# 494 "Vuna/Compiler/Driver/Cache.vuna"
let v_decCachedProgram = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Elab_dCanonical.v_decDtData) (fuel - 1)) c)) (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Elab_dCanonical.v_decDtDef) (fuel - 1)) b1)) (fun (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decGlobalPair) (fuel - 1)) b2)) (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (b3 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Elab_dCanonical.v_decDtInst) (fuel - 1)) b3)) (fun (insts : Elab_dTypes.t_DtInst B_dData_dList.t_List) (b4 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Elab_dCanonical.v_decDtClass) (fuel - 1)) b4)) (fun (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (b5 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) b5)) (fun (names : string B_dData_dList.t_List) (b6 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { f_CachedProgram_cachedDatas = datas; f_CachedProgram_cachedDefs = defs; f_CachedProgram_cachedGlobals = globals; f_CachedProgram_cachedInsts = insts; f_CachedProgram_cachedClasses = classes; f_CachedProgram_cachedOpaque = names }; B_dData_dPair.f_Pair_second = b6 })))))))))))))))

# 488 "Vuna/Compiler/Driver/Cache.vuna"
let v_decCachedProgramComplete = (fun (s : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__247) -> (match dtb__247 with
  | { B_dData_dPair.f_Pair_first = dtb__248; B_dData_dPair.f_Pair_second = dtb__249 } -> (if (Base_dBytes.v_curAtEnd dtb__249) then (B_dData_dMaybe.C_Maybe_Just (dtb__248)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decCachedProgram (bi_strLength s)) (Base_dBytes.v_curOf s))))
