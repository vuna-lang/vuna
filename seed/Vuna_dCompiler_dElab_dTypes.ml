open Vuna_runtime
type t_Vuna_dCompiler_dElab_dTypes_dDtDef = C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef of (string) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe) | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom of (string) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe) | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern of (string) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (string) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe)
and t_Vuna_dCompiler_dElab_dTypes_dDtCtor = { f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName : string; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily : string; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm; f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe }
and t_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta = { f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName : string; f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex : int; f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldType : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dElab_dTypes_dDtData = { f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName : string; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors : t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear : bool; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dReprTier; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields : t_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord : bool }
and t_Vuna_dCompiler_dElab_dTypes_dDtGoal = { f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalMeta : int; f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan; f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalType : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue; f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalCtx : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalName : string }
and t_Vuna_dCompiler_dElab_dTypes_dDtClass = { f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassName : string; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassSupers : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethodSpans : (string, Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dElab_dTypes_dDtInst = { f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstName : string; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe }
and t_Vuna_dCompiler_dElab_dTypes_dInstStore = { f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsList : t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily : (string, t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap }
and t_Vuna_dCompiler_dElab_dTypes_dConstraintKind = C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkDict | C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkRow
and t_Vuna_dCompiler_dElab_dTypes_dConstraint = { f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId : int; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind : t_Vuna_dCompiler_dElab_dTypes_dConstraintKind; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta : int; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth : int }
and t_Vuna_dCompiler_dElab_dTypes_dConstraintStore = { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending : t_Vuna_dCompiler_dElab_dTypes_dConstraint Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId : int; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried : (int, int) Base_dHashMap.t_Base_dHashMap_dHashMap }
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

# 156 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtClassName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassName = dtb__151; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams = dtb__152; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassSupers = dtb__153; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods = dtb__154; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys = dtb__155; f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethodSpans = dtb__156 } -> dtb__151
  | _ -> failwith "DT: impossible branch"
))

# 169 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtInstName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstName = dtb__157; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele = dtb__158; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx = dtb__159; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead = dtb__160; f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan = dtb__161 } -> dtb__157
  | _ -> failwith "DT: impossible branch"
))

# 175 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__162) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__162; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__163, dtb__164, dtb__165) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__166) -> (match dtb__166 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__167; Base_dPair.f_Base_dPair_dPair_second = dtb__168 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__167; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__168) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__164; Base_dPair.f_Base_dPair_dPair_second = dtb__165 }, Base_dList.C_Base_dList_dList_Nil))) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp dtb__163))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 196 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dinstFamilyOf = (fun i -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__169) -> (match dtb__169 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__170; Base_dPair.f_Base_dPair_dPair_second = dtb__171 } -> dtb__170
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp (i).f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead)))

# 202 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dinstStoreEmpty = { f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsList = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil) }

# 212 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dinstStorePush = (fun store i -> ((fun fam -> ((fun bucket -> { f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsList = ((Base_dList.v_Base_dList_dappend (store).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsList) (Base_dList.C_Base_dList_dList_Cons (i, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily = ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) fam) ((Base_dList.v_Base_dList_dappend bucket) (Base_dList.C_Base_dList_dList_Cons (i, Base_dList.C_Base_dList_dList_Nil)))) (store).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily) }) (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) fam) (store).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__172) -> dtb__172
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dElab_dTypes_dinstFamilyOf i)))

# 207 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_dinstStoreOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__173, dtb__174) -> ((v_Vuna_dCompiler_dElab_dTypes_dinstStorePush (v_Vuna_dCompiler_dElab_dTypes_dinstStoreOf dtb__174)) dtb__173)
  | Base_dList.C_Base_dList_dList_Nil -> v_Vuna_dCompiler_dElab_dTypes_dinstStoreEmpty
  | _ -> failwith "DT: impossible branch"
))

# 224 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dinstStoreFamily = (fun store fam -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) fam) (store).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__175) -> dtb__175
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 259 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dcsEmpty = { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = 0; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil) }

# 300 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPutNext = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__176; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__177; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__178; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__179; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__180; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__181; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__182; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__183; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__184; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__185; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__186; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__187; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__188; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__189; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__190; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__191; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__192; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__193; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__194; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__195; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__196; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__197 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__177; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__178; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__179; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__180; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__181; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__182; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__183; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__184; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__185; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__186; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__187; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__188; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__189; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__190; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__191; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__192; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__193; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__194; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__195; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__196; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__197 }
  | _ -> failwith "DT: impossible branch"
))

