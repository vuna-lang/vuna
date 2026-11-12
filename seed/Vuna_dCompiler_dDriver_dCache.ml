open Vuna_runtime
type t_Vuna_dCompiler_dDriver_dCache_dCachedProgram = { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtClass Base_dList.t_Base_dList_dList }

let v_Vuna_dCompiler_dDriver_dCache_dcachedDatas = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = dtb__0; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = dtb__1; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = dtb__2; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = dtb__3; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = dtb__4 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dcachedDefs = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = dtb__5; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = dtb__6; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = dtb__7; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = dtb__8; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = dtb__9 } -> dtb__6
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dcachedGlobals = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = dtb__10; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = dtb__11; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = dtb__12; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = dtb__13; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = dtb__14 } -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dcachedInsts = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = dtb__15; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = dtb__16; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = dtb__17; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = dtb__18; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = dtb__19 } -> dtb__18
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dcachedClasses = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = dtb__20; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = dtb__21; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = dtb__22; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = dtb__23; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = dtb__24 } -> dtb__24
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dfixTerm = (fun tbl depth t -> (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl tbl) depth) t))

let v_Vuna_dCompiler_dDriver_dCache_dfixDef = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__25, dtb__26, dtb__27, dtb__28) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__25, (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__26), dtb__27, dtb__28))
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__29, dtb__30, dtb__31) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__29, (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__30), dtb__31))
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__32, dtb__33, dtb__34, dtb__35) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__32, (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__33), (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__34), dtb__35))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dfixCtor = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = dtb__36; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = dtb__37; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = dtb__38; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = dtb__39; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan = dtb__40 } -> { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = dtb__36; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = dtb__37; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = dtb__38; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__39); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan = dtb__40 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dfixFieldMeta = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName = dtb__41; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex = dtb__42; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldType = dtb__43 } -> { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName = dtb__41; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex = dtb__42; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldType = (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__43) }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dfixData = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__44; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__45; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__46; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__47; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__48; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__49; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__50; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__51; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__52 } -> { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__44; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__45; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixCtor mc0)) dtb__46); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__47); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__48; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__49; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__50; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixFieldMeta mc0)) dtb__51); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__52 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dfixClass = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassName = dtb__53; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams = dtb__54; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods = dtb__55; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys = dtb__56 } -> { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassName = dtb__53; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams = dtb__54; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods = ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) (Base_dPair.v_Base_dPair_dsecondOf p)) })) dtb__55); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys = ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) (Base_dList.v_Base_dList_dlength dtb__54))) dtb__56) }
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dfixTele = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__57, dtb__58) -> (match dtb__57 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__59; Base_dPair.f_Base_dPair_dPair_second = dtb__60 } -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__59; Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) mc1) dtb__60) }, (((v_Vuna_dCompiler_dDriver_dCache_dfixTele mc0) (mc1 + 1)) dtb__58)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dfixInst = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstName = dtb__61; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele = dtb__62; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx = dtb__63; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead = dtb__64; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan = dtb__65 } -> ((fun nTele -> { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstName = dtb__61; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele = (((v_Vuna_dCompiler_dDriver_dCache_dfixTele mc0) 0) dtb__62); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx = ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) nTele)) dtb__63); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead = (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) nTele) dtb__64); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan = dtb__65 }) (Base_dList.v_Base_dList_dlength dtb__62))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgramWith = (fun tbl prog -> { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixData tbl)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)); f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixDef tbl)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog)); f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm tbl) 0) (Base_dPair.v_Base_dPair_dsecondOf p)) })) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog)); f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixInst tbl)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog)); f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixClass tbl)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog)) })

let v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgram = (fun prog -> ((v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgramWith ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog))) prog))

let v_Vuna_dCompiler_dDriver_dCache_dtermValidAt = (fun depth t -> (if (if ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll t)) = 0) then (Base_dBool.v_Base_dBool_dnot ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar depth) t)) else false) then (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar t)) else false))

let rec v_Vuna_dCompiler_dDriver_dCache_dctorsValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__66, dtb__67) -> (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__66)) then (v_Vuna_dCompiler_dDriver_dCache_dctorsValid dtb__67) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_ddatasValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__68, dtb__69) -> (if (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataKind dtb__68)) then (v_Vuna_dCompiler_dDriver_dCache_dctorsValid (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__68)) else false) then (v_Vuna_dCompiler_dDriver_dCache_ddatasValid dtb__69) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dbodyValid = (fun t -> (if (if ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime t)) = 0) then (Base_dBool.v_Base_dBool_dnot ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) t)) else false) then (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar t)) else false))

