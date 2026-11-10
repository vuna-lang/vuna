open Vuna_runtime
type t_Vuna_dCompiler_dElab_dTypes_dDtDef = C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef of (string) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe) | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom of (string) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe) | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern of (string) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe)
and t_Vuna_dCompiler_dElab_dTypes_dDtCtor = { f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName : string; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily : string; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta = { f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName : string; f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex : int; f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldType : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dElab_dTypes_dDtData = { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName : string; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors : t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear : bool; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dReprTier; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields : t_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dElab_dTypes_dDtGoal = { f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalMeta : int; f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalSpan : Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan; f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalType : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue; f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalCtx : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalName : string }
and t_Vuna_dCompiler_dElab_dTypes_dDtClass = { f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassName : string; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dElab_dTypes_dDtInst = { f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstName : string; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dElab_dTypes_dInstStore = { f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsList : t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily : (string, t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap }
and t_Vuna_dCompiler_dElab_dTypes_dConstraintKind = C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkDict | C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkRow
and t_Vuna_dCompiler_dElab_dTypes_dConstraint = { f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId : int; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind : t_Vuna_dCompiler_dElab_dTypes_dConstraintKind; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta : int; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan : Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth : int }
and t_Vuna_dCompiler_dElab_dTypes_dConstraintStore = { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending : t_Vuna_dCompiler_dElab_dTypes_dConstraint Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId : int; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried : (int, int) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dElab_dTypes_dEc = { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext : int; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas : t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta : (int, int) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals : t_Vuna_dCompiler_dElab_dTypes_dDtGoal Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts : t_Vuna_dCompiler_dElab_dTypes_dInstStore; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses : t_Vuna_dCompiler_dElab_dTypes_dDtClass Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints : t_Vuna_dCompiler_dElab_dTypes_dConstraintStore; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl : (int, int) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete : bool; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl : (string, (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dList.t_Base_dList_dList, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl : (string, t_Vuna_dCompiler_dElab_dTypes_dDtCtor) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear : bool }
and t_Vuna_dCompiler_dElab_dTypes_dCtx = { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dElab_dTypes_dDtProgram = { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas : t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs : t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals : t_Vuna_dCompiler_dElab_dTypes_dDtGoal Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts : t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses : t_Vuna_dCompiler_dElab_dTypes_dDtClass Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext : int; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths : (int, int) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList }

let v_Vuna_dCompiler_dElab_dTypes_ddtDefName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__0, dtb__1, dtb__2, dtb__3) -> dtb__0
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__4, dtb__5, dtb__6) -> dtb__4
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__7, dtb__8, dtb__9, dtb__10) -> dtb__7
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDefType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__11, dtb__12, dtb__13, dtb__14) -> dtb__12
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__15, dtb__16, dtb__17) -> dtb__16
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__18, dtb__19, dtb__20, dtb__21) -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDefBody = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__22, dtb__23, dtb__24, dtb__25) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__26, dtb__27, dtb__28) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__29, dtb__30, dtb__31, dtb__32) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__31))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDefHasBody = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__33, dtb__34, dtb__35, dtb__36) -> true
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__37, dtb__38, dtb__39) -> false
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__40, dtb__41, dtb__42, dtb__43) -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__44, dtb__45, dtb__46, dtb__47) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__46))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__48, dtb__49, dtb__50, dtb__51) -> dtb__51
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__52, dtb__53, dtb__54) -> dtb__54
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__55, dtb__56, dtb__57, dtb__58) -> dtb__58
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtCtorName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = dtb__59; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = dtb__60; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = dtb__61; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = dtb__62 } -> dtb__59
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = dtb__63; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = dtb__64; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = dtb__65; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = dtb__66 } -> dtb__64
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = dtb__67; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = dtb__68; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = dtb__69; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = dtb__70 } -> dtb__69
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtCtorType = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = dtb__71; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = dtb__72; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = dtb__73; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = dtb__74 } -> dtb__74
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__75; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__76; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__77; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__78; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__79; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__80; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__81; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__82 } -> dtb__75
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__83; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__84; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__85; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__86; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__87; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__88; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__89; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__90 } -> dtb__85
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataKind = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__91; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__92; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__93; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__94; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__95; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__96; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__97; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__98 } -> dtb__94
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataViaClasses = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__99; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__100; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__101; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__102; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__103; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__104; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__105; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__106 } -> dtb__103
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataRepr = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__107; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__108; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__109; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__110; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__111; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__112; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__113; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__114 } -> dtb__113
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataFields = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__115; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__116; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__117; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__118; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__119; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__120; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__121; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__122 } -> dtb__122
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__123; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__124; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__125; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__126; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__127; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__128; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__129; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__130 } -> dtb__128
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtClassName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassName = dtb__131; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams = dtb__132; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods = dtb__133; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys = dtb__134 } -> dtb__131
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtInstName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstName = dtb__135; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele = dtb__136; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx = dtb__137; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead = dtb__138 } -> dtb__135
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__139) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__139; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__140, dtb__141, dtb__142) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__143) -> (match dtb__143 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__144; Base_dPair.f_Base_dPair_dPair_second = dtb__145 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__144; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__145) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__141; Base_dPair.f_Base_dPair_dPair_second = dtb__142 }, Base_dList.C_Base_dList_dList_Nil))) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp dtb__140))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dElab_dTypes_dinstFamilyOf = (fun i -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__146) -> (match dtb__146 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__147; Base_dPair.f_Base_dPair_dPair_second = dtb__148 } -> dtb__147
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp (i).f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead)))

