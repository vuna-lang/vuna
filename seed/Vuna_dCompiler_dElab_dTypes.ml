open Vuna_runtime
type t_Vuna_dCompiler_dElab_dTypes_dDtDef = C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef of (string) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe) | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom of (string) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe) | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern of (string) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (string) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe)
and t_Vuna_dCompiler_dElab_dTypes_dDtCtor = { f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName : string; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily : string; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe }
and t_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta = { f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName : string; f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex : int; f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldType : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dElab_dTypes_dDtData = { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName : string; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors : t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear : bool; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dReprTier; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields : t_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord : bool }
and t_Vuna_dCompiler_dElab_dTypes_dDtGoal = { f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalMeta : int; f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan; f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalType : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue; f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalCtx : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalName : string }
and t_Vuna_dCompiler_dElab_dTypes_dDtClass = { f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassName : string; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethodSpans : (string, Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dElab_dTypes_dDtInst = { f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstName : string; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe }
and t_Vuna_dCompiler_dElab_dTypes_dInstStore = { f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsList : t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily : (string, t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap }
and t_Vuna_dCompiler_dElab_dTypes_dConstraintKind = C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkDict | C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkRow
and t_Vuna_dCompiler_dElab_dTypes_dConstraint = { f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId : int; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind : t_Vuna_dCompiler_dElab_dTypes_dConstraintKind; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta : int; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth : int }
and t_Vuna_dCompiler_dElab_dTypes_dConstraintStore = { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending : t_Vuna_dCompiler_dElab_dTypes_dConstraint Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId : int; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried : (int, int) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dElab_dTypes_dEc = { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext : int; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas : t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta : (int, int) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals : t_Vuna_dCompiler_dElab_dTypes_dDtGoal Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts : t_Vuna_dCompiler_dElab_dTypes_dInstStore; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses : t_Vuna_dCompiler_dElab_dTypes_dDtClass Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints : t_Vuna_dCompiler_dElab_dTypes_dConstraintStore; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl : (int, int) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete : bool; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl : (string, (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dList.t_Base_dList_dList, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl : (string, t_Vuna_dCompiler_dElab_dTypes_dDtCtor) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear : bool; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans : (int, Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans : (string, Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings : Vuna_dCompiler_dDiag.t_Vuna_dCompiler_dDiag_dDiagnostic Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors : Vuna_dCompiler_dDiag.t_Vuna_dCompiler_dDiag_dDiagnostic Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dElab_dTypes_dCtx = { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxEnvF : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxDepthF : int }
and t_Vuna_dCompiler_dElab_dTypes_dDtProgram = { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas : t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs : t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals : t_Vuna_dCompiler_dElab_dTypes_dDtGoal Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts : t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses : t_Vuna_dCompiler_dElab_dTypes_dDtClass Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext : int; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths : (int, int) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings : Vuna_dCompiler_dDiag.t_Vuna_dCompiler_dDiag_dDiagnostic Base_dList.t_Base_dList_dList }

# 27 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtDefName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__0, dtb__1, dtb__2, dtb__3) -> dtb__0
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__4, dtb__5, dtb__6) -> dtb__4
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__7, dtb__8, dtb__9, dtb__10) -> dtb__7
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtDefType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__11, dtb__12, dtb__13, dtb__14) -> dtb__12
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__15, dtb__16, dtb__17) -> dtb__16
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__18, dtb__19, dtb__20, dtb__21) -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

# 37 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtDefBody = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__22, dtb__23, dtb__24, dtb__25) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__26, dtb__27, dtb__28) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__29, dtb__30, dtb__31, dtb__32) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__31))
  | _ -> failwith "DT: impossible branch"
))

# 43 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtDefHasBody = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__33, dtb__34, dtb__35, dtb__36) -> true
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__37, dtb__38, dtb__39) -> false
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__40, dtb__41, dtb__42, dtb__43) -> true
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__44, dtb__45, dtb__46, dtb__47) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__46))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 54 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__48, dtb__49, dtb__50, dtb__51) -> dtb__51
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__52, dtb__53, dtb__54) -> dtb__54
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__55, dtb__56, dtb__57, dtb__58) -> dtb__58
  | _ -> failwith "DT: impossible branch"
))

# 68 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtCtorName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = dtb__59; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = dtb__60; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = dtb__61; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = dtb__62; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan = dtb__63 } -> dtb__59
  | _ -> failwith "DT: impossible branch"
))

# 71 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = dtb__64; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = dtb__65; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = dtb__66; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = dtb__67; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan = dtb__68 } -> dtb__65
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = dtb__69; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = dtb__70; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = dtb__71; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = dtb__72; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan = dtb__73 } -> dtb__71
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtCtorType = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = dtb__74; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = dtb__75; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = dtb__76; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = dtb__77; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan = dtb__78 } -> dtb__77
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtDataName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__79; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__80; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__81; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__82; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__83; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__84; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__85; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__86; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__87 } -> dtb__79
  | _ -> failwith "DT: impossible branch"
))

