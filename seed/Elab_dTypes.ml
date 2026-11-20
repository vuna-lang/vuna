open Vuna_runtime
type t_DtDef = C_DtDef_DtDef of (string) * (Core_dTerm.t_Term) * (Core_dTerm.t_Term) * (Base_dSource.t_Span B_dData_dMaybe.t_Maybe) | C_DtDef_DtAxiom of (string) * (Core_dTerm.t_Term) * (Base_dSource.t_Span B_dData_dMaybe.t_Maybe) | C_DtDef_DtExtern of (string) * (Core_dTerm.t_Term) * (string) * (Base_dSource.t_Span B_dData_dMaybe.t_Maybe)
and t_DtCtor = { f_DtCtor_dtCtorName : string; f_DtCtor_dtCtorFamily : string; f_DtCtor_dtCtorTelescope : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DtCtor_dtCtorType : Core_dTerm.t_Term; f_DtCtor_dtCtorSpan : Base_dSource.t_Span B_dData_dMaybe.t_Maybe }
and t_DtFieldMeta = { f_DtFieldMeta_dtFieldName : string; f_DtFieldMeta_dtFieldIndex : int; f_DtFieldMeta_dtFieldType : Core_dTerm.t_Term }
and t_DtData = { f_DtData_dtDataName : string; f_DtData_dtDataParams : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DtData_dtDataCtors : t_DtCtor B_dData_dList.t_List; f_DtData_dtDataKind : Core_dTerm.t_Term; f_DtData_dtDataViaClasses : string B_dData_dList.t_List; f_DtData_dtDataLinear : bool; f_DtData_dtDataRepr : Frontend_dAst.t_ReprTier; f_DtData_dtDataFields : t_DtFieldMeta B_dData_dList.t_List; f_DtData_dtDataIsRecord : bool }
and t_DtGoal = { f_DtGoal_dtGoalMeta : int; f_DtGoal_dtGoalSpan : Base_dSource.t_Span; f_DtGoal_dtGoalType : Core_dTerm.t_Value; f_DtGoal_dtGoalCtx : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DtGoal_dtGoalName : string }
and t_DtClass = { f_DtClass_dtClassName : string; f_DtClass_dtClassParams : string B_dData_dList.t_List; f_DtClass_dtClassSupers : Core_dTerm.t_Term B_dData_dList.t_List; f_DtClass_dtClassMethods : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DtClass_dtClassFieldTys : Core_dTerm.t_Term B_dData_dList.t_List; f_DtClass_dtClassMethodSpans : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List }
and t_DtInst = { f_DtInst_dtInstName : string; f_DtInst_dtInstTele : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DtInst_dtInstCtx : Core_dTerm.t_Term B_dData_dList.t_List; f_DtInst_dtInstHead : Core_dTerm.t_Term; f_DtInst_dtInstSpan : Base_dSource.t_Span B_dData_dMaybe.t_Maybe }
and t_InstStore = { f_InstStore_instsList : t_DtInst B_dData_dList.t_List; f_InstStore_instsByFamily : (string, t_DtInst B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap }
and t_ConstraintKind = C_ConstraintKind_CkDict | C_ConstraintKind_CkRow
and t_Constraint = { f_Constraint_conId : int; f_Constraint_conKind : t_ConstraintKind; f_Constraint_conMeta : int; f_Constraint_conDom : Core_dTerm.t_Value; f_Constraint_conSpan : Base_dSource.t_Span B_dData_dMaybe.t_Maybe; f_Constraint_conDepth : int }
and t_ConstraintStore = { f_ConstraintStore_csPending : t_Constraint B_dContainer_dQueue.t_Queue; f_ConstraintStore_csNextId : int; f_ConstraintStore_csTried : (int, int) B_dContainer_dHashMap.t_HashMap; f_ConstraintStore_csSolsCount : int; f_ConstraintStore_csPassNext : int; f_ConstraintStore_csPassSols : int; f_ConstraintStore_csCtorIndexComplete : bool }
and t_Ec = { f_Ec_ecNext : int; f_Ec_ecSols : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Ec_ecDefsRev : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Ec_ecDatas : t_DtData B_dData_dList.t_List; f_Ec_ecDepthOfMeta : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Ec_ecGoals : t_DtGoal B_dData_dList.t_List; f_Ec_ecInsts : t_InstStore; f_Ec_ecClasses : t_DtClass B_dData_dList.t_List; f_Ec_ecConstraints : t_ConstraintStore; f_Ec_ecDefTbl : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap; f_Ec_ecGlobalsTbl : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap; f_Ec_ecSolTbl : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap; f_Ec_ecDepthTbl : (int, int) B_dContainer_dHashMap.t_HashMap; f_Ec_ecGlobalsComplete : bool; f_Ec_ecClausesTbl : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_Ec_ecCtorTbl : (string, t_DtCtor) B_dContainer_dHashMap.t_HashMap; f_Ec_ecHasLinear : bool; f_Ec_ecMetaSpans : (int, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Ec_ecUseSpans : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Ec_ecWarnings : Base_dDiag.t_Diagnostic B_dData_dList.t_List; f_Ec_ecCounters : string B_dData_dList.t_List; f_Ec_ecErrors : Base_dDiag.t_Diagnostic B_dData_dList.t_List }
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

# 72 "Vuna/Compiler/Elab/Types.vuna"
let v_dtCtorName = (fun (mc0 : t_DtCtor) -> (match mc0 with
  | { f_DtCtor_dtCtorName = dtb__59; f_DtCtor_dtCtorFamily = dtb__60; f_DtCtor_dtCtorTelescope = dtb__61; f_DtCtor_dtCtorType = dtb__62; f_DtCtor_dtCtorSpan = dtb__63 } -> dtb__59
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Elab/Types.vuna"
let v_dtCtorFamily = (fun (mc0 : t_DtCtor) -> (match mc0 with
  | { f_DtCtor_dtCtorName = dtb__64; f_DtCtor_dtCtorFamily = dtb__65; f_DtCtor_dtCtorTelescope = dtb__66; f_DtCtor_dtCtorType = dtb__67; f_DtCtor_dtCtorSpan = dtb__68 } -> dtb__65
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Elab/Types.vuna"
let v_dtCtorTelescope = (fun (mc0 : t_DtCtor) -> (match mc0 with
  | { f_DtCtor_dtCtorName = dtb__69; f_DtCtor_dtCtorFamily = dtb__70; f_DtCtor_dtCtorTelescope = dtb__71; f_DtCtor_dtCtorType = dtb__72; f_DtCtor_dtCtorSpan = dtb__73 } -> dtb__71
  | _ -> failwith "DT: impossible branch"
))

# 81 "Vuna/Compiler/Elab/Types.vuna"
let v_dtCtorType = (fun (mc0 : t_DtCtor) -> (match mc0 with
  | { f_DtCtor_dtCtorName = dtb__74; f_DtCtor_dtCtorFamily = dtb__75; f_DtCtor_dtCtorTelescope = dtb__76; f_DtCtor_dtCtorType = dtb__77; f_DtCtor_dtCtorSpan = dtb__78 } -> dtb__77
  | _ -> failwith "DT: impossible branch"
))

# 111 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataName = (fun (mc0 : t_DtData) -> (match mc0 with
  | { f_DtData_dtDataName = dtb__79; f_DtData_dtDataParams = dtb__80; f_DtData_dtDataCtors = dtb__81; f_DtData_dtDataKind = dtb__82; f_DtData_dtDataViaClasses = dtb__83; f_DtData_dtDataLinear = dtb__84; f_DtData_dtDataRepr = dtb__85; f_DtData_dtDataFields = dtb__86; f_DtData_dtDataIsRecord = dtb__87 } -> dtb__79
  | _ -> failwith "DT: impossible branch"
))

# 114 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataCtors = (fun (mc0 : t_DtData) -> (match mc0 with
  | { f_DtData_dtDataName = dtb__88; f_DtData_dtDataParams = dtb__89; f_DtData_dtDataCtors = dtb__90; f_DtData_dtDataKind = dtb__91; f_DtData_dtDataViaClasses = dtb__92; f_DtData_dtDataLinear = dtb__93; f_DtData_dtDataRepr = dtb__94; f_DtData_dtDataFields = dtb__95; f_DtData_dtDataIsRecord = dtb__96 } -> dtb__90
  | _ -> failwith "DT: impossible branch"
))

# 117 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataKind = (fun (mc0 : t_DtData) -> (match mc0 with
  | { f_DtData_dtDataName = dtb__97; f_DtData_dtDataParams = dtb__98; f_DtData_dtDataCtors = dtb__99; f_DtData_dtDataKind = dtb__100; f_DtData_dtDataViaClasses = dtb__101; f_DtData_dtDataLinear = dtb__102; f_DtData_dtDataRepr = dtb__103; f_DtData_dtDataFields = dtb__104; f_DtData_dtDataIsRecord = dtb__105 } -> dtb__100
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataViaClasses = (fun (mc0 : t_DtData) -> (match mc0 with
  | { f_DtData_dtDataName = dtb__106; f_DtData_dtDataParams = dtb__107; f_DtData_dtDataCtors = dtb__108; f_DtData_dtDataKind = dtb__109; f_DtData_dtDataViaClasses = dtb__110; f_DtData_dtDataLinear = dtb__111; f_DtData_dtDataRepr = dtb__112; f_DtData_dtDataFields = dtb__113; f_DtData_dtDataIsRecord = dtb__114 } -> dtb__110
  | _ -> failwith "DT: impossible branch"
))

# 125 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataRepr = (fun (mc0 : t_DtData) -> (match mc0 with
  | { f_DtData_dtDataName = dtb__115; f_DtData_dtDataParams = dtb__116; f_DtData_dtDataCtors = dtb__117; f_DtData_dtDataKind = dtb__118; f_DtData_dtDataViaClasses = dtb__119; f_DtData_dtDataLinear = dtb__120; f_DtData_dtDataRepr = dtb__121; f_DtData_dtDataFields = dtb__122; f_DtData_dtDataIsRecord = dtb__123 } -> dtb__121
  | _ -> failwith "DT: impossible branch"
))

# 129 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataFields = (fun (mc0 : t_DtData) -> (match mc0 with
  | { f_DtData_dtDataName = dtb__124; f_DtData_dtDataParams = dtb__125; f_DtData_dtDataCtors = dtb__126; f_DtData_dtDataKind = dtb__127; f_DtData_dtDataViaClasses = dtb__128; f_DtData_dtDataLinear = dtb__129; f_DtData_dtDataRepr = dtb__130; f_DtData_dtDataFields = dtb__131; f_DtData_dtDataIsRecord = dtb__132 } -> dtb__131
  | _ -> failwith "DT: impossible branch"
))

# 133 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataIsRecord = (fun (mc0 : t_DtData) -> (match mc0 with
  | { f_DtData_dtDataName = dtb__133; f_DtData_dtDataParams = dtb__134; f_DtData_dtDataCtors = dtb__135; f_DtData_dtDataKind = dtb__136; f_DtData_dtDataViaClasses = dtb__137; f_DtData_dtDataLinear = dtb__138; f_DtData_dtDataRepr = dtb__139; f_DtData_dtDataFields = dtb__140; f_DtData_dtDataIsRecord = dtb__141 } -> dtb__141
  | _ -> failwith "DT: impossible branch"
))

# 136 "Vuna/Compiler/Elab/Types.vuna"
let v_dtDataLinear = (fun (mc0 : t_DtData) -> (match mc0 with
  | { f_DtData_dtDataName = dtb__142; f_DtData_dtDataParams = dtb__143; f_DtData_dtDataCtors = dtb__144; f_DtData_dtDataKind = dtb__145; f_DtData_dtDataViaClasses = dtb__146; f_DtData_dtDataLinear = dtb__147; f_DtData_dtDataRepr = dtb__148; f_DtData_dtDataFields = dtb__149; f_DtData_dtDataIsRecord = dtb__150 } -> dtb__147
  | _ -> failwith "DT: impossible branch"
))

# 159 "Vuna/Compiler/Elab/Types.vuna"
let v_dtClassName = (fun (mc0 : t_DtClass) -> (match mc0 with
  | { f_DtClass_dtClassName = dtb__151; f_DtClass_dtClassParams = dtb__152; f_DtClass_dtClassSupers = dtb__153; f_DtClass_dtClassMethods = dtb__154; f_DtClass_dtClassFieldTys = dtb__155; f_DtClass_dtClassMethodSpans = dtb__156 } -> dtb__151
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Elab/Types.vuna"
let v_dtInstName = (fun (mc0 : t_DtInst) -> (match mc0 with
  | { f_DtInst_dtInstName = dtb__157; f_DtInst_dtInstTele = dtb__158; f_DtInst_dtInstCtx = dtb__159; f_DtInst_dtInstHead = dtb__160; f_DtInst_dtInstSpan = dtb__161 } -> dtb__157
  | _ -> failwith "DT: impossible branch"
))

# 178 "Vuna/Compiler/Elab/Types.vuna"
let rec v_flattenTaggedApp = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TGlobal (dtb__162) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__162; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | Core_dTerm.C_Term_TApp (dtb__163, dtb__164, dtb__165) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__166) -> (match dtb__166 with
  | { B_dData_dPair.f_Pair_first = dtb__167; B_dData_dPair.f_Pair_second = dtb__168 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__167; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__168) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__164; B_dData_dPair.f_Pair_second = dtb__165 }, B_dData_dList.C_List_Nil))) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_flattenTaggedApp dtb__163))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 200 "Vuna/Compiler/Elab/Types.vuna"
let v_instFamilyOf = (fun (i : t_DtInst) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb__169) -> (match dtb__169 with
  | { B_dData_dPair.f_Pair_first = dtb__170; B_dData_dPair.f_Pair_second = dtb__171 } -> dtb__170
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_flattenTaggedApp (i).f_DtInst_dtInstHead)))

# 207 "Vuna/Compiler/Elab/Types.vuna"
let v_instStoreEmpty = { f_InstStore_instsList = B_dData_dList.C_List_Nil; f_InstStore_instsByFamily = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) B_dData_dList.C_List_Nil) }

# 217 "Vuna/Compiler/Elab/Types.vuna"
let v_instStorePush = (fun (store : t_InstStore) (i : t_DtInst) -> ((fun fam -> ((fun bucket -> { f_InstStore_instsList = ((B_dData_dList.v_append (store).f_InstStore_instsList) (B_dData_dList.C_List__x58__x58_ (i, B_dData_dList.C_List_Nil))); f_InstStore_instsByFamily = (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) fam) ((B_dData_dList.v_append bucket) (B_dData_dList.C_List__x58__x58_ (i, B_dData_dList.C_List_Nil)))) (store).f_InstStore_instsByFamily) }) (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) fam) (store).f_InstStore_instsByFamily) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__172) -> dtb__172
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))) (v_instFamilyOf i)))

# 212 "Vuna/Compiler/Elab/Types.vuna"
let rec v_instStoreOf = (fun (mc0 : t_DtInst B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__173, dtb__174) -> ((v_instStorePush (v_instStoreOf dtb__174)) dtb__173)
  | B_dData_dList.C_List_Nil -> v_instStoreEmpty
  | _ -> failwith "DT: impossible branch"
))