let rec v_Vuna_dCompiler_dDriver_dCache_ddefsValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__70, dtb__71) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__70) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__72) -> (if (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__70)) then (v_Vuna_dCompiler_dDriver_dCache_dbodyValid dtb__72) else false) then (v_Vuna_dCompiler_dDriver_dCache_ddefsValid dtb__71) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__70)) then (v_Vuna_dCompiler_dDriver_dCache_ddefsValid dtb__71) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dglobalsValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__73, dtb__74) -> (match dtb__73 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__75; Base_dPair.f_Base_dPair_dPair_second = dtb__76 } -> (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt 0) dtb__76) then (v_Vuna_dCompiler_dDriver_dCache_dglobalsValid dtb__74) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dteleValid = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__77, dtb__78) -> (match dtb__77 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__79; Base_dPair.f_Base_dPair_dPair_second = dtb__80 } -> (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt mc0) dtb__80) then ((v_Vuna_dCompiler_dDriver_dCache_dteleValid (mc0 + 1)) dtb__78) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dtermsValidAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__81, dtb__82) -> (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt mc0) dtb__81) then ((v_Vuna_dCompiler_dDriver_dCache_dtermsValidAt mc0) dtb__82) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dinstsValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__83, dtb__84) -> ((fun nTele -> (if (if (if ((v_Vuna_dCompiler_dDriver_dCache_dteleValid 0) (dtb__83).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele) then ((v_Vuna_dCompiler_dDriver_dCache_dtermsValidAt nTele) (dtb__83).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx) else false) then ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt nTele) (dtb__83).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead) else false) then (v_Vuna_dCompiler_dDriver_dCache_dinstsValid dtb__84) else false)) (Base_dList.v_Base_dList_dlength (dtb__83).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele))
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dclassesValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__85, dtb__86) -> ((fun projs -> (if (if ((v_Vuna_dCompiler_dDriver_dCache_dtermsValidAt 0) projs) then ((v_Vuna_dCompiler_dDriver_dCache_dtermsValidAt (Base_dList.v_Base_dList_dlength (dtb__85).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams)) (dtb__85).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys) else false) then (v_Vuna_dCompiler_dDriver_dCache_dclassesValid dtb__86) else false)) ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dsecondOf p))) (dtb__85).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods))
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dcachedProgramValid = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = dtb__87; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = dtb__88; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = dtb__89; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = dtb__90; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = dtb__91 } -> (if (if (if (if (v_Vuna_dCompiler_dDriver_dCache_ddatasValid dtb__87) then (v_Vuna_dCompiler_dDriver_dCache_ddefsValid dtb__88) else false) then (v_Vuna_dCompiler_dDriver_dCache_dglobalsValid dtb__89) else false) then (v_Vuna_dCompiler_dDriver_dCache_dinstsValid dtb__90) else false) then (v_Vuna_dCompiler_dDriver_dCache_dclassesValid dtb__91) else false)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt = (fun depth t -> (if ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll t)) > 0) then "meta" else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar t) then "negative-index" else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar depth) t) then "free-var" else ""))))

let rec v_Vuna_dCompiler_dDriver_dCache_dctorIssues = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__92, dtb__93) -> ((fun issue -> (if (issue = "") then (v_Vuna_dCompiler_dDriver_dCache_dctorIssues dtb__93) else (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__92); " ctor:"; issue]))) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__92)))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_ddataIssue = (fun d -> ((fun kindIssue -> (if (kindIssue = "") then (v_Vuna_dCompiler_dDriver_dCache_dctorIssues (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)) else (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); " kind:"; kindIssue]))) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataKind d))))

let rec v_Vuna_dCompiler_dDriver_dCache_ddatasIssue = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__94, dtb__95) -> ((fun issue -> (if (issue = "") then (v_Vuna_dCompiler_dDriver_dCache_ddatasIssue dtb__95) else issue)) (v_Vuna_dCompiler_dDriver_dCache_ddataIssue dtb__94))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dbodyIssueAt = (fun t -> (if ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime t)) > 0) then "meta" else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar t) then "negative-index" else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) t) then "free-var" else ""))))

let v_Vuna_dCompiler_dDriver_dCache_ddefIssue = (fun d -> ((fun typeIssue -> (if (typeIssue = "") then (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__96) -> ((fun bodyIssue -> (if (bodyIssue = "") then "" else (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); " body:"; bodyIssue]))) (v_Vuna_dCompiler_dDriver_dCache_dbodyIssueAt dtb__96))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
) else (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); " type:"; typeIssue]))) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d))))

