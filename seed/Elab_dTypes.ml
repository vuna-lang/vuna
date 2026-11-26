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
let v_dtDefName = (fun (mc0 : t_DtDef) -> (match mc0 with
  | C_DtDef_DtExtern (dtb__0, dtb__1, dtb__2, dtb__3) -> dtb__0
  | C_DtDef_DtAxiom (dtb__4, dtb__5, dtb__6) -> dtb__4
  | C_DtDef_DtDef (dtb__7, dtb__8, dtb__9, dtb__10) -> dtb__7
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDefType = (fun (mc0 : t_DtDef) -> (match mc0 with
  | C_DtDef_DtExtern (dtb__11, dtb__12, dtb__13, dtb__14) -> dtb__12
  | C_DtDef_DtAxiom (dtb__15, dtb__16, dtb__17) -> dtb__16
  | C_DtDef_DtDef (dtb__18, dtb__19, dtb__20, dtb__21) -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

# 41 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDefBody = (fun (mc0 : t_DtDef) -> (match mc0 with
  | C_DtDef_DtExtern (dtb__22, dtb__23, dtb__24, dtb__25) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_DtDef_DtAxiom (dtb__26, dtb__27, dtb__28) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_DtDef_DtDef (dtb__29, dtb__30, dtb__31, dtb__32) -> (B_dData_dMaybe.C_Maybe_Just (dtb__31))
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDefHasBody = (fun (mc0 : t_DtDef) -> (match mc0 with
  | C_DtDef_DtExtern (dtb__33, dtb__34, dtb__35, dtb__36) -> true
  | C_DtDef_DtAxiom (dtb__37, dtb__38, dtb__39) -> false
  | C_DtDef_DtDef (dtb__40, dtb__41, dtb__42, dtb__43) -> true
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDefExtern = (fun (mc0 : t_DtDef) -> (match mc0 with
  | C_DtDef_DtExtern (dtb__44, dtb__45, dtb__46, dtb__47) -> (B_dData_dMaybe.C_Maybe_Just (dtb__46))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 58 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDefSpan = (fun (mc0 : t_DtDef) -> (match mc0 with
  | C_DtDef_DtExtern (dtb__48, dtb__49, dtb__50, dtb__51) -> dtb__51
  | C_DtDef_DtAxiom (dtb__52, dtb__53, dtb__54) -> dtb__54
  | C_DtDef_DtDef (dtb__55, dtb__56, dtb__57, dtb__58) -> dtb__58
  | _ -> failwith "DT: impossible branch"
))

# 138 "Vuna/Compiler/Elab/Types.vuna"
let rec v_flattenTaggedApp = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TGlobal (dtb__59) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__59; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | Core_dTerm.C_Term_TApp (dtb__60, dtb__61, dtb__62) -> (let nd_uscrut4 = (v_flattenTaggedApp dtb__60) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__63) -> (match dtb__63 with
  | { B_dData_dPair.f_Pair_first = dtb__64; B_dData_dPair.f_Pair_second = dtb__65 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__64; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__65) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__61; B_dData_dPair.f_Pair_second = dtb__62 }, B_dData_dList.C_List_Nil))) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 160 "Vuna/Compiler/Elab/Types.vuna"
let v_instFamilyOf = (fun (i : t_DtInst) -> (let nd_uscrut1 = (v_flattenTaggedApp (i).f_DtInst_dtInstHead) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb__66) -> (match dtb__66 with
  | { B_dData_dPair.f_Pair_first = dtb__67; B_dData_dPair.f_Pair_second = dtb__68 } -> dtb__67
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 167 "Vuna/Compiler/Elab/Types.vuna"
let v_instStoreEmpty = { f_InstStore_instsList = B_dData_dList.C_List_Nil; f_InstStore_instsByFamily = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil) }

# 177 "Vuna/Compiler/Elab/Types.vuna"
let v_instStorePush = (fun (store : t_InstStore) (i : t_DtInst) -> (let fam = (v_instFamilyOf i) in (let bucket = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) fam) (store).f_InstStore_instsByFamily) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__69) -> dtb__69
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in { f_InstStore_instsList = ((B_dData_dList.v_append (store).f_InstStore_instsList) (B_dData_dList.C_List__x58__x58_ (i, B_dData_dList.C_List_Nil))); f_InstStore_instsByFamily = (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) fam) ((B_dData_dList.v_append bucket) (B_dData_dList.C_List__x58__x58_ (i, B_dData_dList.C_List_Nil)))) (store).f_InstStore_instsByFamily) })))

# 172 "Vuna/Compiler/Elab/Types.vuna"
let rec v_instStoreOf = (fun (mc0 : t_DtInst B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__70, dtb__71) -> ((v_instStorePush (v_instStoreOf dtb__71)) dtb__70)
  | B_dData_dList.C_List_Nil -> v_instStoreEmpty
  | _ -> failwith "DT: impossible branch"
))

# 191 "Vuna/Compiler/Elab/Types.vuna"
let v_instStoreFamily = (fun (store : t_InstStore) (fam : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) fam) (store).f_InstStore_instsByFamily) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__72) -> dtb__72
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Elab/Types.vuna"
let v_csEmpty = { f_ConstraintStore_csPending = B_dContainer_dQueue.v_empty; f_ConstraintStore_csNextId = 0; f_ConstraintStore_csTried = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil); f_ConstraintStore_csSolsCount = 0; f_ConstraintStore_csPassNext = (0 - 1); f_ConstraintStore_csPassSols = (0 - 1); f_ConstraintStore_csCtorIndexComplete = false }

# 275 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutNext = (fun (mc0 : t_Ec) (mc1 : int) -> (match mc0 with
  | { f_Ec_ecNext = dtb__73; f_Ec_ecSols = dtb__74; f_Ec_ecDefsRev = dtb__75; f_Ec_ecDatas = dtb__76; f_Ec_ecDepthOfMeta = dtb__77; f_Ec_ecGoals = dtb__78; f_Ec_ecInsts = dtb__79; f_Ec_ecClasses = dtb__80; f_Ec_ecConstraints = dtb__81; f_Ec_ecDefTbl = dtb__82; f_Ec_ecGlobalsTbl = dtb__83; f_Ec_ecSolTbl = dtb__84; f_Ec_ecDepthTbl = dtb__85; f_Ec_ecGlobalsComplete = dtb__86; f_Ec_ecClausesTbl = dtb__87; f_Ec_ecCtorTbl = dtb__88; f_Ec_ecHasLinear = dtb__89; f_Ec_ecMetaSpans = dtb__90; f_Ec_ecUseSpans = dtb__91; f_Ec_ecWarnings = dtb__92; f_Ec_ecCounters = dtb__93; f_Ec_ecErrors = dtb__94 } -> { f_Ec_ecNext = mc1; f_Ec_ecSols = dtb__74; f_Ec_ecDefsRev = dtb__75; f_Ec_ecDatas = dtb__76; f_Ec_ecDepthOfMeta = dtb__77; f_Ec_ecGoals = dtb__78; f_Ec_ecInsts = dtb__79; f_Ec_ecClasses = dtb__80; f_Ec_ecConstraints = dtb__81; f_Ec_ecDefTbl = dtb__82; f_Ec_ecGlobalsTbl = dtb__83; f_Ec_ecSolTbl = dtb__84; f_Ec_ecDepthTbl = dtb__85; f_Ec_ecGlobalsComplete = dtb__86; f_Ec_ecClausesTbl = dtb__87; f_Ec_ecCtorTbl = dtb__88; f_Ec_ecHasLinear = dtb__89; f_Ec_ecMetaSpans = dtb__90; f_Ec_ecUseSpans = dtb__91; f_Ec_ecWarnings = dtb__92; f_Ec_ecCounters = dtb__93; f_Ec_ecErrors = dtb__94 }
  | _ -> failwith "DT: impossible branch"
))

# 301 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutClausesTbl = (fun (mc0 : t_Ec) (mc1 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | { f_Ec_ecNext = dtb__95; f_Ec_ecSols = dtb__96; f_Ec_ecDefsRev = dtb__97; f_Ec_ecDatas = dtb__98; f_Ec_ecDepthOfMeta = dtb__99; f_Ec_ecGoals = dtb__100; f_Ec_ecInsts = dtb__101; f_Ec_ecClasses = dtb__102; f_Ec_ecConstraints = dtb__103; f_Ec_ecDefTbl = dtb__104; f_Ec_ecGlobalsTbl = dtb__105; f_Ec_ecSolTbl = dtb__106; f_Ec_ecDepthTbl = dtb__107; f_Ec_ecGlobalsComplete = dtb__108; f_Ec_ecClausesTbl = dtb__109; f_Ec_ecCtorTbl = dtb__110; f_Ec_ecHasLinear = dtb__111; f_Ec_ecMetaSpans = dtb__112; f_Ec_ecUseSpans = dtb__113; f_Ec_ecWarnings = dtb__114; f_Ec_ecCounters = dtb__115; f_Ec_ecErrors = dtb__116 } -> { f_Ec_ecNext = dtb__95; f_Ec_ecSols = dtb__96; f_Ec_ecDefsRev = dtb__97; f_Ec_ecDatas = dtb__98; f_Ec_ecDepthOfMeta = dtb__99; f_Ec_ecGoals = dtb__100; f_Ec_ecInsts = dtb__101; f_Ec_ecClasses = dtb__102; f_Ec_ecConstraints = dtb__103; f_Ec_ecDefTbl = dtb__104; f_Ec_ecGlobalsTbl = dtb__105; f_Ec_ecSolTbl = dtb__106; f_Ec_ecDepthTbl = dtb__107; f_Ec_ecGlobalsComplete = dtb__108; f_Ec_ecClausesTbl = mc1; f_Ec_ecCtorTbl = dtb__110; f_Ec_ecHasLinear = dtb__111; f_Ec_ecMetaSpans = dtb__112; f_Ec_ecUseSpans = dtb__113; f_Ec_ecWarnings = dtb__114; f_Ec_ecCounters = dtb__115; f_Ec_ecErrors = dtb__116 }
  | _ -> failwith "DT: impossible branch"
))

# 328 "Vuna/Compiler/Elab/Types.vuna"
let v_ecDefs = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__117; f_Ec_ecSols = dtb__118; f_Ec_ecDefsRev = dtb__119; f_Ec_ecDatas = dtb__120; f_Ec_ecDepthOfMeta = dtb__121; f_Ec_ecGoals = dtb__122; f_Ec_ecInsts = dtb__123; f_Ec_ecClasses = dtb__124; f_Ec_ecConstraints = dtb__125; f_Ec_ecDefTbl = dtb__126; f_Ec_ecGlobalsTbl = dtb__127; f_Ec_ecSolTbl = dtb__128; f_Ec_ecDepthTbl = dtb__129; f_Ec_ecGlobalsComplete = dtb__130; f_Ec_ecClausesTbl = dtb__131; f_Ec_ecCtorTbl = dtb__132; f_Ec_ecHasLinear = dtb__133; f_Ec_ecMetaSpans = dtb__134; f_Ec_ecUseSpans = dtb__135; f_Ec_ecWarnings = dtb__136; f_Ec_ecCounters = dtb__137; f_Ec_ecErrors = dtb__138 } -> (B_dData_dList.v_reverse dtb__119)
  | _ -> failwith "DT: impossible branch"
))

# 336 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutGlobalsTbl = (fun (mc0 : t_Ec) (mc1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | { f_Ec_ecNext = dtb__139; f_Ec_ecSols = dtb__140; f_Ec_ecDefsRev = dtb__141; f_Ec_ecDatas = dtb__142; f_Ec_ecDepthOfMeta = dtb__143; f_Ec_ecGoals = dtb__144; f_Ec_ecInsts = dtb__145; f_Ec_ecClasses = dtb__146; f_Ec_ecConstraints = dtb__147; f_Ec_ecDefTbl = dtb__148; f_Ec_ecGlobalsTbl = dtb__149; f_Ec_ecSolTbl = dtb__150; f_Ec_ecDepthTbl = dtb__151; f_Ec_ecGlobalsComplete = dtb__152; f_Ec_ecClausesTbl = dtb__153; f_Ec_ecCtorTbl = dtb__154; f_Ec_ecHasLinear = dtb__155; f_Ec_ecMetaSpans = dtb__156; f_Ec_ecUseSpans = dtb__157; f_Ec_ecWarnings = dtb__158; f_Ec_ecCounters = dtb__159; f_Ec_ecErrors = dtb__160 } -> { f_Ec_ecNext = dtb__139; f_Ec_ecSols = dtb__140; f_Ec_ecDefsRev = dtb__141; f_Ec_ecDatas = dtb__142; f_Ec_ecDepthOfMeta = dtb__143; f_Ec_ecGoals = dtb__144; f_Ec_ecInsts = dtb__145; f_Ec_ecClasses = dtb__146; f_Ec_ecConstraints = dtb__147; f_Ec_ecDefTbl = dtb__148; f_Ec_ecGlobalsTbl = mc1; f_Ec_ecSolTbl = dtb__150; f_Ec_ecDepthTbl = dtb__151; f_Ec_ecGlobalsComplete = dtb__152; f_Ec_ecClausesTbl = dtb__153; f_Ec_ecCtorTbl = dtb__154; f_Ec_ecHasLinear = dtb__155; f_Ec_ecMetaSpans = dtb__156; f_Ec_ecUseSpans = dtb__157; f_Ec_ecWarnings = dtb__158; f_Ec_ecCounters = dtb__159; f_Ec_ecErrors = dtb__160 }
  | _ -> failwith "DT: impossible branch"
))

# 365 "Vuna/Compiler/Elab/Types.vuna"
let v_ecSetGlobalsComplete = (fun (mc0 : t_Ec) (mc1 : bool) -> (match mc0 with
  | { f_Ec_ecNext = dtb__161; f_Ec_ecSols = dtb__162; f_Ec_ecDefsRev = dtb__163; f_Ec_ecDatas = dtb__164; f_Ec_ecDepthOfMeta = dtb__165; f_Ec_ecGoals = dtb__166; f_Ec_ecInsts = dtb__167; f_Ec_ecClasses = dtb__168; f_Ec_ecConstraints = dtb__169; f_Ec_ecDefTbl = dtb__170; f_Ec_ecGlobalsTbl = dtb__171; f_Ec_ecSolTbl = dtb__172; f_Ec_ecDepthTbl = dtb__173; f_Ec_ecGlobalsComplete = dtb__174; f_Ec_ecClausesTbl = dtb__175; f_Ec_ecCtorTbl = dtb__176; f_Ec_ecHasLinear = dtb__177; f_Ec_ecMetaSpans = dtb__178; f_Ec_ecUseSpans = dtb__179; f_Ec_ecWarnings = dtb__180; f_Ec_ecCounters = dtb__181; f_Ec_ecErrors = dtb__182 } -> { f_Ec_ecNext = dtb__161; f_Ec_ecSols = dtb__162; f_Ec_ecDefsRev = dtb__163; f_Ec_ecDatas = dtb__164; f_Ec_ecDepthOfMeta = dtb__165; f_Ec_ecGoals = dtb__166; f_Ec_ecInsts = dtb__167; f_Ec_ecClasses = dtb__168; f_Ec_ecConstraints = dtb__169; f_Ec_ecDefTbl = dtb__170; f_Ec_ecGlobalsTbl = dtb__171; f_Ec_ecSolTbl = dtb__172; f_Ec_ecDepthTbl = dtb__173; f_Ec_ecGlobalsComplete = mc1; f_Ec_ecClausesTbl = dtb__175; f_Ec_ecCtorTbl = dtb__176; f_Ec_ecHasLinear = dtb__177; f_Ec_ecMetaSpans = dtb__178; f_Ec_ecUseSpans = dtb__179; f_Ec_ecWarnings = dtb__180; f_Ec_ecCounters = dtb__181; f_Ec_ecErrors = dtb__182 }
  | _ -> failwith "DT: impossible branch"
))

# 394 "Vuna/Compiler/Elab/Types.vuna"
let v_ecInstList = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__183; f_Ec_ecSols = dtb__184; f_Ec_ecDefsRev = dtb__185; f_Ec_ecDatas = dtb__186; f_Ec_ecDepthOfMeta = dtb__187; f_Ec_ecGoals = dtb__188; f_Ec_ecInsts = dtb__189; f_Ec_ecClasses = dtb__190; f_Ec_ecConstraints = dtb__191; f_Ec_ecDefTbl = dtb__192; f_Ec_ecGlobalsTbl = dtb__193; f_Ec_ecSolTbl = dtb__194; f_Ec_ecDepthTbl = dtb__195; f_Ec_ecGlobalsComplete = dtb__196; f_Ec_ecClausesTbl = dtb__197; f_Ec_ecCtorTbl = dtb__198; f_Ec_ecHasLinear = dtb__199; f_Ec_ecMetaSpans = dtb__200; f_Ec_ecUseSpans = dtb__201; f_Ec_ecWarnings = dtb__202; f_Ec_ecCounters = dtb__203; f_Ec_ecErrors = dtb__204 } -> (dtb__189).f_InstStore_instsList
  | _ -> failwith "DT: impossible branch"
))