# 110 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__88; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__89; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__90; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__91; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__92; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__93; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__94; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__95; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__96 } -> dtb__90
  | _ -> failwith "DT: impossible branch"
))

# 113 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtDataKind = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__97; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__98; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__99; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__100; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__101; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__102; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__103; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__104; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__105 } -> dtb__100
  | _ -> failwith "DT: impossible branch"
))

# 117 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtDataViaClasses = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__106; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__107; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__108; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__109; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__110; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__111; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__112; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__113; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__114 } -> dtb__110
  | _ -> failwith "DT: impossible branch"
))

# 123 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtDataRepr = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__115; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__116; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__117; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__118; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__119; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__120; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__121; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__122; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__123 } -> dtb__121
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtDataFields = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__124; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__125; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__126; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__127; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__128; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__129; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__130; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__131; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__132 } -> dtb__131
  | _ -> failwith "DT: impossible branch"
))

# 131 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtDataIsRecord = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__133; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__134; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__135; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__136; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__137; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__138; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__139; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__140; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__141 } -> dtb__141
  | _ -> failwith "DT: impossible branch"
))

# 133 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dtb__142; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = dtb__143; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = dtb__144; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = dtb__145; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = dtb__146; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = dtb__147; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = dtb__148; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = dtb__149; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = dtb__150 } -> dtb__147
  | _ -> failwith "DT: impossible branch"
))

# 154 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtClassName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassName = dtb__151; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams = dtb__152; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods = dtb__153; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys = dtb__154; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethodSpans = dtb__155 } -> dtb__151
  | _ -> failwith "DT: impossible branch"
))

# 167 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtInstName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstName = dtb__156; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele = dtb__157; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx = dtb__158; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead = dtb__159; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan = dtb__160 } -> dtb__156
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__161) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__161; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__162, dtb__163, dtb__164) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__165) -> (match dtb__165 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__166; Base_dPair.f_Base_dPair_dPair_second = dtb__167 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__166; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__167) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__163; Base_dPair.f_Base_dPair_dPair_second = dtb__164 }, Base_dList.C_Base_dList_dList_Nil))) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp dtb__162))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 194 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dinstFamilyOf = (fun i -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__168) -> (match dtb__168 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__169; Base_dPair.f_Base_dPair_dPair_second = dtb__170 } -> dtb__169
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp (i).f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead)))

# 200 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dinstStoreEmpty = { f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsList = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil) }

# 210 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dinstStorePush = (fun store i -> ((fun fam -> ((fun bucket -> { f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsList = ((Base_dList.v_Base_dList_dappend (store).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsList) (Base_dList.C_Base_dList_dList_Cons (i, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily = ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) fam) ((Base_dList.v_Base_dList_dappend bucket) (Base_dList.C_Base_dList_dList_Cons (i, Base_dList.C_Base_dList_dList_Nil)))) (store).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily) }) (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) fam) (store).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__171) -> dtb__171
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dElab_dTypes_dinstFamilyOf i)))

# 205 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_dinstStoreOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__172, dtb__173) -> ((v_Vuna_dCompiler_dElab_dTypes_dinstStorePush (v_Vuna_dCompiler_dElab_dTypes_dinstStoreOf dtb__173)) dtb__172)
  | Base_dList.C_Base_dList_dList_Nil -> v_Vuna_dCompiler_dElab_dTypes_dinstStoreEmpty
  | _ -> failwith "DT: impossible branch"
))

# 222 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dinstStoreFamily = (fun store fam -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) fam) (store).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__174) -> dtb__174
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 256 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dcsEmpty = { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = 0; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = Base_dList.C_Base_dList_dList_Nil }

# 297 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPutNext = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__175; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__176; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__177; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__178; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__179; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__180; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__181; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__182; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__183; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__184; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__185; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__186; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__187; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__188; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__189; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__190; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__191; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__192; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__193; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__194; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__195; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__196 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__176; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__177; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__178; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__179; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__180; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__181; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__182; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__183; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__184; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__185; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__186; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__187; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__188; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__189; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__190; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__191; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__192; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__193; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__194; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__195; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__196 }
  | _ -> failwith "DT: impossible branch"
))

# 302 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPutClausesTbl = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__197; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__198; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__199; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__200; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__201; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__202; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__203; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__204; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__205; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__206; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__207; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__208; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__209; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__210; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__211; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__212; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__213; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__214; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__215; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__216; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__217; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__218 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__197; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__198; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__199; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__200; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__201; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__202; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__203; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__204; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__205; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__206; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__207; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__208; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__209; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__210; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__212; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__213; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__214; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__215; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__216; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__217; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__218 }
  | _ -> failwith "DT: impossible branch"
))

# 306 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decNext = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__219; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__220; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__221; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__222; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__223; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__224; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__225; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__226; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__227; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__228; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__229; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__230; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__231; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__232; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__233; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__234; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__235; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__236; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__237; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__238; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__239; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__240 } -> dtb__219
  | _ -> failwith "DT: impossible branch"
))

# 310 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decSols = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__241; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__242; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__243; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__244; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__245; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__246; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__247; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__248; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__249; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__250; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__251; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__252; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__253; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__254; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__255; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__256; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__257; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__258; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__259; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__260; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__261; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__262 } -> dtb__242
  | _ -> failwith "DT: impossible branch"
))

