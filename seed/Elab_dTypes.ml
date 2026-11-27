open Vuna_runtime
type t_DtDef = C_DtDef_DtDef of (string) * (Core_dTerm.t_Term) * (Core_dTerm.t_Term) * (Base_dSource.t_Span B_dData_dMaybe.t_Maybe) | C_DtDef_DtAxiom of (string) * (Core_dTerm.t_Term) * (Base_dSource.t_Span B_dData_dMaybe.t_Maybe) | C_DtDef_DtExtern of (string) * (Core_dTerm.t_Term) * (string) * (Base_dSource.t_Span B_dData_dMaybe.t_Maybe)
and t_DtCtor = { f_DtCtor_dtCtorName : string; f_DtCtor_dtCtorFamily : string; f_DtCtor_dtCtorTelescope : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DtCtor_dtCtorType : Core_dTerm.t_Term; f_DtCtor_dtCtorSpan : Base_dSource.t_Span B_dData_dMaybe.t_Maybe }
and t_DtFieldMeta = { f_DtFieldMeta_dtFieldName : string; f_DtFieldMeta_dtFieldIndex : int; f_DtFieldMeta_dtFieldType : Core_dTerm.t_Term }
and t_DtData = { f_DtData_dtDataName : string; f_DtData_dtDataParams : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DtData_dtDataCtors : t_DtCtor B_dData_dList.t_List; f_DtData_dtDataKind : Core_dTerm.t_Term; f_DtData_dtDataViaClasses : string B_dData_dList.t_List; f_DtData_dtDataLinear : bool; f_DtData_dtDataRepr : Frontend_dAst.t_ReprTier; f_DtData_dtDataFields : t_DtFieldMeta B_dData_dList.t_List; f_DtData_dtDataIsRecord : bool }
and t_DtGoal = { f_DtGoal_dtGoalMeta : int; f_DtGoal_dtGoalSpan : Base_dSource.t_Span; f_DtGoal_dtGoalType : Core_dTerm.t_Value; f_DtGoal_dtGoalCtx : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DtGoal_dtGoalName : string }
and t_DtClass = { f_DtClass_dtClassName : string; f_DtClass_dtClassParams : string B_dData_dList.t_List; f_DtClass_dtClassSupers : Core_dTerm.t_Term B_dData_dList.t_List; f_DtClass_dtClassMethods : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DtClass_dtClassFieldTys : Core_dTerm.t_Term B_dData_dList.t_List; f_DtClass_dtClassMethodSpans : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List }
and t_DtInst = { f_DtInst_dtInstName : string; f_DtInst_dtInstSym : string; f_DtInst_dtInstKey : string; f_DtInst_dtInstTele : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DtInst_dtInstCtx : Core_dTerm.t_Term B_dData_dList.t_List; f_DtInst_dtInstHead : Core_dTerm.t_Term; f_DtInst_dtInstSpan : Base_dSource.t_Span B_dData_dMaybe.t_Maybe }
and t_InstStore = { f_InstStore_instsList : t_DtInst B_dData_dList.t_List; f_InstStore_instsByFamily : (string, t_DtInst B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap }
and t_ConstraintKind = C_ConstraintKind_CkDict | C_ConstraintKind_CkRow
and t_Constraint = { f_Constraint_conId : int; f_Constraint_conKind : t_ConstraintKind; f_Constraint_conMeta : int; f_Constraint_conDom : Core_dTerm.t_Value; f_Constraint_conSpan : Base_dSource.t_Span B_dData_dMaybe.t_Maybe; f_Constraint_conDepth : int }
and t_ConstraintStore = { f_ConstraintStore_csPending : t_Constraint B_dContainer_dQueue.t_Queue; f_ConstraintStore_csNextId : int; f_ConstraintStore_csTried : (int, int) B_dContainer_dHashMap.t_HashMap; f_ConstraintStore_csSolsCount : int; f_ConstraintStore_csPassNext : int; f_ConstraintStore_csPassSols : int; f_ConstraintStore_csCtorIndexComplete : bool }
and t_Ec = { f_Ec_ecNext : int; f_Ec_ecSols : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Ec_ecDefsRev : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Ec_ecDatas : t_DtData B_dData_dList.t_List; f_Ec_ecDepthOfMeta : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Ec_ecGoals : t_DtGoal B_dData_dList.t_List; f_Ec_ecInsts : t_InstStore; f_Ec_ecClasses : t_DtClass B_dData_dList.t_List; f_Ec_ecConstraints : t_ConstraintStore; f_Ec_ecDefTbl : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap; f_Ec_ecGlobalsTbl : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap; f_Ec_ecSolTbl : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap; f_Ec_ecDepthTbl : (int, int) B_dContainer_dHashMap.t_HashMap; f_Ec_ecGlobalsComplete : bool; f_Ec_ecClausesTbl : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_Ec_ecCtorTbl : (string, t_DtCtor) B_dContainer_dHashMap.t_HashMap; f_Ec_ecHasLinear : bool; f_Ec_ecMetaSpans : (int, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Ec_ecUseSpans : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Ec_ecWarnings : Base_dDiag.t_Diagnostic B_dData_dList.t_List; f_Ec_ecCounters : string B_dData_dList.t_List; f_Ec_ecErrors : Base_dDiag.t_Diagnostic B_dData_dList.t_List }
and t_Ctx = { f_Ctx_ctxItems : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Ctx_ctxEnvF : Core_dTerm.t_Value B_dData_dList.t_List; f_Ctx_ctxRefVals : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Ctx_ctxDepthF : int; f_Ctx_ctxEnvRF : Core_dTerm.t_Value B_dData_dList.t_List }
and t_DtProgram = { f_DtProgram_dtProgDatas : t_DtData B_dData_dList.t_List; f_DtProgram_dtProgDefs : t_DtDef B_dData_dList.t_List; f_DtProgram_dtProgGoals : t_DtGoal B_dData_dList.t_List; f_DtProgram_dtProgSols : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DtProgram_dtProgGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DtProgram_dtProgInsts : t_DtInst B_dData_dList.t_List; f_DtProgram_dtProgClasses : t_DtClass B_dData_dList.t_List; f_DtProgram_dtProgNext : int; f_DtProgram_dtProgDepths : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DtProgram_dtProgWarnings : Base_dDiag.t_Diagnostic B_dData_dList.t_List }

# 31 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDefName = (fun (dtb_u_u1 : t_DtDef) -> (match dtb_u_u1 with
  | C_DtDef_DtExtern (dtb_u_u2, dtb_u_u3, dtb_u_u4, dtb_u_u5) -> dtb_u_u2
  | C_DtDef_DtAxiom (dtb_u_u6, dtb_u_u7, dtb_u_u8) -> dtb_u_u6
  | C_DtDef_DtDef (dtb_u_u9, dtb_u_u10, dtb_u_u11, dtb_u_u12) -> dtb_u_u9
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDefType = (fun (dtb_u_u13 : t_DtDef) -> (match dtb_u_u13 with
  | C_DtDef_DtExtern (dtb_u_u14, dtb_u_u15, dtb_u_u16, dtb_u_u17) -> dtb_u_u15
  | C_DtDef_DtAxiom (dtb_u_u18, dtb_u_u19, dtb_u_u20) -> dtb_u_u19
  | C_DtDef_DtDef (dtb_u_u21, dtb_u_u22, dtb_u_u23, dtb_u_u24) -> dtb_u_u22
  | _ -> failwith "DT: impossible branch"
))

# 41 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDefBody = (fun (dtb_u_u25 : t_DtDef) -> (match dtb_u_u25 with
  | C_DtDef_DtExtern (dtb_u_u26, dtb_u_u27, dtb_u_u28, dtb_u_u29) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_DtDef_DtAxiom (dtb_u_u30, dtb_u_u31, dtb_u_u32) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_DtDef_DtDef (dtb_u_u33, dtb_u_u34, dtb_u_u35, dtb_u_u36) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u35))
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDefHasBody = (fun (dtb_u_u37 : t_DtDef) -> (match dtb_u_u37 with
  | C_DtDef_DtExtern (dtb_u_u38, dtb_u_u39, dtb_u_u40, dtb_u_u41) -> true
  | C_DtDef_DtAxiom (dtb_u_u42, dtb_u_u43, dtb_u_u44) -> false
  | C_DtDef_DtDef (dtb_u_u45, dtb_u_u46, dtb_u_u47, dtb_u_u48) -> true
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDefExtern = (fun (dtb_u_u49 : t_DtDef) -> (match dtb_u_u49 with
  | C_DtDef_DtExtern (dtb_u_u50, dtb_u_u51, dtb_u_u52, dtb_u_u53) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u52))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 58 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDefSpan = (fun (dtb_u_u54 : t_DtDef) -> (match dtb_u_u54 with
  | C_DtDef_DtExtern (dtb_u_u55, dtb_u_u56, dtb_u_u57, dtb_u_u58) -> dtb_u_u58
  | C_DtDef_DtAxiom (dtb_u_u59, dtb_u_u60, dtb_u_u61) -> dtb_u_u61
  | C_DtDef_DtDef (dtb_u_u62, dtb_u_u63, dtb_u_u64, dtb_u_u65) -> dtb_u_u65
  | _ -> failwith "DT: impossible branch"
))

# 138 "Vuna/Compiler/Elab/Types.vuna"
let rec v_flattenTaggedApp = (fun (dtb_u_u66 : Core_dTerm.t_Term) -> (match dtb_u_u66 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u67) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u67; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | Core_dTerm.C_Term_TApp (dtb_u_u68, dtb_u_u69, dtb_u_u70) -> (let dtb_u_u71 = (v_flattenTaggedApp dtb_u_u68) in (match dtb_u_u71 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u72) -> (match dtb_u_u72 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u73; B_dData_dPair.f_Pair_second = dtb_u_u74 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u73; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb_u_u74) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u69; B_dData_dPair.f_Pair_second = dtb_u_u70 }, B_dData_dList.C_List_Nil))) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 160 "Vuna/Compiler/Elab/Types.vuna"
let v_instFamilyOf = (fun (dtb_u_u75 : t_DtInst) -> (let dtb_u_u76 = (v_flattenTaggedApp (dtb_u_u75).f_DtInst_dtInstHead) in (match dtb_u_u76 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u77) -> (match dtb_u_u77 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u78; B_dData_dPair.f_Pair_second = dtb_u_u79 } -> dtb_u_u78
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 167 "Vuna/Compiler/Elab/Types.vuna"
let v_instStoreEmpty = { f_InstStore_instsList = B_dData_dList.C_List_Nil; f_InstStore_instsByFamily = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil) }

# 177 "Vuna/Compiler/Elab/Types.vuna"
let v_instStorePush = (fun (dtb_u_u80 : t_InstStore) (dtb_u_u81 : t_DtInst) -> (let dtb_u_u82 = (v_instFamilyOf dtb_u_u81) in (let dtb_u_u83 = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u82) (dtb_u_u80).f_InstStore_instsByFamily) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u84) -> dtb_u_u84
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in { f_InstStore_instsList = ((B_dData_dList.v_append (dtb_u_u80).f_InstStore_instsList) (B_dData_dList.C_List__x58__x58_ (dtb_u_u81, B_dData_dList.C_List_Nil))); f_InstStore_instsByFamily = (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u82) ((B_dData_dList.v_append dtb_u_u83) (B_dData_dList.C_List__x58__x58_ (dtb_u_u81, B_dData_dList.C_List_Nil)))) (dtb_u_u80).f_InstStore_instsByFamily) })))

# 172 "Vuna/Compiler/Elab/Types.vuna"
let rec v_instStoreOf = (fun (dtb_u_u85 : t_DtInst B_dData_dList.t_List) -> (match dtb_u_u85 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u86, dtb_u_u87) -> ((v_instStorePush (v_instStoreOf dtb_u_u87)) dtb_u_u86)
  | B_dData_dList.C_List_Nil -> v_instStoreEmpty
  | _ -> failwith "DT: impossible branch"
))

# 191 "Vuna/Compiler/Elab/Types.vuna"
let v_instStoreFamily = (fun (dtb_u_u88 : t_InstStore) (dtb_u_u89 : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u89) (dtb_u_u88).f_InstStore_instsByFamily) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u90) -> dtb_u_u90
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Elab/Types.vuna"
let v_csEmpty = { f_ConstraintStore_csPending = B_dContainer_dQueue.v_empty; f_ConstraintStore_csNextId = 0; f_ConstraintStore_csTried = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil); f_ConstraintStore_csSolsCount = 0; f_ConstraintStore_csPassNext = (0 - 1); f_ConstraintStore_csPassSols = (0 - 1); f_ConstraintStore_csCtorIndexComplete = false }

# 275 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutNext = (fun (dtb_u_u91 : t_Ec) (dtb_u_u92 : int) -> (match dtb_u_u91 with
  | { f_Ec_ecNext = dtb_u_u93; f_Ec_ecSols = dtb_u_u94; f_Ec_ecDefsRev = dtb_u_u95; f_Ec_ecDatas = dtb_u_u96; f_Ec_ecDepthOfMeta = dtb_u_u97; f_Ec_ecGoals = dtb_u_u98; f_Ec_ecInsts = dtb_u_u99; f_Ec_ecClasses = dtb_u_u100; f_Ec_ecConstraints = dtb_u_u101; f_Ec_ecDefTbl = dtb_u_u102; f_Ec_ecGlobalsTbl = dtb_u_u103; f_Ec_ecSolTbl = dtb_u_u104; f_Ec_ecDepthTbl = dtb_u_u105; f_Ec_ecGlobalsComplete = dtb_u_u106; f_Ec_ecClausesTbl = dtb_u_u107; f_Ec_ecCtorTbl = dtb_u_u108; f_Ec_ecHasLinear = dtb_u_u109; f_Ec_ecMetaSpans = dtb_u_u110; f_Ec_ecUseSpans = dtb_u_u111; f_Ec_ecWarnings = dtb_u_u112; f_Ec_ecCounters = dtb_u_u113; f_Ec_ecErrors = dtb_u_u114 } -> { f_Ec_ecNext = dtb_u_u92; f_Ec_ecSols = dtb_u_u94; f_Ec_ecDefsRev = dtb_u_u95; f_Ec_ecDatas = dtb_u_u96; f_Ec_ecDepthOfMeta = dtb_u_u97; f_Ec_ecGoals = dtb_u_u98; f_Ec_ecInsts = dtb_u_u99; f_Ec_ecClasses = dtb_u_u100; f_Ec_ecConstraints = dtb_u_u101; f_Ec_ecDefTbl = dtb_u_u102; f_Ec_ecGlobalsTbl = dtb_u_u103; f_Ec_ecSolTbl = dtb_u_u104; f_Ec_ecDepthTbl = dtb_u_u105; f_Ec_ecGlobalsComplete = dtb_u_u106; f_Ec_ecClausesTbl = dtb_u_u107; f_Ec_ecCtorTbl = dtb_u_u108; f_Ec_ecHasLinear = dtb_u_u109; f_Ec_ecMetaSpans = dtb_u_u110; f_Ec_ecUseSpans = dtb_u_u111; f_Ec_ecWarnings = dtb_u_u112; f_Ec_ecCounters = dtb_u_u113; f_Ec_ecErrors = dtb_u_u114 }
  | _ -> failwith "DT: impossible branch"
))

# 301 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutClausesTbl = (fun (dtb_u_u115 : t_Ec) (dtb_u_u116 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u115 with
  | { f_Ec_ecNext = dtb_u_u117; f_Ec_ecSols = dtb_u_u118; f_Ec_ecDefsRev = dtb_u_u119; f_Ec_ecDatas = dtb_u_u120; f_Ec_ecDepthOfMeta = dtb_u_u121; f_Ec_ecGoals = dtb_u_u122; f_Ec_ecInsts = dtb_u_u123; f_Ec_ecClasses = dtb_u_u124; f_Ec_ecConstraints = dtb_u_u125; f_Ec_ecDefTbl = dtb_u_u126; f_Ec_ecGlobalsTbl = dtb_u_u127; f_Ec_ecSolTbl = dtb_u_u128; f_Ec_ecDepthTbl = dtb_u_u129; f_Ec_ecGlobalsComplete = dtb_u_u130; f_Ec_ecClausesTbl = dtb_u_u131; f_Ec_ecCtorTbl = dtb_u_u132; f_Ec_ecHasLinear = dtb_u_u133; f_Ec_ecMetaSpans = dtb_u_u134; f_Ec_ecUseSpans = dtb_u_u135; f_Ec_ecWarnings = dtb_u_u136; f_Ec_ecCounters = dtb_u_u137; f_Ec_ecErrors = dtb_u_u138 } -> { f_Ec_ecNext = dtb_u_u117; f_Ec_ecSols = dtb_u_u118; f_Ec_ecDefsRev = dtb_u_u119; f_Ec_ecDatas = dtb_u_u120; f_Ec_ecDepthOfMeta = dtb_u_u121; f_Ec_ecGoals = dtb_u_u122; f_Ec_ecInsts = dtb_u_u123; f_Ec_ecClasses = dtb_u_u124; f_Ec_ecConstraints = dtb_u_u125; f_Ec_ecDefTbl = dtb_u_u126; f_Ec_ecGlobalsTbl = dtb_u_u127; f_Ec_ecSolTbl = dtb_u_u128; f_Ec_ecDepthTbl = dtb_u_u129; f_Ec_ecGlobalsComplete = dtb_u_u130; f_Ec_ecClausesTbl = dtb_u_u116; f_Ec_ecCtorTbl = dtb_u_u132; f_Ec_ecHasLinear = dtb_u_u133; f_Ec_ecMetaSpans = dtb_u_u134; f_Ec_ecUseSpans = dtb_u_u135; f_Ec_ecWarnings = dtb_u_u136; f_Ec_ecCounters = dtb_u_u137; f_Ec_ecErrors = dtb_u_u138 }
  | _ -> failwith "DT: impossible branch"
))

# 328 "Vuna/Compiler/Elab/Types.vuna"
let v_ecDefs = (fun (dtb_u_u139 : t_Ec) -> (match dtb_u_u139 with
  | { f_Ec_ecNext = dtb_u_u140; f_Ec_ecSols = dtb_u_u141; f_Ec_ecDefsRev = dtb_u_u142; f_Ec_ecDatas = dtb_u_u143; f_Ec_ecDepthOfMeta = dtb_u_u144; f_Ec_ecGoals = dtb_u_u145; f_Ec_ecInsts = dtb_u_u146; f_Ec_ecClasses = dtb_u_u147; f_Ec_ecConstraints = dtb_u_u148; f_Ec_ecDefTbl = dtb_u_u149; f_Ec_ecGlobalsTbl = dtb_u_u150; f_Ec_ecSolTbl = dtb_u_u151; f_Ec_ecDepthTbl = dtb_u_u152; f_Ec_ecGlobalsComplete = dtb_u_u153; f_Ec_ecClausesTbl = dtb_u_u154; f_Ec_ecCtorTbl = dtb_u_u155; f_Ec_ecHasLinear = dtb_u_u156; f_Ec_ecMetaSpans = dtb_u_u157; f_Ec_ecUseSpans = dtb_u_u158; f_Ec_ecWarnings = dtb_u_u159; f_Ec_ecCounters = dtb_u_u160; f_Ec_ecErrors = dtb_u_u161 } -> (B_dData_dList.v_reverse dtb_u_u142)
  | _ -> failwith "DT: impossible branch"
))

# 336 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutGlobalsTbl = (fun (dtb_u_u162 : t_Ec) (dtb_u_u163 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u162 with
  | { f_Ec_ecNext = dtb_u_u164; f_Ec_ecSols = dtb_u_u165; f_Ec_ecDefsRev = dtb_u_u166; f_Ec_ecDatas = dtb_u_u167; f_Ec_ecDepthOfMeta = dtb_u_u168; f_Ec_ecGoals = dtb_u_u169; f_Ec_ecInsts = dtb_u_u170; f_Ec_ecClasses = dtb_u_u171; f_Ec_ecConstraints = dtb_u_u172; f_Ec_ecDefTbl = dtb_u_u173; f_Ec_ecGlobalsTbl = dtb_u_u174; f_Ec_ecSolTbl = dtb_u_u175; f_Ec_ecDepthTbl = dtb_u_u176; f_Ec_ecGlobalsComplete = dtb_u_u177; f_Ec_ecClausesTbl = dtb_u_u178; f_Ec_ecCtorTbl = dtb_u_u179; f_Ec_ecHasLinear = dtb_u_u180; f_Ec_ecMetaSpans = dtb_u_u181; f_Ec_ecUseSpans = dtb_u_u182; f_Ec_ecWarnings = dtb_u_u183; f_Ec_ecCounters = dtb_u_u184; f_Ec_ecErrors = dtb_u_u185 } -> { f_Ec_ecNext = dtb_u_u164; f_Ec_ecSols = dtb_u_u165; f_Ec_ecDefsRev = dtb_u_u166; f_Ec_ecDatas = dtb_u_u167; f_Ec_ecDepthOfMeta = dtb_u_u168; f_Ec_ecGoals = dtb_u_u169; f_Ec_ecInsts = dtb_u_u170; f_Ec_ecClasses = dtb_u_u171; f_Ec_ecConstraints = dtb_u_u172; f_Ec_ecDefTbl = dtb_u_u173; f_Ec_ecGlobalsTbl = dtb_u_u163; f_Ec_ecSolTbl = dtb_u_u175; f_Ec_ecDepthTbl = dtb_u_u176; f_Ec_ecGlobalsComplete = dtb_u_u177; f_Ec_ecClausesTbl = dtb_u_u178; f_Ec_ecCtorTbl = dtb_u_u179; f_Ec_ecHasLinear = dtb_u_u180; f_Ec_ecMetaSpans = dtb_u_u181; f_Ec_ecUseSpans = dtb_u_u182; f_Ec_ecWarnings = dtb_u_u183; f_Ec_ecCounters = dtb_u_u184; f_Ec_ecErrors = dtb_u_u185 }
  | _ -> failwith "DT: impossible branch"
))