# 398 "Vuna/Compiler/Elab/Types.vuna"
let v_ecInstsFamily = (fun (mc0 : t_Ec) (mc1 : string) -> (match mc0 with
  | { f_Ec_ecNext = dtb__205; f_Ec_ecSols = dtb__206; f_Ec_ecDefsRev = dtb__207; f_Ec_ecDatas = dtb__208; f_Ec_ecDepthOfMeta = dtb__209; f_Ec_ecGoals = dtb__210; f_Ec_ecInsts = dtb__211; f_Ec_ecClasses = dtb__212; f_Ec_ecConstraints = dtb__213; f_Ec_ecDefTbl = dtb__214; f_Ec_ecGlobalsTbl = dtb__215; f_Ec_ecSolTbl = dtb__216; f_Ec_ecDepthTbl = dtb__217; f_Ec_ecGlobalsComplete = dtb__218; f_Ec_ecClausesTbl = dtb__219; f_Ec_ecCtorTbl = dtb__220; f_Ec_ecHasLinear = dtb__221; f_Ec_ecMetaSpans = dtb__222; f_Ec_ecUseSpans = dtb__223; f_Ec_ecWarnings = dtb__224; f_Ec_ecCounters = dtb__225; f_Ec_ecErrors = dtb__226 } -> ((v_instStoreFamily dtb__211) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 416 "Vuna/Compiler/Elab/Types.vuna"
let rec v_bucketCount = (fun (mc0 : (string, t_DtInst B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__227, dtb__228) -> ((B_dData_dList.v_length (B_dData_dPair.v_secondOf dtb__227)) + (v_bucketCount dtb__228))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 428 "Vuna/Compiler/Elab/Types.vuna"
let rec v_instNamesEq = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__229, dtb__230) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__231, dtb__232) -> (if (dtb__229 = dtb__231) then ((v_instNamesEq dtb__230) dtb__232) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__233, dtb__234) -> false
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 434 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddGoal = (fun (mc0 : t_Ec) (mc1 : t_DtGoal) -> (match mc0 with
  | { f_Ec_ecNext = dtb__235; f_Ec_ecSols = dtb__236; f_Ec_ecDefsRev = dtb__237; f_Ec_ecDatas = dtb__238; f_Ec_ecDepthOfMeta = dtb__239; f_Ec_ecGoals = dtb__240; f_Ec_ecInsts = dtb__241; f_Ec_ecClasses = dtb__242; f_Ec_ecConstraints = dtb__243; f_Ec_ecDefTbl = dtb__244; f_Ec_ecGlobalsTbl = dtb__245; f_Ec_ecSolTbl = dtb__246; f_Ec_ecDepthTbl = dtb__247; f_Ec_ecGlobalsComplete = dtb__248; f_Ec_ecClausesTbl = dtb__249; f_Ec_ecCtorTbl = dtb__250; f_Ec_ecHasLinear = dtb__251; f_Ec_ecMetaSpans = dtb__252; f_Ec_ecUseSpans = dtb__253; f_Ec_ecWarnings = dtb__254; f_Ec_ecCounters = dtb__255; f_Ec_ecErrors = dtb__256 } -> { f_Ec_ecNext = dtb__235; f_Ec_ecSols = dtb__236; f_Ec_ecDefsRev = dtb__237; f_Ec_ecDatas = dtb__238; f_Ec_ecDepthOfMeta = dtb__239; f_Ec_ecGoals = ((B_dData_dList.v_append dtb__240) (B_dData_dList.C_List__x58__x58_ (mc1, B_dData_dList.C_List_Nil))); f_Ec_ecInsts = dtb__241; f_Ec_ecClasses = dtb__242; f_Ec_ecConstraints = dtb__243; f_Ec_ecDefTbl = dtb__244; f_Ec_ecGlobalsTbl = dtb__245; f_Ec_ecSolTbl = dtb__246; f_Ec_ecDepthTbl = dtb__247; f_Ec_ecGlobalsComplete = dtb__248; f_Ec_ecClausesTbl = dtb__249; f_Ec_ecCtorTbl = dtb__250; f_Ec_ecHasLinear = dtb__251; f_Ec_ecMetaSpans = dtb__252; f_Ec_ecUseSpans = dtb__253; f_Ec_ecWarnings = dtb__254; f_Ec_ecCounters = dtb__255; f_Ec_ecErrors = dtb__256 }
  | _ -> failwith "DT: impossible branch"
))

# 463 "Vuna/Compiler/Elab/Types.vuna"
let rec v_hasInstKey = (fun (mc0 : string) (mc1 : t_DtInst B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__257, dtb__258) -> (if ((dtb__257).f_DtInst_dtInstKey = mc0) then true else ((v_hasInstKey mc0) dtb__258))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 468 "Vuna/Compiler/Elab/Types.vuna"
let rec v_hasInstSym = (fun (mc0 : string) (mc1 : t_DtInst B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__259, dtb__260) -> (if ((dtb__259).f_DtInst_dtInstSym = mc0) then true else ((v_hasInstSym mc0) dtb__260))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 472 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddInstRaw = (fun (mc0 : t_Ec) (mc1 : t_DtInst) -> (match mc0 with
  | { f_Ec_ecNext = dtb__261; f_Ec_ecSols = dtb__262; f_Ec_ecDefsRev = dtb__263; f_Ec_ecDatas = dtb__264; f_Ec_ecDepthOfMeta = dtb__265; f_Ec_ecGoals = dtb__266; f_Ec_ecInsts = dtb__267; f_Ec_ecClasses = dtb__268; f_Ec_ecConstraints = dtb__269; f_Ec_ecDefTbl = dtb__270; f_Ec_ecGlobalsTbl = dtb__271; f_Ec_ecSolTbl = dtb__272; f_Ec_ecDepthTbl = dtb__273; f_Ec_ecGlobalsComplete = dtb__274; f_Ec_ecClausesTbl = dtb__275; f_Ec_ecCtorTbl = dtb__276; f_Ec_ecHasLinear = dtb__277; f_Ec_ecMetaSpans = dtb__278; f_Ec_ecUseSpans = dtb__279; f_Ec_ecWarnings = dtb__280; f_Ec_ecCounters = dtb__281; f_Ec_ecErrors = dtb__282 } -> { f_Ec_ecNext = dtb__261; f_Ec_ecSols = dtb__262; f_Ec_ecDefsRev = dtb__263; f_Ec_ecDatas = dtb__264; f_Ec_ecDepthOfMeta = dtb__265; f_Ec_ecGoals = dtb__266; f_Ec_ecInsts = ((v_instStorePush dtb__267) mc1); f_Ec_ecClasses = dtb__268; f_Ec_ecConstraints = dtb__269; f_Ec_ecDefTbl = dtb__270; f_Ec_ecGlobalsTbl = dtb__271; f_Ec_ecSolTbl = dtb__272; f_Ec_ecDepthTbl = dtb__273; f_Ec_ecGlobalsComplete = dtb__274; f_Ec_ecClausesTbl = dtb__275; f_Ec_ecCtorTbl = dtb__276; f_Ec_ecHasLinear = dtb__277; f_Ec_ecMetaSpans = dtb__278; f_Ec_ecUseSpans = dtb__279; f_Ec_ecWarnings = dtb__280; f_Ec_ecCounters = dtb__281; f_Ec_ecErrors = dtb__282 }
  | _ -> failwith "DT: impossible branch"
))

# 460 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddInst = (fun (ec : t_Ec) (i : t_DtInst) -> (if ((v_hasInstKey (i).f_DtInst_dtInstKey) (v_ecInstList ec)) then ec else ((v_ecAddInstRaw ec) i)))

# 498 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddClass = (fun (mc0 : t_Ec) (mc1 : t_DtClass) -> (match mc0 with
  | { f_Ec_ecNext = dtb__283; f_Ec_ecSols = dtb__284; f_Ec_ecDefsRev = dtb__285; f_Ec_ecDatas = dtb__286; f_Ec_ecDepthOfMeta = dtb__287; f_Ec_ecGoals = dtb__288; f_Ec_ecInsts = dtb__289; f_Ec_ecClasses = dtb__290; f_Ec_ecConstraints = dtb__291; f_Ec_ecDefTbl = dtb__292; f_Ec_ecGlobalsTbl = dtb__293; f_Ec_ecSolTbl = dtb__294; f_Ec_ecDepthTbl = dtb__295; f_Ec_ecGlobalsComplete = dtb__296; f_Ec_ecClausesTbl = dtb__297; f_Ec_ecCtorTbl = dtb__298; f_Ec_ecHasLinear = dtb__299; f_Ec_ecMetaSpans = dtb__300; f_Ec_ecUseSpans = dtb__301; f_Ec_ecWarnings = dtb__302; f_Ec_ecCounters = dtb__303; f_Ec_ecErrors = dtb__304 } -> { f_Ec_ecNext = dtb__283; f_Ec_ecSols = dtb__284; f_Ec_ecDefsRev = dtb__285; f_Ec_ecDatas = dtb__286; f_Ec_ecDepthOfMeta = dtb__287; f_Ec_ecGoals = dtb__288; f_Ec_ecInsts = dtb__289; f_Ec_ecClasses = ((B_dData_dList.v_append dtb__290) (B_dData_dList.C_List__x58__x58_ (mc1, B_dData_dList.C_List_Nil))); f_Ec_ecConstraints = dtb__291; f_Ec_ecDefTbl = dtb__292; f_Ec_ecGlobalsTbl = dtb__293; f_Ec_ecSolTbl = dtb__294; f_Ec_ecDepthTbl = dtb__295; f_Ec_ecGlobalsComplete = dtb__296; f_Ec_ecClausesTbl = dtb__297; f_Ec_ecCtorTbl = dtb__298; f_Ec_ecHasLinear = dtb__299; f_Ec_ecMetaSpans = dtb__300; f_Ec_ecUseSpans = dtb__301; f_Ec_ecWarnings = dtb__302; f_Ec_ecCounters = dtb__303; f_Ec_ecErrors = dtb__304 }
  | _ -> failwith "DT: impossible branch"
))

# 527 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutConstraints = (fun (mc0 : t_Ec) (mc1 : t_ConstraintStore) -> (match mc0 with
  | { f_Ec_ecNext = dtb__305; f_Ec_ecSols = dtb__306; f_Ec_ecDefsRev = dtb__307; f_Ec_ecDatas = dtb__308; f_Ec_ecDepthOfMeta = dtb__309; f_Ec_ecGoals = dtb__310; f_Ec_ecInsts = dtb__311; f_Ec_ecClasses = dtb__312; f_Ec_ecConstraints = dtb__313; f_Ec_ecDefTbl = dtb__314; f_Ec_ecGlobalsTbl = dtb__315; f_Ec_ecSolTbl = dtb__316; f_Ec_ecDepthTbl = dtb__317; f_Ec_ecGlobalsComplete = dtb__318; f_Ec_ecClausesTbl = dtb__319; f_Ec_ecCtorTbl = dtb__320; f_Ec_ecHasLinear = dtb__321; f_Ec_ecMetaSpans = dtb__322; f_Ec_ecUseSpans = dtb__323; f_Ec_ecWarnings = dtb__324; f_Ec_ecCounters = dtb__325; f_Ec_ecErrors = dtb__326 } -> { f_Ec_ecNext = dtb__305; f_Ec_ecSols = dtb__306; f_Ec_ecDefsRev = dtb__307; f_Ec_ecDatas = dtb__308; f_Ec_ecDepthOfMeta = dtb__309; f_Ec_ecGoals = dtb__310; f_Ec_ecInsts = dtb__311; f_Ec_ecClasses = dtb__312; f_Ec_ecConstraints = mc1; f_Ec_ecDefTbl = dtb__314; f_Ec_ecGlobalsTbl = dtb__315; f_Ec_ecSolTbl = dtb__316; f_Ec_ecDepthTbl = dtb__317; f_Ec_ecGlobalsComplete = dtb__318; f_Ec_ecClausesTbl = dtb__319; f_Ec_ecCtorTbl = dtb__320; f_Ec_ecHasLinear = dtb__321; f_Ec_ecMetaSpans = dtb__322; f_Ec_ecUseSpans = dtb__323; f_Ec_ecWarnings = dtb__324; f_Ec_ecCounters = dtb__325; f_Ec_ecErrors = dtb__326 }
  | _ -> failwith "DT: impossible branch"
))

# 624 "Vuna/Compiler/Elab/Types.vuna"
let v_ecEmpty = { f_Ec_ecNext = 0; f_Ec_ecSols = B_dData_dList.C_List_Nil; f_Ec_ecDefsRev = B_dData_dList.C_List_Nil; f_Ec_ecDatas = B_dData_dList.C_List_Nil; f_Ec_ecDepthOfMeta = B_dData_dList.C_List_Nil; f_Ec_ecGoals = B_dData_dList.C_List_Nil; f_Ec_ecInsts = v_instStoreEmpty; f_Ec_ecClasses = B_dData_dList.C_List_Nil; f_Ec_ecConstraints = v_csEmpty; f_Ec_ecDefTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil); f_Ec_ecGlobalsTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil); f_Ec_ecSolTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil); f_Ec_ecDepthTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil); f_Ec_ecGlobalsComplete = false; f_Ec_ecClausesTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil); f_Ec_ecCtorTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil); f_Ec_ecHasLinear = false; f_Ec_ecMetaSpans = B_dData_dList.C_List_Nil; f_Ec_ecUseSpans = B_dData_dList.C_List_Nil; f_Ec_ecWarnings = B_dData_dList.C_List_Nil; f_Ec_ecCounters = B_dData_dList.C_List_Nil; f_Ec_ecErrors = B_dData_dList.C_List_Nil }

# 678 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutSolsRaw = (fun (mc0 : t_Ec) (mc1 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | { f_Ec_ecNext = dtb__327; f_Ec_ecSols = dtb__328; f_Ec_ecDefsRev = dtb__329; f_Ec_ecDatas = dtb__330; f_Ec_ecDepthOfMeta = dtb__331; f_Ec_ecGoals = dtb__332; f_Ec_ecInsts = dtb__333; f_Ec_ecClasses = dtb__334; f_Ec_ecConstraints = dtb__335; f_Ec_ecDefTbl = dtb__336; f_Ec_ecGlobalsTbl = dtb__337; f_Ec_ecSolTbl = dtb__338; f_Ec_ecDepthTbl = dtb__339; f_Ec_ecGlobalsComplete = dtb__340; f_Ec_ecClausesTbl = dtb__341; f_Ec_ecCtorTbl = dtb__342; f_Ec_ecHasLinear = dtb__343; f_Ec_ecMetaSpans = dtb__344; f_Ec_ecUseSpans = dtb__345; f_Ec_ecWarnings = dtb__346; f_Ec_ecCounters = dtb__347; f_Ec_ecErrors = dtb__348 } -> { f_Ec_ecNext = dtb__327; f_Ec_ecSols = mc1; f_Ec_ecDefsRev = dtb__329; f_Ec_ecDatas = dtb__330; f_Ec_ecDepthOfMeta = dtb__331; f_Ec_ecGoals = dtb__332; f_Ec_ecInsts = dtb__333; f_Ec_ecClasses = dtb__334; f_Ec_ecConstraints = dtb__335; f_Ec_ecDefTbl = dtb__336; f_Ec_ecGlobalsTbl = dtb__337; f_Ec_ecSolTbl = mc2; f_Ec_ecDepthTbl = dtb__339; f_Ec_ecGlobalsComplete = dtb__340; f_Ec_ecClausesTbl = dtb__341; f_Ec_ecCtorTbl = dtb__342; f_Ec_ecHasLinear = dtb__343; f_Ec_ecMetaSpans = dtb__344; f_Ec_ecUseSpans = dtb__345; f_Ec_ecWarnings = dtb__346; f_Ec_ecCounters = dtb__347; f_Ec_ecErrors = dtb__348 }
  | _ -> failwith "DT: impossible branch"
))

