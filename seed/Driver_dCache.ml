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

# 107 "Vuna/Compiler/Driver/Cache.vuna"
let v_fixInst = (fun (mc0 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (mc1 : Elab_dTypes.t_DtInst) -> (match mc1 with
  | { Elab_dTypes.f_DtInst_dtInstName = dtb__80; Elab_dTypes.f_DtInst_dtInstSym = dtb__81; Elab_dTypes.f_DtInst_dtInstKey = dtb__82; Elab_dTypes.f_DtInst_dtInstTele = dtb__83; Elab_dTypes.f_DtInst_dtInstCtx = dtb__84; Elab_dTypes.f_DtInst_dtInstHead = dtb__85; Elab_dTypes.f_DtInst_dtInstSpan = dtb__86 } -> (let nTele = (B_dData_dList.v_length dtb__83) in { Elab_dTypes.f_DtInst_dtInstName = dtb__80; Elab_dTypes.f_DtInst_dtInstSym = dtb__81; Elab_dTypes.f_DtInst_dtInstKey = dtb__82; Elab_dTypes.f_DtInst_dtInstTele = (((v_fixTele mc0) 0) dtb__83); Elab_dTypes.f_DtInst_dtInstCtx = ((B_dData_dList.v_map ((v_fixTerm mc0) nTele)) dtb__84); Elab_dTypes.f_DtInst_dtInstHead = (((v_fixTerm mc0) nTele) dtb__85); Elab_dTypes.f_DtInst_dtInstSpan = dtb__86 })
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedOfProgramWith = (fun (tbl : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (prog : Elab_dTypes.t_DtProgram) -> { f_CachedProgram_cachedDatas = ((B_dData_dList.v_map (v_fixData tbl)) (Elab_dTypes.v_dtProgDatas prog)); f_CachedProgram_cachedDefs = ((B_dData_dList.v_map (v_fixDef tbl)) (Elab_dTypes.v_dtProgDefs prog)); f_CachedProgram_cachedGlobals = ((B_dData_dList.v_map (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = (((v_fixTerm tbl) 0) (B_dData_dPair.v_secondOf p)) })) (Elab_dTypes.v_dtProgGlobals prog)); f_CachedProgram_cachedInsts = ((B_dData_dList.v_map (v_fixInst tbl)) (Elab_dTypes.v_dtProgInsts prog)); f_CachedProgram_cachedClasses = ((B_dData_dList.v_map (v_fixClass tbl)) (Elab_dTypes.v_dtProgClasses prog)); f_CachedProgram_cachedOpaque = B_dData_dList.C_List_Nil })

# 120 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedOfProgram = (fun (prog : Elab_dTypes.t_DtProgram) -> ((v_cachedOfProgramWith (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (Elab_dTypes.v_dtProgSols prog))) prog))

# 141 "Vuna/Compiler/Driver/Cache.vuna"
let v_termValidAt = (fun (depth : int) (t : Core_dTerm.t_Term) -> (if (if ((B_dData_dList.v_length (Elab_dMeta.v_termMetasAll t)) = 0) then (B_dData_dBool.v_not ((Core_dTerm.v_hasFreeTermVar depth) t)) else false) then (B_dData_dBool.v_not (Core_dTerm.v_hasNegativeVar t)) else false))

# 145 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_ctorsValid = (fun (mc0 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__87, dtb__88) -> (if ((v_termValidAt 0) (Elab_dTypes.v_dtCtorType dtb__87)) then (v_ctorsValid dtb__88) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 150 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_fieldsValid = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__89, dtb__90) -> (if ((v_termValidAt mc0) (dtb__89).Elab_dTypes.f_DtFieldMeta_dtFieldType) then ((v_fieldsValid mc0) dtb__90) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 154 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_datasValid = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__91, dtb__92) -> (if (if (if ((v_termValidAt 0) (Elab_dTypes.v_dtDataKind dtb__91)) then (v_ctorsValid (Elab_dTypes.v_dtDataCtors dtb__91)) else false) then ((v_fieldsValid (B_dData_dList.v_length (dtb__91).Elab_dTypes.f_DtData_dtDataParams)) (Elab_dTypes.v_dtDataFields dtb__91)) else false) then (v_datasValid dtb__92) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 170 "Vuna/Compiler/Driver/Cache.vuna"
let v_bodyValid = (fun (t : Core_dTerm.t_Term) -> (if (if ((B_dData_dList.v_length (Elab_dMeta.v_termMetasRuntime t)) = 0) then (B_dData_dBool.v_not ((Core_dTerm.v_hasFreeTermVar 0) t)) else false) then (B_dData_dBool.v_not (Core_dTerm.v_hasNegativeVar t)) else false))

# 161 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_defsValid = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__93, dtb__94) -> (match (Elab_dTypes.v_dtDefBody dtb__93) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__95) -> (if (if ((v_termValidAt 0) (Elab_dTypes.v_dtDefType dtb__93)) then (v_bodyValid dtb__95) else false) then (v_defsValid dtb__94) else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((v_termValidAt 0) (Elab_dTypes.v_dtDefType dtb__93)) then (v_defsValid dtb__94) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_globalsValid = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__96, dtb__97) -> (match dtb__96 with
  | { B_dData_dPair.f_Pair_first = dtb__98; B_dData_dPair.f_Pair_second = dtb__99 } -> (if ((v_termValidAt 0) dtb__99) then (v_globalsValid dtb__97) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 177 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_teleValid = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101) -> (match dtb__100 with
  | { B_dData_dPair.f_Pair_first = dtb__102; B_dData_dPair.f_Pair_second = dtb__103 } -> (if ((v_termValidAt mc0) dtb__103) then ((v_teleValid (mc0 + 1)) dtb__101) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 181 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_termsValidAt = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__104, dtb__105) -> (if ((v_termValidAt mc0) dtb__104) then ((v_termsValidAt mc0) dtb__105) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 185 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_instsValid = (fun (mc0 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__106, dtb__107) -> (let nTele = (B_dData_dList.v_length (dtb__106).Elab_dTypes.f_DtInst_dtInstTele) in (if (if (if ((v_teleValid 0) (dtb__106).Elab_dTypes.f_DtInst_dtInstTele) then ((v_termsValidAt nTele) (dtb__106).Elab_dTypes.f_DtInst_dtInstCtx) else false) then ((v_termValidAt nTele) (dtb__106).Elab_dTypes.f_DtInst_dtInstHead) else false) then (v_instsValid dtb__107) else false))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 193 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_classesValid = (fun (mc0 : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__108, dtb__109) -> (let projs = ((B_dData_dList.v_map (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf p))) (dtb__108).Elab_dTypes.f_DtClass_dtClassMethods) in (if (if (if ((v_termsValidAt 0) projs) then ((v_termsValidAt (B_dData_dList.v_length (dtb__108).Elab_dTypes.f_DtClass_dtClassParams)) (dtb__108).Elab_dTypes.f_DtClass_dtClassSupers) else false) then ((v_termsValidAt (B_dData_dList.v_length (dtb__108).Elab_dTypes.f_DtClass_dtClassParams)) (dtb__108).Elab_dTypes.f_DtClass_dtClassFieldTys) else false) then (v_classesValid dtb__109) else false))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedProgramValid = (fun (mc0 : t_CachedProgram) -> (match mc0 with
  | { f_CachedProgram_cachedDatas = dtb__110; f_CachedProgram_cachedDefs = dtb__111; f_CachedProgram_cachedGlobals = dtb__112; f_CachedProgram_cachedInsts = dtb__113; f_CachedProgram_cachedClasses = dtb__114; f_CachedProgram_cachedOpaque = dtb__115 } -> (if (if (if (if (v_datasValid dtb__110) then (v_defsValid dtb__111) else false) then (v_globalsValid dtb__112) else false) then (v_instsValid dtb__113) else false) then (v_classesValid dtb__114) else false)
  | _ -> failwith "DT: impossible branch"
))

# 210 "Vuna/Compiler/Driver/Cache.vuna"
let v_termIssueAt = (fun (depth : int) (t : Core_dTerm.t_Term) -> (if ((B_dData_dList.v_length (Elab_dMeta.v_termMetasAll t)) > 0) then "meta" else (if (Core_dTerm.v_hasNegativeVar t) then "negative-index" else (if ((Core_dTerm.v_hasFreeTermVar depth) t) then "free-var" else ""))))

# 229 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_ctorIssues = (fun (mc0 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__116, dtb__117) -> (let issue = ((v_termIssueAt 0) (Elab_dTypes.v_dtCtorType dtb__116)) in (if (issue = "") then (v_ctorIssues dtb__117) else (String.concat "" [(Elab_dTypes.v_dtCtorName dtb__116); " ctor:"; issue])))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_fieldIssues = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__118, dtb__119) -> (let issue = ((v_termIssueAt mc0) (dtb__118).Elab_dTypes.f_DtFieldMeta_dtFieldType) in (if (issue = "") then ((v_fieldIssues mc0) dtb__119) else (String.concat "" [(dtb__118).Elab_dTypes.f_DtFieldMeta_dtFieldName; " field:"; issue])))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 218 "Vuna/Compiler/Driver/Cache.vuna"
let v_dataIssue = (fun (d : Elab_dTypes.t_DtData) -> (let kindIssue = ((v_termIssueAt 0) (Elab_dTypes.v_dtDataKind d)) in (if (kindIssue = "") then (let ctorResult = (v_ctorIssues (Elab_dTypes.v_dtDataCtors d)) in (if (ctorResult = "") then ((v_fieldIssues (B_dData_dList.v_length (d).Elab_dTypes.f_DtData_dtDataParams)) (Elab_dTypes.v_dtDataFields d)) else ctorResult)) else (String.concat "" [(Elab_dTypes.v_dtDataName d); " kind:"; kindIssue]))))

# 243 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_datasIssue = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__120, dtb__121) -> (let issue = (v_dataIssue dtb__120) in (if (issue = "") then (v_datasIssue dtb__121) else issue))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 250 "Vuna/Compiler/Driver/Cache.vuna"
let v_bodyIssueAt = (fun (t : Core_dTerm.t_Term) -> (if ((B_dData_dList.v_length (Elab_dMeta.v_termMetasRuntime t)) > 0) then "meta" else (if (Core_dTerm.v_hasNegativeVar t) then "negative-index" else (if ((Core_dTerm.v_hasFreeTermVar 0) t) then "free-var" else ""))))

# 256 "Vuna/Compiler/Driver/Cache.vuna"
let v_defIssue = (fun (d : Elab_dTypes.t_DtDef) -> (let typeIssue = ((v_termIssueAt 0) (Elab_dTypes.v_dtDefType d)) in (if (typeIssue = "") then (match (Elab_dTypes.v_dtDefBody d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__122) -> (let bodyIssue = (v_bodyIssueAt dtb__122) in (if (bodyIssue = "") then "" else (String.concat "" [(Elab_dTypes.v_dtDefName d); " body:"; bodyIssue])))
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
) else (String.concat "" [(Elab_dTypes.v_dtDefName d); " type:"; typeIssue]))))

# 270 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_defsIssue = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__123, dtb__124) -> (let issue = (v_defIssue dtb__123) in (if (issue = "") then (v_defsIssue dtb__124) else issue))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 277 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_globalsIssue = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__125, dtb__126) -> (match dtb__125 with
  | { B_dData_dPair.f_Pair_first = dtb__127; B_dData_dPair.f_Pair_second = dtb__128 } -> (let issue = ((v_termIssueAt 0) dtb__128) in (if (issue = "") then (v_globalsIssue dtb__126) else (String.concat "" [dtb__127; ":"; issue])))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 301 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_teleIssueGo = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__129, dtb__130) -> (match dtb__129 with
  | { B_dData_dPair.f_Pair_first = dtb__131; B_dData_dPair.f_Pair_second = dtb__132 } -> (let issue = ((v_termIssueAt mc0) dtb__132) in (if (issue = "") then ((v_teleIssueGo (mc0 + 1)) dtb__130) else (String.concat "" [dtb__131; ":"; issue])))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 308 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_ctxIssues = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__133, dtb__134) -> (let issue = ((v_termIssueAt mc0) dtb__133) in (if (issue = "") then ((v_ctxIssues mc0) dtb__134) else issue))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 284 "Vuna/Compiler/Driver/Cache.vuna"
let v_instIssue = (fun (i : Elab_dTypes.t_DtInst) -> (let nTele = (B_dData_dList.v_length (i).Elab_dTypes.f_DtInst_dtInstTele) in (let teleIssue = ((v_teleIssueGo 0) (i).Elab_dTypes.f_DtInst_dtInstTele) in (if (teleIssue <> "") then (String.concat "" [(Elab_dTypes.v_dtInstName i); " tele:"; teleIssue]) else (let ctxIssue = ((v_ctxIssues nTele) (i).Elab_dTypes.f_DtInst_dtInstCtx) in (if (ctxIssue <> "") then (String.concat "" [(Elab_dTypes.v_dtInstName i); " ctx:"; ctxIssue]) else (let headIssue = ((v_termIssueAt nTele) (i).Elab_dTypes.f_DtInst_dtInstHead) in (if (headIssue = "") then "" else (String.concat "" [(Elab_dTypes.v_dtInstName i); " head:"; headIssue])))))))))

# 315 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_instsIssue = (fun (mc0 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__135, dtb__136) -> (let issue = (v_instIssue dtb__135) in (if (issue = "") then (v_instsIssue dtb__136) else issue))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 322 "Vuna/Compiler/Driver/Cache.vuna"
let v_classIssue = (fun (c : Elab_dTypes.t_DtClass) -> (let projIssue = ((v_ctxIssues 0) ((B_dData_dList.v_map (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf p))) (c).Elab_dTypes.f_DtClass_dtClassMethods)) in (if (projIssue <> "") then (String.concat "" [(Elab_dTypes.v_dtClassName c); " proj:"; projIssue]) else (let superIssue = ((v_ctxIssues (B_dData_dList.v_length (c).Elab_dTypes.f_DtClass_dtClassParams)) (c).Elab_dTypes.f_DtClass_dtClassSupers) in (if (superIssue <> "") then (String.concat "" [(Elab_dTypes.v_dtClassName c); " super:"; superIssue]) else (let fieldIssue = ((v_ctxIssues (B_dData_dList.v_length (c).Elab_dTypes.f_DtClass_dtClassParams)) (c).Elab_dTypes.f_DtClass_dtClassFieldTys) in (if (fieldIssue = "") then "" else (String.concat "" [(Elab_dTypes.v_dtClassName c); " field:"; fieldIssue]))))))))

# 338 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_classesIssue = (fun (mc0 : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__137, dtb__138) -> (let issue = (v_classIssue dtb__137) in (if (issue = "") then (v_classesIssue dtb__138) else issue))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 345 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedProgramIssue = (fun (mc0 : t_CachedProgram) -> (match mc0 with
  | { f_CachedProgram_cachedDatas = dtb__139; f_CachedProgram_cachedDefs = dtb__140; f_CachedProgram_cachedGlobals = dtb__141; f_CachedProgram_cachedInsts = dtb__142; f_CachedProgram_cachedClasses = dtb__143; f_CachedProgram_cachedOpaque = dtb__144 } -> (let datasI = (v_datasIssue dtb__139) in (let defsI = (v_defsIssue dtb__140) in (let globalsI = (v_globalsIssue dtb__141) in (let instsI = (v_instsIssue dtb__142) in (let classesI = (v_classesIssue dtb__143) in (if (datasI <> "") then ("datas " ^ datasI) else (if (defsI <> "") then ("defs " ^ defsI) else (if (globalsI <> "") then ("globals " ^ globalsI) else (if (instsI <> "") then ("insts " ^ instsI) else (if (classesI <> "") then ("classes " ^ classesI) else ""))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 371 "Vuna/Compiler/Driver/Cache.vuna"
let v_summaryMetaSegment = 1073741824

# 385 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_shiftTermFuel = (fun (fuel : int) (off : int) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "meta-shift") else (match t with
  | Core_dTerm.C_Term_TVar (dtb__145, dtb__146, dtb__147) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TVar (dtb__145, dtb__146, dtb__147))))
  | Core_dTerm.C_Term_TMeta (dtb__148) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TMeta ((dtb__148 + off)))))
  | Core_dTerm.C_Term_TGlobal (dtb__149) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TGlobal (dtb__149))))
  | Core_dTerm.C_Term_TType (dtb__150) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TType (dtb__150))))
  | Core_dTerm.C_Term_TPi (dtb__151, dtb__152, dtb__153, dtb__154, dtb__155) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__154)) (fun (d2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__155)) (fun (c2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TPi (dtb__151, dtb__152, dtb__153, d2, c2))))))))
  | Core_dTerm.C_Term_TLam (dtb__156, dtb__157, dtb__158, dtb__159, dtb__160) -> ((Base_dCommon.v_bind (((v_shiftLamTyFuel (fuel - 1)) off) dtb__158)) (fun (slot2 : (Core_dTerm.t_LamMark, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__160)) (fun (b2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TLam (dtb__156, dtb__157, slot2, dtb__159, b2))))))))
  | Core_dTerm.C_Term_TApp (dtb__161, dtb__162, dtb__163) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__161)) (fun (f2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__162)) (fun (a2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TApp (f2, a2, dtb__163))))))))
  | Core_dTerm.C_Term_TCon (dtb__164, dtb__165) -> ((Base_dCommon.v_bind (((v_shiftArgs (fuel - 1)) off) dtb__165)) (fun (args2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TCon (dtb__164, args2))))))
  | Core_dTerm.C_Term_TMk (dtb__166, dtb__167) -> ((Base_dCommon.v_bind (((v_shiftArgs (fuel - 1)) off) dtb__167)) (fun (args2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TMk (dtb__166, args2))))))
  | Core_dTerm.C_Term_TRecord (dtb__168, dtb__169) -> ((Base_dCommon.v_bind (((v_shiftArgs (fuel - 1)) off) dtb__169)) (fun (args2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TRecord (dtb__168, args2))))))
  | Core_dTerm.C_Term_TCase (dtb__170, dtb__171) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__170)) (fun (s2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftAlts (fuel - 1)) off) dtb__171)) (fun (alts2 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TCase (s2, alts2))))))))
  | Core_dTerm.C_Term_TProj (dtb__172, dtb__173, dtb__174, dtb__175, dtb__176) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__172)) (fun (base2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TProj (base2, dtb__173, dtb__174, dtb__175, dtb__176))))))
  | Core_dTerm.C_Term_TRecUpd (dtb__177, dtb__178, dtb__179, dtb__180, dtb__181) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__177)) (fun (base2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__181)) (fun (body2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TRecUpd (base2, dtb__178, dtb__179, dtb__180, body2))))))))
  | Core_dTerm.C_Term_TInt (dtb__182) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TInt (dtb__182))))
  | Core_dTerm.C_Term_TStr (dtb__183) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TStr (dtb__183))))
  | Core_dTerm.C_Term_TBool (dtb__184) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TBool (dtb__184))))
  | Core_dTerm.C_Term_TIf (dtb__185, dtb__186, dtb__187) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__185)) (fun (c2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__186)) (fun (th2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftTermFuel (fuel - 1)) off) dtb__187)) (fun (el2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TIf (c2, th2, el2))))))))))
  | Core_dTerm.C_Term_TFloat (dtb__188) -> (Base_dDiag.C_Check_OkC ((Core_dTerm.C_Term_TFloat (dtb__188))))
  | _ -> failwith "DT: impossible branch"
)))
# 411 "Vuna/Compiler/Driver/Cache.vuna"
and v_shiftLamTyFuel = (fun (mc0 : int) (mc1 : int) (mc2 : (Core_dTerm.t_LamMark, (Core_dTerm.t_Term B_dData_dMaybe.t_Maybe, Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__189) -> (let tys = (B_dData_dPair.v_secondOf dtb__189) in ((Base_dCommon.v_bind (((v_shiftTermMaybeFuel mc0) mc1) (B_dData_dPair.v_firstOf tys))) (fun (b : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind (((v_shiftTermMaybeFuel mc0) mc1) (B_dData_dPair.v_secondOf tys))) (fun (r : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__189); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = b; B_dData_dPair.f_Pair_second = r } })))))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 421 "Vuna/Compiler/Driver/Cache.vuna"
and v_shiftTermMaybeFuel = (fun (mc0 : int) (mc1 : int) (mc2 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__190) -> ((Base_dCommon.v_bind (((v_shiftTermFuel mc0) mc1) dtb__190)) (fun (t2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (t2))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 427 "Vuna/Compiler/Driver/Cache.vuna"
and v_shiftArgs = (fun (mc0 : int) (mc1 : int) (mc2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__191, dtb__192) -> (match dtb__191 with
  | { B_dData_dPair.f_Pair_first = dtb__193; B_dData_dPair.f_Pair_second = dtb__194 } -> ((Base_dCommon.v_bind (((v_shiftTermFuel mc0) mc1) dtb__193)) (fun (a2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftArgs mc0) mc1) dtb__192)) (fun (rest2 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = a2; B_dData_dPair.f_Pair_second = dtb__194 }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 434 "Vuna/Compiler/Driver/Cache.vuna"
and v_shiftAlts = (fun (mc0 : int) (mc1 : int) (mc2 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__195, dtb__196) -> (match dtb__195 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__197; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__198; Core_dTerm.f_CaseAlt_caseAltBody = dtb__199 } -> ((Base_dCommon.v_bind (((v_shiftTermFuel mc0) mc1) dtb__199)) (fun (b2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind (((v_shiftAlts mc0) mc1) dtb__196)) (fun (rest2 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Core_dTerm.f_CaseAlt_caseAltName = dtb__197; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__198; Core_dTerm.f_CaseAlt_caseAltBody = b2 }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftTerm = (fun (off : int) (t : Core_dTerm.t_Term) -> (((v_shiftTermFuel ((Core_dTerm.v_termSize t) + 16)) off) t))

# 441 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftDef = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtDef) -> (match mc1 with
  | Elab_dTypes.C_DtDef_DtExtern (dtb__200, dtb__201, dtb__202, dtb__203) -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__201)) (fun (ty2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Elab_dTypes.C_DtDef_DtExtern (dtb__200, ty2, dtb__202, dtb__203))))))
  | Elab_dTypes.C_DtDef_DtAxiom (dtb__204, dtb__205, dtb__206) -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__205)) (fun (ty2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Elab_dTypes.C_DtDef_DtAxiom (dtb__204, ty2, dtb__206))))))
  | Elab_dTypes.C_DtDef_DtDef (dtb__207, dtb__208, dtb__209, dtb__210) -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__208)) (fun (ty2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__209)) (fun (body2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ((Elab_dTypes.C_DtDef_DtDef (dtb__207, ty2, body2, dtb__210))))))))
  | _ -> failwith "DT: impossible branch"
))

