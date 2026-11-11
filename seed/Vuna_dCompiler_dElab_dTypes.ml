open Vuna_runtime
type t_Vuna_dCompiler_dElab_dTypes_dDtDef = C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef of (string) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe) | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom of (string) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe) | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern of (string) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (string) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe)
and t_Vuna_dCompiler_dElab_dTypes_dDtCtor = { f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName : string; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily : string; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe }
and t_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta = { f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName : string; f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex : int; f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldType : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dElab_dTypes_dDtData = { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName : string; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors : t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear : bool; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dReprTier; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields : t_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord : bool }
and t_Vuna_dCompiler_dElab_dTypes_dDtGoal = { f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalMeta : int; f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan; f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalType : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue; f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalCtx : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalName : string }
and t_Vuna_dCompiler_dElab_dTypes_dDtClass = { f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassName : string; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dElab_dTypes_dDtInst = { f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstName : string; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe }
and t_Vuna_dCompiler_dElab_dTypes_dInstStore = { f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsList : t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily : (string, t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap }
and t_Vuna_dCompiler_dElab_dTypes_dConstraintKind = C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkDict | C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkRow
and t_Vuna_dCompiler_dElab_dTypes_dConstraint = { f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId : int; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind : t_Vuna_dCompiler_dElab_dTypes_dConstraintKind; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta : int; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth : int }
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
  | { f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = dtb__59; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = dtb__60; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = dtb__61; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = dtb__62; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan = dtb__63 } -> dtb__59
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = dtb__64; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = dtb__65; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = dtb__66; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = dtb__67; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan = dtb__68 } -> dtb__65
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = dtb__69; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = dtb__70; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = dtb__71; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = dtb__72; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan = dtb__73 } -> dtb__71
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtCtorType = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = dtb__74; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = dtb__75; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = dtb__76; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = dtb__77; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan = dtb__78 } -> dtb__77
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__79; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__80; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__81; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__82; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__83; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__84; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__85; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__86; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__87 } -> dtb__79
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__88; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__89; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__90; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__91; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__92; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__93; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__94; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__95; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__96 } -> dtb__90
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataKind = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__97; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__98; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__99; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__100; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__101; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__102; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__103; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__104; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__105 } -> dtb__100
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataViaClasses = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__106; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__107; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__108; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__109; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__110; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__111; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__112; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__113; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__114 } -> dtb__110
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataRepr = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__115; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__116; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__117; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__118; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__119; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__120; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__121; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__122; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__123 } -> dtb__121
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataFields = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__124; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__125; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__126; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__127; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__128; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__129; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__130; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__131; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__132 } -> dtb__131
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataIsRecord = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__133; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__134; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__135; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__136; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__137; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__138; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__139; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__140; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__141 } -> dtb__141
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__142; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__143; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__144; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__145; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__146; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__147; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__148; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__149; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__150 } -> dtb__147
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtClassName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassName = dtb__151; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams = dtb__152; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods = dtb__153; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys = dtb__154 } -> dtb__151
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtInstName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstName = dtb__155; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele = dtb__156; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx = dtb__157; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead = dtb__158; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan = dtb__159 } -> dtb__155
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__160) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__160; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__161, dtb__162, dtb__163) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__164) -> (match dtb__164 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__165; Base_dPair.f_Base_dPair_dPair_second = dtb__166 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__165; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__166) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__162; Base_dPair.f_Base_dPair_dPair_second = dtb__163 }, Base_dList.C_Base_dList_dList_Nil))) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp dtb__161))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dElab_dTypes_dinstFamilyOf = (fun i -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__167) -> (match dtb__167 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__168; Base_dPair.f_Base_dPair_dPair_second = dtb__169 } -> dtb__168
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp (i).f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead)))

let v_Vuna_dCompiler_dElab_dTypes_dinstStoreEmpty = { f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsList = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil) }