# 315 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decDefs = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__263; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__264; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__265; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__266; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__267; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__268; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__269; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__270; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__271; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__272; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__273; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__274; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__275; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__276; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__277; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__278; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__279; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__280; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__281; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__282; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__283; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__284 } -> (Base_dList.v_Base_dList_dreverse dtb__265)
  | _ -> failwith "DT: impossible branch"
))

# 320 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decDefTbl = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__285; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__286; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__287; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__288; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__289; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__290; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__291; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__292; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__293; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__294; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__295; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__296; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__297; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__298; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__299; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__300; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__301; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__302; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__303; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__304; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__305; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__306 } -> dtb__294
  | _ -> failwith "DT: impossible branch"
))

# 326 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__307; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__308; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__309; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__310; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__311; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__312; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__313; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__314; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__315; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__316; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__317; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__318; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__319; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__320; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__321; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__322; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__323; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__324; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__325; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__326; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__327; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__328 } -> dtb__317
  | _ -> failwith "DT: impossible branch"
))

# 330 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__329; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__330; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__331; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__332; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__333; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__334; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__335; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__336; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__337; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__338; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__339; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__340; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__341; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__342; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__343; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__344; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__345; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__346; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__347; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__348; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__349; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__350 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__329; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__330; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__331; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__332; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__333; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__334; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__335; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__336; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__337; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__338; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__340; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__341; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__342; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__343; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__344; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__345; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__346; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__347; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__348; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__349; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__350 }
  | _ -> failwith "DT: impossible branch"
))

# 335 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decDatas = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__351; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__352; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__353; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__354; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__355; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__356; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__357; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__358; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__359; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__360; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__361; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__362; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__363; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__364; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__365; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__366; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__367; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__368; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__369; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__370; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__371; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__372 } -> dtb__354
  | _ -> failwith "DT: impossible branch"
))

# 339 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decDepthTbl = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__373; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__374; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__375; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__376; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__377; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__378; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__379; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__380; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__381; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__382; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__383; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__384; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__385; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__386; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__387; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__388; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__389; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__390; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__391; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__392; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__393; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__394 } -> dtb__385
  | _ -> failwith "DT: impossible branch"
))

# 346 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__395; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__396; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__397; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__398; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__399; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__400; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__401; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__402; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__403; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__404; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__405; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__406; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__407; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__408; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__409; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__410; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__411; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__412; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__413; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__414; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__415; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__416 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__395; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__396; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__397; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__398; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__399; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__400; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__401; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__402; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__403; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__404; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__405; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__406; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__407; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__409; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__410; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__411; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__412; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__413; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__414; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__415; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__416 }
  | _ -> failwith "DT: impossible branch"
))

# 351 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decGoals = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__417; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__418; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__419; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__420; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__421; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__422; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__423; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__424; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__425; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__426; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__427; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__428; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__429; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__430; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__431; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__432; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__433; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__434; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__435; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__436; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__437; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__438 } -> dtb__422
  | _ -> failwith "DT: impossible branch"
))

# 355 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decInsts = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__439; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__440; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__441; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__442; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__443; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__444; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__445; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__446; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__447; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__448; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__449; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__450; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__451; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__452; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__453; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__454; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__455; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__456; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__457; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__458; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__459; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__460 } -> (dtb__445).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsList
  | _ -> failwith "DT: impossible branch"
))

# 361 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decInstsFamily = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__461; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__462; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__463; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__464; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__465; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__466; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__467; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__468; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__469; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__470; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__471; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__472; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__473; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__474; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__475; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__476; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__477; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__478; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__479; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__480; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__481; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__482 } -> ((v_Vuna_dCompiler_dElab_dTypes_dinstStoreFamily dtb__467) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 379 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_dbucketCount = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__483, dtb__484) -> ((Base_dList.v_Base_dList_dlength (Base_dPair.v_Base_dPair_dsecondOf dtb__483)) + (v_Vuna_dCompiler_dElab_dTypes_dbucketCount dtb__484))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 391 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_dinstNamesEq = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__485, dtb__486) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__487, dtb__488) -> (if (dtb__485 = dtb__487) then ((v_Vuna_dCompiler_dElab_dTypes_dinstNamesEq dtb__486) dtb__488) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__489, dtb__490) -> false
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 384 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_dallBucketsMatch = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__491, dtb__492) -> (match dtb__491 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__493; Base_dPair.f_Base_dPair_dPair_second = dtb__494 } -> (if ((v_Vuna_dCompiler_dElab_dTypes_dinstNamesEq ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtInstName) dtb__494)) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtInstName) ((Base_dList.v_Base_dList_dfilter (fun i -> ((v_Vuna_dCompiler_dElab_dTypes_dinstFamilyOf i) = dtb__493))) mc0))) then ((v_Vuna_dCompiler_dElab_dTypes_dallBucketsMatch mc0) dtb__492) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 371 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decInstsAudit = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__495; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__496; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__497; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__498; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__499; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__500; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__501; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__502; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__503; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__504; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__505; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__506; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__507; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__508; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__509; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__510; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__511; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__512; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__513; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__514; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__515; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__516 } -> ((fun pairs -> ((fun list -> (if ((v_Vuna_dCompiler_dElab_dTypes_dbucketCount pairs) = (Base_dList.v_Base_dList_dlength list)) then ((v_Vuna_dCompiler_dElab_dTypes_dallBucketsMatch list) pairs) else false)) (dtb__501).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsList)) ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dString.v_Eq_uString) (dtb__501).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily))
  | _ -> failwith "DT: impossible branch"
))