let rec v_Vuna_dCompiler_dDriver_dCache_ddefsIssue = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__97, dtb__98) -> ((fun issue -> (if (issue = "") then (v_Vuna_dCompiler_dDriver_dCache_ddefsIssue dtb__98) else issue)) (v_Vuna_dCompiler_dDriver_dCache_ddefIssue dtb__97))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dglobalsIssue = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__99, dtb__100) -> (match dtb__99 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__101; Base_dPair.f_Base_dPair_dPair_second = dtb__102 } -> ((fun issue -> (if (issue = "") then (v_Vuna_dCompiler_dDriver_dCache_dglobalsIssue dtb__100) else (String.concat "" [dtb__101; ":"; issue]))) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt 0) dtb__102))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dteleIssueGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__103, dtb__104) -> (match dtb__103 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__105; Base_dPair.f_Base_dPair_dPair_second = dtb__106 } -> ((fun issue -> (if (issue = "") then ((v_Vuna_dCompiler_dDriver_dCache_dteleIssueGo (mc0 + 1)) dtb__104) else (String.concat "" [dtb__105; ":"; issue]))) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt mc0) dtb__106))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dctxIssues = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__107, dtb__108) -> ((fun issue -> (if (issue = "") then ((v_Vuna_dCompiler_dDriver_dCache_dctxIssues mc0) dtb__108) else issue)) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt mc0) dtb__107))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dinstIssue = (fun i -> ((fun nTele -> ((fun teleIssue -> (if (teleIssue <> "") then (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i); " tele:"; teleIssue]) else ((fun ctxIssue -> (if (ctxIssue <> "") then (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i); " ctx:"; ctxIssue]) else ((fun headIssue -> (if (headIssue = "") then "" else (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i); " head:"; headIssue]))) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt nTele) (i).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead)))) ((v_Vuna_dCompiler_dDriver_dCache_dctxIssues nTele) (i).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx)))) ((v_Vuna_dCompiler_dDriver_dCache_dteleIssueGo 0) (i).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele))) (Base_dList.v_Base_dList_dlength (i).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele)))

let rec v_Vuna_dCompiler_dDriver_dCache_dinstsIssue = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__109, dtb__110) -> ((fun issue -> (if (issue = "") then (v_Vuna_dCompiler_dDriver_dCache_dinstsIssue dtb__110) else issue)) (v_Vuna_dCompiler_dDriver_dCache_dinstIssue dtb__109))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dclassIssue = (fun c -> ((fun projIssue -> (if (projIssue <> "") then (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName c); " proj:"; projIssue]) else ((fun fieldIssue -> (if (fieldIssue = "") then "" else (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName c); " field:"; fieldIssue]))) ((v_Vuna_dCompiler_dDriver_dCache_dctxIssues (Base_dList.v_Base_dList_dlength (c).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams)) (c).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys)))) ((v_Vuna_dCompiler_dDriver_dCache_dctxIssues 0) ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dsecondOf p))) (c).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods))))

let rec v_Vuna_dCompiler_dDriver_dCache_dclassesIssue = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__111, dtb__112) -> ((fun issue -> (if (issue = "") then (v_Vuna_dCompiler_dDriver_dCache_dclassesIssue dtb__112) else issue)) (v_Vuna_dCompiler_dDriver_dCache_dclassIssue dtb__111))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dcachedProgramIssue = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = dtb__113; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = dtb__114; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = dtb__115; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = dtb__116; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = dtb__117 } -> ((fun datasI -> ((fun defsI -> ((fun globalsI -> ((fun instsI -> ((fun classesI -> (if (datasI <> "") then ("datas " ^ datasI) else (if (defsI <> "") then ("defs " ^ defsI) else (if (globalsI <> "") then ("globals " ^ globalsI) else (if (instsI <> "") then ("insts " ^ instsI) else (if (classesI <> "") then ("classes " ^ classesI) else "")))))) (v_Vuna_dCompiler_dDriver_dCache_dclassesIssue dtb__117))) (v_Vuna_dCompiler_dDriver_dCache_dinstsIssue dtb__116))) (v_Vuna_dCompiler_dDriver_dCache_dglobalsIssue dtb__115))) (v_Vuna_dCompiler_dDriver_dCache_ddefsIssue dtb__114))) (v_Vuna_dCompiler_dDriver_dCache_ddatasIssue dtb__113))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dsummaryMetaSegment = 1073741824

