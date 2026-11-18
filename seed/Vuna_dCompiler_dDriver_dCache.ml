open Vuna_runtime
type t_Vuna_dCompiler_dDriver_dCache_dCachedProgram = { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtClass Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedOpaque : string Base_dData_dList.t_Base_dData_dList_dList }

# 37 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dcachedDatas = (fun (mc0 : t_Vuna_dCompiler_dDriver_dCache_dCachedProgram) -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = dtb__0; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = dtb__1; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = dtb__2; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = dtb__3; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = dtb__4; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedOpaque = dtb__5 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dcachedDefs = (fun (mc0 : t_Vuna_dCompiler_dDriver_dCache_dCachedProgram) -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = dtb__6; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = dtb__7; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = dtb__8; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = dtb__9; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = dtb__10; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedOpaque = dtb__11 } -> dtb__7
  | _ -> failwith "DT: impossible branch"
))

# 43 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dcachedGlobals = (fun (mc0 : t_Vuna_dCompiler_dDriver_dCache_dCachedProgram) -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = dtb__12; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = dtb__13; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = dtb__14; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = dtb__15; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = dtb__16; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedOpaque = dtb__17 } -> dtb__14
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dcachedInsts = (fun (mc0 : t_Vuna_dCompiler_dDriver_dCache_dCachedProgram) -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = dtb__18; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = dtb__19; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = dtb__20; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = dtb__21; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = dtb__22; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedOpaque = dtb__23 } -> dtb__21
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dcachedClasses = (fun (mc0 : t_Vuna_dCompiler_dDriver_dCache_dCachedProgram) -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = dtb__24; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = dtb__25; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = dtb__26; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = dtb__27; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = dtb__28; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedOpaque = dtb__29 } -> dtb__28
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dcachedOpaqueOf = (fun (mc0 : t_Vuna_dCompiler_dDriver_dCache_dCachedProgram) -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = dtb__30; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = dtb__31; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = dtb__32; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = dtb__33; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = dtb__34; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedOpaque = dtb__35 } -> dtb__35
  | _ -> failwith "DT: impossible branch"
))

# 55 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dwithCachedOpaque = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : t_Vuna_dCompiler_dDriver_dCache_dCachedProgram) -> (match mc1 with
  | { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = dtb__36; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = dtb__37; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = dtb__38; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = dtb__39; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = dtb__40; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedOpaque = dtb__41 } -> { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = dtb__36; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = dtb__37; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = dtb__38; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = dtb__39; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = dtb__40; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedOpaque = mc0 }
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dfixTerm = (fun tbl depth t -> (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl tbl) depth) t))

# 65 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dfixDef = (fun (mc0 : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef) -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__42, dtb__43, dtb__44, dtb__45) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__42, (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__43), dtb__44, dtb__45))
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__46, dtb__47, dtb__48) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__46, (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__47), dtb__48))
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__49, dtb__50, dtb__51, dtb__52) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__49, (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__50), (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__51), dtb__52))
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dfixCtor = (fun (mc0 : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = dtb__53; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = dtb__54; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = dtb__55; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = dtb__56; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan = dtb__57 } -> { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = dtb__53; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = dtb__54; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = dtb__55; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__56); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan = dtb__57 }
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dfixFieldMeta = (fun (mc0 : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta) -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName = dtb__58; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex = dtb__59; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldType = dtb__60 } -> { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName = dtb__58; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex = dtb__59; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldType = (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__60) }
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dfixData = (fun (mc0 : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__61; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__62; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__63; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__64; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__65; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__66; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__67; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__68; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__69 } -> { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__61; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__62; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixCtor mc0)) dtb__63); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__64); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__65; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__66; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__67; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixFieldMeta mc0)) dtb__68); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__69 }
  | _ -> failwith "DT: impossible branch"
))

# 93 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dfixClass = (fun (mc0 : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtClass) -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassName = dtb__70; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams = dtb__71; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassSupers = dtb__72; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods = dtb__73; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys = dtb__74; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethodSpans = dtb__75 } -> { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassName = dtb__70; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams = dtb__71; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassSupers = ((Base_dData_dList.v_Base_dData_dList_dmap ((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) (Base_dData_dList.v_Base_dData_dList_dlength dtb__71))) dtb__72); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods = ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) })) dtb__73); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys = ((Base_dData_dList.v_Base_dData_dList_dmap ((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) (Base_dData_dList.v_Base_dData_dList_dlength dtb__71))) dtb__74); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethodSpans = dtb__75 }
  | _ -> failwith "DT: impossible branch"
))