# 397 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decClasses = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__517; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__518; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__519; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__520; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__521; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__522; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__523; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__524; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__525; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__526; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__527; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__528; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__529; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__530; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__531; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__532; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__533; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__534; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__535; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__536; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__537; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__538 } -> dtb__524
  | _ -> failwith "DT: impossible branch"
))

# 401 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decAddGoal = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__539; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__540; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__541; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__542; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__543; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__544; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__545; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__546; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__547; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__548; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__549; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__550; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__551; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__552; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__553; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__554; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__555; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__556; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__557; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__558; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__559; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__560 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__539; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__540; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__541; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__542; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__543; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = ((Base_dList.v_Base_dList_dappend dtb__544) (Base_dList.C_Base_dList_dList_Cons (mc1, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__545; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__546; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__547; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__548; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__549; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__550; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__551; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__552; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__553; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__554; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__555; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__556; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__557; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__558; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__559; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__560 }
  | _ -> failwith "DT: impossible branch"
))

# 409 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_dhasInstName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__561, dtb__562) -> (if ((v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__561) = mc0) then true else ((v_Vuna_dCompiler_dElab_dTypes_dhasInstName mc0) dtb__562))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 413 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decAddInstRaw = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__563; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__564; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__565; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__566; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__567; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__568; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__569; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__570; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__571; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__572; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__573; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__574; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__575; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__576; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__577; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__578; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__579; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__580; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__581; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__582; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__583; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__584 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__563; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__564; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__565; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__566; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__567; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__568; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = ((v_Vuna_dCompiler_dElab_dTypes_dinstStorePush dtb__569) mc1); f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__570; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__571; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__572; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__573; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__574; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__575; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__576; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__577; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__578; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__579; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__580; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__581; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__582; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__583; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__584 }
  | _ -> failwith "DT: impossible branch"
))

# 406 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decAddInst = (fun ec i -> (if ((v_Vuna_dCompiler_dElab_dTypes_dhasInstName (v_Vuna_dCompiler_dElab_dTypes_ddtInstName i)) (v_Vuna_dCompiler_dElab_dTypes_decInsts ec)) then ec else ((v_Vuna_dCompiler_dElab_dTypes_decAddInstRaw ec) i)))

# 418 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decAddClass = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__585; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__586; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__587; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__588; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__589; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__590; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__591; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__592; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__593; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__594; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__595; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__596; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__597; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__598; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__599; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__600; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__601; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__602; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__603; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__604; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__605; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__606 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__585; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__586; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__587; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__588; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__589; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__590; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__591; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = ((Base_dList.v_Base_dList_dappend dtb__592) (Base_dList.C_Base_dList_dList_Cons (mc1, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__593; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__594; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__595; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__596; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__597; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__598; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__599; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__600; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__601; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__602; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__603; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__604; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__605; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__606 }
  | _ -> failwith "DT: impossible branch"
))

# 425 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decConstraints = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__607; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__608; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__609; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__610; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__611; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__612; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__613; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__614; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__615; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__616; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__617; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__618; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__619; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__620; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__621; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__622; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__623; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__624; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__625; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__626; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__627; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__628 } -> dtb__615
  | _ -> failwith "DT: impossible branch"
))

# 430 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPutConstraints = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__629; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__630; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__631; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__632; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__633; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__634; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__635; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__636; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__637; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__638; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__639; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__640; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__641; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__642; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__643; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__644; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__645; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__646; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__647; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__648; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__649; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__650 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__629; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__630; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__631; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__632; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__633; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__634; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__635; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__636; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__638; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__639; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__640; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__641; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__642; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__643; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__644; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__645; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__646; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__647; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__648; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__649; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__650 }
  | _ -> failwith "DT: impossible branch"
))

# 436 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPending = (fun ec -> (match (v_Vuna_dCompiler_dElab_dTypes_decConstraints ec) with
  | { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = dtb__651; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__652; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__653 } -> dtb__651
  | _ -> failwith "DT: impossible branch"
))

# 441 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPutPending = (fun ec pending2 -> (match (v_Vuna_dCompiler_dElab_dTypes_decConstraints ec) with
  | { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = dtb__654; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__655; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__656 } -> ((v_Vuna_dCompiler_dElab_dTypes_decPutConstraints ec) { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = pending2; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__655; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__656 })
  | _ -> failwith "DT: impossible branch"
))