# 305 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPutClausesTbl = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__198; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__199; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__200; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__201; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__202; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__203; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__204; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__205; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__206; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__207; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__208; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__209; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__210; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__211; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__212; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__213; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__214; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__215; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__216; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__217; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__218; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__219 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__198; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__199; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__200; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__201; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__202; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__203; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__204; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__205; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__206; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__207; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__208; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__209; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__210; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__211; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__213; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__214; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__215; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__216; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__217; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__218; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__219 }
  | _ -> failwith "DT: impossible branch"
))

# 309 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decNext = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__220; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__221; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__222; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__223; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__224; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__225; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__226; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__227; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__228; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__229; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__230; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__231; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__232; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__233; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__234; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__235; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__236; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__237; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__238; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__239; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__240; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__241 } -> dtb__220
  | _ -> failwith "DT: impossible branch"
))

# 313 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decSols = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__242; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__243; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__244; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__245; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__246; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__247; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__248; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__249; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__250; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__251; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__252; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__253; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__254; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__255; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__256; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__257; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__258; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__259; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__260; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__261; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__262; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__263 } -> dtb__243
  | _ -> failwith "DT: impossible branch"
))

# 318 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decDefs = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__264; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__265; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__266; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__267; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__268; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__269; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__270; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__271; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__272; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__273; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__274; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__275; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__276; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__277; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__278; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__279; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__280; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__281; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__282; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__283; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__284; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__285 } -> (Base_dList.v_Base_dList_dreverse dtb__266)
  | _ -> failwith "DT: impossible branch"
))

# 323 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decDefTbl = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__286; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__287; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__288; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__289; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__290; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__291; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__292; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__293; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__294; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__295; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__296; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__297; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__298; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__299; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__300; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__301; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__302; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__303; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__304; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__305; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__306; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__307 } -> dtb__295
  | _ -> failwith "DT: impossible branch"
))

# 329 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__308; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__309; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__310; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__311; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__312; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__313; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__314; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__315; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__316; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__317; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__318; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__319; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__320; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__321; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__322; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__323; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__324; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__325; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__326; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__327; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__328; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__329 } -> dtb__318
  | _ -> failwith "DT: impossible branch"
))

# 333 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__330; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__331; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__332; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__333; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__334; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__335; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__336; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__337; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__338; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__339; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__340; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__341; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__342; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__343; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__344; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__345; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__346; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__347; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__348; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__349; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__350; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__351 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__330; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__331; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__332; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__333; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__334; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__335; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__336; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__337; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__338; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__339; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__341; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__342; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__343; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__344; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__345; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__346; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__347; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__348; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__349; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__350; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__351 }
  | _ -> failwith "DT: impossible branch"
))

# 338 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decDatas = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__352; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__353; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__354; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__355; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__356; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__357; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__358; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__359; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__360; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__361; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__362; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__363; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__364; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__365; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__366; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__367; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__368; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__369; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__370; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__371; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__372; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__373 } -> dtb__355
  | _ -> failwith "DT: impossible branch"
))

# 342 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decDepthTbl = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__374; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__375; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__376; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__377; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__378; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__379; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__380; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__381; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__382; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__383; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__384; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__385; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__386; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__387; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__388; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__389; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__390; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__391; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__392; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__393; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__394; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__395 } -> dtb__386
  | _ -> failwith "DT: impossible branch"
))

# 349 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__396; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__397; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__398; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__399; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__400; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__401; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__402; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__403; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__404; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__405; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__406; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__407; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__408; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__409; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__410; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__411; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__412; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__413; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__414; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__415; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__416; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__417 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__396; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__397; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__398; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__399; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__400; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__401; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__402; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__403; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__404; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__405; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__406; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__407; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__408; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__410; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__411; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__412; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__413; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__414; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__415; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__416; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__417 }
  | _ -> failwith "DT: impossible branch"
))

# 354 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decGoals = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__418; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__419; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__420; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__421; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__422; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__423; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__424; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__425; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__426; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__427; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__428; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__429; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__430; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__431; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__432; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__433; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__434; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__435; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__436; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__437; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__438; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__439 } -> dtb__423
  | _ -> failwith "DT: impossible branch"
))

# 358 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decInsts = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__440; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__441; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__442; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__443; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__444; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__445; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__446; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__447; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__448; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__449; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__450; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__451; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__452; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__453; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__454; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__455; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__456; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__457; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__458; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__459; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__460; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__461 } -> (dtb__446).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsList
  | _ -> failwith "DT: impossible branch"
))