# 365 "Vuna/Compiler/Elab/Types.vuna"
let v_ecSetGlobalsComplete = (fun (dtb_u_u186 : t_Ec) (dtb_u_u187 : bool) -> (match dtb_u_u186 with
  | { f_Ec_ecNext = dtb_u_u188; f_Ec_ecSols = dtb_u_u189; f_Ec_ecDefsRev = dtb_u_u190; f_Ec_ecDatas = dtb_u_u191; f_Ec_ecDepthOfMeta = dtb_u_u192; f_Ec_ecGoals = dtb_u_u193; f_Ec_ecInsts = dtb_u_u194; f_Ec_ecClasses = dtb_u_u195; f_Ec_ecConstraints = dtb_u_u196; f_Ec_ecDefTbl = dtb_u_u197; f_Ec_ecGlobalsTbl = dtb_u_u198; f_Ec_ecSolTbl = dtb_u_u199; f_Ec_ecDepthTbl = dtb_u_u200; f_Ec_ecGlobalsComplete = dtb_u_u201; f_Ec_ecClausesTbl = dtb_u_u202; f_Ec_ecCtorTbl = dtb_u_u203; f_Ec_ecHasLinear = dtb_u_u204; f_Ec_ecMetaSpans = dtb_u_u205; f_Ec_ecUseSpans = dtb_u_u206; f_Ec_ecWarnings = dtb_u_u207; f_Ec_ecCounters = dtb_u_u208; f_Ec_ecErrors = dtb_u_u209 } -> { f_Ec_ecNext = dtb_u_u188; f_Ec_ecSols = dtb_u_u189; f_Ec_ecDefsRev = dtb_u_u190; f_Ec_ecDatas = dtb_u_u191; f_Ec_ecDepthOfMeta = dtb_u_u192; f_Ec_ecGoals = dtb_u_u193; f_Ec_ecInsts = dtb_u_u194; f_Ec_ecClasses = dtb_u_u195; f_Ec_ecConstraints = dtb_u_u196; f_Ec_ecDefTbl = dtb_u_u197; f_Ec_ecGlobalsTbl = dtb_u_u198; f_Ec_ecSolTbl = dtb_u_u199; f_Ec_ecDepthTbl = dtb_u_u200; f_Ec_ecGlobalsComplete = dtb_u_u187; f_Ec_ecClausesTbl = dtb_u_u202; f_Ec_ecCtorTbl = dtb_u_u203; f_Ec_ecHasLinear = dtb_u_u204; f_Ec_ecMetaSpans = dtb_u_u205; f_Ec_ecUseSpans = dtb_u_u206; f_Ec_ecWarnings = dtb_u_u207; f_Ec_ecCounters = dtb_u_u208; f_Ec_ecErrors = dtb_u_u209 }
  | _ -> failwith "DT: impossible branch"
))

# 394 "Vuna/Compiler/Elab/Types.vuna"
let v_ecInstList = (fun (dtb_u_u210 : t_Ec) -> (match dtb_u_u210 with
  | { f_Ec_ecNext = dtb_u_u211; f_Ec_ecSols = dtb_u_u212; f_Ec_ecDefsRev = dtb_u_u213; f_Ec_ecDatas = dtb_u_u214; f_Ec_ecDepthOfMeta = dtb_u_u215; f_Ec_ecGoals = dtb_u_u216; f_Ec_ecInsts = dtb_u_u217; f_Ec_ecClasses = dtb_u_u218; f_Ec_ecConstraints = dtb_u_u219; f_Ec_ecDefTbl = dtb_u_u220; f_Ec_ecGlobalsTbl = dtb_u_u221; f_Ec_ecSolTbl = dtb_u_u222; f_Ec_ecDepthTbl = dtb_u_u223; f_Ec_ecGlobalsComplete = dtb_u_u224; f_Ec_ecClausesTbl = dtb_u_u225; f_Ec_ecCtorTbl = dtb_u_u226; f_Ec_ecHasLinear = dtb_u_u227; f_Ec_ecMetaSpans = dtb_u_u228; f_Ec_ecUseSpans = dtb_u_u229; f_Ec_ecWarnings = dtb_u_u230; f_Ec_ecCounters = dtb_u_u231; f_Ec_ecErrors = dtb_u_u232 } -> (dtb_u_u217).f_InstStore_instsList
  | _ -> failwith "DT: impossible branch"
))

# 398 "Vuna/Compiler/Elab/Types.vuna"
let v_ecInstsFamily = (fun (dtb_u_u233 : t_Ec) (dtb_u_u234 : string) -> (match dtb_u_u233 with
  | { f_Ec_ecNext = dtb_u_u235; f_Ec_ecSols = dtb_u_u236; f_Ec_ecDefsRev = dtb_u_u237; f_Ec_ecDatas = dtb_u_u238; f_Ec_ecDepthOfMeta = dtb_u_u239; f_Ec_ecGoals = dtb_u_u240; f_Ec_ecInsts = dtb_u_u241; f_Ec_ecClasses = dtb_u_u242; f_Ec_ecConstraints = dtb_u_u243; f_Ec_ecDefTbl = dtb_u_u244; f_Ec_ecGlobalsTbl = dtb_u_u245; f_Ec_ecSolTbl = dtb_u_u246; f_Ec_ecDepthTbl = dtb_u_u247; f_Ec_ecGlobalsComplete = dtb_u_u248; f_Ec_ecClausesTbl = dtb_u_u249; f_Ec_ecCtorTbl = dtb_u_u250; f_Ec_ecHasLinear = dtb_u_u251; f_Ec_ecMetaSpans = dtb_u_u252; f_Ec_ecUseSpans = dtb_u_u253; f_Ec_ecWarnings = dtb_u_u254; f_Ec_ecCounters = dtb_u_u255; f_Ec_ecErrors = dtb_u_u256 } -> ((v_instStoreFamily dtb_u_u241) dtb_u_u234)
  | _ -> failwith "DT: impossible branch"
))

# 416 "Vuna/Compiler/Elab/Types.vuna"
let rec v_bucketCount = (fun (dtb_u_u257 : (string, t_DtInst B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u257 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u258, dtb_u_u259) -> ((B_dData_dList.v_length (B_dData_dPair.v_secondOf dtb_u_u258)) + (v_bucketCount dtb_u_u259))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 428 "Vuna/Compiler/Elab/Types.vuna"
let rec v_instNamesEq = (fun (dtb_u_u260 : string B_dData_dList.t_List) (dtb_u_u261 : string B_dData_dList.t_List) -> (match dtb_u_u260 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u262, dtb_u_u263) -> (match dtb_u_u261 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u264, dtb_u_u265) -> (if (dtb_u_u262 = dtb_u_u264) then ((v_instNamesEq dtb_u_u263) dtb_u_u265) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match dtb_u_u261 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u266, dtb_u_u267) -> false
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 434 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddGoal = (fun (dtb_u_u268 : t_Ec) (dtb_u_u269 : t_DtGoal) -> (match dtb_u_u268 with
  | { f_Ec_ecNext = dtb_u_u270; f_Ec_ecSols = dtb_u_u271; f_Ec_ecDefsRev = dtb_u_u272; f_Ec_ecDatas = dtb_u_u273; f_Ec_ecDepthOfMeta = dtb_u_u274; f_Ec_ecGoals = dtb_u_u275; f_Ec_ecInsts = dtb_u_u276; f_Ec_ecClasses = dtb_u_u277; f_Ec_ecConstraints = dtb_u_u278; f_Ec_ecDefTbl = dtb_u_u279; f_Ec_ecGlobalsTbl = dtb_u_u280; f_Ec_ecSolTbl = dtb_u_u281; f_Ec_ecDepthTbl = dtb_u_u282; f_Ec_ecGlobalsComplete = dtb_u_u283; f_Ec_ecClausesTbl = dtb_u_u284; f_Ec_ecCtorTbl = dtb_u_u285; f_Ec_ecHasLinear = dtb_u_u286; f_Ec_ecMetaSpans = dtb_u_u287; f_Ec_ecUseSpans = dtb_u_u288; f_Ec_ecWarnings = dtb_u_u289; f_Ec_ecCounters = dtb_u_u290; f_Ec_ecErrors = dtb_u_u291 } -> { f_Ec_ecNext = dtb_u_u270; f_Ec_ecSols = dtb_u_u271; f_Ec_ecDefsRev = dtb_u_u272; f_Ec_ecDatas = dtb_u_u273; f_Ec_ecDepthOfMeta = dtb_u_u274; f_Ec_ecGoals = ((B_dData_dList.v_append dtb_u_u275) (B_dData_dList.C_List__x58__x58_ (dtb_u_u269, B_dData_dList.C_List_Nil))); f_Ec_ecInsts = dtb_u_u276; f_Ec_ecClasses = dtb_u_u277; f_Ec_ecConstraints = dtb_u_u278; f_Ec_ecDefTbl = dtb_u_u279; f_Ec_ecGlobalsTbl = dtb_u_u280; f_Ec_ecSolTbl = dtb_u_u281; f_Ec_ecDepthTbl = dtb_u_u282; f_Ec_ecGlobalsComplete = dtb_u_u283; f_Ec_ecClausesTbl = dtb_u_u284; f_Ec_ecCtorTbl = dtb_u_u285; f_Ec_ecHasLinear = dtb_u_u286; f_Ec_ecMetaSpans = dtb_u_u287; f_Ec_ecUseSpans = dtb_u_u288; f_Ec_ecWarnings = dtb_u_u289; f_Ec_ecCounters = dtb_u_u290; f_Ec_ecErrors = dtb_u_u291 }
  | _ -> failwith "DT: impossible branch"
))

# 463 "Vuna/Compiler/Elab/Types.vuna"
let rec v_hasInstKey = (fun (dtb_u_u292 : string) (dtb_u_u293 : t_DtInst B_dData_dList.t_List) -> (match dtb_u_u293 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u294, dtb_u_u295) -> (if ((dtb_u_u294).f_DtInst_dtInstKey = dtb_u_u292) then true else ((v_hasInstKey dtb_u_u292) dtb_u_u295))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 468 "Vuna/Compiler/Elab/Types.vuna"
let rec v_hasInstSym = (fun (dtb_u_u296 : string) (dtb_u_u297 : t_DtInst B_dData_dList.t_List) -> (match dtb_u_u297 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u298, dtb_u_u299) -> (if ((dtb_u_u298).f_DtInst_dtInstSym = dtb_u_u296) then true else ((v_hasInstSym dtb_u_u296) dtb_u_u299))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 472 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddInstRaw = (fun (dtb_u_u300 : t_Ec) (dtb_u_u301 : t_DtInst) -> (match dtb_u_u300 with
  | { f_Ec_ecNext = dtb_u_u302; f_Ec_ecSols = dtb_u_u303; f_Ec_ecDefsRev = dtb_u_u304; f_Ec_ecDatas = dtb_u_u305; f_Ec_ecDepthOfMeta = dtb_u_u306; f_Ec_ecGoals = dtb_u_u307; f_Ec_ecInsts = dtb_u_u308; f_Ec_ecClasses = dtb_u_u309; f_Ec_ecConstraints = dtb_u_u310; f_Ec_ecDefTbl = dtb_u_u311; f_Ec_ecGlobalsTbl = dtb_u_u312; f_Ec_ecSolTbl = dtb_u_u313; f_Ec_ecDepthTbl = dtb_u_u314; f_Ec_ecGlobalsComplete = dtb_u_u315; f_Ec_ecClausesTbl = dtb_u_u316; f_Ec_ecCtorTbl = dtb_u_u317; f_Ec_ecHasLinear = dtb_u_u318; f_Ec_ecMetaSpans = dtb_u_u319; f_Ec_ecUseSpans = dtb_u_u320; f_Ec_ecWarnings = dtb_u_u321; f_Ec_ecCounters = dtb_u_u322; f_Ec_ecErrors = dtb_u_u323 } -> { f_Ec_ecNext = dtb_u_u302; f_Ec_ecSols = dtb_u_u303; f_Ec_ecDefsRev = dtb_u_u304; f_Ec_ecDatas = dtb_u_u305; f_Ec_ecDepthOfMeta = dtb_u_u306; f_Ec_ecGoals = dtb_u_u307; f_Ec_ecInsts = ((v_instStorePush dtb_u_u308) dtb_u_u301); f_Ec_ecClasses = dtb_u_u309; f_Ec_ecConstraints = dtb_u_u310; f_Ec_ecDefTbl = dtb_u_u311; f_Ec_ecGlobalsTbl = dtb_u_u312; f_Ec_ecSolTbl = dtb_u_u313; f_Ec_ecDepthTbl = dtb_u_u314; f_Ec_ecGlobalsComplete = dtb_u_u315; f_Ec_ecClausesTbl = dtb_u_u316; f_Ec_ecCtorTbl = dtb_u_u317; f_Ec_ecHasLinear = dtb_u_u318; f_Ec_ecMetaSpans = dtb_u_u319; f_Ec_ecUseSpans = dtb_u_u320; f_Ec_ecWarnings = dtb_u_u321; f_Ec_ecCounters = dtb_u_u322; f_Ec_ecErrors = dtb_u_u323 }
  | _ -> failwith "DT: impossible branch"
))

# 460 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddInst = (fun (dtb_u_u324 : t_Ec) (dtb_u_u325 : t_DtInst) -> (if ((v_hasInstKey (dtb_u_u325).f_DtInst_dtInstKey) (v_ecInstList dtb_u_u324)) then dtb_u_u324 else ((v_ecAddInstRaw dtb_u_u324) dtb_u_u325)))

# 498 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddClass = (fun (dtb_u_u326 : t_Ec) (dtb_u_u327 : t_DtClass) -> (match dtb_u_u326 with
  | { f_Ec_ecNext = dtb_u_u328; f_Ec_ecSols = dtb_u_u329; f_Ec_ecDefsRev = dtb_u_u330; f_Ec_ecDatas = dtb_u_u331; f_Ec_ecDepthOfMeta = dtb_u_u332; f_Ec_ecGoals = dtb_u_u333; f_Ec_ecInsts = dtb_u_u334; f_Ec_ecClasses = dtb_u_u335; f_Ec_ecConstraints = dtb_u_u336; f_Ec_ecDefTbl = dtb_u_u337; f_Ec_ecGlobalsTbl = dtb_u_u338; f_Ec_ecSolTbl = dtb_u_u339; f_Ec_ecDepthTbl = dtb_u_u340; f_Ec_ecGlobalsComplete = dtb_u_u341; f_Ec_ecClausesTbl = dtb_u_u342; f_Ec_ecCtorTbl = dtb_u_u343; f_Ec_ecHasLinear = dtb_u_u344; f_Ec_ecMetaSpans = dtb_u_u345; f_Ec_ecUseSpans = dtb_u_u346; f_Ec_ecWarnings = dtb_u_u347; f_Ec_ecCounters = dtb_u_u348; f_Ec_ecErrors = dtb_u_u349 } -> { f_Ec_ecNext = dtb_u_u328; f_Ec_ecSols = dtb_u_u329; f_Ec_ecDefsRev = dtb_u_u330; f_Ec_ecDatas = dtb_u_u331; f_Ec_ecDepthOfMeta = dtb_u_u332; f_Ec_ecGoals = dtb_u_u333; f_Ec_ecInsts = dtb_u_u334; f_Ec_ecClasses = ((B_dData_dList.v_append dtb_u_u335) (B_dData_dList.C_List__x58__x58_ (dtb_u_u327, B_dData_dList.C_List_Nil))); f_Ec_ecConstraints = dtb_u_u336; f_Ec_ecDefTbl = dtb_u_u337; f_Ec_ecGlobalsTbl = dtb_u_u338; f_Ec_ecSolTbl = dtb_u_u339; f_Ec_ecDepthTbl = dtb_u_u340; f_Ec_ecGlobalsComplete = dtb_u_u341; f_Ec_ecClausesTbl = dtb_u_u342; f_Ec_ecCtorTbl = dtb_u_u343; f_Ec_ecHasLinear = dtb_u_u344; f_Ec_ecMetaSpans = dtb_u_u345; f_Ec_ecUseSpans = dtb_u_u346; f_Ec_ecWarnings = dtb_u_u347; f_Ec_ecCounters = dtb_u_u348; f_Ec_ecErrors = dtb_u_u349 }
  | _ -> failwith "DT: impossible branch"
))

# 527 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutConstraints = (fun (dtb_u_u350 : t_Ec) (dtb_u_u351 : t_ConstraintStore) -> (match dtb_u_u350 with
  | { f_Ec_ecNext = dtb_u_u352; f_Ec_ecSols = dtb_u_u353; f_Ec_ecDefsRev = dtb_u_u354; f_Ec_ecDatas = dtb_u_u355; f_Ec_ecDepthOfMeta = dtb_u_u356; f_Ec_ecGoals = dtb_u_u357; f_Ec_ecInsts = dtb_u_u358; f_Ec_ecClasses = dtb_u_u359; f_Ec_ecConstraints = dtb_u_u360; f_Ec_ecDefTbl = dtb_u_u361; f_Ec_ecGlobalsTbl = dtb_u_u362; f_Ec_ecSolTbl = dtb_u_u363; f_Ec_ecDepthTbl = dtb_u_u364; f_Ec_ecGlobalsComplete = dtb_u_u365; f_Ec_ecClausesTbl = dtb_u_u366; f_Ec_ecCtorTbl = dtb_u_u367; f_Ec_ecHasLinear = dtb_u_u368; f_Ec_ecMetaSpans = dtb_u_u369; f_Ec_ecUseSpans = dtb_u_u370; f_Ec_ecWarnings = dtb_u_u371; f_Ec_ecCounters = dtb_u_u372; f_Ec_ecErrors = dtb_u_u373 } -> { f_Ec_ecNext = dtb_u_u352; f_Ec_ecSols = dtb_u_u353; f_Ec_ecDefsRev = dtb_u_u354; f_Ec_ecDatas = dtb_u_u355; f_Ec_ecDepthOfMeta = dtb_u_u356; f_Ec_ecGoals = dtb_u_u357; f_Ec_ecInsts = dtb_u_u358; f_Ec_ecClasses = dtb_u_u359; f_Ec_ecConstraints = dtb_u_u351; f_Ec_ecDefTbl = dtb_u_u361; f_Ec_ecGlobalsTbl = dtb_u_u362; f_Ec_ecSolTbl = dtb_u_u363; f_Ec_ecDepthTbl = dtb_u_u364; f_Ec_ecGlobalsComplete = dtb_u_u365; f_Ec_ecClausesTbl = dtb_u_u366; f_Ec_ecCtorTbl = dtb_u_u367; f_Ec_ecHasLinear = dtb_u_u368; f_Ec_ecMetaSpans = dtb_u_u369; f_Ec_ecUseSpans = dtb_u_u370; f_Ec_ecWarnings = dtb_u_u371; f_Ec_ecCounters = dtb_u_u372; f_Ec_ecErrors = dtb_u_u373 }
  | _ -> failwith "DT: impossible branch"
))

# 624 "Vuna/Compiler/Elab/Types.vuna"
let v_ecEmpty = { f_Ec_ecNext = 0; f_Ec_ecSols = B_dData_dList.C_List_Nil; f_Ec_ecDefsRev = B_dData_dList.C_List_Nil; f_Ec_ecDatas = B_dData_dList.C_List_Nil; f_Ec_ecDepthOfMeta = B_dData_dList.C_List_Nil; f_Ec_ecGoals = B_dData_dList.C_List_Nil; f_Ec_ecInsts = v_instStoreEmpty; f_Ec_ecClasses = B_dData_dList.C_List_Nil; f_Ec_ecConstraints = v_csEmpty; f_Ec_ecDefTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil); f_Ec_ecGlobalsTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil); f_Ec_ecSolTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil); f_Ec_ecDepthTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil); f_Ec_ecGlobalsComplete = false; f_Ec_ecClausesTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil); f_Ec_ecCtorTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil); f_Ec_ecHasLinear = false; f_Ec_ecMetaSpans = B_dData_dList.C_List_Nil; f_Ec_ecUseSpans = B_dData_dList.C_List_Nil; f_Ec_ecWarnings = B_dData_dList.C_List_Nil; f_Ec_ecCounters = B_dData_dList.C_List_Nil; f_Ec_ecErrors = B_dData_dList.C_List_Nil }

# 678 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutSolsRaw = (fun (dtb_u_u374 : t_Ec) (dtb_u_u375 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u376 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u374 with
  | { f_Ec_ecNext = dtb_u_u377; f_Ec_ecSols = dtb_u_u378; f_Ec_ecDefsRev = dtb_u_u379; f_Ec_ecDatas = dtb_u_u380; f_Ec_ecDepthOfMeta = dtb_u_u381; f_Ec_ecGoals = dtb_u_u382; f_Ec_ecInsts = dtb_u_u383; f_Ec_ecClasses = dtb_u_u384; f_Ec_ecConstraints = dtb_u_u385; f_Ec_ecDefTbl = dtb_u_u386; f_Ec_ecGlobalsTbl = dtb_u_u387; f_Ec_ecSolTbl = dtb_u_u388; f_Ec_ecDepthTbl = dtb_u_u389; f_Ec_ecGlobalsComplete = dtb_u_u390; f_Ec_ecClausesTbl = dtb_u_u391; f_Ec_ecCtorTbl = dtb_u_u392; f_Ec_ecHasLinear = dtb_u_u393; f_Ec_ecMetaSpans = dtb_u_u394; f_Ec_ecUseSpans = dtb_u_u395; f_Ec_ecWarnings = dtb_u_u396; f_Ec_ecCounters = dtb_u_u397; f_Ec_ecErrors = dtb_u_u398 } -> { f_Ec_ecNext = dtb_u_u377; f_Ec_ecSols = dtb_u_u375; f_Ec_ecDefsRev = dtb_u_u379; f_Ec_ecDatas = dtb_u_u380; f_Ec_ecDepthOfMeta = dtb_u_u381; f_Ec_ecGoals = dtb_u_u382; f_Ec_ecInsts = dtb_u_u383; f_Ec_ecClasses = dtb_u_u384; f_Ec_ecConstraints = dtb_u_u385; f_Ec_ecDefTbl = dtb_u_u386; f_Ec_ecGlobalsTbl = dtb_u_u387; f_Ec_ecSolTbl = dtb_u_u376; f_Ec_ecDepthTbl = dtb_u_u389; f_Ec_ecGlobalsComplete = dtb_u_u390; f_Ec_ecClausesTbl = dtb_u_u391; f_Ec_ecCtorTbl = dtb_u_u392; f_Ec_ecHasLinear = dtb_u_u393; f_Ec_ecMetaSpans = dtb_u_u394; f_Ec_ecUseSpans = dtb_u_u395; f_Ec_ecWarnings = dtb_u_u396; f_Ec_ecCounters = dtb_u_u397; f_Ec_ecErrors = dtb_u_u398 }
  | _ -> failwith "DT: impossible branch"
))

# 735 "Vuna/Compiler/Elab/Types.vuna"
let[@tail_mod_cons] rec v_prefixUntilId = (fun (dtb_u_u399 : int) (dtb_u_u400 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u400 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u401, dtb_u_u402) -> (match dtb_u_u401 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u403; B_dData_dPair.f_Pair_second = dtb_u_u404 } -> (if (dtb_u_u403 = dtb_u_u399) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u403; B_dData_dPair.f_Pair_second = dtb_u_u404 }, ((v_prefixUntilId dtb_u_u399) dtb_u_u402))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 731 "Vuna/Compiler/Elab/Types.vuna"
let v_solsDelta = (fun (dtb_u_u405 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u406 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u405 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u407, dtb_u_u408) -> (match dtb_u_u407 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u409; B_dData_dPair.f_Pair_second = dtb_u_u410 } -> ((v_prefixUntilId dtb_u_u409) dtb_u_u406)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u406
  | _ -> failwith "DT: impossible branch"
))