# 451 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftCtor = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtCtor) -> (match mc1 with
  | { Elab_dTypes.f_DtCtor_dtCtorName = dtb__211; Elab_dTypes.f_DtCtor_dtCtorFamily = dtb__212; Elab_dTypes.f_DtCtor_dtCtorTelescope = dtb__213; Elab_dTypes.f_DtCtor_dtCtorType = dtb__214; Elab_dTypes.f_DtCtor_dtCtorSpan = dtb__215 } -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__214)) (fun (ty2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ Elab_dTypes.f_DtCtor_dtCtorName = dtb__211; Elab_dTypes.f_DtCtor_dtCtorFamily = dtb__212; Elab_dTypes.f_DtCtor_dtCtorTelescope = dtb__213; Elab_dTypes.f_DtCtor_dtCtorType = ty2; Elab_dTypes.f_DtCtor_dtCtorSpan = dtb__215 }))))
  | _ -> failwith "DT: impossible branch"
))

# 455 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftFieldMeta = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtFieldMeta) -> (match mc1 with
  | { Elab_dTypes.f_DtFieldMeta_dtFieldName = dtb__216; Elab_dTypes.f_DtFieldMeta_dtFieldIndex = dtb__217; Elab_dTypes.f_DtFieldMeta_dtFieldType = dtb__218 } -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__218)) (fun (fty2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ Elab_dTypes.f_DtFieldMeta_dtFieldName = dtb__216; Elab_dTypes.f_DtFieldMeta_dtFieldIndex = dtb__217; Elab_dTypes.f_DtFieldMeta_dtFieldType = fty2 }))))
  | _ -> failwith "DT: impossible branch"
))

