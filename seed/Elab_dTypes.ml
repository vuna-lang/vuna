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

# 178 "Vuna/Compiler/Elab/Types.vuna"
let v_dtInstName = (fun (i : t_DtInst) -> (i).f_DtInst_dtInstName)

# 181 "Vuna/Compiler/Elab/Types.vuna"
let v_dtInstSym = (fun (i : t_DtInst) -> (i).f_DtInst_dtInstSym)

# 184 "Vuna/Compiler/Elab/Types.vuna"
let v_dtInstKey = (fun (i : t_DtInst) -> (i).f_DtInst_dtInstKey)

# 190 "Vuna/Compiler/Elab/Types.vuna"
let rec v_flattenTaggedApp = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TGlobal (dtb__157) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__157; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | Core_dTerm.C_Term_TApp (dtb__158, dtb__159, dtb__160) -> (let nd_uscrut4 = (v_flattenTaggedApp dtb__158) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__161) -> (match dtb__161 with
  | { B_dData_dPair.f_Pair_first = dtb__162; B_dData_dPair.f_Pair_second = dtb__163 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__162; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__163) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__159; B_dData_dPair.f_Pair_second = dtb__160 }, B_dData_dList.C_List_Nil))) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 212 "Vuna/Compiler/Elab/Types.vuna"
let v_instFamilyOf = (fun (i : t_DtInst) -> (let nd_uscrut1 = (v_flattenTaggedApp (i).f_DtInst_dtInstHead) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb__164) -> (match dtb__164 with
  | { B_dData_dPair.f_Pair_first = dtb__165; B_dData_dPair.f_Pair_second = dtb__166 } -> dtb__165
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 219 "Vuna/Compiler/Elab/Types.vuna"
let v_instStoreEmpty = { f_InstStore_instsList = B_dData_dList.C_List_Nil; f_InstStore_instsByFamily = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil) }

# 229 "Vuna/Compiler/Elab/Types.vuna"
let v_instStorePush = (fun (store : t_InstStore) (i : t_DtInst) -> (let fam = (v_instFamilyOf i) in (let bucket = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) fam) (store).f_InstStore_instsByFamily) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__167) -> dtb__167
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in { f_InstStore_instsList = ((B_dData_dList.v_append (store).f_InstStore_instsList) (B_dData_dList.C_List__x58__x58_ (i, B_dData_dList.C_List_Nil))); f_InstStore_instsByFamily = (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) fam) ((B_dData_dList.v_append bucket) (B_dData_dList.C_List__x58__x58_ (i, B_dData_dList.C_List_Nil)))) (store).f_InstStore_instsByFamily) })))

# 224 "Vuna/Compiler/Elab/Types.vuna"
let rec v_instStoreOf = (fun (mc0 : t_DtInst B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__168, dtb__169) -> ((v_instStorePush (v_instStoreOf dtb__169)) dtb__168)
  | B_dData_dList.C_List_Nil -> v_instStoreEmpty
  | _ -> failwith "DT: impossible branch"
))

# 243 "Vuna/Compiler/Elab/Types.vuna"
let v_instStoreFamily = (fun (store : t_InstStore) (fam : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) fam) (store).f_InstStore_instsByFamily) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__170) -> dtb__170
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 288 "Vuna/Compiler/Elab/Types.vuna"
let v_csEmpty = { f_ConstraintStore_csPending = B_dContainer_dQueue.v_empty; f_ConstraintStore_csNextId = 0; f_ConstraintStore_csTried = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil); f_ConstraintStore_csSolsCount = 0; f_ConstraintStore_csPassNext = (0 - 1); f_ConstraintStore_csPassSols = (0 - 1); f_ConstraintStore_csCtorIndexComplete = false }

# 327 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutNext = (fun (mc0 : t_Ec) (mc1 : int) -> (match mc0 with
  | { f_Ec_ecNext = dtb__171; f_Ec_ecSols = dtb__172; f_Ec_ecDefsRev = dtb__173; f_Ec_ecDatas = dtb__174; f_Ec_ecDepthOfMeta = dtb__175; f_Ec_ecGoals = dtb__176; f_Ec_ecInsts = dtb__177; f_Ec_ecClasses = dtb__178; f_Ec_ecConstraints = dtb__179; f_Ec_ecDefTbl = dtb__180; f_Ec_ecGlobalsTbl = dtb__181; f_Ec_ecSolTbl = dtb__182; f_Ec_ecDepthTbl = dtb__183; f_Ec_ecGlobalsComplete = dtb__184; f_Ec_ecClausesTbl = dtb__185; f_Ec_ecCtorTbl = dtb__186; f_Ec_ecHasLinear = dtb__187; f_Ec_ecMetaSpans = dtb__188; f_Ec_ecUseSpans = dtb__189; f_Ec_ecWarnings = dtb__190; f_Ec_ecCounters = dtb__191; f_Ec_ecErrors = dtb__192 } -> { f_Ec_ecNext = mc1; f_Ec_ecSols = dtb__172; f_Ec_ecDefsRev = dtb__173; f_Ec_ecDatas = dtb__174; f_Ec_ecDepthOfMeta = dtb__175; f_Ec_ecGoals = dtb__176; f_Ec_ecInsts = dtb__177; f_Ec_ecClasses = dtb__178; f_Ec_ecConstraints = dtb__179; f_Ec_ecDefTbl = dtb__180; f_Ec_ecGlobalsTbl = dtb__181; f_Ec_ecSolTbl = dtb__182; f_Ec_ecDepthTbl = dtb__183; f_Ec_ecGlobalsComplete = dtb__184; f_Ec_ecClausesTbl = dtb__185; f_Ec_ecCtorTbl = dtb__186; f_Ec_ecHasLinear = dtb__187; f_Ec_ecMetaSpans = dtb__188; f_Ec_ecUseSpans = dtb__189; f_Ec_ecWarnings = dtb__190; f_Ec_ecCounters = dtb__191; f_Ec_ecErrors = dtb__192 }
  | _ -> failwith "DT: impossible branch"
))

# 353 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutClausesTbl = (fun (mc0 : t_Ec) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | { f_Ec_ecNext = dtb__193; f_Ec_ecSols = dtb__194; f_Ec_ecDefsRev = dtb__195; f_Ec_ecDatas = dtb__196; f_Ec_ecDepthOfMeta = dtb__197; f_Ec_ecGoals = dtb__198; f_Ec_ecInsts = dtb__199; f_Ec_ecClasses = dtb__200; f_Ec_ecConstraints = dtb__201; f_Ec_ecDefTbl = dtb__202; f_Ec_ecGlobalsTbl = dtb__203; f_Ec_ecSolTbl = dtb__204; f_Ec_ecDepthTbl = dtb__205; f_Ec_ecGlobalsComplete = dtb__206; f_Ec_ecClausesTbl = dtb__207; f_Ec_ecCtorTbl = dtb__208; f_Ec_ecHasLinear = dtb__209; f_Ec_ecMetaSpans = dtb__210; f_Ec_ecUseSpans = dtb__211; f_Ec_ecWarnings = dtb__212; f_Ec_ecCounters = dtb__213; f_Ec_ecErrors = dtb__214 } -> { f_Ec_ecNext = dtb__193; f_Ec_ecSols = dtb__194; f_Ec_ecDefsRev = dtb__195; f_Ec_ecDatas = dtb__196; f_Ec_ecDepthOfMeta = dtb__197; f_Ec_ecGoals = dtb__198; f_Ec_ecInsts = dtb__199; f_Ec_ecClasses = dtb__200; f_Ec_ecConstraints = dtb__201; f_Ec_ecDefTbl = dtb__202; f_Ec_ecGlobalsTbl = dtb__203; f_Ec_ecSolTbl = dtb__204; f_Ec_ecDepthTbl = dtb__205; f_Ec_ecGlobalsComplete = dtb__206; f_Ec_ecClausesTbl = mc1; f_Ec_ecCtorTbl = dtb__208; f_Ec_ecHasLinear = dtb__209; f_Ec_ecMetaSpans = dtb__210; f_Ec_ecUseSpans = dtb__211; f_Ec_ecWarnings = dtb__212; f_Ec_ecCounters = dtb__213; f_Ec_ecErrors = dtb__214 }
  | _ -> failwith "DT: impossible branch"
))

# 379 "Vuna/Compiler/Elab/Types.vuna"
let v_ecNext = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__215; f_Ec_ecSols = dtb__216; f_Ec_ecDefsRev = dtb__217; f_Ec_ecDatas = dtb__218; f_Ec_ecDepthOfMeta = dtb__219; f_Ec_ecGoals = dtb__220; f_Ec_ecInsts = dtb__221; f_Ec_ecClasses = dtb__222; f_Ec_ecConstraints = dtb__223; f_Ec_ecDefTbl = dtb__224; f_Ec_ecGlobalsTbl = dtb__225; f_Ec_ecSolTbl = dtb__226; f_Ec_ecDepthTbl = dtb__227; f_Ec_ecGlobalsComplete = dtb__228; f_Ec_ecClausesTbl = dtb__229; f_Ec_ecCtorTbl = dtb__230; f_Ec_ecHasLinear = dtb__231; f_Ec_ecMetaSpans = dtb__232; f_Ec_ecUseSpans = dtb__233; f_Ec_ecWarnings = dtb__234; f_Ec_ecCounters = dtb__235; f_Ec_ecErrors = dtb__236 } -> dtb__215
  | _ -> failwith "DT: impossible branch"
))

# 383 "Vuna/Compiler/Elab/Types.vuna"
let v_ecSols = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__237; f_Ec_ecSols = dtb__238; f_Ec_ecDefsRev = dtb__239; f_Ec_ecDatas = dtb__240; f_Ec_ecDepthOfMeta = dtb__241; f_Ec_ecGoals = dtb__242; f_Ec_ecInsts = dtb__243; f_Ec_ecClasses = dtb__244; f_Ec_ecConstraints = dtb__245; f_Ec_ecDefTbl = dtb__246; f_Ec_ecGlobalsTbl = dtb__247; f_Ec_ecSolTbl = dtb__248; f_Ec_ecDepthTbl = dtb__249; f_Ec_ecGlobalsComplete = dtb__250; f_Ec_ecClausesTbl = dtb__251; f_Ec_ecCtorTbl = dtb__252; f_Ec_ecHasLinear = dtb__253; f_Ec_ecMetaSpans = dtb__254; f_Ec_ecUseSpans = dtb__255; f_Ec_ecWarnings = dtb__256; f_Ec_ecCounters = dtb__257; f_Ec_ecErrors = dtb__258 } -> dtb__238
  | _ -> failwith "DT: impossible branch"
))

# 388 "Vuna/Compiler/Elab/Types.vuna"
let v_ecDefs = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__259; f_Ec_ecSols = dtb__260; f_Ec_ecDefsRev = dtb__261; f_Ec_ecDatas = dtb__262; f_Ec_ecDepthOfMeta = dtb__263; f_Ec_ecGoals = dtb__264; f_Ec_ecInsts = dtb__265; f_Ec_ecClasses = dtb__266; f_Ec_ecConstraints = dtb__267; f_Ec_ecDefTbl = dtb__268; f_Ec_ecGlobalsTbl = dtb__269; f_Ec_ecSolTbl = dtb__270; f_Ec_ecDepthTbl = dtb__271; f_Ec_ecGlobalsComplete = dtb__272; f_Ec_ecClausesTbl = dtb__273; f_Ec_ecCtorTbl = dtb__274; f_Ec_ecHasLinear = dtb__275; f_Ec_ecMetaSpans = dtb__276; f_Ec_ecUseSpans = dtb__277; f_Ec_ecWarnings = dtb__278; f_Ec_ecCounters = dtb__279; f_Ec_ecErrors = dtb__280 } -> (B_dData_dList.v_reverse dtb__261)
  | _ -> failwith "DT: impossible branch"
))

# 393 "Vuna/Compiler/Elab/Types.vuna"
let v_ecDefTbl = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__281; f_Ec_ecSols = dtb__282; f_Ec_ecDefsRev = dtb__283; f_Ec_ecDatas = dtb__284; f_Ec_ecDepthOfMeta = dtb__285; f_Ec_ecGoals = dtb__286; f_Ec_ecInsts = dtb__287; f_Ec_ecClasses = dtb__288; f_Ec_ecConstraints = dtb__289; f_Ec_ecDefTbl = dtb__290; f_Ec_ecGlobalsTbl = dtb__291; f_Ec_ecSolTbl = dtb__292; f_Ec_ecDepthTbl = dtb__293; f_Ec_ecGlobalsComplete = dtb__294; f_Ec_ecClausesTbl = dtb__295; f_Ec_ecCtorTbl = dtb__296; f_Ec_ecHasLinear = dtb__297; f_Ec_ecMetaSpans = dtb__298; f_Ec_ecUseSpans = dtb__299; f_Ec_ecWarnings = dtb__300; f_Ec_ecCounters = dtb__301; f_Ec_ecErrors = dtb__302 } -> dtb__290
  | _ -> failwith "DT: impossible branch"
))

# 399 "Vuna/Compiler/Elab/Types.vuna"
let v_ecGlobalsTbl = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__303; f_Ec_ecSols = dtb__304; f_Ec_ecDefsRev = dtb__305; f_Ec_ecDatas = dtb__306; f_Ec_ecDepthOfMeta = dtb__307; f_Ec_ecGoals = dtb__308; f_Ec_ecInsts = dtb__309; f_Ec_ecClasses = dtb__310; f_Ec_ecConstraints = dtb__311; f_Ec_ecDefTbl = dtb__312; f_Ec_ecGlobalsTbl = dtb__313; f_Ec_ecSolTbl = dtb__314; f_Ec_ecDepthTbl = dtb__315; f_Ec_ecGlobalsComplete = dtb__316; f_Ec_ecClausesTbl = dtb__317; f_Ec_ecCtorTbl = dtb__318; f_Ec_ecHasLinear = dtb__319; f_Ec_ecMetaSpans = dtb__320; f_Ec_ecUseSpans = dtb__321; f_Ec_ecWarnings = dtb__322; f_Ec_ecCounters = dtb__323; f_Ec_ecErrors = dtb__324 } -> dtb__313
  | _ -> failwith "DT: impossible branch"
))