# 780 "Vuna/Compiler/Elab/Types.vuna"
let v_ecRemoveDefTbl = (fun (dtb_u_u411 : string) (dtb_u_u412 : t_Ec) -> (match dtb_u_u412 with
  | { f_Ec_ecNext = dtb_u_u413; f_Ec_ecSols = dtb_u_u414; f_Ec_ecDefsRev = dtb_u_u415; f_Ec_ecDatas = dtb_u_u416; f_Ec_ecDepthOfMeta = dtb_u_u417; f_Ec_ecGoals = dtb_u_u418; f_Ec_ecInsts = dtb_u_u419; f_Ec_ecClasses = dtb_u_u420; f_Ec_ecConstraints = dtb_u_u421; f_Ec_ecDefTbl = dtb_u_u422; f_Ec_ecGlobalsTbl = dtb_u_u423; f_Ec_ecSolTbl = dtb_u_u424; f_Ec_ecDepthTbl = dtb_u_u425; f_Ec_ecGlobalsComplete = dtb_u_u426; f_Ec_ecClausesTbl = dtb_u_u427; f_Ec_ecCtorTbl = dtb_u_u428; f_Ec_ecHasLinear = dtb_u_u429; f_Ec_ecMetaSpans = dtb_u_u430; f_Ec_ecUseSpans = dtb_u_u431; f_Ec_ecWarnings = dtb_u_u432; f_Ec_ecCounters = dtb_u_u433; f_Ec_ecErrors = dtb_u_u434 } -> { f_Ec_ecNext = dtb_u_u413; f_Ec_ecSols = dtb_u_u414; f_Ec_ecDefsRev = dtb_u_u415; f_Ec_ecDatas = dtb_u_u416; f_Ec_ecDepthOfMeta = dtb_u_u417; f_Ec_ecGoals = dtb_u_u418; f_Ec_ecInsts = dtb_u_u419; f_Ec_ecClasses = dtb_u_u420; f_Ec_ecConstraints = dtb_u_u421; f_Ec_ecDefTbl = ((((B_dContainer_dHashMap.v_remove B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u411) dtb_u_u422); f_Ec_ecGlobalsTbl = dtb_u_u423; f_Ec_ecSolTbl = dtb_u_u424; f_Ec_ecDepthTbl = dtb_u_u425; f_Ec_ecGlobalsComplete = dtb_u_u426; f_Ec_ecClausesTbl = dtb_u_u427; f_Ec_ecCtorTbl = dtb_u_u428; f_Ec_ecHasLinear = dtb_u_u429; f_Ec_ecMetaSpans = dtb_u_u430; f_Ec_ecUseSpans = dtb_u_u431; f_Ec_ecWarnings = dtb_u_u432; f_Ec_ecCounters = dtb_u_u433; f_Ec_ecErrors = dtb_u_u434 }
  | _ -> failwith "DT: impossible branch"
))

# 851 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutMetaSpans = (fun (dtb_u_u435 : t_Ec) (dtb_u_u436 : (int, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u435 with
  | { f_Ec_ecNext = dtb_u_u437; f_Ec_ecSols = dtb_u_u438; f_Ec_ecDefsRev = dtb_u_u439; f_Ec_ecDatas = dtb_u_u440; f_Ec_ecDepthOfMeta = dtb_u_u441; f_Ec_ecGoals = dtb_u_u442; f_Ec_ecInsts = dtb_u_u443; f_Ec_ecClasses = dtb_u_u444; f_Ec_ecConstraints = dtb_u_u445; f_Ec_ecDefTbl = dtb_u_u446; f_Ec_ecGlobalsTbl = dtb_u_u447; f_Ec_ecSolTbl = dtb_u_u448; f_Ec_ecDepthTbl = dtb_u_u449; f_Ec_ecGlobalsComplete = dtb_u_u450; f_Ec_ecClausesTbl = dtb_u_u451; f_Ec_ecCtorTbl = dtb_u_u452; f_Ec_ecHasLinear = dtb_u_u453; f_Ec_ecMetaSpans = dtb_u_u454; f_Ec_ecUseSpans = dtb_u_u455; f_Ec_ecWarnings = dtb_u_u456; f_Ec_ecCounters = dtb_u_u457; f_Ec_ecErrors = dtb_u_u458 } -> { f_Ec_ecNext = dtb_u_u437; f_Ec_ecSols = dtb_u_u438; f_Ec_ecDefsRev = dtb_u_u439; f_Ec_ecDatas = dtb_u_u440; f_Ec_ecDepthOfMeta = dtb_u_u441; f_Ec_ecGoals = dtb_u_u442; f_Ec_ecInsts = dtb_u_u443; f_Ec_ecClasses = dtb_u_u444; f_Ec_ecConstraints = dtb_u_u445; f_Ec_ecDefTbl = dtb_u_u446; f_Ec_ecGlobalsTbl = dtb_u_u447; f_Ec_ecSolTbl = dtb_u_u448; f_Ec_ecDepthTbl = dtb_u_u449; f_Ec_ecGlobalsComplete = dtb_u_u450; f_Ec_ecClausesTbl = dtb_u_u451; f_Ec_ecCtorTbl = dtb_u_u452; f_Ec_ecHasLinear = dtb_u_u453; f_Ec_ecMetaSpans = dtb_u_u436; f_Ec_ecUseSpans = dtb_u_u455; f_Ec_ecWarnings = dtb_u_u456; f_Ec_ecCounters = dtb_u_u457; f_Ec_ecErrors = dtb_u_u458 }
  | _ -> failwith "DT: impossible branch"
))

# 878 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutUseSpans = (fun (dtb_u_u459 : t_Ec) (dtb_u_u460 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u459 with
  | { f_Ec_ecNext = dtb_u_u461; f_Ec_ecSols = dtb_u_u462; f_Ec_ecDefsRev = dtb_u_u463; f_Ec_ecDatas = dtb_u_u464; f_Ec_ecDepthOfMeta = dtb_u_u465; f_Ec_ecGoals = dtb_u_u466; f_Ec_ecInsts = dtb_u_u467; f_Ec_ecClasses = dtb_u_u468; f_Ec_ecConstraints = dtb_u_u469; f_Ec_ecDefTbl = dtb_u_u470; f_Ec_ecGlobalsTbl = dtb_u_u471; f_Ec_ecSolTbl = dtb_u_u472; f_Ec_ecDepthTbl = dtb_u_u473; f_Ec_ecGlobalsComplete = dtb_u_u474; f_Ec_ecClausesTbl = dtb_u_u475; f_Ec_ecCtorTbl = dtb_u_u476; f_Ec_ecHasLinear = dtb_u_u477; f_Ec_ecMetaSpans = dtb_u_u478; f_Ec_ecUseSpans = dtb_u_u479; f_Ec_ecWarnings = dtb_u_u480; f_Ec_ecCounters = dtb_u_u481; f_Ec_ecErrors = dtb_u_u482 } -> { f_Ec_ecNext = dtb_u_u461; f_Ec_ecSols = dtb_u_u462; f_Ec_ecDefsRev = dtb_u_u463; f_Ec_ecDatas = dtb_u_u464; f_Ec_ecDepthOfMeta = dtb_u_u465; f_Ec_ecGoals = dtb_u_u466; f_Ec_ecInsts = dtb_u_u467; f_Ec_ecClasses = dtb_u_u468; f_Ec_ecConstraints = dtb_u_u469; f_Ec_ecDefTbl = dtb_u_u470; f_Ec_ecGlobalsTbl = dtb_u_u471; f_Ec_ecSolTbl = dtb_u_u472; f_Ec_ecDepthTbl = dtb_u_u473; f_Ec_ecGlobalsComplete = dtb_u_u474; f_Ec_ecClausesTbl = dtb_u_u475; f_Ec_ecCtorTbl = dtb_u_u476; f_Ec_ecHasLinear = dtb_u_u477; f_Ec_ecMetaSpans = dtb_u_u478; f_Ec_ecUseSpans = dtb_u_u460; f_Ec_ecWarnings = dtb_u_u480; f_Ec_ecCounters = dtb_u_u481; f_Ec_ecErrors = dtb_u_u482 }
  | _ -> failwith "DT: impossible branch"
))

# 907 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutWarnings = (fun (dtb_u_u483 : t_Ec) (dtb_u_u484 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (match dtb_u_u483 with
  | { f_Ec_ecNext = dtb_u_u485; f_Ec_ecSols = dtb_u_u486; f_Ec_ecDefsRev = dtb_u_u487; f_Ec_ecDatas = dtb_u_u488; f_Ec_ecDepthOfMeta = dtb_u_u489; f_Ec_ecGoals = dtb_u_u490; f_Ec_ecInsts = dtb_u_u491; f_Ec_ecClasses = dtb_u_u492; f_Ec_ecConstraints = dtb_u_u493; f_Ec_ecDefTbl = dtb_u_u494; f_Ec_ecGlobalsTbl = dtb_u_u495; f_Ec_ecSolTbl = dtb_u_u496; f_Ec_ecDepthTbl = dtb_u_u497; f_Ec_ecGlobalsComplete = dtb_u_u498; f_Ec_ecClausesTbl = dtb_u_u499; f_Ec_ecCtorTbl = dtb_u_u500; f_Ec_ecHasLinear = dtb_u_u501; f_Ec_ecMetaSpans = dtb_u_u502; f_Ec_ecUseSpans = dtb_u_u503; f_Ec_ecWarnings = dtb_u_u504; f_Ec_ecCounters = dtb_u_u505; f_Ec_ecErrors = dtb_u_u506 } -> { f_Ec_ecNext = dtb_u_u485; f_Ec_ecSols = dtb_u_u486; f_Ec_ecDefsRev = dtb_u_u487; f_Ec_ecDatas = dtb_u_u488; f_Ec_ecDepthOfMeta = dtb_u_u489; f_Ec_ecGoals = dtb_u_u490; f_Ec_ecInsts = dtb_u_u491; f_Ec_ecClasses = dtb_u_u492; f_Ec_ecConstraints = dtb_u_u493; f_Ec_ecDefTbl = dtb_u_u494; f_Ec_ecGlobalsTbl = dtb_u_u495; f_Ec_ecSolTbl = dtb_u_u496; f_Ec_ecDepthTbl = dtb_u_u497; f_Ec_ecGlobalsComplete = dtb_u_u498; f_Ec_ecClausesTbl = dtb_u_u499; f_Ec_ecCtorTbl = dtb_u_u500; f_Ec_ecHasLinear = dtb_u_u501; f_Ec_ecMetaSpans = dtb_u_u502; f_Ec_ecUseSpans = dtb_u_u503; f_Ec_ecWarnings = dtb_u_u484; f_Ec_ecCounters = dtb_u_u505; f_Ec_ecErrors = dtb_u_u506 }
  | _ -> failwith "DT: impossible branch"
))

# 938 "Vuna/Compiler/Elab/Types.vuna"
let v_ecBump = (fun (dtb_u_u507 : t_Ec) (dtb_u_u508 : string) -> (match dtb_u_u507 with
  | { f_Ec_ecNext = dtb_u_u509; f_Ec_ecSols = dtb_u_u510; f_Ec_ecDefsRev = dtb_u_u511; f_Ec_ecDatas = dtb_u_u512; f_Ec_ecDepthOfMeta = dtb_u_u513; f_Ec_ecGoals = dtb_u_u514; f_Ec_ecInsts = dtb_u_u515; f_Ec_ecClasses = dtb_u_u516; f_Ec_ecConstraints = dtb_u_u517; f_Ec_ecDefTbl = dtb_u_u518; f_Ec_ecGlobalsTbl = dtb_u_u519; f_Ec_ecSolTbl = dtb_u_u520; f_Ec_ecDepthTbl = dtb_u_u521; f_Ec_ecGlobalsComplete = dtb_u_u522; f_Ec_ecClausesTbl = dtb_u_u523; f_Ec_ecCtorTbl = dtb_u_u524; f_Ec_ecHasLinear = dtb_u_u525; f_Ec_ecMetaSpans = dtb_u_u526; f_Ec_ecUseSpans = dtb_u_u527; f_Ec_ecWarnings = dtb_u_u528; f_Ec_ecCounters = dtb_u_u529; f_Ec_ecErrors = dtb_u_u530 } -> { f_Ec_ecNext = dtb_u_u509; f_Ec_ecSols = dtb_u_u510; f_Ec_ecDefsRev = dtb_u_u511; f_Ec_ecDatas = dtb_u_u512; f_Ec_ecDepthOfMeta = dtb_u_u513; f_Ec_ecGoals = dtb_u_u514; f_Ec_ecInsts = dtb_u_u515; f_Ec_ecClasses = dtb_u_u516; f_Ec_ecConstraints = dtb_u_u517; f_Ec_ecDefTbl = dtb_u_u518; f_Ec_ecGlobalsTbl = dtb_u_u519; f_Ec_ecSolTbl = dtb_u_u520; f_Ec_ecDepthTbl = dtb_u_u521; f_Ec_ecGlobalsComplete = dtb_u_u522; f_Ec_ecClausesTbl = dtb_u_u523; f_Ec_ecCtorTbl = dtb_u_u524; f_Ec_ecHasLinear = dtb_u_u525; f_Ec_ecMetaSpans = dtb_u_u526; f_Ec_ecUseSpans = dtb_u_u527; f_Ec_ecWarnings = dtb_u_u528; f_Ec_ecCounters = (B_dData_dList.C_List__x58__x58_ (dtb_u_u508, dtb_u_u529)); f_Ec_ecErrors = dtb_u_u530 }
  | _ -> failwith "DT: impossible branch"
))

# 965 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddError = (fun (dtb_u_u531 : t_Ec) (dtb_u_u532 : Base_dDiag.t_Diagnostic) -> (match dtb_u_u531 with
  | { f_Ec_ecNext = dtb_u_u533; f_Ec_ecSols = dtb_u_u534; f_Ec_ecDefsRev = dtb_u_u535; f_Ec_ecDatas = dtb_u_u536; f_Ec_ecDepthOfMeta = dtb_u_u537; f_Ec_ecGoals = dtb_u_u538; f_Ec_ecInsts = dtb_u_u539; f_Ec_ecClasses = dtb_u_u540; f_Ec_ecConstraints = dtb_u_u541; f_Ec_ecDefTbl = dtb_u_u542; f_Ec_ecGlobalsTbl = dtb_u_u543; f_Ec_ecSolTbl = dtb_u_u544; f_Ec_ecDepthTbl = dtb_u_u545; f_Ec_ecGlobalsComplete = dtb_u_u546; f_Ec_ecClausesTbl = dtb_u_u547; f_Ec_ecCtorTbl = dtb_u_u548; f_Ec_ecHasLinear = dtb_u_u549; f_Ec_ecMetaSpans = dtb_u_u550; f_Ec_ecUseSpans = dtb_u_u551; f_Ec_ecWarnings = dtb_u_u552; f_Ec_ecCounters = dtb_u_u553; f_Ec_ecErrors = dtb_u_u554 } -> { f_Ec_ecNext = dtb_u_u533; f_Ec_ecSols = dtb_u_u534; f_Ec_ecDefsRev = dtb_u_u535; f_Ec_ecDatas = dtb_u_u536; f_Ec_ecDepthOfMeta = dtb_u_u537; f_Ec_ecGoals = dtb_u_u538; f_Ec_ecInsts = dtb_u_u539; f_Ec_ecClasses = dtb_u_u540; f_Ec_ecConstraints = dtb_u_u541; f_Ec_ecDefTbl = dtb_u_u542; f_Ec_ecGlobalsTbl = dtb_u_u543; f_Ec_ecSolTbl = dtb_u_u544; f_Ec_ecDepthTbl = dtb_u_u545; f_Ec_ecGlobalsComplete = dtb_u_u546; f_Ec_ecClausesTbl = dtb_u_u547; f_Ec_ecCtorTbl = dtb_u_u548; f_Ec_ecHasLinear = dtb_u_u549; f_Ec_ecMetaSpans = dtb_u_u550; f_Ec_ecUseSpans = dtb_u_u551; f_Ec_ecWarnings = dtb_u_u552; f_Ec_ecCounters = dtb_u_u553; f_Ec_ecErrors = (B_dData_dList.C_List__x58__x58_ (dtb_u_u532, dtb_u_u554)) }
  | _ -> failwith "DT: impossible branch"
))

# 1015 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxDepth = (fun (dtb_u_u555 : t_Ctx) -> (dtb_u_u555).f_Ctx_ctxDepthF)

# 1018 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxBind = (fun (dtb_u_u556 : string) (dtb_u_u557 : Core_dTerm.t_Term) (dtb_u_u558 : t_Ctx) -> (match dtb_u_u558 with
  | { f_Ctx_ctxItems = dtb_u_u559; f_Ctx_ctxEnvF = dtb_u_u560; f_Ctx_ctxRefVals = dtb_u_u561; f_Ctx_ctxDepthF = dtb_u_u562; f_Ctx_ctxEnvRF = dtb_u_u563 } -> (let dtb_u_u564 = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u556, dtb_u_u562, B_dData_dList.C_List_Nil)))) in { f_Ctx_ctxItems = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u556; B_dData_dPair.f_Pair_second = dtb_u_u557 }, dtb_u_u559)); f_Ctx_ctxEnvF = (B_dData_dList.C_List__x58__x58_ (dtb_u_u564, dtb_u_u560)); f_Ctx_ctxRefVals = dtb_u_u561; f_Ctx_ctxDepthF = (dtb_u_u562 + 1); f_Ctx_ctxEnvRF = (B_dData_dList.C_List__x58__x58_ (dtb_u_u564, dtb_u_u563)) })
  | _ -> failwith "DT: impossible branch"
))

# 1025 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxBindValue = (fun (dtb_u_u565 : string) (dtb_u_u566 : Core_dTerm.t_Value) (dtb_u_u567 : t_Ctx) -> (match dtb_u_u567 with
  | { f_Ctx_ctxItems = dtb_u_u568; f_Ctx_ctxEnvF = dtb_u_u569; f_Ctx_ctxRefVals = dtb_u_u570; f_Ctx_ctxDepthF = dtb_u_u571; f_Ctx_ctxEnvRF = dtb_u_u572 } -> (let dtb_u_u573 = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u565, dtb_u_u571, B_dData_dList.C_List_Nil)))) in { f_Ctx_ctxItems = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u565; B_dData_dPair.f_Pair_second = ((Core_dEval.v_quote dtb_u_u571) dtb_u_u566) }, dtb_u_u568)); f_Ctx_ctxEnvF = (B_dData_dList.C_List__x58__x58_ (dtb_u_u573, dtb_u_u569)); f_Ctx_ctxRefVals = dtb_u_u570; f_Ctx_ctxDepthF = (dtb_u_u571 + 1); f_Ctx_ctxEnvRF = (B_dData_dList.C_List__x58__x58_ (dtb_u_u573, dtb_u_u572)) })
  | _ -> failwith "DT: impossible branch"
))