let v_Vuna_dCompiler_dElab_dTypes_dinstStorePush = (fun store i -> ((fun fam -> ((fun bucket -> { f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsList = ((Base_dList.v_Base_dList_dappend (store).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsList) (Base_dList.C_Base_dList_dList_Cons (i, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily = ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) fam) ((Base_dList.v_Base_dList_dappend bucket) (Base_dList.C_Base_dList_dList_Cons (i, Base_dList.C_Base_dList_dList_Nil)))) (store).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily) }) (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) fam) (store).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__170) -> dtb__170
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dElab_dTypes_dinstFamilyOf i)))

let rec v_Vuna_dCompiler_dElab_dTypes_dinstStoreOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__171, dtb__172) -> ((v_Vuna_dCompiler_dElab_dTypes_dinstStorePush (v_Vuna_dCompiler_dElab_dTypes_dinstStoreOf dtb__172)) dtb__171)
  | Base_dList.C_Base_dList_dList_Nil -> v_Vuna_dCompiler_dElab_dTypes_dinstStoreEmpty
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dinstStoreFamily = (fun store fam -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) fam) (store).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__173) -> dtb__173
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dcsEmpty = { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = 0; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = Base_dList.C_Base_dList_dList_Nil }

let v_Vuna_dCompiler_dElab_dTypes_decPutNext = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__174; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__175; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__176; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__177; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__178; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__179; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__180; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__181; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__182; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__183; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__184; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__185; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__186; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__187; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__188; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__189; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__190; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__191 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__175; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__176; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__177; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__178; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__179; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__180; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__181; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__182; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__183; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__184; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__185; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__186; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__187; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__188; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__189; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__190; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__191 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutClausesTbl = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__192; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__193; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__194; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__195; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__196; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__197; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__198; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__199; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__200; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__201; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__202; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__203; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__204; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__205; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__206; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__207; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__208; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__209 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__192; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__193; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__194; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__195; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__196; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__197; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__198; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__199; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__200; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__201; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__202; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__203; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__204; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__205; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__207; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__208; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__209 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decNext = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__210; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__211; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__212; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__213; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__214; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__215; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__216; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__217; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__218; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__219; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__220; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__221; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__222; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__223; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__224; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__225; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__226; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__227 } -> dtb__210
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decSols = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__228; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__229; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__230; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__231; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__232; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__233; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__234; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__235; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__236; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__237; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__238; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__239; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__240; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__241; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__242; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__243; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__244; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__245 } -> dtb__229
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDefs = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__246; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__247; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__248; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__249; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__250; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__251; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__252; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__253; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__254; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__255; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__256; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__257; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__258; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__259; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__260; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__261; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__262; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__263 } -> (Base_dList.v_Base_dList_dreverse dtb__248)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDefTbl = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__264; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__265; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__266; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__267; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__268; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__269; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__270; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__271; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__272; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__273; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__274; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__275; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__276; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__277; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__278; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__279; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__280; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__281 } -> dtb__273
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__282; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__283; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__284; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__285; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__286; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__287; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__288; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__289; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__290; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__291; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__292; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__293; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__294; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__295; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__296; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__297; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__298; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__299 } -> dtb__292
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__300; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__301; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__302; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__303; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__304; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__305; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__306; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__307; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__308; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__309; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__310; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__311; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__312; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__313; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__314; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__315; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__316; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__317 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__300; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__301; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__302; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__303; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__304; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__305; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__306; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__307; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__308; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__309; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__311; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__312; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__313; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__314; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__315; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__316; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__317 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDatas = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__318; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__319; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__320; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__321; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__322; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__323; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__324; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__325; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__326; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__327; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__328; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__329; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__330; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__331; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__332; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__333; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__334; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__335 } -> dtb__321
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDepthTbl = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__336; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__337; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__338; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__339; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__340; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__341; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__342; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__343; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__344; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__345; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__346; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__347; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__348; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__349; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__350; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__351; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__352; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__353 } -> dtb__348
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__354; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__355; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__356; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__357; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__358; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__359; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__360; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__361; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__362; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__363; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__364; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__365; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__366; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__367; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__368; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__369; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__370; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__371 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__354; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__355; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__356; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__357; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__358; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__359; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__360; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__361; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__362; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__363; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__364; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__365; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__366; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__368; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__369; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__370; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__371 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decGoals = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__372; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__373; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__374; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__375; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__376; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__377; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__378; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__379; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__380; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__381; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__382; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__383; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__384; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__385; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__386; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__387; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__388; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__389 } -> dtb__377
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decInsts = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__390; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__391; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__392; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__393; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__394; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__395; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__396; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__397; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__398; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__399; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__400; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__401; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__402; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__403; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__404; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__405; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__406; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__407 } -> (dtb__396).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsList
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decInstsFamily = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__408; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__409; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__410; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__411; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__412; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__413; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__414; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__415; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__416; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__417; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__418; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__419; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__420; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__421; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__422; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__423; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__424; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__425 } -> ((v_Vuna_dCompiler_dElab_dTypes_dinstStoreFamily dtb__414) mc1)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dbucketCount = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__426, dtb__427) -> ((Base_dList.v_Base_dList_dlength (Base_dPair.v_Base_dPair_dsecondOf dtb__426)) + (v_Vuna_dCompiler_dElab_dTypes_dbucketCount dtb__427))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dinstNamesEq = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__428, dtb__429) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__430, dtb__431) -> (if (dtb__428 = dtb__430) then ((v_Vuna_dCompiler_dElab_dTypes_dinstNamesEq dtb__429) dtb__431) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__432, dtb__433) -> false
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dallBucketsMatch = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__434, dtb__435) -> (match dtb__434 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__436; Base_dPair.f_Base_dPair_dPair_second = dtb__437 } -> (if ((v_Vuna_dCompiler_dElab_dTypes_dinstNamesEq ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtInstName) dtb__437)) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtInstName) ((Base_dList.v_Base_dList_dfilter (fun i -> ((v_Vuna_dCompiler_dElab_dTypes_dinstFamilyOf i) = dtb__436))) mc0))) then ((v_Vuna_dCompiler_dElab_dTypes_dallBucketsMatch mc0) dtb__435) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decInstsAudit = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__438; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__439; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__440; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__441; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__442; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__443; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__444; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__445; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__446; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__447; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__448; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__449; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__450; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__451; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__452; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__453; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__454; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__455 } -> ((fun pairs -> ((fun list -> (if ((v_Vuna_dCompiler_dElab_dTypes_dbucketCount pairs) = (Base_dList.v_Base_dList_dlength list)) then ((v_Vuna_dCompiler_dElab_dTypes_dallBucketsMatch list) pairs) else false)) (dtb__444).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsList)) ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dString.v_Eq_uString) (dtb__444).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decClasses = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__456; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__457; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__458; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__459; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__460; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__461; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__462; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__463; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__464; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__465; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__466; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__467; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__468; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__469; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__470; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__471; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__472; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__473 } -> dtb__463
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decAddGoal = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__474; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__475; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__476; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__477; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__478; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__479; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__480; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__481; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__482; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__483; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__484; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__485; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__486; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__487; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__488; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__489; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__490; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__491 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__474; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__475; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__476; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__477; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__478; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = ((Base_dList.v_Base_dList_dappend dtb__479) (Base_dList.C_Base_dList_dList_Cons (mc1, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__480; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__481; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__482; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__483; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__484; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__485; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__486; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__487; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__488; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__489; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__490; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__491 }
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dhasInstName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__492, dtb__493) -> (if ((v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__492) = mc0) then true else ((v_Vuna_dCompiler_dElab_dTypes_dhasInstName mc0) dtb__493))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decAddInstRaw = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__494; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__495; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__496; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__497; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__498; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__499; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__500; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__501; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__502; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__503; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__504; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__505; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__506; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__507; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__508; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__509; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__510; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__511 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__494; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__495; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__496; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__497; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__498; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__499; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = ((v_Vuna_dCompiler_dElab_dTypes_dinstStorePush dtb__500) mc1); f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__501; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__502; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__503; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__504; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__505; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__506; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__507; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__508; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__509; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__510; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__511 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decAddInst = (fun ec i -> (if ((v_Vuna_dCompiler_dElab_dTypes_dhasInstName (v_Vuna_dCompiler_dElab_dTypes_ddtInstName i)) (v_Vuna_dCompiler_dElab_dTypes_decInsts ec)) then ec else ((v_Vuna_dCompiler_dElab_dTypes_decAddInstRaw ec) i)))

let v_Vuna_dCompiler_dElab_dTypes_decAddClass = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__512; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__513; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__514; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__515; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__516; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__517; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__518; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__519; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__520; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__521; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__522; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__523; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__524; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__525; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__526; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__527; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__528; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__529 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__512; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__513; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__514; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__515; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__516; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__517; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__518; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = ((Base_dList.v_Base_dList_dappend dtb__519) (Base_dList.C_Base_dList_dList_Cons (mc1, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__520; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__521; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__522; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__523; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__524; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__525; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__526; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__527; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__528; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__529 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decConstraints = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__530; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__531; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__532; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__533; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__534; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__535; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__536; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__537; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__538; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__539; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__540; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__541; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__542; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__543; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__544; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__545; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__546; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__547 } -> dtb__538
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutConstraints = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__548; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__549; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__550; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__551; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__552; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__553; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__554; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__555; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__556; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__557; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__558; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__559; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__560; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__561; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__562; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__563; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__564; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__565 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__548; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__549; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__550; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__551; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__552; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__553; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__554; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__555; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__557; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__558; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__559; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__560; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__561; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__562; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__563; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__564; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__565 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPending = (fun ec -> (match (v_Vuna_dCompiler_dElab_dTypes_decConstraints ec) with
  | { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = dtb__566; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__567; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__568 } -> dtb__566
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutPending = (fun ec pending2 -> (match (v_Vuna_dCompiler_dElab_dTypes_decConstraints ec) with
  | { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = dtb__569; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__570; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__571 } -> ((v_Vuna_dCompiler_dElab_dTypes_decPutConstraints ec) { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = pending2; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__570; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__571 })
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decAddConstraint = (fun ec kind meta dom span depth -> (match (v_Vuna_dCompiler_dElab_dTypes_decConstraints ec) with
  | { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = dtb__572; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__573; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__574 } -> ((v_Vuna_dCompiler_dElab_dTypes_decPutConstraints ec) { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = ((Base_dList.v_Base_dList_dappend dtb__572) (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__573; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = kind; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = meta; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dom; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = span; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = depth }, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = (dtb__573 + 1); f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__574 })
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dassocIntLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__575, dtb__576) -> (match dtb__575 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__577; Base_dPair.f_Base_dPair_dPair_second = dtb__578 } -> (if (dtb__577 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__578)) else ((v_Vuna_dCompiler_dElab_dTypes_dassocIntLookup mc0) dtb__576))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decTriedAt = (fun ec cid -> (match (v_Vuna_dCompiler_dElab_dTypes_decConstraints ec) with
  | { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = dtb__579; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__580; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__581 } -> ((v_Vuna_dCompiler_dElab_dTypes_dassocIntLookup cid) dtb__581)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dassocIntSet = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__582, dtb__583) -> (match dtb__582 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__584; Base_dPair.f_Base_dPair_dPair_second = dtb__585 } -> (if (dtb__584 = mc0) then (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__584; Base_dPair.f_Base_dPair_dPair_second = mc1 }, dtb__583)) else (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__584; Base_dPair.f_Base_dPair_dPair_second = dtb__585 }, (((v_Vuna_dCompiler_dElab_dTypes_dassocIntSet mc0) mc1) dtb__583))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decRecordTried = (fun ec cid epoch -> (match (v_Vuna_dCompiler_dElab_dTypes_decConstraints ec) with
  | { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = dtb__586; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__587; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__588 } -> ((v_Vuna_dCompiler_dElab_dTypes_decPutConstraints ec) { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = dtb__586; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__587; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = (((v_Vuna_dCompiler_dElab_dTypes_dassocIntSet cid) epoch) dtb__588) })
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decEmpty = { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = 0; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = v_Vuna_dCompiler_dElab_dTypes_dinstStoreEmpty; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = v_Vuna_dCompiler_dElab_dTypes_dcsEmpty; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = false; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = false }

let v_Vuna_dCompiler_dElab_dTypes_decSolTbl = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__589; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__590; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__591; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__592; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__593; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__594; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__595; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__596; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__597; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__598; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__599; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__600; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__601; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__602; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__603; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__604; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__605; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__606 } -> dtb__600
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutSolsRaw = (fun mc0 mc1 mc2 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__607; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__608; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__609; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__610; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__611; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__612; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__613; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__614; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__615; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__616; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__617; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__618; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__619; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__620; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__621; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__622; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__623; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__624 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__607; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__609; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__610; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__611; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__612; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__613; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__614; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__615; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__616; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__617; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = mc2; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__619; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__620; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__621; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__622; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__623; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__624 }
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__625, dtb__626) -> (match dtb__625 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__627; Base_dPair.f_Base_dPair_dPair_second = dtb__628 } -> (if (dtb__627 = mc0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__627; Base_dPair.f_Base_dPair_dPair_second = dtb__628 }, ((v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId mc0) dtb__626))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dsolsDelta = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__629, dtb__630) -> (match dtb__629 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__631; Base_dPair.f_Base_dPair_dPair_second = dtb__632 } -> ((v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId dtb__631) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutSols = (fun ec sols2 -> ((fun delta -> ((fun soltbl2 -> (((v_Vuna_dCompiler_dElab_dTypes_decPutSolsRaw ec) sols2) soltbl2)) (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dInt.v_Hashable_uInt) delta) (v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)))) ((v_Vuna_dCompiler_dElab_dTypes_dsolsDelta (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) sols2)))

let rec v_Vuna_dCompiler_dElab_dTypes_dmemDataNameIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__633, dtb__634) -> (if ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__633) = mc0) then true else ((v_Vuna_dCompiler_dElab_dTypes_dmemDataNameIn mc0) dtb__634))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decAddDef = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__635; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__636; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__637; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__638; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__639; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__640; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__641; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__642; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__643; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__644; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__645; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__646; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__647; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__648; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__649; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__650; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__651; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__652 } -> ((fun delta -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__635; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__636; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = (Base_dList.C_Base_dList_dList_Cons (mc1, dtb__637)); f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__638; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__639; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__640; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__641; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__642; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__643; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = delta; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__645; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__646; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__647; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__648; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__649; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__650; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__651; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__652 }) (if ((v_Vuna_dCompiler_dElab_dTypes_dmemDataNameIn (Base_dPair.v_Base_dPair_dfirstOf mc1)) dtb__638) then dtb__644 else ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) (Base_dPair.v_Base_dPair_dfirstOf mc1)) (Base_dPair.v_Base_dPair_dsecondOf mc1)) dtb__644)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddataCtorPairs = (fun d -> ((Base_dList.v_Base_dList_dmap (fun c -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dPair.f_Base_dPair_dPair_second = c })) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

let v_Vuna_dCompiler_dElab_dTypes_decAddData = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__653; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__654; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__655; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__656; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__657; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__658; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__659; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__660; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__661; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__662; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__663; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__664; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__665; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__666; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__667; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__668; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__669; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__670 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__653; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__654; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__655; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = ((Base_dList.v_Base_dList_dappend dtb__656) (Base_dList.C_Base_dList_dList_Cons (mc1, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__657; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__658; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__659; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__660; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__661; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__662; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__663; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__664; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__665; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__666; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__667; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) (v_Vuna_dCompiler_dElab_dTypes_ddataCtorPairs mc1)) dtb__668); f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__669; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = (if (v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear mc1) then true else dtb__670) }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas = (fun datas -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTypes_ddataCtorPairs) datas)) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dElab_dTypes_decPutCtorTbl = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__671; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__672; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__673; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__674; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__675; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__676; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__677; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__678; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__679; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__680; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__681; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__682; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__683; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__684; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__685; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__686; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__687; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__688 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__671; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__672; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__673; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__674; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__675; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__676; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__677; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__678; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__679; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__680; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__681; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__682; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__683; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__684; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__685; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__687; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__688 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDefVals = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__689; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__690; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__691; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__692; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__693; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__694; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__695; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__696; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__697; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__698; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__699; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__700; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__701; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__702; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__703; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__704; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__705; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__706 } -> dtb__705
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decSolsP = (fun ec -> ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsOf (v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) (v_Vuna_dCompiler_dElab_dTypes_decDepthTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decDefVals ec)))