# 459 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftData = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtData) -> (match mc1 with
  | { Elab_dTypes.f_DtData_dtDataName = dtb__219; Elab_dTypes.f_DtData_dtDataParams = dtb__220; Elab_dTypes.f_DtData_dtDataCtors = dtb__221; Elab_dTypes.f_DtData_dtDataKind = dtb__222; Elab_dTypes.f_DtData_dtDataViaClasses = dtb__223; Elab_dTypes.f_DtData_dtDataLinear = dtb__224; Elab_dTypes.f_DtData_dtDataRepr = dtb__225; Elab_dTypes.f_DtData_dtDataFields = dtb__226; Elab_dTypes.f_DtData_dtDataIsRecord = dtb__227 } -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftCtor mc0)) dtb__221)) (fun (ctors2 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__222)) (fun (kind2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftFieldMeta mc0)) dtb__226)) (fun (fields2 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ Elab_dTypes.f_DtData_dtDataName = dtb__219; Elab_dTypes.f_DtData_dtDataParams = dtb__220; Elab_dTypes.f_DtData_dtDataCtors = ctors2; Elab_dTypes.f_DtData_dtDataKind = kind2; Elab_dTypes.f_DtData_dtDataViaClasses = dtb__223; Elab_dTypes.f_DtData_dtDataLinear = dtb__224; Elab_dTypes.f_DtData_dtDataRepr = dtb__225; Elab_dTypes.f_DtData_dtDataFields = fields2; Elab_dTypes.f_DtData_dtDataIsRecord = dtb__227 }))))))))
  | _ -> failwith "DT: impossible branch"
))