# 735 "Vuna/Compiler/Elab/Types.vuna"
let[@tail_mod_cons] rec v_prefixUntilId = (fun (mc0 : int) (mc1 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__349, dtb__350) -> (match dtb__349 with
  | { B_dData_dPair.f_Pair_first = dtb__351; B_dData_dPair.f_Pair_second = dtb__352 } -> (if (dtb__351 = mc0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__351; B_dData_dPair.f_Pair_second = dtb__352 }, ((v_prefixUntilId mc0) dtb__350))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 731 "Vuna/Compiler/Elab/Types.vuna"
let v_solsDelta = (fun (mc0 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__353, dtb__354) -> (match dtb__353 with
  | { B_dData_dPair.f_Pair_first = dtb__355; B_dData_dPair.f_Pair_second = dtb__356 } -> ((v_prefixUntilId dtb__355) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 780 "Vuna/Compiler/Elab/Types.vuna"
let v_ecRemoveDefTbl = (fun (mc0 : string) (mc1 : t_Ec) -> (match mc1 with
  | { f_Ec_ecNext = dtb__357; f_Ec_ecSols = dtb__358; f_Ec_ecDefsRev = dtb__359; f_Ec_ecDatas = dtb__360; f_Ec_ecDepthOfMeta = dtb__361; f_Ec_ecGoals = dtb__362; f_Ec_ecInsts = dtb__363; f_Ec_ecClasses = dtb__364; f_Ec_ecConstraints = dtb__365; f_Ec_ecDefTbl = dtb__366; f_Ec_ecGlobalsTbl = dtb__367; f_Ec_ecSolTbl = dtb__368; f_Ec_ecDepthTbl = dtb__369; f_Ec_ecGlobalsComplete = dtb__370; f_Ec_ecClausesTbl = dtb__371; f_Ec_ecCtorTbl = dtb__372; f_Ec_ecHasLinear = dtb__373; f_Ec_ecMetaSpans = dtb__374; f_Ec_ecUseSpans = dtb__375; f_Ec_ecWarnings = dtb__376; f_Ec_ecCounters = dtb__377; f_Ec_ecErrors = dtb__378 } -> { f_Ec_ecNext = dtb__357; f_Ec_ecSols = dtb__358; f_Ec_ecDefsRev = dtb__359; f_Ec_ecDatas = dtb__360; f_Ec_ecDepthOfMeta = dtb__361; f_Ec_ecGoals = dtb__362; f_Ec_ecInsts = dtb__363; f_Ec_ecClasses = dtb__364; f_Ec_ecConstraints = dtb__365; f_Ec_ecDefTbl = ((((B_dContainer_dHashMap.v_remove B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) mc0) dtb__366); f_Ec_ecGlobalsTbl = dtb__367; f_Ec_ecSolTbl = dtb__368; f_Ec_ecDepthTbl = dtb__369; f_Ec_ecGlobalsComplete = dtb__370; f_Ec_ecClausesTbl = dtb__371; f_Ec_ecCtorTbl = dtb__372; f_Ec_ecHasLinear = dtb__373; f_Ec_ecMetaSpans = dtb__374; f_Ec_ecUseSpans = dtb__375; f_Ec_ecWarnings = dtb__376; f_Ec_ecCounters = dtb__377; f_Ec_ecErrors = dtb__378 }
  | _ -> failwith "DT: impossible branch"
))

# 851 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutMetaSpans = (fun (mc0 : t_Ec) (mc1 : (int, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | { f_Ec_ecNext = dtb__379; f_Ec_ecSols = dtb__380; f_Ec_ecDefsRev = dtb__381; f_Ec_ecDatas = dtb__382; f_Ec_ecDepthOfMeta = dtb__383; f_Ec_ecGoals = dtb__384; f_Ec_ecInsts = dtb__385; f_Ec_ecClasses = dtb__386; f_Ec_ecConstraints = dtb__387; f_Ec_ecDefTbl = dtb__388; f_Ec_ecGlobalsTbl = dtb__389; f_Ec_ecSolTbl = dtb__390; f_Ec_ecDepthTbl = dtb__391; f_Ec_ecGlobalsComplete = dtb__392; f_Ec_ecClausesTbl = dtb__393; f_Ec_ecCtorTbl = dtb__394; f_Ec_ecHasLinear = dtb__395; f_Ec_ecMetaSpans = dtb__396; f_Ec_ecUseSpans = dtb__397; f_Ec_ecWarnings = dtb__398; f_Ec_ecCounters = dtb__399; f_Ec_ecErrors = dtb__400 } -> { f_Ec_ecNext = dtb__379; f_Ec_ecSols = dtb__380; f_Ec_ecDefsRev = dtb__381; f_Ec_ecDatas = dtb__382; f_Ec_ecDepthOfMeta = dtb__383; f_Ec_ecGoals = dtb__384; f_Ec_ecInsts = dtb__385; f_Ec_ecClasses = dtb__386; f_Ec_ecConstraints = dtb__387; f_Ec_ecDefTbl = dtb__388; f_Ec_ecGlobalsTbl = dtb__389; f_Ec_ecSolTbl = dtb__390; f_Ec_ecDepthTbl = dtb__391; f_Ec_ecGlobalsComplete = dtb__392; f_Ec_ecClausesTbl = dtb__393; f_Ec_ecCtorTbl = dtb__394; f_Ec_ecHasLinear = dtb__395; f_Ec_ecMetaSpans = mc1; f_Ec_ecUseSpans = dtb__397; f_Ec_ecWarnings = dtb__398; f_Ec_ecCounters = dtb__399; f_Ec_ecErrors = dtb__400 }
  | _ -> failwith "DT: impossible branch"
))

# 878 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutUseSpans = (fun (mc0 : t_Ec) (mc1 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | { f_Ec_ecNext = dtb__401; f_Ec_ecSols = dtb__402; f_Ec_ecDefsRev = dtb__403; f_Ec_ecDatas = dtb__404; f_Ec_ecDepthOfMeta = dtb__405; f_Ec_ecGoals = dtb__406; f_Ec_ecInsts = dtb__407; f_Ec_ecClasses = dtb__408; f_Ec_ecConstraints = dtb__409; f_Ec_ecDefTbl = dtb__410; f_Ec_ecGlobalsTbl = dtb__411; f_Ec_ecSolTbl = dtb__412; f_Ec_ecDepthTbl = dtb__413; f_Ec_ecGlobalsComplete = dtb__414; f_Ec_ecClausesTbl = dtb__415; f_Ec_ecCtorTbl = dtb__416; f_Ec_ecHasLinear = dtb__417; f_Ec_ecMetaSpans = dtb__418; f_Ec_ecUseSpans = dtb__419; f_Ec_ecWarnings = dtb__420; f_Ec_ecCounters = dtb__421; f_Ec_ecErrors = dtb__422 } -> { f_Ec_ecNext = dtb__401; f_Ec_ecSols = dtb__402; f_Ec_ecDefsRev = dtb__403; f_Ec_ecDatas = dtb__404; f_Ec_ecDepthOfMeta = dtb__405; f_Ec_ecGoals = dtb__406; f_Ec_ecInsts = dtb__407; f_Ec_ecClasses = dtb__408; f_Ec_ecConstraints = dtb__409; f_Ec_ecDefTbl = dtb__410; f_Ec_ecGlobalsTbl = dtb__411; f_Ec_ecSolTbl = dtb__412; f_Ec_ecDepthTbl = dtb__413; f_Ec_ecGlobalsComplete = dtb__414; f_Ec_ecClausesTbl = dtb__415; f_Ec_ecCtorTbl = dtb__416; f_Ec_ecHasLinear = dtb__417; f_Ec_ecMetaSpans = dtb__418; f_Ec_ecUseSpans = mc1; f_Ec_ecWarnings = dtb__420; f_Ec_ecCounters = dtb__421; f_Ec_ecErrors = dtb__422 }
  | _ -> failwith "DT: impossible branch"
))

# 907 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutWarnings = (fun (mc0 : t_Ec) (mc1 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (match mc0 with
  | { f_Ec_ecNext = dtb__423; f_Ec_ecSols = dtb__424; f_Ec_ecDefsRev = dtb__425; f_Ec_ecDatas = dtb__426; f_Ec_ecDepthOfMeta = dtb__427; f_Ec_ecGoals = dtb__428; f_Ec_ecInsts = dtb__429; f_Ec_ecClasses = dtb__430; f_Ec_ecConstraints = dtb__431; f_Ec_ecDefTbl = dtb__432; f_Ec_ecGlobalsTbl = dtb__433; f_Ec_ecSolTbl = dtb__434; f_Ec_ecDepthTbl = dtb__435; f_Ec_ecGlobalsComplete = dtb__436; f_Ec_ecClausesTbl = dtb__437; f_Ec_ecCtorTbl = dtb__438; f_Ec_ecHasLinear = dtb__439; f_Ec_ecMetaSpans = dtb__440; f_Ec_ecUseSpans = dtb__441; f_Ec_ecWarnings = dtb__442; f_Ec_ecCounters = dtb__443; f_Ec_ecErrors = dtb__444 } -> { f_Ec_ecNext = dtb__423; f_Ec_ecSols = dtb__424; f_Ec_ecDefsRev = dtb__425; f_Ec_ecDatas = dtb__426; f_Ec_ecDepthOfMeta = dtb__427; f_Ec_ecGoals = dtb__428; f_Ec_ecInsts = dtb__429; f_Ec_ecClasses = dtb__430; f_Ec_ecConstraints = dtb__431; f_Ec_ecDefTbl = dtb__432; f_Ec_ecGlobalsTbl = dtb__433; f_Ec_ecSolTbl = dtb__434; f_Ec_ecDepthTbl = dtb__435; f_Ec_ecGlobalsComplete = dtb__436; f_Ec_ecClausesTbl = dtb__437; f_Ec_ecCtorTbl = dtb__438; f_Ec_ecHasLinear = dtb__439; f_Ec_ecMetaSpans = dtb__440; f_Ec_ecUseSpans = dtb__441; f_Ec_ecWarnings = mc1; f_Ec_ecCounters = dtb__443; f_Ec_ecErrors = dtb__444 }
  | _ -> failwith "DT: impossible branch"
))

# 938 "Vuna/Compiler/Elab/Types.vuna"
let v_ecBump = (fun (mc0 : t_Ec) (mc1 : string) -> (match mc0 with
  | { f_Ec_ecNext = dtb__445; f_Ec_ecSols = dtb__446; f_Ec_ecDefsRev = dtb__447; f_Ec_ecDatas = dtb__448; f_Ec_ecDepthOfMeta = dtb__449; f_Ec_ecGoals = dtb__450; f_Ec_ecInsts = dtb__451; f_Ec_ecClasses = dtb__452; f_Ec_ecConstraints = dtb__453; f_Ec_ecDefTbl = dtb__454; f_Ec_ecGlobalsTbl = dtb__455; f_Ec_ecSolTbl = dtb__456; f_Ec_ecDepthTbl = dtb__457; f_Ec_ecGlobalsComplete = dtb__458; f_Ec_ecClausesTbl = dtb__459; f_Ec_ecCtorTbl = dtb__460; f_Ec_ecHasLinear = dtb__461; f_Ec_ecMetaSpans = dtb__462; f_Ec_ecUseSpans = dtb__463; f_Ec_ecWarnings = dtb__464; f_Ec_ecCounters = dtb__465; f_Ec_ecErrors = dtb__466 } -> { f_Ec_ecNext = dtb__445; f_Ec_ecSols = dtb__446; f_Ec_ecDefsRev = dtb__447; f_Ec_ecDatas = dtb__448; f_Ec_ecDepthOfMeta = dtb__449; f_Ec_ecGoals = dtb__450; f_Ec_ecInsts = dtb__451; f_Ec_ecClasses = dtb__452; f_Ec_ecConstraints = dtb__453; f_Ec_ecDefTbl = dtb__454; f_Ec_ecGlobalsTbl = dtb__455; f_Ec_ecSolTbl = dtb__456; f_Ec_ecDepthTbl = dtb__457; f_Ec_ecGlobalsComplete = dtb__458; f_Ec_ecClausesTbl = dtb__459; f_Ec_ecCtorTbl = dtb__460; f_Ec_ecHasLinear = dtb__461; f_Ec_ecMetaSpans = dtb__462; f_Ec_ecUseSpans = dtb__463; f_Ec_ecWarnings = dtb__464; f_Ec_ecCounters = (B_dData_dList.C_List__x58__x58_ (mc1, dtb__465)); f_Ec_ecErrors = dtb__466 }
  | _ -> failwith "DT: impossible branch"
))

# 965 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddError = (fun (mc0 : t_Ec) (mc1 : Base_dDiag.t_Diagnostic) -> (match mc0 with
  | { f_Ec_ecNext = dtb__467; f_Ec_ecSols = dtb__468; f_Ec_ecDefsRev = dtb__469; f_Ec_ecDatas = dtb__470; f_Ec_ecDepthOfMeta = dtb__471; f_Ec_ecGoals = dtb__472; f_Ec_ecInsts = dtb__473; f_Ec_ecClasses = dtb__474; f_Ec_ecConstraints = dtb__475; f_Ec_ecDefTbl = dtb__476; f_Ec_ecGlobalsTbl = dtb__477; f_Ec_ecSolTbl = dtb__478; f_Ec_ecDepthTbl = dtb__479; f_Ec_ecGlobalsComplete = dtb__480; f_Ec_ecClausesTbl = dtb__481; f_Ec_ecCtorTbl = dtb__482; f_Ec_ecHasLinear = dtb__483; f_Ec_ecMetaSpans = dtb__484; f_Ec_ecUseSpans = dtb__485; f_Ec_ecWarnings = dtb__486; f_Ec_ecCounters = dtb__487; f_Ec_ecErrors = dtb__488 } -> { f_Ec_ecNext = dtb__467; f_Ec_ecSols = dtb__468; f_Ec_ecDefsRev = dtb__469; f_Ec_ecDatas = dtb__470; f_Ec_ecDepthOfMeta = dtb__471; f_Ec_ecGoals = dtb__472; f_Ec_ecInsts = dtb__473; f_Ec_ecClasses = dtb__474; f_Ec_ecConstraints = dtb__475; f_Ec_ecDefTbl = dtb__476; f_Ec_ecGlobalsTbl = dtb__477; f_Ec_ecSolTbl = dtb__478; f_Ec_ecDepthTbl = dtb__479; f_Ec_ecGlobalsComplete = dtb__480; f_Ec_ecClausesTbl = dtb__481; f_Ec_ecCtorTbl = dtb__482; f_Ec_ecHasLinear = dtb__483; f_Ec_ecMetaSpans = dtb__484; f_Ec_ecUseSpans = dtb__485; f_Ec_ecWarnings = dtb__486; f_Ec_ecCounters = dtb__487; f_Ec_ecErrors = (B_dData_dList.C_List__x58__x58_ (mc1, dtb__488)) }
  | _ -> failwith "DT: impossible branch"
))

# 1015 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxDepth = (fun (ctx : t_Ctx) -> (ctx).f_Ctx_ctxDepthF)

# 1018 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxBind = (fun (mc0 : string) (mc1 : Core_dTerm.t_Term) (mc2 : t_Ctx) -> (match mc2 with
  | { f_Ctx_ctxItems = dtb__489; f_Ctx_ctxEnvF = dtb__490; f_Ctx_ctxRefVals = dtb__491; f_Ctx_ctxDepthF = dtb__492; f_Ctx_ctxEnvRF = dtb__493 } -> (let v = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (mc0, dtb__492, B_dData_dList.C_List_Nil)))) in { f_Ctx_ctxItems = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }, dtb__489)); f_Ctx_ctxEnvF = (B_dData_dList.C_List__x58__x58_ (v, dtb__490)); f_Ctx_ctxRefVals = dtb__491; f_Ctx_ctxDepthF = (dtb__492 + 1); f_Ctx_ctxEnvRF = (B_dData_dList.C_List__x58__x58_ (v, dtb__493)) })
  | _ -> failwith "DT: impossible branch"
))

# 1025 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxBindValue = (fun (mc0 : string) (mc1 : Core_dTerm.t_Value) (mc2 : t_Ctx) -> (match mc2 with
  | { f_Ctx_ctxItems = dtb__494; f_Ctx_ctxEnvF = dtb__495; f_Ctx_ctxRefVals = dtb__496; f_Ctx_ctxDepthF = dtb__497; f_Ctx_ctxEnvRF = dtb__498 } -> (let v = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (mc0, dtb__497, B_dData_dList.C_List_Nil)))) in { f_Ctx_ctxItems = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = ((Core_dEval.v_quote dtb__497) mc1) }, dtb__494)); f_Ctx_ctxEnvF = (B_dData_dList.C_List__x58__x58_ (v, dtb__495)); f_Ctx_ctxRefVals = dtb__496; f_Ctx_ctxDepthF = (dtb__497 + 1); f_Ctx_ctxEnvRF = (B_dData_dList.C_List__x58__x58_ (v, dtb__498)) })
  | _ -> failwith "DT: impossible branch"
))

# 1038 "Vuna/Compiler/Elab/Types.vuna"
let rec v_ctxLookupAt = (fun (mc0 : string) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__499, dtb__500) -> (match dtb__499 with
  | { B_dData_dPair.f_Pair_first = dtb__501; B_dData_dPair.f_Pair_second = dtb__502 } -> (if (dtb__501 = mc0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = dtb__502 })) else (((v_ctxLookupAt mc0) dtb__500) (mc2 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1043 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxLookup = (fun (name : string) (ctx : t_Ctx) -> (((v_ctxLookupAt name) (ctx).f_Ctx_ctxItems) 0))

# 1052 "Vuna/Compiler/Elab/Types.vuna"
let[@tail_mod_cons] rec v_ctxEnvAt = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__503, dtb__504) -> (match dtb__503 with
  | { B_dData_dPair.f_Pair_first = dtb__505; B_dData_dPair.f_Pair_second = dtb__506 } -> (B_dData_dList.C_List__x58__x58_ ((Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__505, ((mc2 - mc1) - 1), B_dData_dList.C_List_Nil)))), (((v_ctxEnvAt dtb__504) (mc1 + 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1059 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxEnv = (fun (mc0 : t_Ctx) -> (match mc0 with
  | { f_Ctx_ctxItems = dtb__507; f_Ctx_ctxEnvF = dtb__508; f_Ctx_ctxRefVals = dtb__509; f_Ctx_ctxDepthF = dtb__510; f_Ctx_ctxEnvRF = dtb__511 } -> dtb__508
  | _ -> failwith "DT: impossible branch"
))

# 1063 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxEnvRefined = (fun (ctx : t_Ctx) -> (ctx).f_Ctx_ctxEnvRF)

# 1091 "Vuna/Compiler/Elab/Types.vuna"
let rec v_refineLookup = (fun (mc0 : int) (mc1 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__512, dtb__513) -> (match dtb__512 with
  | { B_dData_dPair.f_Pair_first = dtb__514; B_dData_dPair.f_Pair_second = dtb__515 } -> (if (dtb__514 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__515)) else ((v_refineLookup mc0) dtb__513))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1068 "Vuna/Compiler/Elab/Types.vuna"
let rec v_refineValue = (fun (mc0 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : Core_dTerm.t_Value) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> (if (mc1 <= 0) then mc2 else (match mc2 with
  | Core_dTerm.C_Value_VNeutral (dtb__516) -> (match dtb__516 with
  | Core_dTerm.C_Neutral_NVar (dtb__517, dtb__518, dtb__519) -> (let sp2 = ((B_dData_dList.v_map ((v_refineValue mc0) (mc1 - 1))) dtb__519) in (match ((v_refineLookup dtb__518) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__520) -> ((Core_dEval.v_applySpine (((v_refineValue mc0) (mc1 - 1)) dtb__520)) sp2)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__517, dtb__518, sp2))))
  | _ -> failwith "DT: impossible branch"
))
  | Core_dTerm.C_Neutral_NGlobal (dtb__521, dtb__522) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb__521, ((B_dData_dList.v_map ((v_refineValue mc0) (mc1 - 1))) dtb__522)))))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VCon (dtb__523, dtb__524) -> (Core_dTerm.C_Value_VCon (dtb__523, ((B_dData_dList.v_map ((v_refineValue mc0) (mc1 - 1))) dtb__524)))
  | Core_dTerm.C_Value_VApp (dtb__525, dtb__526) -> (Core_dTerm.C_Value_VApp ((((v_refineValue mc0) (mc1 - 1)) dtb__525), (((v_refineValue mc0) (mc1 - 1)) dtb__526)))
  | Core_dTerm.C_Value_VCase (dtb__527, dtb__528) -> (Core_dTerm.C_Value_VCase ((((v_refineValue mc0) (mc1 - 1)) dtb__527), dtb__528))
  | Core_dTerm.C_Value_VIf (dtb__529, dtb__530, dtb__531) -> (Core_dTerm.C_Value_VIf ((((v_refineValue mc0) (mc1 - 1)) dtb__529), (((v_refineValue mc0) (mc1 - 1)) dtb__530), (((v_refineValue mc0) (mc1 - 1)) dtb__531)))
  | Core_dTerm.C_Value_VMeta (dtb__532, dtb__533) -> (Core_dTerm.C_Value_VMeta (dtb__532, ((B_dData_dList.v_map ((v_refineValue mc0) (mc1 - 1))) dtb__533)))
  | _ -> mc2
))
))

# 1047 "Vuna/Compiler/Elab/Types.vuna"
let v_refinedEnv = (fun (mc0 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> ((B_dData_dList.v_map ((v_refineValue mc0) Core_dTerm.v_defaultFuel)) mc1)
))

# 1032 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxRefine = (fun (mc0 : t_Ctx) (mc1 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | { f_Ctx_ctxItems = dtb__534; f_Ctx_ctxEnvF = dtb__535; f_Ctx_ctxRefVals = dtb__536; f_Ctx_ctxDepthF = dtb__537; f_Ctx_ctxEnvRF = dtb__538 } -> (let refs2 = ((B_dData_dList.v_append dtb__536) mc1) in { f_Ctx_ctxItems = dtb__534; f_Ctx_ctxEnvF = dtb__535; f_Ctx_ctxRefVals = refs2; f_Ctx_ctxDepthF = dtb__537; f_Ctx_ctxEnvRF = ((v_refinedEnv refs2) dtb__535) })
  | _ -> failwith "DT: impossible branch"
))

# 1096 "Vuna/Compiler/Elab/Types.vuna"
let v_evalCtx = (fun (ctx : t_Ctx) (ty : Core_dTerm.t_Term) -> ((Core_dEval.v_eval (v_ctxEnvRefined ctx)) ty))

# 1101 "Vuna/Compiler/Elab/Types.vuna"
let v_varTypeValue = (fun (ctx : t_Ctx) (idx : int) (ty : Core_dTerm.t_Term) -> ((Core_dEval.v_eval (v_ctxEnvRefined ctx)) (((Core_dTerm.v_shift 0) (idx + 1)) ty)))

# 1104 "Vuna/Compiler/Elab/Types.vuna"
let v_emptyCtx = { f_Ctx_ctxItems = B_dData_dList.C_List_Nil; f_Ctx_ctxEnvF = B_dData_dList.C_List_Nil; f_Ctx_ctxRefVals = B_dData_dList.C_List_Nil; f_Ctx_ctxDepthF = 0; f_Ctx_ctxEnvRF = B_dData_dList.C_List_Nil }