# 231 "Vuna/Compiler/Elab/Types.vuna"
let v_instStoreFamily = (fun (store : t_InstStore) (fam : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) fam) (store).f_InstStore_instsByFamily) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__175) -> dtb__175
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 276 "Vuna/Compiler/Elab/Types.vuna"
let v_csEmpty = { f_ConstraintStore_csPending = B_dContainer_dQueue.v_empty; f_ConstraintStore_csNextId = 0; f_ConstraintStore_csTried = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) B_dData_dList.C_List_Nil); f_ConstraintStore_csSolsCount = 0; f_ConstraintStore_csPassNext = (0 - 1); f_ConstraintStore_csPassSols = (0 - 1); f_ConstraintStore_csCtorIndexComplete = false }

# 315 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutNext = (fun (mc0 : t_Ec) (mc1 : int) -> (match mc0 with
  | { f_Ec_ecNext = dtb__176; f_Ec_ecSols = dtb__177; f_Ec_ecDefsRev = dtb__178; f_Ec_ecDatas = dtb__179; f_Ec_ecDepthOfMeta = dtb__180; f_Ec_ecGoals = dtb__181; f_Ec_ecInsts = dtb__182; f_Ec_ecClasses = dtb__183; f_Ec_ecConstraints = dtb__184; f_Ec_ecDefTbl = dtb__185; f_Ec_ecGlobalsTbl = dtb__186; f_Ec_ecSolTbl = dtb__187; f_Ec_ecDepthTbl = dtb__188; f_Ec_ecGlobalsComplete = dtb__189; f_Ec_ecClausesTbl = dtb__190; f_Ec_ecCtorTbl = dtb__191; f_Ec_ecHasLinear = dtb__192; f_Ec_ecMetaSpans = dtb__193; f_Ec_ecUseSpans = dtb__194; f_Ec_ecWarnings = dtb__195; f_Ec_ecCounters = dtb__196; f_Ec_ecErrors = dtb__197 } -> { f_Ec_ecNext = mc1; f_Ec_ecSols = dtb__177; f_Ec_ecDefsRev = dtb__178; f_Ec_ecDatas = dtb__179; f_Ec_ecDepthOfMeta = dtb__180; f_Ec_ecGoals = dtb__181; f_Ec_ecInsts = dtb__182; f_Ec_ecClasses = dtb__183; f_Ec_ecConstraints = dtb__184; f_Ec_ecDefTbl = dtb__185; f_Ec_ecGlobalsTbl = dtb__186; f_Ec_ecSolTbl = dtb__187; f_Ec_ecDepthTbl = dtb__188; f_Ec_ecGlobalsComplete = dtb__189; f_Ec_ecClausesTbl = dtb__190; f_Ec_ecCtorTbl = dtb__191; f_Ec_ecHasLinear = dtb__192; f_Ec_ecMetaSpans = dtb__193; f_Ec_ecUseSpans = dtb__194; f_Ec_ecWarnings = dtb__195; f_Ec_ecCounters = dtb__196; f_Ec_ecErrors = dtb__197 }
  | _ -> failwith "DT: impossible branch"
))

# 341 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutClausesTbl = (fun (mc0 : t_Ec) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | { f_Ec_ecNext = dtb__198; f_Ec_ecSols = dtb__199; f_Ec_ecDefsRev = dtb__200; f_Ec_ecDatas = dtb__201; f_Ec_ecDepthOfMeta = dtb__202; f_Ec_ecGoals = dtb__203; f_Ec_ecInsts = dtb__204; f_Ec_ecClasses = dtb__205; f_Ec_ecConstraints = dtb__206; f_Ec_ecDefTbl = dtb__207; f_Ec_ecGlobalsTbl = dtb__208; f_Ec_ecSolTbl = dtb__209; f_Ec_ecDepthTbl = dtb__210; f_Ec_ecGlobalsComplete = dtb__211; f_Ec_ecClausesTbl = dtb__212; f_Ec_ecCtorTbl = dtb__213; f_Ec_ecHasLinear = dtb__214; f_Ec_ecMetaSpans = dtb__215; f_Ec_ecUseSpans = dtb__216; f_Ec_ecWarnings = dtb__217; f_Ec_ecCounters = dtb__218; f_Ec_ecErrors = dtb__219 } -> { f_Ec_ecNext = dtb__198; f_Ec_ecSols = dtb__199; f_Ec_ecDefsRev = dtb__200; f_Ec_ecDatas = dtb__201; f_Ec_ecDepthOfMeta = dtb__202; f_Ec_ecGoals = dtb__203; f_Ec_ecInsts = dtb__204; f_Ec_ecClasses = dtb__205; f_Ec_ecConstraints = dtb__206; f_Ec_ecDefTbl = dtb__207; f_Ec_ecGlobalsTbl = dtb__208; f_Ec_ecSolTbl = dtb__209; f_Ec_ecDepthTbl = dtb__210; f_Ec_ecGlobalsComplete = dtb__211; f_Ec_ecClausesTbl = mc1; f_Ec_ecCtorTbl = dtb__213; f_Ec_ecHasLinear = dtb__214; f_Ec_ecMetaSpans = dtb__215; f_Ec_ecUseSpans = dtb__216; f_Ec_ecWarnings = dtb__217; f_Ec_ecCounters = dtb__218; f_Ec_ecErrors = dtb__219 }
  | _ -> failwith "DT: impossible branch"
))

# 367 "Vuna/Compiler/Elab/Types.vuna"
let v_ecNext = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__220; f_Ec_ecSols = dtb__221; f_Ec_ecDefsRev = dtb__222; f_Ec_ecDatas = dtb__223; f_Ec_ecDepthOfMeta = dtb__224; f_Ec_ecGoals = dtb__225; f_Ec_ecInsts = dtb__226; f_Ec_ecClasses = dtb__227; f_Ec_ecConstraints = dtb__228; f_Ec_ecDefTbl = dtb__229; f_Ec_ecGlobalsTbl = dtb__230; f_Ec_ecSolTbl = dtb__231; f_Ec_ecDepthTbl = dtb__232; f_Ec_ecGlobalsComplete = dtb__233; f_Ec_ecClausesTbl = dtb__234; f_Ec_ecCtorTbl = dtb__235; f_Ec_ecHasLinear = dtb__236; f_Ec_ecMetaSpans = dtb__237; f_Ec_ecUseSpans = dtb__238; f_Ec_ecWarnings = dtb__239; f_Ec_ecCounters = dtb__240; f_Ec_ecErrors = dtb__241 } -> dtb__220
  | _ -> failwith "DT: impossible branch"
))

# 371 "Vuna/Compiler/Elab/Types.vuna"
let v_ecSols = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__242; f_Ec_ecSols = dtb__243; f_Ec_ecDefsRev = dtb__244; f_Ec_ecDatas = dtb__245; f_Ec_ecDepthOfMeta = dtb__246; f_Ec_ecGoals = dtb__247; f_Ec_ecInsts = dtb__248; f_Ec_ecClasses = dtb__249; f_Ec_ecConstraints = dtb__250; f_Ec_ecDefTbl = dtb__251; f_Ec_ecGlobalsTbl = dtb__252; f_Ec_ecSolTbl = dtb__253; f_Ec_ecDepthTbl = dtb__254; f_Ec_ecGlobalsComplete = dtb__255; f_Ec_ecClausesTbl = dtb__256; f_Ec_ecCtorTbl = dtb__257; f_Ec_ecHasLinear = dtb__258; f_Ec_ecMetaSpans = dtb__259; f_Ec_ecUseSpans = dtb__260; f_Ec_ecWarnings = dtb__261; f_Ec_ecCounters = dtb__262; f_Ec_ecErrors = dtb__263 } -> dtb__243
  | _ -> failwith "DT: impossible branch"
))

# 376 "Vuna/Compiler/Elab/Types.vuna"
let v_ecDefs = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__264; f_Ec_ecSols = dtb__265; f_Ec_ecDefsRev = dtb__266; f_Ec_ecDatas = dtb__267; f_Ec_ecDepthOfMeta = dtb__268; f_Ec_ecGoals = dtb__269; f_Ec_ecInsts = dtb__270; f_Ec_ecClasses = dtb__271; f_Ec_ecConstraints = dtb__272; f_Ec_ecDefTbl = dtb__273; f_Ec_ecGlobalsTbl = dtb__274; f_Ec_ecSolTbl = dtb__275; f_Ec_ecDepthTbl = dtb__276; f_Ec_ecGlobalsComplete = dtb__277; f_Ec_ecClausesTbl = dtb__278; f_Ec_ecCtorTbl = dtb__279; f_Ec_ecHasLinear = dtb__280; f_Ec_ecMetaSpans = dtb__281; f_Ec_ecUseSpans = dtb__282; f_Ec_ecWarnings = dtb__283; f_Ec_ecCounters = dtb__284; f_Ec_ecErrors = dtb__285 } -> (B_dData_dList.v_reverse dtb__266)
  | _ -> failwith "DT: impossible branch"
))

# 381 "Vuna/Compiler/Elab/Types.vuna"
let v_ecDefTbl = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__286; f_Ec_ecSols = dtb__287; f_Ec_ecDefsRev = dtb__288; f_Ec_ecDatas = dtb__289; f_Ec_ecDepthOfMeta = dtb__290; f_Ec_ecGoals = dtb__291; f_Ec_ecInsts = dtb__292; f_Ec_ecClasses = dtb__293; f_Ec_ecConstraints = dtb__294; f_Ec_ecDefTbl = dtb__295; f_Ec_ecGlobalsTbl = dtb__296; f_Ec_ecSolTbl = dtb__297; f_Ec_ecDepthTbl = dtb__298; f_Ec_ecGlobalsComplete = dtb__299; f_Ec_ecClausesTbl = dtb__300; f_Ec_ecCtorTbl = dtb__301; f_Ec_ecHasLinear = dtb__302; f_Ec_ecMetaSpans = dtb__303; f_Ec_ecUseSpans = dtb__304; f_Ec_ecWarnings = dtb__305; f_Ec_ecCounters = dtb__306; f_Ec_ecErrors = dtb__307 } -> dtb__295
  | _ -> failwith "DT: impossible branch"
))

# 387 "Vuna/Compiler/Elab/Types.vuna"
let v_ecGlobalsTbl = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__308; f_Ec_ecSols = dtb__309; f_Ec_ecDefsRev = dtb__310; f_Ec_ecDatas = dtb__311; f_Ec_ecDepthOfMeta = dtb__312; f_Ec_ecGoals = dtb__313; f_Ec_ecInsts = dtb__314; f_Ec_ecClasses = dtb__315; f_Ec_ecConstraints = dtb__316; f_Ec_ecDefTbl = dtb__317; f_Ec_ecGlobalsTbl = dtb__318; f_Ec_ecSolTbl = dtb__319; f_Ec_ecDepthTbl = dtb__320; f_Ec_ecGlobalsComplete = dtb__321; f_Ec_ecClausesTbl = dtb__322; f_Ec_ecCtorTbl = dtb__323; f_Ec_ecHasLinear = dtb__324; f_Ec_ecMetaSpans = dtb__325; f_Ec_ecUseSpans = dtb__326; f_Ec_ecWarnings = dtb__327; f_Ec_ecCounters = dtb__328; f_Ec_ecErrors = dtb__329 } -> dtb__318
  | _ -> failwith "DT: impossible branch"
))

# 391 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutGlobalsTbl = (fun (mc0 : t_Ec) (mc1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | { f_Ec_ecNext = dtb__330; f_Ec_ecSols = dtb__331; f_Ec_ecDefsRev = dtb__332; f_Ec_ecDatas = dtb__333; f_Ec_ecDepthOfMeta = dtb__334; f_Ec_ecGoals = dtb__335; f_Ec_ecInsts = dtb__336; f_Ec_ecClasses = dtb__337; f_Ec_ecConstraints = dtb__338; f_Ec_ecDefTbl = dtb__339; f_Ec_ecGlobalsTbl = dtb__340; f_Ec_ecSolTbl = dtb__341; f_Ec_ecDepthTbl = dtb__342; f_Ec_ecGlobalsComplete = dtb__343; f_Ec_ecClausesTbl = dtb__344; f_Ec_ecCtorTbl = dtb__345; f_Ec_ecHasLinear = dtb__346; f_Ec_ecMetaSpans = dtb__347; f_Ec_ecUseSpans = dtb__348; f_Ec_ecWarnings = dtb__349; f_Ec_ecCounters = dtb__350; f_Ec_ecErrors = dtb__351 } -> { f_Ec_ecNext = dtb__330; f_Ec_ecSols = dtb__331; f_Ec_ecDefsRev = dtb__332; f_Ec_ecDatas = dtb__333; f_Ec_ecDepthOfMeta = dtb__334; f_Ec_ecGoals = dtb__335; f_Ec_ecInsts = dtb__336; f_Ec_ecClasses = dtb__337; f_Ec_ecConstraints = dtb__338; f_Ec_ecDefTbl = dtb__339; f_Ec_ecGlobalsTbl = mc1; f_Ec_ecSolTbl = dtb__341; f_Ec_ecDepthTbl = dtb__342; f_Ec_ecGlobalsComplete = dtb__343; f_Ec_ecClausesTbl = dtb__344; f_Ec_ecCtorTbl = dtb__345; f_Ec_ecHasLinear = dtb__346; f_Ec_ecMetaSpans = dtb__347; f_Ec_ecUseSpans = dtb__348; f_Ec_ecWarnings = dtb__349; f_Ec_ecCounters = dtb__350; f_Ec_ecErrors = dtb__351 }
  | _ -> failwith "DT: impossible branch"
))

# 417 "Vuna/Compiler/Elab/Types.vuna"
let v_ecDatas = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__352; f_Ec_ecSols = dtb__353; f_Ec_ecDefsRev = dtb__354; f_Ec_ecDatas = dtb__355; f_Ec_ecDepthOfMeta = dtb__356; f_Ec_ecGoals = dtb__357; f_Ec_ecInsts = dtb__358; f_Ec_ecClasses = dtb__359; f_Ec_ecConstraints = dtb__360; f_Ec_ecDefTbl = dtb__361; f_Ec_ecGlobalsTbl = dtb__362; f_Ec_ecSolTbl = dtb__363; f_Ec_ecDepthTbl = dtb__364; f_Ec_ecGlobalsComplete = dtb__365; f_Ec_ecClausesTbl = dtb__366; f_Ec_ecCtorTbl = dtb__367; f_Ec_ecHasLinear = dtb__368; f_Ec_ecMetaSpans = dtb__369; f_Ec_ecUseSpans = dtb__370; f_Ec_ecWarnings = dtb__371; f_Ec_ecCounters = dtb__372; f_Ec_ecErrors = dtb__373 } -> dtb__355
  | _ -> failwith "DT: impossible branch"
))