let v_Vuna_dCompiler_dElab_dTypes_decHasLinear = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__707; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__708; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__709; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__710; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__711; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__712; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__713; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__714; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__715; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__716; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__717; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__718; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__719; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__720; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__721; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__722; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__723; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__724 } -> dtb__724
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_ddatasHaveLinear = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__725, dtb__726) -> (if (v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear dtb__725) then true else (v_Vuna_dCompiler_dElab_dTypes_ddatasHaveLinear dtb__726))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutDefVals = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__727; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__728; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__729; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__730; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__731; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__732; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__733; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__734; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__735; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__736; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__737; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__738; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__739; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__740; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__741; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__742; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__743; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__744 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__727; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__728; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__729; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__730; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__731; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__732; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__733; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__734; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__735; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__736; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__737; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__738; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__739; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__740; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__741; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__742; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__744 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctxDepth = (fun ctx -> (Base_dList.v_Base_dList_dlength (ctx).f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems))

let v_Vuna_dCompiler_dElab_dTypes_dctxBind = (fun mc0 mc1 mc2 -> (match mc2 with
  | { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__745; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__746 } -> { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }, dtb__745)); f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__746 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctxBindValue = (fun name dom ctx -> (((v_Vuna_dCompiler_dElab_dTypes_dctxBind name) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dom)) ctx))