let v_Vuna_dCompiler_dElab_dTypes_dinstStoreEmpty = { f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsList = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil) }

let v_Vuna_dCompiler_dElab_dTypes_dinstStorePush = (fun store i -> ((fun fam -> ((fun bucket -> { f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsList = ((Base_dList.v_Base_dList_dappend (store).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsList) (Base_dList.C_Base_dList_dList_Cons (i, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily = ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) fam) ((Base_dList.v_Base_dList_dappend bucket) (Base_dList.C_Base_dList_dList_Cons (i, Base_dList.C_Base_dList_dList_Nil)))) (store).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily) }) (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) fam) (store).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__149) -> dtb__149
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dElab_dTypes_dinstFamilyOf i)))

let rec v_Vuna_dCompiler_dElab_dTypes_dinstStoreOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__150, dtb__151) -> ((v_Vuna_dCompiler_dElab_dTypes_dinstStorePush (v_Vuna_dCompiler_dElab_dTypes_dinstStoreOf dtb__151)) dtb__150)
  | Base_dList.C_Base_dList_dList_Nil -> v_Vuna_dCompiler_dElab_dTypes_dinstStoreEmpty
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dinstStoreFamily = (fun store fam -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) fam) (store).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__152) -> dtb__152
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dcsEmpty = { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = 0; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = Base_dList.C_Base_dList_dList_Nil }