# 421 "Vuna/Compiler/Elab/Types.vuna"
let v_ecDepthTbl = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__374; f_Ec_ecSols = dtb__375; f_Ec_ecDefsRev = dtb__376; f_Ec_ecDatas = dtb__377; f_Ec_ecDepthOfMeta = dtb__378; f_Ec_ecGoals = dtb__379; f_Ec_ecInsts = dtb__380; f_Ec_ecClasses = dtb__381; f_Ec_ecConstraints = dtb__382; f_Ec_ecDefTbl = dtb__383; f_Ec_ecGlobalsTbl = dtb__384; f_Ec_ecSolTbl = dtb__385; f_Ec_ecDepthTbl = dtb__386; f_Ec_ecGlobalsComplete = dtb__387; f_Ec_ecClausesTbl = dtb__388; f_Ec_ecCtorTbl = dtb__389; f_Ec_ecHasLinear = dtb__390; f_Ec_ecMetaSpans = dtb__391; f_Ec_ecUseSpans = dtb__392; f_Ec_ecWarnings = dtb__393; f_Ec_ecCounters = dtb__394; f_Ec_ecErrors = dtb__395 } -> dtb__386
  | _ -> failwith "DT: impossible branch"
))

# 428 "Vuna/Compiler/Elab/Types.vuna"
let v_ecSetGlobalsComplete = (fun (mc0 : t_Ec) (mc1 : bool) -> (match mc0 with
  | { f_Ec_ecNext = dtb__396; f_Ec_ecSols = dtb__397; f_Ec_ecDefsRev = dtb__398; f_Ec_ecDatas = dtb__399; f_Ec_ecDepthOfMeta = dtb__400; f_Ec_ecGoals = dtb__401; f_Ec_ecInsts = dtb__402; f_Ec_ecClasses = dtb__403; f_Ec_ecConstraints = dtb__404; f_Ec_ecDefTbl = dtb__405; f_Ec_ecGlobalsTbl = dtb__406; f_Ec_ecSolTbl = dtb__407; f_Ec_ecDepthTbl = dtb__408; f_Ec_ecGlobalsComplete = dtb__409; f_Ec_ecClausesTbl = dtb__410; f_Ec_ecCtorTbl = dtb__411; f_Ec_ecHasLinear = dtb__412; f_Ec_ecMetaSpans = dtb__413; f_Ec_ecUseSpans = dtb__414; f_Ec_ecWarnings = dtb__415; f_Ec_ecCounters = dtb__416; f_Ec_ecErrors = dtb__417 } -> { f_Ec_ecNext = dtb__396; f_Ec_ecSols = dtb__397; f_Ec_ecDefsRev = dtb__398; f_Ec_ecDatas = dtb__399; f_Ec_ecDepthOfMeta = dtb__400; f_Ec_ecGoals = dtb__401; f_Ec_ecInsts = dtb__402; f_Ec_ecClasses = dtb__403; f_Ec_ecConstraints = dtb__404; f_Ec_ecDefTbl = dtb__405; f_Ec_ecGlobalsTbl = dtb__406; f_Ec_ecSolTbl = dtb__407; f_Ec_ecDepthTbl = dtb__408; f_Ec_ecGlobalsComplete = mc1; f_Ec_ecClausesTbl = dtb__410; f_Ec_ecCtorTbl = dtb__411; f_Ec_ecHasLinear = dtb__412; f_Ec_ecMetaSpans = dtb__413; f_Ec_ecUseSpans = dtb__414; f_Ec_ecWarnings = dtb__415; f_Ec_ecCounters = dtb__416; f_Ec_ecErrors = dtb__417 }
  | _ -> failwith "DT: impossible branch"
))

# 454 "Vuna/Compiler/Elab/Types.vuna"
let v_ecGoals = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__418; f_Ec_ecSols = dtb__419; f_Ec_ecDefsRev = dtb__420; f_Ec_ecDatas = dtb__421; f_Ec_ecDepthOfMeta = dtb__422; f_Ec_ecGoals = dtb__423; f_Ec_ecInsts = dtb__424; f_Ec_ecClasses = dtb__425; f_Ec_ecConstraints = dtb__426; f_Ec_ecDefTbl = dtb__427; f_Ec_ecGlobalsTbl = dtb__428; f_Ec_ecSolTbl = dtb__429; f_Ec_ecDepthTbl = dtb__430; f_Ec_ecGlobalsComplete = dtb__431; f_Ec_ecClausesTbl = dtb__432; f_Ec_ecCtorTbl = dtb__433; f_Ec_ecHasLinear = dtb__434; f_Ec_ecMetaSpans = dtb__435; f_Ec_ecUseSpans = dtb__436; f_Ec_ecWarnings = dtb__437; f_Ec_ecCounters = dtb__438; f_Ec_ecErrors = dtb__439 } -> dtb__423
  | _ -> failwith "DT: impossible branch"
))

# 458 "Vuna/Compiler/Elab/Types.vuna"
let v_ecInsts = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__440; f_Ec_ecSols = dtb__441; f_Ec_ecDefsRev = dtb__442; f_Ec_ecDatas = dtb__443; f_Ec_ecDepthOfMeta = dtb__444; f_Ec_ecGoals = dtb__445; f_Ec_ecInsts = dtb__446; f_Ec_ecClasses = dtb__447; f_Ec_ecConstraints = dtb__448; f_Ec_ecDefTbl = dtb__449; f_Ec_ecGlobalsTbl = dtb__450; f_Ec_ecSolTbl = dtb__451; f_Ec_ecDepthTbl = dtb__452; f_Ec_ecGlobalsComplete = dtb__453; f_Ec_ecClausesTbl = dtb__454; f_Ec_ecCtorTbl = dtb__455; f_Ec_ecHasLinear = dtb__456; f_Ec_ecMetaSpans = dtb__457; f_Ec_ecUseSpans = dtb__458; f_Ec_ecWarnings = dtb__459; f_Ec_ecCounters = dtb__460; f_Ec_ecErrors = dtb__461 } -> (dtb__446).f_InstStore_instsList
  | _ -> failwith "DT: impossible branch"
))

# 464 "Vuna/Compiler/Elab/Types.vuna"
let v_ecInstsFamily = (fun (mc0 : t_Ec) (mc1 : string) -> (match mc0 with
  | { f_Ec_ecNext = dtb__462; f_Ec_ecSols = dtb__463; f_Ec_ecDefsRev = dtb__464; f_Ec_ecDatas = dtb__465; f_Ec_ecDepthOfMeta = dtb__466; f_Ec_ecGoals = dtb__467; f_Ec_ecInsts = dtb__468; f_Ec_ecClasses = dtb__469; f_Ec_ecConstraints = dtb__470; f_Ec_ecDefTbl = dtb__471; f_Ec_ecGlobalsTbl = dtb__472; f_Ec_ecSolTbl = dtb__473; f_Ec_ecDepthTbl = dtb__474; f_Ec_ecGlobalsComplete = dtb__475; f_Ec_ecClausesTbl = dtb__476; f_Ec_ecCtorTbl = dtb__477; f_Ec_ecHasLinear = dtb__478; f_Ec_ecMetaSpans = dtb__479; f_Ec_ecUseSpans = dtb__480; f_Ec_ecWarnings = dtb__481; f_Ec_ecCounters = dtb__482; f_Ec_ecErrors = dtb__483 } -> ((v_instStoreFamily dtb__468) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 482 "Vuna/Compiler/Elab/Types.vuna"
let rec v_bucketCount = (fun (mc0 : (string, t_DtInst B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__484, dtb__485) -> ((B_dData_dList.v_length (B_dData_dPair.v_secondOf dtb__484)) + (v_bucketCount dtb__485))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 494 "Vuna/Compiler/Elab/Types.vuna"
let rec v_instNamesEq = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__486, dtb__487) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__488, dtb__489) -> (if (dtb__486 = dtb__488) then ((v_instNamesEq dtb__487) dtb__489) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__490, dtb__491) -> false
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 487 "Vuna/Compiler/Elab/Types.vuna"
let rec v_allBucketsMatch = (fun (mc0 : t_DtInst B_dData_dList.t_List) (mc1 : (string, t_DtInst B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__492, dtb__493) -> (match dtb__492 with
  | { B_dData_dPair.f_Pair_first = dtb__494; B_dData_dPair.f_Pair_second = dtb__495 } -> (if ((v_instNamesEq ((B_dData_dList.v_map v_dtInstName) dtb__495)) ((B_dData_dList.v_map v_dtInstName) ((B_dData_dList.v_filter (fun (i : t_DtInst) -> ((v_instFamilyOf i) = dtb__494))) mc0))) then ((v_allBucketsMatch mc0) dtb__493) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 474 "Vuna/Compiler/Elab/Types.vuna"
let v_ecInstsAudit = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__496; f_Ec_ecSols = dtb__497; f_Ec_ecDefsRev = dtb__498; f_Ec_ecDatas = dtb__499; f_Ec_ecDepthOfMeta = dtb__500; f_Ec_ecGoals = dtb__501; f_Ec_ecInsts = dtb__502; f_Ec_ecClasses = dtb__503; f_Ec_ecConstraints = dtb__504; f_Ec_ecDefTbl = dtb__505; f_Ec_ecGlobalsTbl = dtb__506; f_Ec_ecSolTbl = dtb__507; f_Ec_ecDepthTbl = dtb__508; f_Ec_ecGlobalsComplete = dtb__509; f_Ec_ecClausesTbl = dtb__510; f_Ec_ecCtorTbl = dtb__511; f_Ec_ecHasLinear = dtb__512; f_Ec_ecMetaSpans = dtb__513; f_Ec_ecUseSpans = dtb__514; f_Ec_ecWarnings = dtb__515; f_Ec_ecCounters = dtb__516; f_Ec_ecErrors = dtb__517 } -> ((fun pairs -> ((fun list -> (if ((v_bucketCount pairs) = (B_dData_dList.v_length list)) then ((v_allBucketsMatch list) pairs) else false)) (dtb__502).f_InstStore_instsList)) (B_dContainer_dHashMap.v_toList (dtb__502).f_InstStore_instsByFamily))
  | _ -> failwith "DT: impossible branch"
))

# 500 "Vuna/Compiler/Elab/Types.vuna"
let v_ecClasses = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__518; f_Ec_ecSols = dtb__519; f_Ec_ecDefsRev = dtb__520; f_Ec_ecDatas = dtb__521; f_Ec_ecDepthOfMeta = dtb__522; f_Ec_ecGoals = dtb__523; f_Ec_ecInsts = dtb__524; f_Ec_ecClasses = dtb__525; f_Ec_ecConstraints = dtb__526; f_Ec_ecDefTbl = dtb__527; f_Ec_ecGlobalsTbl = dtb__528; f_Ec_ecSolTbl = dtb__529; f_Ec_ecDepthTbl = dtb__530; f_Ec_ecGlobalsComplete = dtb__531; f_Ec_ecClausesTbl = dtb__532; f_Ec_ecCtorTbl = dtb__533; f_Ec_ecHasLinear = dtb__534; f_Ec_ecMetaSpans = dtb__535; f_Ec_ecUseSpans = dtb__536; f_Ec_ecWarnings = dtb__537; f_Ec_ecCounters = dtb__538; f_Ec_ecErrors = dtb__539 } -> dtb__525
  | _ -> failwith "DT: impossible branch"
))

# 504 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddGoal = (fun (mc0 : t_Ec) (mc1 : t_DtGoal) -> (match mc0 with
  | { f_Ec_ecNext = dtb__540; f_Ec_ecSols = dtb__541; f_Ec_ecDefsRev = dtb__542; f_Ec_ecDatas = dtb__543; f_Ec_ecDepthOfMeta = dtb__544; f_Ec_ecGoals = dtb__545; f_Ec_ecInsts = dtb__546; f_Ec_ecClasses = dtb__547; f_Ec_ecConstraints = dtb__548; f_Ec_ecDefTbl = dtb__549; f_Ec_ecGlobalsTbl = dtb__550; f_Ec_ecSolTbl = dtb__551; f_Ec_ecDepthTbl = dtb__552; f_Ec_ecGlobalsComplete = dtb__553; f_Ec_ecClausesTbl = dtb__554; f_Ec_ecCtorTbl = dtb__555; f_Ec_ecHasLinear = dtb__556; f_Ec_ecMetaSpans = dtb__557; f_Ec_ecUseSpans = dtb__558; f_Ec_ecWarnings = dtb__559; f_Ec_ecCounters = dtb__560; f_Ec_ecErrors = dtb__561 } -> { f_Ec_ecNext = dtb__540; f_Ec_ecSols = dtb__541; f_Ec_ecDefsRev = dtb__542; f_Ec_ecDatas = dtb__543; f_Ec_ecDepthOfMeta = dtb__544; f_Ec_ecGoals = ((B_dData_dList.v_append dtb__545) (B_dData_dList.C_List__x58__x58_ (mc1, B_dData_dList.C_List_Nil))); f_Ec_ecInsts = dtb__546; f_Ec_ecClasses = dtb__547; f_Ec_ecConstraints = dtb__548; f_Ec_ecDefTbl = dtb__549; f_Ec_ecGlobalsTbl = dtb__550; f_Ec_ecSolTbl = dtb__551; f_Ec_ecDepthTbl = dtb__552; f_Ec_ecGlobalsComplete = dtb__553; f_Ec_ecClausesTbl = dtb__554; f_Ec_ecCtorTbl = dtb__555; f_Ec_ecHasLinear = dtb__556; f_Ec_ecMetaSpans = dtb__557; f_Ec_ecUseSpans = dtb__558; f_Ec_ecWarnings = dtb__559; f_Ec_ecCounters = dtb__560; f_Ec_ecErrors = dtb__561 }
  | _ -> failwith "DT: impossible branch"
))