let v_Vuna_dCompiler_dElab_dTypes_dctxRefine = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__747; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__748 } -> { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__747; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = ((Base_dList.v_Base_dList_dappend dtb__748) mc1) }
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__749, dtb__750) -> (match dtb__749 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__751; Base_dPair.f_Base_dPair_dPair_second = dtb__752 } -> (if (dtb__751 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = mc2; Base_dPair.f_Base_dPair_dPair_second = dtb__752 })) else (((v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt mc0) dtb__750) (mc2 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctxLookup = (fun name ctx -> (((v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt name) (ctx).f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems) 0))

let rec v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__753, dtb__754) -> (match dtb__753 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__755; Base_dPair.f_Base_dPair_dPair_second = dtb__756 } -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__755, ((mc2 - mc1) - 1), Base_dList.C_Base_dList_dList_Nil)))), (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__754) (mc1 + 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctxEnv = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__757; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__758 } -> (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__757) 0) (Base_dList.v_Base_dList_dlength dtb__757))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_drefineLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__759, dtb__760) -> (match dtb__759 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__761; Base_dPair.f_Base_dPair_dPair_second = dtb__762 } -> (if (dtb__761 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__762)) else ((v_Vuna_dCompiler_dElab_dTypes_drefineLookup mc0) dtb__760))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_drefineValue = (fun refs fuel v -> (if (fuel <= 0) then v else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__763) -> (match dtb__763 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__764, dtb__765, dtb__766) -> ((fun sp2 -> (match ((v_Vuna_dCompiler_dElab_dTypes_drefineLookup dtb__765) refs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__767) -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__767)) sp2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__764, dtb__765, sp2))))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__766))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__768, dtb__769) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__768, ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__769)))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__770, dtb__771) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__770, ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__771)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__772, dtb__773) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__772), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__773)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__774, dtb__775) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__774), dtb__775))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__776, dtb__777, dtb__778) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__776), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__777), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__778)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__779, dtb__780) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__779, ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__780)))
  | _ -> v
)))