let v_Vuna_dCompiler_dElab_dTypes_decPutNext = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__153; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__154; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__155; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__156; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__157; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__158; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__159; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__160; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__161; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__162; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__163; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__164; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__165; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__166; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__167; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__168; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__169; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__170 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__154; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__155; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__156; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__157; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__158; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__159; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__160; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__161; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__162; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__163; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__164; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__165; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__166; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__167; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__168; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__169; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__170 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutClausesTbl = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__171; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__172; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__173; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__174; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__175; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__176; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__177; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__178; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__179; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__180; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__181; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__182; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__183; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__184; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__185; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__186; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__187; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__188 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__171; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__172; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__173; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__174; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__175; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__176; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__177; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__178; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__179; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__180; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__181; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__182; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__183; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__184; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__186; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__187; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__188 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decNext = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__189; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__190; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__191; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__192; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__193; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__194; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__195; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__196; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__197; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__198; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__199; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__200; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__201; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__202; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__203; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__204; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__205; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__206 } -> dtb__189
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decSols = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__207; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__208; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__209; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__210; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__211; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__212; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__213; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__214; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__215; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__216; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__217; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__218; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__219; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__220; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__221; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__222; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__223; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__224 } -> dtb__208
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDefs = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__225; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__226; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__227; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__228; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__229; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__230; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__231; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__232; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__233; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__234; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__235; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__236; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__237; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__238; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__239; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__240; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__241; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__242 } -> (Base_dList.v_Base_dList_dreverse dtb__227)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDefTbl = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__243; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__244; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__245; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__246; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__247; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__248; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__249; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__250; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__251; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__252; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__253; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__254; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__255; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__256; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__257; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__258; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__259; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__260 } -> dtb__252
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__261; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__262; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__263; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__264; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__265; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__266; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__267; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__268; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__269; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__270; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__271; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__272; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__273; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__274; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__275; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__276; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__277; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__278 } -> dtb__271
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__279; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__280; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__281; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__282; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__283; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__284; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__285; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__286; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__287; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__288; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__289; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__290; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__291; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__292; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__293; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__294; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__295; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__296 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__279; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__280; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__281; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__282; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__283; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__284; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__285; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__286; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__287; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__288; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__290; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__291; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__292; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__293; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__294; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__295; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__296 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDatas = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__297; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__298; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__299; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__300; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__301; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__302; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__303; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__304; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__305; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__306; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__307; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__308; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__309; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__310; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__311; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__312; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__313; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__314 } -> dtb__300
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDepthTbl = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__315; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__316; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__317; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__318; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__319; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__320; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__321; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__322; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__323; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__324; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__325; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__326; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__327; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__328; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__329; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__330; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__331; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__332 } -> dtb__327
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__333; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__334; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__335; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__336; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__337; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__338; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__339; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__340; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__341; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__342; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__343; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__344; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__345; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__346; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__347; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__348; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__349; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__350 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__333; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__334; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__335; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__336; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__337; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__338; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__339; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__340; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__341; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__342; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__343; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__344; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__345; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__347; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__348; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__349; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__350 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decGoals = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__351; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__352; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__353; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__354; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__355; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__356; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__357; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__358; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__359; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__360; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__361; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__362; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__363; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__364; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__365; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__366; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__367; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__368 } -> dtb__356
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decInsts = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__369; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__370; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__371; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__372; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__373; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__374; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__375; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__376; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__377; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__378; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__379; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__380; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__381; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__382; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__383; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__384; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__385; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__386 } -> (dtb__375).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsList
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decInstsFamily = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__387; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__388; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__389; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__390; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__391; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__392; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__393; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__394; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__395; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__396; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__397; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__398; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__399; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__400; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__401; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__402; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__403; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__404 } -> ((v_Vuna_dCompiler_dElab_dTypes_dinstStoreFamily dtb__393) mc1)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dbucketCount = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__405, dtb__406) -> ((Base_dList.v_Base_dList_dlength (Base_dPair.v_Base_dPair_dsecondOf dtb__405)) + (v_Vuna_dCompiler_dElab_dTypes_dbucketCount dtb__406))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dinstNamesEq = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__407, dtb__408) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__409, dtb__410) -> (if (dtb__407 = dtb__409) then ((v_Vuna_dCompiler_dElab_dTypes_dinstNamesEq dtb__408) dtb__410) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__411, dtb__412) -> false
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dallBucketsMatch = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__413, dtb__414) -> (match dtb__413 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__415; Base_dPair.f_Base_dPair_dPair_second = dtb__416 } -> (if ((v_Vuna_dCompiler_dElab_dTypes_dinstNamesEq ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtInstName) dtb__416)) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtInstName) ((Base_dList.v_Base_dList_dfilter (fun i -> ((v_Vuna_dCompiler_dElab_dTypes_dinstFamilyOf i) = dtb__415))) mc0))) then ((v_Vuna_dCompiler_dElab_dTypes_dallBucketsMatch mc0) dtb__414) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decInstsAudit = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__417; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__418; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__419; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__420; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__421; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__422; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__423; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__424; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__425; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__426; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__427; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__428; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__429; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__430; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__431; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__432; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__433; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__434 } -> ((fun pairs -> ((fun list -> (if ((v_Vuna_dCompiler_dElab_dTypes_dbucketCount pairs) = (Base_dList.v_Base_dList_dlength list)) then ((v_Vuna_dCompiler_dElab_dTypes_dallBucketsMatch list) pairs) else false)) (dtb__423).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsList)) ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dString.v_Eq_uString) (dtb__423).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decClasses = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__435; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__436; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__437; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__438; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__439; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__440; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__441; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__442; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__443; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__444; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__445; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__446; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__447; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__448; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__449; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__450; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__451; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__452 } -> dtb__442
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decAddGoal = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__453; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__454; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__455; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__456; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__457; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__458; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__459; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__460; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__461; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__462; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__463; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__464; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__465; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__466; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__467; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__468; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__469; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__470 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__453; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__454; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__455; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__456; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__457; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = ((Base_dList.v_Base_dList_dappend dtb__458) (Base_dList.C_Base_dList_dList_Cons (mc1, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__459; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__460; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__461; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__462; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__463; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__464; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__465; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__466; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__467; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__468; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__469; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__470 }
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dhasInstName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__471, dtb__472) -> (if ((v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__471) = mc0) then true else ((v_Vuna_dCompiler_dElab_dTypes_dhasInstName mc0) dtb__472))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decAddInstRaw = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__473; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__474; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__475; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__476; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__477; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__478; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__479; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__480; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__481; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__482; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__483; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__484; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__485; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__486; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__487; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__488; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__489; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__490 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__473; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__474; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__475; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__476; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__477; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__478; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = ((v_Vuna_dCompiler_dElab_dTypes_dinstStorePush dtb__479) mc1); f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__480; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__481; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__482; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__483; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__484; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__485; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__486; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__487; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__488; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__489; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__490 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decAddInst = (fun ec i -> (if ((v_Vuna_dCompiler_dElab_dTypes_dhasInstName (v_Vuna_dCompiler_dElab_dTypes_ddtInstName i)) (v_Vuna_dCompiler_dElab_dTypes_decInsts ec)) then ec else ((v_Vuna_dCompiler_dElab_dTypes_decAddInstRaw ec) i)))

let v_Vuna_dCompiler_dElab_dTypes_decAddClass = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__491; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__492; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__493; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__494; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__495; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__496; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__497; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__498; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__499; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__500; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__501; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__502; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__503; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__504; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__505; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__506; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__507; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__508 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__491; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__492; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__493; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__494; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__495; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__496; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__497; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = ((Base_dList.v_Base_dList_dappend dtb__498) (Base_dList.C_Base_dList_dList_Cons (mc1, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__499; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__500; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__501; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__502; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__503; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__504; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__505; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__506; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__507; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__508 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decConstraints = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__509; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__510; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__511; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__512; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__513; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__514; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__515; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__516; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__517; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__518; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__519; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__520; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__521; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__522; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__523; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__524; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__525; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__526 } -> dtb__517
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutConstraints = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__527; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__528; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__529; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__530; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__531; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__532; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__533; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__534; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__535; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__536; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__537; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__538; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__539; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__540; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__541; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__542; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__543; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__544 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__527; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__528; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__529; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__530; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__531; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__532; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__533; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__534; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__536; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__537; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__538; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__539; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__540; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__541; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__542; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__543; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__544 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPending = (fun ec -> (match (v_Vuna_dCompiler_dElab_dTypes_decConstraints ec) with
  | { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = dtb__545; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__546; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__547 } -> dtb__545
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutPending = (fun ec pending2 -> (match (v_Vuna_dCompiler_dElab_dTypes_decConstraints ec) with
  | { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = dtb__548; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__549; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__550 } -> ((v_Vuna_dCompiler_dElab_dTypes_decPutConstraints ec) { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = pending2; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__549; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__550 })
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decAddConstraint = (fun ec kind meta dom span depth -> (match (v_Vuna_dCompiler_dElab_dTypes_decConstraints ec) with
  | { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = dtb__551; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__552; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__553 } -> ((v_Vuna_dCompiler_dElab_dTypes_decPutConstraints ec) { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = ((Base_dList.v_Base_dList_dappend dtb__551) (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__552; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = kind; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = meta; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dom; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = span; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = depth }, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = (dtb__552 + 1); f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__553 })
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dassocIntLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__554, dtb__555) -> (match dtb__554 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__556; Base_dPair.f_Base_dPair_dPair_second = dtb__557 } -> (if (dtb__556 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__557)) else ((v_Vuna_dCompiler_dElab_dTypes_dassocIntLookup mc0) dtb__555))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decTriedAt = (fun ec cid -> (match (v_Vuna_dCompiler_dElab_dTypes_decConstraints ec) with
  | { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = dtb__558; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__559; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__560 } -> ((v_Vuna_dCompiler_dElab_dTypes_dassocIntLookup cid) dtb__560)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dassocIntSet = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__561, dtb__562) -> (match dtb__561 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__563; Base_dPair.f_Base_dPair_dPair_second = dtb__564 } -> (if (dtb__563 = mc0) then (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__563; Base_dPair.f_Base_dPair_dPair_second = mc1 }, dtb__562)) else (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__563; Base_dPair.f_Base_dPair_dPair_second = dtb__564 }, (((v_Vuna_dCompiler_dElab_dTypes_dassocIntSet mc0) mc1) dtb__562))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decRecordTried = (fun ec cid epoch -> (match (v_Vuna_dCompiler_dElab_dTypes_decConstraints ec) with
  | { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = dtb__565; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__566; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__567 } -> ((v_Vuna_dCompiler_dElab_dTypes_decPutConstraints ec) { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = dtb__565; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__566; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = (((v_Vuna_dCompiler_dElab_dTypes_dassocIntSet cid) epoch) dtb__567) })
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decEmpty = { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = 0; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = v_Vuna_dCompiler_dElab_dTypes_dinstStoreEmpty; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = v_Vuna_dCompiler_dElab_dTypes_dcsEmpty; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = false; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = false }

let v_Vuna_dCompiler_dElab_dTypes_decSolTbl = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__568; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__569; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__570; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__571; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__572; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__573; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__574; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__575; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__576; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__577; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__578; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__579; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__580; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__581; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__582; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__583; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__584; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__585 } -> dtb__579
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutSolsRaw = (fun mc0 mc1 mc2 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__586; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__587; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__588; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__589; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__590; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__591; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__592; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__593; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__594; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__595; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__596; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__597; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__598; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__599; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__600; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__601; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__602; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__603 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__586; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__588; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__589; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__590; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__591; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__592; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__593; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__594; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__595; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__596; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = mc2; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__598; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__599; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__600; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__601; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__602; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__603 }
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__604, dtb__605) -> (match dtb__604 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__606; Base_dPair.f_Base_dPair_dPair_second = dtb__607 } -> (if (dtb__606 = mc0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__606; Base_dPair.f_Base_dPair_dPair_second = dtb__607 }, ((v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId mc0) dtb__605))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dsolsDelta = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__608, dtb__609) -> (match dtb__608 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__610; Base_dPair.f_Base_dPair_dPair_second = dtb__611 } -> ((v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId dtb__610) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutSols = (fun ec sols2 -> ((fun delta -> ((fun soltbl2 -> (((v_Vuna_dCompiler_dElab_dTypes_decPutSolsRaw ec) sols2) soltbl2)) (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dInt.v_Hashable_uInt) delta) (v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)))) ((v_Vuna_dCompiler_dElab_dTypes_dsolsDelta (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) sols2)))

let rec v_Vuna_dCompiler_dElab_dTypes_dmemDataNameIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__612, dtb__613) -> (if ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__612) = mc0) then true else ((v_Vuna_dCompiler_dElab_dTypes_dmemDataNameIn mc0) dtb__613))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decAddDef = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__614; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__615; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__616; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__617; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__618; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__619; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__620; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__621; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__622; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__623; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__624; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__625; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__626; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__627; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__628; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__629; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__630; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__631 } -> ((fun delta -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__614; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__615; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = (Base_dList.C_Base_dList_dList_Cons (mc1, dtb__616)); f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__617; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__618; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__619; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__620; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__621; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__622; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = delta; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__624; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__625; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__626; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__627; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__628; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__629; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__630; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__631 }) (if ((v_Vuna_dCompiler_dElab_dTypes_dmemDataNameIn (Base_dPair.v_Base_dPair_dfirstOf mc1)) dtb__617) then dtb__623 else ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) (Base_dPair.v_Base_dPair_dfirstOf mc1)) (Base_dPair.v_Base_dPair_dsecondOf mc1)) dtb__623)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddataCtorPairs = (fun d -> ((Base_dList.v_Base_dList_dmap (fun c -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dPair.f_Base_dPair_dPair_second = c })) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

let v_Vuna_dCompiler_dElab_dTypes_decAddData = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__632; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__633; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__634; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__635; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__636; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__637; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__638; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__639; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__640; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__641; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__642; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__643; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__644; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__645; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__646; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__647; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__648; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__649 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__632; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__633; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__634; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = ((Base_dList.v_Base_dList_dappend dtb__635) (Base_dList.C_Base_dList_dList_Cons (mc1, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__636; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__637; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__638; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__639; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__640; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__641; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__642; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__643; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__644; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__645; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__646; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) (v_Vuna_dCompiler_dElab_dTypes_ddataCtorPairs mc1)) dtb__647); f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__648; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = (if (v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear mc1) then true else dtb__649) }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas = (fun datas -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTypes_ddataCtorPairs) datas)) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dElab_dTypes_decPutCtorTbl = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__650; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__651; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__652; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__653; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__654; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__655; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__656; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__657; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__658; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__659; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__660; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__661; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__662; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__663; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__664; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__665; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__666; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__667 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__650; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__651; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__652; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__653; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__654; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__655; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__656; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__657; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__658; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__659; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__660; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__661; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__662; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__663; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__664; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__666; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__667 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDefVals = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__668; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__669; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__670; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__671; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__672; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__673; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__674; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__675; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__676; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__677; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__678; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__679; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__680; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__681; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__682; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__683; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__684; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__685 } -> dtb__684
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decSolsP = (fun ec -> ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsOf (v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) (v_Vuna_dCompiler_dElab_dTypes_decDepthTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decDefVals ec)))