# 403 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutGlobalsTbl = (fun (mc0 : t_Ec) (mc1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | { f_Ec_ecNext = dtb__325; f_Ec_ecSols = dtb__326; f_Ec_ecDefsRev = dtb__327; f_Ec_ecDatas = dtb__328; f_Ec_ecDepthOfMeta = dtb__329; f_Ec_ecGoals = dtb__330; f_Ec_ecInsts = dtb__331; f_Ec_ecClasses = dtb__332; f_Ec_ecConstraints = dtb__333; f_Ec_ecDefTbl = dtb__334; f_Ec_ecGlobalsTbl = dtb__335; f_Ec_ecSolTbl = dtb__336; f_Ec_ecDepthTbl = dtb__337; f_Ec_ecGlobalsComplete = dtb__338; f_Ec_ecClausesTbl = dtb__339; f_Ec_ecCtorTbl = dtb__340; f_Ec_ecHasLinear = dtb__341; f_Ec_ecMetaSpans = dtb__342; f_Ec_ecUseSpans = dtb__343; f_Ec_ecWarnings = dtb__344; f_Ec_ecCounters = dtb__345; f_Ec_ecErrors = dtb__346 } -> { f_Ec_ecNext = dtb__325; f_Ec_ecSols = dtb__326; f_Ec_ecDefsRev = dtb__327; f_Ec_ecDatas = dtb__328; f_Ec_ecDepthOfMeta = dtb__329; f_Ec_ecGoals = dtb__330; f_Ec_ecInsts = dtb__331; f_Ec_ecClasses = dtb__332; f_Ec_ecConstraints = dtb__333; f_Ec_ecDefTbl = dtb__334; f_Ec_ecGlobalsTbl = mc1; f_Ec_ecSolTbl = dtb__336; f_Ec_ecDepthTbl = dtb__337; f_Ec_ecGlobalsComplete = dtb__338; f_Ec_ecClausesTbl = dtb__339; f_Ec_ecCtorTbl = dtb__340; f_Ec_ecHasLinear = dtb__341; f_Ec_ecMetaSpans = dtb__342; f_Ec_ecUseSpans = dtb__343; f_Ec_ecWarnings = dtb__344; f_Ec_ecCounters = dtb__345; f_Ec_ecErrors = dtb__346 }
  | _ -> failwith "DT: impossible branch"
))

# 429 "Vuna/Compiler/Elab/Types.vuna"
let v_ecDatas = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__347; f_Ec_ecSols = dtb__348; f_Ec_ecDefsRev = dtb__349; f_Ec_ecDatas = dtb__350; f_Ec_ecDepthOfMeta = dtb__351; f_Ec_ecGoals = dtb__352; f_Ec_ecInsts = dtb__353; f_Ec_ecClasses = dtb__354; f_Ec_ecConstraints = dtb__355; f_Ec_ecDefTbl = dtb__356; f_Ec_ecGlobalsTbl = dtb__357; f_Ec_ecSolTbl = dtb__358; f_Ec_ecDepthTbl = dtb__359; f_Ec_ecGlobalsComplete = dtb__360; f_Ec_ecClausesTbl = dtb__361; f_Ec_ecCtorTbl = dtb__362; f_Ec_ecHasLinear = dtb__363; f_Ec_ecMetaSpans = dtb__364; f_Ec_ecUseSpans = dtb__365; f_Ec_ecWarnings = dtb__366; f_Ec_ecCounters = dtb__367; f_Ec_ecErrors = dtb__368 } -> dtb__350
  | _ -> failwith "DT: impossible branch"
))

# 433 "Vuna/Compiler/Elab/Types.vuna"
let v_ecDepthTbl = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__369; f_Ec_ecSols = dtb__370; f_Ec_ecDefsRev = dtb__371; f_Ec_ecDatas = dtb__372; f_Ec_ecDepthOfMeta = dtb__373; f_Ec_ecGoals = dtb__374; f_Ec_ecInsts = dtb__375; f_Ec_ecClasses = dtb__376; f_Ec_ecConstraints = dtb__377; f_Ec_ecDefTbl = dtb__378; f_Ec_ecGlobalsTbl = dtb__379; f_Ec_ecSolTbl = dtb__380; f_Ec_ecDepthTbl = dtb__381; f_Ec_ecGlobalsComplete = dtb__382; f_Ec_ecClausesTbl = dtb__383; f_Ec_ecCtorTbl = dtb__384; f_Ec_ecHasLinear = dtb__385; f_Ec_ecMetaSpans = dtb__386; f_Ec_ecUseSpans = dtb__387; f_Ec_ecWarnings = dtb__388; f_Ec_ecCounters = dtb__389; f_Ec_ecErrors = dtb__390 } -> dtb__381
  | _ -> failwith "DT: impossible branch"
))

# 440 "Vuna/Compiler/Elab/Types.vuna"
let v_ecSetGlobalsComplete = (fun (mc0 : t_Ec) (mc1 : bool) -> (match mc0 with
  | { f_Ec_ecNext = dtb__391; f_Ec_ecSols = dtb__392; f_Ec_ecDefsRev = dtb__393; f_Ec_ecDatas = dtb__394; f_Ec_ecDepthOfMeta = dtb__395; f_Ec_ecGoals = dtb__396; f_Ec_ecInsts = dtb__397; f_Ec_ecClasses = dtb__398; f_Ec_ecConstraints = dtb__399; f_Ec_ecDefTbl = dtb__400; f_Ec_ecGlobalsTbl = dtb__401; f_Ec_ecSolTbl = dtb__402; f_Ec_ecDepthTbl = dtb__403; f_Ec_ecGlobalsComplete = dtb__404; f_Ec_ecClausesTbl = dtb__405; f_Ec_ecCtorTbl = dtb__406; f_Ec_ecHasLinear = dtb__407; f_Ec_ecMetaSpans = dtb__408; f_Ec_ecUseSpans = dtb__409; f_Ec_ecWarnings = dtb__410; f_Ec_ecCounters = dtb__411; f_Ec_ecErrors = dtb__412 } -> { f_Ec_ecNext = dtb__391; f_Ec_ecSols = dtb__392; f_Ec_ecDefsRev = dtb__393; f_Ec_ecDatas = dtb__394; f_Ec_ecDepthOfMeta = dtb__395; f_Ec_ecGoals = dtb__396; f_Ec_ecInsts = dtb__397; f_Ec_ecClasses = dtb__398; f_Ec_ecConstraints = dtb__399; f_Ec_ecDefTbl = dtb__400; f_Ec_ecGlobalsTbl = dtb__401; f_Ec_ecSolTbl = dtb__402; f_Ec_ecDepthTbl = dtb__403; f_Ec_ecGlobalsComplete = mc1; f_Ec_ecClausesTbl = dtb__405; f_Ec_ecCtorTbl = dtb__406; f_Ec_ecHasLinear = dtb__407; f_Ec_ecMetaSpans = dtb__408; f_Ec_ecUseSpans = dtb__409; f_Ec_ecWarnings = dtb__410; f_Ec_ecCounters = dtb__411; f_Ec_ecErrors = dtb__412 }
  | _ -> failwith "DT: impossible branch"
))

# 466 "Vuna/Compiler/Elab/Types.vuna"
let v_ecGoals = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__413; f_Ec_ecSols = dtb__414; f_Ec_ecDefsRev = dtb__415; f_Ec_ecDatas = dtb__416; f_Ec_ecDepthOfMeta = dtb__417; f_Ec_ecGoals = dtb__418; f_Ec_ecInsts = dtb__419; f_Ec_ecClasses = dtb__420; f_Ec_ecConstraints = dtb__421; f_Ec_ecDefTbl = dtb__422; f_Ec_ecGlobalsTbl = dtb__423; f_Ec_ecSolTbl = dtb__424; f_Ec_ecDepthTbl = dtb__425; f_Ec_ecGlobalsComplete = dtb__426; f_Ec_ecClausesTbl = dtb__427; f_Ec_ecCtorTbl = dtb__428; f_Ec_ecHasLinear = dtb__429; f_Ec_ecMetaSpans = dtb__430; f_Ec_ecUseSpans = dtb__431; f_Ec_ecWarnings = dtb__432; f_Ec_ecCounters = dtb__433; f_Ec_ecErrors = dtb__434 } -> dtb__418
  | _ -> failwith "DT: impossible branch"
))

# 470 "Vuna/Compiler/Elab/Types.vuna"
let v_ecInsts = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__435; f_Ec_ecSols = dtb__436; f_Ec_ecDefsRev = dtb__437; f_Ec_ecDatas = dtb__438; f_Ec_ecDepthOfMeta = dtb__439; f_Ec_ecGoals = dtb__440; f_Ec_ecInsts = dtb__441; f_Ec_ecClasses = dtb__442; f_Ec_ecConstraints = dtb__443; f_Ec_ecDefTbl = dtb__444; f_Ec_ecGlobalsTbl = dtb__445; f_Ec_ecSolTbl = dtb__446; f_Ec_ecDepthTbl = dtb__447; f_Ec_ecGlobalsComplete = dtb__448; f_Ec_ecClausesTbl = dtb__449; f_Ec_ecCtorTbl = dtb__450; f_Ec_ecHasLinear = dtb__451; f_Ec_ecMetaSpans = dtb__452; f_Ec_ecUseSpans = dtb__453; f_Ec_ecWarnings = dtb__454; f_Ec_ecCounters = dtb__455; f_Ec_ecErrors = dtb__456 } -> (dtb__441).f_InstStore_instsList
  | _ -> failwith "DT: impossible branch"
))