let v_Vuna_dCompiler_dElab_dTypes_devalCtx = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__781; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__782 } -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue dtb__782) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel)) (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__781) 0) (Base_dList.v_Base_dList_dlength dtb__781)))) mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue = (fun mc0 mc1 mc2 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__783; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__784 } -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue dtb__784) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel)) (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__783) 0) (Base_dList.v_Base_dList_dlength dtb__783)))) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) (mc1 + 1)) mc2))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_demptyCtx = { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = Base_dList.C_Base_dList_dList_Nil }

let v_Vuna_dCompiler_dElab_dTypes_derrAt = (fun sp msg -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_drawAt sp) msg))

let v_Vuna_dCompiler_dElab_dTypes_dnewMeta = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__785; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__786; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__787; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__788; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__789; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__790; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__791; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__792; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__793; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__794; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__795; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__796; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__797; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__798; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__799; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__800; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__801; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__802 } -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__785)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = (dtb__785 + 1); f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__786; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__787; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__788; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__785; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0) }, dtb__789)); f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__790; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__791; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__792; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__793; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__794; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__795; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__796; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dInt.v_Hashable_uInt) dtb__785) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0)) dtb__797); f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__798; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__799; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__800; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__801; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__802 } }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dnewMetaAt = (fun sp ctx ec -> ((fun p -> ((fun _u -> p) ((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_drecordMetaSpan (v_Vuna_dCompiler_dElab_dTypes_decNext ec)) sp))) ((v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec)))

let v_Vuna_dCompiler_dElab_dTypes_dnewHoleMeta = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc1 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__803; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__804; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__805; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__806; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__807; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__808; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__809; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__810; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__811; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__812; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__813; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__814; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__815; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__816; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__817; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__818; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__819; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__820 } -> ((fun goal -> ((fun _u -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__803)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = (dtb__803 + 1); f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__804; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__805; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__806; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__803; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0) }, dtb__807)); f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = ((Base_dList.v_Base_dList_dappend dtb__808) (Base_dList.C_Base_dList_dList_Cons (goal, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__809; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__810; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__811; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__812; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__813; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__814; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dInt.v_Hashable_uInt) dtb__803) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0)) dtb__815); f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__816; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__817; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__818; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__819; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__820 } }) ((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_drecordMetaSpan dtb__803) mc2))) { f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalMeta = dtb__803; f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalSpan = mc2; f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalType = mc3; f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalCtx = (mc0).f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems; f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalName = mc4 })
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dforceVal = (fun ec v -> ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__821; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__822; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__823; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__824; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__825; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__826; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__827; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__828; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals = dtb__829; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__830 } -> dtb__821
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__831; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__832; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__833; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__834; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__835; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__836; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__837; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__838; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals = dtb__839; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__840 } -> dtb__832
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__841; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__842; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__843; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__844; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__845; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__846; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__847; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__848; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals = dtb__849; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__850 } -> dtb__843
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgSols = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__851; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__852; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__853; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__854; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__855; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__856; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__857; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__858; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals = dtb__859; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__860 } -> dtb__854
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__861; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__862; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__863; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__864; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__865; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__866; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__867; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__868; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals = dtb__869; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__870 } -> dtb__865
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__871; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__872; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__873; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__874; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__875; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__876; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__877; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__878; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals = dtb__879; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__880 } -> dtb__876
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__881; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__882; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__883; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__884; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__885; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__886; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__887; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__888; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals = dtb__889; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__890 } -> dtb__887
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dsolsToTbl = (fun sols -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dInt.v_Hashable_uInt) sols) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dElab_dTypes_decPutDefTbl = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__891; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__892; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__893; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__894; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__895; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__896; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__897; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__898; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__899; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__900; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__901; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__902; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__903; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__904; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__905; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__906; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__907; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__908 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__891; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__892; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__893; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__894; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__895; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__896; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__897; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__898; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__899; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__901; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__902; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__903; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__904; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__905; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__906; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__907; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__908 }
  | _ -> failwith "DT: impossible branch"
))