# 533 "Vuna/Compiler/Elab/Types.vuna"
let rec v_hasInstName = (fun (mc0 : string) (mc1 : t_DtInst B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__562, dtb__563) -> (if ((v_dtInstName dtb__562) = mc0) then true else ((v_hasInstName mc0) dtb__563))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 537 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddInstRaw = (fun (mc0 : t_Ec) (mc1 : t_DtInst) -> (match mc0 with
  | { f_Ec_ecNext = dtb__564; f_Ec_ecSols = dtb__565; f_Ec_ecDefsRev = dtb__566; f_Ec_ecDatas = dtb__567; f_Ec_ecDepthOfMeta = dtb__568; f_Ec_ecGoals = dtb__569; f_Ec_ecInsts = dtb__570; f_Ec_ecClasses = dtb__571; f_Ec_ecConstraints = dtb__572; f_Ec_ecDefTbl = dtb__573; f_Ec_ecGlobalsTbl = dtb__574; f_Ec_ecSolTbl = dtb__575; f_Ec_ecDepthTbl = dtb__576; f_Ec_ecGlobalsComplete = dtb__577; f_Ec_ecClausesTbl = dtb__578; f_Ec_ecCtorTbl = dtb__579; f_Ec_ecHasLinear = dtb__580; f_Ec_ecMetaSpans = dtb__581; f_Ec_ecUseSpans = dtb__582; f_Ec_ecWarnings = dtb__583; f_Ec_ecCounters = dtb__584; f_Ec_ecErrors = dtb__585 } -> { f_Ec_ecNext = dtb__564; f_Ec_ecSols = dtb__565; f_Ec_ecDefsRev = dtb__566; f_Ec_ecDatas = dtb__567; f_Ec_ecDepthOfMeta = dtb__568; f_Ec_ecGoals = dtb__569; f_Ec_ecInsts = ((v_instStorePush dtb__570) mc1); f_Ec_ecClasses = dtb__571; f_Ec_ecConstraints = dtb__572; f_Ec_ecDefTbl = dtb__573; f_Ec_ecGlobalsTbl = dtb__574; f_Ec_ecSolTbl = dtb__575; f_Ec_ecDepthTbl = dtb__576; f_Ec_ecGlobalsComplete = dtb__577; f_Ec_ecClausesTbl = dtb__578; f_Ec_ecCtorTbl = dtb__579; f_Ec_ecHasLinear = dtb__580; f_Ec_ecMetaSpans = dtb__581; f_Ec_ecUseSpans = dtb__582; f_Ec_ecWarnings = dtb__583; f_Ec_ecCounters = dtb__584; f_Ec_ecErrors = dtb__585 }
  | _ -> failwith "DT: impossible branch"
))

# 530 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddInst = (fun (ec : t_Ec) (i : t_DtInst) -> (if ((v_hasInstName (v_dtInstName i)) (v_ecInsts ec)) then ec else ((v_ecAddInstRaw ec) i)))

# 563 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddClass = (fun (mc0 : t_Ec) (mc1 : t_DtClass) -> (match mc0 with
  | { f_Ec_ecNext = dtb__586; f_Ec_ecSols = dtb__587; f_Ec_ecDefsRev = dtb__588; f_Ec_ecDatas = dtb__589; f_Ec_ecDepthOfMeta = dtb__590; f_Ec_ecGoals = dtb__591; f_Ec_ecInsts = dtb__592; f_Ec_ecClasses = dtb__593; f_Ec_ecConstraints = dtb__594; f_Ec_ecDefTbl = dtb__595; f_Ec_ecGlobalsTbl = dtb__596; f_Ec_ecSolTbl = dtb__597; f_Ec_ecDepthTbl = dtb__598; f_Ec_ecGlobalsComplete = dtb__599; f_Ec_ecClausesTbl = dtb__600; f_Ec_ecCtorTbl = dtb__601; f_Ec_ecHasLinear = dtb__602; f_Ec_ecMetaSpans = dtb__603; f_Ec_ecUseSpans = dtb__604; f_Ec_ecWarnings = dtb__605; f_Ec_ecCounters = dtb__606; f_Ec_ecErrors = dtb__607 } -> { f_Ec_ecNext = dtb__586; f_Ec_ecSols = dtb__587; f_Ec_ecDefsRev = dtb__588; f_Ec_ecDatas = dtb__589; f_Ec_ecDepthOfMeta = dtb__590; f_Ec_ecGoals = dtb__591; f_Ec_ecInsts = dtb__592; f_Ec_ecClasses = ((B_dData_dList.v_append dtb__593) (B_dData_dList.C_List__x58__x58_ (mc1, B_dData_dList.C_List_Nil))); f_Ec_ecConstraints = dtb__594; f_Ec_ecDefTbl = dtb__595; f_Ec_ecGlobalsTbl = dtb__596; f_Ec_ecSolTbl = dtb__597; f_Ec_ecDepthTbl = dtb__598; f_Ec_ecGlobalsComplete = dtb__599; f_Ec_ecClausesTbl = dtb__600; f_Ec_ecCtorTbl = dtb__601; f_Ec_ecHasLinear = dtb__602; f_Ec_ecMetaSpans = dtb__603; f_Ec_ecUseSpans = dtb__604; f_Ec_ecWarnings = dtb__605; f_Ec_ecCounters = dtb__606; f_Ec_ecErrors = dtb__607 }
  | _ -> failwith "DT: impossible branch"
))

# 591 "Vuna/Compiler/Elab/Types.vuna"
let v_ecConstraints = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__608; f_Ec_ecSols = dtb__609; f_Ec_ecDefsRev = dtb__610; f_Ec_ecDatas = dtb__611; f_Ec_ecDepthOfMeta = dtb__612; f_Ec_ecGoals = dtb__613; f_Ec_ecInsts = dtb__614; f_Ec_ecClasses = dtb__615; f_Ec_ecConstraints = dtb__616; f_Ec_ecDefTbl = dtb__617; f_Ec_ecGlobalsTbl = dtb__618; f_Ec_ecSolTbl = dtb__619; f_Ec_ecDepthTbl = dtb__620; f_Ec_ecGlobalsComplete = dtb__621; f_Ec_ecClausesTbl = dtb__622; f_Ec_ecCtorTbl = dtb__623; f_Ec_ecHasLinear = dtb__624; f_Ec_ecMetaSpans = dtb__625; f_Ec_ecUseSpans = dtb__626; f_Ec_ecWarnings = dtb__627; f_Ec_ecCounters = dtb__628; f_Ec_ecErrors = dtb__629 } -> dtb__616
  | _ -> failwith "DT: impossible branch"
))

# 596 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutConstraints = (fun (mc0 : t_Ec) (mc1 : t_ConstraintStore) -> (match mc0 with
  | { f_Ec_ecNext = dtb__630; f_Ec_ecSols = dtb__631; f_Ec_ecDefsRev = dtb__632; f_Ec_ecDatas = dtb__633; f_Ec_ecDepthOfMeta = dtb__634; f_Ec_ecGoals = dtb__635; f_Ec_ecInsts = dtb__636; f_Ec_ecClasses = dtb__637; f_Ec_ecConstraints = dtb__638; f_Ec_ecDefTbl = dtb__639; f_Ec_ecGlobalsTbl = dtb__640; f_Ec_ecSolTbl = dtb__641; f_Ec_ecDepthTbl = dtb__642; f_Ec_ecGlobalsComplete = dtb__643; f_Ec_ecClausesTbl = dtb__644; f_Ec_ecCtorTbl = dtb__645; f_Ec_ecHasLinear = dtb__646; f_Ec_ecMetaSpans = dtb__647; f_Ec_ecUseSpans = dtb__648; f_Ec_ecWarnings = dtb__649; f_Ec_ecCounters = dtb__650; f_Ec_ecErrors = dtb__651 } -> { f_Ec_ecNext = dtb__630; f_Ec_ecSols = dtb__631; f_Ec_ecDefsRev = dtb__632; f_Ec_ecDatas = dtb__633; f_Ec_ecDepthOfMeta = dtb__634; f_Ec_ecGoals = dtb__635; f_Ec_ecInsts = dtb__636; f_Ec_ecClasses = dtb__637; f_Ec_ecConstraints = mc1; f_Ec_ecDefTbl = dtb__639; f_Ec_ecGlobalsTbl = dtb__640; f_Ec_ecSolTbl = dtb__641; f_Ec_ecDepthTbl = dtb__642; f_Ec_ecGlobalsComplete = dtb__643; f_Ec_ecClausesTbl = dtb__644; f_Ec_ecCtorTbl = dtb__645; f_Ec_ecHasLinear = dtb__646; f_Ec_ecMetaSpans = dtb__647; f_Ec_ecUseSpans = dtb__648; f_Ec_ecWarnings = dtb__649; f_Ec_ecCounters = dtb__650; f_Ec_ecErrors = dtb__651 }
  | _ -> failwith "DT: impossible branch"
))

# 623 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPendingList = (fun (ec : t_Ec) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__652; f_ConstraintStore_csNextId = dtb__653; f_ConstraintStore_csTried = dtb__654; f_ConstraintStore_csSolsCount = dtb__655; f_ConstraintStore_csPassNext = dtb__656; f_ConstraintStore_csPassSols = dtb__657; f_ConstraintStore_csCtorIndexComplete = dtb__658 } -> (B_dContainer_dQueue.v_toList dtb__652)
  | _ -> failwith "DT: impossible branch"
))

# 629 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPendingCount = (fun (ec : t_Ec) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__659; f_ConstraintStore_csNextId = dtb__660; f_ConstraintStore_csTried = dtb__661; f_ConstraintStore_csSolsCount = dtb__662; f_ConstraintStore_csPassNext = dtb__663; f_ConstraintStore_csPassSols = dtb__664; f_ConstraintStore_csCtorIndexComplete = dtb__665 } -> (B_dContainer_dQueue.v_size dtb__659)
  | _ -> failwith "DT: impossible branch"
))

# 635 "Vuna/Compiler/Elab/Types.vuna"
let v_ecNextConstraintId = (fun (ec : t_Ec) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__666; f_ConstraintStore_csNextId = dtb__667; f_ConstraintStore_csTried = dtb__668; f_ConstraintStore_csSolsCount = dtb__669; f_ConstraintStore_csPassNext = dtb__670; f_ConstraintStore_csPassSols = dtb__671; f_ConstraintStore_csCtorIndexComplete = dtb__672 } -> dtb__667
  | _ -> failwith "DT: impossible branch"
))

# 641 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPopPending = (fun (ec : t_Ec) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__673; f_ConstraintStore_csNextId = dtb__674; f_ConstraintStore_csTried = dtb__675; f_ConstraintStore_csSolsCount = dtb__676; f_ConstraintStore_csPassNext = dtb__677; f_ConstraintStore_csPassSols = dtb__678; f_ConstraintStore_csCtorIndexComplete = dtb__679 } -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__680) -> (match dtb__680 with
  | { B_dData_dPair.f_Pair_first = dtb__681; B_dData_dPair.f_Pair_second = dtb__682 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__681; B_dData_dPair.f_Pair_second = ((v_ecPutConstraints ec) { f_ConstraintStore_csPending = dtb__682; f_ConstraintStore_csNextId = dtb__674; f_ConstraintStore_csTried = dtb__675; f_ConstraintStore_csSolsCount = dtb__676; f_ConstraintStore_csPassNext = dtb__677; f_ConstraintStore_csPassSols = dtb__678; f_ConstraintStore_csCtorIndexComplete = dtb__679 }) }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (B_dContainer_dQueue.v_pop dtb__673))
  | _ -> failwith "DT: impossible branch"
))

# 652 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPushPending = (fun (ec : t_Ec) (c : t_Constraint) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__683; f_ConstraintStore_csNextId = dtb__684; f_ConstraintStore_csTried = dtb__685; f_ConstraintStore_csSolsCount = dtb__686; f_ConstraintStore_csPassNext = dtb__687; f_ConstraintStore_csPassSols = dtb__688; f_ConstraintStore_csCtorIndexComplete = dtb__689 } -> ((v_ecPutConstraints ec) { f_ConstraintStore_csPending = ((B_dContainer_dQueue.v_push c) dtb__683); f_ConstraintStore_csNextId = dtb__684; f_ConstraintStore_csTried = dtb__685; f_ConstraintStore_csSolsCount = dtb__686; f_ConstraintStore_csPassNext = dtb__687; f_ConstraintStore_csPassSols = dtb__688; f_ConstraintStore_csCtorIndexComplete = dtb__689 })
  | _ -> failwith "DT: impossible branch"
))

# 661 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutPending = (fun (ec : t_Ec) (pending2 : t_Constraint B_dData_dList.t_List) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__690; f_ConstraintStore_csNextId = dtb__691; f_ConstraintStore_csTried = dtb__692; f_ConstraintStore_csSolsCount = dtb__693; f_ConstraintStore_csPassNext = dtb__694; f_ConstraintStore_csPassSols = dtb__695; f_ConstraintStore_csCtorIndexComplete = dtb__696 } -> ((v_ecPutConstraints ec) { f_ConstraintStore_csPending = (B_dContainer_dQueue.v_fromList pending2); f_ConstraintStore_csNextId = dtb__691; f_ConstraintStore_csTried = dtb__692; f_ConstraintStore_csSolsCount = dtb__693; f_ConstraintStore_csPassNext = dtb__694; f_ConstraintStore_csPassSols = dtb__695; f_ConstraintStore_csCtorIndexComplete = dtb__696 })
  | _ -> failwith "DT: impossible branch"
))

# 670 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddConstraint = (fun (ec : t_Ec) (kind : t_ConstraintKind) (meta : int) (dom : Core_dTerm.t_Value) (span : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (depth : int) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__697; f_ConstraintStore_csNextId = dtb__698; f_ConstraintStore_csTried = dtb__699; f_ConstraintStore_csSolsCount = dtb__700; f_ConstraintStore_csPassNext = dtb__701; f_ConstraintStore_csPassSols = dtb__702; f_ConstraintStore_csCtorIndexComplete = dtb__703 } -> ((v_ecPutConstraints ec) { f_ConstraintStore_csPending = ((B_dContainer_dQueue.v_push { f_Constraint_conId = dtb__698; f_Constraint_conKind = kind; f_Constraint_conMeta = meta; f_Constraint_conDom = dom; f_Constraint_conSpan = span; f_Constraint_conDepth = depth }) dtb__697); f_ConstraintStore_csNextId = (dtb__698 + 1); f_ConstraintStore_csTried = dtb__699; f_ConstraintStore_csSolsCount = dtb__700; f_ConstraintStore_csPassNext = dtb__701; f_ConstraintStore_csPassSols = dtb__702; f_ConstraintStore_csCtorIndexComplete = dtb__703 })
  | _ -> failwith "DT: impossible branch"
))

# 680 "Vuna/Compiler/Elab/Types.vuna"
let v_ecTriedAt = (fun (ec : t_Ec) (cid : int) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__704; f_ConstraintStore_csNextId = dtb__705; f_ConstraintStore_csTried = dtb__706; f_ConstraintStore_csSolsCount = dtb__707; f_ConstraintStore_csPassNext = dtb__708; f_ConstraintStore_csPassSols = dtb__709; f_ConstraintStore_csCtorIndexComplete = dtb__710 } -> ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) cid) dtb__706)
  | _ -> failwith "DT: impossible branch"
))

# 686 "Vuna/Compiler/Elab/Types.vuna"
let v_ecRecordTried = (fun (ec : t_Ec) (cid : int) (epoch : int) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__711; f_ConstraintStore_csNextId = dtb__712; f_ConstraintStore_csTried = dtb__713; f_ConstraintStore_csSolsCount = dtb__714; f_ConstraintStore_csPassNext = dtb__715; f_ConstraintStore_csPassSols = dtb__716; f_ConstraintStore_csCtorIndexComplete = dtb__717 } -> ((v_ecPutConstraints ec) { f_ConstraintStore_csPending = dtb__711; f_ConstraintStore_csNextId = dtb__712; f_ConstraintStore_csTried = (((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) cid) epoch) dtb__713); f_ConstraintStore_csSolsCount = dtb__714; f_ConstraintStore_csPassNext = dtb__715; f_ConstraintStore_csPassSols = dtb__716; f_ConstraintStore_csCtorIndexComplete = dtb__717 })
  | _ -> failwith "DT: impossible branch"
))