# 476 "Vuna/Compiler/Elab/Types.vuna"
let v_ecInstsFamily = (fun (mc0 : t_Ec) (mc1 : string) -> (match mc0 with
  | { f_Ec_ecNext = dtb__457; f_Ec_ecSols = dtb__458; f_Ec_ecDefsRev = dtb__459; f_Ec_ecDatas = dtb__460; f_Ec_ecDepthOfMeta = dtb__461; f_Ec_ecGoals = dtb__462; f_Ec_ecInsts = dtb__463; f_Ec_ecClasses = dtb__464; f_Ec_ecConstraints = dtb__465; f_Ec_ecDefTbl = dtb__466; f_Ec_ecGlobalsTbl = dtb__467; f_Ec_ecSolTbl = dtb__468; f_Ec_ecDepthTbl = dtb__469; f_Ec_ecGlobalsComplete = dtb__470; f_Ec_ecClausesTbl = dtb__471; f_Ec_ecCtorTbl = dtb__472; f_Ec_ecHasLinear = dtb__473; f_Ec_ecMetaSpans = dtb__474; f_Ec_ecUseSpans = dtb__475; f_Ec_ecWarnings = dtb__476; f_Ec_ecCounters = dtb__477; f_Ec_ecErrors = dtb__478 } -> ((v_instStoreFamily dtb__463) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 494 "Vuna/Compiler/Elab/Types.vuna"
let rec v_bucketCount = (fun (mc0 : (string, t_DtInst B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__479, dtb__480) -> ((B_dData_dList.v_length (B_dData_dPair.v_secondOf dtb__479)) + (v_bucketCount dtb__480))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 506 "Vuna/Compiler/Elab/Types.vuna"
let rec v_instNamesEq = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__481, dtb__482) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__483, dtb__484) -> (if (dtb__481 = dtb__483) then ((v_instNamesEq dtb__482) dtb__484) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__485, dtb__486) -> false
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 499 "Vuna/Compiler/Elab/Types.vuna"
let rec v_allBucketsMatch = (fun (mc0 : t_DtInst B_dData_dList.t_List) (mc1 : (string, t_DtInst B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__487, dtb__488) -> (match dtb__487 with
  | { B_dData_dPair.f_Pair_first = dtb__489; B_dData_dPair.f_Pair_second = dtb__490 } -> (if ((v_instNamesEq ((B_dData_dList.v_map v_dtInstSym) dtb__490)) ((B_dData_dList.v_map v_dtInstSym) ((B_dData_dList.v_filter (fun (i : t_DtInst) -> ((v_instFamilyOf i) = dtb__489))) mc0))) then ((v_allBucketsMatch mc0) dtb__488) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 486 "Vuna/Compiler/Elab/Types.vuna"
let v_ecInstsAudit = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__491; f_Ec_ecSols = dtb__492; f_Ec_ecDefsRev = dtb__493; f_Ec_ecDatas = dtb__494; f_Ec_ecDepthOfMeta = dtb__495; f_Ec_ecGoals = dtb__496; f_Ec_ecInsts = dtb__497; f_Ec_ecClasses = dtb__498; f_Ec_ecConstraints = dtb__499; f_Ec_ecDefTbl = dtb__500; f_Ec_ecGlobalsTbl = dtb__501; f_Ec_ecSolTbl = dtb__502; f_Ec_ecDepthTbl = dtb__503; f_Ec_ecGlobalsComplete = dtb__504; f_Ec_ecClausesTbl = dtb__505; f_Ec_ecCtorTbl = dtb__506; f_Ec_ecHasLinear = dtb__507; f_Ec_ecMetaSpans = dtb__508; f_Ec_ecUseSpans = dtb__509; f_Ec_ecWarnings = dtb__510; f_Ec_ecCounters = dtb__511; f_Ec_ecErrors = dtb__512 } -> (let pairs = (B_dContainer_dHashMap.v_toList (dtb__497).f_InstStore_instsByFamily) in (let list = (dtb__497).f_InstStore_instsList in (if ((v_bucketCount pairs) = (B_dData_dList.v_length list)) then ((v_allBucketsMatch list) pairs) else false)))
  | _ -> failwith "DT: impossible branch"
))

# 512 "Vuna/Compiler/Elab/Types.vuna"
let v_ecClasses = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__513; f_Ec_ecSols = dtb__514; f_Ec_ecDefsRev = dtb__515; f_Ec_ecDatas = dtb__516; f_Ec_ecDepthOfMeta = dtb__517; f_Ec_ecGoals = dtb__518; f_Ec_ecInsts = dtb__519; f_Ec_ecClasses = dtb__520; f_Ec_ecConstraints = dtb__521; f_Ec_ecDefTbl = dtb__522; f_Ec_ecGlobalsTbl = dtb__523; f_Ec_ecSolTbl = dtb__524; f_Ec_ecDepthTbl = dtb__525; f_Ec_ecGlobalsComplete = dtb__526; f_Ec_ecClausesTbl = dtb__527; f_Ec_ecCtorTbl = dtb__528; f_Ec_ecHasLinear = dtb__529; f_Ec_ecMetaSpans = dtb__530; f_Ec_ecUseSpans = dtb__531; f_Ec_ecWarnings = dtb__532; f_Ec_ecCounters = dtb__533; f_Ec_ecErrors = dtb__534 } -> dtb__520
  | _ -> failwith "DT: impossible branch"
))

# 516 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddGoal = (fun (mc0 : t_Ec) (mc1 : t_DtGoal) -> (match mc0 with
  | { f_Ec_ecNext = dtb__535; f_Ec_ecSols = dtb__536; f_Ec_ecDefsRev = dtb__537; f_Ec_ecDatas = dtb__538; f_Ec_ecDepthOfMeta = dtb__539; f_Ec_ecGoals = dtb__540; f_Ec_ecInsts = dtb__541; f_Ec_ecClasses = dtb__542; f_Ec_ecConstraints = dtb__543; f_Ec_ecDefTbl = dtb__544; f_Ec_ecGlobalsTbl = dtb__545; f_Ec_ecSolTbl = dtb__546; f_Ec_ecDepthTbl = dtb__547; f_Ec_ecGlobalsComplete = dtb__548; f_Ec_ecClausesTbl = dtb__549; f_Ec_ecCtorTbl = dtb__550; f_Ec_ecHasLinear = dtb__551; f_Ec_ecMetaSpans = dtb__552; f_Ec_ecUseSpans = dtb__553; f_Ec_ecWarnings = dtb__554; f_Ec_ecCounters = dtb__555; f_Ec_ecErrors = dtb__556 } -> { f_Ec_ecNext = dtb__535; f_Ec_ecSols = dtb__536; f_Ec_ecDefsRev = dtb__537; f_Ec_ecDatas = dtb__538; f_Ec_ecDepthOfMeta = dtb__539; f_Ec_ecGoals = ((B_dData_dList.v_append dtb__540) (B_dData_dList.C_List__x58__x58_ (mc1, B_dData_dList.C_List_Nil))); f_Ec_ecInsts = dtb__541; f_Ec_ecClasses = dtb__542; f_Ec_ecConstraints = dtb__543; f_Ec_ecDefTbl = dtb__544; f_Ec_ecGlobalsTbl = dtb__545; f_Ec_ecSolTbl = dtb__546; f_Ec_ecDepthTbl = dtb__547; f_Ec_ecGlobalsComplete = dtb__548; f_Ec_ecClausesTbl = dtb__549; f_Ec_ecCtorTbl = dtb__550; f_Ec_ecHasLinear = dtb__551; f_Ec_ecMetaSpans = dtb__552; f_Ec_ecUseSpans = dtb__553; f_Ec_ecWarnings = dtb__554; f_Ec_ecCounters = dtb__555; f_Ec_ecErrors = dtb__556 }
  | _ -> failwith "DT: impossible branch"
))

# 545 "Vuna/Compiler/Elab/Types.vuna"
let rec v_hasInstKey = (fun (mc0 : string) (mc1 : t_DtInst B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__557, dtb__558) -> (if ((dtb__557).f_DtInst_dtInstKey = mc0) then true else ((v_hasInstKey mc0) dtb__558))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 550 "Vuna/Compiler/Elab/Types.vuna"
let rec v_hasInstSym = (fun (mc0 : string) (mc1 : t_DtInst B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__559, dtb__560) -> (if ((dtb__559).f_DtInst_dtInstSym = mc0) then true else ((v_hasInstSym mc0) dtb__560))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 554 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddInstRaw = (fun (mc0 : t_Ec) (mc1 : t_DtInst) -> (match mc0 with
  | { f_Ec_ecNext = dtb__561; f_Ec_ecSols = dtb__562; f_Ec_ecDefsRev = dtb__563; f_Ec_ecDatas = dtb__564; f_Ec_ecDepthOfMeta = dtb__565; f_Ec_ecGoals = dtb__566; f_Ec_ecInsts = dtb__567; f_Ec_ecClasses = dtb__568; f_Ec_ecConstraints = dtb__569; f_Ec_ecDefTbl = dtb__570; f_Ec_ecGlobalsTbl = dtb__571; f_Ec_ecSolTbl = dtb__572; f_Ec_ecDepthTbl = dtb__573; f_Ec_ecGlobalsComplete = dtb__574; f_Ec_ecClausesTbl = dtb__575; f_Ec_ecCtorTbl = dtb__576; f_Ec_ecHasLinear = dtb__577; f_Ec_ecMetaSpans = dtb__578; f_Ec_ecUseSpans = dtb__579; f_Ec_ecWarnings = dtb__580; f_Ec_ecCounters = dtb__581; f_Ec_ecErrors = dtb__582 } -> { f_Ec_ecNext = dtb__561; f_Ec_ecSols = dtb__562; f_Ec_ecDefsRev = dtb__563; f_Ec_ecDatas = dtb__564; f_Ec_ecDepthOfMeta = dtb__565; f_Ec_ecGoals = dtb__566; f_Ec_ecInsts = ((v_instStorePush dtb__567) mc1); f_Ec_ecClasses = dtb__568; f_Ec_ecConstraints = dtb__569; f_Ec_ecDefTbl = dtb__570; f_Ec_ecGlobalsTbl = dtb__571; f_Ec_ecSolTbl = dtb__572; f_Ec_ecDepthTbl = dtb__573; f_Ec_ecGlobalsComplete = dtb__574; f_Ec_ecClausesTbl = dtb__575; f_Ec_ecCtorTbl = dtb__576; f_Ec_ecHasLinear = dtb__577; f_Ec_ecMetaSpans = dtb__578; f_Ec_ecUseSpans = dtb__579; f_Ec_ecWarnings = dtb__580; f_Ec_ecCounters = dtb__581; f_Ec_ecErrors = dtb__582 }
  | _ -> failwith "DT: impossible branch"
))

# 542 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddInst = (fun (ec : t_Ec) (i : t_DtInst) -> (if ((v_hasInstKey (i).f_DtInst_dtInstKey) (v_ecInsts ec)) then ec else ((v_ecAddInstRaw ec) i)))

# 580 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddClass = (fun (mc0 : t_Ec) (mc1 : t_DtClass) -> (match mc0 with
  | { f_Ec_ecNext = dtb__583; f_Ec_ecSols = dtb__584; f_Ec_ecDefsRev = dtb__585; f_Ec_ecDatas = dtb__586; f_Ec_ecDepthOfMeta = dtb__587; f_Ec_ecGoals = dtb__588; f_Ec_ecInsts = dtb__589; f_Ec_ecClasses = dtb__590; f_Ec_ecConstraints = dtb__591; f_Ec_ecDefTbl = dtb__592; f_Ec_ecGlobalsTbl = dtb__593; f_Ec_ecSolTbl = dtb__594; f_Ec_ecDepthTbl = dtb__595; f_Ec_ecGlobalsComplete = dtb__596; f_Ec_ecClausesTbl = dtb__597; f_Ec_ecCtorTbl = dtb__598; f_Ec_ecHasLinear = dtb__599; f_Ec_ecMetaSpans = dtb__600; f_Ec_ecUseSpans = dtb__601; f_Ec_ecWarnings = dtb__602; f_Ec_ecCounters = dtb__603; f_Ec_ecErrors = dtb__604 } -> { f_Ec_ecNext = dtb__583; f_Ec_ecSols = dtb__584; f_Ec_ecDefsRev = dtb__585; f_Ec_ecDatas = dtb__586; f_Ec_ecDepthOfMeta = dtb__587; f_Ec_ecGoals = dtb__588; f_Ec_ecInsts = dtb__589; f_Ec_ecClasses = ((B_dData_dList.v_append dtb__590) (B_dData_dList.C_List__x58__x58_ (mc1, B_dData_dList.C_List_Nil))); f_Ec_ecConstraints = dtb__591; f_Ec_ecDefTbl = dtb__592; f_Ec_ecGlobalsTbl = dtb__593; f_Ec_ecSolTbl = dtb__594; f_Ec_ecDepthTbl = dtb__595; f_Ec_ecGlobalsComplete = dtb__596; f_Ec_ecClausesTbl = dtb__597; f_Ec_ecCtorTbl = dtb__598; f_Ec_ecHasLinear = dtb__599; f_Ec_ecMetaSpans = dtb__600; f_Ec_ecUseSpans = dtb__601; f_Ec_ecWarnings = dtb__602; f_Ec_ecCounters = dtb__603; f_Ec_ecErrors = dtb__604 }
  | _ -> failwith "DT: impossible branch"
))

# 608 "Vuna/Compiler/Elab/Types.vuna"
let v_ecConstraints = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__605; f_Ec_ecSols = dtb__606; f_Ec_ecDefsRev = dtb__607; f_Ec_ecDatas = dtb__608; f_Ec_ecDepthOfMeta = dtb__609; f_Ec_ecGoals = dtb__610; f_Ec_ecInsts = dtb__611; f_Ec_ecClasses = dtb__612; f_Ec_ecConstraints = dtb__613; f_Ec_ecDefTbl = dtb__614; f_Ec_ecGlobalsTbl = dtb__615; f_Ec_ecSolTbl = dtb__616; f_Ec_ecDepthTbl = dtb__617; f_Ec_ecGlobalsComplete = dtb__618; f_Ec_ecClausesTbl = dtb__619; f_Ec_ecCtorTbl = dtb__620; f_Ec_ecHasLinear = dtb__621; f_Ec_ecMetaSpans = dtb__622; f_Ec_ecUseSpans = dtb__623; f_Ec_ecWarnings = dtb__624; f_Ec_ecCounters = dtb__625; f_Ec_ecErrors = dtb__626 } -> dtb__613
  | _ -> failwith "DT: impossible branch"
))

# 613 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutConstraints = (fun (mc0 : t_Ec) (mc1 : t_ConstraintStore) -> (match mc0 with
  | { f_Ec_ecNext = dtb__627; f_Ec_ecSols = dtb__628; f_Ec_ecDefsRev = dtb__629; f_Ec_ecDatas = dtb__630; f_Ec_ecDepthOfMeta = dtb__631; f_Ec_ecGoals = dtb__632; f_Ec_ecInsts = dtb__633; f_Ec_ecClasses = dtb__634; f_Ec_ecConstraints = dtb__635; f_Ec_ecDefTbl = dtb__636; f_Ec_ecGlobalsTbl = dtb__637; f_Ec_ecSolTbl = dtb__638; f_Ec_ecDepthTbl = dtb__639; f_Ec_ecGlobalsComplete = dtb__640; f_Ec_ecClausesTbl = dtb__641; f_Ec_ecCtorTbl = dtb__642; f_Ec_ecHasLinear = dtb__643; f_Ec_ecMetaSpans = dtb__644; f_Ec_ecUseSpans = dtb__645; f_Ec_ecWarnings = dtb__646; f_Ec_ecCounters = dtb__647; f_Ec_ecErrors = dtb__648 } -> { f_Ec_ecNext = dtb__627; f_Ec_ecSols = dtb__628; f_Ec_ecDefsRev = dtb__629; f_Ec_ecDatas = dtb__630; f_Ec_ecDepthOfMeta = dtb__631; f_Ec_ecGoals = dtb__632; f_Ec_ecInsts = dtb__633; f_Ec_ecClasses = dtb__634; f_Ec_ecConstraints = mc1; f_Ec_ecDefTbl = dtb__636; f_Ec_ecGlobalsTbl = dtb__637; f_Ec_ecSolTbl = dtb__638; f_Ec_ecDepthTbl = dtb__639; f_Ec_ecGlobalsComplete = dtb__640; f_Ec_ecClausesTbl = dtb__641; f_Ec_ecCtorTbl = dtb__642; f_Ec_ecHasLinear = dtb__643; f_Ec_ecMetaSpans = dtb__644; f_Ec_ecUseSpans = dtb__645; f_Ec_ecWarnings = dtb__646; f_Ec_ecCounters = dtb__647; f_Ec_ecErrors = dtb__648 }
  | _ -> failwith "DT: impossible branch"
))

# 640 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPendingList = (fun (ec : t_Ec) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__649; f_ConstraintStore_csNextId = dtb__650; f_ConstraintStore_csTried = dtb__651; f_ConstraintStore_csSolsCount = dtb__652; f_ConstraintStore_csPassNext = dtb__653; f_ConstraintStore_csPassSols = dtb__654; f_ConstraintStore_csCtorIndexComplete = dtb__655 } -> (B_dContainer_dQueue.v_toList dtb__649)
  | _ -> failwith "DT: impossible branch"
))