# 104 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_Vuna_dCompiler_dDriver_dCache_dfixTele = (fun (mc0 : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : int) (mc2 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__76, dtb__77) -> (match dtb__76 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__78; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__79 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__78; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) mc1) dtb__79) }, (((v_Vuna_dCompiler_dDriver_dCache_dfixTele mc0) (mc1 + 1)) dtb__77)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 109 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dfixInst = (fun (mc0 : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst) -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstName = dtb__80; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele = dtb__81; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx = dtb__82; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead = dtb__83; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan = dtb__84 } -> ((fun nTele -> { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstName = dtb__80; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele = (((v_Vuna_dCompiler_dDriver_dCache_dfixTele mc0) 0) dtb__81); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx = ((Base_dData_dList.v_Base_dData_dList_dmap ((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) nTele)) dtb__82); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead = (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) nTele) dtb__83); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan = dtb__84 }) (Base_dData_dList.v_Base_dData_dList_dlength dtb__81))
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgramWith = (fun tbl prog -> { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixData tbl)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)); f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixDef tbl)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog)); f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm tbl) 0) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) })) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog)); f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixInst tbl)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog)); f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixClass tbl)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog)); f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedOpaque = Base_dData_dList.C_Base_dData_dList_dList_Nil })

# 115 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgram = (fun prog -> ((v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgramWith ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dInt.v_Hashable_uInt) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog))) prog))

# 136 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dtermValidAt = (fun depth t -> (if (if ((Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll t)) = 0) then (Base_dData_dBool.v_Base_dData_dBool_dnot ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar depth) t)) else false) then (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar t)) else false))

# 140 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_Vuna_dCompiler_dDriver_dCache_dctorsValid = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__85, dtb__86) -> (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__85)) then (v_Vuna_dCompiler_dDriver_dCache_dctorsValid dtb__86) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_Vuna_dCompiler_dDriver_dCache_ddatasValid = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__87, dtb__88) -> (if (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataKind dtb__87)) then (v_Vuna_dCompiler_dDriver_dCache_dctorsValid (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__87)) else false) then (v_Vuna_dCompiler_dDriver_dCache_ddatasValid dtb__88) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 158 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dbodyValid = (fun t -> (if (if ((Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime t)) = 0) then (Base_dData_dBool.v_Base_dData_dBool_dnot ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) t)) else false) then (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar t)) else false))