let rec v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel = (fun fuel off t -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "meta-shift") else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__118, dtb__119, dtb__120) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__118, dtb__119, dtb__120))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__121) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta ((dtb__121 + off)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__122) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__122))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__123) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__123))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__124, dtb__125, dtb__126, dtb__127, dtb__128) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__127)) (fun d2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__128)) (fun c2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__124, dtb__125, dtb__126, d2, c2))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__129, dtb__130, dtb__131) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__131)) (fun b2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__129, dtb__130, b2))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__132, dtb__133, dtb__134) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__132)) (fun f2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__133)) (fun a2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (f2, a2, dtb__134))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__135, dtb__136) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftArgs (fuel - 1)) off) dtb__136)) (fun args2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__135, args2))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__137, dtb__138) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftArgs (fuel - 1)) off) dtb__138)) (fun args2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__137, args2))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__139, dtb__140) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftArgs (fuel - 1)) off) dtb__140)) (fun args2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__139, args2))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__141, dtb__142) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__141)) (fun s2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftAlts (fuel - 1)) off) dtb__142)) (fun alts2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (s2, alts2))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__143, dtb__144, dtb__145, dtb__146, dtb__147) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__143)) (fun base2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (base2, dtb__144, dtb__145, dtb__146, dtb__147))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__148, dtb__149, dtb__150, dtb__151, dtb__152) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__148)) (fun base2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__152)) (fun body2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (base2, dtb__149, dtb__150, dtb__151, body2))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__153) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__153))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__154) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__154))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__155) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__155))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__156, dtb__157, dtb__158) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__156)) (fun c2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__157)) (fun th2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__158)) (fun el2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (c2, th2, el2))))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__159) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__159))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dDriver_dCache_dshiftArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__160, dtb__161) -> (match dtb__160 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__162; Base_dPair.f_Base_dPair_dPair_second = dtb__163 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel mc0) mc1) dtb__162)) (fun a2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftArgs mc0) mc1) dtb__161)) (fun rest2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = a2; Base_dPair.f_Base_dPair_dPair_second = dtb__163 }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dDriver_dCache_dshiftAlts = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__164, dtb__165) -> (match dtb__164 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__166; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__167; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__168 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel mc0) mc1) dtb__168)) (fun b2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dCache_dshiftAlts mc0) mc1) dtb__165)) (fun rest2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__166; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__167; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = b2 }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftTerm = (fun off t -> (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) off) t))