# 694 "Vuna/Compiler/Elab/Types.vuna"
let v_ecEmpty = { f_Ec_ecNext = 0; f_Ec_ecSols = B_dData_dList.C_List_Nil; f_Ec_ecDefsRev = B_dData_dList.C_List_Nil; f_Ec_ecDatas = B_dData_dList.C_List_Nil; f_Ec_ecDepthOfMeta = B_dData_dList.C_List_Nil; f_Ec_ecGoals = B_dData_dList.C_List_Nil; f_Ec_ecInsts = v_instStoreEmpty; f_Ec_ecClasses = B_dData_dList.C_List_Nil; f_Ec_ecConstraints = v_csEmpty; f_Ec_ecDefTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) B_dData_dList.C_List_Nil); f_Ec_ecGlobalsTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) B_dData_dList.C_List_Nil); f_Ec_ecSolTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) B_dData_dList.C_List_Nil); f_Ec_ecDepthTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) B_dData_dList.C_List_Nil); f_Ec_ecGlobalsComplete = false; f_Ec_ecClausesTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) B_dData_dList.C_List_Nil); f_Ec_ecCtorTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) B_dData_dList.C_List_Nil); f_Ec_ecHasLinear = false; f_Ec_ecMetaSpans = B_dData_dList.C_List_Nil; f_Ec_ecUseSpans = B_dData_dList.C_List_Nil; f_Ec_ecWarnings = B_dData_dList.C_List_Nil; f_Ec_ecCounters = B_dData_dList.C_List_Nil; f_Ec_ecErrors = B_dData_dList.C_List_Nil }

# 722 "Vuna/Compiler/Elab/Types.vuna"
let v_ecSolTbl = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__718; f_Ec_ecSols = dtb__719; f_Ec_ecDefsRev = dtb__720; f_Ec_ecDatas = dtb__721; f_Ec_ecDepthOfMeta = dtb__722; f_Ec_ecGoals = dtb__723; f_Ec_ecInsts = dtb__724; f_Ec_ecClasses = dtb__725; f_Ec_ecConstraints = dtb__726; f_Ec_ecDefTbl = dtb__727; f_Ec_ecGlobalsTbl = dtb__728; f_Ec_ecSolTbl = dtb__729; f_Ec_ecDepthTbl = dtb__730; f_Ec_ecGlobalsComplete = dtb__731; f_Ec_ecClausesTbl = dtb__732; f_Ec_ecCtorTbl = dtb__733; f_Ec_ecHasLinear = dtb__734; f_Ec_ecMetaSpans = dtb__735; f_Ec_ecUseSpans = dtb__736; f_Ec_ecWarnings = dtb__737; f_Ec_ecCounters = dtb__738; f_Ec_ecErrors = dtb__739 } -> dtb__729
  | _ -> failwith "DT: impossible branch"
))

# 728 "Vuna/Compiler/Elab/Types.vuna"
let v_ecSolsP = (fun (ec : t_Ec) -> (((Core_dTerm.v_solsOf (v_ecSolTbl ec)) (v_ecSols ec)) (v_ecDepthTbl ec)))

# 740 "Vuna/Compiler/Elab/Types.vuna"
let v_ecSolsCountOf = (fun (ec : t_Ec) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__740; f_ConstraintStore_csNextId = dtb__741; f_ConstraintStore_csTried = dtb__742; f_ConstraintStore_csSolsCount = dtb__743; f_ConstraintStore_csPassNext = dtb__744; f_ConstraintStore_csPassSols = dtb__745; f_ConstraintStore_csCtorIndexComplete = dtb__746 } -> dtb__743
  | _ -> failwith "DT: impossible branch"
))

# 745 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutSolsCount = (fun (ec : t_Ec) (cnt : int) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__747; f_ConstraintStore_csNextId = dtb__748; f_ConstraintStore_csTried = dtb__749; f_ConstraintStore_csSolsCount = dtb__750; f_ConstraintStore_csPassNext = dtb__751; f_ConstraintStore_csPassSols = dtb__752; f_ConstraintStore_csCtorIndexComplete = dtb__753 } -> ((v_ecPutConstraints ec) { f_ConstraintStore_csPending = dtb__747; f_ConstraintStore_csNextId = dtb__748; f_ConstraintStore_csTried = dtb__749; f_ConstraintStore_csSolsCount = cnt; f_ConstraintStore_csPassNext = dtb__751; f_ConstraintStore_csPassSols = dtb__752; f_ConstraintStore_csCtorIndexComplete = dtb__753 })
  | _ -> failwith "DT: impossible branch"
))

# 751 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutSolsRaw = (fun (mc0 : t_Ec) (mc1 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | { f_Ec_ecNext = dtb__754; f_Ec_ecSols = dtb__755; f_Ec_ecDefsRev = dtb__756; f_Ec_ecDatas = dtb__757; f_Ec_ecDepthOfMeta = dtb__758; f_Ec_ecGoals = dtb__759; f_Ec_ecInsts = dtb__760; f_Ec_ecClasses = dtb__761; f_Ec_ecConstraints = dtb__762; f_Ec_ecDefTbl = dtb__763; f_Ec_ecGlobalsTbl = dtb__764; f_Ec_ecSolTbl = dtb__765; f_Ec_ecDepthTbl = dtb__766; f_Ec_ecGlobalsComplete = dtb__767; f_Ec_ecClausesTbl = dtb__768; f_Ec_ecCtorTbl = dtb__769; f_Ec_ecHasLinear = dtb__770; f_Ec_ecMetaSpans = dtb__771; f_Ec_ecUseSpans = dtb__772; f_Ec_ecWarnings = dtb__773; f_Ec_ecCounters = dtb__774; f_Ec_ecErrors = dtb__775 } -> { f_Ec_ecNext = dtb__754; f_Ec_ecSols = mc1; f_Ec_ecDefsRev = dtb__756; f_Ec_ecDatas = dtb__757; f_Ec_ecDepthOfMeta = dtb__758; f_Ec_ecGoals = dtb__759; f_Ec_ecInsts = dtb__760; f_Ec_ecClasses = dtb__761; f_Ec_ecConstraints = dtb__762; f_Ec_ecDefTbl = dtb__763; f_Ec_ecGlobalsTbl = dtb__764; f_Ec_ecSolTbl = mc2; f_Ec_ecDepthTbl = dtb__766; f_Ec_ecGlobalsComplete = dtb__767; f_Ec_ecClausesTbl = dtb__768; f_Ec_ecCtorTbl = dtb__769; f_Ec_ecHasLinear = dtb__770; f_Ec_ecMetaSpans = dtb__771; f_Ec_ecUseSpans = dtb__772; f_Ec_ecWarnings = dtb__773; f_Ec_ecCounters = dtb__774; f_Ec_ecErrors = dtb__775 }
  | _ -> failwith "DT: impossible branch"
))

# 778 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutPassMarker = (fun (ec : t_Ec) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__776; f_ConstraintStore_csNextId = dtb__777; f_ConstraintStore_csTried = dtb__778; f_ConstraintStore_csSolsCount = dtb__779; f_ConstraintStore_csPassNext = dtb__780; f_ConstraintStore_csPassSols = dtb__781; f_ConstraintStore_csCtorIndexComplete = dtb__782 } -> ((v_ecPutConstraints ec) { f_ConstraintStore_csPending = dtb__776; f_ConstraintStore_csNextId = dtb__777; f_ConstraintStore_csTried = dtb__778; f_ConstraintStore_csSolsCount = dtb__779; f_ConstraintStore_csPassNext = dtb__777; f_ConstraintStore_csPassSols = dtb__779; f_ConstraintStore_csCtorIndexComplete = dtb__782 })
  | _ -> failwith "DT: impossible branch"
))

# 785 "Vuna/Compiler/Elab/Types.vuna"
let v_ecCtorIndexComplete = (fun (ec : t_Ec) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__783; f_ConstraintStore_csNextId = dtb__784; f_ConstraintStore_csTried = dtb__785; f_ConstraintStore_csSolsCount = dtb__786; f_ConstraintStore_csPassNext = dtb__787; f_ConstraintStore_csPassSols = dtb__788; f_ConstraintStore_csCtorIndexComplete = dtb__789 } -> dtb__789
  | _ -> failwith "DT: impossible branch"
))

# 790 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutCtorIndexComplete = (fun (ec : t_Ec) (ok : bool) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__790; f_ConstraintStore_csNextId = dtb__791; f_ConstraintStore_csTried = dtb__792; f_ConstraintStore_csSolsCount = dtb__793; f_ConstraintStore_csPassNext = dtb__794; f_ConstraintStore_csPassSols = dtb__795; f_ConstraintStore_csCtorIndexComplete = dtb__796 } -> ((v_ecPutConstraints ec) { f_ConstraintStore_csPending = dtb__790; f_ConstraintStore_csNextId = dtb__791; f_ConstraintStore_csTried = dtb__792; f_ConstraintStore_csSolsCount = dtb__793; f_ConstraintStore_csPassNext = dtb__794; f_ConstraintStore_csPassSols = dtb__795; f_ConstraintStore_csCtorIndexComplete = ok })
  | _ -> failwith "DT: impossible branch"
))

# 797 "Vuna/Compiler/Elab/Types.vuna"
let v_ecDictPassIdle = (fun (ec : t_Ec) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__797; f_ConstraintStore_csNextId = dtb__798; f_ConstraintStore_csTried = dtb__799; f_ConstraintStore_csSolsCount = dtb__800; f_ConstraintStore_csPassNext = dtb__801; f_ConstraintStore_csPassSols = dtb__802; f_ConstraintStore_csCtorIndexComplete = dtb__803 } -> (if (dtb__801 = dtb__798) then (dtb__802 = dtb__800) else false)
  | _ -> failwith "DT: impossible branch"
))

# 808 "Vuna/Compiler/Elab/Types.vuna"
let rec v_prefixUntilId = (fun (mc0 : int) (mc1 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__804, dtb__805) -> (match dtb__804 with
  | { B_dData_dPair.f_Pair_first = dtb__806; B_dData_dPair.f_Pair_second = dtb__807 } -> (if (dtb__806 = mc0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__806; B_dData_dPair.f_Pair_second = dtb__807 }, ((v_prefixUntilId mc0) dtb__805))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 804 "Vuna/Compiler/Elab/Types.vuna"
let v_solsDelta = (fun (mc0 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__808, dtb__809) -> (match dtb__808 with
  | { B_dData_dPair.f_Pair_first = dtb__810; B_dData_dPair.f_Pair_second = dtb__811 } -> ((v_prefixUntilId dtb__810) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 731 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutSols = (fun (ec : t_Ec) (sols2 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((fun delta -> ((fun soltbl2 -> ((fun ec2 -> ((v_ecPutSolsCount ec2) ((v_ecSolsCountOf ec2) + (B_dData_dList.v_length delta)))) (((v_ecPutSolsRaw ec) sols2) soltbl2))) ((((B_dContainer_dHashMap.v_insertAll B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) delta) (v_ecSolTbl ec)))) ((v_solsDelta (v_ecSols ec)) sols2)))

# 814 "Vuna/Compiler/Elab/Types.vuna"
let rec v_memDataNameIn = (fun (mc0 : string) (mc1 : t_DtData B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__812, dtb__813) -> (if ((v_dtDataName dtb__812) = mc0) then true else ((v_memDataNameIn mc0) dtb__813))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 821 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddDef = (fun (mc0 : t_Ec) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (match mc0 with
  | { f_Ec_ecNext = dtb__814; f_Ec_ecSols = dtb__815; f_Ec_ecDefsRev = dtb__816; f_Ec_ecDatas = dtb__817; f_Ec_ecDepthOfMeta = dtb__818; f_Ec_ecGoals = dtb__819; f_Ec_ecInsts = dtb__820; f_Ec_ecClasses = dtb__821; f_Ec_ecConstraints = dtb__822; f_Ec_ecDefTbl = dtb__823; f_Ec_ecGlobalsTbl = dtb__824; f_Ec_ecSolTbl = dtb__825; f_Ec_ecDepthTbl = dtb__826; f_Ec_ecGlobalsComplete = dtb__827; f_Ec_ecClausesTbl = dtb__828; f_Ec_ecCtorTbl = dtb__829; f_Ec_ecHasLinear = dtb__830; f_Ec_ecMetaSpans = dtb__831; f_Ec_ecUseSpans = dtb__832; f_Ec_ecWarnings = dtb__833; f_Ec_ecCounters = dtb__834; f_Ec_ecErrors = dtb__835 } -> ((fun delta -> { f_Ec_ecNext = dtb__814; f_Ec_ecSols = dtb__815; f_Ec_ecDefsRev = (B_dData_dList.C_List__x58__x58_ (mc1, dtb__816)); f_Ec_ecDatas = dtb__817; f_Ec_ecDepthOfMeta = dtb__818; f_Ec_ecGoals = dtb__819; f_Ec_ecInsts = dtb__820; f_Ec_ecClasses = dtb__821; f_Ec_ecConstraints = dtb__822; f_Ec_ecDefTbl = delta; f_Ec_ecGlobalsTbl = dtb__824; f_Ec_ecSolTbl = dtb__825; f_Ec_ecDepthTbl = dtb__826; f_Ec_ecGlobalsComplete = dtb__827; f_Ec_ecClausesTbl = dtb__828; f_Ec_ecCtorTbl = dtb__829; f_Ec_ecHasLinear = dtb__830; f_Ec_ecMetaSpans = dtb__831; f_Ec_ecUseSpans = dtb__832; f_Ec_ecWarnings = dtb__833; f_Ec_ecCounters = dtb__834; f_Ec_ecErrors = dtb__835 }) (if ((v_memDataNameIn (B_dData_dPair.v_firstOf mc1)) dtb__817) then dtb__823 else (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) (B_dData_dPair.v_firstOf mc1)) (B_dData_dPair.v_secondOf mc1)) dtb__823)))
  | _ -> failwith "DT: impossible branch"
))

# 853 "Vuna/Compiler/Elab/Types.vuna"
let v_ecRemoveDefTbl = (fun (mc0 : string) (mc1 : t_Ec) -> (match mc1 with
  | { f_Ec_ecNext = dtb__836; f_Ec_ecSols = dtb__837; f_Ec_ecDefsRev = dtb__838; f_Ec_ecDatas = dtb__839; f_Ec_ecDepthOfMeta = dtb__840; f_Ec_ecGoals = dtb__841; f_Ec_ecInsts = dtb__842; f_Ec_ecClasses = dtb__843; f_Ec_ecConstraints = dtb__844; f_Ec_ecDefTbl = dtb__845; f_Ec_ecGlobalsTbl = dtb__846; f_Ec_ecSolTbl = dtb__847; f_Ec_ecDepthTbl = dtb__848; f_Ec_ecGlobalsComplete = dtb__849; f_Ec_ecClausesTbl = dtb__850; f_Ec_ecCtorTbl = dtb__851; f_Ec_ecHasLinear = dtb__852; f_Ec_ecMetaSpans = dtb__853; f_Ec_ecUseSpans = dtb__854; f_Ec_ecWarnings = dtb__855; f_Ec_ecCounters = dtb__856; f_Ec_ecErrors = dtb__857 } -> { f_Ec_ecNext = dtb__836; f_Ec_ecSols = dtb__837; f_Ec_ecDefsRev = dtb__838; f_Ec_ecDatas = dtb__839; f_Ec_ecDepthOfMeta = dtb__840; f_Ec_ecGoals = dtb__841; f_Ec_ecInsts = dtb__842; f_Ec_ecClasses = dtb__843; f_Ec_ecConstraints = dtb__844; f_Ec_ecDefTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) ((B_dData_dList.v_filter (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (B_dData_dBool.v_not ((B_dData_dPair.v_firstOf p) = mc0)))) (B_dContainer_dHashMap.v_toList dtb__845))); f_Ec_ecGlobalsTbl = dtb__846; f_Ec_ecSolTbl = dtb__847; f_Ec_ecDepthTbl = dtb__848; f_Ec_ecGlobalsComplete = dtb__849; f_Ec_ecClausesTbl = dtb__850; f_Ec_ecCtorTbl = dtb__851; f_Ec_ecHasLinear = dtb__852; f_Ec_ecMetaSpans = dtb__853; f_Ec_ecUseSpans = dtb__854; f_Ec_ecWarnings = dtb__855; f_Ec_ecCounters = dtb__856; f_Ec_ecErrors = dtb__857 }
  | _ -> failwith "DT: impossible branch"
))

# 909 "Vuna/Compiler/Elab/Types.vuna"
let v_dataCtorPairs = (fun (d : t_DtData) -> ((B_dData_dList.v_map (fun (c : t_DtCtor) -> { B_dData_dPair.f_Pair_first = (v_dtCtorName c); B_dData_dPair.f_Pair_second = c })) (v_dtDataCtors d)))

# 879 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddData = (fun (mc0 : t_Ec) (mc1 : t_DtData) -> (match mc0 with
  | { f_Ec_ecNext = dtb__858; f_Ec_ecSols = dtb__859; f_Ec_ecDefsRev = dtb__860; f_Ec_ecDatas = dtb__861; f_Ec_ecDepthOfMeta = dtb__862; f_Ec_ecGoals = dtb__863; f_Ec_ecInsts = dtb__864; f_Ec_ecClasses = dtb__865; f_Ec_ecConstraints = dtb__866; f_Ec_ecDefTbl = dtb__867; f_Ec_ecGlobalsTbl = dtb__868; f_Ec_ecSolTbl = dtb__869; f_Ec_ecDepthTbl = dtb__870; f_Ec_ecGlobalsComplete = dtb__871; f_Ec_ecClausesTbl = dtb__872; f_Ec_ecCtorTbl = dtb__873; f_Ec_ecHasLinear = dtb__874; f_Ec_ecMetaSpans = dtb__875; f_Ec_ecUseSpans = dtb__876; f_Ec_ecWarnings = dtb__877; f_Ec_ecCounters = dtb__878; f_Ec_ecErrors = dtb__879 } -> { f_Ec_ecNext = dtb__858; f_Ec_ecSols = dtb__859; f_Ec_ecDefsRev = dtb__860; f_Ec_ecDatas = ((B_dData_dList.v_append dtb__861) (B_dData_dList.C_List__x58__x58_ (mc1, B_dData_dList.C_List_Nil))); f_Ec_ecDepthOfMeta = dtb__862; f_Ec_ecGoals = dtb__863; f_Ec_ecInsts = dtb__864; f_Ec_ecClasses = dtb__865; f_Ec_ecConstraints = dtb__866; f_Ec_ecDefTbl = dtb__867; f_Ec_ecGlobalsTbl = dtb__868; f_Ec_ecSolTbl = dtb__869; f_Ec_ecDepthTbl = dtb__870; f_Ec_ecGlobalsComplete = dtb__871; f_Ec_ecClausesTbl = dtb__872; f_Ec_ecCtorTbl = ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) (v_dataCtorPairs mc1)) dtb__873); f_Ec_ecHasLinear = (if (v_dtDataLinear mc1) then true else dtb__874); f_Ec_ecMetaSpans = dtb__875; f_Ec_ecUseSpans = dtb__876; f_Ec_ecWarnings = dtb__877; f_Ec_ecCounters = dtb__878; f_Ec_ecErrors = dtb__879 }
  | _ -> failwith "DT: impossible branch"
))