# 465 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_shiftTele = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__228, dtb__229) -> (match dtb__228 with
  | { B_dData_dPair.f_Pair_first = dtb__230; B_dData_dPair.f_Pair_second = dtb__231 } -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__231)) (fun (t2 : Core_dTerm.t_Term) -> ((Base_dCommon.v_bind ((v_shiftTele mc0) dtb__229)) (fun (rest2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__230; B_dData_dPair.f_Pair_second = t2 }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 472 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftClass = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtClass) -> (match mc1 with
  | { Elab_dTypes.f_DtClass_dtClassName = dtb__232; Elab_dTypes.f_DtClass_dtClassParams = dtb__233; Elab_dTypes.f_DtClass_dtClassSupers = dtb__234; Elab_dTypes.f_DtClass_dtClassMethods = dtb__235; Elab_dTypes.f_DtClass_dtClassFieldTys = dtb__236; Elab_dTypes.f_DtClass_dtClassMethodSpans = dtb__237 } -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftTerm mc0)) dtb__234)) (fun (supers2 : Core_dTerm.t_Term B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_shiftTele mc0) dtb__235)) (fun (projs2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftTerm mc0)) dtb__236)) (fun (tys2 : Core_dTerm.t_Term B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ Elab_dTypes.f_DtClass_dtClassName = dtb__232; Elab_dTypes.f_DtClass_dtClassParams = dtb__233; Elab_dTypes.f_DtClass_dtClassSupers = supers2; Elab_dTypes.f_DtClass_dtClassMethods = projs2; Elab_dTypes.f_DtClass_dtClassFieldTys = tys2; Elab_dTypes.f_DtClass_dtClassMethodSpans = dtb__237 }))))))))
  | _ -> failwith "DT: impossible branch"
))