# 149 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_Vuna_dCompiler_dDriver_dCache_ddefsValid = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__89, dtb__90) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__89) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__91) -> (if (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__89)) then (v_Vuna_dCompiler_dDriver_dCache_dbodyValid dtb__91) else false) then (v_Vuna_dCompiler_dDriver_dCache_ddefsValid dtb__90) else false)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__89)) then (v_Vuna_dCompiler_dDriver_dCache_ddefsValid dtb__90) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 161 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_Vuna_dCompiler_dDriver_dCache_dglobalsValid = (fun (mc0 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__92, dtb__93) -> (match dtb__92 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__94; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__95 } -> (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt 0) dtb__95) then (v_Vuna_dCompiler_dDriver_dCache_dglobalsValid dtb__93) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 165 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_Vuna_dCompiler_dDriver_dCache_dteleValid = (fun (mc0 : int) (mc1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__96, dtb__97) -> (match dtb__96 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__98; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__99 } -> (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt mc0) dtb__99) then ((v_Vuna_dCompiler_dDriver_dCache_dteleValid (mc0 + 1)) dtb__97) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 169 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_Vuna_dCompiler_dDriver_dCache_dtermsValidAt = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__100, dtb__101) -> (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt mc0) dtb__100) then ((v_Vuna_dCompiler_dDriver_dCache_dtermsValidAt mc0) dtb__101) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_Vuna_dCompiler_dDriver_dCache_dinstsValid = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__102, dtb__103) -> ((fun nTele -> (if (if (if ((v_Vuna_dCompiler_dDriver_dCache_dteleValid 0) (dtb__102).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele) then ((v_Vuna_dCompiler_dDriver_dCache_dtermsValidAt nTele) (dtb__102).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx) else false) then ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt nTele) (dtb__102).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead) else false) then (v_Vuna_dCompiler_dDriver_dCache_dinstsValid dtb__103) else false)) (Base_dData_dList.v_Base_dData_dList_dlength (dtb__102).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 181 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_Vuna_dCompiler_dDriver_dCache_dclassesValid = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtClass Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__104, dtb__105) -> ((fun projs -> (if (if (if ((v_Vuna_dCompiler_dDriver_dCache_dtermsValidAt 0) projs) then ((v_Vuna_dCompiler_dDriver_dCache_dtermsValidAt (Base_dData_dList.v_Base_dData_dList_dlength (dtb__104).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams)) (dtb__104).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassSupers) else false) then ((v_Vuna_dCompiler_dDriver_dCache_dtermsValidAt (Base_dData_dList.v_Base_dData_dList_dlength (dtb__104).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams)) (dtb__104).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys) else false) then (v_Vuna_dCompiler_dDriver_dCache_dclassesValid dtb__105) else false)) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))) (dtb__104).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dcachedProgramValid = (fun (mc0 : t_Vuna_dCompiler_dDriver_dCache_dCachedProgram) -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = dtb__106; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = dtb__107; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = dtb__108; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = dtb__109; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = dtb__110; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedOpaque = dtb__111 } -> (if (if (if (if (v_Vuna_dCompiler_dDriver_dCache_ddatasValid dtb__106) then (v_Vuna_dCompiler_dDriver_dCache_ddefsValid dtb__107) else false) then (v_Vuna_dCompiler_dDriver_dCache_dglobalsValid dtb__108) else false) then (v_Vuna_dCompiler_dDriver_dCache_dinstsValid dtb__109) else false) then (v_Vuna_dCompiler_dDriver_dCache_dclassesValid dtb__110) else false)
  | _ -> failwith "DT: impossible branch"
))

# 198 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt = (fun depth t -> (if ((Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll t)) > 0) then "meta" else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar t) then "negative-index" else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar depth) t) then "free-var" else ""))))

# 212 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_Vuna_dCompiler_dDriver_dCache_dctorIssues = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__112, dtb__113) -> ((fun issue -> (if (issue = "") then (v_Vuna_dCompiler_dDriver_dCache_dctorIssues dtb__113) else (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__112); " ctor:"; issue]))) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__112)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 206 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_ddataIssue = (fun d -> ((fun kindIssue -> (if (kindIssue = "") then (v_Vuna_dCompiler_dDriver_dCache_dctorIssues (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)) else (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); " kind:"; kindIssue]))) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataKind d))))

# 219 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_Vuna_dCompiler_dDriver_dCache_ddatasIssue = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__114, dtb__115) -> ((fun issue -> (if (issue = "") then (v_Vuna_dCompiler_dDriver_dCache_ddatasIssue dtb__115) else issue)) (v_Vuna_dCompiler_dDriver_dCache_ddataIssue dtb__114))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 226 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dbodyIssueAt = (fun t -> (if ((Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime t)) > 0) then "meta" else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar t) then "negative-index" else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) t) then "free-var" else ""))))

# 232 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_ddefIssue = (fun d -> ((fun typeIssue -> (if (typeIssue = "") then (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__116) -> ((fun bodyIssue -> (if (bodyIssue = "") then "" else (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); " body:"; bodyIssue]))) (v_Vuna_dCompiler_dDriver_dCache_dbodyIssueAt dtb__116))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
) else (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); " type:"; typeIssue]))) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d))))