# 364 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decInstsFamily = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__462; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__463; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__464; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__465; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__466; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__467; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__468; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__469; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__470; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__471; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__472; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__473; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__474; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__475; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__476; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__477; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__478; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__479; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__480; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__481; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__482; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__483 } -> ((v_Vuna_dCompiler_dElab_dTypes_dinstStoreFamily dtb__468) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_dbucketCount = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__484, dtb__485) -> ((Base_dList.v_Base_dList_dlength (Base_dPair.v_Base_dPair_dsecondOf dtb__484)) + (v_Vuna_dCompiler_dElab_dTypes_dbucketCount dtb__485))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 394 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_dinstNamesEq = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__486, dtb__487) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__488, dtb__489) -> (if (dtb__486 = dtb__488) then ((v_Vuna_dCompiler_dElab_dTypes_dinstNamesEq dtb__487) dtb__489) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__490, dtb__491) -> false
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 387 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_dallBucketsMatch = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__492, dtb__493) -> (match dtb__492 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__494; Base_dPair.f_Base_dPair_dPair_second = dtb__495 } -> (if ((v_Vuna_dCompiler_dElab_dTypes_dinstNamesEq ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtInstName) dtb__495)) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtInstName) ((Base_dList.v_Base_dList_dfilter (fun i -> ((v_Vuna_dCompiler_dElab_dTypes_dinstFamilyOf i) = dtb__494))) mc0))) then ((v_Vuna_dCompiler_dElab_dTypes_dallBucketsMatch mc0) dtb__493) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decInstsAudit = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__496; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__497; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__498; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__499; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__500; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__501; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__502; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__503; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__504; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__505; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__506; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__507; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__508; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__509; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__510; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__511; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__512; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__513; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__514; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__515; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__516; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__517 } -> ((fun pairs -> ((fun list -> (if ((v_Vuna_dCompiler_dElab_dTypes_dbucketCount pairs) = (Base_dList.v_Base_dList_dlength list)) then ((v_Vuna_dCompiler_dElab_dTypes_dallBucketsMatch list) pairs) else false)) (dtb__502).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsList)) ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dString.v_Eq_uString) (dtb__502).f_Vuna_dCompiler_dElab_dTypes_dInstStore_instsByFamily))
  | _ -> failwith "DT: impossible branch"
))

# 400 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decClasses = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__518; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__519; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__520; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__521; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__522; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__523; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__524; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__525; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__526; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__527; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__528; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__529; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__530; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__531; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__532; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__533; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__534; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__535; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__536; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__537; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__538; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__539 } -> dtb__525
  | _ -> failwith "DT: impossible branch"
))

# 404 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decAddGoal = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__540; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__541; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__542; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__543; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__544; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__545; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__546; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__547; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__548; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__549; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__550; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__551; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__552; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__553; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__554; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__555; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__556; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__557; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__558; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__559; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__560; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__561 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__540; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__541; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__542; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__543; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__544; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = ((Base_dList.v_Base_dList_dappend dtb__545) (Base_dList.C_Base_dList_dList_Cons (mc1, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__546; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__547; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__548; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__549; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__550; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__551; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__552; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__553; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__554; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__555; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__556; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__557; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__558; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__559; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__560; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__561 }
  | _ -> failwith "DT: impossible branch"
))

# 412 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_dhasInstName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__562, dtb__563) -> (if ((v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__562) = mc0) then true else ((v_Vuna_dCompiler_dElab_dTypes_dhasInstName mc0) dtb__563))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 416 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decAddInstRaw = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__564; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__565; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__566; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__567; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__568; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__569; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__570; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__571; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__572; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__573; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__574; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__575; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__576; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__577; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__578; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__579; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__580; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__581; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__582; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__583; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__584; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__585 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__564; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__565; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__566; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__567; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__568; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__569; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = ((v_Vuna_dCompiler_dElab_dTypes_dinstStorePush dtb__570) mc1); f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__571; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__572; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__573; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__574; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__575; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__576; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__577; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__578; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__579; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__580; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__581; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__582; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__583; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__584; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__585 }
  | _ -> failwith "DT: impossible branch"
))

# 409 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decAddInst = (fun ec i -> (if ((v_Vuna_dCompiler_dElab_dTypes_dhasInstName (v_Vuna_dCompiler_dElab_dTypes_ddtInstName i)) (v_Vuna_dCompiler_dElab_dTypes_decInsts ec)) then ec else ((v_Vuna_dCompiler_dElab_dTypes_decAddInstRaw ec) i)))