# 646 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPendingCount = (fun (ec : t_Ec) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__656; f_ConstraintStore_csNextId = dtb__657; f_ConstraintStore_csTried = dtb__658; f_ConstraintStore_csSolsCount = dtb__659; f_ConstraintStore_csPassNext = dtb__660; f_ConstraintStore_csPassSols = dtb__661; f_ConstraintStore_csCtorIndexComplete = dtb__662 } -> (B_dContainer_dQueue.v_size dtb__656)
  | _ -> failwith "DT: impossible branch"
))

# 652 "Vuna/Compiler/Elab/Types.vuna"
let v_ecNextConstraintId = (fun (ec : t_Ec) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__663; f_ConstraintStore_csNextId = dtb__664; f_ConstraintStore_csTried = dtb__665; f_ConstraintStore_csSolsCount = dtb__666; f_ConstraintStore_csPassNext = dtb__667; f_ConstraintStore_csPassSols = dtb__668; f_ConstraintStore_csCtorIndexComplete = dtb__669 } -> dtb__664
  | _ -> failwith "DT: impossible branch"
))

# 658 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPopPending = (fun (ec : t_Ec) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__670; f_ConstraintStore_csNextId = dtb__671; f_ConstraintStore_csTried = dtb__672; f_ConstraintStore_csSolsCount = dtb__673; f_ConstraintStore_csPassNext = dtb__674; f_ConstraintStore_csPassSols = dtb__675; f_ConstraintStore_csCtorIndexComplete = dtb__676 } -> (let nd_uscrut8 = (B_dContainer_dQueue.v_pop dtb__670) in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__677) -> (match dtb__677 with
  | { B_dData_dPair.f_Pair_first = dtb__678; B_dData_dPair.f_Pair_second = dtb__679 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__678; B_dData_dPair.f_Pair_second = ((v_ecPutConstraints ec) { f_ConstraintStore_csPending = dtb__679; f_ConstraintStore_csNextId = dtb__671; f_ConstraintStore_csTried = dtb__672; f_ConstraintStore_csSolsCount = dtb__673; f_ConstraintStore_csPassNext = dtb__674; f_ConstraintStore_csPassSols = dtb__675; f_ConstraintStore_csCtorIndexComplete = dtb__676 }) }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 669 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPushPending = (fun (ec : t_Ec) (c : t_Constraint) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__680; f_ConstraintStore_csNextId = dtb__681; f_ConstraintStore_csTried = dtb__682; f_ConstraintStore_csSolsCount = dtb__683; f_ConstraintStore_csPassNext = dtb__684; f_ConstraintStore_csPassSols = dtb__685; f_ConstraintStore_csCtorIndexComplete = dtb__686 } -> ((v_ecPutConstraints ec) { f_ConstraintStore_csPending = ((B_dContainer_dQueue.v_push c) dtb__680); f_ConstraintStore_csNextId = dtb__681; f_ConstraintStore_csTried = dtb__682; f_ConstraintStore_csSolsCount = dtb__683; f_ConstraintStore_csPassNext = dtb__684; f_ConstraintStore_csPassSols = dtb__685; f_ConstraintStore_csCtorIndexComplete = dtb__686 })
  | _ -> failwith "DT: impossible branch"
))

# 678 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutPending = (fun (ec : t_Ec) (pending2 : t_Constraint B_dData_dList.t_List) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__687; f_ConstraintStore_csNextId = dtb__688; f_ConstraintStore_csTried = dtb__689; f_ConstraintStore_csSolsCount = dtb__690; f_ConstraintStore_csPassNext = dtb__691; f_ConstraintStore_csPassSols = dtb__692; f_ConstraintStore_csCtorIndexComplete = dtb__693 } -> ((v_ecPutConstraints ec) { f_ConstraintStore_csPending = (B_dContainer_dQueue.v_fromList pending2); f_ConstraintStore_csNextId = dtb__688; f_ConstraintStore_csTried = dtb__689; f_ConstraintStore_csSolsCount = dtb__690; f_ConstraintStore_csPassNext = dtb__691; f_ConstraintStore_csPassSols = dtb__692; f_ConstraintStore_csCtorIndexComplete = dtb__693 })
  | _ -> failwith "DT: impossible branch"
))

# 687 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddConstraint = (fun (ec : t_Ec) (kind : t_ConstraintKind) (meta : int) (dom : Core_dTerm.t_Value) (span : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (depth : int) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__694; f_ConstraintStore_csNextId = dtb__695; f_ConstraintStore_csTried = dtb__696; f_ConstraintStore_csSolsCount = dtb__697; f_ConstraintStore_csPassNext = dtb__698; f_ConstraintStore_csPassSols = dtb__699; f_ConstraintStore_csCtorIndexComplete = dtb__700 } -> ((v_ecPutConstraints ec) { f_ConstraintStore_csPending = ((B_dContainer_dQueue.v_push { f_Constraint_conId = dtb__695; f_Constraint_conKind = kind; f_Constraint_conMeta = meta; f_Constraint_conDom = dom; f_Constraint_conSpan = span; f_Constraint_conDepth = depth }) dtb__694); f_ConstraintStore_csNextId = (dtb__695 + 1); f_ConstraintStore_csTried = dtb__696; f_ConstraintStore_csSolsCount = dtb__697; f_ConstraintStore_csPassNext = dtb__698; f_ConstraintStore_csPassSols = dtb__699; f_ConstraintStore_csCtorIndexComplete = dtb__700 })
  | _ -> failwith "DT: impossible branch"
))

# 697 "Vuna/Compiler/Elab/Types.vuna"
let v_ecTriedAt = (fun (ec : t_Ec) (cid : int) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__701; f_ConstraintStore_csNextId = dtb__702; f_ConstraintStore_csTried = dtb__703; f_ConstraintStore_csSolsCount = dtb__704; f_ConstraintStore_csPassNext = dtb__705; f_ConstraintStore_csPassSols = dtb__706; f_ConstraintStore_csCtorIndexComplete = dtb__707 } -> ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) cid) dtb__703)
  | _ -> failwith "DT: impossible branch"
))

# 703 "Vuna/Compiler/Elab/Types.vuna"
let v_ecRecordTried = (fun (ec : t_Ec) (cid : int) (epoch : int) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__708; f_ConstraintStore_csNextId = dtb__709; f_ConstraintStore_csTried = dtb__710; f_ConstraintStore_csSolsCount = dtb__711; f_ConstraintStore_csPassNext = dtb__712; f_ConstraintStore_csPassSols = dtb__713; f_ConstraintStore_csCtorIndexComplete = dtb__714 } -> ((v_ecPutConstraints ec) { f_ConstraintStore_csPending = dtb__708; f_ConstraintStore_csNextId = dtb__709; f_ConstraintStore_csTried = (((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) cid) epoch) dtb__710); f_ConstraintStore_csSolsCount = dtb__711; f_ConstraintStore_csPassNext = dtb__712; f_ConstraintStore_csPassSols = dtb__713; f_ConstraintStore_csCtorIndexComplete = dtb__714 })
  | _ -> failwith "DT: impossible branch"
))

# 711 "Vuna/Compiler/Elab/Types.vuna"
let v_ecEmpty = { f_Ec_ecNext = 0; f_Ec_ecSols = B_dData_dList.C_List_Nil; f_Ec_ecDefsRev = B_dData_dList.C_List_Nil; f_Ec_ecDatas = B_dData_dList.C_List_Nil; f_Ec_ecDepthOfMeta = B_dData_dList.C_List_Nil; f_Ec_ecGoals = B_dData_dList.C_List_Nil; f_Ec_ecInsts = v_instStoreEmpty; f_Ec_ecClasses = B_dData_dList.C_List_Nil; f_Ec_ecConstraints = v_csEmpty; f_Ec_ecDefTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil); f_Ec_ecGlobalsTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil); f_Ec_ecSolTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil); f_Ec_ecDepthTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil); f_Ec_ecGlobalsComplete = false; f_Ec_ecClausesTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil); f_Ec_ecCtorTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil); f_Ec_ecHasLinear = false; f_Ec_ecMetaSpans = B_dData_dList.C_List_Nil; f_Ec_ecUseSpans = B_dData_dList.C_List_Nil; f_Ec_ecWarnings = B_dData_dList.C_List_Nil; f_Ec_ecCounters = B_dData_dList.C_List_Nil; f_Ec_ecErrors = B_dData_dList.C_List_Nil }

# 739 "Vuna/Compiler/Elab/Types.vuna"
let v_ecSolTbl = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__715; f_Ec_ecSols = dtb__716; f_Ec_ecDefsRev = dtb__717; f_Ec_ecDatas = dtb__718; f_Ec_ecDepthOfMeta = dtb__719; f_Ec_ecGoals = dtb__720; f_Ec_ecInsts = dtb__721; f_Ec_ecClasses = dtb__722; f_Ec_ecConstraints = dtb__723; f_Ec_ecDefTbl = dtb__724; f_Ec_ecGlobalsTbl = dtb__725; f_Ec_ecSolTbl = dtb__726; f_Ec_ecDepthTbl = dtb__727; f_Ec_ecGlobalsComplete = dtb__728; f_Ec_ecClausesTbl = dtb__729; f_Ec_ecCtorTbl = dtb__730; f_Ec_ecHasLinear = dtb__731; f_Ec_ecMetaSpans = dtb__732; f_Ec_ecUseSpans = dtb__733; f_Ec_ecWarnings = dtb__734; f_Ec_ecCounters = dtb__735; f_Ec_ecErrors = dtb__736 } -> dtb__726
  | _ -> failwith "DT: impossible branch"
))

# 745 "Vuna/Compiler/Elab/Types.vuna"
let v_ecSolsP = (fun (ec : t_Ec) -> (((Core_dTerm.v_solsOf (v_ecSolTbl ec)) (v_ecSols ec)) (v_ecDepthTbl ec)))

# 757 "Vuna/Compiler/Elab/Types.vuna"
let v_ecSolsCountOf = (fun (ec : t_Ec) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__737; f_ConstraintStore_csNextId = dtb__738; f_ConstraintStore_csTried = dtb__739; f_ConstraintStore_csSolsCount = dtb__740; f_ConstraintStore_csPassNext = dtb__741; f_ConstraintStore_csPassSols = dtb__742; f_ConstraintStore_csCtorIndexComplete = dtb__743 } -> dtb__740
  | _ -> failwith "DT: impossible branch"
))

# 762 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutSolsCount = (fun (ec : t_Ec) (cnt : int) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__744; f_ConstraintStore_csNextId = dtb__745; f_ConstraintStore_csTried = dtb__746; f_ConstraintStore_csSolsCount = dtb__747; f_ConstraintStore_csPassNext = dtb__748; f_ConstraintStore_csPassSols = dtb__749; f_ConstraintStore_csCtorIndexComplete = dtb__750 } -> ((v_ecPutConstraints ec) { f_ConstraintStore_csPending = dtb__744; f_ConstraintStore_csNextId = dtb__745; f_ConstraintStore_csTried = dtb__746; f_ConstraintStore_csSolsCount = cnt; f_ConstraintStore_csPassNext = dtb__748; f_ConstraintStore_csPassSols = dtb__749; f_ConstraintStore_csCtorIndexComplete = dtb__750 })
  | _ -> failwith "DT: impossible branch"
))

# 768 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutSolsRaw = (fun (mc0 : t_Ec) (mc1 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | { f_Ec_ecNext = dtb__751; f_Ec_ecSols = dtb__752; f_Ec_ecDefsRev = dtb__753; f_Ec_ecDatas = dtb__754; f_Ec_ecDepthOfMeta = dtb__755; f_Ec_ecGoals = dtb__756; f_Ec_ecInsts = dtb__757; f_Ec_ecClasses = dtb__758; f_Ec_ecConstraints = dtb__759; f_Ec_ecDefTbl = dtb__760; f_Ec_ecGlobalsTbl = dtb__761; f_Ec_ecSolTbl = dtb__762; f_Ec_ecDepthTbl = dtb__763; f_Ec_ecGlobalsComplete = dtb__764; f_Ec_ecClausesTbl = dtb__765; f_Ec_ecCtorTbl = dtb__766; f_Ec_ecHasLinear = dtb__767; f_Ec_ecMetaSpans = dtb__768; f_Ec_ecUseSpans = dtb__769; f_Ec_ecWarnings = dtb__770; f_Ec_ecCounters = dtb__771; f_Ec_ecErrors = dtb__772 } -> { f_Ec_ecNext = dtb__751; f_Ec_ecSols = mc1; f_Ec_ecDefsRev = dtb__753; f_Ec_ecDatas = dtb__754; f_Ec_ecDepthOfMeta = dtb__755; f_Ec_ecGoals = dtb__756; f_Ec_ecInsts = dtb__757; f_Ec_ecClasses = dtb__758; f_Ec_ecConstraints = dtb__759; f_Ec_ecDefTbl = dtb__760; f_Ec_ecGlobalsTbl = dtb__761; f_Ec_ecSolTbl = mc2; f_Ec_ecDepthTbl = dtb__763; f_Ec_ecGlobalsComplete = dtb__764; f_Ec_ecClausesTbl = dtb__765; f_Ec_ecCtorTbl = dtb__766; f_Ec_ecHasLinear = dtb__767; f_Ec_ecMetaSpans = dtb__768; f_Ec_ecUseSpans = dtb__769; f_Ec_ecWarnings = dtb__770; f_Ec_ecCounters = dtb__771; f_Ec_ecErrors = dtb__772 }
  | _ -> failwith "DT: impossible branch"
))