# 246 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_Vuna_dCompiler_dDriver_dCache_ddefsIssue = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__117, dtb__118) -> ((fun issue -> (if (issue = "") then (v_Vuna_dCompiler_dDriver_dCache_ddefsIssue dtb__118) else issue)) (v_Vuna_dCompiler_dDriver_dCache_ddefIssue dtb__117))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 253 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_Vuna_dCompiler_dDriver_dCache_dglobalsIssue = (fun (mc0 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__119, dtb__120) -> (match dtb__119 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__121; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__122 } -> ((fun issue -> (if (issue = "") then (v_Vuna_dCompiler_dDriver_dCache_dglobalsIssue dtb__120) else (String.concat "" [dtb__121; ":"; issue]))) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt 0) dtb__122))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 277 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_Vuna_dCompiler_dDriver_dCache_dteleIssueGo = (fun (mc0 : int) (mc1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__123, dtb__124) -> (match dtb__123 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__125; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__126 } -> ((fun issue -> (if (issue = "") then ((v_Vuna_dCompiler_dDriver_dCache_dteleIssueGo (mc0 + 1)) dtb__124) else (String.concat "" [dtb__125; ":"; issue]))) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt mc0) dtb__126))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 284 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_Vuna_dCompiler_dDriver_dCache_dctxIssues = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__127, dtb__128) -> ((fun issue -> (if (issue = "") then ((v_Vuna_dCompiler_dDriver_dCache_dctxIssues mc0) dtb__128) else issue)) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt mc0) dtb__127))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 260 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dinstIssue = (fun i -> ((fun nTele -> ((fun teleIssue -> (if (teleIssue <> "") then (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i); " tele:"; teleIssue]) else ((fun ctxIssue -> (if (ctxIssue <> "") then (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i); " ctx:"; ctxIssue]) else ((fun headIssue -> (if (headIssue = "") then "" else (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i); " head:"; headIssue]))) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt nTele) (i).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead)))) ((v_Vuna_dCompiler_dDriver_dCache_dctxIssues nTele) (i).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx)))) ((v_Vuna_dCompiler_dDriver_dCache_dteleIssueGo 0) (i).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele))) (Base_dData_dList.v_Base_dData_dList_dlength (i).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele)))

# 291 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_Vuna_dCompiler_dDriver_dCache_dinstsIssue = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__129, dtb__130) -> ((fun issue -> (if (issue = "") then (v_Vuna_dCompiler_dDriver_dCache_dinstsIssue dtb__130) else issue)) (v_Vuna_dCompiler_dDriver_dCache_dinstIssue dtb__129))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 298 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dclassIssue = (fun c -> ((fun projIssue -> (if (projIssue <> "") then (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName c); " proj:"; projIssue]) else ((fun superIssue -> (if (superIssue <> "") then (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName c); " super:"; superIssue]) else ((fun fieldIssue -> (if (fieldIssue = "") then "" else (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName c); " field:"; fieldIssue]))) ((v_Vuna_dCompiler_dDriver_dCache_dctxIssues (Base_dData_dList.v_Base_dData_dList_dlength (c).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams)) (c).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys)))) ((v_Vuna_dCompiler_dDriver_dCache_dctxIssues (Base_dData_dList.v_Base_dData_dList_dlength (c).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams)) (c).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassSupers)))) ((v_Vuna_dCompiler_dDriver_dCache_dctxIssues 0) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))) (c).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods))))

# 314 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_Vuna_dCompiler_dDriver_dCache_dclassesIssue = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtClass Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__131, dtb__132) -> ((fun issue -> (if (issue = "") then (v_Vuna_dCompiler_dDriver_dCache_dclassesIssue dtb__132) else issue)) (v_Vuna_dCompiler_dDriver_dCache_dclassIssue dtb__131))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 321 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dcachedProgramIssue = (fun (mc0 : t_Vuna_dCompiler_dDriver_dCache_dCachedProgram) -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = dtb__133; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = dtb__134; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = dtb__135; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = dtb__136; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = dtb__137; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedOpaque = dtb__138 } -> ((fun datasI -> ((fun defsI -> ((fun globalsI -> ((fun instsI -> ((fun classesI -> (if (datasI <> "") then ("datas " ^ datasI) else (if (defsI <> "") then ("defs " ^ defsI) else (if (globalsI <> "") then ("globals " ^ globalsI) else (if (instsI <> "") then ("insts " ^ instsI) else (if (classesI <> "") then ("classes " ^ classesI) else "")))))) (v_Vuna_dCompiler_dDriver_dCache_dclassesIssue dtb__137))) (v_Vuna_dCompiler_dDriver_dCache_dinstsIssue dtb__136))) (v_Vuna_dCompiler_dDriver_dCache_dglobalsIssue dtb__135))) (v_Vuna_dCompiler_dDriver_dCache_ddefsIssue dtb__134))) (v_Vuna_dCompiler_dDriver_dCache_ddatasIssue dtb__133))
  | _ -> failwith "DT: impossible branch"
))