# 446 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decAddConstraint = (fun ec kind meta dom span depth -> (match (v_Vuna_dCompiler_dElab_dTypes_decConstraints ec) with
  | { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = dtb__657; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__658; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__659 } -> ((v_Vuna_dCompiler_dElab_dTypes_decPutConstraints ec) { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = ((Base_dList.v_Base_dList_dappend dtb__657) (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__658; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = kind; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = meta; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dom; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = span; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = depth }, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = (dtb__658 + 1); f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__659 })
  | _ -> failwith "DT: impossible branch"
))

# 465 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_dassocIntLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__660, dtb__661) -> (match dtb__660 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__662; Base_dPair.f_Base_dPair_dPair_second = dtb__663 } -> (if (dtb__662 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__663)) else ((v_Vuna_dCompiler_dElab_dTypes_dassocIntLookup mc0) dtb__661))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 454 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decTriedAt = (fun ec cid -> (match (v_Vuna_dCompiler_dElab_dTypes_decConstraints ec) with
  | { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = dtb__664; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__665; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__666 } -> ((v_Vuna_dCompiler_dElab_dTypes_dassocIntLookup cid) dtb__666)
  | _ -> failwith "DT: impossible branch"
))

# 470 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_dassocIntSet = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__667, dtb__668) -> (match dtb__667 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__669; Base_dPair.f_Base_dPair_dPair_second = dtb__670 } -> (if (dtb__669 = mc0) then (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__669; Base_dPair.f_Base_dPair_dPair_second = mc1 }, dtb__668)) else (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__669; Base_dPair.f_Base_dPair_dPair_second = dtb__670 }, (((v_Vuna_dCompiler_dElab_dTypes_dassocIntSet mc0) mc1) dtb__668))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 459 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decRecordTried = (fun ec cid epoch -> (match (v_Vuna_dCompiler_dElab_dTypes_decConstraints ec) with
  | { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = dtb__671; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__672; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__673 } -> ((v_Vuna_dCompiler_dElab_dTypes_decPutConstraints ec) { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = dtb__671; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__672; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = (((v_Vuna_dCompiler_dElab_dTypes_dassocIntSet cid) epoch) dtb__673) })
  | _ -> failwith "DT: impossible branch"
))

# 475 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decEmpty = { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = 0; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = v_Vuna_dCompiler_dElab_dTypes_dinstStoreEmpty; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = v_Vuna_dCompiler_dElab_dTypes_dcsEmpty; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = false; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = false; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = Base_dList.C_Base_dList_dList_Nil }

# 483 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decSolTbl = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__674; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__675; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__676; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__677; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__678; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__679; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__680; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__681; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__682; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__683; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__684; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__685; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__686; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__687; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__688; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__689; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__690; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__691; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__692; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__693; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__694; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__695 } -> dtb__685
  | _ -> failwith "DT: impossible branch"
))

# 491 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decSolsP = (fun ec -> (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsOf (v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) (v_Vuna_dCompiler_dElab_dTypes_decDepthTbl ec)))

# 500 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPutSolsRaw = (fun mc0 mc1 mc2 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__696; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__697; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__698; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__699; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__700; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__701; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__702; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__703; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__704; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__705; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__706; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__707; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__708; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__709; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__710; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__711; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__712; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__713; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__714; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__715; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__716; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__717 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__696; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__698; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__699; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__700; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__701; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__702; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__703; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__704; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__705; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__706; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = mc2; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__708; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__709; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__710; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__711; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__712; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__713; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__714; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__715; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__716; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__717 }
  | _ -> failwith "DT: impossible branch"
))

# 510 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__718, dtb__719) -> (match dtb__718 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__720; Base_dPair.f_Base_dPair_dPair_second = dtb__721 } -> (if (dtb__720 = mc0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__720; Base_dPair.f_Base_dPair_dPair_second = dtb__721 }, ((v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId mc0) dtb__719))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 506 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dsolsDelta = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__722, dtb__723) -> (match dtb__722 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__724; Base_dPair.f_Base_dPair_dPair_second = dtb__725 } -> ((v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId dtb__724) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 493 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPutSols = (fun ec sols2 -> ((fun delta -> ((fun soltbl2 -> (((v_Vuna_dCompiler_dElab_dTypes_decPutSolsRaw ec) sols2) soltbl2)) (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dInt.v_Hashable_uInt) delta) (v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)))) ((v_Vuna_dCompiler_dElab_dTypes_dsolsDelta (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) sols2)))

# 516 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_dmemDataNameIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__726, dtb__727) -> (if ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__726) = mc0) then true else ((v_Vuna_dCompiler_dElab_dTypes_dmemDataNameIn mc0) dtb__727))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 523 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decAddDef = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__728; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__729; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__730; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__731; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__732; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__733; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__734; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__735; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__736; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__737; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__738; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__739; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__740; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__741; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__742; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__743; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__744; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__745; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__746; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__747; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__748; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__749 } -> ((fun delta -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__728; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__729; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = (Base_dList.C_Base_dList_dList_Cons (mc1, dtb__730)); f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__731; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__732; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__733; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__734; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__735; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__736; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = delta; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__738; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__739; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__740; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__741; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__742; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__743; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__744; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__745; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__746; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__747; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__748; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__749 }) (if ((v_Vuna_dCompiler_dElab_dTypes_dmemDataNameIn (Base_dPair.v_Base_dPair_dfirstOf mc1)) dtb__731) then dtb__737 else ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) (Base_dPair.v_Base_dPair_dfirstOf mc1)) (Base_dPair.v_Base_dPair_dsecondOf mc1)) dtb__737)))
  | _ -> failwith "DT: impossible branch"
))