# 478 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftInst = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtInst) -> (match mc1 with
  | { Elab_dTypes.f_DtInst_dtInstName = dtb__238; Elab_dTypes.f_DtInst_dtInstSym = dtb__239; Elab_dTypes.f_DtInst_dtInstKey = dtb__240; Elab_dTypes.f_DtInst_dtInstTele = dtb__241; Elab_dTypes.f_DtInst_dtInstCtx = dtb__242; Elab_dTypes.f_DtInst_dtInstHead = dtb__243; Elab_dTypes.f_DtInst_dtInstSpan = dtb__244 } -> ((Base_dCommon.v_bind ((v_shiftTele mc0) dtb__241)) (fun (tele2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftTerm mc0)) dtb__242)) (fun (ctx2 : Core_dTerm.t_Term B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__243)) (fun (head2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ Elab_dTypes.f_DtInst_dtInstName = dtb__238; Elab_dTypes.f_DtInst_dtInstSym = dtb__239; Elab_dTypes.f_DtInst_dtInstKey = dtb__240; Elab_dTypes.f_DtInst_dtInstTele = tele2; Elab_dTypes.f_DtInst_dtInstCtx = ctx2; Elab_dTypes.f_DtInst_dtInstHead = head2; Elab_dTypes.f_DtInst_dtInstSpan = dtb__244 }))))))))
  | _ -> failwith "DT: impossible branch"
))