let v_Vuna_dCompiler_dElab_dTypes_decHasLinear = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__686; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__687; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__688; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__689; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__690; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__691; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__692; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__693; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__694; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__695; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__696; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__697; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__698; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__699; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__700; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__701; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__702; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__703 } -> dtb__703
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_ddatasHaveLinear = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__704, dtb__705) -> (if (v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear dtb__704) then true else (v_Vuna_dCompiler_dElab_dTypes_ddatasHaveLinear dtb__705))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutDefVals = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__706; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__707; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__708; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__709; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__710; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__711; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__712; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__713; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__714; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__715; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__716; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__717; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__718; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__719; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__720; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__721; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__722; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__723 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__706; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__707; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__708; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__709; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__710; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__711; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__712; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__713; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__714; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__715; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__716; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__717; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__718; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__719; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__720; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__721; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__723 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctxDepth = (fun ctx -> (Base_dList.v_Base_dList_dlength (ctx).f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems))

let v_Vuna_dCompiler_dElab_dTypes_dctxBind = (fun mc0 mc1 mc2 -> (match mc2 with
  | { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__724; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__725 } -> { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }, dtb__724)); f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__725 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctxBindValue = (fun name dom ctx -> (((v_Vuna_dCompiler_dElab_dTypes_dctxBind name) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dom)) ctx))