# 421 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decAddClass = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__586; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__587; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__588; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__589; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__590; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__591; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__592; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__593; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__594; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__595; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__596; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__597; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__598; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__599; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__600; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__601; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__602; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__603; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__604; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__605; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__606; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__607 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__586; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__587; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__588; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__589; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__590; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__591; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__592; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = ((Base_dList.v_Base_dList_dappend dtb__593) (Base_dList.C_Base_dList_dList_Cons (mc1, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__594; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__595; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__596; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__597; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__598; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__599; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__600; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__601; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__602; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__603; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__604; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__605; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__606; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__607 }
  | _ -> failwith "DT: impossible branch"
))

# 428 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decConstraints = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__608; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__609; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__610; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__611; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__612; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__613; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__614; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__615; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__616; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__617; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__618; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__619; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__620; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__621; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__622; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__623; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__624; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__625; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__626; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__627; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__628; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__629 } -> dtb__616
  | _ -> failwith "DT: impossible branch"
))

# 433 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPutConstraints = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__630; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__631; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__632; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__633; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__634; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__635; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__636; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__637; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__638; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__639; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__640; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__641; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__642; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__643; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__644; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__645; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__646; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__647; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__648; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__649; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__650; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__651 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__630; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__631; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__632; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__633; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__634; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__635; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__636; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__637; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__639; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__640; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__641; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__642; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__643; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__644; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__645; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__646; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__647; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__648; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__649; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__650; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__651 }
  | _ -> failwith "DT: impossible branch"
))

# 439 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPending = (fun ec -> (match (v_Vuna_dCompiler_dElab_dTypes_decConstraints ec) with
  | { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = dtb__652; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__653; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__654 } -> dtb__652
  | _ -> failwith "DT: impossible branch"
))

# 444 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPutPending = (fun ec pending2 -> (match (v_Vuna_dCompiler_dElab_dTypes_decConstraints ec) with
  | { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = dtb__655; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__656; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__657 } -> ((v_Vuna_dCompiler_dElab_dTypes_decPutConstraints ec) { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = pending2; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__656; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__657 })
  | _ -> failwith "DT: impossible branch"
))

# 449 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decAddConstraint = (fun ec kind meta dom span depth -> (match (v_Vuna_dCompiler_dElab_dTypes_decConstraints ec) with
  | { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = dtb__658; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__659; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__660 } -> ((v_Vuna_dCompiler_dElab_dTypes_decPutConstraints ec) { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = ((Base_dList.v_Base_dList_dappend dtb__658) (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__659; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = kind; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = meta; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dom; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = span; f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = depth }, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = (dtb__659 + 1); f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__660 })
  | _ -> failwith "DT: impossible branch"
))

# 457 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decTriedAt = (fun ec cid -> (match (v_Vuna_dCompiler_dElab_dTypes_decConstraints ec) with
  | { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = dtb__661; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__662; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__663 } -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) cid) dtb__663)
  | _ -> failwith "DT: impossible branch"
))

# 462 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decRecordTried = (fun ec cid epoch -> (match (v_Vuna_dCompiler_dElab_dTypes_decConstraints ec) with
  | { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = dtb__664; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__665; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = dtb__666 } -> ((v_Vuna_dCompiler_dElab_dTypes_decPutConstraints ec) { f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csPending = dtb__664; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csNextId = dtb__665; f_Vuna_dCompiler_dElab_dTypes_dConstraintStore_csTried = ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dInt.v_Hashable_uInt) cid) epoch) dtb__666) })
  | _ -> failwith "DT: impossible branch"
))

# 467 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decEmpty = { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = 0; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = v_Vuna_dCompiler_dElab_dTypes_dinstStoreEmpty; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = v_Vuna_dCompiler_dElab_dTypes_dcsEmpty; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = false; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = false; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = Base_dList.C_Base_dList_dList_Nil }

# 475 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decSolTbl = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__667; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__668; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__669; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__670; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__671; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__672; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__673; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__674; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__675; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__676; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__677; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__678; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__679; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__680; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__681; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__682; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__683; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__684; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__685; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__686; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__687; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__688 } -> dtb__678
  | _ -> failwith "DT: impossible branch"
))

# 483 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decSolsP = (fun ec -> (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsOf (v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) (v_Vuna_dCompiler_dElab_dTypes_decDepthTbl ec)))