# 484 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftGlobal = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__245; B_dData_dPair.f_Pair_second = dtb__246 } -> ((Base_dCommon.v_bind ((v_shiftTerm mc0) dtb__246)) (fun (t2 : Core_dTerm.t_Term) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__245; B_dData_dPair.f_Pair_second = t2 }))))
  | _ -> failwith "DT: impossible branch"
))

# 487 "Vuna/Compiler/Driver/Cache.vuna"
let v_shiftCachedProgram = (fun (mc0 : int) (mc1 : t_CachedProgram) -> (match mc1 with
  | { f_CachedProgram_cachedDatas = dtb__247; f_CachedProgram_cachedDefs = dtb__248; f_CachedProgram_cachedGlobals = dtb__249; f_CachedProgram_cachedInsts = dtb__250; f_CachedProgram_cachedClasses = dtb__251; f_CachedProgram_cachedOpaque = dtb__252 } -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftData mc0)) dtb__247)) (fun (datas2 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftDef mc0)) dtb__248)) (fun (defs2 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftGlobal mc0)) dtb__249)) (fun (globals2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftInst mc0)) dtb__250)) (fun (insts2 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (v_shiftClass mc0)) dtb__251)) (fun (classes2 : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ f_CachedProgram_cachedDatas = datas2; f_CachedProgram_cachedDefs = defs2; f_CachedProgram_cachedGlobals = globals2; f_CachedProgram_cachedInsts = insts2; f_CachedProgram_cachedClasses = classes2; f_CachedProgram_cachedOpaque = B_dData_dList.C_List_Nil }))))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 510 "Vuna/Compiler/Driver/Cache.vuna"