# 347 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dsummaryMetaSegment = 1073741824

# 360 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel = (fun fuel off t -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "meta-shift") else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__139, dtb__140, dtb__141) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__139, dtb__140, dtb__141))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__142) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta ((dtb__142 + off)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__143) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__143))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__144) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__144))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__145, dtb__146, dtb__147, dtb__148, dtb__149) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__148)) (fun (d2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__149)) (fun (c2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__145, dtb__146, dtb__147, d2, c2))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__150, dtb__151, dtb__152, dtb__153, dtb__154) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftLamTyFuel (fuel - 1)) off) dtb__152)) (fun (slot2 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__154)) (fun (b2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__150, dtb__151, slot2, dtb__153, b2))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__155, dtb__156, dtb__157) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__155)) (fun (f2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__156)) (fun (a2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (f2, a2, dtb__157))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__158, dtb__159) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftArgs (fuel - 1)) off) dtb__159)) (fun (args2 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__158, args2))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__160, dtb__161) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftArgs (fuel - 1)) off) dtb__161)) (fun (args2 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__160, args2))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__162, dtb__163) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftArgs (fuel - 1)) off) dtb__163)) (fun (args2 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__162, args2))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__164, dtb__165) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__164)) (fun (s2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftAlts (fuel - 1)) off) dtb__165)) (fun (alts2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (s2, alts2))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__166, dtb__167, dtb__168, dtb__169, dtb__170) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__166)) (fun (base2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (base2, dtb__167, dtb__168, dtb__169, dtb__170))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__171, dtb__172, dtb__173, dtb__174, dtb__175) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__171)) (fun (base2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__175)) (fun (body2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (base2, dtb__172, dtb__173, dtb__174, body2))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__176) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__176))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__177) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__177))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__178) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__178))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__179, dtb__180, dtb__181) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__179)) (fun (c2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__180)) (fun (th2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__181)) (fun (el2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (c2, th2, el2))))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__182) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__182))))
  | _ -> failwith "DT: impossible branch"
)))
# 386 "Vuna/Compiler/Driver/Cache.vuna"
and v_Vuna_dCompiler_dDriver_dCache_dshiftLamTyFuel = (fun (mc0 : int) (mc1 : int) (mc2 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__183) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermMaybeFuel mc0) mc1) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__183))) (fun (b : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermMaybeFuel mc0) mc1) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__183))) (fun (r : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlamTyOf b) r)))))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 394 "Vuna/Compiler/Driver/Cache.vuna"
and v_Vuna_dCompiler_dDriver_dCache_dshiftTermMaybeFuel = (fun (mc0 : int) (mc1 : int) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__184) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel mc0) mc1) dtb__184)) (fun (t2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (t2))))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 400 "Vuna/Compiler/Driver/Cache.vuna"
and v_Vuna_dCompiler_dDriver_dCache_dshiftArgs = (fun (mc0 : int) (mc1 : int) (mc2 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__185, dtb__186) -> (match dtb__185 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__187; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__188 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel mc0) mc1) dtb__187)) (fun (a2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftArgs mc0) mc1) dtb__186)) (fun (rest2 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = a2; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__188 }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 407 "Vuna/Compiler/Driver/Cache.vuna"
and v_Vuna_dCompiler_dDriver_dCache_dshiftAlts = (fun (mc0 : int) (mc1 : int) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__189, dtb__190) -> (match dtb__189 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__191; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__192; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__193 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel mc0) mc1) dtb__193)) (fun (b2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftAlts mc0) mc1) dtb__190)) (fun (rest2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__191; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__192; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = b2 }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 357 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dshiftTerm = (fun off t -> (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) off) t))