# 1038 "Vuna/Compiler/Elab/Types.vuna"
let rec v_ctxLookupAt = (fun (dtb_u_u574 : string) (dtb_u_u575 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u576 : int) -> (match dtb_u_u575 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u577, dtb_u_u578) -> (match dtb_u_u577 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u579; B_dData_dPair.f_Pair_second = dtb_u_u580 } -> (if (dtb_u_u579 = dtb_u_u574) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u576; B_dData_dPair.f_Pair_second = dtb_u_u580 })) else (((v_ctxLookupAt dtb_u_u574) dtb_u_u578) (dtb_u_u576 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1043 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxLookup = (fun (dtb_u_u581 : string) (dtb_u_u582 : t_Ctx) -> (((v_ctxLookupAt dtb_u_u581) (dtb_u_u582).f_Ctx_ctxItems) 0))

# 1052 "Vuna/Compiler/Elab/Types.vuna"
let[@tail_mod_cons] rec v_ctxEnvAt = (fun (dtb_u_u583 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u584 : int) (dtb_u_u585 : int) -> (match dtb_u_u583 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u586, dtb_u_u587) -> (match dtb_u_u586 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u588; B_dData_dPair.f_Pair_second = dtb_u_u589 } -> (B_dData_dList.C_List__x58__x58_ ((Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u588, ((dtb_u_u585 - dtb_u_u584) - 1), B_dData_dList.C_List_Nil)))), (((v_ctxEnvAt dtb_u_u587) (dtb_u_u584 + 1)) dtb_u_u585)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1059 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxEnv = (fun (dtb_u_u590 : t_Ctx) -> (match dtb_u_u590 with
  | { f_Ctx_ctxItems = dtb_u_u591; f_Ctx_ctxEnvF = dtb_u_u592; f_Ctx_ctxRefVals = dtb_u_u593; f_Ctx_ctxDepthF = dtb_u_u594; f_Ctx_ctxEnvRF = dtb_u_u595 } -> dtb_u_u592
  | _ -> failwith "DT: impossible branch"
))

# 1063 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxEnvRefined = (fun (dtb_u_u596 : t_Ctx) -> (dtb_u_u596).f_Ctx_ctxEnvRF)

# 1109 "Vuna/Compiler/Elab/Types.vuna"
let rec v_refineLookup = (fun (dtb_u_u597 : int) (dtb_u_u598 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u598 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u599, dtb_u_u600) -> (match dtb_u_u599 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u601; B_dData_dPair.f_Pair_second = dtb_u_u602 } -> (if (dtb_u_u601 = dtb_u_u597) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u602)) else ((v_refineLookup dtb_u_u597) dtb_u_u600))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1069 "Vuna/Compiler/Elab/Types.vuna"
let rec v_refineValue = (fun (dtb_u_u603 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u604 : int) (dtb_u_u605 : Core_dTerm.t_Value) -> (match dtb_u_u603 with
  | B_dData_dList.C_List_Nil -> dtb_u_u605
  | _ -> (if (dtb_u_u604 <= 0) then dtb_u_u605 else (match dtb_u_u605 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u606) -> (match dtb_u_u606 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u607, dtb_u_u608, dtb_u_u609) -> (let dtb_u_u610 = ((B_dData_dList.v_map ((v_refineValue dtb_u_u603) (dtb_u_u604 - 1))) dtb_u_u609) in (match ((v_refineLookup dtb_u_u608) dtb_u_u603) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u611) -> ((Core_dEval.v_applySpine (((v_refineValue dtb_u_u603) (dtb_u_u604 - 1)) dtb_u_u611)) dtb_u_u610)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u607, dtb_u_u608, dtb_u_u610))))
  | _ -> failwith "DT: impossible branch"
))
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u612, dtb_u_u613) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb_u_u612, ((B_dData_dList.v_map ((v_refineValue dtb_u_u603) (dtb_u_u604 - 1))) dtb_u_u613)))))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VCon (dtb_u_u614, dtb_u_u615) -> (Core_dTerm.C_Value_VCon (dtb_u_u614, ((B_dData_dList.v_map ((v_refineValue dtb_u_u603) (dtb_u_u604 - 1))) dtb_u_u615)))
  | Core_dTerm.C_Value_VApp (dtb_u_u616, dtb_u_u617) -> (Core_dTerm.C_Value_VApp ((((v_refineValue dtb_u_u603) (dtb_u_u604 - 1)) dtb_u_u616), (((v_refineValue dtb_u_u603) (dtb_u_u604 - 1)) dtb_u_u617)))
  | Core_dTerm.C_Value_VCase (dtb_u_u618, dtb_u_u619) -> (Core_dTerm.C_Value_VCase ((((v_refineValue dtb_u_u603) (dtb_u_u604 - 1)) dtb_u_u618), ((B_dData_dList.v_map ((v_refineAlt dtb_u_u603) (dtb_u_u604 - 1))) dtb_u_u619)))
  | Core_dTerm.C_Value_VProj (dtb_u_u620, dtb_u_u621, dtb_u_u622, dtb_u_u623, dtb_u_u624) -> (((((((v_refineProj dtb_u_u603) (dtb_u_u604 - 1)) (((v_refineValue dtb_u_u603) (dtb_u_u604 - 1)) dtb_u_u620)) dtb_u_u621) dtb_u_u622) dtb_u_u623) dtb_u_u624)
  | Core_dTerm.C_Value_VIf (dtb_u_u625, dtb_u_u626, dtb_u_u627) -> (Core_dTerm.C_Value_VIf ((((v_refineValue dtb_u_u603) (dtb_u_u604 - 1)) dtb_u_u625), (((v_refineValue dtb_u_u603) (dtb_u_u604 - 1)) dtb_u_u626), (((v_refineValue dtb_u_u603) (dtb_u_u604 - 1)) dtb_u_u627)))
  | Core_dTerm.C_Value_VMeta (dtb_u_u628, dtb_u_u629) -> (Core_dTerm.C_Value_VMeta (dtb_u_u628, ((B_dData_dList.v_map ((v_refineValue dtb_u_u603) (dtb_u_u604 - 1))) dtb_u_u629)))
  | _ -> dtb_u_u605
))
))
# 1095 "Vuna/Compiler/Elab/Types.vuna"
and v_refineAlt = (fun (dtb_u_u630 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u631 : int) (dtb_u_u632 : Core_dTerm.t_VCaseAlt) -> (match dtb_u_u632 with
  | { Core_dTerm.f_VCaseAlt_vCaseAltName = dtb_u_u633; Core_dTerm.f_VCaseAlt_vCaseAltBinders = dtb_u_u634; Core_dTerm.f_VCaseAlt_vCaseAltClosure = dtb_u_u635 } -> (match dtb_u_u635 with
  | { Core_dTerm.f_Closure_closureEnv = dtb_u_u636; Core_dTerm.f_Closure_closureBody = dtb_u_u637 } -> { Core_dTerm.f_VCaseAlt_vCaseAltName = dtb_u_u633; Core_dTerm.f_VCaseAlt_vCaseAltBinders = dtb_u_u634; Core_dTerm.f_VCaseAlt_vCaseAltClosure = { Core_dTerm.f_Closure_closureEnv = ((B_dData_dList.v_map ((v_refineValue dtb_u_u630) dtb_u_u631)) dtb_u_u636); Core_dTerm.f_Closure_closureBody = dtb_u_u637 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 1102 "Vuna/Compiler/Elab/Types.vuna"
and v_refineProj = (fun (dtb_u_u638 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u639 : int) (dtb_u_u640 : Core_dTerm.t_Value) (dtb_u_u641 : string) (dtb_u_u642 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u643 : int) (dtb_u_u644 : int) -> (match dtb_u_u640 with
  | Core_dTerm.C_Value_VCon (dtb_u_u645, dtb_u_u646) -> (match ((Core_dEval.v_argAt dtb_u_u643) dtb_u_u646) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u647) -> (((v_refineValue dtb_u_u638) dtb_u_u639) dtb_u_u647)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Value_VProj ((Core_dTerm.C_Value_VCon (dtb_u_u645, dtb_u_u646)), dtb_u_u641, dtb_u_u642, dtb_u_u643, dtb_u_u644))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Core_dTerm.C_Value_VProj (dtb_u_u640, dtb_u_u641, dtb_u_u642, dtb_u_u643, dtb_u_u644))
))

# 1047 "Vuna/Compiler/Elab/Types.vuna"
let v_refinedEnv = (fun (dtb_u_u648 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u649 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u648 with
  | B_dData_dList.C_List_Nil -> dtb_u_u649
  | _ -> ((B_dData_dList.v_map ((v_refineValue dtb_u_u648) Core_dTerm.v_defaultFuel)) dtb_u_u649)
))

# 1032 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxRefine = (fun (dtb_u_u650 : t_Ctx) (dtb_u_u651 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u650 with
  | { f_Ctx_ctxItems = dtb_u_u652; f_Ctx_ctxEnvF = dtb_u_u653; f_Ctx_ctxRefVals = dtb_u_u654; f_Ctx_ctxDepthF = dtb_u_u655; f_Ctx_ctxEnvRF = dtb_u_u656 } -> (let dtb_u_u657 = ((B_dData_dList.v_append dtb_u_u654) dtb_u_u651) in { f_Ctx_ctxItems = dtb_u_u652; f_Ctx_ctxEnvF = dtb_u_u653; f_Ctx_ctxRefVals = dtb_u_u657; f_Ctx_ctxDepthF = dtb_u_u655; f_Ctx_ctxEnvRF = ((v_refinedEnv dtb_u_u657) dtb_u_u653) })
  | _ -> failwith "DT: impossible branch"
))

# 1114 "Vuna/Compiler/Elab/Types.vuna"
let v_evalCtx = (fun (dtb_u_u658 : t_Ctx) (dtb_u_u659 : Core_dTerm.t_Term) -> ((Core_dEval.v_eval (v_ctxEnvRefined dtb_u_u658)) dtb_u_u659))

# 1119 "Vuna/Compiler/Elab/Types.vuna"
let v_varTypeValue = (fun (dtb_u_u660 : t_Ctx) (dtb_u_u661 : int) (dtb_u_u662 : Core_dTerm.t_Term) -> ((Core_dEval.v_eval (v_ctxEnvRefined dtb_u_u660)) (((Core_dTerm.v_shift 0) (dtb_u_u661 + 1)) dtb_u_u662)))

# 1122 "Vuna/Compiler/Elab/Types.vuna"
let v_emptyCtx = { f_Ctx_ctxItems = B_dData_dList.C_List_Nil; f_Ctx_ctxEnvF = B_dData_dList.C_List_Nil; f_Ctx_ctxRefVals = B_dData_dList.C_List_Nil; f_Ctx_ctxDepthF = 0; f_Ctx_ctxEnvRF = B_dData_dList.C_List_Nil }

# 1128 "Vuna/Compiler/Elab/Types.vuna"
let v_errAt = (fun (dtb_u_u664 : Base_dSource.t_Span) (dtb_u_u665 : string) -> ((Base_dDiag.v_rawAt dtb_u_u664) dtb_u_u665))

# 1132 "Vuna/Compiler/Elab/Types.vuna"
let v_newMeta = (fun (dtb_u_u666 : t_Ctx) (dtb_u_u667 : t_Ec) -> (match dtb_u_u667 with
  | { f_Ec_ecNext = dtb_u_u668; f_Ec_ecSols = dtb_u_u669; f_Ec_ecDefsRev = dtb_u_u670; f_Ec_ecDatas = dtb_u_u671; f_Ec_ecDepthOfMeta = dtb_u_u672; f_Ec_ecGoals = dtb_u_u673; f_Ec_ecInsts = dtb_u_u674; f_Ec_ecClasses = dtb_u_u675; f_Ec_ecConstraints = dtb_u_u676; f_Ec_ecDefTbl = dtb_u_u677; f_Ec_ecGlobalsTbl = dtb_u_u678; f_Ec_ecSolTbl = dtb_u_u679; f_Ec_ecDepthTbl = dtb_u_u680; f_Ec_ecGlobalsComplete = dtb_u_u681; f_Ec_ecClausesTbl = dtb_u_u682; f_Ec_ecCtorTbl = dtb_u_u683; f_Ec_ecHasLinear = dtb_u_u684; f_Ec_ecMetaSpans = dtb_u_u685; f_Ec_ecUseSpans = dtb_u_u686; f_Ec_ecWarnings = dtb_u_u687; f_Ec_ecCounters = dtb_u_u688; f_Ec_ecErrors = dtb_u_u689 } -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TMeta (dtb_u_u668)); B_dData_dPair.f_Pair_second = { f_Ec_ecNext = (dtb_u_u668 + 1); f_Ec_ecSols = dtb_u_u669; f_Ec_ecDefsRev = dtb_u_u670; f_Ec_ecDatas = dtb_u_u671; f_Ec_ecDepthOfMeta = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u668; B_dData_dPair.f_Pair_second = (v_ctxDepth dtb_u_u666) }, dtb_u_u672)); f_Ec_ecGoals = dtb_u_u673; f_Ec_ecInsts = dtb_u_u674; f_Ec_ecClasses = dtb_u_u675; f_Ec_ecConstraints = dtb_u_u676; f_Ec_ecDefTbl = dtb_u_u677; f_Ec_ecGlobalsTbl = dtb_u_u678; f_Ec_ecSolTbl = dtb_u_u679; f_Ec_ecDepthTbl = (((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u668) (v_ctxDepth dtb_u_u666)) dtb_u_u680); f_Ec_ecGlobalsComplete = dtb_u_u681; f_Ec_ecClausesTbl = dtb_u_u682; f_Ec_ecCtorTbl = dtb_u_u683; f_Ec_ecHasLinear = dtb_u_u684; f_Ec_ecMetaSpans = dtb_u_u685; f_Ec_ecUseSpans = dtb_u_u686; f_Ec_ecWarnings = dtb_u_u687; f_Ec_ecCounters = dtb_u_u688; f_Ec_ecErrors = dtb_u_u689 } }
  | _ -> failwith "DT: impossible branch"
))

# 1180 "Vuna/Compiler/Elab/Types.vuna"
let v_solsToTbl = (fun (dtb_u_u690 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u690) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil)))