let v_encGlobalPair = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__253; B_dData_dPair.f_Pair_second = dtb__254 } -> ((Base_dBytes.v_encStr dtb__253) ((Core_dCanonical.v_encTerm dtb__254) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 503 "Vuna/Compiler/Driver/Cache.vuna"
let v_encCachedProgram = (fun (cp : t_CachedProgram) (acc : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList Elab_dCanonical.v_encDtData) (cp).f_CachedProgram_cachedDatas) (((Base_dBytes.v_encList Elab_dCanonical.v_encDtDef) (cp).f_CachedProgram_cachedDefs) (((Base_dBytes.v_encList v_encGlobalPair) (cp).f_CachedProgram_cachedGlobals) (((Base_dBytes.v_encList Elab_dCanonical.v_encDtInst) (cp).f_CachedProgram_cachedInsts) (((Base_dBytes.v_encList Elab_dCanonical.v_encDtClass) (cp).f_CachedProgram_cachedClasses) (((Base_dBytes.v_encList Base_dBytes.v_encStr) (cp).f_CachedProgram_cachedOpaque) acc)))))))

# 526 "Vuna/Compiler/Driver/Cache.vuna"
let v_decGlobalPair = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Base_dBytes.v_decStr (fuel - 1)) c)) (fun (n : string) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair ((Core_dCanonical.v_decTerm (fuel - 1)) b1)) (fun (t : Core_dTerm.t_Term) (b2 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = t }; B_dData_dPair.f_Pair_second = b2 })))))))