# 795 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutPassMarker = (fun (ec : t_Ec) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__773; f_ConstraintStore_csNextId = dtb__774; f_ConstraintStore_csTried = dtb__775; f_ConstraintStore_csSolsCount = dtb__776; f_ConstraintStore_csPassNext = dtb__777; f_ConstraintStore_csPassSols = dtb__778; f_ConstraintStore_csCtorIndexComplete = dtb__779 } -> ((v_ecPutConstraints ec) { f_ConstraintStore_csPending = dtb__773; f_ConstraintStore_csNextId = dtb__774; f_ConstraintStore_csTried = dtb__775; f_ConstraintStore_csSolsCount = dtb__776; f_ConstraintStore_csPassNext = dtb__774; f_ConstraintStore_csPassSols = dtb__776; f_ConstraintStore_csCtorIndexComplete = dtb__779 })
  | _ -> failwith "DT: impossible branch"
))

# 802 "Vuna/Compiler/Elab/Types.vuna"
let v_ecCtorIndexComplete = (fun (ec : t_Ec) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__780; f_ConstraintStore_csNextId = dtb__781; f_ConstraintStore_csTried = dtb__782; f_ConstraintStore_csSolsCount = dtb__783; f_ConstraintStore_csPassNext = dtb__784; f_ConstraintStore_csPassSols = dtb__785; f_ConstraintStore_csCtorIndexComplete = dtb__786 } -> dtb__786
  | _ -> failwith "DT: impossible branch"
))

# 807 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutCtorIndexComplete = (fun (ec : t_Ec) (ok : bool) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__787; f_ConstraintStore_csNextId = dtb__788; f_ConstraintStore_csTried = dtb__789; f_ConstraintStore_csSolsCount = dtb__790; f_ConstraintStore_csPassNext = dtb__791; f_ConstraintStore_csPassSols = dtb__792; f_ConstraintStore_csCtorIndexComplete = dtb__793 } -> ((v_ecPutConstraints ec) { f_ConstraintStore_csPending = dtb__787; f_ConstraintStore_csNextId = dtb__788; f_ConstraintStore_csTried = dtb__789; f_ConstraintStore_csSolsCount = dtb__790; f_ConstraintStore_csPassNext = dtb__791; f_ConstraintStore_csPassSols = dtb__792; f_ConstraintStore_csCtorIndexComplete = ok })
  | _ -> failwith "DT: impossible branch"
))

# 814 "Vuna/Compiler/Elab/Types.vuna"
let v_ecDictPassIdle = (fun (ec : t_Ec) -> (match (v_ecConstraints ec) with
  | { f_ConstraintStore_csPending = dtb__794; f_ConstraintStore_csNextId = dtb__795; f_ConstraintStore_csTried = dtb__796; f_ConstraintStore_csSolsCount = dtb__797; f_ConstraintStore_csPassNext = dtb__798; f_ConstraintStore_csPassSols = dtb__799; f_ConstraintStore_csCtorIndexComplete = dtb__800 } -> (if (dtb__798 = dtb__795) then (dtb__799 = dtb__797) else false)
  | _ -> failwith "DT: impossible branch"
))

# 825 "Vuna/Compiler/Elab/Types.vuna"
let rec v_prefixUntilId = (fun (mc0 : int) (mc1 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__801, dtb__802) -> (match dtb__801 with
  | { B_dData_dPair.f_Pair_first = dtb__803; B_dData_dPair.f_Pair_second = dtb__804 } -> (if (dtb__803 = mc0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__803; B_dData_dPair.f_Pair_second = dtb__804 }, ((v_prefixUntilId mc0) dtb__802))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 821 "Vuna/Compiler/Elab/Types.vuna"
let v_solsDelta = (fun (mc0 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__805, dtb__806) -> (match dtb__805 with
  | { B_dData_dPair.f_Pair_first = dtb__807; B_dData_dPair.f_Pair_second = dtb__808 } -> ((v_prefixUntilId dtb__807) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 748 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutSols = (fun (ec : t_Ec) (sols2 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let delta = ((v_solsDelta (v_ecSols ec)) sols2) in (let soltbl2 = ((((B_dContainer_dHashMap.v_insertAll B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) delta) (v_ecSolTbl ec)) in (let ec2 = (((v_ecPutSolsRaw ec) sols2) soltbl2) in ((v_ecPutSolsCount ec2) ((v_ecSolsCountOf ec2) + (B_dData_dList.v_length delta)))))))

# 831 "Vuna/Compiler/Elab/Types.vuna"
let rec v_memDataNameIn = (fun (mc0 : string) (mc1 : t_DtData B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__809, dtb__810) -> (if ((v_dtDataName dtb__809) = mc0) then true else ((v_memDataNameIn mc0) dtb__810))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 838 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddDef = (fun (mc0 : t_Ec) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (match mc0 with
  | { f_Ec_ecNext = dtb__811; f_Ec_ecSols = dtb__812; f_Ec_ecDefsRev = dtb__813; f_Ec_ecDatas = dtb__814; f_Ec_ecDepthOfMeta = dtb__815; f_Ec_ecGoals = dtb__816; f_Ec_ecInsts = dtb__817; f_Ec_ecClasses = dtb__818; f_Ec_ecConstraints = dtb__819; f_Ec_ecDefTbl = dtb__820; f_Ec_ecGlobalsTbl = dtb__821; f_Ec_ecSolTbl = dtb__822; f_Ec_ecDepthTbl = dtb__823; f_Ec_ecGlobalsComplete = dtb__824; f_Ec_ecClausesTbl = dtb__825; f_Ec_ecCtorTbl = dtb__826; f_Ec_ecHasLinear = dtb__827; f_Ec_ecMetaSpans = dtb__828; f_Ec_ecUseSpans = dtb__829; f_Ec_ecWarnings = dtb__830; f_Ec_ecCounters = dtb__831; f_Ec_ecErrors = dtb__832 } -> (let delta = (if ((v_memDataNameIn (B_dData_dPair.v_firstOf mc1)) dtb__814) then dtb__820 else (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (B_dData_dPair.v_firstOf mc1)) (B_dData_dPair.v_secondOf mc1)) dtb__820)) in { f_Ec_ecNext = dtb__811; f_Ec_ecSols = dtb__812; f_Ec_ecDefsRev = (B_dData_dList.C_List__x58__x58_ (mc1, dtb__813)); f_Ec_ecDatas = dtb__814; f_Ec_ecDepthOfMeta = dtb__815; f_Ec_ecGoals = dtb__816; f_Ec_ecInsts = dtb__817; f_Ec_ecClasses = dtb__818; f_Ec_ecConstraints = dtb__819; f_Ec_ecDefTbl = delta; f_Ec_ecGlobalsTbl = dtb__821; f_Ec_ecSolTbl = dtb__822; f_Ec_ecDepthTbl = dtb__823; f_Ec_ecGlobalsComplete = dtb__824; f_Ec_ecClausesTbl = dtb__825; f_Ec_ecCtorTbl = dtb__826; f_Ec_ecHasLinear = dtb__827; f_Ec_ecMetaSpans = dtb__828; f_Ec_ecUseSpans = dtb__829; f_Ec_ecWarnings = dtb__830; f_Ec_ecCounters = dtb__831; f_Ec_ecErrors = dtb__832 })
  | _ -> failwith "DT: impossible branch"
))

# 870 "Vuna/Compiler/Elab/Types.vuna"
let v_ecRemoveDefTbl = (fun (mc0 : string) (mc1 : t_Ec) -> (match mc1 with
  | { f_Ec_ecNext = dtb__833; f_Ec_ecSols = dtb__834; f_Ec_ecDefsRev = dtb__835; f_Ec_ecDatas = dtb__836; f_Ec_ecDepthOfMeta = dtb__837; f_Ec_ecGoals = dtb__838; f_Ec_ecInsts = dtb__839; f_Ec_ecClasses = dtb__840; f_Ec_ecConstraints = dtb__841; f_Ec_ecDefTbl = dtb__842; f_Ec_ecGlobalsTbl = dtb__843; f_Ec_ecSolTbl = dtb__844; f_Ec_ecDepthTbl = dtb__845; f_Ec_ecGlobalsComplete = dtb__846; f_Ec_ecClausesTbl = dtb__847; f_Ec_ecCtorTbl = dtb__848; f_Ec_ecHasLinear = dtb__849; f_Ec_ecMetaSpans = dtb__850; f_Ec_ecUseSpans = dtb__851; f_Ec_ecWarnings = dtb__852; f_Ec_ecCounters = dtb__853; f_Ec_ecErrors = dtb__854 } -> { f_Ec_ecNext = dtb__833; f_Ec_ecSols = dtb__834; f_Ec_ecDefsRev = dtb__835; f_Ec_ecDatas = dtb__836; f_Ec_ecDepthOfMeta = dtb__837; f_Ec_ecGoals = dtb__838; f_Ec_ecInsts = dtb__839; f_Ec_ecClasses = dtb__840; f_Ec_ecConstraints = dtb__841; f_Ec_ecDefTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_filter (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (B_dData_dBool.v_not ((B_dData_dPair.v_firstOf p) = mc0)))) (B_dContainer_dHashMap.v_toList dtb__842))); f_Ec_ecGlobalsTbl = dtb__843; f_Ec_ecSolTbl = dtb__844; f_Ec_ecDepthTbl = dtb__845; f_Ec_ecGlobalsComplete = dtb__846; f_Ec_ecClausesTbl = dtb__847; f_Ec_ecCtorTbl = dtb__848; f_Ec_ecHasLinear = dtb__849; f_Ec_ecMetaSpans = dtb__850; f_Ec_ecUseSpans = dtb__851; f_Ec_ecWarnings = dtb__852; f_Ec_ecCounters = dtb__853; f_Ec_ecErrors = dtb__854 }
  | _ -> failwith "DT: impossible branch"
))

# 926 "Vuna/Compiler/Elab/Types.vuna"
let v_dataCtorPairs = (fun (d : t_DtData) -> ((B_dData_dList.v_map (fun (c : t_DtCtor) -> { B_dData_dPair.f_Pair_first = (v_dtCtorName c); B_dData_dPair.f_Pair_second = c })) (v_dtDataCtors d)))

# 896 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddData = (fun (mc0 : t_Ec) (mc1 : t_DtData) -> (match mc0 with
  | { f_Ec_ecNext = dtb__855; f_Ec_ecSols = dtb__856; f_Ec_ecDefsRev = dtb__857; f_Ec_ecDatas = dtb__858; f_Ec_ecDepthOfMeta = dtb__859; f_Ec_ecGoals = dtb__860; f_Ec_ecInsts = dtb__861; f_Ec_ecClasses = dtb__862; f_Ec_ecConstraints = dtb__863; f_Ec_ecDefTbl = dtb__864; f_Ec_ecGlobalsTbl = dtb__865; f_Ec_ecSolTbl = dtb__866; f_Ec_ecDepthTbl = dtb__867; f_Ec_ecGlobalsComplete = dtb__868; f_Ec_ecClausesTbl = dtb__869; f_Ec_ecCtorTbl = dtb__870; f_Ec_ecHasLinear = dtb__871; f_Ec_ecMetaSpans = dtb__872; f_Ec_ecUseSpans = dtb__873; f_Ec_ecWarnings = dtb__874; f_Ec_ecCounters = dtb__875; f_Ec_ecErrors = dtb__876 } -> { f_Ec_ecNext = dtb__855; f_Ec_ecSols = dtb__856; f_Ec_ecDefsRev = dtb__857; f_Ec_ecDatas = ((B_dData_dList.v_append dtb__858) (B_dData_dList.C_List__x58__x58_ (mc1, B_dData_dList.C_List_Nil))); f_Ec_ecDepthOfMeta = dtb__859; f_Ec_ecGoals = dtb__860; f_Ec_ecInsts = dtb__861; f_Ec_ecClasses = dtb__862; f_Ec_ecConstraints = dtb__863; f_Ec_ecDefTbl = dtb__864; f_Ec_ecGlobalsTbl = dtb__865; f_Ec_ecSolTbl = dtb__866; f_Ec_ecDepthTbl = dtb__867; f_Ec_ecGlobalsComplete = dtb__868; f_Ec_ecClausesTbl = dtb__869; f_Ec_ecCtorTbl = ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (v_dataCtorPairs mc1)) dtb__870); f_Ec_ecHasLinear = (if (v_dtDataLinear mc1) then true else dtb__871); f_Ec_ecMetaSpans = dtb__872; f_Ec_ecUseSpans = dtb__873; f_Ec_ecWarnings = dtb__874; f_Ec_ecCounters = dtb__875; f_Ec_ecErrors = dtb__876 }
  | _ -> failwith "DT: impossible branch"
))