# 1183 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutDefTbl = (fun (dtb_u_u691 : t_Ec) (dtb_u_u692 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u691 with
  | { f_Ec_ecNext = dtb_u_u693; f_Ec_ecSols = dtb_u_u694; f_Ec_ecDefsRev = dtb_u_u695; f_Ec_ecDatas = dtb_u_u696; f_Ec_ecDepthOfMeta = dtb_u_u697; f_Ec_ecGoals = dtb_u_u698; f_Ec_ecInsts = dtb_u_u699; f_Ec_ecClasses = dtb_u_u700; f_Ec_ecConstraints = dtb_u_u701; f_Ec_ecDefTbl = dtb_u_u702; f_Ec_ecGlobalsTbl = dtb_u_u703; f_Ec_ecSolTbl = dtb_u_u704; f_Ec_ecDepthTbl = dtb_u_u705; f_Ec_ecGlobalsComplete = dtb_u_u706; f_Ec_ecClausesTbl = dtb_u_u707; f_Ec_ecCtorTbl = dtb_u_u708; f_Ec_ecHasLinear = dtb_u_u709; f_Ec_ecMetaSpans = dtb_u_u710; f_Ec_ecUseSpans = dtb_u_u711; f_Ec_ecWarnings = dtb_u_u712; f_Ec_ecCounters = dtb_u_u713; f_Ec_ecErrors = dtb_u_u714 } -> { f_Ec_ecNext = dtb_u_u693; f_Ec_ecSols = dtb_u_u694; f_Ec_ecDefsRev = dtb_u_u695; f_Ec_ecDatas = dtb_u_u696; f_Ec_ecDepthOfMeta = dtb_u_u697; f_Ec_ecGoals = dtb_u_u698; f_Ec_ecInsts = dtb_u_u699; f_Ec_ecClasses = dtb_u_u700; f_Ec_ecConstraints = dtb_u_u701; f_Ec_ecDefTbl = dtb_u_u692; f_Ec_ecGlobalsTbl = dtb_u_u703; f_Ec_ecSolTbl = dtb_u_u704; f_Ec_ecDepthTbl = dtb_u_u705; f_Ec_ecGlobalsComplete = dtb_u_u706; f_Ec_ecClausesTbl = dtb_u_u707; f_Ec_ecCtorTbl = dtb_u_u708; f_Ec_ecHasLinear = dtb_u_u709; f_Ec_ecMetaSpans = dtb_u_u710; f_Ec_ecUseSpans = dtb_u_u711; f_Ec_ecWarnings = dtb_u_u712; f_Ec_ecCounters = dtb_u_u713; f_Ec_ecErrors = dtb_u_u714 }
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Elab/Types.vuna"
let v_dtCtorName = (fun (dtb_u_u715 : t_DtCtor) -> (match dtb_u_u715 with
  | { f_DtCtor_dtCtorName = dtb_u_u716; f_DtCtor_dtCtorFamily = dtb_u_u717; f_DtCtor_dtCtorTelescope = dtb_u_u718; f_DtCtor_dtCtorType = dtb_u_u719; f_DtCtor_dtCtorSpan = dtb_u_u720 } -> dtb_u_u716
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Elab/Types.vuna"
let v_dtCtorFamily = (fun (dtb_u_u721 : t_DtCtor) -> (match dtb_u_u721 with
  | { f_DtCtor_dtCtorName = dtb_u_u722; f_DtCtor_dtCtorFamily = dtb_u_u723; f_DtCtor_dtCtorTelescope = dtb_u_u724; f_DtCtor_dtCtorType = dtb_u_u725; f_DtCtor_dtCtorSpan = dtb_u_u726 } -> dtb_u_u723
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Elab/Types.vuna"
let v_dtCtorTelescope = (fun (dtb_u_u727 : t_DtCtor) -> (match dtb_u_u727 with
  | { f_DtCtor_dtCtorName = dtb_u_u728; f_DtCtor_dtCtorFamily = dtb_u_u729; f_DtCtor_dtCtorTelescope = dtb_u_u730; f_DtCtor_dtCtorType = dtb_u_u731; f_DtCtor_dtCtorSpan = dtb_u_u732 } -> dtb_u_u730
  | _ -> failwith "DT: impossible branch"
))

# 68 "Vuna/Compiler/Elab/Types.vuna"
let v_dtCtorType = (fun (dtb_u_u733 : t_DtCtor) -> (match dtb_u_u733 with
  | { f_DtCtor_dtCtorName = dtb_u_u734; f_DtCtor_dtCtorFamily = dtb_u_u735; f_DtCtor_dtCtorTelescope = dtb_u_u736; f_DtCtor_dtCtorType = dtb_u_u737; f_DtCtor_dtCtorSpan = dtb_u_u738 } -> dtb_u_u737
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Elab/Types.vuna"
let v_dtCtorSpan = (fun (dtb_u_u739 : t_DtCtor) -> (match dtb_u_u739 with
  | { f_DtCtor_dtCtorName = dtb_u_u740; f_DtCtor_dtCtorFamily = dtb_u_u741; f_DtCtor_dtCtorTelescope = dtb_u_u742; f_DtCtor_dtCtorType = dtb_u_u743; f_DtCtor_dtCtorSpan = dtb_u_u744 } -> dtb_u_u744
  | _ -> failwith "DT: impossible branch"
))

# 76 "Vuna/Compiler/Elab/Types.vuna"
let v_dtFieldName = (fun (dtb_u_u745 : t_DtFieldMeta) -> (match dtb_u_u745 with
  | { f_DtFieldMeta_dtFieldName = dtb_u_u746; f_DtFieldMeta_dtFieldIndex = dtb_u_u747; f_DtFieldMeta_dtFieldType = dtb_u_u748 } -> dtb_u_u746
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Elab/Types.vuna"
let v_dtFieldIndex = (fun (dtb_u_u749 : t_DtFieldMeta) -> (match dtb_u_u749 with
  | { f_DtFieldMeta_dtFieldName = dtb_u_u750; f_DtFieldMeta_dtFieldIndex = dtb_u_u751; f_DtFieldMeta_dtFieldType = dtb_u_u752 } -> dtb_u_u751
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Elab/Types.vuna"
let v_dtFieldType = (fun (dtb_u_u753 : t_DtFieldMeta) -> (match dtb_u_u753 with
  | { f_DtFieldMeta_dtFieldName = dtb_u_u754; f_DtFieldMeta_dtFieldIndex = dtb_u_u755; f_DtFieldMeta_dtFieldType = dtb_u_u756 } -> dtb_u_u756
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataName = (fun (dtb_u_u757 : t_DtData) -> (match dtb_u_u757 with
  | { f_DtData_dtDataName = dtb_u_u758; f_DtData_dtDataParams = dtb_u_u759; f_DtData_dtDataCtors = dtb_u_u760; f_DtData_dtDataKind = dtb_u_u761; f_DtData_dtDataViaClasses = dtb_u_u762; f_DtData_dtDataLinear = dtb_u_u763; f_DtData_dtDataRepr = dtb_u_u764; f_DtData_dtDataFields = dtb_u_u765; f_DtData_dtDataIsRecord = dtb_u_u766 } -> dtb_u_u758
  | _ -> failwith "DT: impossible branch"
))

# 741 "Vuna/Compiler/Elab/Types.vuna"
let rec v_memDataNameIn = (fun (dtb_u_u767 : string) (dtb_u_u768 : t_DtData B_dData_dList.t_List) -> (match dtb_u_u768 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u769, dtb_u_u770) -> (if ((v_dtDataName dtb_u_u769) = dtb_u_u767) then true else ((v_memDataNameIn dtb_u_u767) dtb_u_u770))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 748 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddDef = (fun (dtb_u_u771 : t_Ec) (dtb_u_u772 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (match dtb_u_u771 with
  | { f_Ec_ecNext = dtb_u_u773; f_Ec_ecSols = dtb_u_u774; f_Ec_ecDefsRev = dtb_u_u775; f_Ec_ecDatas = dtb_u_u776; f_Ec_ecDepthOfMeta = dtb_u_u777; f_Ec_ecGoals = dtb_u_u778; f_Ec_ecInsts = dtb_u_u779; f_Ec_ecClasses = dtb_u_u780; f_Ec_ecConstraints = dtb_u_u781; f_Ec_ecDefTbl = dtb_u_u782; f_Ec_ecGlobalsTbl = dtb_u_u783; f_Ec_ecSolTbl = dtb_u_u784; f_Ec_ecDepthTbl = dtb_u_u785; f_Ec_ecGlobalsComplete = dtb_u_u786; f_Ec_ecClausesTbl = dtb_u_u787; f_Ec_ecCtorTbl = dtb_u_u788; f_Ec_ecHasLinear = dtb_u_u789; f_Ec_ecMetaSpans = dtb_u_u790; f_Ec_ecUseSpans = dtb_u_u791; f_Ec_ecWarnings = dtb_u_u792; f_Ec_ecCounters = dtb_u_u793; f_Ec_ecErrors = dtb_u_u794 } -> (let dtb_u_u795 = (if ((v_memDataNameIn (B_dData_dPair.v_firstOf dtb_u_u772)) dtb_u_u776) then dtb_u_u782 else (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (B_dData_dPair.v_firstOf dtb_u_u772)) (B_dData_dPair.v_secondOf dtb_u_u772)) dtb_u_u782)) in { f_Ec_ecNext = dtb_u_u773; f_Ec_ecSols = dtb_u_u774; f_Ec_ecDefsRev = (B_dData_dList.C_List__x58__x58_ (dtb_u_u772, dtb_u_u775)); f_Ec_ecDatas = dtb_u_u776; f_Ec_ecDepthOfMeta = dtb_u_u777; f_Ec_ecGoals = dtb_u_u778; f_Ec_ecInsts = dtb_u_u779; f_Ec_ecClasses = dtb_u_u780; f_Ec_ecConstraints = dtb_u_u781; f_Ec_ecDefTbl = dtb_u_u795; f_Ec_ecGlobalsTbl = dtb_u_u783; f_Ec_ecSolTbl = dtb_u_u784; f_Ec_ecDepthTbl = dtb_u_u785; f_Ec_ecGlobalsComplete = dtb_u_u786; f_Ec_ecClausesTbl = dtb_u_u787; f_Ec_ecCtorTbl = dtb_u_u788; f_Ec_ecHasLinear = dtb_u_u789; f_Ec_ecMetaSpans = dtb_u_u790; f_Ec_ecUseSpans = dtb_u_u791; f_Ec_ecWarnings = dtb_u_u792; f_Ec_ecCounters = dtb_u_u793; f_Ec_ecErrors = dtb_u_u794 })
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataParams = (fun (dtb_u_u796 : t_DtData) -> (match dtb_u_u796 with
  | { f_DtData_dtDataName = dtb_u_u797; f_DtData_dtDataParams = dtb_u_u798; f_DtData_dtDataCtors = dtb_u_u799; f_DtData_dtDataKind = dtb_u_u800; f_DtData_dtDataViaClasses = dtb_u_u801; f_DtData_dtDataLinear = dtb_u_u802; f_DtData_dtDataRepr = dtb_u_u803; f_DtData_dtDataFields = dtb_u_u804; f_DtData_dtDataIsRecord = dtb_u_u805 } -> dtb_u_u798
  | _ -> failwith "DT: impossible branch"
))

# 84 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataCtors = (fun (dtb_u_u806 : t_DtData) -> (match dtb_u_u806 with
  | { f_DtData_dtDataName = dtb_u_u807; f_DtData_dtDataParams = dtb_u_u808; f_DtData_dtDataCtors = dtb_u_u809; f_DtData_dtDataKind = dtb_u_u810; f_DtData_dtDataViaClasses = dtb_u_u811; f_DtData_dtDataLinear = dtb_u_u812; f_DtData_dtDataRepr = dtb_u_u813; f_DtData_dtDataFields = dtb_u_u814; f_DtData_dtDataIsRecord = dtb_u_u815 } -> dtb_u_u809
  | _ -> failwith "DT: impossible branch"
))

# 836 "Vuna/Compiler/Elab/Types.vuna"
let v_dataCtorPairs = (fun (dtb_u_u816 : t_DtData) -> ((B_dData_dList.v_map (fun (dtb_u_u817 : t_DtCtor) -> { B_dData_dPair.f_Pair_first = (v_dtCtorName dtb_u_u817); B_dData_dPair.f_Pair_second = dtb_u_u817 })) (v_dtDataCtors dtb_u_u816)))

# 833 "Vuna/Compiler/Elab/Types.vuna"
let v_ctorTblOfDatas = (fun (dtb_u_u818 : t_DtData B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_concatMap v_dataCtorPairs) dtb_u_u818)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 85 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataKind = (fun (dtb_u_u819 : t_DtData) -> (match dtb_u_u819 with
  | { f_DtData_dtDataName = dtb_u_u820; f_DtData_dtDataParams = dtb_u_u821; f_DtData_dtDataCtors = dtb_u_u822; f_DtData_dtDataKind = dtb_u_u823; f_DtData_dtDataViaClasses = dtb_u_u824; f_DtData_dtDataLinear = dtb_u_u825; f_DtData_dtDataRepr = dtb_u_u826; f_DtData_dtDataFields = dtb_u_u827; f_DtData_dtDataIsRecord = dtb_u_u828 } -> dtb_u_u823
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataViaClasses = (fun (dtb_u_u829 : t_DtData) -> (match dtb_u_u829 with
  | { f_DtData_dtDataName = dtb_u_u830; f_DtData_dtDataParams = dtb_u_u831; f_DtData_dtDataCtors = dtb_u_u832; f_DtData_dtDataKind = dtb_u_u833; f_DtData_dtDataViaClasses = dtb_u_u834; f_DtData_dtDataLinear = dtb_u_u835; f_DtData_dtDataRepr = dtb_u_u836; f_DtData_dtDataFields = dtb_u_u837; f_DtData_dtDataIsRecord = dtb_u_u838 } -> dtb_u_u834
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataLinear = (fun (dtb_u_u839 : t_DtData) -> (match dtb_u_u839 with
  | { f_DtData_dtDataName = dtb_u_u840; f_DtData_dtDataParams = dtb_u_u841; f_DtData_dtDataCtors = dtb_u_u842; f_DtData_dtDataKind = dtb_u_u843; f_DtData_dtDataViaClasses = dtb_u_u844; f_DtData_dtDataLinear = dtb_u_u845; f_DtData_dtDataRepr = dtb_u_u846; f_DtData_dtDataFields = dtb_u_u847; f_DtData_dtDataIsRecord = dtb_u_u848 } -> dtb_u_u845
  | _ -> failwith "DT: impossible branch"
))

# 806 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddData = (fun (dtb_u_u849 : t_Ec) (dtb_u_u850 : t_DtData) -> (match dtb_u_u849 with
  | { f_Ec_ecNext = dtb_u_u851; f_Ec_ecSols = dtb_u_u852; f_Ec_ecDefsRev = dtb_u_u853; f_Ec_ecDatas = dtb_u_u854; f_Ec_ecDepthOfMeta = dtb_u_u855; f_Ec_ecGoals = dtb_u_u856; f_Ec_ecInsts = dtb_u_u857; f_Ec_ecClasses = dtb_u_u858; f_Ec_ecConstraints = dtb_u_u859; f_Ec_ecDefTbl = dtb_u_u860; f_Ec_ecGlobalsTbl = dtb_u_u861; f_Ec_ecSolTbl = dtb_u_u862; f_Ec_ecDepthTbl = dtb_u_u863; f_Ec_ecGlobalsComplete = dtb_u_u864; f_Ec_ecClausesTbl = dtb_u_u865; f_Ec_ecCtorTbl = dtb_u_u866; f_Ec_ecHasLinear = dtb_u_u867; f_Ec_ecMetaSpans = dtb_u_u868; f_Ec_ecUseSpans = dtb_u_u869; f_Ec_ecWarnings = dtb_u_u870; f_Ec_ecCounters = dtb_u_u871; f_Ec_ecErrors = dtb_u_u872 } -> { f_Ec_ecNext = dtb_u_u851; f_Ec_ecSols = dtb_u_u852; f_Ec_ecDefsRev = dtb_u_u853; f_Ec_ecDatas = ((B_dData_dList.v_append dtb_u_u854) (B_dData_dList.C_List__x58__x58_ (dtb_u_u850, B_dData_dList.C_List_Nil))); f_Ec_ecDepthOfMeta = dtb_u_u855; f_Ec_ecGoals = dtb_u_u856; f_Ec_ecInsts = dtb_u_u857; f_Ec_ecClasses = dtb_u_u858; f_Ec_ecConstraints = dtb_u_u859; f_Ec_ecDefTbl = dtb_u_u860; f_Ec_ecGlobalsTbl = dtb_u_u861; f_Ec_ecSolTbl = dtb_u_u862; f_Ec_ecDepthTbl = dtb_u_u863; f_Ec_ecGlobalsComplete = dtb_u_u864; f_Ec_ecClausesTbl = dtb_u_u865; f_Ec_ecCtorTbl = ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (v_dataCtorPairs dtb_u_u850)) dtb_u_u866); f_Ec_ecHasLinear = (if (v_dtDataLinear dtb_u_u850) then true else dtb_u_u867); f_Ec_ecMetaSpans = dtb_u_u868; f_Ec_ecUseSpans = dtb_u_u869; f_Ec_ecWarnings = dtb_u_u870; f_Ec_ecCounters = dtb_u_u871; f_Ec_ecErrors = dtb_u_u872 }
  | _ -> failwith "DT: impossible branch"
))

# 991 "Vuna/Compiler/Elab/Types.vuna"
let rec v_datasHaveLinear = (fun (dtb_u_u873 : t_DtData B_dData_dList.t_List) -> (match dtb_u_u873 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u874, dtb_u_u875) -> (if (v_dtDataLinear dtb_u_u874) then true else (v_datasHaveLinear dtb_u_u875))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataRepr = (fun (dtb_u_u876 : t_DtData) -> (match dtb_u_u876 with
  | { f_DtData_dtDataName = dtb_u_u877; f_DtData_dtDataParams = dtb_u_u878; f_DtData_dtDataCtors = dtb_u_u879; f_DtData_dtDataKind = dtb_u_u880; f_DtData_dtDataViaClasses = dtb_u_u881; f_DtData_dtDataLinear = dtb_u_u882; f_DtData_dtDataRepr = dtb_u_u883; f_DtData_dtDataFields = dtb_u_u884; f_DtData_dtDataIsRecord = dtb_u_u885 } -> dtb_u_u883
  | _ -> failwith "DT: impossible branch"
))

# 92 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataFields = (fun (dtb_u_u886 : t_DtData) -> (match dtb_u_u886 with
  | { f_DtData_dtDataName = dtb_u_u887; f_DtData_dtDataParams = dtb_u_u888; f_DtData_dtDataCtors = dtb_u_u889; f_DtData_dtDataKind = dtb_u_u890; f_DtData_dtDataViaClasses = dtb_u_u891; f_DtData_dtDataLinear = dtb_u_u892; f_DtData_dtDataRepr = dtb_u_u893; f_DtData_dtDataFields = dtb_u_u894; f_DtData_dtDataIsRecord = dtb_u_u895 } -> dtb_u_u894
  | _ -> failwith "DT: impossible branch"
))

# 96 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataIsRecord = (fun (dtb_u_u896 : t_DtData) -> (match dtb_u_u896 with
  | { f_DtData_dtDataName = dtb_u_u897; f_DtData_dtDataParams = dtb_u_u898; f_DtData_dtDataCtors = dtb_u_u899; f_DtData_dtDataKind = dtb_u_u900; f_DtData_dtDataViaClasses = dtb_u_u901; f_DtData_dtDataLinear = dtb_u_u902; f_DtData_dtDataRepr = dtb_u_u903; f_DtData_dtDataFields = dtb_u_u904; f_DtData_dtDataIsRecord = dtb_u_u905 } -> dtb_u_u905
  | _ -> failwith "DT: impossible branch"
))

# 101 "Vuna/Compiler/Elab/Types.vuna"
let v_dtGoalMeta = (fun (dtb_u_u906 : t_DtGoal) -> (match dtb_u_u906 with
  | { f_DtGoal_dtGoalMeta = dtb_u_u907; f_DtGoal_dtGoalSpan = dtb_u_u908; f_DtGoal_dtGoalType = dtb_u_u909; f_DtGoal_dtGoalCtx = dtb_u_u910; f_DtGoal_dtGoalName = dtb_u_u911 } -> dtb_u_u907
  | _ -> failwith "DT: impossible branch"
))

# 102 "Vuna/Compiler/Elab/Types.vuna"
let v_dtGoalSpan = (fun (dtb_u_u912 : t_DtGoal) -> (match dtb_u_u912 with
  | { f_DtGoal_dtGoalMeta = dtb_u_u913; f_DtGoal_dtGoalSpan = dtb_u_u914; f_DtGoal_dtGoalType = dtb_u_u915; f_DtGoal_dtGoalCtx = dtb_u_u916; f_DtGoal_dtGoalName = dtb_u_u917 } -> dtb_u_u914
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Elab/Types.vuna"
let v_dtGoalType = (fun (dtb_u_u918 : t_DtGoal) -> (match dtb_u_u918 with
  | { f_DtGoal_dtGoalMeta = dtb_u_u919; f_DtGoal_dtGoalSpan = dtb_u_u920; f_DtGoal_dtGoalType = dtb_u_u921; f_DtGoal_dtGoalCtx = dtb_u_u922; f_DtGoal_dtGoalName = dtb_u_u923 } -> dtb_u_u921
  | _ -> failwith "DT: impossible branch"
))

# 104 "Vuna/Compiler/Elab/Types.vuna"
let v_dtGoalCtx = (fun (dtb_u_u924 : t_DtGoal) -> (match dtb_u_u924 with
  | { f_DtGoal_dtGoalMeta = dtb_u_u925; f_DtGoal_dtGoalSpan = dtb_u_u926; f_DtGoal_dtGoalType = dtb_u_u927; f_DtGoal_dtGoalCtx = dtb_u_u928; f_DtGoal_dtGoalName = dtb_u_u929 } -> dtb_u_u928
  | _ -> failwith "DT: impossible branch"
))

# 105 "Vuna/Compiler/Elab/Types.vuna"
let v_dtGoalName = (fun (dtb_u_u930 : t_DtGoal) -> (match dtb_u_u930 with
  | { f_DtGoal_dtGoalMeta = dtb_u_u931; f_DtGoal_dtGoalSpan = dtb_u_u932; f_DtGoal_dtGoalType = dtb_u_u933; f_DtGoal_dtGoalCtx = dtb_u_u934; f_DtGoal_dtGoalName = dtb_u_u935 } -> dtb_u_u935
  | _ -> failwith "DT: impossible branch"
))

# 109 "Vuna/Compiler/Elab/Types.vuna"
let v_dtClassName = (fun (dtb_u_u936 : t_DtClass) -> (match dtb_u_u936 with
  | { f_DtClass_dtClassName = dtb_u_u937; f_DtClass_dtClassParams = dtb_u_u938; f_DtClass_dtClassSupers = dtb_u_u939; f_DtClass_dtClassMethods = dtb_u_u940; f_DtClass_dtClassFieldTys = dtb_u_u941; f_DtClass_dtClassMethodSpans = dtb_u_u942 } -> dtb_u_u937
  | _ -> failwith "DT: impossible branch"
))

# 110 "Vuna/Compiler/Elab/Types.vuna"
let v_dtClassParams = (fun (dtb_u_u943 : t_DtClass) -> (match dtb_u_u943 with
  | { f_DtClass_dtClassName = dtb_u_u944; f_DtClass_dtClassParams = dtb_u_u945; f_DtClass_dtClassSupers = dtb_u_u946; f_DtClass_dtClassMethods = dtb_u_u947; f_DtClass_dtClassFieldTys = dtb_u_u948; f_DtClass_dtClassMethodSpans = dtb_u_u949 } -> dtb_u_u945
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Elab/Types.vuna"
let v_dtClassSupers = (fun (dtb_u_u950 : t_DtClass) -> (match dtb_u_u950 with
  | { f_DtClass_dtClassName = dtb_u_u951; f_DtClass_dtClassParams = dtb_u_u952; f_DtClass_dtClassSupers = dtb_u_u953; f_DtClass_dtClassMethods = dtb_u_u954; f_DtClass_dtClassFieldTys = dtb_u_u955; f_DtClass_dtClassMethodSpans = dtb_u_u956 } -> dtb_u_u953
  | _ -> failwith "DT: impossible branch"
))

# 113 "Vuna/Compiler/Elab/Types.vuna"
let v_dtClassMethods = (fun (dtb_u_u957 : t_DtClass) -> (match dtb_u_u957 with
  | { f_DtClass_dtClassName = dtb_u_u958; f_DtClass_dtClassParams = dtb_u_u959; f_DtClass_dtClassSupers = dtb_u_u960; f_DtClass_dtClassMethods = dtb_u_u961; f_DtClass_dtClassFieldTys = dtb_u_u962; f_DtClass_dtClassMethodSpans = dtb_u_u963 } -> dtb_u_u961
  | _ -> failwith "DT: impossible branch"
))

# 114 "Vuna/Compiler/Elab/Types.vuna"
let v_dtClassFieldTys = (fun (dtb_u_u964 : t_DtClass) -> (match dtb_u_u964 with
  | { f_DtClass_dtClassName = dtb_u_u965; f_DtClass_dtClassParams = dtb_u_u966; f_DtClass_dtClassSupers = dtb_u_u967; f_DtClass_dtClassMethods = dtb_u_u968; f_DtClass_dtClassFieldTys = dtb_u_u969; f_DtClass_dtClassMethodSpans = dtb_u_u970 } -> dtb_u_u969
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Elab/Types.vuna"
let v_dtClassMethodSpans = (fun (dtb_u_u971 : t_DtClass) -> (match dtb_u_u971 with
  | { f_DtClass_dtClassName = dtb_u_u972; f_DtClass_dtClassParams = dtb_u_u973; f_DtClass_dtClassSupers = dtb_u_u974; f_DtClass_dtClassMethods = dtb_u_u975; f_DtClass_dtClassFieldTys = dtb_u_u976; f_DtClass_dtClassMethodSpans = dtb_u_u977 } -> dtb_u_u977
  | _ -> failwith "DT: impossible branch"
))

# 123 "Vuna/Compiler/Elab/Types.vuna"
let v_dtInstName = (fun (dtb_u_u978 : t_DtInst) -> (match dtb_u_u978 with
  | { f_DtInst_dtInstName = dtb_u_u979; f_DtInst_dtInstSym = dtb_u_u980; f_DtInst_dtInstKey = dtb_u_u981; f_DtInst_dtInstTele = dtb_u_u982; f_DtInst_dtInstCtx = dtb_u_u983; f_DtInst_dtInstHead = dtb_u_u984; f_DtInst_dtInstSpan = dtb_u_u985 } -> dtb_u_u979
  | _ -> failwith "DT: impossible branch"
))

# 125 "Vuna/Compiler/Elab/Types.vuna"
let v_dtInstSym = (fun (dtb_u_u986 : t_DtInst) -> (match dtb_u_u986 with
  | { f_DtInst_dtInstName = dtb_u_u987; f_DtInst_dtInstSym = dtb_u_u988; f_DtInst_dtInstKey = dtb_u_u989; f_DtInst_dtInstTele = dtb_u_u990; f_DtInst_dtInstCtx = dtb_u_u991; f_DtInst_dtInstHead = dtb_u_u992; f_DtInst_dtInstSpan = dtb_u_u993 } -> dtb_u_u988
  | _ -> failwith "DT: impossible branch"
))

# 421 "Vuna/Compiler/Elab/Types.vuna"
let rec v_allBucketsMatch = (fun (dtb_u_u994 : t_DtInst B_dData_dList.t_List) (dtb_u_u995 : (string, t_DtInst B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u995 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u996, dtb_u_u997) -> (match dtb_u_u996 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u998; B_dData_dPair.f_Pair_second = dtb_u_u999 } -> (if ((v_instNamesEq ((B_dData_dList.v_map v_dtInstSym) dtb_u_u999)) ((B_dData_dList.v_map v_dtInstSym) ((B_dData_dList.v_filter (fun (dtb_u_u1000 : t_DtInst) -> ((v_instFamilyOf dtb_u_u1000) = dtb_u_u998))) dtb_u_u994))) then ((v_allBucketsMatch dtb_u_u994) dtb_u_u997) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 408 "Vuna/Compiler/Elab/Types.vuna"
let v_ecInstsAudit = (fun (dtb_u_u1001 : t_Ec) -> (match dtb_u_u1001 with
  | { f_Ec_ecNext = dtb_u_u1002; f_Ec_ecSols = dtb_u_u1003; f_Ec_ecDefsRev = dtb_u_u1004; f_Ec_ecDatas = dtb_u_u1005; f_Ec_ecDepthOfMeta = dtb_u_u1006; f_Ec_ecGoals = dtb_u_u1007; f_Ec_ecInsts = dtb_u_u1008; f_Ec_ecClasses = dtb_u_u1009; f_Ec_ecConstraints = dtb_u_u1010; f_Ec_ecDefTbl = dtb_u_u1011; f_Ec_ecGlobalsTbl = dtb_u_u1012; f_Ec_ecSolTbl = dtb_u_u1013; f_Ec_ecDepthTbl = dtb_u_u1014; f_Ec_ecGlobalsComplete = dtb_u_u1015; f_Ec_ecClausesTbl = dtb_u_u1016; f_Ec_ecCtorTbl = dtb_u_u1017; f_Ec_ecHasLinear = dtb_u_u1018; f_Ec_ecMetaSpans = dtb_u_u1019; f_Ec_ecUseSpans = dtb_u_u1020; f_Ec_ecWarnings = dtb_u_u1021; f_Ec_ecCounters = dtb_u_u1022; f_Ec_ecErrors = dtb_u_u1023 } -> (let dtb_u_u1024 = (B_dContainer_dHashMap.v_toList (dtb_u_u1008).f_InstStore_instsByFamily) in (let dtb_u_u1025 = (dtb_u_u1008).f_InstStore_instsList in (if ((v_bucketCount dtb_u_u1024) = (B_dData_dList.v_length dtb_u_u1025)) then ((v_allBucketsMatch dtb_u_u1025) dtb_u_u1024) else false)))
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Elab/Types.vuna"
let v_dtInstKey = (fun (dtb_u_u1026 : t_DtInst) -> (match dtb_u_u1026 with
  | { f_DtInst_dtInstName = dtb_u_u1027; f_DtInst_dtInstSym = dtb_u_u1028; f_DtInst_dtInstKey = dtb_u_u1029; f_DtInst_dtInstTele = dtb_u_u1030; f_DtInst_dtInstCtx = dtb_u_u1031; f_DtInst_dtInstHead = dtb_u_u1032; f_DtInst_dtInstSpan = dtb_u_u1033 } -> dtb_u_u1029
  | _ -> failwith "DT: impossible branch"
))

# 129 "Vuna/Compiler/Elab/Types.vuna"
let v_dtInstTele = (fun (dtb_u_u1034 : t_DtInst) -> (match dtb_u_u1034 with
  | { f_DtInst_dtInstName = dtb_u_u1035; f_DtInst_dtInstSym = dtb_u_u1036; f_DtInst_dtInstKey = dtb_u_u1037; f_DtInst_dtInstTele = dtb_u_u1038; f_DtInst_dtInstCtx = dtb_u_u1039; f_DtInst_dtInstHead = dtb_u_u1040; f_DtInst_dtInstSpan = dtb_u_u1041 } -> dtb_u_u1038
  | _ -> failwith "DT: impossible branch"
))

# 130 "Vuna/Compiler/Elab/Types.vuna"
let v_dtInstCtx = (fun (dtb_u_u1042 : t_DtInst) -> (match dtb_u_u1042 with
  | { f_DtInst_dtInstName = dtb_u_u1043; f_DtInst_dtInstSym = dtb_u_u1044; f_DtInst_dtInstKey = dtb_u_u1045; f_DtInst_dtInstTele = dtb_u_u1046; f_DtInst_dtInstCtx = dtb_u_u1047; f_DtInst_dtInstHead = dtb_u_u1048; f_DtInst_dtInstSpan = dtb_u_u1049 } -> dtb_u_u1047
  | _ -> failwith "DT: impossible branch"
))

# 131 "Vuna/Compiler/Elab/Types.vuna"
let v_dtInstHead = (fun (dtb_u_u1050 : t_DtInst) -> (match dtb_u_u1050 with
  | { f_DtInst_dtInstName = dtb_u_u1051; f_DtInst_dtInstSym = dtb_u_u1052; f_DtInst_dtInstKey = dtb_u_u1053; f_DtInst_dtInstTele = dtb_u_u1054; f_DtInst_dtInstCtx = dtb_u_u1055; f_DtInst_dtInstHead = dtb_u_u1056; f_DtInst_dtInstSpan = dtb_u_u1057 } -> dtb_u_u1056
  | _ -> failwith "DT: impossible branch"
))

# 132 "Vuna/Compiler/Elab/Types.vuna"
let v_dtInstSpan = (fun (dtb_u_u1058 : t_DtInst) -> (match dtb_u_u1058 with
  | { f_DtInst_dtInstName = dtb_u_u1059; f_DtInst_dtInstSym = dtb_u_u1060; f_DtInst_dtInstKey = dtb_u_u1061; f_DtInst_dtInstTele = dtb_u_u1062; f_DtInst_dtInstCtx = dtb_u_u1063; f_DtInst_dtInstHead = dtb_u_u1064; f_DtInst_dtInstSpan = dtb_u_u1065 } -> dtb_u_u1065
  | _ -> failwith "DT: impossible branch"
))

# 154 "Vuna/Compiler/Elab/Types.vuna"
let v_instsList = (fun (dtb_u_u1066 : t_InstStore) -> (match dtb_u_u1066 with
  | { f_InstStore_instsList = dtb_u_u1067; f_InstStore_instsByFamily = dtb_u_u1068 } -> dtb_u_u1067
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Elab/Types.vuna"
let v_instsByFamily = (fun (dtb_u_u1069 : t_InstStore) -> (match dtb_u_u1069 with
  | { f_InstStore_instsList = dtb_u_u1070; f_InstStore_instsByFamily = dtb_u_u1071 } -> dtb_u_u1071
  | _ -> failwith "DT: impossible branch"
))

# 209 "Vuna/Compiler/Elab/Types.vuna"
let v_conId = (fun (dtb_u_u1072 : t_Constraint) -> (match dtb_u_u1072 with
  | { f_Constraint_conId = dtb_u_u1073; f_Constraint_conKind = dtb_u_u1074; f_Constraint_conMeta = dtb_u_u1075; f_Constraint_conDom = dtb_u_u1076; f_Constraint_conSpan = dtb_u_u1077; f_Constraint_conDepth = dtb_u_u1078 } -> dtb_u_u1073
  | _ -> failwith "DT: impossible branch"
))

# 210 "Vuna/Compiler/Elab/Types.vuna"
let v_conKind = (fun (dtb_u_u1079 : t_Constraint) -> (match dtb_u_u1079 with
  | { f_Constraint_conId = dtb_u_u1080; f_Constraint_conKind = dtb_u_u1081; f_Constraint_conMeta = dtb_u_u1082; f_Constraint_conDom = dtb_u_u1083; f_Constraint_conSpan = dtb_u_u1084; f_Constraint_conDepth = dtb_u_u1085 } -> dtb_u_u1081
  | _ -> failwith "DT: impossible branch"
))

# 211 "Vuna/Compiler/Elab/Types.vuna"
let v_conMeta = (fun (dtb_u_u1086 : t_Constraint) -> (match dtb_u_u1086 with
  | { f_Constraint_conId = dtb_u_u1087; f_Constraint_conKind = dtb_u_u1088; f_Constraint_conMeta = dtb_u_u1089; f_Constraint_conDom = dtb_u_u1090; f_Constraint_conSpan = dtb_u_u1091; f_Constraint_conDepth = dtb_u_u1092 } -> dtb_u_u1089
  | _ -> failwith "DT: impossible branch"
))

# 212 "Vuna/Compiler/Elab/Types.vuna"
let v_conDom = (fun (dtb_u_u1093 : t_Constraint) -> (match dtb_u_u1093 with
  | { f_Constraint_conId = dtb_u_u1094; f_Constraint_conKind = dtb_u_u1095; f_Constraint_conMeta = dtb_u_u1096; f_Constraint_conDom = dtb_u_u1097; f_Constraint_conSpan = dtb_u_u1098; f_Constraint_conDepth = dtb_u_u1099 } -> dtb_u_u1097
  | _ -> failwith "DT: impossible branch"
))

# 213 "Vuna/Compiler/Elab/Types.vuna"
let v_conSpan = (fun (dtb_u_u1100 : t_Constraint) -> (match dtb_u_u1100 with
  | { f_Constraint_conId = dtb_u_u1101; f_Constraint_conKind = dtb_u_u1102; f_Constraint_conMeta = dtb_u_u1103; f_Constraint_conDom = dtb_u_u1104; f_Constraint_conSpan = dtb_u_u1105; f_Constraint_conDepth = dtb_u_u1106 } -> dtb_u_u1105
  | _ -> failwith "DT: impossible branch"
))

# 214 "Vuna/Compiler/Elab/Types.vuna"
let v_conDepth = (fun (dtb_u_u1107 : t_Constraint) -> (match dtb_u_u1107 with
  | { f_Constraint_conId = dtb_u_u1108; f_Constraint_conKind = dtb_u_u1109; f_Constraint_conMeta = dtb_u_u1110; f_Constraint_conDom = dtb_u_u1111; f_Constraint_conSpan = dtb_u_u1112; f_Constraint_conDepth = dtb_u_u1113 } -> dtb_u_u1113
  | _ -> failwith "DT: impossible branch"
))

# 219 "Vuna/Compiler/Elab/Types.vuna"
let v_csPending = (fun (dtb_u_u1114 : t_ConstraintStore) -> (match dtb_u_u1114 with
  | { f_ConstraintStore_csPending = dtb_u_u1115; f_ConstraintStore_csNextId = dtb_u_u1116; f_ConstraintStore_csTried = dtb_u_u1117; f_ConstraintStore_csSolsCount = dtb_u_u1118; f_ConstraintStore_csPassNext = dtb_u_u1119; f_ConstraintStore_csPassSols = dtb_u_u1120; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1121 } -> dtb_u_u1115
  | _ -> failwith "DT: impossible branch"
))

# 220 "Vuna/Compiler/Elab/Types.vuna"
let v_csNextId = (fun (dtb_u_u1122 : t_ConstraintStore) -> (match dtb_u_u1122 with
  | { f_ConstraintStore_csPending = dtb_u_u1123; f_ConstraintStore_csNextId = dtb_u_u1124; f_ConstraintStore_csTried = dtb_u_u1125; f_ConstraintStore_csSolsCount = dtb_u_u1126; f_ConstraintStore_csPassNext = dtb_u_u1127; f_ConstraintStore_csPassSols = dtb_u_u1128; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1129 } -> dtb_u_u1124
  | _ -> failwith "DT: impossible branch"
))

# 224 "Vuna/Compiler/Elab/Types.vuna"
let v_csTried = (fun (dtb_u_u1130 : t_ConstraintStore) -> (match dtb_u_u1130 with
  | { f_ConstraintStore_csPending = dtb_u_u1131; f_ConstraintStore_csNextId = dtb_u_u1132; f_ConstraintStore_csTried = dtb_u_u1133; f_ConstraintStore_csSolsCount = dtb_u_u1134; f_ConstraintStore_csPassNext = dtb_u_u1135; f_ConstraintStore_csPassSols = dtb_u_u1136; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1137 } -> dtb_u_u1133
  | _ -> failwith "DT: impossible branch"
))

# 226 "Vuna/Compiler/Elab/Types.vuna"
let v_csSolsCount = (fun (dtb_u_u1138 : t_ConstraintStore) -> (match dtb_u_u1138 with
  | { f_ConstraintStore_csPending = dtb_u_u1139; f_ConstraintStore_csNextId = dtb_u_u1140; f_ConstraintStore_csTried = dtb_u_u1141; f_ConstraintStore_csSolsCount = dtb_u_u1142; f_ConstraintStore_csPassNext = dtb_u_u1143; f_ConstraintStore_csPassSols = dtb_u_u1144; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1145 } -> dtb_u_u1142
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Elab/Types.vuna"
let v_csPassNext = (fun (dtb_u_u1146 : t_ConstraintStore) -> (match dtb_u_u1146 with
  | { f_ConstraintStore_csPending = dtb_u_u1147; f_ConstraintStore_csNextId = dtb_u_u1148; f_ConstraintStore_csTried = dtb_u_u1149; f_ConstraintStore_csSolsCount = dtb_u_u1150; f_ConstraintStore_csPassNext = dtb_u_u1151; f_ConstraintStore_csPassSols = dtb_u_u1152; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1153 } -> dtb_u_u1151
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Elab/Types.vuna"
let v_csPassSols = (fun (dtb_u_u1154 : t_ConstraintStore) -> (match dtb_u_u1154 with
  | { f_ConstraintStore_csPending = dtb_u_u1155; f_ConstraintStore_csNextId = dtb_u_u1156; f_ConstraintStore_csTried = dtb_u_u1157; f_ConstraintStore_csSolsCount = dtb_u_u1158; f_ConstraintStore_csPassNext = dtb_u_u1159; f_ConstraintStore_csPassSols = dtb_u_u1160; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1161 } -> dtb_u_u1160
  | _ -> failwith "DT: impossible branch"
))

# 232 "Vuna/Compiler/Elab/Types.vuna"
let v_csCtorIndexComplete = (fun (dtb_u_u1162 : t_ConstraintStore) -> (match dtb_u_u1162 with
  | { f_ConstraintStore_csPending = dtb_u_u1163; f_ConstraintStore_csNextId = dtb_u_u1164; f_ConstraintStore_csTried = dtb_u_u1165; f_ConstraintStore_csSolsCount = dtb_u_u1166; f_ConstraintStore_csPassNext = dtb_u_u1167; f_ConstraintStore_csPassSols = dtb_u_u1168; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1169 } -> dtb_u_u1169
  | _ -> failwith "DT: impossible branch"
))

# 243 "Vuna/Compiler/Elab/Types.vuna"
let v_ecNext = (fun (dtb_u_u1170 : t_Ec) -> (match dtb_u_u1170 with
  | { f_Ec_ecNext = dtb_u_u1171; f_Ec_ecSols = dtb_u_u1172; f_Ec_ecDefsRev = dtb_u_u1173; f_Ec_ecDatas = dtb_u_u1174; f_Ec_ecDepthOfMeta = dtb_u_u1175; f_Ec_ecGoals = dtb_u_u1176; f_Ec_ecInsts = dtb_u_u1177; f_Ec_ecClasses = dtb_u_u1178; f_Ec_ecConstraints = dtb_u_u1179; f_Ec_ecDefTbl = dtb_u_u1180; f_Ec_ecGlobalsTbl = dtb_u_u1181; f_Ec_ecSolTbl = dtb_u_u1182; f_Ec_ecDepthTbl = dtb_u_u1183; f_Ec_ecGlobalsComplete = dtb_u_u1184; f_Ec_ecClausesTbl = dtb_u_u1185; f_Ec_ecCtorTbl = dtb_u_u1186; f_Ec_ecHasLinear = dtb_u_u1187; f_Ec_ecMetaSpans = dtb_u_u1188; f_Ec_ecUseSpans = dtb_u_u1189; f_Ec_ecWarnings = dtb_u_u1190; f_Ec_ecCounters = dtb_u_u1191; f_Ec_ecErrors = dtb_u_u1192 } -> dtb_u_u1171
  | _ -> failwith "DT: impossible branch"
))

# 244 "Vuna/Compiler/Elab/Types.vuna"
let v_ecSols = (fun (dtb_u_u1193 : t_Ec) -> (match dtb_u_u1193 with
  | { f_Ec_ecNext = dtb_u_u1194; f_Ec_ecSols = dtb_u_u1195; f_Ec_ecDefsRev = dtb_u_u1196; f_Ec_ecDatas = dtb_u_u1197; f_Ec_ecDepthOfMeta = dtb_u_u1198; f_Ec_ecGoals = dtb_u_u1199; f_Ec_ecInsts = dtb_u_u1200; f_Ec_ecClasses = dtb_u_u1201; f_Ec_ecConstraints = dtb_u_u1202; f_Ec_ecDefTbl = dtb_u_u1203; f_Ec_ecGlobalsTbl = dtb_u_u1204; f_Ec_ecSolTbl = dtb_u_u1205; f_Ec_ecDepthTbl = dtb_u_u1206; f_Ec_ecGlobalsComplete = dtb_u_u1207; f_Ec_ecClausesTbl = dtb_u_u1208; f_Ec_ecCtorTbl = dtb_u_u1209; f_Ec_ecHasLinear = dtb_u_u1210; f_Ec_ecMetaSpans = dtb_u_u1211; f_Ec_ecUseSpans = dtb_u_u1212; f_Ec_ecWarnings = dtb_u_u1213; f_Ec_ecCounters = dtb_u_u1214; f_Ec_ecErrors = dtb_u_u1215 } -> dtb_u_u1195
  | _ -> failwith "DT: impossible branch"
))

# 245 "Vuna/Compiler/Elab/Types.vuna"
let v_ecDefsRev = (fun (dtb_u_u1216 : t_Ec) -> (match dtb_u_u1216 with
  | { f_Ec_ecNext = dtb_u_u1217; f_Ec_ecSols = dtb_u_u1218; f_Ec_ecDefsRev = dtb_u_u1219; f_Ec_ecDatas = dtb_u_u1220; f_Ec_ecDepthOfMeta = dtb_u_u1221; f_Ec_ecGoals = dtb_u_u1222; f_Ec_ecInsts = dtb_u_u1223; f_Ec_ecClasses = dtb_u_u1224; f_Ec_ecConstraints = dtb_u_u1225; f_Ec_ecDefTbl = dtb_u_u1226; f_Ec_ecGlobalsTbl = dtb_u_u1227; f_Ec_ecSolTbl = dtb_u_u1228; f_Ec_ecDepthTbl = dtb_u_u1229; f_Ec_ecGlobalsComplete = dtb_u_u1230; f_Ec_ecClausesTbl = dtb_u_u1231; f_Ec_ecCtorTbl = dtb_u_u1232; f_Ec_ecHasLinear = dtb_u_u1233; f_Ec_ecMetaSpans = dtb_u_u1234; f_Ec_ecUseSpans = dtb_u_u1235; f_Ec_ecWarnings = dtb_u_u1236; f_Ec_ecCounters = dtb_u_u1237; f_Ec_ecErrors = dtb_u_u1238 } -> dtb_u_u1219
  | _ -> failwith "DT: impossible branch"
))

# 246 "Vuna/Compiler/Elab/Types.vuna"
let v_ecDatas = (fun (dtb_u_u1239 : t_Ec) -> (match dtb_u_u1239 with
  | { f_Ec_ecNext = dtb_u_u1240; f_Ec_ecSols = dtb_u_u1241; f_Ec_ecDefsRev = dtb_u_u1242; f_Ec_ecDatas = dtb_u_u1243; f_Ec_ecDepthOfMeta = dtb_u_u1244; f_Ec_ecGoals = dtb_u_u1245; f_Ec_ecInsts = dtb_u_u1246; f_Ec_ecClasses = dtb_u_u1247; f_Ec_ecConstraints = dtb_u_u1248; f_Ec_ecDefTbl = dtb_u_u1249; f_Ec_ecGlobalsTbl = dtb_u_u1250; f_Ec_ecSolTbl = dtb_u_u1251; f_Ec_ecDepthTbl = dtb_u_u1252; f_Ec_ecGlobalsComplete = dtb_u_u1253; f_Ec_ecClausesTbl = dtb_u_u1254; f_Ec_ecCtorTbl = dtb_u_u1255; f_Ec_ecHasLinear = dtb_u_u1256; f_Ec_ecMetaSpans = dtb_u_u1257; f_Ec_ecUseSpans = dtb_u_u1258; f_Ec_ecWarnings = dtb_u_u1259; f_Ec_ecCounters = dtb_u_u1260; f_Ec_ecErrors = dtb_u_u1261 } -> dtb_u_u1243
  | _ -> failwith "DT: impossible branch"
))

# 247 "Vuna/Compiler/Elab/Types.vuna"
let v_ecDepthOfMeta = (fun (dtb_u_u1262 : t_Ec) -> (match dtb_u_u1262 with
  | { f_Ec_ecNext = dtb_u_u1263; f_Ec_ecSols = dtb_u_u1264; f_Ec_ecDefsRev = dtb_u_u1265; f_Ec_ecDatas = dtb_u_u1266; f_Ec_ecDepthOfMeta = dtb_u_u1267; f_Ec_ecGoals = dtb_u_u1268; f_Ec_ecInsts = dtb_u_u1269; f_Ec_ecClasses = dtb_u_u1270; f_Ec_ecConstraints = dtb_u_u1271; f_Ec_ecDefTbl = dtb_u_u1272; f_Ec_ecGlobalsTbl = dtb_u_u1273; f_Ec_ecSolTbl = dtb_u_u1274; f_Ec_ecDepthTbl = dtb_u_u1275; f_Ec_ecGlobalsComplete = dtb_u_u1276; f_Ec_ecClausesTbl = dtb_u_u1277; f_Ec_ecCtorTbl = dtb_u_u1278; f_Ec_ecHasLinear = dtb_u_u1279; f_Ec_ecMetaSpans = dtb_u_u1280; f_Ec_ecUseSpans = dtb_u_u1281; f_Ec_ecWarnings = dtb_u_u1282; f_Ec_ecCounters = dtb_u_u1283; f_Ec_ecErrors = dtb_u_u1284 } -> dtb_u_u1267
  | _ -> failwith "DT: impossible branch"
))

# 248 "Vuna/Compiler/Elab/Types.vuna"
let v_ecGoals = (fun (dtb_u_u1285 : t_Ec) -> (match dtb_u_u1285 with
  | { f_Ec_ecNext = dtb_u_u1286; f_Ec_ecSols = dtb_u_u1287; f_Ec_ecDefsRev = dtb_u_u1288; f_Ec_ecDatas = dtb_u_u1289; f_Ec_ecDepthOfMeta = dtb_u_u1290; f_Ec_ecGoals = dtb_u_u1291; f_Ec_ecInsts = dtb_u_u1292; f_Ec_ecClasses = dtb_u_u1293; f_Ec_ecConstraints = dtb_u_u1294; f_Ec_ecDefTbl = dtb_u_u1295; f_Ec_ecGlobalsTbl = dtb_u_u1296; f_Ec_ecSolTbl = dtb_u_u1297; f_Ec_ecDepthTbl = dtb_u_u1298; f_Ec_ecGlobalsComplete = dtb_u_u1299; f_Ec_ecClausesTbl = dtb_u_u1300; f_Ec_ecCtorTbl = dtb_u_u1301; f_Ec_ecHasLinear = dtb_u_u1302; f_Ec_ecMetaSpans = dtb_u_u1303; f_Ec_ecUseSpans = dtb_u_u1304; f_Ec_ecWarnings = dtb_u_u1305; f_Ec_ecCounters = dtb_u_u1306; f_Ec_ecErrors = dtb_u_u1307 } -> dtb_u_u1291
  | _ -> failwith "DT: impossible branch"
))

# 250 "Vuna/Compiler/Elab/Types.vuna"
let v_ecInsts = (fun (dtb_u_u1308 : t_Ec) -> (match dtb_u_u1308 with
  | { f_Ec_ecNext = dtb_u_u1309; f_Ec_ecSols = dtb_u_u1310; f_Ec_ecDefsRev = dtb_u_u1311; f_Ec_ecDatas = dtb_u_u1312; f_Ec_ecDepthOfMeta = dtb_u_u1313; f_Ec_ecGoals = dtb_u_u1314; f_Ec_ecInsts = dtb_u_u1315; f_Ec_ecClasses = dtb_u_u1316; f_Ec_ecConstraints = dtb_u_u1317; f_Ec_ecDefTbl = dtb_u_u1318; f_Ec_ecGlobalsTbl = dtb_u_u1319; f_Ec_ecSolTbl = dtb_u_u1320; f_Ec_ecDepthTbl = dtb_u_u1321; f_Ec_ecGlobalsComplete = dtb_u_u1322; f_Ec_ecClausesTbl = dtb_u_u1323; f_Ec_ecCtorTbl = dtb_u_u1324; f_Ec_ecHasLinear = dtb_u_u1325; f_Ec_ecMetaSpans = dtb_u_u1326; f_Ec_ecUseSpans = dtb_u_u1327; f_Ec_ecWarnings = dtb_u_u1328; f_Ec_ecCounters = dtb_u_u1329; f_Ec_ecErrors = dtb_u_u1330 } -> dtb_u_u1315
  | _ -> failwith "DT: impossible branch"
))

# 251 "Vuna/Compiler/Elab/Types.vuna"
let v_ecClasses = (fun (dtb_u_u1331 : t_Ec) -> (match dtb_u_u1331 with
  | { f_Ec_ecNext = dtb_u_u1332; f_Ec_ecSols = dtb_u_u1333; f_Ec_ecDefsRev = dtb_u_u1334; f_Ec_ecDatas = dtb_u_u1335; f_Ec_ecDepthOfMeta = dtb_u_u1336; f_Ec_ecGoals = dtb_u_u1337; f_Ec_ecInsts = dtb_u_u1338; f_Ec_ecClasses = dtb_u_u1339; f_Ec_ecConstraints = dtb_u_u1340; f_Ec_ecDefTbl = dtb_u_u1341; f_Ec_ecGlobalsTbl = dtb_u_u1342; f_Ec_ecSolTbl = dtb_u_u1343; f_Ec_ecDepthTbl = dtb_u_u1344; f_Ec_ecGlobalsComplete = dtb_u_u1345; f_Ec_ecClausesTbl = dtb_u_u1346; f_Ec_ecCtorTbl = dtb_u_u1347; f_Ec_ecHasLinear = dtb_u_u1348; f_Ec_ecMetaSpans = dtb_u_u1349; f_Ec_ecUseSpans = dtb_u_u1350; f_Ec_ecWarnings = dtb_u_u1351; f_Ec_ecCounters = dtb_u_u1352; f_Ec_ecErrors = dtb_u_u1353 } -> dtb_u_u1339
  | _ -> failwith "DT: impossible branch"
))

# 253 "Vuna/Compiler/Elab/Types.vuna"
let v_ecConstraints = (fun (dtb_u_u1354 : t_Ec) -> (match dtb_u_u1354 with
  | { f_Ec_ecNext = dtb_u_u1355; f_Ec_ecSols = dtb_u_u1356; f_Ec_ecDefsRev = dtb_u_u1357; f_Ec_ecDatas = dtb_u_u1358; f_Ec_ecDepthOfMeta = dtb_u_u1359; f_Ec_ecGoals = dtb_u_u1360; f_Ec_ecInsts = dtb_u_u1361; f_Ec_ecClasses = dtb_u_u1362; f_Ec_ecConstraints = dtb_u_u1363; f_Ec_ecDefTbl = dtb_u_u1364; f_Ec_ecGlobalsTbl = dtb_u_u1365; f_Ec_ecSolTbl = dtb_u_u1366; f_Ec_ecDepthTbl = dtb_u_u1367; f_Ec_ecGlobalsComplete = dtb_u_u1368; f_Ec_ecClausesTbl = dtb_u_u1369; f_Ec_ecCtorTbl = dtb_u_u1370; f_Ec_ecHasLinear = dtb_u_u1371; f_Ec_ecMetaSpans = dtb_u_u1372; f_Ec_ecUseSpans = dtb_u_u1373; f_Ec_ecWarnings = dtb_u_u1374; f_Ec_ecCounters = dtb_u_u1375; f_Ec_ecErrors = dtb_u_u1376 } -> dtb_u_u1363
  | _ -> failwith "DT: impossible branch"
))

# 554 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPendingList = (fun (dtb_u_u1377 : t_Ec) -> (match (v_ecConstraints dtb_u_u1377) with
  | { f_ConstraintStore_csPending = dtb_u_u1378; f_ConstraintStore_csNextId = dtb_u_u1379; f_ConstraintStore_csTried = dtb_u_u1380; f_ConstraintStore_csSolsCount = dtb_u_u1381; f_ConstraintStore_csPassNext = dtb_u_u1382; f_ConstraintStore_csPassSols = dtb_u_u1383; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1384 } -> (B_dContainer_dQueue.v_toList dtb_u_u1378)
  | _ -> failwith "DT: impossible branch"
))

# 560 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPendingCount = (fun (dtb_u_u1385 : t_Ec) -> (match (v_ecConstraints dtb_u_u1385) with
  | { f_ConstraintStore_csPending = dtb_u_u1386; f_ConstraintStore_csNextId = dtb_u_u1387; f_ConstraintStore_csTried = dtb_u_u1388; f_ConstraintStore_csSolsCount = dtb_u_u1389; f_ConstraintStore_csPassNext = dtb_u_u1390; f_ConstraintStore_csPassSols = dtb_u_u1391; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1392 } -> (B_dContainer_dQueue.v_size dtb_u_u1386)
  | _ -> failwith "DT: impossible branch"
))

# 566 "Vuna/Compiler/Elab/Types.vuna"
let v_ecNextConstraintId = (fun (dtb_u_u1393 : t_Ec) -> (match (v_ecConstraints dtb_u_u1393) with
  | { f_ConstraintStore_csPending = dtb_u_u1394; f_ConstraintStore_csNextId = dtb_u_u1395; f_ConstraintStore_csTried = dtb_u_u1396; f_ConstraintStore_csSolsCount = dtb_u_u1397; f_ConstraintStore_csPassNext = dtb_u_u1398; f_ConstraintStore_csPassSols = dtb_u_u1399; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1400 } -> dtb_u_u1395
  | _ -> failwith "DT: impossible branch"
))

# 572 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPopPending = (fun (dtb_u_u1401 : t_Ec) -> (match (v_ecConstraints dtb_u_u1401) with
  | { f_ConstraintStore_csPending = dtb_u_u1402; f_ConstraintStore_csNextId = dtb_u_u1403; f_ConstraintStore_csTried = dtb_u_u1404; f_ConstraintStore_csSolsCount = dtb_u_u1405; f_ConstraintStore_csPassNext = dtb_u_u1406; f_ConstraintStore_csPassSols = dtb_u_u1407; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1408 } -> (let dtb_u_u1409 = (B_dContainer_dQueue.v_pop dtb_u_u1402) in (match dtb_u_u1409 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1410) -> (match dtb_u_u1410 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1411; B_dData_dPair.f_Pair_second = dtb_u_u1412 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u1411; B_dData_dPair.f_Pair_second = ((v_ecPutConstraints dtb_u_u1401) { f_ConstraintStore_csPending = dtb_u_u1412; f_ConstraintStore_csNextId = dtb_u_u1403; f_ConstraintStore_csTried = dtb_u_u1404; f_ConstraintStore_csSolsCount = dtb_u_u1405; f_ConstraintStore_csPassNext = dtb_u_u1406; f_ConstraintStore_csPassSols = dtb_u_u1407; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1408 }) }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 582 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPushPending = (fun (dtb_u_u1413 : t_Ec) (dtb_u_u1414 : t_Constraint) -> (match (v_ecConstraints dtb_u_u1413) with
  | { f_ConstraintStore_csPending = dtb_u_u1415; f_ConstraintStore_csNextId = dtb_u_u1416; f_ConstraintStore_csTried = dtb_u_u1417; f_ConstraintStore_csSolsCount = dtb_u_u1418; f_ConstraintStore_csPassNext = dtb_u_u1419; f_ConstraintStore_csPassSols = dtb_u_u1420; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1421 } -> ((v_ecPutConstraints dtb_u_u1413) { f_ConstraintStore_csPending = ((B_dContainer_dQueue.v_push dtb_u_u1414) dtb_u_u1415); f_ConstraintStore_csNextId = dtb_u_u1416; f_ConstraintStore_csTried = dtb_u_u1417; f_ConstraintStore_csSolsCount = dtb_u_u1418; f_ConstraintStore_csPassNext = dtb_u_u1419; f_ConstraintStore_csPassSols = dtb_u_u1420; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1421 })
  | _ -> failwith "DT: impossible branch"
))

# 591 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutPending = (fun (dtb_u_u1422 : t_Ec) (dtb_u_u1423 : t_Constraint B_dData_dList.t_List) -> (match (v_ecConstraints dtb_u_u1422) with
  | { f_ConstraintStore_csPending = dtb_u_u1424; f_ConstraintStore_csNextId = dtb_u_u1425; f_ConstraintStore_csTried = dtb_u_u1426; f_ConstraintStore_csSolsCount = dtb_u_u1427; f_ConstraintStore_csPassNext = dtb_u_u1428; f_ConstraintStore_csPassSols = dtb_u_u1429; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1430 } -> ((v_ecPutConstraints dtb_u_u1422) { f_ConstraintStore_csPending = (B_dContainer_dQueue.v_fromList dtb_u_u1423); f_ConstraintStore_csNextId = dtb_u_u1425; f_ConstraintStore_csTried = dtb_u_u1426; f_ConstraintStore_csSolsCount = dtb_u_u1427; f_ConstraintStore_csPassNext = dtb_u_u1428; f_ConstraintStore_csPassSols = dtb_u_u1429; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1430 })
  | _ -> failwith "DT: impossible branch"
))

# 600 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddConstraint = (fun (dtb_u_u1431 : t_Ec) (dtb_u_u1432 : t_ConstraintKind) (dtb_u_u1433 : int) (dtb_u_u1434 : Core_dTerm.t_Value) (dtb_u_u1435 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (dtb_u_u1436 : int) -> (match (v_ecConstraints dtb_u_u1431) with
  | { f_ConstraintStore_csPending = dtb_u_u1437; f_ConstraintStore_csNextId = dtb_u_u1438; f_ConstraintStore_csTried = dtb_u_u1439; f_ConstraintStore_csSolsCount = dtb_u_u1440; f_ConstraintStore_csPassNext = dtb_u_u1441; f_ConstraintStore_csPassSols = dtb_u_u1442; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1443 } -> ((v_ecPutConstraints dtb_u_u1431) { f_ConstraintStore_csPending = ((B_dContainer_dQueue.v_push { f_Constraint_conId = dtb_u_u1438; f_Constraint_conKind = dtb_u_u1432; f_Constraint_conMeta = dtb_u_u1433; f_Constraint_conDom = dtb_u_u1434; f_Constraint_conSpan = dtb_u_u1435; f_Constraint_conDepth = dtb_u_u1436 }) dtb_u_u1437); f_ConstraintStore_csNextId = (dtb_u_u1438 + 1); f_ConstraintStore_csTried = dtb_u_u1439; f_ConstraintStore_csSolsCount = dtb_u_u1440; f_ConstraintStore_csPassNext = dtb_u_u1441; f_ConstraintStore_csPassSols = dtb_u_u1442; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1443 })
  | _ -> failwith "DT: impossible branch"
))

# 610 "Vuna/Compiler/Elab/Types.vuna"
let v_ecTriedAt = (fun (dtb_u_u1444 : t_Ec) (dtb_u_u1445 : int) -> (match (v_ecConstraints dtb_u_u1444) with
  | { f_ConstraintStore_csPending = dtb_u_u1446; f_ConstraintStore_csNextId = dtb_u_u1447; f_ConstraintStore_csTried = dtb_u_u1448; f_ConstraintStore_csSolsCount = dtb_u_u1449; f_ConstraintStore_csPassNext = dtb_u_u1450; f_ConstraintStore_csPassSols = dtb_u_u1451; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1452 } -> ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u1445) dtb_u_u1448)
  | _ -> failwith "DT: impossible branch"
))

# 616 "Vuna/Compiler/Elab/Types.vuna"
let v_ecRecordTried = (fun (dtb_u_u1453 : t_Ec) (dtb_u_u1454 : int) (dtb_u_u1455 : int) -> (match (v_ecConstraints dtb_u_u1453) with
  | { f_ConstraintStore_csPending = dtb_u_u1456; f_ConstraintStore_csNextId = dtb_u_u1457; f_ConstraintStore_csTried = dtb_u_u1458; f_ConstraintStore_csSolsCount = dtb_u_u1459; f_ConstraintStore_csPassNext = dtb_u_u1460; f_ConstraintStore_csPassSols = dtb_u_u1461; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1462 } -> ((v_ecPutConstraints dtb_u_u1453) { f_ConstraintStore_csPending = dtb_u_u1456; f_ConstraintStore_csNextId = dtb_u_u1457; f_ConstraintStore_csTried = (((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u1454) dtb_u_u1455) dtb_u_u1458); f_ConstraintStore_csSolsCount = dtb_u_u1459; f_ConstraintStore_csPassNext = dtb_u_u1460; f_ConstraintStore_csPassSols = dtb_u_u1461; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1462 })
  | _ -> failwith "DT: impossible branch"
))

# 667 "Vuna/Compiler/Elab/Types.vuna"
let v_ecSolsCountOf = (fun (dtb_u_u1463 : t_Ec) -> (match (v_ecConstraints dtb_u_u1463) with
  | { f_ConstraintStore_csPending = dtb_u_u1464; f_ConstraintStore_csNextId = dtb_u_u1465; f_ConstraintStore_csTried = dtb_u_u1466; f_ConstraintStore_csSolsCount = dtb_u_u1467; f_ConstraintStore_csPassNext = dtb_u_u1468; f_ConstraintStore_csPassSols = dtb_u_u1469; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1470 } -> dtb_u_u1467
  | _ -> failwith "DT: impossible branch"
))

# 672 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutSolsCount = (fun (dtb_u_u1471 : t_Ec) (dtb_u_u1472 : int) -> (match (v_ecConstraints dtb_u_u1471) with
  | { f_ConstraintStore_csPending = dtb_u_u1473; f_ConstraintStore_csNextId = dtb_u_u1474; f_ConstraintStore_csTried = dtb_u_u1475; f_ConstraintStore_csSolsCount = dtb_u_u1476; f_ConstraintStore_csPassNext = dtb_u_u1477; f_ConstraintStore_csPassSols = dtb_u_u1478; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1479 } -> ((v_ecPutConstraints dtb_u_u1471) { f_ConstraintStore_csPending = dtb_u_u1473; f_ConstraintStore_csNextId = dtb_u_u1474; f_ConstraintStore_csTried = dtb_u_u1475; f_ConstraintStore_csSolsCount = dtb_u_u1472; f_ConstraintStore_csPassNext = dtb_u_u1477; f_ConstraintStore_csPassSols = dtb_u_u1478; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1479 })
  | _ -> failwith "DT: impossible branch"
))

# 705 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutPassMarker = (fun (dtb_u_u1480 : t_Ec) -> (match (v_ecConstraints dtb_u_u1480) with
  | { f_ConstraintStore_csPending = dtb_u_u1481; f_ConstraintStore_csNextId = dtb_u_u1482; f_ConstraintStore_csTried = dtb_u_u1483; f_ConstraintStore_csSolsCount = dtb_u_u1484; f_ConstraintStore_csPassNext = dtb_u_u1485; f_ConstraintStore_csPassSols = dtb_u_u1486; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1487 } -> ((v_ecPutConstraints dtb_u_u1480) { f_ConstraintStore_csPending = dtb_u_u1481; f_ConstraintStore_csNextId = dtb_u_u1482; f_ConstraintStore_csTried = dtb_u_u1483; f_ConstraintStore_csSolsCount = dtb_u_u1484; f_ConstraintStore_csPassNext = dtb_u_u1482; f_ConstraintStore_csPassSols = dtb_u_u1484; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1487 })
  | _ -> failwith "DT: impossible branch"
))

# 712 "Vuna/Compiler/Elab/Types.vuna"
let v_ecCtorIndexComplete = (fun (dtb_u_u1488 : t_Ec) -> (match (v_ecConstraints dtb_u_u1488) with
  | { f_ConstraintStore_csPending = dtb_u_u1489; f_ConstraintStore_csNextId = dtb_u_u1490; f_ConstraintStore_csTried = dtb_u_u1491; f_ConstraintStore_csSolsCount = dtb_u_u1492; f_ConstraintStore_csPassNext = dtb_u_u1493; f_ConstraintStore_csPassSols = dtb_u_u1494; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1495 } -> dtb_u_u1495
  | _ -> failwith "DT: impossible branch"
))

# 717 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutCtorIndexComplete = (fun (dtb_u_u1496 : t_Ec) (dtb_u_u1497 : bool) -> (match (v_ecConstraints dtb_u_u1496) with
  | { f_ConstraintStore_csPending = dtb_u_u1498; f_ConstraintStore_csNextId = dtb_u_u1499; f_ConstraintStore_csTried = dtb_u_u1500; f_ConstraintStore_csSolsCount = dtb_u_u1501; f_ConstraintStore_csPassNext = dtb_u_u1502; f_ConstraintStore_csPassSols = dtb_u_u1503; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1504 } -> ((v_ecPutConstraints dtb_u_u1496) { f_ConstraintStore_csPending = dtb_u_u1498; f_ConstraintStore_csNextId = dtb_u_u1499; f_ConstraintStore_csTried = dtb_u_u1500; f_ConstraintStore_csSolsCount = dtb_u_u1501; f_ConstraintStore_csPassNext = dtb_u_u1502; f_ConstraintStore_csPassSols = dtb_u_u1503; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1497 })
  | _ -> failwith "DT: impossible branch"
))

# 724 "Vuna/Compiler/Elab/Types.vuna"
let v_ecDictPassIdle = (fun (dtb_u_u1505 : t_Ec) -> (match (v_ecConstraints dtb_u_u1505) with
  | { f_ConstraintStore_csPending = dtb_u_u1506; f_ConstraintStore_csNextId = dtb_u_u1507; f_ConstraintStore_csTried = dtb_u_u1508; f_ConstraintStore_csSolsCount = dtb_u_u1509; f_ConstraintStore_csPassNext = dtb_u_u1510; f_ConstraintStore_csPassSols = dtb_u_u1511; f_ConstraintStore_csCtorIndexComplete = dtb_u_u1512 } -> (if (dtb_u_u1510 = dtb_u_u1507) then (dtb_u_u1511 = dtb_u_u1509) else false)
  | _ -> failwith "DT: impossible branch"
))

# 839 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutCtorTbl = (fun (dtb_u_u1513 : t_Ec) (dtb_u_u1514 : (string, t_DtCtor) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u1513 with
  | { f_Ec_ecNext = dtb_u_u1515; f_Ec_ecSols = dtb_u_u1516; f_Ec_ecDefsRev = dtb_u_u1517; f_Ec_ecDatas = dtb_u_u1518; f_Ec_ecDepthOfMeta = dtb_u_u1519; f_Ec_ecGoals = dtb_u_u1520; f_Ec_ecInsts = dtb_u_u1521; f_Ec_ecClasses = dtb_u_u1522; f_Ec_ecConstraints = dtb_u_u1523; f_Ec_ecDefTbl = dtb_u_u1524; f_Ec_ecGlobalsTbl = dtb_u_u1525; f_Ec_ecSolTbl = dtb_u_u1526; f_Ec_ecDepthTbl = dtb_u_u1527; f_Ec_ecGlobalsComplete = dtb_u_u1528; f_Ec_ecClausesTbl = dtb_u_u1529; f_Ec_ecCtorTbl = dtb_u_u1530; f_Ec_ecHasLinear = dtb_u_u1531; f_Ec_ecMetaSpans = dtb_u_u1532; f_Ec_ecUseSpans = dtb_u_u1533; f_Ec_ecWarnings = dtb_u_u1534; f_Ec_ecCounters = dtb_u_u1535; f_Ec_ecErrors = dtb_u_u1536 } -> ((v_ecPutCtorIndexComplete { f_Ec_ecNext = dtb_u_u1515; f_Ec_ecSols = dtb_u_u1516; f_Ec_ecDefsRev = dtb_u_u1517; f_Ec_ecDatas = dtb_u_u1518; f_Ec_ecDepthOfMeta = dtb_u_u1519; f_Ec_ecGoals = dtb_u_u1520; f_Ec_ecInsts = dtb_u_u1521; f_Ec_ecClasses = dtb_u_u1522; f_Ec_ecConstraints = dtb_u_u1523; f_Ec_ecDefTbl = dtb_u_u1524; f_Ec_ecGlobalsTbl = dtb_u_u1525; f_Ec_ecSolTbl = dtb_u_u1526; f_Ec_ecDepthTbl = dtb_u_u1527; f_Ec_ecGlobalsComplete = dtb_u_u1528; f_Ec_ecClausesTbl = dtb_u_u1529; f_Ec_ecCtorTbl = dtb_u_u1514; f_Ec_ecHasLinear = dtb_u_u1531; f_Ec_ecMetaSpans = dtb_u_u1532; f_Ec_ecUseSpans = dtb_u_u1533; f_Ec_ecWarnings = dtb_u_u1534; f_Ec_ecCounters = dtb_u_u1535; f_Ec_ecErrors = dtb_u_u1536 }) true)
  | _ -> failwith "DT: impossible branch"
))

# 254 "Vuna/Compiler/Elab/Types.vuna"
let v_ecDefTbl = (fun (dtb_u_u1537 : t_Ec) -> (match dtb_u_u1537 with
  | { f_Ec_ecNext = dtb_u_u1538; f_Ec_ecSols = dtb_u_u1539; f_Ec_ecDefsRev = dtb_u_u1540; f_Ec_ecDatas = dtb_u_u1541; f_Ec_ecDepthOfMeta = dtb_u_u1542; f_Ec_ecGoals = dtb_u_u1543; f_Ec_ecInsts = dtb_u_u1544; f_Ec_ecClasses = dtb_u_u1545; f_Ec_ecConstraints = dtb_u_u1546; f_Ec_ecDefTbl = dtb_u_u1547; f_Ec_ecGlobalsTbl = dtb_u_u1548; f_Ec_ecSolTbl = dtb_u_u1549; f_Ec_ecDepthTbl = dtb_u_u1550; f_Ec_ecGlobalsComplete = dtb_u_u1551; f_Ec_ecClausesTbl = dtb_u_u1552; f_Ec_ecCtorTbl = dtb_u_u1553; f_Ec_ecHasLinear = dtb_u_u1554; f_Ec_ecMetaSpans = dtb_u_u1555; f_Ec_ecUseSpans = dtb_u_u1556; f_Ec_ecWarnings = dtb_u_u1557; f_Ec_ecCounters = dtb_u_u1558; f_Ec_ecErrors = dtb_u_u1559 } -> dtb_u_u1547
  | _ -> failwith "DT: impossible branch"
))

# 255 "Vuna/Compiler/Elab/Types.vuna"
let v_ecGlobalsTbl = (fun (dtb_u_u1560 : t_Ec) -> (match dtb_u_u1560 with
  | { f_Ec_ecNext = dtb_u_u1561; f_Ec_ecSols = dtb_u_u1562; f_Ec_ecDefsRev = dtb_u_u1563; f_Ec_ecDatas = dtb_u_u1564; f_Ec_ecDepthOfMeta = dtb_u_u1565; f_Ec_ecGoals = dtb_u_u1566; f_Ec_ecInsts = dtb_u_u1567; f_Ec_ecClasses = dtb_u_u1568; f_Ec_ecConstraints = dtb_u_u1569; f_Ec_ecDefTbl = dtb_u_u1570; f_Ec_ecGlobalsTbl = dtb_u_u1571; f_Ec_ecSolTbl = dtb_u_u1572; f_Ec_ecDepthTbl = dtb_u_u1573; f_Ec_ecGlobalsComplete = dtb_u_u1574; f_Ec_ecClausesTbl = dtb_u_u1575; f_Ec_ecCtorTbl = dtb_u_u1576; f_Ec_ecHasLinear = dtb_u_u1577; f_Ec_ecMetaSpans = dtb_u_u1578; f_Ec_ecUseSpans = dtb_u_u1579; f_Ec_ecWarnings = dtb_u_u1580; f_Ec_ecCounters = dtb_u_u1581; f_Ec_ecErrors = dtb_u_u1582 } -> dtb_u_u1571
  | _ -> failwith "DT: impossible branch"
))

# 256 "Vuna/Compiler/Elab/Types.vuna"
let v_ecSolTbl = (fun (dtb_u_u1583 : t_Ec) -> (match dtb_u_u1583 with
  | { f_Ec_ecNext = dtb_u_u1584; f_Ec_ecSols = dtb_u_u1585; f_Ec_ecDefsRev = dtb_u_u1586; f_Ec_ecDatas = dtb_u_u1587; f_Ec_ecDepthOfMeta = dtb_u_u1588; f_Ec_ecGoals = dtb_u_u1589; f_Ec_ecInsts = dtb_u_u1590; f_Ec_ecClasses = dtb_u_u1591; f_Ec_ecConstraints = dtb_u_u1592; f_Ec_ecDefTbl = dtb_u_u1593; f_Ec_ecGlobalsTbl = dtb_u_u1594; f_Ec_ecSolTbl = dtb_u_u1595; f_Ec_ecDepthTbl = dtb_u_u1596; f_Ec_ecGlobalsComplete = dtb_u_u1597; f_Ec_ecClausesTbl = dtb_u_u1598; f_Ec_ecCtorTbl = dtb_u_u1599; f_Ec_ecHasLinear = dtb_u_u1600; f_Ec_ecMetaSpans = dtb_u_u1601; f_Ec_ecUseSpans = dtb_u_u1602; f_Ec_ecWarnings = dtb_u_u1603; f_Ec_ecCounters = dtb_u_u1604; f_Ec_ecErrors = dtb_u_u1605 } -> dtb_u_u1595
  | _ -> failwith "DT: impossible branch"
))

# 658 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutSols = (fun (dtb_u_u1606 : t_Ec) (dtb_u_u1607 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtb_u_u1608 = ((v_solsDelta (v_ecSols dtb_u_u1606)) dtb_u_u1607) in (let dtb_u_u1609 = ((((B_dContainer_dHashMap.v_insertAll B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u1608) (v_ecSolTbl dtb_u_u1606)) in (let dtb_u_u1610 = (((v_ecPutSolsRaw dtb_u_u1606) dtb_u_u1607) dtb_u_u1609) in ((v_ecPutSolsCount dtb_u_u1610) ((v_ecSolsCountOf dtb_u_u1610) + (B_dData_dList.v_length dtb_u_u1608)))))))

# 257 "Vuna/Compiler/Elab/Types.vuna"
let v_ecDepthTbl = (fun (dtb_u_u1611 : t_Ec) -> (match dtb_u_u1611 with
  | { f_Ec_ecNext = dtb_u_u1612; f_Ec_ecSols = dtb_u_u1613; f_Ec_ecDefsRev = dtb_u_u1614; f_Ec_ecDatas = dtb_u_u1615; f_Ec_ecDepthOfMeta = dtb_u_u1616; f_Ec_ecGoals = dtb_u_u1617; f_Ec_ecInsts = dtb_u_u1618; f_Ec_ecClasses = dtb_u_u1619; f_Ec_ecConstraints = dtb_u_u1620; f_Ec_ecDefTbl = dtb_u_u1621; f_Ec_ecGlobalsTbl = dtb_u_u1622; f_Ec_ecSolTbl = dtb_u_u1623; f_Ec_ecDepthTbl = dtb_u_u1624; f_Ec_ecGlobalsComplete = dtb_u_u1625; f_Ec_ecClausesTbl = dtb_u_u1626; f_Ec_ecCtorTbl = dtb_u_u1627; f_Ec_ecHasLinear = dtb_u_u1628; f_Ec_ecMetaSpans = dtb_u_u1629; f_Ec_ecUseSpans = dtb_u_u1630; f_Ec_ecWarnings = dtb_u_u1631; f_Ec_ecCounters = dtb_u_u1632; f_Ec_ecErrors = dtb_u_u1633 } -> dtb_u_u1624
  | _ -> failwith "DT: impossible branch"
))

# 655 "Vuna/Compiler/Elab/Types.vuna"
let v_ecSolsP = (fun (dtb_u_u1634 : t_Ec) -> (((Core_dTerm.v_solsOf (v_ecSolTbl dtb_u_u1634)) (v_ecSols dtb_u_u1634)) (v_ecDepthTbl dtb_u_u1634)))

# 1159 "Vuna/Compiler/Elab/Types.vuna"
let v_forceVal = (fun (dtb_u_u1635 : t_Ec) (dtb_u_u1636 : Core_dTerm.t_Value) -> ((((Core_dEval.v_force (v_ecDefTbl dtb_u_u1635)) (v_ecSolsP dtb_u_u1635)) Core_dTerm.v_defaultFuel) dtb_u_u1636))

# 258 "Vuna/Compiler/Elab/Types.vuna"
let v_ecGlobalsComplete = (fun (dtb_u_u1637 : t_Ec) -> (match dtb_u_u1637 with
  | { f_Ec_ecNext = dtb_u_u1638; f_Ec_ecSols = dtb_u_u1639; f_Ec_ecDefsRev = dtb_u_u1640; f_Ec_ecDatas = dtb_u_u1641; f_Ec_ecDepthOfMeta = dtb_u_u1642; f_Ec_ecGoals = dtb_u_u1643; f_Ec_ecInsts = dtb_u_u1644; f_Ec_ecClasses = dtb_u_u1645; f_Ec_ecConstraints = dtb_u_u1646; f_Ec_ecDefTbl = dtb_u_u1647; f_Ec_ecGlobalsTbl = dtb_u_u1648; f_Ec_ecSolTbl = dtb_u_u1649; f_Ec_ecDepthTbl = dtb_u_u1650; f_Ec_ecGlobalsComplete = dtb_u_u1651; f_Ec_ecClausesTbl = dtb_u_u1652; f_Ec_ecCtorTbl = dtb_u_u1653; f_Ec_ecHasLinear = dtb_u_u1654; f_Ec_ecMetaSpans = dtb_u_u1655; f_Ec_ecUseSpans = dtb_u_u1656; f_Ec_ecWarnings = dtb_u_u1657; f_Ec_ecCounters = dtb_u_u1658; f_Ec_ecErrors = dtb_u_u1659 } -> dtb_u_u1651
  | _ -> failwith "DT: impossible branch"
))

# 259 "Vuna/Compiler/Elab/Types.vuna"
let v_ecClausesTbl = (fun (dtb_u_u1660 : t_Ec) -> (match dtb_u_u1660 with
  | { f_Ec_ecNext = dtb_u_u1661; f_Ec_ecSols = dtb_u_u1662; f_Ec_ecDefsRev = dtb_u_u1663; f_Ec_ecDatas = dtb_u_u1664; f_Ec_ecDepthOfMeta = dtb_u_u1665; f_Ec_ecGoals = dtb_u_u1666; f_Ec_ecInsts = dtb_u_u1667; f_Ec_ecClasses = dtb_u_u1668; f_Ec_ecConstraints = dtb_u_u1669; f_Ec_ecDefTbl = dtb_u_u1670; f_Ec_ecGlobalsTbl = dtb_u_u1671; f_Ec_ecSolTbl = dtb_u_u1672; f_Ec_ecDepthTbl = dtb_u_u1673; f_Ec_ecGlobalsComplete = dtb_u_u1674; f_Ec_ecClausesTbl = dtb_u_u1675; f_Ec_ecCtorTbl = dtb_u_u1676; f_Ec_ecHasLinear = dtb_u_u1677; f_Ec_ecMetaSpans = dtb_u_u1678; f_Ec_ecUseSpans = dtb_u_u1679; f_Ec_ecWarnings = dtb_u_u1680; f_Ec_ecCounters = dtb_u_u1681; f_Ec_ecErrors = dtb_u_u1682 } -> dtb_u_u1675
  | _ -> failwith "DT: impossible branch"
))

# 260 "Vuna/Compiler/Elab/Types.vuna"
let v_ecCtorTbl = (fun (dtb_u_u1683 : t_Ec) -> (match dtb_u_u1683 with
  | { f_Ec_ecNext = dtb_u_u1684; f_Ec_ecSols = dtb_u_u1685; f_Ec_ecDefsRev = dtb_u_u1686; f_Ec_ecDatas = dtb_u_u1687; f_Ec_ecDepthOfMeta = dtb_u_u1688; f_Ec_ecGoals = dtb_u_u1689; f_Ec_ecInsts = dtb_u_u1690; f_Ec_ecClasses = dtb_u_u1691; f_Ec_ecConstraints = dtb_u_u1692; f_Ec_ecDefTbl = dtb_u_u1693; f_Ec_ecGlobalsTbl = dtb_u_u1694; f_Ec_ecSolTbl = dtb_u_u1695; f_Ec_ecDepthTbl = dtb_u_u1696; f_Ec_ecGlobalsComplete = dtb_u_u1697; f_Ec_ecClausesTbl = dtb_u_u1698; f_Ec_ecCtorTbl = dtb_u_u1699; f_Ec_ecHasLinear = dtb_u_u1700; f_Ec_ecMetaSpans = dtb_u_u1701; f_Ec_ecUseSpans = dtb_u_u1702; f_Ec_ecWarnings = dtb_u_u1703; f_Ec_ecCounters = dtb_u_u1704; f_Ec_ecErrors = dtb_u_u1705 } -> dtb_u_u1699
  | _ -> failwith "DT: impossible branch"
))

# 262 "Vuna/Compiler/Elab/Types.vuna"
let v_ecHasLinear = (fun (dtb_u_u1706 : t_Ec) -> (match dtb_u_u1706 with
  | { f_Ec_ecNext = dtb_u_u1707; f_Ec_ecSols = dtb_u_u1708; f_Ec_ecDefsRev = dtb_u_u1709; f_Ec_ecDatas = dtb_u_u1710; f_Ec_ecDepthOfMeta = dtb_u_u1711; f_Ec_ecGoals = dtb_u_u1712; f_Ec_ecInsts = dtb_u_u1713; f_Ec_ecClasses = dtb_u_u1714; f_Ec_ecConstraints = dtb_u_u1715; f_Ec_ecDefTbl = dtb_u_u1716; f_Ec_ecGlobalsTbl = dtb_u_u1717; f_Ec_ecSolTbl = dtb_u_u1718; f_Ec_ecDepthTbl = dtb_u_u1719; f_Ec_ecGlobalsComplete = dtb_u_u1720; f_Ec_ecClausesTbl = dtb_u_u1721; f_Ec_ecCtorTbl = dtb_u_u1722; f_Ec_ecHasLinear = dtb_u_u1723; f_Ec_ecMetaSpans = dtb_u_u1724; f_Ec_ecUseSpans = dtb_u_u1725; f_Ec_ecWarnings = dtb_u_u1726; f_Ec_ecCounters = dtb_u_u1727; f_Ec_ecErrors = dtb_u_u1728 } -> dtb_u_u1723
  | _ -> failwith "DT: impossible branch"
))

# 264 "Vuna/Compiler/Elab/Types.vuna"
let v_ecMetaSpans = (fun (dtb_u_u1729 : t_Ec) -> (match dtb_u_u1729 with
  | { f_Ec_ecNext = dtb_u_u1730; f_Ec_ecSols = dtb_u_u1731; f_Ec_ecDefsRev = dtb_u_u1732; f_Ec_ecDatas = dtb_u_u1733; f_Ec_ecDepthOfMeta = dtb_u_u1734; f_Ec_ecGoals = dtb_u_u1735; f_Ec_ecInsts = dtb_u_u1736; f_Ec_ecClasses = dtb_u_u1737; f_Ec_ecConstraints = dtb_u_u1738; f_Ec_ecDefTbl = dtb_u_u1739; f_Ec_ecGlobalsTbl = dtb_u_u1740; f_Ec_ecSolTbl = dtb_u_u1741; f_Ec_ecDepthTbl = dtb_u_u1742; f_Ec_ecGlobalsComplete = dtb_u_u1743; f_Ec_ecClausesTbl = dtb_u_u1744; f_Ec_ecCtorTbl = dtb_u_u1745; f_Ec_ecHasLinear = dtb_u_u1746; f_Ec_ecMetaSpans = dtb_u_u1747; f_Ec_ecUseSpans = dtb_u_u1748; f_Ec_ecWarnings = dtb_u_u1749; f_Ec_ecCounters = dtb_u_u1750; f_Ec_ecErrors = dtb_u_u1751 } -> dtb_u_u1747
  | _ -> failwith "DT: impossible branch"
))

# 265 "Vuna/Compiler/Elab/Types.vuna"
let v_ecUseSpans = (fun (dtb_u_u1752 : t_Ec) -> (match dtb_u_u1752 with
  | { f_Ec_ecNext = dtb_u_u1753; f_Ec_ecSols = dtb_u_u1754; f_Ec_ecDefsRev = dtb_u_u1755; f_Ec_ecDatas = dtb_u_u1756; f_Ec_ecDepthOfMeta = dtb_u_u1757; f_Ec_ecGoals = dtb_u_u1758; f_Ec_ecInsts = dtb_u_u1759; f_Ec_ecClasses = dtb_u_u1760; f_Ec_ecConstraints = dtb_u_u1761; f_Ec_ecDefTbl = dtb_u_u1762; f_Ec_ecGlobalsTbl = dtb_u_u1763; f_Ec_ecSolTbl = dtb_u_u1764; f_Ec_ecDepthTbl = dtb_u_u1765; f_Ec_ecGlobalsComplete = dtb_u_u1766; f_Ec_ecClausesTbl = dtb_u_u1767; f_Ec_ecCtorTbl = dtb_u_u1768; f_Ec_ecHasLinear = dtb_u_u1769; f_Ec_ecMetaSpans = dtb_u_u1770; f_Ec_ecUseSpans = dtb_u_u1771; f_Ec_ecWarnings = dtb_u_u1772; f_Ec_ecCounters = dtb_u_u1773; f_Ec_ecErrors = dtb_u_u1774 } -> dtb_u_u1771
  | _ -> failwith "DT: impossible branch"
))

# 267 "Vuna/Compiler/Elab/Types.vuna"
let v_ecWarnings = (fun (dtb_u_u1775 : t_Ec) -> (match dtb_u_u1775 with
  | { f_Ec_ecNext = dtb_u_u1776; f_Ec_ecSols = dtb_u_u1777; f_Ec_ecDefsRev = dtb_u_u1778; f_Ec_ecDatas = dtb_u_u1779; f_Ec_ecDepthOfMeta = dtb_u_u1780; f_Ec_ecGoals = dtb_u_u1781; f_Ec_ecInsts = dtb_u_u1782; f_Ec_ecClasses = dtb_u_u1783; f_Ec_ecConstraints = dtb_u_u1784; f_Ec_ecDefTbl = dtb_u_u1785; f_Ec_ecGlobalsTbl = dtb_u_u1786; f_Ec_ecSolTbl = dtb_u_u1787; f_Ec_ecDepthTbl = dtb_u_u1788; f_Ec_ecGlobalsComplete = dtb_u_u1789; f_Ec_ecClausesTbl = dtb_u_u1790; f_Ec_ecCtorTbl = dtb_u_u1791; f_Ec_ecHasLinear = dtb_u_u1792; f_Ec_ecMetaSpans = dtb_u_u1793; f_Ec_ecUseSpans = dtb_u_u1794; f_Ec_ecWarnings = dtb_u_u1795; f_Ec_ecCounters = dtb_u_u1796; f_Ec_ecErrors = dtb_u_u1797 } -> dtb_u_u1795
  | _ -> failwith "DT: impossible branch"
))

# 934 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddWarning = (fun (dtb_u_u1798 : t_Ec) (dtb_u_u1799 : Base_dDiag.t_Diagnostic) -> ((v_ecPutWarnings dtb_u_u1798) ((B_dData_dList.v_append (v_ecWarnings dtb_u_u1798)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1799, B_dData_dList.C_List_Nil)))))

# 270 "Vuna/Compiler/Elab/Types.vuna"
let v_ecCounters = (fun (dtb_u_u1800 : t_Ec) -> (match dtb_u_u1800 with
  | { f_Ec_ecNext = dtb_u_u1801; f_Ec_ecSols = dtb_u_u1802; f_Ec_ecDefsRev = dtb_u_u1803; f_Ec_ecDatas = dtb_u_u1804; f_Ec_ecDepthOfMeta = dtb_u_u1805; f_Ec_ecGoals = dtb_u_u1806; f_Ec_ecInsts = dtb_u_u1807; f_Ec_ecClasses = dtb_u_u1808; f_Ec_ecConstraints = dtb_u_u1809; f_Ec_ecDefTbl = dtb_u_u1810; f_Ec_ecGlobalsTbl = dtb_u_u1811; f_Ec_ecSolTbl = dtb_u_u1812; f_Ec_ecDepthTbl = dtb_u_u1813; f_Ec_ecGlobalsComplete = dtb_u_u1814; f_Ec_ecClausesTbl = dtb_u_u1815; f_Ec_ecCtorTbl = dtb_u_u1816; f_Ec_ecHasLinear = dtb_u_u1817; f_Ec_ecMetaSpans = dtb_u_u1818; f_Ec_ecUseSpans = dtb_u_u1819; f_Ec_ecWarnings = dtb_u_u1820; f_Ec_ecCounters = dtb_u_u1821; f_Ec_ecErrors = dtb_u_u1822 } -> dtb_u_u1821
  | _ -> failwith "DT: impossible branch"
))

# 272 "Vuna/Compiler/Elab/Types.vuna"
let v_ecErrors = (fun (dtb_u_u1823 : t_Ec) -> (match dtb_u_u1823 with
  | { f_Ec_ecNext = dtb_u_u1824; f_Ec_ecSols = dtb_u_u1825; f_Ec_ecDefsRev = dtb_u_u1826; f_Ec_ecDatas = dtb_u_u1827; f_Ec_ecDepthOfMeta = dtb_u_u1828; f_Ec_ecGoals = dtb_u_u1829; f_Ec_ecInsts = dtb_u_u1830; f_Ec_ecClasses = dtb_u_u1831; f_Ec_ecConstraints = dtb_u_u1832; f_Ec_ecDefTbl = dtb_u_u1833; f_Ec_ecGlobalsTbl = dtb_u_u1834; f_Ec_ecSolTbl = dtb_u_u1835; f_Ec_ecDepthTbl = dtb_u_u1836; f_Ec_ecGlobalsComplete = dtb_u_u1837; f_Ec_ecClausesTbl = dtb_u_u1838; f_Ec_ecCtorTbl = dtb_u_u1839; f_Ec_ecHasLinear = dtb_u_u1840; f_Ec_ecMetaSpans = dtb_u_u1841; f_Ec_ecUseSpans = dtb_u_u1842; f_Ec_ecWarnings = dtb_u_u1843; f_Ec_ecCounters = dtb_u_u1844; f_Ec_ecErrors = dtb_u_u1845 } -> dtb_u_u1845
  | _ -> failwith "DT: impossible branch"
))

# 1005 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxItems = (fun (dtb_u_u1846 : t_Ctx) -> (match dtb_u_u1846 with
  | { f_Ctx_ctxItems = dtb_u_u1847; f_Ctx_ctxEnvF = dtb_u_u1848; f_Ctx_ctxRefVals = dtb_u_u1849; f_Ctx_ctxDepthF = dtb_u_u1850; f_Ctx_ctxEnvRF = dtb_u_u1851 } -> dtb_u_u1847
  | _ -> failwith "DT: impossible branch"
))

# 1006 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxEnvF = (fun (dtb_u_u1852 : t_Ctx) -> (match dtb_u_u1852 with
  | { f_Ctx_ctxItems = dtb_u_u1853; f_Ctx_ctxEnvF = dtb_u_u1854; f_Ctx_ctxRefVals = dtb_u_u1855; f_Ctx_ctxDepthF = dtb_u_u1856; f_Ctx_ctxEnvRF = dtb_u_u1857 } -> dtb_u_u1854
  | _ -> failwith "DT: impossible branch"
))

# 1007 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxRefVals = (fun (dtb_u_u1858 : t_Ctx) -> (match dtb_u_u1858 with
  | { f_Ctx_ctxItems = dtb_u_u1859; f_Ctx_ctxEnvF = dtb_u_u1860; f_Ctx_ctxRefVals = dtb_u_u1861; f_Ctx_ctxDepthF = dtb_u_u1862; f_Ctx_ctxEnvRF = dtb_u_u1863 } -> dtb_u_u1861
  | _ -> failwith "DT: impossible branch"
))

# 1010 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxDepthF = (fun (dtb_u_u1864 : t_Ctx) -> (match dtb_u_u1864 with
  | { f_Ctx_ctxItems = dtb_u_u1865; f_Ctx_ctxEnvF = dtb_u_u1866; f_Ctx_ctxRefVals = dtb_u_u1867; f_Ctx_ctxDepthF = dtb_u_u1868; f_Ctx_ctxEnvRF = dtb_u_u1869 } -> dtb_u_u1868
  | _ -> failwith "DT: impossible branch"
))

# 1012 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxEnvRF = (fun (dtb_u_u1870 : t_Ctx) -> (match dtb_u_u1870 with
  | { f_Ctx_ctxItems = dtb_u_u1871; f_Ctx_ctxEnvF = dtb_u_u1872; f_Ctx_ctxRefVals = dtb_u_u1873; f_Ctx_ctxDepthF = dtb_u_u1874; f_Ctx_ctxEnvRF = dtb_u_u1875 } -> dtb_u_u1875
  | _ -> failwith "DT: impossible branch"
))