# 906 "Vuna/Compiler/Elab/Types.vuna"
let v_ctorTblOfDatas = (fun (datas : t_DtData B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) ((B_dData_dList.v_concatMap v_dataCtorPairs) datas)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) B_dData_dList.C_List_Nil)))

# 912 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutCtorTbl = (fun (mc0 : t_Ec) (mc1 : (string, t_DtCtor) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | { f_Ec_ecNext = dtb__880; f_Ec_ecSols = dtb__881; f_Ec_ecDefsRev = dtb__882; f_Ec_ecDatas = dtb__883; f_Ec_ecDepthOfMeta = dtb__884; f_Ec_ecGoals = dtb__885; f_Ec_ecInsts = dtb__886; f_Ec_ecClasses = dtb__887; f_Ec_ecConstraints = dtb__888; f_Ec_ecDefTbl = dtb__889; f_Ec_ecGlobalsTbl = dtb__890; f_Ec_ecSolTbl = dtb__891; f_Ec_ecDepthTbl = dtb__892; f_Ec_ecGlobalsComplete = dtb__893; f_Ec_ecClausesTbl = dtb__894; f_Ec_ecCtorTbl = dtb__895; f_Ec_ecHasLinear = dtb__896; f_Ec_ecMetaSpans = dtb__897; f_Ec_ecUseSpans = dtb__898; f_Ec_ecWarnings = dtb__899; f_Ec_ecCounters = dtb__900; f_Ec_ecErrors = dtb__901 } -> ((v_ecPutCtorIndexComplete { f_Ec_ecNext = dtb__880; f_Ec_ecSols = dtb__881; f_Ec_ecDefsRev = dtb__882; f_Ec_ecDatas = dtb__883; f_Ec_ecDepthOfMeta = dtb__884; f_Ec_ecGoals = dtb__885; f_Ec_ecInsts = dtb__886; f_Ec_ecClasses = dtb__887; f_Ec_ecConstraints = dtb__888; f_Ec_ecDefTbl = dtb__889; f_Ec_ecGlobalsTbl = dtb__890; f_Ec_ecSolTbl = dtb__891; f_Ec_ecDepthTbl = dtb__892; f_Ec_ecGlobalsComplete = dtb__893; f_Ec_ecClausesTbl = dtb__894; f_Ec_ecCtorTbl = mc1; f_Ec_ecHasLinear = dtb__896; f_Ec_ecMetaSpans = dtb__897; f_Ec_ecUseSpans = dtb__898; f_Ec_ecWarnings = dtb__899; f_Ec_ecCounters = dtb__900; f_Ec_ecErrors = dtb__901 }) true)
  | _ -> failwith "DT: impossible branch"
))

# 920 "Vuna/Compiler/Elab/Types.vuna"
let v_ecHasLinear = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__902; f_Ec_ecSols = dtb__903; f_Ec_ecDefsRev = dtb__904; f_Ec_ecDatas = dtb__905; f_Ec_ecDepthOfMeta = dtb__906; f_Ec_ecGoals = dtb__907; f_Ec_ecInsts = dtb__908; f_Ec_ecClasses = dtb__909; f_Ec_ecConstraints = dtb__910; f_Ec_ecDefTbl = dtb__911; f_Ec_ecGlobalsTbl = dtb__912; f_Ec_ecSolTbl = dtb__913; f_Ec_ecDepthTbl = dtb__914; f_Ec_ecGlobalsComplete = dtb__915; f_Ec_ecClausesTbl = dtb__916; f_Ec_ecCtorTbl = dtb__917; f_Ec_ecHasLinear = dtb__918; f_Ec_ecMetaSpans = dtb__919; f_Ec_ecUseSpans = dtb__920; f_Ec_ecWarnings = dtb__921; f_Ec_ecCounters = dtb__922; f_Ec_ecErrors = dtb__923 } -> dtb__918
  | _ -> failwith "DT: impossible branch"
))

# 926 "Vuna/Compiler/Elab/Types.vuna"
let v_ecMetaSpans = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__924; f_Ec_ecSols = dtb__925; f_Ec_ecDefsRev = dtb__926; f_Ec_ecDatas = dtb__927; f_Ec_ecDepthOfMeta = dtb__928; f_Ec_ecGoals = dtb__929; f_Ec_ecInsts = dtb__930; f_Ec_ecClasses = dtb__931; f_Ec_ecConstraints = dtb__932; f_Ec_ecDefTbl = dtb__933; f_Ec_ecGlobalsTbl = dtb__934; f_Ec_ecSolTbl = dtb__935; f_Ec_ecDepthTbl = dtb__936; f_Ec_ecGlobalsComplete = dtb__937; f_Ec_ecClausesTbl = dtb__938; f_Ec_ecCtorTbl = dtb__939; f_Ec_ecHasLinear = dtb__940; f_Ec_ecMetaSpans = dtb__941; f_Ec_ecUseSpans = dtb__942; f_Ec_ecWarnings = dtb__943; f_Ec_ecCounters = dtb__944; f_Ec_ecErrors = dtb__945 } -> dtb__941
  | _ -> failwith "DT: impossible branch"
))

# 931 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutMetaSpans = (fun (mc0 : t_Ec) (mc1 : (int, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | { f_Ec_ecNext = dtb__946; f_Ec_ecSols = dtb__947; f_Ec_ecDefsRev = dtb__948; f_Ec_ecDatas = dtb__949; f_Ec_ecDepthOfMeta = dtb__950; f_Ec_ecGoals = dtb__951; f_Ec_ecInsts = dtb__952; f_Ec_ecClasses = dtb__953; f_Ec_ecConstraints = dtb__954; f_Ec_ecDefTbl = dtb__955; f_Ec_ecGlobalsTbl = dtb__956; f_Ec_ecSolTbl = dtb__957; f_Ec_ecDepthTbl = dtb__958; f_Ec_ecGlobalsComplete = dtb__959; f_Ec_ecClausesTbl = dtb__960; f_Ec_ecCtorTbl = dtb__961; f_Ec_ecHasLinear = dtb__962; f_Ec_ecMetaSpans = dtb__963; f_Ec_ecUseSpans = dtb__964; f_Ec_ecWarnings = dtb__965; f_Ec_ecCounters = dtb__966; f_Ec_ecErrors = dtb__967 } -> { f_Ec_ecNext = dtb__946; f_Ec_ecSols = dtb__947; f_Ec_ecDefsRev = dtb__948; f_Ec_ecDatas = dtb__949; f_Ec_ecDepthOfMeta = dtb__950; f_Ec_ecGoals = dtb__951; f_Ec_ecInsts = dtb__952; f_Ec_ecClasses = dtb__953; f_Ec_ecConstraints = dtb__954; f_Ec_ecDefTbl = dtb__955; f_Ec_ecGlobalsTbl = dtb__956; f_Ec_ecSolTbl = dtb__957; f_Ec_ecDepthTbl = dtb__958; f_Ec_ecGlobalsComplete = dtb__959; f_Ec_ecClausesTbl = dtb__960; f_Ec_ecCtorTbl = dtb__961; f_Ec_ecHasLinear = dtb__962; f_Ec_ecMetaSpans = mc1; f_Ec_ecUseSpans = dtb__964; f_Ec_ecWarnings = dtb__965; f_Ec_ecCounters = dtb__966; f_Ec_ecErrors = dtb__967 }
  | _ -> failwith "DT: impossible branch"
))

# 958 "Vuna/Compiler/Elab/Types.vuna"
let v_ecUseSpans = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__968; f_Ec_ecSols = dtb__969; f_Ec_ecDefsRev = dtb__970; f_Ec_ecDatas = dtb__971; f_Ec_ecDepthOfMeta = dtb__972; f_Ec_ecGoals = dtb__973; f_Ec_ecInsts = dtb__974; f_Ec_ecClasses = dtb__975; f_Ec_ecConstraints = dtb__976; f_Ec_ecDefTbl = dtb__977; f_Ec_ecGlobalsTbl = dtb__978; f_Ec_ecSolTbl = dtb__979; f_Ec_ecDepthTbl = dtb__980; f_Ec_ecGlobalsComplete = dtb__981; f_Ec_ecClausesTbl = dtb__982; f_Ec_ecCtorTbl = dtb__983; f_Ec_ecHasLinear = dtb__984; f_Ec_ecMetaSpans = dtb__985; f_Ec_ecUseSpans = dtb__986; f_Ec_ecWarnings = dtb__987; f_Ec_ecCounters = dtb__988; f_Ec_ecErrors = dtb__989 } -> dtb__986
  | _ -> failwith "DT: impossible branch"
))

# 963 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutUseSpans = (fun (mc0 : t_Ec) (mc1 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | { f_Ec_ecNext = dtb__990; f_Ec_ecSols = dtb__991; f_Ec_ecDefsRev = dtb__992; f_Ec_ecDatas = dtb__993; f_Ec_ecDepthOfMeta = dtb__994; f_Ec_ecGoals = dtb__995; f_Ec_ecInsts = dtb__996; f_Ec_ecClasses = dtb__997; f_Ec_ecConstraints = dtb__998; f_Ec_ecDefTbl = dtb__999; f_Ec_ecGlobalsTbl = dtb__1000; f_Ec_ecSolTbl = dtb__1001; f_Ec_ecDepthTbl = dtb__1002; f_Ec_ecGlobalsComplete = dtb__1003; f_Ec_ecClausesTbl = dtb__1004; f_Ec_ecCtorTbl = dtb__1005; f_Ec_ecHasLinear = dtb__1006; f_Ec_ecMetaSpans = dtb__1007; f_Ec_ecUseSpans = dtb__1008; f_Ec_ecWarnings = dtb__1009; f_Ec_ecCounters = dtb__1010; f_Ec_ecErrors = dtb__1011 } -> { f_Ec_ecNext = dtb__990; f_Ec_ecSols = dtb__991; f_Ec_ecDefsRev = dtb__992; f_Ec_ecDatas = dtb__993; f_Ec_ecDepthOfMeta = dtb__994; f_Ec_ecGoals = dtb__995; f_Ec_ecInsts = dtb__996; f_Ec_ecClasses = dtb__997; f_Ec_ecConstraints = dtb__998; f_Ec_ecDefTbl = dtb__999; f_Ec_ecGlobalsTbl = dtb__1000; f_Ec_ecSolTbl = dtb__1001; f_Ec_ecDepthTbl = dtb__1002; f_Ec_ecGlobalsComplete = dtb__1003; f_Ec_ecClausesTbl = dtb__1004; f_Ec_ecCtorTbl = dtb__1005; f_Ec_ecHasLinear = dtb__1006; f_Ec_ecMetaSpans = dtb__1007; f_Ec_ecUseSpans = mc1; f_Ec_ecWarnings = dtb__1009; f_Ec_ecCounters = dtb__1010; f_Ec_ecErrors = dtb__1011 }
  | _ -> failwith "DT: impossible branch"
))

# 991 "Vuna/Compiler/Elab/Types.vuna"
let v_ecWarnings = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__1012; f_Ec_ecSols = dtb__1013; f_Ec_ecDefsRev = dtb__1014; f_Ec_ecDatas = dtb__1015; f_Ec_ecDepthOfMeta = dtb__1016; f_Ec_ecGoals = dtb__1017; f_Ec_ecInsts = dtb__1018; f_Ec_ecClasses = dtb__1019; f_Ec_ecConstraints = dtb__1020; f_Ec_ecDefTbl = dtb__1021; f_Ec_ecGlobalsTbl = dtb__1022; f_Ec_ecSolTbl = dtb__1023; f_Ec_ecDepthTbl = dtb__1024; f_Ec_ecGlobalsComplete = dtb__1025; f_Ec_ecClausesTbl = dtb__1026; f_Ec_ecCtorTbl = dtb__1027; f_Ec_ecHasLinear = dtb__1028; f_Ec_ecMetaSpans = dtb__1029; f_Ec_ecUseSpans = dtb__1030; f_Ec_ecWarnings = dtb__1031; f_Ec_ecCounters = dtb__1032; f_Ec_ecErrors = dtb__1033 } -> dtb__1031
  | _ -> failwith "DT: impossible branch"
))