# 923 "Vuna/Compiler/Elab/Types.vuna"
let v_ctorTblOfDatas = (fun (datas : t_DtData B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_concatMap v_dataCtorPairs) datas)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 929 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutCtorTbl = (fun (mc0 : t_Ec) (mc1 : (string, t_DtCtor) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | { f_Ec_ecNext = dtb__877; f_Ec_ecSols = dtb__878; f_Ec_ecDefsRev = dtb__879; f_Ec_ecDatas = dtb__880; f_Ec_ecDepthOfMeta = dtb__881; f_Ec_ecGoals = dtb__882; f_Ec_ecInsts = dtb__883; f_Ec_ecClasses = dtb__884; f_Ec_ecConstraints = dtb__885; f_Ec_ecDefTbl = dtb__886; f_Ec_ecGlobalsTbl = dtb__887; f_Ec_ecSolTbl = dtb__888; f_Ec_ecDepthTbl = dtb__889; f_Ec_ecGlobalsComplete = dtb__890; f_Ec_ecClausesTbl = dtb__891; f_Ec_ecCtorTbl = dtb__892; f_Ec_ecHasLinear = dtb__893; f_Ec_ecMetaSpans = dtb__894; f_Ec_ecUseSpans = dtb__895; f_Ec_ecWarnings = dtb__896; f_Ec_ecCounters = dtb__897; f_Ec_ecErrors = dtb__898 } -> ((v_ecPutCtorIndexComplete { f_Ec_ecNext = dtb__877; f_Ec_ecSols = dtb__878; f_Ec_ecDefsRev = dtb__879; f_Ec_ecDatas = dtb__880; f_Ec_ecDepthOfMeta = dtb__881; f_Ec_ecGoals = dtb__882; f_Ec_ecInsts = dtb__883; f_Ec_ecClasses = dtb__884; f_Ec_ecConstraints = dtb__885; f_Ec_ecDefTbl = dtb__886; f_Ec_ecGlobalsTbl = dtb__887; f_Ec_ecSolTbl = dtb__888; f_Ec_ecDepthTbl = dtb__889; f_Ec_ecGlobalsComplete = dtb__890; f_Ec_ecClausesTbl = dtb__891; f_Ec_ecCtorTbl = mc1; f_Ec_ecHasLinear = dtb__893; f_Ec_ecMetaSpans = dtb__894; f_Ec_ecUseSpans = dtb__895; f_Ec_ecWarnings = dtb__896; f_Ec_ecCounters = dtb__897; f_Ec_ecErrors = dtb__898 }) true)
  | _ -> failwith "DT: impossible branch"
))

# 937 "Vuna/Compiler/Elab/Types.vuna"
let v_ecHasLinear = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__899; f_Ec_ecSols = dtb__900; f_Ec_ecDefsRev = dtb__901; f_Ec_ecDatas = dtb__902; f_Ec_ecDepthOfMeta = dtb__903; f_Ec_ecGoals = dtb__904; f_Ec_ecInsts = dtb__905; f_Ec_ecClasses = dtb__906; f_Ec_ecConstraints = dtb__907; f_Ec_ecDefTbl = dtb__908; f_Ec_ecGlobalsTbl = dtb__909; f_Ec_ecSolTbl = dtb__910; f_Ec_ecDepthTbl = dtb__911; f_Ec_ecGlobalsComplete = dtb__912; f_Ec_ecClausesTbl = dtb__913; f_Ec_ecCtorTbl = dtb__914; f_Ec_ecHasLinear = dtb__915; f_Ec_ecMetaSpans = dtb__916; f_Ec_ecUseSpans = dtb__917; f_Ec_ecWarnings = dtb__918; f_Ec_ecCounters = dtb__919; f_Ec_ecErrors = dtb__920 } -> dtb__915
  | _ -> failwith "DT: impossible branch"
))

# 943 "Vuna/Compiler/Elab/Types.vuna"
let v_ecMetaSpans = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__921; f_Ec_ecSols = dtb__922; f_Ec_ecDefsRev = dtb__923; f_Ec_ecDatas = dtb__924; f_Ec_ecDepthOfMeta = dtb__925; f_Ec_ecGoals = dtb__926; f_Ec_ecInsts = dtb__927; f_Ec_ecClasses = dtb__928; f_Ec_ecConstraints = dtb__929; f_Ec_ecDefTbl = dtb__930; f_Ec_ecGlobalsTbl = dtb__931; f_Ec_ecSolTbl = dtb__932; f_Ec_ecDepthTbl = dtb__933; f_Ec_ecGlobalsComplete = dtb__934; f_Ec_ecClausesTbl = dtb__935; f_Ec_ecCtorTbl = dtb__936; f_Ec_ecHasLinear = dtb__937; f_Ec_ecMetaSpans = dtb__938; f_Ec_ecUseSpans = dtb__939; f_Ec_ecWarnings = dtb__940; f_Ec_ecCounters = dtb__941; f_Ec_ecErrors = dtb__942 } -> dtb__938
  | _ -> failwith "DT: impossible branch"
))

# 948 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutMetaSpans = (fun (mc0 : t_Ec) (mc1 : (int, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | { f_Ec_ecNext = dtb__943; f_Ec_ecSols = dtb__944; f_Ec_ecDefsRev = dtb__945; f_Ec_ecDatas = dtb__946; f_Ec_ecDepthOfMeta = dtb__947; f_Ec_ecGoals = dtb__948; f_Ec_ecInsts = dtb__949; f_Ec_ecClasses = dtb__950; f_Ec_ecConstraints = dtb__951; f_Ec_ecDefTbl = dtb__952; f_Ec_ecGlobalsTbl = dtb__953; f_Ec_ecSolTbl = dtb__954; f_Ec_ecDepthTbl = dtb__955; f_Ec_ecGlobalsComplete = dtb__956; f_Ec_ecClausesTbl = dtb__957; f_Ec_ecCtorTbl = dtb__958; f_Ec_ecHasLinear = dtb__959; f_Ec_ecMetaSpans = dtb__960; f_Ec_ecUseSpans = dtb__961; f_Ec_ecWarnings = dtb__962; f_Ec_ecCounters = dtb__963; f_Ec_ecErrors = dtb__964 } -> { f_Ec_ecNext = dtb__943; f_Ec_ecSols = dtb__944; f_Ec_ecDefsRev = dtb__945; f_Ec_ecDatas = dtb__946; f_Ec_ecDepthOfMeta = dtb__947; f_Ec_ecGoals = dtb__948; f_Ec_ecInsts = dtb__949; f_Ec_ecClasses = dtb__950; f_Ec_ecConstraints = dtb__951; f_Ec_ecDefTbl = dtb__952; f_Ec_ecGlobalsTbl = dtb__953; f_Ec_ecSolTbl = dtb__954; f_Ec_ecDepthTbl = dtb__955; f_Ec_ecGlobalsComplete = dtb__956; f_Ec_ecClausesTbl = dtb__957; f_Ec_ecCtorTbl = dtb__958; f_Ec_ecHasLinear = dtb__959; f_Ec_ecMetaSpans = mc1; f_Ec_ecUseSpans = dtb__961; f_Ec_ecWarnings = dtb__962; f_Ec_ecCounters = dtb__963; f_Ec_ecErrors = dtb__964 }
  | _ -> failwith "DT: impossible branch"
))

# 975 "Vuna/Compiler/Elab/Types.vuna"
let v_ecUseSpans = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__965; f_Ec_ecSols = dtb__966; f_Ec_ecDefsRev = dtb__967; f_Ec_ecDatas = dtb__968; f_Ec_ecDepthOfMeta = dtb__969; f_Ec_ecGoals = dtb__970; f_Ec_ecInsts = dtb__971; f_Ec_ecClasses = dtb__972; f_Ec_ecConstraints = dtb__973; f_Ec_ecDefTbl = dtb__974; f_Ec_ecGlobalsTbl = dtb__975; f_Ec_ecSolTbl = dtb__976; f_Ec_ecDepthTbl = dtb__977; f_Ec_ecGlobalsComplete = dtb__978; f_Ec_ecClausesTbl = dtb__979; f_Ec_ecCtorTbl = dtb__980; f_Ec_ecHasLinear = dtb__981; f_Ec_ecMetaSpans = dtb__982; f_Ec_ecUseSpans = dtb__983; f_Ec_ecWarnings = dtb__984; f_Ec_ecCounters = dtb__985; f_Ec_ecErrors = dtb__986 } -> dtb__983
  | _ -> failwith "DT: impossible branch"
))

# 980 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutUseSpans = (fun (mc0 : t_Ec) (mc1 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | { f_Ec_ecNext = dtb__987; f_Ec_ecSols = dtb__988; f_Ec_ecDefsRev = dtb__989; f_Ec_ecDatas = dtb__990; f_Ec_ecDepthOfMeta = dtb__991; f_Ec_ecGoals = dtb__992; f_Ec_ecInsts = dtb__993; f_Ec_ecClasses = dtb__994; f_Ec_ecConstraints = dtb__995; f_Ec_ecDefTbl = dtb__996; f_Ec_ecGlobalsTbl = dtb__997; f_Ec_ecSolTbl = dtb__998; f_Ec_ecDepthTbl = dtb__999; f_Ec_ecGlobalsComplete = dtb__1000; f_Ec_ecClausesTbl = dtb__1001; f_Ec_ecCtorTbl = dtb__1002; f_Ec_ecHasLinear = dtb__1003; f_Ec_ecMetaSpans = dtb__1004; f_Ec_ecUseSpans = dtb__1005; f_Ec_ecWarnings = dtb__1006; f_Ec_ecCounters = dtb__1007; f_Ec_ecErrors = dtb__1008 } -> { f_Ec_ecNext = dtb__987; f_Ec_ecSols = dtb__988; f_Ec_ecDefsRev = dtb__989; f_Ec_ecDatas = dtb__990; f_Ec_ecDepthOfMeta = dtb__991; f_Ec_ecGoals = dtb__992; f_Ec_ecInsts = dtb__993; f_Ec_ecClasses = dtb__994; f_Ec_ecConstraints = dtb__995; f_Ec_ecDefTbl = dtb__996; f_Ec_ecGlobalsTbl = dtb__997; f_Ec_ecSolTbl = dtb__998; f_Ec_ecDepthTbl = dtb__999; f_Ec_ecGlobalsComplete = dtb__1000; f_Ec_ecClausesTbl = dtb__1001; f_Ec_ecCtorTbl = dtb__1002; f_Ec_ecHasLinear = dtb__1003; f_Ec_ecMetaSpans = dtb__1004; f_Ec_ecUseSpans = mc1; f_Ec_ecWarnings = dtb__1006; f_Ec_ecCounters = dtb__1007; f_Ec_ecErrors = dtb__1008 }
  | _ -> failwith "DT: impossible branch"
))

# 1008 "Vuna/Compiler/Elab/Types.vuna"
let v_ecWarnings = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__1009; f_Ec_ecSols = dtb__1010; f_Ec_ecDefsRev = dtb__1011; f_Ec_ecDatas = dtb__1012; f_Ec_ecDepthOfMeta = dtb__1013; f_Ec_ecGoals = dtb__1014; f_Ec_ecInsts = dtb__1015; f_Ec_ecClasses = dtb__1016; f_Ec_ecConstraints = dtb__1017; f_Ec_ecDefTbl = dtb__1018; f_Ec_ecGlobalsTbl = dtb__1019; f_Ec_ecSolTbl = dtb__1020; f_Ec_ecDepthTbl = dtb__1021; f_Ec_ecGlobalsComplete = dtb__1022; f_Ec_ecClausesTbl = dtb__1023; f_Ec_ecCtorTbl = dtb__1024; f_Ec_ecHasLinear = dtb__1025; f_Ec_ecMetaSpans = dtb__1026; f_Ec_ecUseSpans = dtb__1027; f_Ec_ecWarnings = dtb__1028; f_Ec_ecCounters = dtb__1029; f_Ec_ecErrors = dtb__1030 } -> dtb__1028
  | _ -> failwith "DT: impossible branch"
))

# 1013 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutWarnings = (fun (mc0 : t_Ec) (mc1 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (match mc0 with
  | { f_Ec_ecNext = dtb__1031; f_Ec_ecSols = dtb__1032; f_Ec_ecDefsRev = dtb__1033; f_Ec_ecDatas = dtb__1034; f_Ec_ecDepthOfMeta = dtb__1035; f_Ec_ecGoals = dtb__1036; f_Ec_ecInsts = dtb__1037; f_Ec_ecClasses = dtb__1038; f_Ec_ecConstraints = dtb__1039; f_Ec_ecDefTbl = dtb__1040; f_Ec_ecGlobalsTbl = dtb__1041; f_Ec_ecSolTbl = dtb__1042; f_Ec_ecDepthTbl = dtb__1043; f_Ec_ecGlobalsComplete = dtb__1044; f_Ec_ecClausesTbl = dtb__1045; f_Ec_ecCtorTbl = dtb__1046; f_Ec_ecHasLinear = dtb__1047; f_Ec_ecMetaSpans = dtb__1048; f_Ec_ecUseSpans = dtb__1049; f_Ec_ecWarnings = dtb__1050; f_Ec_ecCounters = dtb__1051; f_Ec_ecErrors = dtb__1052 } -> { f_Ec_ecNext = dtb__1031; f_Ec_ecSols = dtb__1032; f_Ec_ecDefsRev = dtb__1033; f_Ec_ecDatas = dtb__1034; f_Ec_ecDepthOfMeta = dtb__1035; f_Ec_ecGoals = dtb__1036; f_Ec_ecInsts = dtb__1037; f_Ec_ecClasses = dtb__1038; f_Ec_ecConstraints = dtb__1039; f_Ec_ecDefTbl = dtb__1040; f_Ec_ecGlobalsTbl = dtb__1041; f_Ec_ecSolTbl = dtb__1042; f_Ec_ecDepthTbl = dtb__1043; f_Ec_ecGlobalsComplete = dtb__1044; f_Ec_ecClausesTbl = dtb__1045; f_Ec_ecCtorTbl = dtb__1046; f_Ec_ecHasLinear = dtb__1047; f_Ec_ecMetaSpans = dtb__1048; f_Ec_ecUseSpans = dtb__1049; f_Ec_ecWarnings = mc1; f_Ec_ecCounters = dtb__1051; f_Ec_ecErrors = dtb__1052 }
  | _ -> failwith "DT: impossible branch"
))

# 1040 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddWarning = (fun (ec : t_Ec) (d : Base_dDiag.t_Diagnostic) -> ((v_ecPutWarnings ec) ((B_dData_dList.v_append (v_ecWarnings ec)) (B_dData_dList.C_List__x58__x58_ (d, B_dData_dList.C_List_Nil)))))

# 1044 "Vuna/Compiler/Elab/Types.vuna"
let v_ecCounters = (fun (e : t_Ec) -> (e).f_Ec_ecCounters)