# 1166 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgDatas = (fun (dtb_u_u1876 : t_DtProgram) -> (match dtb_u_u1876 with
  | { f_DtProgram_dtProgDatas = dtb_u_u1877; f_DtProgram_dtProgDefs = dtb_u_u1878; f_DtProgram_dtProgGoals = dtb_u_u1879; f_DtProgram_dtProgSols = dtb_u_u1880; f_DtProgram_dtProgGlobals = dtb_u_u1881; f_DtProgram_dtProgInsts = dtb_u_u1882; f_DtProgram_dtProgClasses = dtb_u_u1883; f_DtProgram_dtProgNext = dtb_u_u1884; f_DtProgram_dtProgDepths = dtb_u_u1885; f_DtProgram_dtProgWarnings = dtb_u_u1886 } -> dtb_u_u1877
  | _ -> failwith "DT: impossible branch"
))

# 1167 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgDefs = (fun (dtb_u_u1887 : t_DtProgram) -> (match dtb_u_u1887 with
  | { f_DtProgram_dtProgDatas = dtb_u_u1888; f_DtProgram_dtProgDefs = dtb_u_u1889; f_DtProgram_dtProgGoals = dtb_u_u1890; f_DtProgram_dtProgSols = dtb_u_u1891; f_DtProgram_dtProgGlobals = dtb_u_u1892; f_DtProgram_dtProgInsts = dtb_u_u1893; f_DtProgram_dtProgClasses = dtb_u_u1894; f_DtProgram_dtProgNext = dtb_u_u1895; f_DtProgram_dtProgDepths = dtb_u_u1896; f_DtProgram_dtProgWarnings = dtb_u_u1897 } -> dtb_u_u1889
  | _ -> failwith "DT: impossible branch"
))