# 520 "Vuna/Compiler/Driver/Cache.vuna"
let v_decCachedProgram = (fun (fuel : int) (c : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Elab_dCanonical.v_decDtData) (fuel - 1)) c)) (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (b1 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Elab_dCanonical.v_decDtDef) (fuel - 1)) b1)) (fun (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (b2 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList v_decGlobalPair) (fuel - 1)) b2)) (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (b3 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Elab_dCanonical.v_decDtInst) (fuel - 1)) b3)) (fun (insts : Elab_dTypes.t_DtInst B_dData_dList.t_List) (b4 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Elab_dCanonical.v_decDtClass) (fuel - 1)) b4)) (fun (classes : Elab_dTypes.t_DtClass B_dData_dList.t_List) (b5 : Base_dBytes.t_Cur) -> ((Base_dBytes.v_thenPair (((Base_dBytes.v_decList Base_dBytes.v_decStr) (fuel - 1)) b5)) (fun (names : string B_dData_dList.t_List) (b6 : Base_dBytes.t_Cur) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { f_CachedProgram_cachedDatas = datas; f_CachedProgram_cachedDefs = defs; f_CachedProgram_cachedGlobals = globals; f_CachedProgram_cachedInsts = insts; f_CachedProgram_cachedClasses = classes; f_CachedProgram_cachedOpaque = names }; B_dData_dPair.f_Pair_second = b6 })))))))))))))))

# 514 "Vuna/Compiler/Driver/Cache.vuna"
let v_decCachedProgramComplete = (fun (s : string) -> (let nd_uscrut1 = ((v_decCachedProgram (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__255) -> (match dtb__255 with
  | { B_dData_dPair.f_Pair_first = dtb__256; B_dData_dPair.f_Pair_second = dtb__257 } -> (if (Base_dBytes.v_curAtEnd dtb__257) then (B_dData_dMaybe.C_Maybe_Just (dtb__256)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 34 "Vuna/Compiler/Driver/Cache.vuna"
let v_cachedOpaque = (fun (p : t_CachedProgram) -> (p).f_CachedProgram_cachedOpaque)