# 1110 "Vuna/Compiler/Elab/Types.vuna"
let v_errAt = (fun (sp : Base_dSource.t_Span) (msg : string) -> ((Base_dDiag.v_rawAt sp) msg))

# 1114 "Vuna/Compiler/Elab/Types.vuna"
let v_newMeta = (fun (mc0 : t_Ctx) (mc1 : t_Ec) -> (match mc1 with
  | { f_Ec_ecNext = dtb__539; f_Ec_ecSols = dtb__540; f_Ec_ecDefsRev = dtb__541; f_Ec_ecDatas = dtb__542; f_Ec_ecDepthOfMeta = dtb__543; f_Ec_ecGoals = dtb__544; f_Ec_ecInsts = dtb__545; f_Ec_ecClasses = dtb__546; f_Ec_ecConstraints = dtb__547; f_Ec_ecDefTbl = dtb__548; f_Ec_ecGlobalsTbl = dtb__549; f_Ec_ecSolTbl = dtb__550; f_Ec_ecDepthTbl = dtb__551; f_Ec_ecGlobalsComplete = dtb__552; f_Ec_ecClausesTbl = dtb__553; f_Ec_ecCtorTbl = dtb__554; f_Ec_ecHasLinear = dtb__555; f_Ec_ecMetaSpans = dtb__556; f_Ec_ecUseSpans = dtb__557; f_Ec_ecWarnings = dtb__558; f_Ec_ecCounters = dtb__559; f_Ec_ecErrors = dtb__560 } -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TMeta (dtb__539)); B_dData_dPair.f_Pair_second = { f_Ec_ecNext = (dtb__539 + 1); f_Ec_ecSols = dtb__540; f_Ec_ecDefsRev = dtb__541; f_Ec_ecDatas = dtb__542; f_Ec_ecDepthOfMeta = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__539; B_dData_dPair.f_Pair_second = (v_ctxDepth mc0) }, dtb__543)); f_Ec_ecGoals = dtb__544; f_Ec_ecInsts = dtb__545; f_Ec_ecClasses = dtb__546; f_Ec_ecConstraints = dtb__547; f_Ec_ecDefTbl = dtb__548; f_Ec_ecGlobalsTbl = dtb__549; f_Ec_ecSolTbl = dtb__550; f_Ec_ecDepthTbl = (((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb__539) (v_ctxDepth mc0)) dtb__551); f_Ec_ecGlobalsComplete = dtb__552; f_Ec_ecClausesTbl = dtb__553; f_Ec_ecCtorTbl = dtb__554; f_Ec_ecHasLinear = dtb__555; f_Ec_ecMetaSpans = dtb__556; f_Ec_ecUseSpans = dtb__557; f_Ec_ecWarnings = dtb__558; f_Ec_ecCounters = dtb__559; f_Ec_ecErrors = dtb__560 } }
  | _ -> failwith "DT: impossible branch"
))

# 1162 "Vuna/Compiler/Elab/Types.vuna"
let v_solsToTbl = (fun (sols : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) sols) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil)))