# 996 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutWarnings = (fun (mc0 : t_Ec) (mc1 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (match mc0 with
  | { f_Ec_ecNext = dtb__1034; f_Ec_ecSols = dtb__1035; f_Ec_ecDefsRev = dtb__1036; f_Ec_ecDatas = dtb__1037; f_Ec_ecDepthOfMeta = dtb__1038; f_Ec_ecGoals = dtb__1039; f_Ec_ecInsts = dtb__1040; f_Ec_ecClasses = dtb__1041; f_Ec_ecConstraints = dtb__1042; f_Ec_ecDefTbl = dtb__1043; f_Ec_ecGlobalsTbl = dtb__1044; f_Ec_ecSolTbl = dtb__1045; f_Ec_ecDepthTbl = dtb__1046; f_Ec_ecGlobalsComplete = dtb__1047; f_Ec_ecClausesTbl = dtb__1048; f_Ec_ecCtorTbl = dtb__1049; f_Ec_ecHasLinear = dtb__1050; f_Ec_ecMetaSpans = dtb__1051; f_Ec_ecUseSpans = dtb__1052; f_Ec_ecWarnings = dtb__1053; f_Ec_ecCounters = dtb__1054; f_Ec_ecErrors = dtb__1055 } -> { f_Ec_ecNext = dtb__1034; f_Ec_ecSols = dtb__1035; f_Ec_ecDefsRev = dtb__1036; f_Ec_ecDatas = dtb__1037; f_Ec_ecDepthOfMeta = dtb__1038; f_Ec_ecGoals = dtb__1039; f_Ec_ecInsts = dtb__1040; f_Ec_ecClasses = dtb__1041; f_Ec_ecConstraints = dtb__1042; f_Ec_ecDefTbl = dtb__1043; f_Ec_ecGlobalsTbl = dtb__1044; f_Ec_ecSolTbl = dtb__1045; f_Ec_ecDepthTbl = dtb__1046; f_Ec_ecGlobalsComplete = dtb__1047; f_Ec_ecClausesTbl = dtb__1048; f_Ec_ecCtorTbl = dtb__1049; f_Ec_ecHasLinear = dtb__1050; f_Ec_ecMetaSpans = dtb__1051; f_Ec_ecUseSpans = dtb__1052; f_Ec_ecWarnings = mc1; f_Ec_ecCounters = dtb__1054; f_Ec_ecErrors = dtb__1055 }
  | _ -> failwith "DT: impossible branch"
))

# 1023 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddWarning = (fun (ec : t_Ec) (d : Base_dDiag.t_Diagnostic) -> ((v_ecPutWarnings ec) ((B_dData_dList.v_append (v_ecWarnings ec)) (B_dData_dList.C_List__x58__x58_ (d, B_dData_dList.C_List_Nil)))))

# 1027 "Vuna/Compiler/Elab/Types.vuna"
let v_ecCounters = (fun (e : t_Ec) -> (e).f_Ec_ecCounters)

# 1030 "Vuna/Compiler/Elab/Types.vuna"
let v_ecBump = (fun (mc0 : t_Ec) (mc1 : string) -> (match mc0 with
  | { f_Ec_ecNext = dtb__1056; f_Ec_ecSols = dtb__1057; f_Ec_ecDefsRev = dtb__1058; f_Ec_ecDatas = dtb__1059; f_Ec_ecDepthOfMeta = dtb__1060; f_Ec_ecGoals = dtb__1061; f_Ec_ecInsts = dtb__1062; f_Ec_ecClasses = dtb__1063; f_Ec_ecConstraints = dtb__1064; f_Ec_ecDefTbl = dtb__1065; f_Ec_ecGlobalsTbl = dtb__1066; f_Ec_ecSolTbl = dtb__1067; f_Ec_ecDepthTbl = dtb__1068; f_Ec_ecGlobalsComplete = dtb__1069; f_Ec_ecClausesTbl = dtb__1070; f_Ec_ecCtorTbl = dtb__1071; f_Ec_ecHasLinear = dtb__1072; f_Ec_ecMetaSpans = dtb__1073; f_Ec_ecUseSpans = dtb__1074; f_Ec_ecWarnings = dtb__1075; f_Ec_ecCounters = dtb__1076; f_Ec_ecErrors = dtb__1077 } -> { f_Ec_ecNext = dtb__1056; f_Ec_ecSols = dtb__1057; f_Ec_ecDefsRev = dtb__1058; f_Ec_ecDatas = dtb__1059; f_Ec_ecDepthOfMeta = dtb__1060; f_Ec_ecGoals = dtb__1061; f_Ec_ecInsts = dtb__1062; f_Ec_ecClasses = dtb__1063; f_Ec_ecConstraints = dtb__1064; f_Ec_ecDefTbl = dtb__1065; f_Ec_ecGlobalsTbl = dtb__1066; f_Ec_ecSolTbl = dtb__1067; f_Ec_ecDepthTbl = dtb__1068; f_Ec_ecGlobalsComplete = dtb__1069; f_Ec_ecClausesTbl = dtb__1070; f_Ec_ecCtorTbl = dtb__1071; f_Ec_ecHasLinear = dtb__1072; f_Ec_ecMetaSpans = dtb__1073; f_Ec_ecUseSpans = dtb__1074; f_Ec_ecWarnings = dtb__1075; f_Ec_ecCounters = (B_dData_dList.C_List__x58__x58_ (mc1, dtb__1076)); f_Ec_ecErrors = dtb__1077 }
  | _ -> failwith "DT: impossible branch"
))

# 1057 "Vuna/Compiler/Elab/Types.vuna"
let v_ecErrors = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__1078; f_Ec_ecSols = dtb__1079; f_Ec_ecDefsRev = dtb__1080; f_Ec_ecDatas = dtb__1081; f_Ec_ecDepthOfMeta = dtb__1082; f_Ec_ecGoals = dtb__1083; f_Ec_ecInsts = dtb__1084; f_Ec_ecClasses = dtb__1085; f_Ec_ecConstraints = dtb__1086; f_Ec_ecDefTbl = dtb__1087; f_Ec_ecGlobalsTbl = dtb__1088; f_Ec_ecSolTbl = dtb__1089; f_Ec_ecDepthTbl = dtb__1090; f_Ec_ecGlobalsComplete = dtb__1091; f_Ec_ecClausesTbl = dtb__1092; f_Ec_ecCtorTbl = dtb__1093; f_Ec_ecHasLinear = dtb__1094; f_Ec_ecMetaSpans = dtb__1095; f_Ec_ecUseSpans = dtb__1096; f_Ec_ecWarnings = dtb__1097; f_Ec_ecCounters = dtb__1098; f_Ec_ecErrors = dtb__1099 } -> dtb__1099
  | _ -> failwith "DT: impossible branch"
))

# 1061 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddError = (fun (mc0 : t_Ec) (mc1 : Base_dDiag.t_Diagnostic) -> (match mc0 with
  | { f_Ec_ecNext = dtb__1100; f_Ec_ecSols = dtb__1101; f_Ec_ecDefsRev = dtb__1102; f_Ec_ecDatas = dtb__1103; f_Ec_ecDepthOfMeta = dtb__1104; f_Ec_ecGoals = dtb__1105; f_Ec_ecInsts = dtb__1106; f_Ec_ecClasses = dtb__1107; f_Ec_ecConstraints = dtb__1108; f_Ec_ecDefTbl = dtb__1109; f_Ec_ecGlobalsTbl = dtb__1110; f_Ec_ecSolTbl = dtb__1111; f_Ec_ecDepthTbl = dtb__1112; f_Ec_ecGlobalsComplete = dtb__1113; f_Ec_ecClausesTbl = dtb__1114; f_Ec_ecCtorTbl = dtb__1115; f_Ec_ecHasLinear = dtb__1116; f_Ec_ecMetaSpans = dtb__1117; f_Ec_ecUseSpans = dtb__1118; f_Ec_ecWarnings = dtb__1119; f_Ec_ecCounters = dtb__1120; f_Ec_ecErrors = dtb__1121 } -> { f_Ec_ecNext = dtb__1100; f_Ec_ecSols = dtb__1101; f_Ec_ecDefsRev = dtb__1102; f_Ec_ecDatas = dtb__1103; f_Ec_ecDepthOfMeta = dtb__1104; f_Ec_ecGoals = dtb__1105; f_Ec_ecInsts = dtb__1106; f_Ec_ecClasses = dtb__1107; f_Ec_ecConstraints = dtb__1108; f_Ec_ecDefTbl = dtb__1109; f_Ec_ecGlobalsTbl = dtb__1110; f_Ec_ecSolTbl = dtb__1111; f_Ec_ecDepthTbl = dtb__1112; f_Ec_ecGlobalsComplete = dtb__1113; f_Ec_ecClausesTbl = dtb__1114; f_Ec_ecCtorTbl = dtb__1115; f_Ec_ecHasLinear = dtb__1116; f_Ec_ecMetaSpans = dtb__1117; f_Ec_ecUseSpans = dtb__1118; f_Ec_ecWarnings = dtb__1119; f_Ec_ecCounters = dtb__1120; f_Ec_ecErrors = (B_dData_dList.C_List__x58__x58_ (mc1, dtb__1121)) }
  | _ -> failwith "DT: impossible branch"
))

# 1087 "Vuna/Compiler/Elab/Types.vuna"
let rec v_datasHaveLinear = (fun (mc0 : t_DtData B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1122, dtb__1123) -> (if (v_dtDataLinear dtb__1122) then true else (v_datasHaveLinear dtb__1123))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1111 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxDepth = (fun (ctx : t_Ctx) -> (ctx).f_Ctx_ctxDepthF)

# 1114 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxBind = (fun (mc0 : string) (mc1 : Core_dTerm.t_Term) (mc2 : t_Ctx) -> (match mc2 with
  | { f_Ctx_ctxItems = dtb__1124; f_Ctx_ctxEnvF = dtb__1125; f_Ctx_ctxRefVals = dtb__1126; f_Ctx_ctxDepthF = dtb__1127; f_Ctx_ctxEnvRF = dtb__1128 } -> ((fun v -> { f_Ctx_ctxItems = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }, dtb__1124)); f_Ctx_ctxEnvF = (B_dData_dList.C_List__x58__x58_ (v, dtb__1125)); f_Ctx_ctxRefVals = dtb__1126; f_Ctx_ctxDepthF = (dtb__1127 + 1); f_Ctx_ctxEnvRF = (B_dData_dList.C_List__x58__x58_ (v, dtb__1128)) }) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (mc0, dtb__1127, B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
))

# 1121 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxBindValue = (fun (mc0 : string) (mc1 : Core_dTerm.t_Value) (mc2 : t_Ctx) -> (match mc2 with
  | { f_Ctx_ctxItems = dtb__1129; f_Ctx_ctxEnvF = dtb__1130; f_Ctx_ctxRefVals = dtb__1131; f_Ctx_ctxDepthF = dtb__1132; f_Ctx_ctxEnvRF = dtb__1133 } -> ((fun v -> { f_Ctx_ctxItems = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = ((Core_dEval.v_quote dtb__1132) mc1) }, dtb__1129)); f_Ctx_ctxEnvF = (B_dData_dList.C_List__x58__x58_ (v, dtb__1130)); f_Ctx_ctxRefVals = dtb__1131; f_Ctx_ctxDepthF = (dtb__1132 + 1); f_Ctx_ctxEnvRF = (B_dData_dList.C_List__x58__x58_ (v, dtb__1133)) }) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (mc0, dtb__1132, B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
))

# 1134 "Vuna/Compiler/Elab/Types.vuna"
let rec v_ctxLookupAt = (fun (mc0 : string) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1134, dtb__1135) -> (match dtb__1134 with
  | { B_dData_dPair.f_Pair_first = dtb__1136; B_dData_dPair.f_Pair_second = dtb__1137 } -> (if (dtb__1136 = mc0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = dtb__1137 })) else (((v_ctxLookupAt mc0) dtb__1135) (mc2 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1139 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxLookup = (fun (name : string) (ctx : t_Ctx) -> (((v_ctxLookupAt name) (ctx).f_Ctx_ctxItems) 0))

# 1148 "Vuna/Compiler/Elab/Types.vuna"
let rec v_ctxEnvAt = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1138, dtb__1139) -> (match dtb__1138 with
  | { B_dData_dPair.f_Pair_first = dtb__1140; B_dData_dPair.f_Pair_second = dtb__1141 } -> (B_dData_dList.C_List__x58__x58_ ((Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__1140, ((mc2 - mc1) - 1), B_dData_dList.C_List_Nil)))), (((v_ctxEnvAt dtb__1139) (mc1 + 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1155 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxEnv = (fun (mc0 : t_Ctx) -> (match mc0 with
  | { f_Ctx_ctxItems = dtb__1142; f_Ctx_ctxEnvF = dtb__1143; f_Ctx_ctxRefVals = dtb__1144; f_Ctx_ctxDepthF = dtb__1145; f_Ctx_ctxEnvRF = dtb__1146 } -> dtb__1143
  | _ -> failwith "DT: impossible branch"
))

# 1159 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxEnvRefined = (fun (ctx : t_Ctx) -> (ctx).f_Ctx_ctxEnvRF)

# 1187 "Vuna/Compiler/Elab/Types.vuna"
let rec v_refineLookup = (fun (mc0 : int) (mc1 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1147, dtb__1148) -> (match dtb__1147 with
  | { B_dData_dPair.f_Pair_first = dtb__1149; B_dData_dPair.f_Pair_second = dtb__1150 } -> (if (dtb__1149 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__1150)) else ((v_refineLookup mc0) dtb__1148))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1164 "Vuna/Compiler/Elab/Types.vuna"
let rec v_refineValue = (fun (mc0 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : Core_dTerm.t_Value) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> (if (mc1 <= 0) then mc2 else (match mc2 with
  | Core_dTerm.C_Value_VNeutral (dtb__1151) -> (match dtb__1151 with
  | Core_dTerm.C_Neutral_NVar (dtb__1152, dtb__1153, dtb__1154) -> ((fun sp2 -> (match ((v_refineLookup dtb__1153) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1155) -> ((Core_dEval.v_applySpine (((v_refineValue mc0) (mc1 - 1)) dtb__1155)) sp2)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__1152, dtb__1153, sp2))))
  | _ -> failwith "DT: impossible branch"
)) ((B_dData_dList.v_map ((v_refineValue mc0) (mc1 - 1))) dtb__1154))
  | Core_dTerm.C_Neutral_NGlobal (dtb__1156, dtb__1157) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb__1156, ((B_dData_dList.v_map ((v_refineValue mc0) (mc1 - 1))) dtb__1157)))))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VCon (dtb__1158, dtb__1159) -> (Core_dTerm.C_Value_VCon (dtb__1158, ((B_dData_dList.v_map ((v_refineValue mc0) (mc1 - 1))) dtb__1159)))
  | Core_dTerm.C_Value_VApp (dtb__1160, dtb__1161) -> (Core_dTerm.C_Value_VApp ((((v_refineValue mc0) (mc1 - 1)) dtb__1160), (((v_refineValue mc0) (mc1 - 1)) dtb__1161)))
  | Core_dTerm.C_Value_VCase (dtb__1162, dtb__1163) -> (Core_dTerm.C_Value_VCase ((((v_refineValue mc0) (mc1 - 1)) dtb__1162), dtb__1163))
  | Core_dTerm.C_Value_VIf (dtb__1164, dtb__1165, dtb__1166) -> (Core_dTerm.C_Value_VIf ((((v_refineValue mc0) (mc1 - 1)) dtb__1164), (((v_refineValue mc0) (mc1 - 1)) dtb__1165), (((v_refineValue mc0) (mc1 - 1)) dtb__1166)))
  | Core_dTerm.C_Value_VMeta (dtb__1167, dtb__1168) -> (Core_dTerm.C_Value_VMeta (dtb__1167, ((B_dData_dList.v_map ((v_refineValue mc0) (mc1 - 1))) dtb__1168)))
  | _ -> mc2
))
))