# 492 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPutSolsRaw = (fun mc0 mc1 mc2 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__689; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__690; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__691; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__692; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__693; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__694; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__695; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__696; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__697; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__698; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__699; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__700; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__701; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__702; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__703; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__704; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__705; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__706; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__707; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__708; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__709; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__710 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__689; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__691; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__692; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__693; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__694; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__695; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__696; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__697; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__698; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__699; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = mc2; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__701; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__702; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__703; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__704; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__705; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__706; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__707; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__708; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__709; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__710 }
  | _ -> failwith "DT: impossible branch"
))

# 502 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__711, dtb__712) -> (match dtb__711 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__713; Base_dPair.f_Base_dPair_dPair_second = dtb__714 } -> (if (dtb__713 = mc0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__713; Base_dPair.f_Base_dPair_dPair_second = dtb__714 }, ((v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId mc0) dtb__712))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 498 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dsolsDelta = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__715, dtb__716) -> (match dtb__715 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__717; Base_dPair.f_Base_dPair_dPair_second = dtb__718 } -> ((v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId dtb__717) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 485 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPutSols = (fun ec sols2 -> ((fun delta -> ((fun soltbl2 -> (((v_Vuna_dCompiler_dElab_dTypes_decPutSolsRaw ec) sols2) soltbl2)) (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dInt.v_Hashable_uInt) delta) (v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)))) ((v_Vuna_dCompiler_dElab_dTypes_dsolsDelta (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) sols2)))

# 508 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_dmemDataNameIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__719, dtb__720) -> (if ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__719) = mc0) then true else ((v_Vuna_dCompiler_dElab_dTypes_dmemDataNameIn mc0) dtb__720))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 515 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decAddDef = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__721; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__722; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__723; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__724; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__725; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__726; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__727; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__728; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__729; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__730; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__731; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__732; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__733; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__734; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__735; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__736; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__737; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__738; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__739; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__740; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__741; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__742 } -> ((fun delta -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__721; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__722; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = (Base_dList.C_Base_dList_dList_Cons (mc1, dtb__723)); f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__724; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__725; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__726; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__727; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__728; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__729; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = delta; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__731; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__732; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__733; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__734; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__735; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__736; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__737; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__738; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__739; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__740; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__741; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__742 }) (if ((v_Vuna_dCompiler_dElab_dTypes_dmemDataNameIn (Base_dPair.v_Base_dPair_dfirstOf mc1)) dtb__724) then dtb__730 else ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) (Base_dPair.v_Base_dPair_dfirstOf mc1)) (Base_dPair.v_Base_dPair_dsecondOf mc1)) dtb__730)))
  | _ -> failwith "DT: impossible branch"
))

# 524 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decRemoveDefTbl = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__743; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__744; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__745; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__746; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__747; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__748; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__749; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__750; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__751; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__752; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__753; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__754; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__755; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__756; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__757; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__758; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__759; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__760; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__761; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__762; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__763; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__764 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__743; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__744; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__745; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__746; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__747; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__748; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__749; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__750; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__751; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dfilter (fun p -> (Base_dBool.v_Base_dBool_dnot ((Base_dPair.v_Base_dPair_dfirstOf p) = mc0)))) ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dString.v_Eq_uString) dtb__752))); f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__753; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__754; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__755; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__756; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__757; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__758; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__759; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__760; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__761; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__762; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__763; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__764 }
  | _ -> failwith "DT: impossible branch"
))

# 541 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddataCtorPairs = (fun d -> ((Base_dList.v_Base_dList_dmap (fun c -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dPair.f_Base_dPair_dPair_second = c })) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

# 530 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decAddData = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__765; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__766; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__767; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__768; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__769; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__770; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__771; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__772; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__773; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__774; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__775; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__776; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__777; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__778; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__779; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__780; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__781; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__782; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__783; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__784; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__785; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__786 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__765; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__766; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__767; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = ((Base_dList.v_Base_dList_dappend dtb__768) (Base_dList.C_Base_dList_dList_Cons (mc1, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__769; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__770; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__771; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__772; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__773; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__774; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__775; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__776; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__777; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__778; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__779; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) (v_Vuna_dCompiler_dElab_dTypes_ddataCtorPairs mc1)) dtb__780); f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = (if (v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear mc1) then true else dtb__781); f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__782; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__783; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__784; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__785; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__786 }
  | _ -> failwith "DT: impossible branch"
))

# 537 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas = (fun datas -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTypes_ddataCtorPairs) datas)) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