# 532 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decRemoveDefTbl = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__750; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__751; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__752; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__753; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__754; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__755; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__756; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__757; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__758; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__759; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__760; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__761; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__762; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__763; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__764; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__765; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__766; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__767; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__768; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__769; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__770; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__771 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__750; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__751; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__752; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__753; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__754; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__755; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__756; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__757; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__758; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dfilter (fun p -> (Base_dBool.v_Base_dBool_dnot ((Base_dPair.v_Base_dPair_dfirstOf p) = mc0)))) ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dString.v_Eq_uString) dtb__759))); f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__760; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__761; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__762; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__763; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__764; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__765; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__766; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__767; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__768; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__769; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__770; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__771 }
  | _ -> failwith "DT: impossible branch"
))

# 549 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddataCtorPairs = (fun d -> ((Base_dList.v_Base_dList_dmap (fun c -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dPair.f_Base_dPair_dPair_second = c })) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

# 538 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decAddData = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__772; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__773; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__774; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__775; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__776; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__777; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__778; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__779; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__780; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__781; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__782; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__783; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__784; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__785; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__786; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__787; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__788; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__789; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__790; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__791; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__792; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__793 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__772; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__773; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__774; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = ((Base_dList.v_Base_dList_dappend dtb__775) (Base_dList.C_Base_dList_dList_Cons (mc1, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__776; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__777; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__778; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__779; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__780; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__781; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__782; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__783; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__784; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__785; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__786; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) (v_Vuna_dCompiler_dElab_dTypes_ddataCtorPairs mc1)) dtb__787); f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = (if (v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear mc1) then true else dtb__788); f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__789; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__790; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__791; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__792; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__793 }
  | _ -> failwith "DT: impossible branch"
))

# 545 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas = (fun datas -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTypes_ddataCtorPairs) datas)) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

# 552 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPutCtorTbl = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__794; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__795; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__796; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__797; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__798; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__799; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__800; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__801; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__802; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__803; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__804; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__805; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__806; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__807; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__808; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__809; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__810; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__811; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__812; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__813; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__814; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__815 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__794; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__795; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__796; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__797; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__798; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__799; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__800; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__801; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__802; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__803; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__804; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__805; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__806; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__807; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__808; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__810; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__811; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__812; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__813; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__814; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__815 }
  | _ -> failwith "DT: impossible branch"
))

# 559 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decHasLinear = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__816; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__817; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__818; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__819; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__820; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__821; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__822; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__823; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__824; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__825; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__826; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__827; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__828; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__829; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__830; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__831; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__832; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__833; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__834; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__835; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__836; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__837 } -> dtb__832
  | _ -> failwith "DT: impossible branch"
))

# 565 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decMetaSpans = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__838; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__839; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__840; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__841; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__842; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__843; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__844; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__845; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__846; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__847; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__848; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__849; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__850; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__851; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__852; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__853; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__854; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__855; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__856; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__857; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__858; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__859 } -> dtb__855
  | _ -> failwith "DT: impossible branch"
))

# 570 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPutMetaSpans = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__860; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__861; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__862; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__863; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__864; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__865; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__866; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__867; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__868; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__869; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__870; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__871; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__872; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__873; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__874; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__875; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__876; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__877; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__878; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__879; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__880; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__881 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__860; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__861; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__862; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__863; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__864; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__865; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__866; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__867; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__868; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__869; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__870; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__871; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__872; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__873; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__874; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__875; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__876; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__878; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__879; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__880; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__881 }
  | _ -> failwith "DT: impossible branch"
))

# 576 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decUseSpans = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__882; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__883; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__884; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__885; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__886; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__887; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__888; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__889; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__890; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__891; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__892; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__893; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__894; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__895; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__896; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__897; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__898; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__899; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__900; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__901; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__902; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__903 } -> dtb__900
  | _ -> failwith "DT: impossible branch"
))

# 581 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPutUseSpans = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__904; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__905; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__906; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__907; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__908; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__909; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__910; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__911; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__912; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__913; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__914; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__915; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__916; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__917; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__918; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__919; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__920; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__921; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__922; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__923; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__924; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__925 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__904; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__905; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__906; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__907; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__908; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__909; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__910; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__911; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__912; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__913; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__914; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__915; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__916; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__917; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__918; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__919; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__920; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__921; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__923; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__924; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__925 }
  | _ -> failwith "DT: impossible branch"
))

# 588 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decWarnings = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__926; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__927; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__928; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__929; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__930; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__931; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__932; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__933; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__934; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__935; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__936; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__937; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__938; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__939; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__940; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__941; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__942; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__943; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__944; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__945; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__946; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__947 } -> dtb__945
  | _ -> failwith "DT: impossible branch"
))