# 1168 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgGoals = (fun (dtb_u_u1898 : t_DtProgram) -> (match dtb_u_u1898 with
  | { f_DtProgram_dtProgDatas = dtb_u_u1899; f_DtProgram_dtProgDefs = dtb_u_u1900; f_DtProgram_dtProgGoals = dtb_u_u1901; f_DtProgram_dtProgSols = dtb_u_u1902; f_DtProgram_dtProgGlobals = dtb_u_u1903; f_DtProgram_dtProgInsts = dtb_u_u1904; f_DtProgram_dtProgClasses = dtb_u_u1905; f_DtProgram_dtProgNext = dtb_u_u1906; f_DtProgram_dtProgDepths = dtb_u_u1907; f_DtProgram_dtProgWarnings = dtb_u_u1908 } -> dtb_u_u1901
  | _ -> failwith "DT: impossible branch"
))

# 1169 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgSols = (fun (dtb_u_u1909 : t_DtProgram) -> (match dtb_u_u1909 with
  | { f_DtProgram_dtProgDatas = dtb_u_u1910; f_DtProgram_dtProgDefs = dtb_u_u1911; f_DtProgram_dtProgGoals = dtb_u_u1912; f_DtProgram_dtProgSols = dtb_u_u1913; f_DtProgram_dtProgGlobals = dtb_u_u1914; f_DtProgram_dtProgInsts = dtb_u_u1915; f_DtProgram_dtProgClasses = dtb_u_u1916; f_DtProgram_dtProgNext = dtb_u_u1917; f_DtProgram_dtProgDepths = dtb_u_u1918; f_DtProgram_dtProgWarnings = dtb_u_u1919 } -> dtb_u_u1913
  | _ -> failwith "DT: impossible branch"
))