# 544 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPutCtorTbl = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__787; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__788; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__789; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__790; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__791; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__792; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__793; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__794; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__795; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__796; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__797; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__798; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__799; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__800; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__801; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__802; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__803; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__804; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__805; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__806; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__807; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__808 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__787; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__788; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__789; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__790; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__791; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__792; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__793; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__794; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__795; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__796; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__797; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__798; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__799; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__800; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__801; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__803; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__804; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__805; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__806; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__807; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__808 }
  | _ -> failwith "DT: impossible branch"
))

# 551 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decHasLinear = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__809; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__810; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__811; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__812; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__813; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__814; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__815; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__816; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__817; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__818; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__819; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__820; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__821; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__822; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__823; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__824; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__825; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__826; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__827; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__828; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__829; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__830 } -> dtb__825
  | _ -> failwith "DT: impossible branch"
))

# 557 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decMetaSpans = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__831; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__832; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__833; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__834; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__835; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__836; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__837; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__838; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__839; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__840; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__841; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__842; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__843; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__844; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__845; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__846; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__847; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__848; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__849; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__850; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__851; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__852 } -> dtb__848
  | _ -> failwith "DT: impossible branch"
))

# 562 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPutMetaSpans = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__853; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__854; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__855; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__856; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__857; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__858; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__859; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__860; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__861; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__862; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__863; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__864; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__865; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__866; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__867; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__868; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__869; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__870; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__871; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__872; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__873; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__874 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__853; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__854; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__855; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__856; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__857; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__858; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__859; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__860; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__861; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__862; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__863; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__864; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__865; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__866; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__867; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__868; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__869; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__871; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__872; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__873; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__874 }
  | _ -> failwith "DT: impossible branch"
))

# 568 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decUseSpans = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__875; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__876; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__877; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__878; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__879; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__880; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__881; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__882; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__883; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__884; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__885; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__886; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__887; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__888; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__889; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__890; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__891; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__892; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__893; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__894; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__895; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__896 } -> dtb__893
  | _ -> failwith "DT: impossible branch"
))

# 573 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPutUseSpans = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__897; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__898; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__899; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__900; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__901; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__902; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__903; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__904; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__905; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__906; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__907; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__908; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__909; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__910; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__911; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__912; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__913; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__914; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__915; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__916; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__917; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__918 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__897; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__898; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__899; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__900; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__901; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__902; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__903; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__904; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__905; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__906; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__907; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__908; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__909; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__910; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__911; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__912; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__913; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__914; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__916; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__917; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__918 }
  | _ -> failwith "DT: impossible branch"
))

# 580 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decWarnings = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__919; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__920; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__921; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__922; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__923; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__924; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__925; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__926; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__927; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__928; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__929; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__930; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__931; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__932; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__933; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__934; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__935; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__936; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__937; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__938; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__939; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__940 } -> dtb__938
  | _ -> failwith "DT: impossible branch"
))

# 585 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPutWarnings = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__941; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__942; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__943; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__944; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__945; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__946; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__947; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__948; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__949; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__950; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__951; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__952; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__953; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__954; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__955; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__956; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__957; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__958; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__959; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__960; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__961; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__962 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__941; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__942; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__943; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__944; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__945; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__946; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__947; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__948; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__949; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__950; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__951; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__952; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__953; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__954; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__955; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__956; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__957; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__958; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__959; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__961; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__962 }
  | _ -> failwith "DT: impossible branch"
))

# 591 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decAddWarning = (fun ec d -> ((v_Vuna_dCompiler_dElab_dTypes_decPutWarnings ec) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTypes_decWarnings ec)) (Base_dList.C_Base_dList_dList_Cons (d, Base_dList.C_Base_dList_dList_Nil)))))

# 595 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decCounters = (fun e -> (e).f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters)

# 598 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decBump = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__963; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__964; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__965; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__966; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__967; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__968; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__969; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__970; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__971; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__972; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__973; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__974; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__975; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__976; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__977; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__978; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__979; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__980; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__981; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__982; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__983; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__984 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__963; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__964; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__965; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__966; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__967; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__968; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__969; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__970; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__971; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__972; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__973; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__974; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__975; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__976; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__977; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__978; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__979; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__980; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__981; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__982; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = (Base_dList.C_Base_dList_dList_Cons (mc1, dtb__983)); f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__984 }
  | _ -> failwith "DT: impossible branch"
))

# 604 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decErrors = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__985; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__986; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__987; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__988; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__989; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__990; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__991; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__992; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__993; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__994; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__995; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__996; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__997; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__998; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__999; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__1000; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__1001; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__1002; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__1003; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__1004; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__1005; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__1006 } -> dtb__1006
  | _ -> failwith "DT: impossible branch"
))