# 1047 "Vuna/Compiler/Elab/Types.vuna"
let v_ecBump = (fun (mc0 : t_Ec) (mc1 : string) -> (match mc0 with
  | { f_Ec_ecNext = dtb__1053; f_Ec_ecSols = dtb__1054; f_Ec_ecDefsRev = dtb__1055; f_Ec_ecDatas = dtb__1056; f_Ec_ecDepthOfMeta = dtb__1057; f_Ec_ecGoals = dtb__1058; f_Ec_ecInsts = dtb__1059; f_Ec_ecClasses = dtb__1060; f_Ec_ecConstraints = dtb__1061; f_Ec_ecDefTbl = dtb__1062; f_Ec_ecGlobalsTbl = dtb__1063; f_Ec_ecSolTbl = dtb__1064; f_Ec_ecDepthTbl = dtb__1065; f_Ec_ecGlobalsComplete = dtb__1066; f_Ec_ecClausesTbl = dtb__1067; f_Ec_ecCtorTbl = dtb__1068; f_Ec_ecHasLinear = dtb__1069; f_Ec_ecMetaSpans = dtb__1070; f_Ec_ecUseSpans = dtb__1071; f_Ec_ecWarnings = dtb__1072; f_Ec_ecCounters = dtb__1073; f_Ec_ecErrors = dtb__1074 } -> { f_Ec_ecNext = dtb__1053; f_Ec_ecSols = dtb__1054; f_Ec_ecDefsRev = dtb__1055; f_Ec_ecDatas = dtb__1056; f_Ec_ecDepthOfMeta = dtb__1057; f_Ec_ecGoals = dtb__1058; f_Ec_ecInsts = dtb__1059; f_Ec_ecClasses = dtb__1060; f_Ec_ecConstraints = dtb__1061; f_Ec_ecDefTbl = dtb__1062; f_Ec_ecGlobalsTbl = dtb__1063; f_Ec_ecSolTbl = dtb__1064; f_Ec_ecDepthTbl = dtb__1065; f_Ec_ecGlobalsComplete = dtb__1066; f_Ec_ecClausesTbl = dtb__1067; f_Ec_ecCtorTbl = dtb__1068; f_Ec_ecHasLinear = dtb__1069; f_Ec_ecMetaSpans = dtb__1070; f_Ec_ecUseSpans = dtb__1071; f_Ec_ecWarnings = dtb__1072; f_Ec_ecCounters = (B_dData_dList.C_List__x58__x58_ (mc1, dtb__1073)); f_Ec_ecErrors = dtb__1074 }
  | _ -> failwith "DT: impossible branch"
))

# 1074 "Vuna/Compiler/Elab/Types.vuna"
let v_ecErrors = (fun (mc0 : t_Ec) -> (match mc0 with
  | { f_Ec_ecNext = dtb__1075; f_Ec_ecSols = dtb__1076; f_Ec_ecDefsRev = dtb__1077; f_Ec_ecDatas = dtb__1078; f_Ec_ecDepthOfMeta = dtb__1079; f_Ec_ecGoals = dtb__1080; f_Ec_ecInsts = dtb__1081; f_Ec_ecClasses = dtb__1082; f_Ec_ecConstraints = dtb__1083; f_Ec_ecDefTbl = dtb__1084; f_Ec_ecGlobalsTbl = dtb__1085; f_Ec_ecSolTbl = dtb__1086; f_Ec_ecDepthTbl = dtb__1087; f_Ec_ecGlobalsComplete = dtb__1088; f_Ec_ecClausesTbl = dtb__1089; f_Ec_ecCtorTbl = dtb__1090; f_Ec_ecHasLinear = dtb__1091; f_Ec_ecMetaSpans = dtb__1092; f_Ec_ecUseSpans = dtb__1093; f_Ec_ecWarnings = dtb__1094; f_Ec_ecCounters = dtb__1095; f_Ec_ecErrors = dtb__1096 } -> dtb__1096
  | _ -> failwith "DT: impossible branch"
))

# 1078 "Vuna/Compiler/Elab/Types.vuna"
let v_ecAddError = (fun (mc0 : t_Ec) (mc1 : Base_dDiag.t_Diagnostic) -> (match mc0 with
  | { f_Ec_ecNext = dtb__1097; f_Ec_ecSols = dtb__1098; f_Ec_ecDefsRev = dtb__1099; f_Ec_ecDatas = dtb__1100; f_Ec_ecDepthOfMeta = dtb__1101; f_Ec_ecGoals = dtb__1102; f_Ec_ecInsts = dtb__1103; f_Ec_ecClasses = dtb__1104; f_Ec_ecConstraints = dtb__1105; f_Ec_ecDefTbl = dtb__1106; f_Ec_ecGlobalsTbl = dtb__1107; f_Ec_ecSolTbl = dtb__1108; f_Ec_ecDepthTbl = dtb__1109; f_Ec_ecGlobalsComplete = dtb__1110; f_Ec_ecClausesTbl = dtb__1111; f_Ec_ecCtorTbl = dtb__1112; f_Ec_ecHasLinear = dtb__1113; f_Ec_ecMetaSpans = dtb__1114; f_Ec_ecUseSpans = dtb__1115; f_Ec_ecWarnings = dtb__1116; f_Ec_ecCounters = dtb__1117; f_Ec_ecErrors = dtb__1118 } -> { f_Ec_ecNext = dtb__1097; f_Ec_ecSols = dtb__1098; f_Ec_ecDefsRev = dtb__1099; f_Ec_ecDatas = dtb__1100; f_Ec_ecDepthOfMeta = dtb__1101; f_Ec_ecGoals = dtb__1102; f_Ec_ecInsts = dtb__1103; f_Ec_ecClasses = dtb__1104; f_Ec_ecConstraints = dtb__1105; f_Ec_ecDefTbl = dtb__1106; f_Ec_ecGlobalsTbl = dtb__1107; f_Ec_ecSolTbl = dtb__1108; f_Ec_ecDepthTbl = dtb__1109; f_Ec_ecGlobalsComplete = dtb__1110; f_Ec_ecClausesTbl = dtb__1111; f_Ec_ecCtorTbl = dtb__1112; f_Ec_ecHasLinear = dtb__1113; f_Ec_ecMetaSpans = dtb__1114; f_Ec_ecUseSpans = dtb__1115; f_Ec_ecWarnings = dtb__1116; f_Ec_ecCounters = dtb__1117; f_Ec_ecErrors = (B_dData_dList.C_List__x58__x58_ (mc1, dtb__1118)) }
  | _ -> failwith "DT: impossible branch"
))

# 1104 "Vuna/Compiler/Elab/Types.vuna"
let rec v_datasHaveLinear = (fun (mc0 : t_DtData B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1119, dtb__1120) -> (if (v_dtDataLinear dtb__1119) then true else (v_datasHaveLinear dtb__1120))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1128 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxDepth = (fun (ctx : t_Ctx) -> (ctx).f_Ctx_ctxDepthF)

# 1131 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxBind = (fun (mc0 : string) (mc1 : Core_dTerm.t_Term) (mc2 : t_Ctx) -> (match mc2 with
  | { f_Ctx_ctxItems = dtb__1121; f_Ctx_ctxEnvF = dtb__1122; f_Ctx_ctxRefVals = dtb__1123; f_Ctx_ctxDepthF = dtb__1124; f_Ctx_ctxEnvRF = dtb__1125 } -> (let v = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (mc0, dtb__1124, B_dData_dList.C_List_Nil)))) in { f_Ctx_ctxItems = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }, dtb__1121)); f_Ctx_ctxEnvF = (B_dData_dList.C_List__x58__x58_ (v, dtb__1122)); f_Ctx_ctxRefVals = dtb__1123; f_Ctx_ctxDepthF = (dtb__1124 + 1); f_Ctx_ctxEnvRF = (B_dData_dList.C_List__x58__x58_ (v, dtb__1125)) })
  | _ -> failwith "DT: impossible branch"
))

# 1138 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxBindValue = (fun (mc0 : string) (mc1 : Core_dTerm.t_Value) (mc2 : t_Ctx) -> (match mc2 with
  | { f_Ctx_ctxItems = dtb__1126; f_Ctx_ctxEnvF = dtb__1127; f_Ctx_ctxRefVals = dtb__1128; f_Ctx_ctxDepthF = dtb__1129; f_Ctx_ctxEnvRF = dtb__1130 } -> (let v = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (mc0, dtb__1129, B_dData_dList.C_List_Nil)))) in { f_Ctx_ctxItems = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = ((Core_dEval.v_quote dtb__1129) mc1) }, dtb__1126)); f_Ctx_ctxEnvF = (B_dData_dList.C_List__x58__x58_ (v, dtb__1127)); f_Ctx_ctxRefVals = dtb__1128; f_Ctx_ctxDepthF = (dtb__1129 + 1); f_Ctx_ctxEnvRF = (B_dData_dList.C_List__x58__x58_ (v, dtb__1130)) })
  | _ -> failwith "DT: impossible branch"
))

# 1151 "Vuna/Compiler/Elab/Types.vuna"
let rec v_ctxLookupAt = (fun (mc0 : string) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1131, dtb__1132) -> (match dtb__1131 with
  | { B_dData_dPair.f_Pair_first = dtb__1133; B_dData_dPair.f_Pair_second = dtb__1134 } -> (if (dtb__1133 = mc0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = dtb__1134 })) else (((v_ctxLookupAt mc0) dtb__1132) (mc2 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1156 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxLookup = (fun (name : string) (ctx : t_Ctx) -> (((v_ctxLookupAt name) (ctx).f_Ctx_ctxItems) 0))

# 1165 "Vuna/Compiler/Elab/Types.vuna"
let rec v_ctxEnvAt = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1135, dtb__1136) -> (match dtb__1135 with
  | { B_dData_dPair.f_Pair_first = dtb__1137; B_dData_dPair.f_Pair_second = dtb__1138 } -> (B_dData_dList.C_List__x58__x58_ ((Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__1137, ((mc2 - mc1) - 1), B_dData_dList.C_List_Nil)))), (((v_ctxEnvAt dtb__1136) (mc1 + 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1172 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxEnv = (fun (mc0 : t_Ctx) -> (match mc0 with
  | { f_Ctx_ctxItems = dtb__1139; f_Ctx_ctxEnvF = dtb__1140; f_Ctx_ctxRefVals = dtb__1141; f_Ctx_ctxDepthF = dtb__1142; f_Ctx_ctxEnvRF = dtb__1143 } -> dtb__1140
  | _ -> failwith "DT: impossible branch"
))

# 1176 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxEnvRefined = (fun (ctx : t_Ctx) -> (ctx).f_Ctx_ctxEnvRF)

# 1204 "Vuna/Compiler/Elab/Types.vuna"
let rec v_refineLookup = (fun (mc0 : int) (mc1 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1144, dtb__1145) -> (match dtb__1144 with
  | { B_dData_dPair.f_Pair_first = dtb__1146; B_dData_dPair.f_Pair_second = dtb__1147 } -> (if (dtb__1146 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__1147)) else ((v_refineLookup mc0) dtb__1145))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1181 "Vuna/Compiler/Elab/Types.vuna"
let rec v_refineValue = (fun (mc0 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : Core_dTerm.t_Value) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> (if (mc1 <= 0) then mc2 else (match mc2 with
  | Core_dTerm.C_Value_VNeutral (dtb__1148) -> (match dtb__1148 with
  | Core_dTerm.C_Neutral_NVar (dtb__1149, dtb__1150, dtb__1151) -> (let sp2 = ((B_dData_dList.v_map ((v_refineValue mc0) (mc1 - 1))) dtb__1151) in (match ((v_refineLookup dtb__1150) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1152) -> ((Core_dEval.v_applySpine (((v_refineValue mc0) (mc1 - 1)) dtb__1152)) sp2)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__1149, dtb__1150, sp2))))
  | _ -> failwith "DT: impossible branch"
))
  | Core_dTerm.C_Neutral_NGlobal (dtb__1153, dtb__1154) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb__1153, ((B_dData_dList.v_map ((v_refineValue mc0) (mc1 - 1))) dtb__1154)))))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VCon (dtb__1155, dtb__1156) -> (Core_dTerm.C_Value_VCon (dtb__1155, ((B_dData_dList.v_map ((v_refineValue mc0) (mc1 - 1))) dtb__1156)))
  | Core_dTerm.C_Value_VApp (dtb__1157, dtb__1158) -> (Core_dTerm.C_Value_VApp ((((v_refineValue mc0) (mc1 - 1)) dtb__1157), (((v_refineValue mc0) (mc1 - 1)) dtb__1158)))
  | Core_dTerm.C_Value_VCase (dtb__1159, dtb__1160) -> (Core_dTerm.C_Value_VCase ((((v_refineValue mc0) (mc1 - 1)) dtb__1159), dtb__1160))
  | Core_dTerm.C_Value_VIf (dtb__1161, dtb__1162, dtb__1163) -> (Core_dTerm.C_Value_VIf ((((v_refineValue mc0) (mc1 - 1)) dtb__1161), (((v_refineValue mc0) (mc1 - 1)) dtb__1162), (((v_refineValue mc0) (mc1 - 1)) dtb__1163)))
  | Core_dTerm.C_Value_VMeta (dtb__1164, dtb__1165) -> (Core_dTerm.C_Value_VMeta (dtb__1164, ((B_dData_dList.v_map ((v_refineValue mc0) (mc1 - 1))) dtb__1165)))
  | _ -> mc2
))
))

# 1160 "Vuna/Compiler/Elab/Types.vuna"
let v_refinedEnv = (fun (mc0 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> ((B_dData_dList.v_map ((v_refineValue mc0) Core_dTerm.v_defaultFuel)) mc1)
))