let v_Vuna_dCompiler_dElab_dTypes_dctxRefine = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__726; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__727 } -> { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__726; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = ((Base_dList.v_Base_dList_dappend dtb__727) mc1) }
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__728, dtb__729) -> (match dtb__728 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__730; Base_dPair.f_Base_dPair_dPair_second = dtb__731 } -> (if (dtb__730 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = mc2; Base_dPair.f_Base_dPair_dPair_second = dtb__731 })) else (((v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt mc0) dtb__729) (mc2 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctxLookup = (fun name ctx -> (((v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt name) (ctx).f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems) 0))

let rec v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__732, dtb__733) -> (match dtb__732 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__734; Base_dPair.f_Base_dPair_dPair_second = dtb__735 } -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__734, ((mc2 - mc1) - 1), Base_dList.C_Base_dList_dList_Nil)))), (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__733) (mc1 + 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctxEnv = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__736; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__737 } -> (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__736) 0) (Base_dList.v_Base_dList_dlength dtb__736))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_drefineLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__738, dtb__739) -> (match dtb__738 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__740; Base_dPair.f_Base_dPair_dPair_second = dtb__741 } -> (if (dtb__740 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__741)) else ((v_Vuna_dCompiler_dElab_dTypes_drefineLookup mc0) dtb__739))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_drefineValue = (fun refs fuel v -> (if (fuel <= 0) then v else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__742) -> (match dtb__742 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__743, dtb__744, dtb__745) -> ((fun sp2 -> (match ((v_Vuna_dCompiler_dElab_dTypes_drefineLookup dtb__744) refs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__746) -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__746)) sp2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__743, dtb__744, sp2))))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__745))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__747, dtb__748) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__747, ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__748)))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__749, dtb__750) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__749, ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__750)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__751, dtb__752) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__751), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__752)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__753, dtb__754) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__753), dtb__754))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__755, dtb__756, dtb__757) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__755), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__756), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__757)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__758, dtb__759) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__758, ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__759)))
  | _ -> v
)))