# 414 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dshiftDef = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef) -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__194, dtb__195, dtb__196, dtb__197) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__195)) (fun (ty2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__194, ty2, dtb__196, dtb__197))))))
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__198, dtb__199, dtb__200) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__199)) (fun (ty2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__198, ty2, dtb__200))))))
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__201, dtb__202, dtb__203, dtb__204) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__202)) (fun (ty2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__203)) (fun (body2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__201, ty2, body2, dtb__204))))))))
  | _ -> failwith "DT: impossible branch"
))

# 424 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dshiftCtor = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = dtb__205; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = dtb__206; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = dtb__207; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = dtb__208; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan = dtb__209 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__208)) (fun (ty2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = dtb__205; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = dtb__206; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = dtb__207; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = ty2; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan = dtb__209 }))))
  | _ -> failwith "DT: impossible branch"
))

# 428 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dshiftFieldMeta = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta) -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName = dtb__210; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex = dtb__211; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldType = dtb__212 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__212)) (fun (fty2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName = dtb__210; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex = dtb__211; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldType = fty2 }))))
  | _ -> failwith "DT: impossible branch"
))

# 432 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dshiftData = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__213; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__214; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__215; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__216; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__217; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__218; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__219; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__220; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__221 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (v_Vuna_dCompiler_dDriver_dCache_dshiftCtor mc0)) dtb__215)) (fun (ctors2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__216)) (fun (kind2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (v_Vuna_dCompiler_dDriver_dCache_dshiftFieldMeta mc0)) dtb__220)) (fun (fields2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__213; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__214; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = ctors2; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = kind2; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__217; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__218; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__219; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = fields2; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__221 }))))))))
  | _ -> failwith "DT: impossible branch"
))

# 438 "Vuna/Compiler/Driver/Cache.vuna"
let rec v_Vuna_dCompiler_dDriver_dCache_dshiftTele = (fun (mc0 : int) (mc1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__222, dtb__223) -> (match dtb__222 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__224; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__225 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__225)) (fun (t2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTele mc0) dtb__223)) (fun (rest2 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__224; Base_dData_dPair.f_Base_dData_dPair_dPair_second = t2 }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 445 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dshiftClass = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtClass) -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassName = dtb__226; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams = dtb__227; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassSupers = dtb__228; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods = dtb__229; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys = dtb__230; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethodSpans = dtb__231 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0)) dtb__228)) (fun (supers2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTele mc0) dtb__229)) (fun (projs2 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0)) dtb__230)) (fun (tys2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassName = dtb__226; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams = dtb__227; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassSupers = supers2; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods = projs2; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys = tys2; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethodSpans = dtb__231 }))))))))
  | _ -> failwith "DT: impossible branch"
))

# 451 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dshiftInst = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst) -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstName = dtb__232; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele = dtb__233; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx = dtb__234; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead = dtb__235; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan = dtb__236 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTele mc0) dtb__233)) (fun (tele2 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0)) dtb__234)) (fun (ctx2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__235)) (fun (head2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstName = dtb__232; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele = tele2; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx = ctx2; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead = head2; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan = dtb__236 }))))))))
  | _ -> failwith "DT: impossible branch"
))

# 457 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dshiftGlobal = (fun (mc0 : int) (mc1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc1 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__237; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__238 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__238)) (fun (t2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__237; Base_dData_dPair.f_Base_dData_dPair_dPair_second = t2 }))))
  | _ -> failwith "DT: impossible branch"
))