# 1165 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutDefTbl = (fun (mc0 : t_Ec) (mc1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | { f_Ec_ecNext = dtb__561; f_Ec_ecSols = dtb__562; f_Ec_ecDefsRev = dtb__563; f_Ec_ecDatas = dtb__564; f_Ec_ecDepthOfMeta = dtb__565; f_Ec_ecGoals = dtb__566; f_Ec_ecInsts = dtb__567; f_Ec_ecClasses = dtb__568; f_Ec_ecConstraints = dtb__569; f_Ec_ecDefTbl = dtb__570; f_Ec_ecGlobalsTbl = dtb__571; f_Ec_ecSolTbl = dtb__572; f_Ec_ecDepthTbl = dtb__573; f_Ec_ecGlobalsComplete = dtb__574; f_Ec_ecClausesTbl = dtb__575; f_Ec_ecCtorTbl = dtb__576; f_Ec_ecHasLinear = dtb__577; f_Ec_ecMetaSpans = dtb__578; f_Ec_ecUseSpans = dtb__579; f_Ec_ecWarnings = dtb__580; f_Ec_ecCounters = dtb__581; f_Ec_ecErrors = dtb__582 } -> { f_Ec_ecNext = dtb__561; f_Ec_ecSols = dtb__562; f_Ec_ecDefsRev = dtb__563; f_Ec_ecDatas = dtb__564; f_Ec_ecDepthOfMeta = dtb__565; f_Ec_ecGoals = dtb__566; f_Ec_ecInsts = dtb__567; f_Ec_ecClasses = dtb__568; f_Ec_ecConstraints = dtb__569; f_Ec_ecDefTbl = mc1; f_Ec_ecGlobalsTbl = dtb__571; f_Ec_ecSolTbl = dtb__572; f_Ec_ecDepthTbl = dtb__573; f_Ec_ecGlobalsComplete = dtb__574; f_Ec_ecClausesTbl = dtb__575; f_Ec_ecCtorTbl = dtb__576; f_Ec_ecHasLinear = dtb__577; f_Ec_ecMetaSpans = dtb__578; f_Ec_ecUseSpans = dtb__579; f_Ec_ecWarnings = dtb__580; f_Ec_ecCounters = dtb__581; f_Ec_ecErrors = dtb__582 }
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Elab/Types.vuna"
let v_dtCtorName = (fun (p : t_DtCtor) -> (match p with
  | { f_DtCtor_dtCtorName = dtb__583; f_DtCtor_dtCtorFamily = dtb__584; f_DtCtor_dtCtorTelescope = dtb__585; f_DtCtor_dtCtorType = dtb__586; f_DtCtor_dtCtorSpan = dtb__587 } -> dtb__583
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Elab/Types.vuna"
let v_dtCtorFamily = (fun (p : t_DtCtor) -> (match p with
  | { f_DtCtor_dtCtorName = dtb__588; f_DtCtor_dtCtorFamily = dtb__589; f_DtCtor_dtCtorTelescope = dtb__590; f_DtCtor_dtCtorType = dtb__591; f_DtCtor_dtCtorSpan = dtb__592 } -> dtb__589
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Elab/Types.vuna"
let v_dtCtorTelescope = (fun (p : t_DtCtor) -> (match p with
  | { f_DtCtor_dtCtorName = dtb__593; f_DtCtor_dtCtorFamily = dtb__594; f_DtCtor_dtCtorTelescope = dtb__595; f_DtCtor_dtCtorType = dtb__596; f_DtCtor_dtCtorSpan = dtb__597 } -> dtb__595
  | _ -> failwith "DT: impossible branch"
))

# 68 "Vuna/Compiler/Elab/Types.vuna"
let v_dtCtorType = (fun (p : t_DtCtor) -> (match p with
  | { f_DtCtor_dtCtorName = dtb__598; f_DtCtor_dtCtorFamily = dtb__599; f_DtCtor_dtCtorTelescope = dtb__600; f_DtCtor_dtCtorType = dtb__601; f_DtCtor_dtCtorSpan = dtb__602 } -> dtb__601
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Elab/Types.vuna"
let v_dtCtorSpan = (fun (p : t_DtCtor) -> (match p with
  | { f_DtCtor_dtCtorName = dtb__603; f_DtCtor_dtCtorFamily = dtb__604; f_DtCtor_dtCtorTelescope = dtb__605; f_DtCtor_dtCtorType = dtb__606; f_DtCtor_dtCtorSpan = dtb__607 } -> dtb__607
  | _ -> failwith "DT: impossible branch"
))

# 76 "Vuna/Compiler/Elab/Types.vuna"
let v_dtFieldName = (fun (p : t_DtFieldMeta) -> (match p with
  | { f_DtFieldMeta_dtFieldName = dtb__608; f_DtFieldMeta_dtFieldIndex = dtb__609; f_DtFieldMeta_dtFieldType = dtb__610 } -> dtb__608
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Elab/Types.vuna"
let v_dtFieldIndex = (fun (p : t_DtFieldMeta) -> (match p with
  | { f_DtFieldMeta_dtFieldName = dtb__611; f_DtFieldMeta_dtFieldIndex = dtb__612; f_DtFieldMeta_dtFieldType = dtb__613 } -> dtb__612
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Elab/Types.vuna"
let v_dtFieldType = (fun (p : t_DtFieldMeta) -> (match p with
  | { f_DtFieldMeta_dtFieldName = dtb__614; f_DtFieldMeta_dtFieldIndex = dtb__615; f_DtFieldMeta_dtFieldType = dtb__616 } -> dtb__616
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataName = (fun (p : t_DtData) -> (match p with
  | { f_DtData_dtDataName = dtb__617; f_DtData_dtDataParams = dtb__618; f_DtData_dtDataCtors = dtb__619; f_DtData_dtDataKind = dtb__620; f_DtData_dtDataViaClasses = dtb__621; f_DtData_dtDataLinear = dtb__622; f_DtData_dtDataRepr = dtb__623; f_DtData_dtDataFields = dtb__624; f_DtData_dtDataIsRecord = dtb__625 } -> dtb__617
  | _ -> failwith "DT: impossible branch"
))

# 741 "Vuna/Compiler/Elab/Types.vuna"
let rec v_memDataNameIn = (fun (mc0 : string) (mc1 : t_DtData B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__626, dtb__627) -> (if ((v_dtDataName dtb__626) = mc0) then true else ((v_memDataNameIn mc0) dtb__627))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 748 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddDef = (fun (mc0 : t_Ec) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (match mc0 with
  | { f_Ec_ecNext = dtb__628; f_Ec_ecSols = dtb__629; f_Ec_ecDefsRev = dtb__630; f_Ec_ecDatas = dtb__631; f_Ec_ecDepthOfMeta = dtb__632; f_Ec_ecGoals = dtb__633; f_Ec_ecInsts = dtb__634; f_Ec_ecClasses = dtb__635; f_Ec_ecConstraints = dtb__636; f_Ec_ecDefTbl = dtb__637; f_Ec_ecGlobalsTbl = dtb__638; f_Ec_ecSolTbl = dtb__639; f_Ec_ecDepthTbl = dtb__640; f_Ec_ecGlobalsComplete = dtb__641; f_Ec_ecClausesTbl = dtb__642; f_Ec_ecCtorTbl = dtb__643; f_Ec_ecHasLinear = dtb__644; f_Ec_ecMetaSpans = dtb__645; f_Ec_ecUseSpans = dtb__646; f_Ec_ecWarnings = dtb__647; f_Ec_ecCounters = dtb__648; f_Ec_ecErrors = dtb__649 } -> (let delta = (if ((v_memDataNameIn (B_dData_dPair.v_firstOf mc1)) dtb__631) then dtb__637 else (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (B_dData_dPair.v_firstOf mc1)) (B_dData_dPair.v_secondOf mc1)) dtb__637)) in { f_Ec_ecNext = dtb__628; f_Ec_ecSols = dtb__629; f_Ec_ecDefsRev = (B_dData_dList.C_List__x58__x58_ (mc1, dtb__630)); f_Ec_ecDatas = dtb__631; f_Ec_ecDepthOfMeta = dtb__632; f_Ec_ecGoals = dtb__633; f_Ec_ecInsts = dtb__634; f_Ec_ecClasses = dtb__635; f_Ec_ecConstraints = dtb__636; f_Ec_ecDefTbl = delta; f_Ec_ecGlobalsTbl = dtb__638; f_Ec_ecSolTbl = dtb__639; f_Ec_ecDepthTbl = dtb__640; f_Ec_ecGlobalsComplete = dtb__641; f_Ec_ecClausesTbl = dtb__642; f_Ec_ecCtorTbl = dtb__643; f_Ec_ecHasLinear = dtb__644; f_Ec_ecMetaSpans = dtb__645; f_Ec_ecUseSpans = dtb__646; f_Ec_ecWarnings = dtb__647; f_Ec_ecCounters = dtb__648; f_Ec_ecErrors = dtb__649 })
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataParams = (fun (p : t_DtData) -> (match p with
  | { f_DtData_dtDataName = dtb__650; f_DtData_dtDataParams = dtb__651; f_DtData_dtDataCtors = dtb__652; f_DtData_dtDataKind = dtb__653; f_DtData_dtDataViaClasses = dtb__654; f_DtData_dtDataLinear = dtb__655; f_DtData_dtDataRepr = dtb__656; f_DtData_dtDataFields = dtb__657; f_DtData_dtDataIsRecord = dtb__658 } -> dtb__651
  | _ -> failwith "DT: impossible branch"
))

# 84 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataCtors = (fun (p : t_DtData) -> (match p with
  | { f_DtData_dtDataName = dtb__659; f_DtData_dtDataParams = dtb__660; f_DtData_dtDataCtors = dtb__661; f_DtData_dtDataKind = dtb__662; f_DtData_dtDataViaClasses = dtb__663; f_DtData_dtDataLinear = dtb__664; f_DtData_dtDataRepr = dtb__665; f_DtData_dtDataFields = dtb__666; f_DtData_dtDataIsRecord = dtb__667 } -> dtb__661
  | _ -> failwith "DT: impossible branch"
))

# 836 "Vuna/Compiler/Elab/Types.vuna"
let v_dataCtorPairs = (fun (d : t_DtData) -> ((B_dData_dList.v_map (fun (c : t_DtCtor) -> { B_dData_dPair.f_Pair_first = (v_dtCtorName c); B_dData_dPair.f_Pair_second = c })) (v_dtDataCtors d)))

# 833 "Vuna/Compiler/Elab/Types.vuna"
let v_ctorTblOfDatas = (fun (datas : t_DtData B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_concatMap v_dataCtorPairs) datas)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 85 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataKind = (fun (p : t_DtData) -> (match p with
  | { f_DtData_dtDataName = dtb__668; f_DtData_dtDataParams = dtb__669; f_DtData_dtDataCtors = dtb__670; f_DtData_dtDataKind = dtb__671; f_DtData_dtDataViaClasses = dtb__672; f_DtData_dtDataLinear = dtb__673; f_DtData_dtDataRepr = dtb__674; f_DtData_dtDataFields = dtb__675; f_DtData_dtDataIsRecord = dtb__676 } -> dtb__671
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataViaClasses = (fun (p : t_DtData) -> (match p with
  | { f_DtData_dtDataName = dtb__677; f_DtData_dtDataParams = dtb__678; f_DtData_dtDataCtors = dtb__679; f_DtData_dtDataKind = dtb__680; f_DtData_dtDataViaClasses = dtb__681; f_DtData_dtDataLinear = dtb__682; f_DtData_dtDataRepr = dtb__683; f_DtData_dtDataFields = dtb__684; f_DtData_dtDataIsRecord = dtb__685 } -> dtb__681
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataLinear = (fun (p : t_DtData) -> (match p with
  | { f_DtData_dtDataName = dtb__686; f_DtData_dtDataParams = dtb__687; f_DtData_dtDataCtors = dtb__688; f_DtData_dtDataKind = dtb__689; f_DtData_dtDataViaClasses = dtb__690; f_DtData_dtDataLinear = dtb__691; f_DtData_dtDataRepr = dtb__692; f_DtData_dtDataFields = dtb__693; f_DtData_dtDataIsRecord = dtb__694 } -> dtb__691
  | _ -> failwith "DT: impossible branch"
))

# 806 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddData = (fun (mc0 : t_Ec) (mc1 : t_DtData) -> (match mc0 with
  | { f_Ec_ecNext = dtb__695; f_Ec_ecSols = dtb__696; f_Ec_ecDefsRev = dtb__697; f_Ec_ecDatas = dtb__698; f_Ec_ecDepthOfMeta = dtb__699; f_Ec_ecGoals = dtb__700; f_Ec_ecInsts = dtb__701; f_Ec_ecClasses = dtb__702; f_Ec_ecConstraints = dtb__703; f_Ec_ecDefTbl = dtb__704; f_Ec_ecGlobalsTbl = dtb__705; f_Ec_ecSolTbl = dtb__706; f_Ec_ecDepthTbl = dtb__707; f_Ec_ecGlobalsComplete = dtb__708; f_Ec_ecClausesTbl = dtb__709; f_Ec_ecCtorTbl = dtb__710; f_Ec_ecHasLinear = dtb__711; f_Ec_ecMetaSpans = dtb__712; f_Ec_ecUseSpans = dtb__713; f_Ec_ecWarnings = dtb__714; f_Ec_ecCounters = dtb__715; f_Ec_ecErrors = dtb__716 } -> { f_Ec_ecNext = dtb__695; f_Ec_ecSols = dtb__696; f_Ec_ecDefsRev = dtb__697; f_Ec_ecDatas = ((B_dData_dList.v_append dtb__698) (B_dData_dList.C_List__x58__x58_ (mc1, B_dData_dList.C_List_Nil))); f_Ec_ecDepthOfMeta = dtb__699; f_Ec_ecGoals = dtb__700; f_Ec_ecInsts = dtb__701; f_Ec_ecClasses = dtb__702; f_Ec_ecConstraints = dtb__703; f_Ec_ecDefTbl = dtb__704; f_Ec_ecGlobalsTbl = dtb__705; f_Ec_ecSolTbl = dtb__706; f_Ec_ecDepthTbl = dtb__707; f_Ec_ecGlobalsComplete = dtb__708; f_Ec_ecClausesTbl = dtb__709; f_Ec_ecCtorTbl = ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (v_dataCtorPairs mc1)) dtb__710); f_Ec_ecHasLinear = (if (v_dtDataLinear mc1) then true else dtb__711); f_Ec_ecMetaSpans = dtb__712; f_Ec_ecUseSpans = dtb__713; f_Ec_ecWarnings = dtb__714; f_Ec_ecCounters = dtb__715; f_Ec_ecErrors = dtb__716 }
  | _ -> failwith "DT: impossible branch"
))

# 991 "Vuna/Compiler/Elab/Types.vuna"
let rec v_datasHaveLinear = (fun (mc0 : t_DtData B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__717, dtb__718) -> (if (v_dtDataLinear dtb__717) then true else (v_datasHaveLinear dtb__718))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataRepr = (fun (p : t_DtData) -> (match p with
  | { f_DtData_dtDataName = dtb__719; f_DtData_dtDataParams = dtb__720; f_DtData_dtDataCtors = dtb__721; f_DtData_dtDataKind = dtb__722; f_DtData_dtDataViaClasses = dtb__723; f_DtData_dtDataLinear = dtb__724; f_DtData_dtDataRepr = dtb__725; f_DtData_dtDataFields = dtb__726; f_DtData_dtDataIsRecord = dtb__727 } -> dtb__725
  | _ -> failwith "DT: impossible branch"
))

# 92 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataFields = (fun (p : t_DtData) -> (match p with
  | { f_DtData_dtDataName = dtb__728; f_DtData_dtDataParams = dtb__729; f_DtData_dtDataCtors = dtb__730; f_DtData_dtDataKind = dtb__731; f_DtData_dtDataViaClasses = dtb__732; f_DtData_dtDataLinear = dtb__733; f_DtData_dtDataRepr = dtb__734; f_DtData_dtDataFields = dtb__735; f_DtData_dtDataIsRecord = dtb__736 } -> dtb__735
  | _ -> failwith "DT: impossible branch"
))

# 96 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataIsRecord = (fun (p : t_DtData) -> (match p with
  | { f_DtData_dtDataName = dtb__737; f_DtData_dtDataParams = dtb__738; f_DtData_dtDataCtors = dtb__739; f_DtData_dtDataKind = dtb__740; f_DtData_dtDataViaClasses = dtb__741; f_DtData_dtDataLinear = dtb__742; f_DtData_dtDataRepr = dtb__743; f_DtData_dtDataFields = dtb__744; f_DtData_dtDataIsRecord = dtb__745 } -> dtb__745
  | _ -> failwith "DT: impossible branch"
))

# 101 "Vuna/Compiler/Elab/Types.vuna"
let v_dtGoalMeta = (fun (p : t_DtGoal) -> (match p with
  | { f_DtGoal_dtGoalMeta = dtb__746; f_DtGoal_dtGoalSpan = dtb__747; f_DtGoal_dtGoalType = dtb__748; f_DtGoal_dtGoalCtx = dtb__749; f_DtGoal_dtGoalName = dtb__750 } -> dtb__746
  | _ -> failwith "DT: impossible branch"
))

# 102 "Vuna/Compiler/Elab/Types.vuna"
let v_dtGoalSpan = (fun (p : t_DtGoal) -> (match p with
  | { f_DtGoal_dtGoalMeta = dtb__751; f_DtGoal_dtGoalSpan = dtb__752; f_DtGoal_dtGoalType = dtb__753; f_DtGoal_dtGoalCtx = dtb__754; f_DtGoal_dtGoalName = dtb__755 } -> dtb__752
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Elab/Types.vuna"
let v_dtGoalType = (fun (p : t_DtGoal) -> (match p with
  | { f_DtGoal_dtGoalMeta = dtb__756; f_DtGoal_dtGoalSpan = dtb__757; f_DtGoal_dtGoalType = dtb__758; f_DtGoal_dtGoalCtx = dtb__759; f_DtGoal_dtGoalName = dtb__760 } -> dtb__758
  | _ -> failwith "DT: impossible branch"
))

# 104 "Vuna/Compiler/Elab/Types.vuna"
let v_dtGoalCtx = (fun (p : t_DtGoal) -> (match p with
  | { f_DtGoal_dtGoalMeta = dtb__761; f_DtGoal_dtGoalSpan = dtb__762; f_DtGoal_dtGoalType = dtb__763; f_DtGoal_dtGoalCtx = dtb__764; f_DtGoal_dtGoalName = dtb__765 } -> dtb__764
  | _ -> failwith "DT: impossible branch"
))

# 105 "Vuna/Compiler/Elab/Types.vuna"
let v_dtGoalName = (fun (p : t_DtGoal) -> (match p with
  | { f_DtGoal_dtGoalMeta = dtb__766; f_DtGoal_dtGoalSpan = dtb__767; f_DtGoal_dtGoalType = dtb__768; f_DtGoal_dtGoalCtx = dtb__769; f_DtGoal_dtGoalName = dtb__770 } -> dtb__770
  | _ -> failwith "DT: impossible branch"
))

# 109 "Vuna/Compiler/Elab/Types.vuna"
let v_dtClassName = (fun (p : t_DtClass) -> (match p with
  | { f_DtClass_dtClassName = dtb__771; f_DtClass_dtClassParams = dtb__772; f_DtClass_dtClassSupers = dtb__773; f_DtClass_dtClassMethods = dtb__774; f_DtClass_dtClassFieldTys = dtb__775; f_DtClass_dtClassMethodSpans = dtb__776 } -> dtb__771
  | _ -> failwith "DT: impossible branch"
))

# 110 "Vuna/Compiler/Elab/Types.vuna"
let v_dtClassParams = (fun (p : t_DtClass) -> (match p with
  | { f_DtClass_dtClassName = dtb__777; f_DtClass_dtClassParams = dtb__778; f_DtClass_dtClassSupers = dtb__779; f_DtClass_dtClassMethods = dtb__780; f_DtClass_dtClassFieldTys = dtb__781; f_DtClass_dtClassMethodSpans = dtb__782 } -> dtb__778
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Elab/Types.vuna"
let v_dtClassSupers = (fun (p : t_DtClass) -> (match p with
  | { f_DtClass_dtClassName = dtb__783; f_DtClass_dtClassParams = dtb__784; f_DtClass_dtClassSupers = dtb__785; f_DtClass_dtClassMethods = dtb__786; f_DtClass_dtClassFieldTys = dtb__787; f_DtClass_dtClassMethodSpans = dtb__788 } -> dtb__785
  | _ -> failwith "DT: impossible branch"
))

# 113 "Vuna/Compiler/Elab/Types.vuna"
let v_dtClassMethods = (fun (p : t_DtClass) -> (match p with
  | { f_DtClass_dtClassName = dtb__789; f_DtClass_dtClassParams = dtb__790; f_DtClass_dtClassSupers = dtb__791; f_DtClass_dtClassMethods = dtb__792; f_DtClass_dtClassFieldTys = dtb__793; f_DtClass_dtClassMethodSpans = dtb__794 } -> dtb__792
  | _ -> failwith "DT: impossible branch"
))

# 114 "Vuna/Compiler/Elab/Types.vuna"
let v_dtClassFieldTys = (fun (p : t_DtClass) -> (match p with
  | { f_DtClass_dtClassName = dtb__795; f_DtClass_dtClassParams = dtb__796; f_DtClass_dtClassSupers = dtb__797; f_DtClass_dtClassMethods = dtb__798; f_DtClass_dtClassFieldTys = dtb__799; f_DtClass_dtClassMethodSpans = dtb__800 } -> dtb__799
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Elab/Types.vuna"
let v_dtClassMethodSpans = (fun (p : t_DtClass) -> (match p with
  | { f_DtClass_dtClassName = dtb__801; f_DtClass_dtClassParams = dtb__802; f_DtClass_dtClassSupers = dtb__803; f_DtClass_dtClassMethods = dtb__804; f_DtClass_dtClassFieldTys = dtb__805; f_DtClass_dtClassMethodSpans = dtb__806 } -> dtb__806
  | _ -> failwith "DT: impossible branch"
))

# 123 "Vuna/Compiler/Elab/Types.vuna"
let v_dtInstName = (fun (p : t_DtInst) -> (match p with
  | { f_DtInst_dtInstName = dtb__807; f_DtInst_dtInstSym = dtb__808; f_DtInst_dtInstKey = dtb__809; f_DtInst_dtInstTele = dtb__810; f_DtInst_dtInstCtx = dtb__811; f_DtInst_dtInstHead = dtb__812; f_DtInst_dtInstSpan = dtb__813 } -> dtb__807
  | _ -> failwith "DT: impossible branch"
))

# 125 "Vuna/Compiler/Elab/Types.vuna"
let v_dtInstSym = (fun (p : t_DtInst) -> (match p with
  | { f_DtInst_dtInstName = dtb__814; f_DtInst_dtInstSym = dtb__815; f_DtInst_dtInstKey = dtb__816; f_DtInst_dtInstTele = dtb__817; f_DtInst_dtInstCtx = dtb__818; f_DtInst_dtInstHead = dtb__819; f_DtInst_dtInstSpan = dtb__820 } -> dtb__815
  | _ -> failwith "DT: impossible branch"
))

# 421 "Vuna/Compiler/Elab/Types.vuna"
let rec v_allBucketsMatch = (fun (mc0 : t_DtInst B_dData_dList.t_List) (mc1 : (string, t_DtInst B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__821, dtb__822) -> (match dtb__821 with
  | { B_dData_dPair.f_Pair_first = dtb__823; B_dData_dPair.f_Pair_second = dtb__824 } -> (if ((v_instNamesEq ((B_dData_dList.v_map v_dtInstSym) dtb__824)) ((B_dData_dList.v_map v_dtInstSym) ((B_dData_dList.v_filter (fun (i : t_DtInst) -> ((v_instFamilyOf i) = dtb__823))) mc0))) then ((v_allBucketsMatch mc0) dtb__822) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 408 "Vuna/Compiler/Elab/Types.vuna"
let v_ecInstsAudit = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__825; f_Ec_ecSols = dtb__826; f_Ec_ecDefsRev = dtb__827; f_Ec_ecDatas = dtb__828; f_Ec_ecDepthOfMeta = dtb__829; f_Ec_ecGoals = dtb__830; f_Ec_ecInsts = dtb__831; f_Ec_ecClasses = dtb__832; f_Ec_ecConstraints = dtb__833; f_Ec_ecDefTbl = dtb__834; f_Ec_ecGlobalsTbl = dtb__835; f_Ec_ecSolTbl = dtb__836; f_Ec_ecDepthTbl = dtb__837; f_Ec_ecGlobalsComplete = dtb__838; f_Ec_ecClausesTbl = dtb__839; f_Ec_ecCtorTbl = dtb__840; f_Ec_ecHasLinear = dtb__841; f_Ec_ecMetaSpans = dtb__842; f_Ec_ecUseSpans = dtb__843; f_Ec_ecWarnings = dtb__844; f_Ec_ecCounters = dtb__845; f_Ec_ecErrors = dtb__846 } -> (let pairs = (B_dContainer_dHashMap.v_toList (dtb__831).f_InstStore_instsByFamily) in (let list = (dtb__831).f_InstStore_instsList in (if ((v_bucketCount pairs) = (B_dData_dList.v_length list)) then ((v_allBucketsMatch list) pairs) else false)))
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Elab/Types.vuna"
let v_dtInstKey = (fun (p : t_DtInst) -> (match p with
  | { f_DtInst_dtInstName = dtb__847; f_DtInst_dtInstSym = dtb__848; f_DtInst_dtInstKey = dtb__849; f_DtInst_dtInstTele = dtb__850; f_DtInst_dtInstCtx = dtb__851; f_DtInst_dtInstHead = dtb__852; f_DtInst_dtInstSpan = dtb__853 } -> dtb__849
  | _ -> failwith "DT: impossible branch"
))

# 129 "Vuna/Compiler/Elab/Types.vuna"
let v_dtInstTele = (fun (p : t_DtInst) -> (match p with
  | { f_DtInst_dtInstName = dtb__854; f_DtInst_dtInstSym = dtb__855; f_DtInst_dtInstKey = dtb__856; f_DtInst_dtInstTele = dtb__857; f_DtInst_dtInstCtx = dtb__858; f_DtInst_dtInstHead = dtb__859; f_DtInst_dtInstSpan = dtb__860 } -> dtb__857
  | _ -> failwith "DT: impossible branch"
))

# 130 "Vuna/Compiler/Elab/Types.vuna"
let v_dtInstCtx = (fun (p : t_DtInst) -> (match p with
  | { f_DtInst_dtInstName = dtb__861; f_DtInst_dtInstSym = dtb__862; f_DtInst_dtInstKey = dtb__863; f_DtInst_dtInstTele = dtb__864; f_DtInst_dtInstCtx = dtb__865; f_DtInst_dtInstHead = dtb__866; f_DtInst_dtInstSpan = dtb__867 } -> dtb__865
  | _ -> failwith "DT: impossible branch"
))

# 131 "Vuna/Compiler/Elab/Types.vuna"
let v_dtInstHead = (fun (p : t_DtInst) -> (match p with
  | { f_DtInst_dtInstName = dtb__868; f_DtInst_dtInstSym = dtb__869; f_DtInst_dtInstKey = dtb__870; f_DtInst_dtInstTele = dtb__871; f_DtInst_dtInstCtx = dtb__872; f_DtInst_dtInstHead = dtb__873; f_DtInst_dtInstSpan = dtb__874 } -> dtb__873
  | _ -> failwith "DT: impossible branch"
))

# 132 "Vuna/Compiler/Elab/Types.vuna"
let v_dtInstSpan = (fun (p : t_DtInst) -> (match p with
  | { f_DtInst_dtInstName = dtb__875; f_DtInst_dtInstSym = dtb__876; f_DtInst_dtInstKey = dtb__877; f_DtInst_dtInstTele = dtb__878; f_DtInst_dtInstCtx = dtb__879; f_DtInst_dtInstHead = dtb__880; f_DtInst_dtInstSpan = dtb__881 } -> dtb__881
  | _ -> failwith "DT: impossible branch"
))

# 154 "Vuna/Compiler/Elab/Types.vuna"
let v_instsList = (fun (p : t_InstStore) -> (match p with
  | { f_InstStore_instsList = dtb__882; f_InstStore_instsByFamily = dtb__883 } -> dtb__882
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Elab/Types.vuna"
let v_instsByFamily = (fun (p : t_InstStore) -> (match p with
  | { f_InstStore_instsList = dtb__884; f_InstStore_instsByFamily = dtb__885 } -> dtb__885
  | _ -> failwith "DT: impossible branch"
))

# 209 "Vuna/Compiler/Elab/Types.vuna"
let v_conId = (fun (p : t_Constraint) -> (match p with
  | { f_Constraint_conId = dtb__886; f_Constraint_conKind = dtb__887; f_Constraint_conMeta = dtb__888; f_Constraint_conDom = dtb__889; f_Constraint_conSpan = dtb__890; f_Constraint_conDepth = dtb__891 } -> dtb__886
  | _ -> failwith "DT: impossible branch"
))

# 210 "Vuna/Compiler/Elab/Types.vuna"
let v_conKind = (fun (p : t_Constraint) -> (match p with
  | { f_Constraint_conId = dtb__892; f_Constraint_conKind = dtb__893; f_Constraint_conMeta = dtb__894; f_Constraint_conDom = dtb__895; f_Constraint_conSpan = dtb__896; f_Constraint_conDepth = dtb__897 } -> dtb__893
  | _ -> failwith "DT: impossible branch"
))

# 211 "Vuna/Compiler/Elab/Types.vuna"
let v_conMeta = (fun (p : t_Constraint) -> (match p with
  | { f_Constraint_conId = dtb__898; f_Constraint_conKind = dtb__899; f_Constraint_conMeta = dtb__900; f_Constraint_conDom = dtb__901; f_Constraint_conSpan = dtb__902; f_Constraint_conDepth = dtb__903 } -> dtb__900
  | _ -> failwith "DT: impossible branch"
))

# 212 "Vuna/Compiler/Elab/Types.vuna"
let v_conDom = (fun (p : t_Constraint) -> (match p with
  | { f_Constraint_conId = dtb__904; f_Constraint_conKind = dtb__905; f_Constraint_conMeta = dtb__906; f_Constraint_conDom = dtb__907; f_Constraint_conSpan = dtb__908; f_Constraint_conDepth = dtb__909 } -> dtb__907
  | _ -> failwith "DT: impossible branch"
))

# 213 "Vuna/Compiler/Elab/Types.vuna"
let v_conSpan = (fun (p : t_Constraint) -> (match p with
  | { f_Constraint_conId = dtb__910; f_Constraint_conKind = dtb__911; f_Constraint_conMeta = dtb__912; f_Constraint_conDom = dtb__913; f_Constraint_conSpan = dtb__914; f_Constraint_conDepth = dtb__915 } -> dtb__914
  | _ -> failwith "DT: impossible branch"
))

# 214 "Vuna/Compiler/Elab/Types.vuna"
let v_conDepth = (fun (p : t_Constraint) -> (match p with
  | { f_Constraint_conId = dtb__916; f_Constraint_conKind = dtb__917; f_Constraint_conMeta = dtb__918; f_Constraint_conDom = dtb__919; f_Constraint_conSpan = dtb__920; f_Constraint_conDepth = dtb__921 } -> dtb__921
  | _ -> failwith "DT: impossible branch"
))

# 219 "Vuna/Compiler/Elab/Types.vuna"
let v_csPending = (fun (p : t_ConstraintStore) -> (match p with
  | { f_ConstraintStore_csPending = dtb__922; f_ConstraintStore_csNextId = dtb__923; f_ConstraintStore_csTried = dtb__924; f_ConstraintStore_csSolsCount = dtb__925; f_ConstraintStore_csPassNext = dtb__926; f_ConstraintStore_csPassSols = dtb__927; f_ConstraintStore_csCtorIndexComplete = dtb__928 } -> dtb__922
  | _ -> failwith "DT: impossible branch"
))

# 220 "Vuna/Compiler/Elab/Types.vuna"
let v_csNextId = (fun (p : t_ConstraintStore) -> (match p with
  | { f_ConstraintStore_csPending = dtb__929; f_ConstraintStore_csNextId = dtb__930; f_ConstraintStore_csTried = dtb__931; f_ConstraintStore_csSolsCount = dtb__932; f_ConstraintStore_csPassNext = dtb__933; f_ConstraintStore_csPassSols = dtb__934; f_ConstraintStore_csCtorIndexComplete = dtb__935 } -> dtb__930
  | _ -> failwith "DT: impossible branch"
))

# 224 "Vuna/Compiler/Elab/Types.vuna"
let v_csTried = (fun (p : t_ConstraintStore) -> (match p with
  | { f_ConstraintStore_csPending = dtb__936; f_ConstraintStore_csNextId = dtb__937; f_ConstraintStore_csTried = dtb__938; f_ConstraintStore_csSolsCount = dtb__939; f_ConstraintStore_csPassNext = dtb__940; f_ConstraintStore_csPassSols = dtb__941; f_ConstraintStore_csCtorIndexComplete = dtb__942 } -> dtb__938
  | _ -> failwith "DT: impossible branch"
))

# 226 "Vuna/Compiler/Elab/Types.vuna"
let v_csSolsCount = (fun (p : t_ConstraintStore) -> (match p with
  | { f_ConstraintStore_csPending = dtb__943; f_ConstraintStore_csNextId = dtb__944; f_ConstraintStore_csTried = dtb__945; f_ConstraintStore_csSolsCount = dtb__946; f_ConstraintStore_csPassNext = dtb__947; f_ConstraintStore_csPassSols = dtb__948; f_ConstraintStore_csCtorIndexComplete = dtb__949 } -> dtb__946
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Elab/Types.vuna"
let v_csPassNext = (fun (p : t_ConstraintStore) -> (match p with
  | { f_ConstraintStore_csPending = dtb__950; f_ConstraintStore_csNextId = dtb__951; f_ConstraintStore_csTried = dtb__952; f_ConstraintStore_csSolsCount = dtb__953; f_ConstraintStore_csPassNext = dtb__954; f_ConstraintStore_csPassSols = dtb__955; f_ConstraintStore_csCtorIndexComplete = dtb__956 } -> dtb__954
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Elab/Types.vuna"
let v_csPassSols = (fun (p : t_ConstraintStore) -> (match p with
  | { f_ConstraintStore_csPending = dtb__957; f_ConstraintStore_csNextId = dtb__958; f_ConstraintStore_csTried = dtb__959; f_ConstraintStore_csSolsCount = dtb__960; f_ConstraintStore_csPassNext = dtb__961; f_ConstraintStore_csPassSols = dtb__962; f_ConstraintStore_csCtorIndexComplete = dtb__963 } -> dtb__962
  | _ -> failwith "DT: impossible branch"
))

# 232 "Vuna/Compiler/Elab/Types.vuna"
let v_csCtorIndexComplete = (fun (p : t_ConstraintStore) -> (match p with
  | { f_ConstraintStore_csPending = dtb__964; f_ConstraintStore_csNextId = dtb__965; f_ConstraintStore_csTried = dtb__966; f_ConstraintStore_csSolsCount = dtb__967; f_ConstraintStore_csPassNext = dtb__968; f_ConstraintStore_csPassSols = dtb__969; f_ConstraintStore_csCtorIndexComplete = dtb__970 } -> dtb__970
  | _ -> failwith "DT: impossible branch"
))

# 243 "Vuna/Compiler/Elab/Types.vuna"
let v_ecNext = (fun (p : t_Ec) -> (match p with
  | { f_Ec_ecNext = dtb__971; f_Ec_ecSols = dtb__972; f_Ec_ecDefsRev = dtb__973; f_Ec_ecDatas = dtb__974; f_Ec_ecDepthOfMeta = dtb__975; f_Ec_ecGoals = dtb__976; f_Ec_ecInsts = dtb__977; f_Ec_ecClasses = dtb__978; f_Ec_ecConstraints = dtb__979; f_Ec_ecDefTbl = dtb__980; f_Ec_ecGlobalsTbl = dtb__981; f_Ec_ecSolTbl = dtb__982; f_Ec_ecDepthTbl = dtb__983; f_Ec_ecGlobalsComplete = dtb__984; f_Ec_ecClausesTbl = dtb__985; f_Ec_ecCtorTbl = dtb__986; f_Ec_ecHasLinear = dtb__987; f_Ec_ecMetaSpans = dtb__988; f_Ec_ecUseSpans = dtb__989; f_Ec_ecWarnings = dtb__990; f_Ec_ecCounters = dtb__991; f_Ec_ecErrors = dtb__992 } -> dtb__971
  | _ -> failwith "DT: impossible branch"
))

# 244 "Vuna/Compiler/Elab/Types.vuna"
let v_ecSols = (fun (p : t_Ec) -> (match p with
  | { f_Ec_ecNext = dtb__993; f_Ec_ecSols = dtb__994; f_Ec_ecDefsRev = dtb__995; f_Ec_ecDatas = dtb__996; f_Ec_ecDepthOfMeta = dtb__997; f_Ec_ecGoals = dtb__998; f_Ec_ecInsts = dtb__999; f_Ec_ecClasses = dtb__1000; f_Ec_ecConstraints = dtb__1001; f_Ec_ecDefTbl = dtb__1002; f_Ec_ecGlobalsTbl = dtb__1003; f_Ec_ecSolTbl = dtb__1004; f_Ec_ecDepthTbl = dtb__1005; f_Ec_ecGlobalsComplete = dtb__1006; f_Ec_ecClausesTbl = dtb__1007; f_Ec_ecCtorTbl = dtb__1008; f_Ec_ecHasLinear = dtb__1009; f_Ec_ecMetaSpans = dtb__1010; f_Ec_ecUseSpans = dtb__1011; f_Ec_ecWarnings = dtb__1012; f_Ec_ecCounters = dtb__1013; f_Ec_ecErrors = dtb__1014 } -> dtb__994
  | _ -> failwith "DT: impossible branch"
))

# 245 "Vuna/Compiler/Elab/Types.vuna"
let v_ecDefsRev = (fun (p : t_Ec) -> (match p with
  | { f_Ec_ecNext = dtb__1015; f_Ec_ecSols = dtb__1016; f_Ec_ecDefsRev = dtb__1017; f_Ec_ecDatas = dtb__1018; f_Ec_ecDepthOfMeta = dtb__1019; f_Ec_ecGoals = dtb__1020; f_Ec_ecInsts = dtb__1021; f_Ec_ecClasses = dtb__1022; f_Ec_ecConstraints = dtb__1023; f_Ec_ecDefTbl = dtb__1024; f_Ec_ecGlobalsTbl = dtb__1025; f_Ec_ecSolTbl = dtb__1026; f_Ec_ecDepthTbl = dtb__1027; f_Ec_ecGlobalsComplete = dtb__1028; f_Ec_ecClausesTbl = dtb__1029; f_Ec_ecCtorTbl = dtb__1030; f_Ec_ecHasLinear = dtb__1031; f_Ec_ecMetaSpans = dtb__1032; f_Ec_ecUseSpans = dtb__1033; f_Ec_ecWarnings = dtb__1034; f_Ec_ecCounters = dtb__1035; f_Ec_ecErrors = dtb__1036 } -> dtb__1017
  | _ -> failwith "DT: impossible branch"
))

# 246 "Vuna/Compiler/Elab/Types.vuna"
let v_ecDatas = (fun (p : t_Ec) -> (match p with
  | { f_Ec_ecNext = dtb__1037; f_Ec_ecSols = dtb__1038; f_Ec_ecDefsRev = dtb__1039; f_Ec_ecDatas = dtb__1040; f_Ec_ecDepthOfMeta = dtb__1041; f_Ec_ecGoals = dtb__1042; f_Ec_ecInsts = dtb__1043; f_Ec_ecClasses = dtb__1044; f_Ec_ecConstraints = dtb__1045; f_Ec_ecDefTbl = dtb__1046; f_Ec_ecGlobalsTbl = dtb__1047; f_Ec_ecSolTbl = dtb__1048; f_Ec_ecDepthTbl = dtb__1049; f_Ec_ecGlobalsComplete = dtb__1050; f_Ec_ecClausesTbl = dtb__1051; f_Ec_ecCtorTbl = dtb__1052; f_Ec_ecHasLinear = dtb__1053; f_Ec_ecMetaSpans = dtb__1054; f_Ec_ecUseSpans = dtb__1055; f_Ec_ecWarnings = dtb__1056; f_Ec_ecCounters = dtb__1057; f_Ec_ecErrors = dtb__1058 } -> dtb__1040
  | _ -> failwith "DT: impossible branch"
))

# 247 "Vuna/Compiler/Elab/Types.vuna"
let v_ecDepthOfMeta = (fun (p : t_Ec) -> (match p with
  | { f_Ec_ecNext = dtb__1059; f_Ec_ecSols = dtb__1060; f_Ec_ecDefsRev = dtb__1061; f_Ec_ecDatas = dtb__1062; f_Ec_ecDepthOfMeta = dtb__1063; f_Ec_ecGoals = dtb__1064; f_Ec_ecInsts = dtb__1065; f_Ec_ecClasses = dtb__1066; f_Ec_ecConstraints = dtb__1067; f_Ec_ecDefTbl = dtb__1068; f_Ec_ecGlobalsTbl = dtb__1069; f_Ec_ecSolTbl = dtb__1070; f_Ec_ecDepthTbl = dtb__1071; f_Ec_ecGlobalsComplete = dtb__1072; f_Ec_ecClausesTbl = dtb__1073; f_Ec_ecCtorTbl = dtb__1074; f_Ec_ecHasLinear = dtb__1075; f_Ec_ecMetaSpans = dtb__1076; f_Ec_ecUseSpans = dtb__1077; f_Ec_ecWarnings = dtb__1078; f_Ec_ecCounters = dtb__1079; f_Ec_ecErrors = dtb__1080 } -> dtb__1063
  | _ -> failwith "DT: impossible branch"
))

# 248 "Vuna/Compiler/Elab/Types.vuna"
let v_ecGoals = (fun (p : t_Ec) -> (match p with
  | { f_Ec_ecNext = dtb__1081; f_Ec_ecSols = dtb__1082; f_Ec_ecDefsRev = dtb__1083; f_Ec_ecDatas = dtb__1084; f_Ec_ecDepthOfMeta = dtb__1085; f_Ec_ecGoals = dtb__1086; f_Ec_ecInsts = dtb__1087; f_Ec_ecClasses = dtb__1088; f_Ec_ecConstraints = dtb__1089; f_Ec_ecDefTbl = dtb__1090; f_Ec_ecGlobalsTbl = dtb__1091; f_Ec_ecSolTbl = dtb__1092; f_Ec_ecDepthTbl = dtb__1093; f_Ec_ecGlobalsComplete = dtb__1094; f_Ec_ecClausesTbl = dtb__1095; f_Ec_ecCtorTbl = dtb__1096; f_Ec_ecHasLinear = dtb__1097; f_Ec_ecMetaSpans = dtb__1098; f_Ec_ecUseSpans = dtb__1099; f_Ec_ecWarnings = dtb__1100; f_Ec_ecCounters = dtb__1101; f_Ec_ecErrors = dtb__1102 } -> dtb__1086
  | _ -> failwith "DT: impossible branch"
))

# 250 "Vuna/Compiler/Elab/Types.vuna"
let v_ecInsts = (fun (p : t_Ec) -> (match p with
  | { f_Ec_ecNext = dtb__1103; f_Ec_ecSols = dtb__1104; f_Ec_ecDefsRev = dtb__1105; f_Ec_ecDatas = dtb__1106; f_Ec_ecDepthOfMeta = dtb__1107; f_Ec_ecGoals = dtb__1108; f_Ec_ecInsts = dtb__1109; f_Ec_ecClasses = dtb__1110; f_Ec_ecConstraints = dtb__1111; f_Ec_ecDefTbl = dtb__1112; f_Ec_ecGlobalsTbl = dtb__1113; f_Ec_ecSolTbl = dtb__1114; f_Ec_ecDepthTbl = dtb__1115; f_Ec_ecGlobalsComplete = dtb__1116; f_Ec_ecClausesTbl = dtb__1117; f_Ec_ecCtorTbl = dtb__1118; f_Ec_ecHasLinear = dtb__1119; f_Ec_ecMetaSpans = dtb__1120; f_Ec_ecUseSpans = dtb__1121; f_Ec_ecWarnings = dtb__1122; f_Ec_ecCounters = dtb__1123; f_Ec_ecErrors = dtb__1124 } -> dtb__1109
  | _ -> failwith "DT: impossible branch"
))

# 251 "Vuna/Compiler/Elab/Types.vuna"
let v_ecClasses = (fun (p : t_Ec) -> (match p with
  | { f_Ec_ecNext = dtb__1125; f_Ec_ecSols = dtb__1126; f_Ec_ecDefsRev = dtb__1127; f_Ec_ecDatas = dtb__1128; f_Ec_ecDepthOfMeta = dtb__1129; f_Ec_ecGoals = dtb__1130; f_Ec_ecInsts = dtb__1131; f_Ec_ecClasses = dtb__1132; f_Ec_ecConstraints = dtb__1133; f_Ec_ecDefTbl = dtb__1134; f_Ec_ecGlobalsTbl = dtb__1135; f_Ec_ecSolTbl = dtb__1136; f_Ec_ecDepthTbl = dtb__1137; f_Ec_ecGlobalsComplete = dtb__1138; f_Ec_ecClausesTbl = dtb__1139; f_Ec_ecCtorTbl = dtb__1140; f_Ec_ecHasLinear = dtb__1141; f_Ec_ecMetaSpans = dtb__1142; f_Ec_ecUseSpans = dtb__1143; f_Ec_ecWarnings = dtb__1144; f_Ec_ecCounters = dtb__1145; f_Ec_ecErrors = dtb__1146 } -> dtb__1132
  | _ -> failwith "DT: impossible branch"
))

# 253 "Vuna/Compiler/Elab/Types.vuna"
let v_ecConstraints = (fun (p : t_Ec) -> (match p with
  | { f_Ec_ecNext = dtb__1147; f_Ec_ecSols = dtb__1148; f_Ec_ecDefsRev = dtb__1149; f_Ec_ecDatas = dtb__1150; f_Ec_ecDepthOfMeta = dtb__1151; f_Ec_ecGoals = dtb__1152; f_Ec_ecInsts = dtb__1153; f_Ec_ecClasses = dtb__1154; f_Ec_ecConstraints = dtb__1155; f_Ec_ecDefTbl = dtb__1156; f_Ec_ecGlobalsTbl = dtb__1157; f_Ec_ecSolTbl = dtb__1158; f_Ec_ecDepthTbl = dtb__1159; f_Ec_ecGlobalsComplete = dtb__1160; f_Ec_ecClausesTbl = dtb__1161; f_Ec_ecCtorTbl = dtb__1162; f_Ec_ecHasLinear = dtb__1163; f_Ec_ecMetaSpans = dtb__1164; f_Ec_ecUseSpans = dtb__1165; f_Ec_ecWarnings = dtb__1166; f_Ec_ecCounters = dtb__1167; f_Ec_ecErrors = dtb__1168 } -> dtb__1155
  | _ -> failwith "DT: impossible branch"
))

# 554 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPendingList = (fun (ec : t_Ec) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__1169; f_ConstraintStore_csNextId = dtb__1170; f_ConstraintStore_csTried = dtb__1171; f_ConstraintStore_csSolsCount = dtb__1172; f_ConstraintStore_csPassNext = dtb__1173; f_ConstraintStore_csPassSols = dtb__1174; f_ConstraintStore_csCtorIndexComplete = dtb__1175 } -> (B_dContainer_dQueue.v_toList dtb__1169)
  | _ -> failwith "DT: impossible branch"
))

# 560 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPendingCount = (fun (ec : t_Ec) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__1176; f_ConstraintStore_csNextId = dtb__1177; f_ConstraintStore_csTried = dtb__1178; f_ConstraintStore_csSolsCount = dtb__1179; f_ConstraintStore_csPassNext = dtb__1180; f_ConstraintStore_csPassSols = dtb__1181; f_ConstraintStore_csCtorIndexComplete = dtb__1182 } -> (B_dContainer_dQueue.v_size dtb__1176)
  | _ -> failwith "DT: impossible branch"
))

# 566 "Vuna/Compiler/Elab/Types.vuna"
let v_ecNextConstraintId = (fun (ec : t_Ec) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__1183; f_ConstraintStore_csNextId = dtb__1184; f_ConstraintStore_csTried = dtb__1185; f_ConstraintStore_csSolsCount = dtb__1186; f_ConstraintStore_csPassNext = dtb__1187; f_ConstraintStore_csPassSols = dtb__1188; f_ConstraintStore_csCtorIndexComplete = dtb__1189 } -> dtb__1184
  | _ -> failwith "DT: impossible branch"
))

# 572 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPopPending = (fun (ec : t_Ec) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__1190; f_ConstraintStore_csNextId = dtb__1191; f_ConstraintStore_csTried = dtb__1192; f_ConstraintStore_csSolsCount = dtb__1193; f_ConstraintStore_csPassNext = dtb__1194; f_ConstraintStore_csPassSols = dtb__1195; f_ConstraintStore_csCtorIndexComplete = dtb__1196 } -> (let nd_uscrut8 = (B_dContainer_dQueue.v_pop dtb__1190) in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1197) -> (match dtb__1197 with
  | { B_dData_dPair.f_Pair_first = dtb__1198; B_dData_dPair.f_Pair_second = dtb__1199 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__1198; B_dData_dPair.f_Pair_second = ((v_ecPutConstraints ec) { f_ConstraintStore_csPending = dtb__1199; f_ConstraintStore_csNextId = dtb__1191; f_ConstraintStore_csTried = dtb__1192; f_ConstraintStore_csSolsCount = dtb__1193; f_ConstraintStore_csPassNext = dtb__1194; f_ConstraintStore_csPassSols = dtb__1195; f_ConstraintStore_csCtorIndexComplete = dtb__1196 }) }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 582 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPushPending = (fun (ec : t_Ec) (c : t_Constraint) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__1200; f_ConstraintStore_csNextId = dtb__1201; f_ConstraintStore_csTried = dtb__1202; f_ConstraintStore_csSolsCount = dtb__1203; f_ConstraintStore_csPassNext = dtb__1204; f_ConstraintStore_csPassSols = dtb__1205; f_ConstraintStore_csCtorIndexComplete = dtb__1206 } -> ((v_ecPutConstraints ec) { f_ConstraintStore_csPending = ((B_dContainer_dQueue.v_push c) dtb__1200); f_ConstraintStore_csNextId = dtb__1201; f_ConstraintStore_csTried = dtb__1202; f_ConstraintStore_csSolsCount = dtb__1203; f_ConstraintStore_csPassNext = dtb__1204; f_ConstraintStore_csPassSols = dtb__1205; f_ConstraintStore_csCtorIndexComplete = dtb__1206 })
  | _ -> failwith "DT: impossible branch"
))

# 591 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutPending = (fun (ec : t_Ec) (pending2 : t_Constraint B_dData_dList.t_List) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__1207; f_ConstraintStore_csNextId = dtb__1208; f_ConstraintStore_csTried = dtb__1209; f_ConstraintStore_csSolsCount = dtb__1210; f_ConstraintStore_csPassNext = dtb__1211; f_ConstraintStore_csPassSols = dtb__1212; f_ConstraintStore_csCtorIndexComplete = dtb__1213 } -> ((v_ecPutConstraints ec) { f_ConstraintStore_csPending = (B_dContainer_dQueue.v_fromList pending2); f_ConstraintStore_csNextId = dtb__1208; f_ConstraintStore_csTried = dtb__1209; f_ConstraintStore_csSolsCount = dtb__1210; f_ConstraintStore_csPassNext = dtb__1211; f_ConstraintStore_csPassSols = dtb__1212; f_ConstraintStore_csCtorIndexComplete = dtb__1213 })
  | _ -> failwith "DT: impossible branch"
))

# 600 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddConstraint = (fun (ec : t_Ec) (kind : t_ConstraintKind) (meta : int) (dom : Core_dTerm.t_Value) (span : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (depth : int) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__1214; f_ConstraintStore_csNextId = dtb__1215; f_ConstraintStore_csTried = dtb__1216; f_ConstraintStore_csSolsCount = dtb__1217; f_ConstraintStore_csPassNext = dtb__1218; f_ConstraintStore_csPassSols = dtb__1219; f_ConstraintStore_csCtorIndexComplete = dtb__1220 } -> ((v_ecPutConstraints ec) { f_ConstraintStore_csPending = ((B_dContainer_dQueue.v_push { f_Constraint_conId = dtb__1215; f_Constraint_conKind = kind; f_Constraint_conMeta = meta; f_Constraint_conDom = dom; f_Constraint_conSpan = span; f_Constraint_conDepth = depth }) dtb__1214); f_ConstraintStore_csNextId = (dtb__1215 + 1); f_ConstraintStore_csTried = dtb__1216; f_ConstraintStore_csSolsCount = dtb__1217; f_ConstraintStore_csPassNext = dtb__1218; f_ConstraintStore_csPassSols = dtb__1219; f_ConstraintStore_csCtorIndexComplete = dtb__1220 })
  | _ -> failwith "DT: impossible branch"
))

# 610 "Vuna/Compiler/Elab/Types.vuna"
let v_ecTriedAt = (fun (ec : t_Ec) (cid : int) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__1221; f_ConstraintStore_csNextId = dtb__1222; f_ConstraintStore_csTried = dtb__1223; f_ConstraintStore_csSolsCount = dtb__1224; f_ConstraintStore_csPassNext = dtb__1225; f_ConstraintStore_csPassSols = dtb__1226; f_ConstraintStore_csCtorIndexComplete = dtb__1227 } -> ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) cid) dtb__1223)
  | _ -> failwith "DT: impossible branch"
))

# 616 "Vuna/Compiler/Elab/Types.vuna"
let v_ecRecordTried = (fun (ec : t_Ec) (cid : int) (epoch : int) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__1228; f_ConstraintStore_csNextId = dtb__1229; f_ConstraintStore_csTried = dtb__1230; f_ConstraintStore_csSolsCount = dtb__1231; f_ConstraintStore_csPassNext = dtb__1232; f_ConstraintStore_csPassSols = dtb__1233; f_ConstraintStore_csCtorIndexComplete = dtb__1234 } -> ((v_ecPutConstraints ec) { f_ConstraintStore_csPending = dtb__1228; f_ConstraintStore_csNextId = dtb__1229; f_ConstraintStore_csTried = (((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) cid) epoch) dtb__1230); f_ConstraintStore_csSolsCount = dtb__1231; f_ConstraintStore_csPassNext = dtb__1232; f_ConstraintStore_csPassSols = dtb__1233; f_ConstraintStore_csCtorIndexComplete = dtb__1234 })
  | _ -> failwith "DT: impossible branch"
))

# 667 "Vuna/Compiler/Elab/Types.vuna"
let v_ecSolsCountOf = (fun (ec : t_Ec) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__1235; f_ConstraintStore_csNextId = dtb__1236; f_ConstraintStore_csTried = dtb__1237; f_ConstraintStore_csSolsCount = dtb__1238; f_ConstraintStore_csPassNext = dtb__1239; f_ConstraintStore_csPassSols = dtb__1240; f_ConstraintStore_csCtorIndexComplete = dtb__1241 } -> dtb__1238
  | _ -> failwith "DT: impossible branch"
))

# 672 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutSolsCount = (fun (ec : t_Ec) (cnt : int) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__1242; f_ConstraintStore_csNextId = dtb__1243; f_ConstraintStore_csTried = dtb__1244; f_ConstraintStore_csSolsCount = dtb__1245; f_ConstraintStore_csPassNext = dtb__1246; f_ConstraintStore_csPassSols = dtb__1247; f_ConstraintStore_csCtorIndexComplete = dtb__1248 } -> ((v_ecPutConstraints ec) { f_ConstraintStore_csPending = dtb__1242; f_ConstraintStore_csNextId = dtb__1243; f_ConstraintStore_csTried = dtb__1244; f_ConstraintStore_csSolsCount = cnt; f_ConstraintStore_csPassNext = dtb__1246; f_ConstraintStore_csPassSols = dtb__1247; f_ConstraintStore_csCtorIndexComplete = dtb__1248 })
  | _ -> failwith "DT: impossible branch"
))