# 593 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPutWarnings = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__948; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__949; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__950; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__951; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__952; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__953; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__954; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__955; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__956; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__957; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__958; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__959; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__960; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__961; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__962; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__963; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__964; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__965; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__966; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__967; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__968; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__969 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__948; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__949; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__950; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__951; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__952; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__953; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__954; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__955; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__956; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__957; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__958; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__959; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__960; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__961; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__962; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__963; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__964; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__965; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__966; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__968; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__969 }
  | _ -> failwith "DT: impossible branch"
))

# 599 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decAddWarning = (fun ec d -> ((v_Vuna_dCompiler_dElab_dTypes_decPutWarnings ec) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTypes_decWarnings ec)) (Base_dList.C_Base_dList_dList_Cons (d, Base_dList.C_Base_dList_dList_Nil)))))

# 603 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decCounters = (fun e -> (e).f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters)

# 606 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decBump = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__970; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__971; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__972; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__973; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__974; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__975; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__976; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__977; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__978; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__979; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__980; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__981; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__982; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__983; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__984; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__985; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__986; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__987; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__988; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__989; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__990; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__991 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__970; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__971; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__972; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__973; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__974; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__975; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__976; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__977; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__978; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__979; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__980; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__981; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__982; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__983; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__984; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__985; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__986; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__987; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__988; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__989; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = (Base_dList.C_Base_dList_dList_Cons (mc1, dtb__990)); f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__991 }
  | _ -> failwith "DT: impossible branch"
))

# 612 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decErrors = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__992; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__993; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__994; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__995; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__996; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__997; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__998; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__999; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__1000; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__1001; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__1002; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__1003; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__1004; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__1005; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__1006; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__1007; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__1008; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__1009; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__1010; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__1011; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__1012; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__1013 } -> dtb__1013
  | _ -> failwith "DT: impossible branch"
))

# 616 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decAddError = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__1014; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__1015; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__1016; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__1017; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__1018; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__1019; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__1020; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__1021; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__1022; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__1023; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__1024; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__1025; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__1026; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__1027; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__1028; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__1029; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__1030; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__1031; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__1032; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__1033; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__1034; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__1035 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__1014; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__1015; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__1016; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__1017; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__1018; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__1019; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__1020; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__1021; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__1022; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__1023; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__1024; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__1025; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__1026; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__1027; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__1028; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__1029; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__1030; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__1031; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__1032; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__1033; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__1034; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = (Base_dList.C_Base_dList_dList_Cons (mc1, dtb__1035)) }
  | _ -> failwith "DT: impossible branch"
))

# 621 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_ddatasHaveLinear = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1036, dtb__1037) -> (if (v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear dtb__1036) then true else (v_Vuna_dCompiler_dElab_dTypes_ddatasHaveLinear dtb__1037))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 642 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dctxDepth = (fun ctx -> (ctx).f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxDepthF)

# 645 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dctxBind = (fun mc0 mc1 mc2 -> (match mc2 with
  | { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__1038; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxEnvF = dtb__1039; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__1040; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxDepthF = dtb__1041 } -> { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }, dtb__1038)); f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxEnvF = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (mc0, dtb__1041, Base_dList.C_Base_dList_dList_Nil)))), dtb__1039)); f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__1040; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxDepthF = (dtb__1041 + 1) }
  | _ -> failwith "DT: impossible branch"
))

# 650 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dctxBindValue = (fun mc0 mc1 mc2 -> (match mc2 with
  | { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__1042; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxEnvF = dtb__1043; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__1044; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxDepthF = dtb__1045 } -> { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote dtb__1045) mc1) }, dtb__1042)); f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxEnvF = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (mc0, dtb__1045, Base_dList.C_Base_dList_dList_Nil)))), dtb__1043)); f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__1044; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxDepthF = (dtb__1045 + 1) }
  | _ -> failwith "DT: impossible branch"
))

# 655 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dctxRefine = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__1046; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxEnvF = dtb__1047; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__1048; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxDepthF = dtb__1049 } -> { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__1046; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxEnvF = dtb__1047; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = ((Base_dList.v_Base_dList_dappend dtb__1048) mc1); f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxDepthF = dtb__1049 }
  | _ -> failwith "DT: impossible branch"
))

# 658 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1050, dtb__1051) -> (match dtb__1050 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1052; Base_dPair.f_Base_dPair_dPair_second = dtb__1053 } -> (if (dtb__1052 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = mc2; Base_dPair.f_Base_dPair_dPair_second = dtb__1053 })) else (((v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt mc0) dtb__1051) (mc2 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 663 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dctxLookup = (fun name ctx -> (((v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt name) (ctx).f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems) 0))

# 672 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1054, dtb__1055) -> (match dtb__1054 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1056; Base_dPair.f_Base_dPair_dPair_second = dtb__1057 } -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__1056, ((mc2 - mc1) - 1), Base_dList.C_Base_dList_dList_Nil)))), (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__1055) (mc1 + 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 679 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dctxEnv = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__1058; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxEnvF = dtb__1059; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__1060; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxDepthF = dtb__1061 } -> dtb__1059
  | _ -> failwith "DT: impossible branch"
))

