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

let rec v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel = (fun fuel off t -> (if (fuel <= 0) then t else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__118) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta ((dtb__118 + off)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__119, dtb__120, dtb__121, dtb__122, dtb__123) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__119, dtb__120, dtb__121, (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__122), (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__123)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__124, dtb__125, dtb__126) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__124, dtb__125, (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__126)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__127, dtb__128, dtb__129) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__127), (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__128), dtb__129))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__130, dtb__131) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__130, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__131)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__132, dtb__133) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__132), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dDriver_dCache_dshiftAltFuel (fuel - 1)) off)) dtb__133)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__134, dtb__135, dtb__136) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__134), (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__135), (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__136)))
  | _ -> t
)))
and v_Vuna_dCompiler_dDriver_dCache_dshiftAltFuel = (fun mc0 mc1 mc2 -> (match mc2 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__137; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__138; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__139 } -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__137; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__138; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel mc0) mc1) dtb__139) }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftTerm = (fun off t -> (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel 128) off) t))

let v_Vuna_dCompiler_dDriver_dCache_dshiftDef = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__140, dtb__141, dtb__142, dtb__143) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__140, ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__141), dtb__142, dtb__143))
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__144, dtb__145, dtb__146) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__144, ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__145), dtb__146))
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__147, dtb__148, dtb__149, dtb__150) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__147, ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__148), ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__149), dtb__150))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftCtor = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = dtb__151; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = dtb__152; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = dtb__153; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = dtb__154; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan = dtb__155 } -> { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = dtb__151; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = dtb__152; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = dtb__153; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__154); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan = dtb__155 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftFieldMeta = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName = dtb__156; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex = dtb__157; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldType = dtb__158 } -> { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName = dtb__156; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex = dtb__157; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldType = ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__158) }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftData = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__159; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__160; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__161; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__162; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__163; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__164; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__165; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__166; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__167 } -> { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__159; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__160; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftCtor mc0)) dtb__161); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__162); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__163; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__164; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__165; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftFieldMeta mc0)) dtb__166); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__167 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftClass = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassName = dtb__168; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams = dtb__169; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods = dtb__170; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys = dtb__171 } -> { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassName = dtb__168; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams = dtb__169; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods = ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) (Base_dPair.v_Base_dPair_dsecondOf p)) })) dtb__170); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys = ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0)) dtb__171) }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftInst = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstName = dtb__172; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele = dtb__173; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx = dtb__174; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead = dtb__175; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan = dtb__176 } -> { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstName = dtb__172; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele = ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) (Base_dPair.v_Base_dPair_dsecondOf p)) })) dtb__173); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx = ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0)) dtb__174); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead = ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__175); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan = dtb__176 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftCachedProgram = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = dtb__177; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = dtb__178; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = dtb__179; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = dtb__180; f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = dtb__181 } -> { f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDatas = ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftData mc0)) dtb__177); f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedDefs = ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftDef mc0)) dtb__178); f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedGlobals = ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) (Base_dPair.v_Base_dPair_dsecondOf p)) })) dtb__179); f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedInsts = ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftInst mc0)) dtb__180); f_Vuna_dCompiler_dDriver_dCache_dCachedProgram_cachedClasses = ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftClass mc0)) dtb__181) }
  | _ -> failwith "DT: impossible branch"
))