# 705 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutPassMarker = (fun (ec : t_Ec) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__1249; f_ConstraintStore_csNextId = dtb__1250; f_ConstraintStore_csTried = dtb__1251; f_ConstraintStore_csSolsCount = dtb__1252; f_ConstraintStore_csPassNext = dtb__1253; f_ConstraintStore_csPassSols = dtb__1254; f_ConstraintStore_csCtorIndexComplete = dtb__1255 } -> ((v_ecPutConstraints ec) { f_ConstraintStore_csPending = dtb__1249; f_ConstraintStore_csNextId = dtb__1250; f_ConstraintStore_csTried = dtb__1251; f_ConstraintStore_csSolsCount = dtb__1252; f_ConstraintStore_csPassNext = dtb__1250; f_ConstraintStore_csPassSols = dtb__1252; f_ConstraintStore_csCtorIndexComplete = dtb__1255 })
  | _ -> failwith "DT: impossible branch"
))

# 712 "Vuna/Compiler/Elab/Types.vuna"
let v_ecCtorIndexComplete = (fun (ec : t_Ec) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__1256; f_ConstraintStore_csNextId = dtb__1257; f_ConstraintStore_csTried = dtb__1258; f_ConstraintStore_csSolsCount = dtb__1259; f_ConstraintStore_csPassNext = dtb__1260; f_ConstraintStore_csPassSols = dtb__1261; f_ConstraintStore_csCtorIndexComplete = dtb__1262 } -> dtb__1262
  | _ -> failwith "DT: impossible branch"
))