# 708 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_drefineLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1062, dtb__1063) -> (match dtb__1062 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1064; Base_dPair.f_Base_dPair_dPair_second = dtb__1065 } -> (if (dtb__1064 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1065)) else ((v_Vuna_dCompiler_dElab_dTypes_drefineLookup mc0) dtb__1063))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 688 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_drefineValue = (fun refs fuel v -> (if (fuel <= 0) then v else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__1066) -> (match dtb__1066 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__1067, dtb__1068, dtb__1069) -> ((fun sp2 -> (match ((v_Vuna_dCompiler_dElab_dTypes_drefineLookup dtb__1068) refs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1070) -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__1070)) sp2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__1067, dtb__1068, sp2))))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__1069))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__1071, dtb__1072) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__1071, ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__1072)))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__1073, dtb__1074) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__1073, ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__1074)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__1075, dtb__1076) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__1075), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__1076)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__1077, dtb__1078) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__1077), dtb__1078))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__1079, dtb__1080, dtb__1081) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__1079), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__1080), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__1081)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__1082, dtb__1083) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__1082, ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__1083)))
  | _ -> v
)))

# 667 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_drefinedEnv = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue mc0) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel)) mc1)
))

# 683 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dctxEnvRefined = (fun ctx -> ((v_Vuna_dCompiler_dElab_dTypes_drefinedEnv (ctx).f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals) (v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)))

# 713 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_devalCtx = (fun ctx ty -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnvRefined ctx)) ty))

# 718 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue = (fun ctx idx ty -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnvRefined ctx)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) (idx + 1)) ty)))

# 721 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_demptyCtx = { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxEnvF = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxDepthF = 0 }

# 727 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_derrAt = (fun sp msg -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_drawAt sp) msg))

# 731 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dnewMeta = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__1084; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__1085; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__1086; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__1087; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__1088; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__1089; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__1090; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__1091; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__1092; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__1093; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__1094; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__1095; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__1096; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__1097; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__1098; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__1099; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__1100; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__1101; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__1102; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__1103; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__1104; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__1105 } -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__1084)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = (dtb__1084 + 1); f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__1085; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__1086; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__1087; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1084; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0) }, dtb__1088)); f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__1089; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__1090; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__1091; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__1092; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__1093; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__1094; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__1095; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dInt.v_Hashable_uInt) dtb__1084) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0)) dtb__1096); f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__1097; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__1098; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__1099; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__1100; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__1101; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__1102; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__1103; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__1104; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__1105 } }
  | _ -> failwith "DT: impossible branch"
))

# 736 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dforceVal = (fun ec v -> ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))

# 756 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__1106; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__1107; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__1108; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__1109; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__1110; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__1111; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__1112; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__1113; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__1114; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = dtb__1115 } -> dtb__1106
  | _ -> failwith "DT: impossible branch"
))

# 759 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__1116; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__1117; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__1118; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__1119; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__1120; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__1121; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__1122; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__1123; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__1124; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = dtb__1125 } -> dtb__1117
  | _ -> failwith "DT: impossible branch"
))

# 762 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__1126; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__1127; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__1128; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__1129; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__1130; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__1131; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__1132; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__1133; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__1134; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = dtb__1135 } -> dtb__1128
  | _ -> failwith "DT: impossible branch"
))

# 765 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtProgSols = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__1136; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__1137; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__1138; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__1139; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__1140; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__1141; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__1142; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__1143; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__1144; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = dtb__1145 } -> dtb__1139
  | _ -> failwith "DT: impossible branch"
))

# 768 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__1146; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__1147; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__1148; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__1149; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__1150; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__1151; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__1152; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__1153; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__1154; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = dtb__1155 } -> dtb__1150
  | _ -> failwith "DT: impossible branch"
))

# 771 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__1156; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__1157; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__1158; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__1159; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__1160; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__1161; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__1162; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__1163; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__1164; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = dtb__1165 } -> dtb__1161
  | _ -> failwith "DT: impossible branch"
))

# 774 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__1166; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__1167; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__1168; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__1169; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__1170; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__1171; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__1172; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__1173; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__1174; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = dtb__1175 } -> dtb__1172
  | _ -> failwith "DT: impossible branch"
))

# 778 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__1176; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__1177; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__1178; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__1179; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__1180; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__1181; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__1182; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__1183; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__1184; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = dtb__1185 } -> dtb__1185
  | _ -> failwith "DT: impossible branch"
))

# 783 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dsolsToTbl = (fun sols -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dInt.v_Hashable_uInt) sols) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil)))

# 786 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPutDefTbl = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__1186; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__1187; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__1188; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__1189; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__1190; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__1191; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__1192; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__1193; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__1194; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__1195; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__1196; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__1197; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__1198; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__1199; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__1200; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__1201; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__1202; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__1203; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__1204; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__1205; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__1206; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__1207 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__1186; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__1187; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__1188; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__1189; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__1190; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__1191; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__1192; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__1193; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__1194; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__1196; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__1197; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__1198; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__1199; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__1200; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__1201; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__1202; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__1203; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__1204; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__1205; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__1206; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__1207 }
  | _ -> failwith "DT: impossible branch"
))