let v_Vuna_dCompiler_dElab_dTypes_devalCtx = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__760; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__761 } -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue dtb__761) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel)) (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__760) 0) (Base_dList.v_Base_dList_dlength dtb__760)))) mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue = (fun mc0 mc1 mc2 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__762; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__763 } -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue dtb__763) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel)) (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__762) 0) (Base_dList.v_Base_dList_dlength dtb__762)))) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) (mc1 + 1)) mc2))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_demptyCtx = { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = Base_dList.C_Base_dList_dList_Nil }

let v_Vuna_dCompiler_dElab_dTypes_derrAt = (fun sp msg -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": "; msg]))))

let v_Vuna_dCompiler_dElab_dTypes_dnewMeta = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__764; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__765; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__766; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__767; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__768; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__769; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__770; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__771; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__772; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__773; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__774; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__775; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__776; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__777; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__778; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__779; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__780; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__781 } -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__764)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = (dtb__764 + 1); f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__765; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__766; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__767; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__764; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0) }, dtb__768)); f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__769; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__770; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__771; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__772; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__773; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__774; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__775; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dInt.v_Hashable_uInt) dtb__764) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0)) dtb__776); f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__777; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__778; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__779; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__780; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__781 } }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dnewHoleMeta = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc1 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__782; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__783; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__784; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__785; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__786; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__787; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__788; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__789; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__790; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__791; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__792; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__793; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__794; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__795; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__796; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__797; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__798; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__799 } -> ((fun goal -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__782)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = (dtb__782 + 1); f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__783; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__784; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__785; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__782; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0) }, dtb__786)); f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = ((Base_dList.v_Base_dList_dappend dtb__787) (Base_dList.C_Base_dList_dList_Cons (goal, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__788; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__789; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__790; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__791; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__792; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__793; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dInt.v_Hashable_uInt) dtb__782) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0)) dtb__794); f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__795; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__796; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__797; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__798; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__799 } }) { f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalMeta = dtb__782; f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalSpan = mc2; f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalType = mc3; f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalCtx = (mc0).f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems; f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalName = mc4 })
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dforceVal = (fun ec v -> ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__800; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__801; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__802; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__803; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__804; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__805; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__806; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__807; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals = dtb__808; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__809 } -> dtb__800
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__810; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__811; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__812; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__813; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__814; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__815; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__816; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__817; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals = dtb__818; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__819 } -> dtb__811
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__820; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__821; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__822; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__823; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__824; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__825; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__826; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__827; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals = dtb__828; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__829 } -> dtb__822
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgSols = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__830; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__831; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__832; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__833; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__834; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__835; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__836; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__837; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals = dtb__838; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__839 } -> dtb__833
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__840; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__841; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__842; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__843; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__844; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__845; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__846; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__847; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals = dtb__848; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__849 } -> dtb__844
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__850; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__851; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__852; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__853; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__854; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__855; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__856; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__857; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals = dtb__858; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__859 } -> dtb__855
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__860; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__861; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__862; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__863; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__864; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__865; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__866; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__867; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals = dtb__868; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__869 } -> dtb__866
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dsolsToTbl = (fun sols -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dInt.v_Hashable_uInt) sols) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dElab_dTypes_decPutDefTbl = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__870; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__871; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__872; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__873; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__874; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__875; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__876; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__877; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__878; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__879; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__880; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__881; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__882; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__883; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__884; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__885; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__886; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__887 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__870; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__871; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__872; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__873; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__874; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__875; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__876; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__877; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__878; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__880; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__881; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__882; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__883; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__884; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__885; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__886; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__887 }
  | _ -> failwith "DT: impossible branch"
))