# 1170 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgGlobals = (fun (dtb_u_u1920 : t_DtProgram) -> (match dtb_u_u1920 with
  | { f_DtProgram_dtProgDatas = dtb_u_u1921; f_DtProgram_dtProgDefs = dtb_u_u1922; f_DtProgram_dtProgGoals = dtb_u_u1923; f_DtProgram_dtProgSols = dtb_u_u1924; f_DtProgram_dtProgGlobals = dtb_u_u1925; f_DtProgram_dtProgInsts = dtb_u_u1926; f_DtProgram_dtProgClasses = dtb_u_u1927; f_DtProgram_dtProgNext = dtb_u_u1928; f_DtProgram_dtProgDepths = dtb_u_u1929; f_DtProgram_dtProgWarnings = dtb_u_u1930 } -> dtb_u_u1925
  | _ -> failwith "DT: impossible branch"
))

# 1171 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgInsts = (fun (dtb_u_u1931 : t_DtProgram) -> (match dtb_u_u1931 with
  | { f_DtProgram_dtProgDatas = dtb_u_u1932; f_DtProgram_dtProgDefs = dtb_u_u1933; f_DtProgram_dtProgGoals = dtb_u_u1934; f_DtProgram_dtProgSols = dtb_u_u1935; f_DtProgram_dtProgGlobals = dtb_u_u1936; f_DtProgram_dtProgInsts = dtb_u_u1937; f_DtProgram_dtProgClasses = dtb_u_u1938; f_DtProgram_dtProgNext = dtb_u_u1939; f_DtProgram_dtProgDepths = dtb_u_u1940; f_DtProgram_dtProgWarnings = dtb_u_u1941 } -> dtb_u_u1937
  | _ -> failwith "DT: impossible branch"
))

# 1172 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgClasses = (fun (dtb_u_u1942 : t_DtProgram) -> (match dtb_u_u1942 with
  | { f_DtProgram_dtProgDatas = dtb_u_u1943; f_DtProgram_dtProgDefs = dtb_u_u1944; f_DtProgram_dtProgGoals = dtb_u_u1945; f_DtProgram_dtProgSols = dtb_u_u1946; f_DtProgram_dtProgGlobals = dtb_u_u1947; f_DtProgram_dtProgInsts = dtb_u_u1948; f_DtProgram_dtProgClasses = dtb_u_u1949; f_DtProgram_dtProgNext = dtb_u_u1950; f_DtProgram_dtProgDepths = dtb_u_u1951; f_DtProgram_dtProgWarnings = dtb_u_u1952 } -> dtb_u_u1949
  | _ -> failwith "DT: impossible branch"
))

# 1173 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgNext = (fun (dtb_u_u1953 : t_DtProgram) -> (match dtb_u_u1953 with
  | { f_DtProgram_dtProgDatas = dtb_u_u1954; f_DtProgram_dtProgDefs = dtb_u_u1955; f_DtProgram_dtProgGoals = dtb_u_u1956; f_DtProgram_dtProgSols = dtb_u_u1957; f_DtProgram_dtProgGlobals = dtb_u_u1958; f_DtProgram_dtProgInsts = dtb_u_u1959; f_DtProgram_dtProgClasses = dtb_u_u1960; f_DtProgram_dtProgNext = dtb_u_u1961; f_DtProgram_dtProgDepths = dtb_u_u1962; f_DtProgram_dtProgWarnings = dtb_u_u1963 } -> dtb_u_u1961
  | _ -> failwith "DT: impossible branch"
))

# 1174 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgDepths = (fun (dtb_u_u1964 : t_DtProgram) -> (match dtb_u_u1964 with
  | { f_DtProgram_dtProgDatas = dtb_u_u1965; f_DtProgram_dtProgDefs = dtb_u_u1966; f_DtProgram_dtProgGoals = dtb_u_u1967; f_DtProgram_dtProgSols = dtb_u_u1968; f_DtProgram_dtProgGlobals = dtb_u_u1969; f_DtProgram_dtProgInsts = dtb_u_u1970; f_DtProgram_dtProgClasses = dtb_u_u1971; f_DtProgram_dtProgNext = dtb_u_u1972; f_DtProgram_dtProgDepths = dtb_u_u1973; f_DtProgram_dtProgWarnings = dtb_u_u1974 } -> dtb_u_u1973
  | _ -> failwith "DT: impossible branch"
))

# 1176 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgWarnings = (fun (dtb_u_u1975 : t_DtProgram) -> (match dtb_u_u1975 with
  | { f_DtProgram_dtProgDatas = dtb_u_u1976; f_DtProgram_dtProgDefs = dtb_u_u1977; f_DtProgram_dtProgGoals = dtb_u_u1978; f_DtProgram_dtProgSols = dtb_u_u1979; f_DtProgram_dtProgGlobals = dtb_u_u1980; f_DtProgram_dtProgInsts = dtb_u_u1981; f_DtProgram_dtProgClasses = dtb_u_u1982; f_DtProgram_dtProgNext = dtb_u_u1983; f_DtProgram_dtProgDepths = dtb_u_u1984; f_DtProgram_dtProgWarnings = dtb_u_u1985 } -> dtb_u_u1985
  | _ -> failwith "DT: impossible branch"
))