# 717 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutCtorIndexComplete = (fun (ec : t_Ec) (ok : bool) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__1263; f_ConstraintStore_csNextId = dtb__1264; f_ConstraintStore_csTried = dtb__1265; f_ConstraintStore_csSolsCount = dtb__1266; f_ConstraintStore_csPassNext = dtb__1267; f_ConstraintStore_csPassSols = dtb__1268; f_ConstraintStore_csCtorIndexComplete = dtb__1269 } -> ((v_ecPutConstraints ec) { f_ConstraintStore_csPending = dtb__1263; f_ConstraintStore_csNextId = dtb__1264; f_ConstraintStore_csTried = dtb__1265; f_ConstraintStore_csSolsCount = dtb__1266; f_ConstraintStore_csPassNext = dtb__1267; f_ConstraintStore_csPassSols = dtb__1268; f_ConstraintStore_csCtorIndexComplete = ok })
  | _ -> failwith "DT: impossible branch"
))

# 724 "Vuna/Compiler/Elab/Types.vuna"
let v_ecDictPassIdle = (fun (ec : t_Ec) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__1270; f_ConstraintStore_csNextId = dtb__1271; f_ConstraintStore_csTried = dtb__1272; f_ConstraintStore_csSolsCount = dtb__1273; f_ConstraintStore_csPassNext = dtb__1274; f_ConstraintStore_csPassSols = dtb__1275; f_ConstraintStore_csCtorIndexComplete = dtb__1276 } -> (if (dtb__1274 = dtb__1271) then (dtb__1275 = dtb__1273) else false)
  | _ -> failwith "DT: impossible branch"
))

# 839 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutCtorTbl = (fun (mc0 : t_Ec) (mc1 : (string, t_DtCtor) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | { f_Ec_ecNext = dtb__1277; f_Ec_ecSols = dtb__1278; f_Ec_ecDefsRev = dtb__1279; f_Ec_ecDatas = dtb__1280; f_Ec_ecDepthOfMeta = dtb__1281; f_Ec_ecGoals = dtb__1282; f_Ec_ecInsts = dtb__1283; f_Ec_ecClasses = dtb__1284; f_Ec_ecConstraints = dtb__1285; f_Ec_ecDefTbl = dtb__1286; f_Ec_ecGlobalsTbl = dtb__1287; f_Ec_ecSolTbl = dtb__1288; f_Ec_ecDepthTbl = dtb__1289; f_Ec_ecGlobalsComplete = dtb__1290; f_Ec_ecClausesTbl = dtb__1291; f_Ec_ecCtorTbl = dtb__1292; f_Ec_ecHasLinear = dtb__1293; f_Ec_ecMetaSpans = dtb__1294; f_Ec_ecUseSpans = dtb__1295; f_Ec_ecWarnings = dtb__1296; f_Ec_ecCounters = dtb__1297; f_Ec_ecErrors = dtb__1298 } -> ((v_ecPutCtorIndexComplete { f_Ec_ecNext = dtb__1277; f_Ec_ecSols = dtb__1278; f_Ec_ecDefsRev = dtb__1279; f_Ec_ecDatas = dtb__1280; f_Ec_ecDepthOfMeta = dtb__1281; f_Ec_ecGoals = dtb__1282; f_Ec_ecInsts = dtb__1283; f_Ec_ecClasses = dtb__1284; f_Ec_ecConstraints = dtb__1285; f_Ec_ecDefTbl = dtb__1286; f_Ec_ecGlobalsTbl = dtb__1287; f_Ec_ecSolTbl = dtb__1288; f_Ec_ecDepthTbl = dtb__1289; f_Ec_ecGlobalsComplete = dtb__1290; f_Ec_ecClausesTbl = dtb__1291; f_Ec_ecCtorTbl = mc1; f_Ec_ecHasLinear = dtb__1293; f_Ec_ecMetaSpans = dtb__1294; f_Ec_ecUseSpans = dtb__1295; f_Ec_ecWarnings = dtb__1296; f_Ec_ecCounters = dtb__1297; f_Ec_ecErrors = dtb__1298 }) true)
  | _ -> failwith "DT: impossible branch"
))

# 254 "Vuna/Compiler/Elab/Types.vuna"
let v_ecDefTbl = (fun (p : t_Ec) -> (match p with
  | { f_Ec_ecNext = dtb__1299; f_Ec_ecSols = dtb__1300; f_Ec_ecDefsRev = dtb__1301; f_Ec_ecDatas = dtb__1302; f_Ec_ecDepthOfMeta = dtb__1303; f_Ec_ecGoals = dtb__1304; f_Ec_ecInsts = dtb__1305; f_Ec_ecClasses = dtb__1306; f_Ec_ecConstraints = dtb__1307; f_Ec_ecDefTbl = dtb__1308; f_Ec_ecGlobalsTbl = dtb__1309; f_Ec_ecSolTbl = dtb__1310; f_Ec_ecDepthTbl = dtb__1311; f_Ec_ecGlobalsComplete = dtb__1312; f_Ec_ecClausesTbl = dtb__1313; f_Ec_ecCtorTbl = dtb__1314; f_Ec_ecHasLinear = dtb__1315; f_Ec_ecMetaSpans = dtb__1316; f_Ec_ecUseSpans = dtb__1317; f_Ec_ecWarnings = dtb__1318; f_Ec_ecCounters = dtb__1319; f_Ec_ecErrors = dtb__1320 } -> dtb__1308
  | _ -> failwith "DT: impossible branch"
))

# 255 "Vuna/Compiler/Elab/Types.vuna"
let v_ecGlobalsTbl = (fun (p : t_Ec) -> (match p with
  | { f_Ec_ecNext = dtb__1321; f_Ec_ecSols = dtb__1322; f_Ec_ecDefsRev = dtb__1323; f_Ec_ecDatas = dtb__1324; f_Ec_ecDepthOfMeta = dtb__1325; f_Ec_ecGoals = dtb__1326; f_Ec_ecInsts = dtb__1327; f_Ec_ecClasses = dtb__1328; f_Ec_ecConstraints = dtb__1329; f_Ec_ecDefTbl = dtb__1330; f_Ec_ecGlobalsTbl = dtb__1331; f_Ec_ecSolTbl = dtb__1332; f_Ec_ecDepthTbl = dtb__1333; f_Ec_ecGlobalsComplete = dtb__1334; f_Ec_ecClausesTbl = dtb__1335; f_Ec_ecCtorTbl = dtb__1336; f_Ec_ecHasLinear = dtb__1337; f_Ec_ecMetaSpans = dtb__1338; f_Ec_ecUseSpans = dtb__1339; f_Ec_ecWarnings = dtb__1340; f_Ec_ecCounters = dtb__1341; f_Ec_ecErrors = dtb__1342 } -> dtb__1331
  | _ -> failwith "DT: impossible branch"
))

# 256 "Vuna/Compiler/Elab/Types.vuna"
let v_ecSolTbl = (fun (p : t_Ec) -> (match p with
  | { f_Ec_ecNext = dtb__1343; f_Ec_ecSols = dtb__1344; f_Ec_ecDefsRev = dtb__1345; f_Ec_ecDatas = dtb__1346; f_Ec_ecDepthOfMeta = dtb__1347; f_Ec_ecGoals = dtb__1348; f_Ec_ecInsts = dtb__1349; f_Ec_ecClasses = dtb__1350; f_Ec_ecConstraints = dtb__1351; f_Ec_ecDefTbl = dtb__1352; f_Ec_ecGlobalsTbl = dtb__1353; f_Ec_ecSolTbl = dtb__1354; f_Ec_ecDepthTbl = dtb__1355; f_Ec_ecGlobalsComplete = dtb__1356; f_Ec_ecClausesTbl = dtb__1357; f_Ec_ecCtorTbl = dtb__1358; f_Ec_ecHasLinear = dtb__1359; f_Ec_ecMetaSpans = dtb__1360; f_Ec_ecUseSpans = dtb__1361; f_Ec_ecWarnings = dtb__1362; f_Ec_ecCounters = dtb__1363; f_Ec_ecErrors = dtb__1364 } -> dtb__1354
  | _ -> failwith "DT: impossible branch"
))

# 658 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutSols = (fun (ec : t_Ec) (sols2 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let delta = ((v_solsDelta (v_ecSols ec)) sols2) in (let soltbl2 = ((((B_dContainer_dHashMap.v_insertAll B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) delta) (v_ecSolTbl ec)) in (let ec2 = (((v_ecPutSolsRaw ec) sols2) soltbl2) in ((v_ecPutSolsCount ec2) ((v_ecSolsCountOf ec2) + (B_dData_dList.v_length delta)))))))

# 257 "Vuna/Compiler/Elab/Types.vuna"
let v_ecDepthTbl = (fun (p : t_Ec) -> (match p with
  | { f_Ec_ecNext = dtb__1365; f_Ec_ecSols = dtb__1366; f_Ec_ecDefsRev = dtb__1367; f_Ec_ecDatas = dtb__1368; f_Ec_ecDepthOfMeta = dtb__1369; f_Ec_ecGoals = dtb__1370; f_Ec_ecInsts = dtb__1371; f_Ec_ecClasses = dtb__1372; f_Ec_ecConstraints = dtb__1373; f_Ec_ecDefTbl = dtb__1374; f_Ec_ecGlobalsTbl = dtb__1375; f_Ec_ecSolTbl = dtb__1376; f_Ec_ecDepthTbl = dtb__1377; f_Ec_ecGlobalsComplete = dtb__1378; f_Ec_ecClausesTbl = dtb__1379; f_Ec_ecCtorTbl = dtb__1380; f_Ec_ecHasLinear = dtb__1381; f_Ec_ecMetaSpans = dtb__1382; f_Ec_ecUseSpans = dtb__1383; f_Ec_ecWarnings = dtb__1384; f_Ec_ecCounters = dtb__1385; f_Ec_ecErrors = dtb__1386 } -> dtb__1377
  | _ -> failwith "DT: impossible branch"
))

# 655 "Vuna/Compiler/Elab/Types.vuna"
let v_ecSolsP = (fun (ec : t_Ec) -> (((Core_dTerm.v_solsOf (v_ecSolTbl ec)) (v_ecSols ec)) (v_ecDepthTbl ec)))

# 1141 "Vuna/Compiler/Elab/Types.vuna"
let v_forceVal = (fun (ec : t_Ec) (v : Core_dTerm.t_Value) -> ((((Core_dEval.v_force (v_ecDefTbl ec)) (v_ecSolsP ec)) Core_dTerm.v_defaultFuel) v))

# 258 "Vuna/Compiler/Elab/Types.vuna"
let v_ecGlobalsComplete = (fun (p : t_Ec) -> (match p with
  | { f_Ec_ecNext = dtb__1387; f_Ec_ecSols = dtb__1388; f_Ec_ecDefsRev = dtb__1389; f_Ec_ecDatas = dtb__1390; f_Ec_ecDepthOfMeta = dtb__1391; f_Ec_ecGoals = dtb__1392; f_Ec_ecInsts = dtb__1393; f_Ec_ecClasses = dtb__1394; f_Ec_ecConstraints = dtb__1395; f_Ec_ecDefTbl = dtb__1396; f_Ec_ecGlobalsTbl = dtb__1397; f_Ec_ecSolTbl = dtb__1398; f_Ec_ecDepthTbl = dtb__1399; f_Ec_ecGlobalsComplete = dtb__1400; f_Ec_ecClausesTbl = dtb__1401; f_Ec_ecCtorTbl = dtb__1402; f_Ec_ecHasLinear = dtb__1403; f_Ec_ecMetaSpans = dtb__1404; f_Ec_ecUseSpans = dtb__1405; f_Ec_ecWarnings = dtb__1406; f_Ec_ecCounters = dtb__1407; f_Ec_ecErrors = dtb__1408 } -> dtb__1400
  | _ -> failwith "DT: impossible branch"
))

# 259 "Vuna/Compiler/Elab/Types.vuna"
let v_ecClausesTbl = (fun (p : t_Ec) -> (match p with
  | { f_Ec_ecNext = dtb__1409; f_Ec_ecSols = dtb__1410; f_Ec_ecDefsRev = dtb__1411; f_Ec_ecDatas = dtb__1412; f_Ec_ecDepthOfMeta = dtb__1413; f_Ec_ecGoals = dtb__1414; f_Ec_ecInsts = dtb__1415; f_Ec_ecClasses = dtb__1416; f_Ec_ecConstraints = dtb__1417; f_Ec_ecDefTbl = dtb__1418; f_Ec_ecGlobalsTbl = dtb__1419; f_Ec_ecSolTbl = dtb__1420; f_Ec_ecDepthTbl = dtb__1421; f_Ec_ecGlobalsComplete = dtb__1422; f_Ec_ecClausesTbl = dtb__1423; f_Ec_ecCtorTbl = dtb__1424; f_Ec_ecHasLinear = dtb__1425; f_Ec_ecMetaSpans = dtb__1426; f_Ec_ecUseSpans = dtb__1427; f_Ec_ecWarnings = dtb__1428; f_Ec_ecCounters = dtb__1429; f_Ec_ecErrors = dtb__1430 } -> dtb__1423
  | _ -> failwith "DT: impossible branch"
))