# 608 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decAddError = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__1007; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__1008; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__1009; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__1010; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__1011; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__1012; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__1013; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__1014; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__1015; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__1016; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__1017; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__1018; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__1019; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__1020; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__1021; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__1022; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__1023; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__1024; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__1025; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__1026; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__1027; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__1028 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__1007; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__1008; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__1009; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__1010; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__1011; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__1012; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__1013; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__1014; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__1015; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__1016; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__1017; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__1018; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__1019; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__1020; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__1021; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__1022; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__1023; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__1024; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__1025; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__1026; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__1027; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = (Base_dList.C_Base_dList_dList_Cons (mc1, dtb__1028)) }
  | _ -> failwith "DT: impossible branch"
))

# 613 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_ddatasHaveLinear = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1029, dtb__1030) -> (if (v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear dtb__1029) then true else (v_Vuna_dCompiler_dElab_dTypes_ddatasHaveLinear dtb__1030))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 634 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dctxDepth = (fun ctx -> (ctx).f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxDepthF)

# 637 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dctxBind = (fun mc0 mc1 mc2 -> (match mc2 with
  | { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__1031; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxEnvF = dtb__1032; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__1033; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxDepthF = dtb__1034 } -> { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }, dtb__1031)); f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxEnvF = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (mc0, dtb__1034, Base_dList.C_Base_dList_dList_Nil)))), dtb__1032)); f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__1033; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxDepthF = (dtb__1034 + 1) }
  | _ -> failwith "DT: impossible branch"
))

# 642 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dctxBindValue = (fun mc0 mc1 mc2 -> (match mc2 with
  | { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__1035; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxEnvF = dtb__1036; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__1037; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxDepthF = dtb__1038 } -> { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote dtb__1038) mc1) }, dtb__1035)); f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxEnvF = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (mc0, dtb__1038, Base_dList.C_Base_dList_dList_Nil)))), dtb__1036)); f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__1037; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxDepthF = (dtb__1038 + 1) }
  | _ -> failwith "DT: impossible branch"
))

# 647 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dctxRefine = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__1039; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxEnvF = dtb__1040; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__1041; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxDepthF = dtb__1042 } -> { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__1039; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxEnvF = dtb__1040; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = ((Base_dList.v_Base_dList_dappend dtb__1041) mc1); f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxDepthF = dtb__1042 }
  | _ -> failwith "DT: impossible branch"
))

# 650 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1043, dtb__1044) -> (match dtb__1043 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1045; Base_dPair.f_Base_dPair_dPair_second = dtb__1046 } -> (if (dtb__1045 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = mc2; Base_dPair.f_Base_dPair_dPair_second = dtb__1046 })) else (((v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt mc0) dtb__1044) (mc2 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 655 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dctxLookup = (fun name ctx -> (((v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt name) (ctx).f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems) 0))

# 664 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1047, dtb__1048) -> (match dtb__1047 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1049; Base_dPair.f_Base_dPair_dPair_second = dtb__1050 } -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__1049, ((mc2 - mc1) - 1), Base_dList.C_Base_dList_dList_Nil)))), (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__1048) (mc1 + 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 671 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dctxEnv = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = dtb__1051; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxEnvF = dtb__1052; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = dtb__1053; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxDepthF = dtb__1054 } -> dtb__1052
  | _ -> failwith "DT: impossible branch"
))

# 700 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_drefineLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1055, dtb__1056) -> (match dtb__1055 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__1057; Base_dPair.f_Base_dPair_dPair_second = dtb__1058 } -> (if (dtb__1057 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1058)) else ((v_Vuna_dCompiler_dElab_dTypes_drefineLookup mc0) dtb__1056))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 680 "Vuna/Compiler/Elab/Types.vuna"
let rec v_Vuna_dCompiler_dElab_dTypes_drefineValue = (fun refs fuel v -> (if (fuel <= 0) then v else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__1059) -> (match dtb__1059 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__1060, dtb__1061, dtb__1062) -> ((fun sp2 -> (match ((v_Vuna_dCompiler_dElab_dTypes_drefineLookup dtb__1061) refs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1063) -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__1063)) sp2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__1060, dtb__1061, sp2))))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__1062))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__1064, dtb__1065) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__1064, ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__1065)))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__1066, dtb__1067) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__1066, ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__1067)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__1068, dtb__1069) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__1068), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__1069)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__1070, dtb__1071) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__1070), dtb__1071))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__1072, dtb__1073, dtb__1074) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__1072), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__1073), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__1074)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__1075, dtb__1076) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__1075, ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__1076)))
  | _ -> v
)))