# 1143 "Vuna/Compiler/Elab/Types.vuna"
let v_refinedEnv = (fun (mc0 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> ((B_dData_dList.v_map ((v_refineValue mc0) Core_dTerm.v_defaultFuel)) mc1)
))

# 1128 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxRefine = (fun (mc0 : t_Ctx) (mc1 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | { f_Ctx_ctxItems = dtb__1169; f_Ctx_ctxEnvF = dtb__1170; f_Ctx_ctxRefVals = dtb__1171; f_Ctx_ctxDepthF = dtb__1172; f_Ctx_ctxEnvRF = dtb__1173 } -> ((fun refs2 -> { f_Ctx_ctxItems = dtb__1169; f_Ctx_ctxEnvF = dtb__1170; f_Ctx_ctxRefVals = refs2; f_Ctx_ctxDepthF = dtb__1172; f_Ctx_ctxEnvRF = ((v_refinedEnv refs2) dtb__1170) }) ((B_dData_dList.v_append dtb__1171) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 1192 "Vuna/Compiler/Elab/Types.vuna"
let v_evalCtx = (fun (ctx : t_Ctx) (ty : Core_dTerm.t_Term) -> ((Core_dEval.v_eval (v_ctxEnvRefined ctx)) ty))

# 1197 "Vuna/Compiler/Elab/Types.vuna"
let v_varTypeValue = (fun (ctx : t_Ctx) (idx : int) (ty : Core_dTerm.t_Term) -> ((Core_dEval.v_eval (v_ctxEnvRefined ctx)) (((Core_dTerm.v_shift 0) (idx + 1)) ty)))

# 1200 "Vuna/Compiler/Elab/Types.vuna"
let v_emptyCtx = { f_Ctx_ctxItems = B_dData_dList.C_List_Nil; f_Ctx_ctxEnvF = B_dData_dList.C_List_Nil; f_Ctx_ctxRefVals = B_dData_dList.C_List_Nil; f_Ctx_ctxDepthF = 0; f_Ctx_ctxEnvRF = B_dData_dList.C_List_Nil }

# 1206 "Vuna/Compiler/Elab/Types.vuna"
let v_errAt = (fun (sp : Base_dSource.t_Span) (msg : string) -> ((Base_dDiag.v_rawAt sp) msg))

# 1210 "Vuna/Compiler/Elab/Types.vuna"
let v_newMeta = (fun (mc0 : t_Ctx) (mc1 : t_Ec) -> (match mc1 with
  | { f_Ec_ecNext = dtb__1174; f_Ec_ecSols = dtb__1175; f_Ec_ecDefsRev = dtb__1176; f_Ec_ecDatas = dtb__1177; f_Ec_ecDepthOfMeta = dtb__1178; f_Ec_ecGoals = dtb__1179; f_Ec_ecInsts = dtb__1180; f_Ec_ecClasses = dtb__1181; f_Ec_ecConstraints = dtb__1182; f_Ec_ecDefTbl = dtb__1183; f_Ec_ecGlobalsTbl = dtb__1184; f_Ec_ecSolTbl = dtb__1185; f_Ec_ecDepthTbl = dtb__1186; f_Ec_ecGlobalsComplete = dtb__1187; f_Ec_ecClausesTbl = dtb__1188; f_Ec_ecCtorTbl = dtb__1189; f_Ec_ecHasLinear = dtb__1190; f_Ec_ecMetaSpans = dtb__1191; f_Ec_ecUseSpans = dtb__1192; f_Ec_ecWarnings = dtb__1193; f_Ec_ecCounters = dtb__1194; f_Ec_ecErrors = dtb__1195 } -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TMeta (dtb__1174)); B_dData_dPair.f_Pair_second = { f_Ec_ecNext = (dtb__1174 + 1); f_Ec_ecSols = dtb__1175; f_Ec_ecDefsRev = dtb__1176; f_Ec_ecDatas = dtb__1177; f_Ec_ecDepthOfMeta = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1174; B_dData_dPair.f_Pair_second = (v_ctxDepth mc0) }, dtb__1178)); f_Ec_ecGoals = dtb__1179; f_Ec_ecInsts = dtb__1180; f_Ec_ecClasses = dtb__1181; f_Ec_ecConstraints = dtb__1182; f_Ec_ecDefTbl = dtb__1183; f_Ec_ecGlobalsTbl = dtb__1184; f_Ec_ecSolTbl = dtb__1185; f_Ec_ecDepthTbl = (((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) dtb__1174) (v_ctxDepth mc0)) dtb__1186); f_Ec_ecGlobalsComplete = dtb__1187; f_Ec_ecClausesTbl = dtb__1188; f_Ec_ecCtorTbl = dtb__1189; f_Ec_ecHasLinear = dtb__1190; f_Ec_ecMetaSpans = dtb__1191; f_Ec_ecUseSpans = dtb__1192; f_Ec_ecWarnings = dtb__1193; f_Ec_ecCounters = dtb__1194; f_Ec_ecErrors = dtb__1195 } }
  | _ -> failwith "DT: impossible branch"
))

# 1216 "Vuna/Compiler/Elab/Types.vuna"
let v_forceVal = (fun (ec : t_Ec) (v : Core_dTerm.t_Value) -> ((((Core_dEval.v_force (v_ecDefTbl ec)) (v_ecSolsP ec)) Core_dTerm.v_defaultFuel) v))

# 1236 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgDatas = (fun (mc0 : t_DtProgram) -> (match mc0 with
  | { f_DtProgram_dtProgDatas = dtb__1196; f_DtProgram_dtProgDefs = dtb__1197; f_DtProgram_dtProgGoals = dtb__1198; f_DtProgram_dtProgSols = dtb__1199; f_DtProgram_dtProgGlobals = dtb__1200; f_DtProgram_dtProgInsts = dtb__1201; f_DtProgram_dtProgClasses = dtb__1202; f_DtProgram_dtProgNext = dtb__1203; f_DtProgram_dtProgDepths = dtb__1204; f_DtProgram_dtProgWarnings = dtb__1205 } -> dtb__1196
  | _ -> failwith "DT: impossible branch"
))

# 1239 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgDefs = (fun (mc0 : t_DtProgram) -> (match mc0 with
  | { f_DtProgram_dtProgDatas = dtb__1206; f_DtProgram_dtProgDefs = dtb__1207; f_DtProgram_dtProgGoals = dtb__1208; f_DtProgram_dtProgSols = dtb__1209; f_DtProgram_dtProgGlobals = dtb__1210; f_DtProgram_dtProgInsts = dtb__1211; f_DtProgram_dtProgClasses = dtb__1212; f_DtProgram_dtProgNext = dtb__1213; f_DtProgram_dtProgDepths = dtb__1214; f_DtProgram_dtProgWarnings = dtb__1215 } -> dtb__1207
  | _ -> failwith "DT: impossible branch"
))

# 1242 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgGoals = (fun (mc0 : t_DtProgram) -> (match mc0 with
  | { f_DtProgram_dtProgDatas = dtb__1216; f_DtProgram_dtProgDefs = dtb__1217; f_DtProgram_dtProgGoals = dtb__1218; f_DtProgram_dtProgSols = dtb__1219; f_DtProgram_dtProgGlobals = dtb__1220; f_DtProgram_dtProgInsts = dtb__1221; f_DtProgram_dtProgClasses = dtb__1222; f_DtProgram_dtProgNext = dtb__1223; f_DtProgram_dtProgDepths = dtb__1224; f_DtProgram_dtProgWarnings = dtb__1225 } -> dtb__1218
  | _ -> failwith "DT: impossible branch"
))

# 1245 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgSols = (fun (mc0 : t_DtProgram) -> (match mc0 with
  | { f_DtProgram_dtProgDatas = dtb__1226; f_DtProgram_dtProgDefs = dtb__1227; f_DtProgram_dtProgGoals = dtb__1228; f_DtProgram_dtProgSols = dtb__1229; f_DtProgram_dtProgGlobals = dtb__1230; f_DtProgram_dtProgInsts = dtb__1231; f_DtProgram_dtProgClasses = dtb__1232; f_DtProgram_dtProgNext = dtb__1233; f_DtProgram_dtProgDepths = dtb__1234; f_DtProgram_dtProgWarnings = dtb__1235 } -> dtb__1229
  | _ -> failwith "DT: impossible branch"
))

# 1248 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgGlobals = (fun (mc0 : t_DtProgram) -> (match mc0 with
  | { f_DtProgram_dtProgDatas = dtb__1236; f_DtProgram_dtProgDefs = dtb__1237; f_DtProgram_dtProgGoals = dtb__1238; f_DtProgram_dtProgSols = dtb__1239; f_DtProgram_dtProgGlobals = dtb__1240; f_DtProgram_dtProgInsts = dtb__1241; f_DtProgram_dtProgClasses = dtb__1242; f_DtProgram_dtProgNext = dtb__1243; f_DtProgram_dtProgDepths = dtb__1244; f_DtProgram_dtProgWarnings = dtb__1245 } -> dtb__1240
  | _ -> failwith "DT: impossible branch"
))

# 1251 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgInsts = (fun (mc0 : t_DtProgram) -> (match mc0 with
  | { f_DtProgram_dtProgDatas = dtb__1246; f_DtProgram_dtProgDefs = dtb__1247; f_DtProgram_dtProgGoals = dtb__1248; f_DtProgram_dtProgSols = dtb__1249; f_DtProgram_dtProgGlobals = dtb__1250; f_DtProgram_dtProgInsts = dtb__1251; f_DtProgram_dtProgClasses = dtb__1252; f_DtProgram_dtProgNext = dtb__1253; f_DtProgram_dtProgDepths = dtb__1254; f_DtProgram_dtProgWarnings = dtb__1255 } -> dtb__1251
  | _ -> failwith "DT: impossible branch"
))

# 1254 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgClasses = (fun (mc0 : t_DtProgram) -> (match mc0 with
  | { f_DtProgram_dtProgDatas = dtb__1256; f_DtProgram_dtProgDefs = dtb__1257; f_DtProgram_dtProgGoals = dtb__1258; f_DtProgram_dtProgSols = dtb__1259; f_DtProgram_dtProgGlobals = dtb__1260; f_DtProgram_dtProgInsts = dtb__1261; f_DtProgram_dtProgClasses = dtb__1262; f_DtProgram_dtProgNext = dtb__1263; f_DtProgram_dtProgDepths = dtb__1264; f_DtProgram_dtProgWarnings = dtb__1265 } -> dtb__1262
  | _ -> failwith "DT: impossible branch"
))

# 1258 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgWarnings = (fun (mc0 : t_DtProgram) -> (match mc0 with
  | { f_DtProgram_dtProgDatas = dtb__1266; f_DtProgram_dtProgDefs = dtb__1267; f_DtProgram_dtProgGoals = dtb__1268; f_DtProgram_dtProgSols = dtb__1269; f_DtProgram_dtProgGlobals = dtb__1270; f_DtProgram_dtProgInsts = dtb__1271; f_DtProgram_dtProgClasses = dtb__1272; f_DtProgram_dtProgNext = dtb__1273; f_DtProgram_dtProgDepths = dtb__1274; f_DtProgram_dtProgWarnings = dtb__1275 } -> dtb__1275
  | _ -> failwith "DT: impossible branch"
))

# 1263 "Vuna/Compiler/Elab/Types.vuna"
let v_solsToTbl = (fun (sols : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) sols) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) B_dData_dList.C_List_Nil)))

# 1266 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutDefTbl = (fun (mc0 : t_Ec) (mc1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | { f_Ec_ecNext = dtb__1276; f_Ec_ecSols = dtb__1277; f_Ec_ecDefsRev = dtb__1278; f_Ec_ecDatas = dtb__1279; f_Ec_ecDepthOfMeta = dtb__1280; f_Ec_ecGoals = dtb__1281; f_Ec_ecInsts = dtb__1282; f_Ec_ecClasses = dtb__1283; f_Ec_ecConstraints = dtb__1284; f_Ec_ecDefTbl = dtb__1285; f_Ec_ecGlobalsTbl = dtb__1286; f_Ec_ecSolTbl = dtb__1287; f_Ec_ecDepthTbl = dtb__1288; f_Ec_ecGlobalsComplete = dtb__1289; f_Ec_ecClausesTbl = dtb__1290; f_Ec_ecCtorTbl = dtb__1291; f_Ec_ecHasLinear = dtb__1292; f_Ec_ecMetaSpans = dtb__1293; f_Ec_ecUseSpans = dtb__1294; f_Ec_ecWarnings = dtb__1295; f_Ec_ecCounters = dtb__1296; f_Ec_ecErrors = dtb__1297 } -> { f_Ec_ecNext = dtb__1276; f_Ec_ecSols = dtb__1277; f_Ec_ecDefsRev = dtb__1278; f_Ec_ecDatas = dtb__1279; f_Ec_ecDepthOfMeta = dtb__1280; f_Ec_ecGoals = dtb__1281; f_Ec_ecInsts = dtb__1282; f_Ec_ecClasses = dtb__1283; f_Ec_ecConstraints = dtb__1284; f_Ec_ecDefTbl = mc1; f_Ec_ecGlobalsTbl = dtb__1286; f_Ec_ecSolTbl = dtb__1287; f_Ec_ecDepthTbl = dtb__1288; f_Ec_ecGlobalsComplete = dtb__1289; f_Ec_ecClausesTbl = dtb__1290; f_Ec_ecCtorTbl = dtb__1291; f_Ec_ecHasLinear = dtb__1292; f_Ec_ecMetaSpans = dtb__1293; f_Ec_ecUseSpans = dtb__1294; f_Ec_ecWarnings = dtb__1295; f_Ec_ecCounters = dtb__1296; f_Ec_ecErrors = dtb__1297 }
  | _ -> failwith "DT: impossible branch"
))