let v_Vuna_dCompiler_dDriver_dCache_dshiftDef = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__169, dtb__170, dtb__171, dtb__172) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__170)) (fun ty2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__169, ty2, dtb__171, dtb__172))))))
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__173, dtb__174, dtb__175) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__174)) (fun ty2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__173, ty2, dtb__175))))))
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__176, dtb__177, dtb__178, dtb__179) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__177)) (fun ty2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__178)) (fun body2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__176, ty2, body2, dtb__179))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftCtor = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = dtb__180; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = dtb__181; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = dtb__182; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = dtb__183; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan = dtb__184 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__183)) (fun ty2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = dtb__180; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = dtb__181; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = dtb__182; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = ty2; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan = dtb__184 }))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftFieldMeta = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName = dtb__185; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex = dtb__186; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldType = dtb__187 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__187)) (fun fty2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName = dtb__185; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex = dtb__186; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldType = fty2 }))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftData = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__188; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__189; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__190; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__191; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__192; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__193; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__194; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__195; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__196 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (v_Vuna_dCompiler_dDriver_dCache_dshiftCtor mc0)) dtb__190)) (fun ctors2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__191)) (fun kind2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (v_Vuna_dCompiler_dDriver_dCache_dshiftFieldMeta mc0)) dtb__195)) (fun fields2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__188; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__189; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = ctors2; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = kind2; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__192; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__193; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__194; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = fields2; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__196 }))))))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dshiftTele = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__197, dtb__198) -> (match dtb__197 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__199; Base_dPair.f_Base_dPair_dPair_second = dtb__200 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__200)) (fun t2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTele mc0) dtb__198)) (fun rest2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__199; Base_dPair.f_Base_dPair_dPair_second = t2 }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftClass = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassName = dtb__201; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams = dtb__202; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods = dtb__203; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys = dtb__204 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTele mc0) dtb__203)) (fun projs2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0)) dtb__204)) (fun tys2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassName = dtb__201; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams = dtb__202; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods = projs2; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys = tys2 }))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftInst = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstName = dtb__205; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele = dtb__206; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx = dtb__207; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead = dtb__208; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan = dtb__209 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTele mc0) dtb__206)) (fun tele2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0)) dtb__207)) (fun ctx2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__208)) (fun head2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstName = dtb__205; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele = tele2; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx = ctx2; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead = head2; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan = dtb__209 }))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftGlobal = (fun mc0 mc1 -> (match mc1 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__210; Base_dPair.f_Base_dPair_dPair_second = dtb__211 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__211)) (fun t2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__210; Base_dPair.f_Base_dPair_dPair_second = t2 }))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftCachedProgram = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = dtb__212; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = dtb__213; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = dtb__214; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = dtb__215; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = dtb__216 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (v_Vuna_dCompiler_dDriver_dCache_dshiftData mc0)) dtb__212)) (fun datas2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (v_Vuna_dCompiler_dDriver_dCache_dshiftDef mc0)) dtb__213)) (fun defs2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (v_Vuna_dCompiler_dDriver_dCache_dshiftGlobal mc0)) dtb__214)) (fun globals2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (v_Vuna_dCompiler_dDriver_dCache_dshiftInst mc0)) dtb__215)) (fun insts2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (v_Vuna_dCompiler_dDriver_dCache_dshiftClass mc0)) dtb__216)) (fun classes2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = datas2; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = defs2; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = globals2; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = insts2; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = classes2 }))))))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dencGlobalPair = (fun mc0 mc1 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__217; Base_dPair.f_Base_dPair_dPair_second = dtb__218 } -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr dtb__217) ((Vuna_dCompiler_dCanonical_dCoreTerm.v_Vuna_dCompiler_dCanonical_dCoreTerm_dencTerm dtb__218) mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dencCachedProgram = (fun cp acc -> (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dElab.v_Vuna_dCompiler_dCanonical_dElab_dencDtData) (cp).f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dElab.v_Vuna_dCompiler_dCanonical_dElab_dencDtDef) (cp).f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList v_Vuna_dCompiler_dDriver_dCache_dencGlobalPair) (cp).f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dElab.v_Vuna_dCompiler_dCanonical_dElab_dencDtInst) (cp).f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dElab.v_Vuna_dCompiler_dCanonical_dElab_dencDtClass) (cp).f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses) acc))))))

let v_Vuna_dCompiler_dDriver_dCache_ddecGlobalPair = (fun fuel c -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr (fuel - 1)) c)) (fun n b1 -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dthenPair ((Vuna_dCompiler_dCanonical_dCoreTerm.v_Vuna_dCompiler_dCanonical_dCoreTerm_ddecTerm (fuel - 1)) b1)) (fun t b2 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = n; Base_dPair.f_Base_dPair_dPair_second = t }; Base_dPair.f_Base_dPair_dPair_second = b2 })))))))

let v_Vuna_dCompiler_dDriver_dCache_ddecCachedProgram = (fun fuel c -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dthenPair (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList Vuna_dCompiler_dCanonical_dElab.v_Vuna_dCompiler_dCanonical_dElab_ddecDtData) (fuel - 1)) c)) (fun datas b1 -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dthenPair (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList Vuna_dCompiler_dCanonical_dElab.v_Vuna_dCompiler_dCanonical_dElab_ddecDtDef) (fuel - 1)) b1)) (fun defs b2 -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dthenPair (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList v_Vuna_dCompiler_dDriver_dCache_ddecGlobalPair) (fuel - 1)) b2)) (fun globals b3 -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dthenPair (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList Vuna_dCompiler_dCanonical_dElab.v_Vuna_dCompiler_dCanonical_dElab_ddecDtInst) (fuel - 1)) b3)) (fun insts b4 -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dthenPair (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList Vuna_dCompiler_dCanonical_dElab.v_Vuna_dCompiler_dCanonical_dElab_ddecDtClass) (fuel - 1)) b4)) (fun classes b5 -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = datas; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = defs; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = globals; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = insts; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = classes }; Base_dPair.f_Base_dPair_dPair_second = b5 })))))))))))))

let v_Vuna_dCompiler_dDriver_dCache_ddecCachedProgramComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__219) -> (match dtb__219 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__220; Base_dPair.f_Base_dPair_dPair_second = dtb__221 } -> (if (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurAtEnd dtb__221) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__220)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDriver_dCache_ddecCachedProgram (bi_strLength s)) (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurOf s))))