# 659 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_drefinedEnv = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue mc0) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel)) mc1)
))

# 675 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dctxEnvRefined = (fun ctx -> ((v_Vuna_dCompiler_dElab_dTypes_drefinedEnv (ctx).f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals) (v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)))

# 705 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_devalCtx = (fun ctx ty -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnvRefined ctx)) ty))

# 710 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue = (fun ctx idx ty -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnvRefined ctx)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) (idx + 1)) ty)))

# 713 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_demptyCtx = { f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxEnvF = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxDepthF = 0 }

# 719 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_derrAt = (fun sp msg -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_drawAt sp) msg))

# 723 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dnewMeta = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__1077; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__1078; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__1079; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__1080; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__1081; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__1082; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__1083; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__1084; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__1085; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__1086; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__1087; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__1088; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__1089; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__1090; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__1091; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__1092; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__1093; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__1094; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__1095; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__1096; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__1097; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__1098 } -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__1077)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = (dtb__1077 + 1); f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__1078; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__1079; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__1080; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__1077; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0) }, dtb__1081)); f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__1082; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__1083; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__1084; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__1085; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__1086; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__1087; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__1088; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dInt.v_Hashable_uInt) dtb__1077) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0)) dtb__1089); f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__1090; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__1091; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__1092; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__1093; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__1094; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__1095; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__1096; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__1097; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__1098 } }
  | _ -> failwith "DT: impossible branch"
))

# 728 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dforceVal = (fun ec v -> ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))

# 748 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__1099; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__1100; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__1101; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__1102; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__1103; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__1104; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__1105; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__1106; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__1107; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = dtb__1108 } -> dtb__1099
  | _ -> failwith "DT: impossible branch"
))

# 751 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__1109; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__1110; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__1111; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__1112; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__1113; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__1114; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__1115; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__1116; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__1117; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = dtb__1118 } -> dtb__1110
  | _ -> failwith "DT: impossible branch"
))

# 754 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__1119; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__1120; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__1121; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__1122; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__1123; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__1124; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__1125; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__1126; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__1127; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = dtb__1128 } -> dtb__1121
  | _ -> failwith "DT: impossible branch"
))

# 757 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtProgSols = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__1129; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__1130; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__1131; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__1132; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__1133; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__1134; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__1135; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__1136; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__1137; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = dtb__1138 } -> dtb__1132
  | _ -> failwith "DT: impossible branch"
))

# 760 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__1139; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__1140; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__1141; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__1142; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__1143; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__1144; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__1145; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__1146; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__1147; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = dtb__1148 } -> dtb__1143
  | _ -> failwith "DT: impossible branch"
))

# 763 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__1149; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__1150; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__1151; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__1152; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__1153; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__1154; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__1155; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__1156; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__1157; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = dtb__1158 } -> dtb__1154
  | _ -> failwith "DT: impossible branch"
))

# 766 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__1159; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__1160; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__1161; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__1162; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__1163; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__1164; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__1165; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__1166; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__1167; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = dtb__1168 } -> dtb__1165
  | _ -> failwith "DT: impossible branch"
))

# 770 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__1169; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__1170; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__1171; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__1172; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__1173; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__1174; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__1175; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__1176; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__1177; f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = dtb__1178 } -> dtb__1178
  | _ -> failwith "DT: impossible branch"
))

# 775 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_dsolsToTbl = (fun sols -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dInt.v_Hashable_uInt) sols) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil)))

# 778 "Vuna/Compiler/Elab/Types.vuna"
let v_Vuna_dCompiler_dElab_dTypes_decPutDefTbl = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__1179; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__1180; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__1181; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__1182; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__1183; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__1184; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__1185; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__1186; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__1187; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = dtb__1188; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__1189; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__1190; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__1191; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__1192; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__1193; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__1194; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__1195; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__1196; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__1197; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__1198; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__1199; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__1200 } -> { f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__1179; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__1180; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = dtb__1181; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__1182; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = dtb__1183; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = dtb__1184; f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = dtb__1185; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__1186; f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = dtb__1187; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = mc1; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = dtb__1189; f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = dtb__1190; f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = dtb__1191; f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = dtb__1192; f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = dtb__1193; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = dtb__1194; f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = dtb__1195; f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = dtb__1196; f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = dtb__1197; f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__1198; f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = dtb__1199; f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = dtb__1200 }
  | _ -> failwith "DT: impossible branch"
))