# 461 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dshiftCachedProgram = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dDriver_dCache_dCachedProgram) -> (match mc1 with
  | { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = dtb__239; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = dtb__240; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = dtb__241; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = dtb__242; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = dtb__243; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedOpaque = dtb__244 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (v_Vuna_dCompiler_dDriver_dCache_dshiftData mc0)) dtb__239)) (fun (datas2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (v_Vuna_dCompiler_dDriver_dCache_dshiftDef mc0)) dtb__240)) (fun (defs2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (v_Vuna_dCompiler_dDriver_dCache_dshiftGlobal mc0)) dtb__241)) (fun (globals2 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (v_Vuna_dCompiler_dDriver_dCache_dshiftInst mc0)) dtb__242)) (fun (insts2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (v_Vuna_dCompiler_dDriver_dCache_dshiftClass mc0)) dtb__243)) (fun (classes2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtClass Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = datas2; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = defs2; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = globals2; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = insts2; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = classes2; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedOpaque = Base_dData_dList.C_Base_dData_dList_dList_Nil }))))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 484 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dencGlobalPair = (fun (mc0 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__245; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__246 } -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__245) ((Vuna_dCompiler_dCore_dCanonical.v_Vuna_dCompiler_dCore_dCanonical_dencTerm dtb__246) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 477 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_dencCachedProgram = (fun cp acc -> (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList Vuna_dCompiler_dElab_dCanonical.v_Vuna_dCompiler_dElab_dCanonical_dencDtData) (cp).f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList Vuna_dCompiler_dElab_dCanonical.v_Vuna_dCompiler_dElab_dCanonical_dencDtDef) (cp).f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList v_Vuna_dCompiler_dDriver_dCache_dencGlobalPair) (cp).f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList Vuna_dCompiler_dElab_dCanonical.v_Vuna_dCompiler_dElab_dCanonical_dencDtInst) (cp).f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList Vuna_dCompiler_dElab_dCanonical.v_Vuna_dCompiler_dElab_dCanonical_dencDtClass) (cp).f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr) (cp).f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedOpaque) acc)))))))

# 500 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_ddecGlobalPair = (fun fuel c -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) c)) (fun (n : string) (b1 : Vuna_dCompiler_dBase_dBytes.t_Vuna_dCompiler_dBase_dBytes_dCur) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair ((Vuna_dCompiler_dCore_dCanonical.v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) b1)) (fun (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (b2 : Vuna_dCompiler_dBase_dBytes.t_Vuna_dCompiler_dBase_dBytes_dCur) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = n; Base_dData_dPair.f_Base_dData_dPair_dPair_second = t }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = b2 })))))))

# 494 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_ddecCachedProgram = (fun fuel c -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList Vuna_dCompiler_dElab_dCanonical.v_Vuna_dCompiler_dElab_dCanonical_ddecDtData) (fuel - 1)) c)) (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (b1 : Vuna_dCompiler_dBase_dBytes.t_Vuna_dCompiler_dBase_dBytes_dCur) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList Vuna_dCompiler_dElab_dCanonical.v_Vuna_dCompiler_dElab_dCanonical_ddecDtDef) (fuel - 1)) b1)) (fun (defs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) (b2 : Vuna_dCompiler_dBase_dBytes.t_Vuna_dCompiler_dBase_dBytes_dCur) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dDriver_dCache_ddecGlobalPair) (fuel - 1)) b2)) (fun (globals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (b3 : Vuna_dCompiler_dBase_dBytes.t_Vuna_dCompiler_dBase_dBytes_dCur) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList Vuna_dCompiler_dElab_dCanonical.v_Vuna_dCompiler_dElab_dCanonical_ddecDtInst) (fuel - 1)) b3)) (fun (insts : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dData_dList.t_Base_dData_dList_dList) (b4 : Vuna_dCompiler_dBase_dBytes.t_Vuna_dCompiler_dBase_dBytes_dCur) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList Vuna_dCompiler_dElab_dCanonical.v_Vuna_dCompiler_dElab_dCanonical_ddecDtClass) (fuel - 1)) b4)) (fun (classes : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtClass Base_dData_dList.t_Base_dData_dList_dList) (b5 : Vuna_dCompiler_dBase_dBytes.t_Vuna_dCompiler_dBase_dBytes_dCur) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dthenPair (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr) (fuel - 1)) b5)) (fun (names : string Base_dData_dList.t_Base_dData_dList_dList) (b6 : Vuna_dCompiler_dBase_dBytes.t_Vuna_dCompiler_dBase_dBytes_dCur) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = datas; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = defs; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = globals; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = insts; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = classes; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedOpaque = names }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = b6 })))))))))))))))

# 488 "Vuna/Compiler/Driver/Cache.vuna"
let v_Vuna_dCompiler_dDriver_dCache_ddecCachedProgramComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__247) -> (match dtb__247 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__248; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__249 } -> (if (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurAtEnd dtb__249) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__248)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDriver_dCache_ddecCachedProgram (bi_strLength s)) (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurOf s))))