# 260 "Vuna/Compiler/Elab/Types.vuna"
let v_ecCtorTbl = (fun (p : t_Ec) -> (match p with
  | { f_Ec_ecNext = dtb__1431; f_Ec_ecSols = dtb__1432; f_Ec_ecDefsRev = dtb__1433; f_Ec_ecDatas = dtb__1434; f_Ec_ecDepthOfMeta = dtb__1435; f_Ec_ecGoals = dtb__1436; f_Ec_ecInsts = dtb__1437; f_Ec_ecClasses = dtb__1438; f_Ec_ecConstraints = dtb__1439; f_Ec_ecDefTbl = dtb__1440; f_Ec_ecGlobalsTbl = dtb__1441; f_Ec_ecSolTbl = dtb__1442; f_Ec_ecDepthTbl = dtb__1443; f_Ec_ecGlobalsComplete = dtb__1444; f_Ec_ecClausesTbl = dtb__1445; f_Ec_ecCtorTbl = dtb__1446; f_Ec_ecHasLinear = dtb__1447; f_Ec_ecMetaSpans = dtb__1448; f_Ec_ecUseSpans = dtb__1449; f_Ec_ecWarnings = dtb__1450; f_Ec_ecCounters = dtb__1451; f_Ec_ecErrors = dtb__1452 } -> dtb__1446
  | _ -> failwith "DT: impossible branch"
))

# 262 "Vuna/Compiler/Elab/Types.vuna"
let v_ecHasLinear = (fun (p : t_Ec) -> (match p with
  | { f_Ec_ecNext = dtb__1453; f_Ec_ecSols = dtb__1454; f_Ec_ecDefsRev = dtb__1455; f_Ec_ecDatas = dtb__1456; f_Ec_ecDepthOfMeta = dtb__1457; f_Ec_ecGoals = dtb__1458; f_Ec_ecInsts = dtb__1459; f_Ec_ecClasses = dtb__1460; f_Ec_ecConstraints = dtb__1461; f_Ec_ecDefTbl = dtb__1462; f_Ec_ecGlobalsTbl = dtb__1463; f_Ec_ecSolTbl = dtb__1464; f_Ec_ecDepthTbl = dtb__1465; f_Ec_ecGlobalsComplete = dtb__1466; f_Ec_ecClausesTbl = dtb__1467; f_Ec_ecCtorTbl = dtb__1468; f_Ec_ecHasLinear = dtb__1469; f_Ec_ecMetaSpans = dtb__1470; f_Ec_ecUseSpans = dtb__1471; f_Ec_ecWarnings = dtb__1472; f_Ec_ecCounters = dtb__1473; f_Ec_ecErrors = dtb__1474 } -> dtb__1469
  | _ -> failwith "DT: impossible branch"
))

# 264 "Vuna/Compiler/Elab/Types.vuna"
let v_ecMetaSpans = (fun (p : t_Ec) -> (match p with
  | { f_Ec_ecNext = dtb__1475; f_Ec_ecSols = dtb__1476; f_Ec_ecDefsRev = dtb__1477; f_Ec_ecDatas = dtb__1478; f_Ec_ecDepthOfMeta = dtb__1479; f_Ec_ecGoals = dtb__1480; f_Ec_ecInsts = dtb__1481; f_Ec_ecClasses = dtb__1482; f_Ec_ecConstraints = dtb__1483; f_Ec_ecDefTbl = dtb__1484; f_Ec_ecGlobalsTbl = dtb__1485; f_Ec_ecSolTbl = dtb__1486; f_Ec_ecDepthTbl = dtb__1487; f_Ec_ecGlobalsComplete = dtb__1488; f_Ec_ecClausesTbl = dtb__1489; f_Ec_ecCtorTbl = dtb__1490; f_Ec_ecHasLinear = dtb__1491; f_Ec_ecMetaSpans = dtb__1492; f_Ec_ecUseSpans = dtb__1493; f_Ec_ecWarnings = dtb__1494; f_Ec_ecCounters = dtb__1495; f_Ec_ecErrors = dtb__1496 } -> dtb__1492
  | _ -> failwith "DT: impossible branch"
))

# 265 "Vuna/Compiler/Elab/Types.vuna"
let v_ecUseSpans = (fun (p : t_Ec) -> (match p with
  | { f_Ec_ecNext = dtb__1497; f_Ec_ecSols = dtb__1498; f_Ec_ecDefsRev = dtb__1499; f_Ec_ecDatas = dtb__1500; f_Ec_ecDepthOfMeta = dtb__1501; f_Ec_ecGoals = dtb__1502; f_Ec_ecInsts = dtb__1503; f_Ec_ecClasses = dtb__1504; f_Ec_ecConstraints = dtb__1505; f_Ec_ecDefTbl = dtb__1506; f_Ec_ecGlobalsTbl = dtb__1507; f_Ec_ecSolTbl = dtb__1508; f_Ec_ecDepthTbl = dtb__1509; f_Ec_ecGlobalsComplete = dtb__1510; f_Ec_ecClausesTbl = dtb__1511; f_Ec_ecCtorTbl = dtb__1512; f_Ec_ecHasLinear = dtb__1513; f_Ec_ecMetaSpans = dtb__1514; f_Ec_ecUseSpans = dtb__1515; f_Ec_ecWarnings = dtb__1516; f_Ec_ecCounters = dtb__1517; f_Ec_ecErrors = dtb__1518 } -> dtb__1515
  | _ -> failwith "DT: impossible branch"
))

# 267 "Vuna/Compiler/Elab/Types.vuna"
let v_ecWarnings = (fun (p : t_Ec) -> (match p with
  | { f_Ec_ecNext = dtb__1519; f_Ec_ecSols = dtb__1520; f_Ec_ecDefsRev = dtb__1521; f_Ec_ecDatas = dtb__1522; f_Ec_ecDepthOfMeta = dtb__1523; f_Ec_ecGoals = dtb__1524; f_Ec_ecInsts = dtb__1525; f_Ec_ecClasses = dtb__1526; f_Ec_ecConstraints = dtb__1527; f_Ec_ecDefTbl = dtb__1528; f_Ec_ecGlobalsTbl = dtb__1529; f_Ec_ecSolTbl = dtb__1530; f_Ec_ecDepthTbl = dtb__1531; f_Ec_ecGlobalsComplete = dtb__1532; f_Ec_ecClausesTbl = dtb__1533; f_Ec_ecCtorTbl = dtb__1534; f_Ec_ecHasLinear = dtb__1535; f_Ec_ecMetaSpans = dtb__1536; f_Ec_ecUseSpans = dtb__1537; f_Ec_ecWarnings = dtb__1538; f_Ec_ecCounters = dtb__1539; f_Ec_ecErrors = dtb__1540 } -> dtb__1538
  | _ -> failwith "DT: impossible branch"
))

# 934 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddWarning = (fun (ec : t_Ec) (d : Base_dDiag.t_Diagnostic) -> ((v_ecPutWarnings ec) ((B_dData_dList.v_append (v_ecWarnings ec)) (B_dData_dList.C_List__x58__x58_ (d, B_dData_dList.C_List_Nil)))))

# 270 "Vuna/Compiler/Elab/Types.vuna"
let v_ecCounters = (fun (p : t_Ec) -> (match p with
  | { f_Ec_ecNext = dtb__1541; f_Ec_ecSols = dtb__1542; f_Ec_ecDefsRev = dtb__1543; f_Ec_ecDatas = dtb__1544; f_Ec_ecDepthOfMeta = dtb__1545; f_Ec_ecGoals = dtb__1546; f_Ec_ecInsts = dtb__1547; f_Ec_ecClasses = dtb__1548; f_Ec_ecConstraints = dtb__1549; f_Ec_ecDefTbl = dtb__1550; f_Ec_ecGlobalsTbl = dtb__1551; f_Ec_ecSolTbl = dtb__1552; f_Ec_ecDepthTbl = dtb__1553; f_Ec_ecGlobalsComplete = dtb__1554; f_Ec_ecClausesTbl = dtb__1555; f_Ec_ecCtorTbl = dtb__1556; f_Ec_ecHasLinear = dtb__1557; f_Ec_ecMetaSpans = dtb__1558; f_Ec_ecUseSpans = dtb__1559; f_Ec_ecWarnings = dtb__1560; f_Ec_ecCounters = dtb__1561; f_Ec_ecErrors = dtb__1562 } -> dtb__1561
  | _ -> failwith "DT: impossible branch"
))

# 272 "Vuna/Compiler/Elab/Types.vuna"
let v_ecErrors = (fun (p : t_Ec) -> (match p with
  | { f_Ec_ecNext = dtb__1563; f_Ec_ecSols = dtb__1564; f_Ec_ecDefsRev = dtb__1565; f_Ec_ecDatas = dtb__1566; f_Ec_ecDepthOfMeta = dtb__1567; f_Ec_ecGoals = dtb__1568; f_Ec_ecInsts = dtb__1569; f_Ec_ecClasses = dtb__1570; f_Ec_ecConstraints = dtb__1571; f_Ec_ecDefTbl = dtb__1572; f_Ec_ecGlobalsTbl = dtb__1573; f_Ec_ecSolTbl = dtb__1574; f_Ec_ecDepthTbl = dtb__1575; f_Ec_ecGlobalsComplete = dtb__1576; f_Ec_ecClausesTbl = dtb__1577; f_Ec_ecCtorTbl = dtb__1578; f_Ec_ecHasLinear = dtb__1579; f_Ec_ecMetaSpans = dtb__1580; f_Ec_ecUseSpans = dtb__1581; f_Ec_ecWarnings = dtb__1582; f_Ec_ecCounters = dtb__1583; f_Ec_ecErrors = dtb__1584 } -> dtb__1584
  | _ -> failwith "DT: impossible branch"
))

# 1005 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxItems = (fun (p : t_Ctx) -> (match p with
  | { f_Ctx_ctxItems = dtb__1585; f_Ctx_ctxEnvF = dtb__1586; f_Ctx_ctxRefVals = dtb__1587; f_Ctx_ctxDepthF = dtb__1588; f_Ctx_ctxEnvRF = dtb__1589 } -> dtb__1585
  | _ -> failwith "DT: impossible branch"
))

# 1006 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxEnvF = (fun (p : t_Ctx) -> (match p with
  | { f_Ctx_ctxItems = dtb__1590; f_Ctx_ctxEnvF = dtb__1591; f_Ctx_ctxRefVals = dtb__1592; f_Ctx_ctxDepthF = dtb__1593; f_Ctx_ctxEnvRF = dtb__1594 } -> dtb__1591
  | _ -> failwith "DT: impossible branch"
))

# 1007 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxRefVals = (fun (p : t_Ctx) -> (match p with
  | { f_Ctx_ctxItems = dtb__1595; f_Ctx_ctxEnvF = dtb__1596; f_Ctx_ctxRefVals = dtb__1597; f_Ctx_ctxDepthF = dtb__1598; f_Ctx_ctxEnvRF = dtb__1599 } -> dtb__1597
  | _ -> failwith "DT: impossible branch"
))

# 1010 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxDepthF = (fun (p : t_Ctx) -> (match p with
  | { f_Ctx_ctxItems = dtb__1600; f_Ctx_ctxEnvF = dtb__1601; f_Ctx_ctxRefVals = dtb__1602; f_Ctx_ctxDepthF = dtb__1603; f_Ctx_ctxEnvRF = dtb__1604 } -> dtb__1603
  | _ -> failwith "DT: impossible branch"
))

# 1012 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxEnvRF = (fun (p : t_Ctx) -> (match p with
  | { f_Ctx_ctxItems = dtb__1605; f_Ctx_ctxEnvF = dtb__1606; f_Ctx_ctxRefVals = dtb__1607; f_Ctx_ctxDepthF = dtb__1608; f_Ctx_ctxEnvRF = dtb__1609 } -> dtb__1609
  | _ -> failwith "DT: impossible branch"
))

# 1148 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgDatas = (fun (p : t_DtProgram) -> (match p with
  | { f_DtProgram_dtProgDatas = dtb__1610; f_DtProgram_dtProgDefs = dtb__1611; f_DtProgram_dtProgGoals = dtb__1612; f_DtProgram_dtProgSols = dtb__1613; f_DtProgram_dtProgGlobals = dtb__1614; f_DtProgram_dtProgInsts = dtb__1615; f_DtProgram_dtProgClasses = dtb__1616; f_DtProgram_dtProgNext = dtb__1617; f_DtProgram_dtProgDepths = dtb__1618; f_DtProgram_dtProgWarnings = dtb__1619 } -> dtb__1610
  | _ -> failwith "DT: impossible branch"
))

# 1149 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgDefs = (fun (p : t_DtProgram) -> (match p with
  | { f_DtProgram_dtProgDatas = dtb__1620; f_DtProgram_dtProgDefs = dtb__1621; f_DtProgram_dtProgGoals = dtb__1622; f_DtProgram_dtProgSols = dtb__1623; f_DtProgram_dtProgGlobals = dtb__1624; f_DtProgram_dtProgInsts = dtb__1625; f_DtProgram_dtProgClasses = dtb__1626; f_DtProgram_dtProgNext = dtb__1627; f_DtProgram_dtProgDepths = dtb__1628; f_DtProgram_dtProgWarnings = dtb__1629 } -> dtb__1621
  | _ -> failwith "DT: impossible branch"
))

# 1150 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgGoals = (fun (p : t_DtProgram) -> (match p with
  | { f_DtProgram_dtProgDatas = dtb__1630; f_DtProgram_dtProgDefs = dtb__1631; f_DtProgram_dtProgGoals = dtb__1632; f_DtProgram_dtProgSols = dtb__1633; f_DtProgram_dtProgGlobals = dtb__1634; f_DtProgram_dtProgInsts = dtb__1635; f_DtProgram_dtProgClasses = dtb__1636; f_DtProgram_dtProgNext = dtb__1637; f_DtProgram_dtProgDepths = dtb__1638; f_DtProgram_dtProgWarnings = dtb__1639 } -> dtb__1632
  | _ -> failwith "DT: impossible branch"
))

# 1151 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgSols = (fun (p : t_DtProgram) -> (match p with
  | { f_DtProgram_dtProgDatas = dtb__1640; f_DtProgram_dtProgDefs = dtb__1641; f_DtProgram_dtProgGoals = dtb__1642; f_DtProgram_dtProgSols = dtb__1643; f_DtProgram_dtProgGlobals = dtb__1644; f_DtProgram_dtProgInsts = dtb__1645; f_DtProgram_dtProgClasses = dtb__1646; f_DtProgram_dtProgNext = dtb__1647; f_DtProgram_dtProgDepths = dtb__1648; f_DtProgram_dtProgWarnings = dtb__1649 } -> dtb__1643
  | _ -> failwith "DT: impossible branch"
))

# 1152 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgGlobals = (fun (p : t_DtProgram) -> (match p with
  | { f_DtProgram_dtProgDatas = dtb__1650; f_DtProgram_dtProgDefs = dtb__1651; f_DtProgram_dtProgGoals = dtb__1652; f_DtProgram_dtProgSols = dtb__1653; f_DtProgram_dtProgGlobals = dtb__1654; f_DtProgram_dtProgInsts = dtb__1655; f_DtProgram_dtProgClasses = dtb__1656; f_DtProgram_dtProgNext = dtb__1657; f_DtProgram_dtProgDepths = dtb__1658; f_DtProgram_dtProgWarnings = dtb__1659 } -> dtb__1654
  | _ -> failwith "DT: impossible branch"
))

# 1153 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgInsts = (fun (p : t_DtProgram) -> (match p with
  | { f_DtProgram_dtProgDatas = dtb__1660; f_DtProgram_dtProgDefs = dtb__1661; f_DtProgram_dtProgGoals = dtb__1662; f_DtProgram_dtProgSols = dtb__1663; f_DtProgram_dtProgGlobals = dtb__1664; f_DtProgram_dtProgInsts = dtb__1665; f_DtProgram_dtProgClasses = dtb__1666; f_DtProgram_dtProgNext = dtb__1667; f_DtProgram_dtProgDepths = dtb__1668; f_DtProgram_dtProgWarnings = dtb__1669 } -> dtb__1665
  | _ -> failwith "DT: impossible branch"
))

# 1154 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgClasses = (fun (p : t_DtProgram) -> (match p with
  | { f_DtProgram_dtProgDatas = dtb__1670; f_DtProgram_dtProgDefs = dtb__1671; f_DtProgram_dtProgGoals = dtb__1672; f_DtProgram_dtProgSols = dtb__1673; f_DtProgram_dtProgGlobals = dtb__1674; f_DtProgram_dtProgInsts = dtb__1675; f_DtProgram_dtProgClasses = dtb__1676; f_DtProgram_dtProgNext = dtb__1677; f_DtProgram_dtProgDepths = dtb__1678; f_DtProgram_dtProgWarnings = dtb__1679 } -> dtb__1676
  | _ -> failwith "DT: impossible branch"
))

# 1155 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgNext = (fun (p : t_DtProgram) -> (match p with
  | { f_DtProgram_dtProgDatas = dtb__1680; f_DtProgram_dtProgDefs = dtb__1681; f_DtProgram_dtProgGoals = dtb__1682; f_DtProgram_dtProgSols = dtb__1683; f_DtProgram_dtProgGlobals = dtb__1684; f_DtProgram_dtProgInsts = dtb__1685; f_DtProgram_dtProgClasses = dtb__1686; f_DtProgram_dtProgNext = dtb__1687; f_DtProgram_dtProgDepths = dtb__1688; f_DtProgram_dtProgWarnings = dtb__1689 } -> dtb__1687
  | _ -> failwith "DT: impossible branch"
))

# 1156 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgDepths = (fun (p : t_DtProgram) -> (match p with
  | { f_DtProgram_dtProgDatas = dtb__1690; f_DtProgram_dtProgDefs = dtb__1691; f_DtProgram_dtProgGoals = dtb__1692; f_DtProgram_dtProgSols = dtb__1693; f_DtProgram_dtProgGlobals = dtb__1694; f_DtProgram_dtProgInsts = dtb__1695; f_DtProgram_dtProgClasses = dtb__1696; f_DtProgram_dtProgNext = dtb__1697; f_DtProgram_dtProgDepths = dtb__1698; f_DtProgram_dtProgWarnings = dtb__1699 } -> dtb__1698
  | _ -> failwith "DT: impossible branch"
))

# 1158 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgWarnings = (fun (p : t_DtProgram) -> (match p with
  | { f_DtProgram_dtProgDatas = dtb__1700; f_DtProgram_dtProgDefs = dtb__1701; f_DtProgram_dtProgGoals = dtb__1702; f_DtProgram_dtProgSols = dtb__1703; f_DtProgram_dtProgGlobals = dtb__1704; f_DtProgram_dtProgInsts = dtb__1705; f_DtProgram_dtProgClasses = dtb__1706; f_DtProgram_dtProgNext = dtb__1707; f_DtProgram_dtProgDepths = dtb__1708; f_DtProgram_dtProgWarnings = dtb__1709 } -> dtb__1709
  | _ -> failwith "DT: impossible branch"
))