# 1145 "Vuna/Compiler/Elab/Types.vuna"
let v_ctxRefine = (fun (mc0 : t_Ctx) (mc1 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | { f_Ctx_ctxItems = dtb__1166; f_Ctx_ctxEnvF = dtb__1167; f_Ctx_ctxRefVals = dtb__1168; f_Ctx_ctxDepthF = dtb__1169; f_Ctx_ctxEnvRF = dtb__1170 } -> (let refs2 = ((B_dData_dList.v_append dtb__1168) mc1) in { f_Ctx_ctxItems = dtb__1166; f_Ctx_ctxEnvF = dtb__1167; f_Ctx_ctxRefVals = refs2; f_Ctx_ctxDepthF = dtb__1169; f_Ctx_ctxEnvRF = ((v_refinedEnv refs2) dtb__1167) })
  | _ -> failwith "DT: impossible branch"
))

# 1209 "Vuna/Compiler/Elab/Types.vuna"
let v_evalCtx = (fun (ctx : t_Ctx) (ty : Core_dTerm.t_Term) -> ((Core_dEval.v_eval (v_ctxEnvRefined ctx)) ty))

# 1214 "Vuna/Compiler/Elab/Types.vuna"
let v_varTypeValue = (fun (ctx : t_Ctx) (idx : int) (ty : Core_dTerm.t_Term) -> ((Core_dEval.v_eval (v_ctxEnvRefined ctx)) (((Core_dTerm.v_shift 0) (idx + 1)) ty)))

# 1217 "Vuna/Compiler/Elab/Types.vuna"
let v_emptyCtx = { f_Ctx_ctxItems = B_dData_dList.C_List_Nil; f_Ctx_ctxEnvF = B_dData_dList.C_List_Nil; f_Ctx_ctxRefVals = B_dData_dList.C_List_Nil; f_Ctx_ctxDepthF = 0; f_Ctx_ctxEnvRF = B_dData_dList.C_List_Nil }

# 1223 "Vuna/Compiler/Elab/Types.vuna"
let v_errAt = (fun (sp : Base_dSource.t_Span) (msg : string) -> ((Base_dDiag.v_rawAt sp) msg))

# 1227 "Vuna/Compiler/Elab/Types.vuna"
let v_newMeta = (fun (mc0 : t_Ctx) (mc1 : t_Ec) -> (match mc1 with
  | { f_Ec_ecNext = dtb__1171; f_Ec_ecSols = dtb__1172; f_Ec_ecDefsRev = dtb__1173; f_Ec_ecDatas = dtb__1174; f_Ec_ecDepthOfMeta = dtb__1175; f_Ec_ecGoals = dtb__1176; f_Ec_ecInsts = dtb__1177; f_Ec_ecClasses = dtb__1178; f_Ec_ecConstraints = dtb__1179; f_Ec_ecDefTbl = dtb__1180; f_Ec_ecGlobalsTbl = dtb__1181; f_Ec_ecSolTbl = dtb__1182; f_Ec_ecDepthTbl = dtb__1183; f_Ec_ecGlobalsComplete = dtb__1184; f_Ec_ecClausesTbl = dtb__1185; f_Ec_ecCtorTbl = dtb__1186; f_Ec_ecHasLinear = dtb__1187; f_Ec_ecMetaSpans = dtb__1188; f_Ec_ecUseSpans = dtb__1189; f_Ec_ecWarnings = dtb__1190; f_Ec_ecCounters = dtb__1191; f_Ec_ecErrors = dtb__1192 } -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TMeta (dtb__1171)); B_dData_dPair.f_Pair_second = { f_Ec_ecNext = (dtb__1171 + 1); f_Ec_ecSols = dtb__1172; f_Ec_ecDefsRev = dtb__1173; f_Ec_ecDatas = dtb__1174; f_Ec_ecDepthOfMeta = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__1171; B_dData_dPair.f_Pair_second = (v_ctxDepth mc0) }, dtb__1175)); f_Ec_ecGoals = dtb__1176; f_Ec_ecInsts = dtb__1177; f_Ec_ecClasses = dtb__1178; f_Ec_ecConstraints = dtb__1179; f_Ec_ecDefTbl = dtb__1180; f_Ec_ecGlobalsTbl = dtb__1181; f_Ec_ecSolTbl = dtb__1182; f_Ec_ecDepthTbl = (((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb__1171) (v_ctxDepth mc0)) dtb__1183); f_Ec_ecGlobalsComplete = dtb__1184; f_Ec_ecClausesTbl = dtb__1185; f_Ec_ecCtorTbl = dtb__1186; f_Ec_ecHasLinear = dtb__1187; f_Ec_ecMetaSpans = dtb__1188; f_Ec_ecUseSpans = dtb__1189; f_Ec_ecWarnings = dtb__1190; f_Ec_ecCounters = dtb__1191; f_Ec_ecErrors = dtb__1192 } }
  | _ -> failwith "DT: impossible branch"
))

# 1233 "Vuna/Compiler/Elab/Types.vuna"
let v_forceVal = (fun (ec : t_Ec) (v : Core_dTerm.t_Value) -> ((((Core_dEval.v_force (v_ecDefTbl ec)) (v_ecSolsP ec)) Core_dTerm.v_defaultFuel) v))

# 1253 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgDatas = (fun (mc0 : t_DtProgram) -> (match mc0 with
  | { f_DtProgram_dtProgDatas = dtb__1193; f_DtProgram_dtProgDefs = dtb__1194; f_DtProgram_dtProgGoals = dtb__1195; f_DtProgram_dtProgSols = dtb__1196; f_DtProgram_dtProgGlobals = dtb__1197; f_DtProgram_dtProgInsts = dtb__1198; f_DtProgram_dtProgClasses = dtb__1199; f_DtProgram_dtProgNext = dtb__1200; f_DtProgram_dtProgDepths = dtb__1201; f_DtProgram_dtProgWarnings = dtb__1202 } -> dtb__1193
  | _ -> failwith "DT: impossible branch"
))

# 1256 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgDefs = (fun (mc0 : t_DtProgram) -> (match mc0 with
  | { f_DtProgram_dtProgDatas = dtb__1203; f_DtProgram_dtProgDefs = dtb__1204; f_DtProgram_dtProgGoals = dtb__1205; f_DtProgram_dtProgSols = dtb__1206; f_DtProgram_dtProgGlobals = dtb__1207; f_DtProgram_dtProgInsts = dtb__1208; f_DtProgram_dtProgClasses = dtb__1209; f_DtProgram_dtProgNext = dtb__1210; f_DtProgram_dtProgDepths = dtb__1211; f_DtProgram_dtProgWarnings = dtb__1212 } -> dtb__1204
  | _ -> failwith "DT: impossible branch"
))

# 1259 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgGoals = (fun (mc0 : t_DtProgram) -> (match mc0 with
  | { f_DtProgram_dtProgDatas = dtb__1213; f_DtProgram_dtProgDefs = dtb__1214; f_DtProgram_dtProgGoals = dtb__1215; f_DtProgram_dtProgSols = dtb__1216; f_DtProgram_dtProgGlobals = dtb__1217; f_DtProgram_dtProgInsts = dtb__1218; f_DtProgram_dtProgClasses = dtb__1219; f_DtProgram_dtProgNext = dtb__1220; f_DtProgram_dtProgDepths = dtb__1221; f_DtProgram_dtProgWarnings = dtb__1222 } -> dtb__1215
  | _ -> failwith "DT: impossible branch"
))

# 1262 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgSols = (fun (mc0 : t_DtProgram) -> (match mc0 with
  | { f_DtProgram_dtProgDatas = dtb__1223; f_DtProgram_dtProgDefs = dtb__1224; f_DtProgram_dtProgGoals = dtb__1225; f_DtProgram_dtProgSols = dtb__1226; f_DtProgram_dtProgGlobals = dtb__1227; f_DtProgram_dtProgInsts = dtb__1228; f_DtProgram_dtProgClasses = dtb__1229; f_DtProgram_dtProgNext = dtb__1230; f_DtProgram_dtProgDepths = dtb__1231; f_DtProgram_dtProgWarnings = dtb__1232 } -> dtb__1226
  | _ -> failwith "DT: impossible branch"
))

# 1265 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgGlobals = (fun (mc0 : t_DtProgram) -> (match mc0 with
  | { f_DtProgram_dtProgDatas = dtb__1233; f_DtProgram_dtProgDefs = dtb__1234; f_DtProgram_dtProgGoals = dtb__1235; f_DtProgram_dtProgSols = dtb__1236; f_DtProgram_dtProgGlobals = dtb__1237; f_DtProgram_dtProgInsts = dtb__1238; f_DtProgram_dtProgClasses = dtb__1239; f_DtProgram_dtProgNext = dtb__1240; f_DtProgram_dtProgDepths = dtb__1241; f_DtProgram_dtProgWarnings = dtb__1242 } -> dtb__1237
  | _ -> failwith "DT: impossible branch"
))

# 1268 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgInsts = (fun (mc0 : t_DtProgram) -> (match mc0 with
  | { f_DtProgram_dtProgDatas = dtb__1243; f_DtProgram_dtProgDefs = dtb__1244; f_DtProgram_dtProgGoals = dtb__1245; f_DtProgram_dtProgSols = dtb__1246; f_DtProgram_dtProgGlobals = dtb__1247; f_DtProgram_dtProgInsts = dtb__1248; f_DtProgram_dtProgClasses = dtb__1249; f_DtProgram_dtProgNext = dtb__1250; f_DtProgram_dtProgDepths = dtb__1251; f_DtProgram_dtProgWarnings = dtb__1252 } -> dtb__1248
  | _ -> failwith "DT: impossible branch"
))

# 1271 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgClasses = (fun (mc0 : t_DtProgram) -> (match mc0 with
  | { f_DtProgram_dtProgDatas = dtb__1253; f_DtProgram_dtProgDefs = dtb__1254; f_DtProgram_dtProgGoals = dtb__1255; f_DtProgram_dtProgSols = dtb__1256; f_DtProgram_dtProgGlobals = dtb__1257; f_DtProgram_dtProgInsts = dtb__1258; f_DtProgram_dtProgClasses = dtb__1259; f_DtProgram_dtProgNext = dtb__1260; f_DtProgram_dtProgDepths = dtb__1261; f_DtProgram_dtProgWarnings = dtb__1262 } -> dtb__1259
  | _ -> failwith "DT: impossible branch"
))

# 1275 "Vuna/Compiler/Elab/Types.vuna"
let v_dtProgWarnings = (fun (mc0 : t_DtProgram) -> (match mc0 with
  | { f_DtProgram_dtProgDatas = dtb__1263; f_DtProgram_dtProgDefs = dtb__1264; f_DtProgram_dtProgGoals = dtb__1265; f_DtProgram_dtProgSols = dtb__1266; f_DtProgram_dtProgGlobals = dtb__1267; f_DtProgram_dtProgInsts = dtb__1268; f_DtProgram_dtProgClasses = dtb__1269; f_DtProgram_dtProgNext = dtb__1270; f_DtProgram_dtProgDepths = dtb__1271; f_DtProgram_dtProgWarnings = dtb__1272 } -> dtb__1272
  | _ -> failwith "DT: impossible branch"
))

# 1280 "Vuna/Compiler/Elab/Types.vuna"
let v_solsToTbl = (fun (sols : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) sols) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil)))

# 1283 "Vuna/Compiler/Elab/Types.vuna"
let v_ecPutDefTbl = (fun (mc0 : t_Ec) (mc1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | { f_Ec_ecNext = dtb__1273; f_Ec_ecSols = dtb__1274; f_Ec_ecDefsRev = dtb__1275; f_Ec_ecDatas = dtb__1276; f_Ec_ecDepthOfMeta = dtb__1277; f_Ec_ecGoals = dtb__1278; f_Ec_ecInsts = dtb__1279; f_Ec_ecClasses = dtb__1280; f_Ec_ecConstraints = dtb__1281; f_Ec_ecDefTbl = dtb__1282; f_Ec_ecGlobalsTbl = dtb__1283; f_Ec_ecSolTbl = dtb__1284; f_Ec_ecDepthTbl = dtb__1285; f_Ec_ecGlobalsComplete = dtb__1286; f_Ec_ecClausesTbl = dtb__1287; f_Ec_ecCtorTbl = dtb__1288; f_Ec_ecHasLinear = dtb__1289; f_Ec_ecMetaSpans = dtb__1290; f_Ec_ecUseSpans = dtb__1291; f_Ec_ecWarnings = dtb__1292; f_Ec_ecCounters = dtb__1293; f_Ec_ecErrors = dtb__1294 } -> { f_Ec_ecNext = dtb__1273; f_Ec_ecSols = dtb__1274; f_Ec_ecDefsRev = dtb__1275; f_Ec_ecDatas = dtb__1276; f_Ec_ecDepthOfMeta = dtb__1277; f_Ec_ecGoals = dtb__1278; f_Ec_ecInsts = dtb__1279; f_Ec_ecClasses = dtb__1280; f_Ec_ecConstraints = dtb__1281; f_Ec_ecDefTbl = mc1; f_Ec_ecGlobalsTbl = dtb__1283; f_Ec_ecSolTbl = dtb__1284; f_Ec_ecDepthTbl = dtb__1285; f_Ec_ecGlobalsComplete = dtb__1286; f_Ec_ecClausesTbl = dtb__1287; f_Ec_ecCtorTbl = dtb__1288; f_Ec_ecHasLinear = dtb__1289; f_Ec_ecMetaSpans = dtb__1290; f_Ec_ecUseSpans = dtb__1291; f_Ec_ecWarnings = dtb__1292; f_Ec_ecCounters = dtb__1293; f_Ec_ecErrors = dtb__1294 }
  | _ -> failwith "DT: impossible branch"
))
