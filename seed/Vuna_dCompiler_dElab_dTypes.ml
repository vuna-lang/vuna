open Vuna_runtime
type t_Vuna_dCompiler_dElab_dTypes_dDtDef = C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef of (string) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe) | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom of (string) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe) | C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern of (string) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe)
and t_Vuna_dCompiler_dElab_dTypes_dDtCtor = C_Vuna_dCompiler_dElab_dTypes_dDtCtor_DtCtor of (string) * (string) * ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dElab_dTypes_dDtData = C_Vuna_dCompiler_dElab_dTypes_dDtData_DtData of (string) * ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (string Base_dList.t_Base_dList_dList) * (bool)
and t_Vuna_dCompiler_dElab_dTypes_dDtGoal = C_Vuna_dCompiler_dElab_dTypes_dDtGoal_DtGoal of (int) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) * ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (string)
and t_Vuna_dCompiler_dElab_dTypes_dDtClass = C_Vuna_dCompiler_dElab_dTypes_dDtClass_DtClass of (string) * (string Base_dList.t_Base_dList_dList) * ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dTypes_dDtInst = C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst of (string) * ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dElab_dTypes_dInstStore = C_Vuna_dCompiler_dElab_dTypes_dInstStore_InstStore of (t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dList.t_Base_dList_dList) * ((string, t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap)
and t_Vuna_dCompiler_dElab_dTypes_dConstraintKind = C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkDict | C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkRow
and t_Vuna_dCompiler_dElab_dTypes_dConstraint = C_Vuna_dCompiler_dElab_dTypes_dConstraint_Constraint of (int) * (t_Vuna_dCompiler_dElab_dTypes_dConstraintKind) * (int) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe) * (int)
and t_Vuna_dCompiler_dElab_dTypes_dConstraintStore = C_Vuna_dCompiler_dElab_dTypes_dConstraintStore_ConstraintStore of (t_Vuna_dCompiler_dElab_dTypes_dConstraint Base_dList.t_Base_dList_dList) * (int) * ((int, int) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dTypes_dEc = C_Vuna_dCompiler_dElab_dTypes_dEc_Ec of (int) * ((int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList) * ((int, int) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtGoal Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dInstStore) * (t_Vuna_dCompiler_dElab_dTypes_dDtClass Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dConstraintStore) * ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((int, int) Base_dHashMap.t_Base_dHashMap_dHashMap) * (bool) * ((string, (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dList.t_Base_dList_dList, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((string, t_Vuna_dCompiler_dElab_dTypes_dDtCtor) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dHashMap.t_Base_dHashMap_dHashMap) * (bool)
and t_Vuna_dCompiler_dElab_dTypes_dCtx = C_Vuna_dCompiler_dElab_dTypes_dCtx_Ctx of ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * ((int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dTypes_dDtProgram = C_Vuna_dCompiler_dElab_dTypes_dDtProgram_DtProgram of (t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtGoal Base_dList.t_Base_dList_dList) * ((int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtClass Base_dList.t_Base_dList_dList) * (int) * ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((int, int) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList)

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
  | C_Vuna_dCompiler_dElab_dTypes_dDtCtor_DtCtor (dtb__59, dtb__60, dtb__61, dtb__62) -> dtb__59
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtCtor_DtCtor (dtb__63, dtb__64, dtb__65, dtb__66) -> dtb__64
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtCtor_DtCtor (dtb__67, dtb__68, dtb__69, dtb__70) -> dtb__69
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtCtorType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtCtor_DtCtor (dtb__71, dtb__72, dtb__73, dtb__74) -> dtb__74
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtData_DtData (dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80) -> dtb__75
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtData_DtData (dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86) -> dtb__83
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataKind = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtData_DtData (dtb__87, dtb__88, dtb__89, dtb__90, dtb__91, dtb__92) -> dtb__90
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataViaClasses = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtData_DtData (dtb__93, dtb__94, dtb__95, dtb__96, dtb__97, dtb__98) -> dtb__97
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtData_DtData (dtb__99, dtb__100, dtb__101, dtb__102, dtb__103, dtb__104) -> dtb__104
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtClassName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtClass_DtClass (dtb__105, dtb__106, dtb__107, dtb__108) -> dtb__105
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtInstName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__109, dtb__110, dtb__111, dtb__112) -> dtb__109
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__113) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__113, Base_dList.C_Base_dList_dList_Nil))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__114, dtb__115, dtb__116) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__117) -> (match dtb__117 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__118, dtb__119) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__118, ((Base_dList.v_Base_dList_dappend dtb__119) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__115, dtb__116)), Base_dList.C_Base_dList_dList_Nil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp dtb__114))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dElab_dTypes_dinstFamilyOf = (fun i -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__120) -> (match dtb__120 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__121, dtb__122) -> dtb__121
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp (match i with
  | C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__123, dtb__124, dtb__125, dtb__126) -> dtb__126
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTypes_dinstStoreEmpty = (C_Vuna_dCompiler_dElab_dTypes_dInstStore_InstStore (Base_dList.C_Base_dList_dList_Nil, ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dElab_dTypes_dinstStorePush = (fun store i -> ((fun fam -> ((fun bucket -> (C_Vuna_dCompiler_dElab_dTypes_dInstStore_InstStore (((Base_dList.v_Base_dList_dappend (match store with
  | C_Vuna_dCompiler_dElab_dTypes_dInstStore_InstStore (dtb__127, dtb__128) -> dtb__127
  | _ -> failwith "DT: impossible branch"
)) (Base_dList.C_Base_dList_dList_Cons (i, Base_dList.C_Base_dList_dList_Nil))), ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) fam) ((Base_dList.v_Base_dList_dappend bucket) (Base_dList.C_Base_dList_dList_Cons (i, Base_dList.C_Base_dList_dList_Nil)))) (match store with
  | C_Vuna_dCompiler_dElab_dTypes_dInstStore_InstStore (dtb__129, dtb__130) -> dtb__130
  | _ -> failwith "DT: impossible branch"
))))) (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) fam) (match store with
  | C_Vuna_dCompiler_dElab_dTypes_dInstStore_InstStore (dtb__131, dtb__132) -> dtb__132
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__133) -> dtb__133
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dElab_dTypes_dinstFamilyOf i)))

let rec v_Vuna_dCompiler_dElab_dTypes_dinstStoreOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__134, dtb__135) -> ((v_Vuna_dCompiler_dElab_dTypes_dinstStorePush (v_Vuna_dCompiler_dElab_dTypes_dinstStoreOf dtb__135)) dtb__134)
  | Base_dList.C_Base_dList_dList_Nil -> v_Vuna_dCompiler_dElab_dTypes_dinstStoreEmpty
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dinstStoreFamily = (fun store fam -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) fam) (match store with
  | C_Vuna_dCompiler_dElab_dTypes_dInstStore_InstStore (dtb__136, dtb__137) -> dtb__137
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__138) -> dtb__138
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dcsEmpty = (C_Vuna_dCompiler_dElab_dTypes_dConstraintStore_ConstraintStore (Base_dList.C_Base_dList_dList_Nil, 0, Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dElab_dTypes_decPutNext = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__139, dtb__140, dtb__141, dtb__142, dtb__143, dtb__144, dtb__145, dtb__146, dtb__147, dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (mc1, dtb__140, dtb__141, dtb__142, dtb__143, dtb__144, dtb__145, dtb__146, dtb__147, dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutClausesTbl = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__157, dtb__158, dtb__159, dtb__160, dtb__161, dtb__162, dtb__163, dtb__164, dtb__165, dtb__166, dtb__167, dtb__168, dtb__169, dtb__170, dtb__171, dtb__172, dtb__173, dtb__174) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__157, dtb__158, dtb__159, dtb__160, dtb__161, dtb__162, dtb__163, dtb__164, dtb__165, dtb__166, dtb__167, dtb__168, dtb__169, dtb__170, mc1, dtb__172, dtb__173, dtb__174))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decNext = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__175, dtb__176, dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182, dtb__183, dtb__184, dtb__185, dtb__186, dtb__187, dtb__188, dtb__189, dtb__190, dtb__191, dtb__192) -> dtb__175
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decSols = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__193, dtb__194, dtb__195, dtb__196, dtb__197, dtb__198, dtb__199, dtb__200, dtb__201, dtb__202, dtb__203, dtb__204, dtb__205, dtb__206, dtb__207, dtb__208, dtb__209, dtb__210) -> dtb__194
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDefs = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__211, dtb__212, dtb__213, dtb__214, dtb__215, dtb__216, dtb__217, dtb__218, dtb__219, dtb__220, dtb__221, dtb__222, dtb__223, dtb__224, dtb__225, dtb__226, dtb__227, dtb__228) -> (Base_dList.v_Base_dList_dreverse dtb__213)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDefTbl = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__229, dtb__230, dtb__231, dtb__232, dtb__233, dtb__234, dtb__235, dtb__236, dtb__237, dtb__238, dtb__239, dtb__240, dtb__241, dtb__242, dtb__243, dtb__244, dtb__245, dtb__246) -> dtb__238
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__247, dtb__248, dtb__249, dtb__250, dtb__251, dtb__252, dtb__253, dtb__254, dtb__255, dtb__256, dtb__257, dtb__258, dtb__259, dtb__260, dtb__261, dtb__262, dtb__263, dtb__264) -> dtb__257
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__265, dtb__266, dtb__267, dtb__268, dtb__269, dtb__270, dtb__271, dtb__272, dtb__273, dtb__274, dtb__275, dtb__276, dtb__277, dtb__278, dtb__279, dtb__280, dtb__281, dtb__282) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__265, dtb__266, dtb__267, dtb__268, dtb__269, dtb__270, dtb__271, dtb__272, dtb__273, dtb__274, mc1, dtb__276, dtb__277, dtb__278, dtb__279, dtb__280, dtb__281, dtb__282))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDatas = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__283, dtb__284, dtb__285, dtb__286, dtb__287, dtb__288, dtb__289, dtb__290, dtb__291, dtb__292, dtb__293, dtb__294, dtb__295, dtb__296, dtb__297, dtb__298, dtb__299, dtb__300) -> dtb__286
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDepthTbl = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__301, dtb__302, dtb__303, dtb__304, dtb__305, dtb__306, dtb__307, dtb__308, dtb__309, dtb__310, dtb__311, dtb__312, dtb__313, dtb__314, dtb__315, dtb__316, dtb__317, dtb__318) -> dtb__313
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__319, dtb__320, dtb__321, dtb__322, dtb__323, dtb__324, dtb__325, dtb__326, dtb__327, dtb__328, dtb__329, dtb__330, dtb__331, dtb__332, dtb__333, dtb__334, dtb__335, dtb__336) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__319, dtb__320, dtb__321, dtb__322, dtb__323, dtb__324, dtb__325, dtb__326, dtb__327, dtb__328, dtb__329, dtb__330, dtb__331, mc1, dtb__333, dtb__334, dtb__335, dtb__336))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decGoals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__337, dtb__338, dtb__339, dtb__340, dtb__341, dtb__342, dtb__343, dtb__344, dtb__345, dtb__346, dtb__347, dtb__348, dtb__349, dtb__350, dtb__351, dtb__352, dtb__353, dtb__354) -> dtb__342
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decInsts = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__355, dtb__356, dtb__357, dtb__358, dtb__359, dtb__360, dtb__361, dtb__362, dtb__363, dtb__364, dtb__365, dtb__366, dtb__367, dtb__368, dtb__369, dtb__370, dtb__371, dtb__372) -> (match dtb__361 with
  | C_Vuna_dCompiler_dElab_dTypes_dInstStore_InstStore (dtb__373, dtb__374) -> dtb__373
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decInstsFamily = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__375, dtb__376, dtb__377, dtb__378, dtb__379, dtb__380, dtb__381, dtb__382, dtb__383, dtb__384, dtb__385, dtb__386, dtb__387, dtb__388, dtb__389, dtb__390, dtb__391, dtb__392) -> ((v_Vuna_dCompiler_dElab_dTypes_dinstStoreFamily dtb__381) mc1)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dbucketCount = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__393, dtb__394) -> ((Base_dList.v_Base_dList_dlength (Base_dPair.v_Base_dPair_dsecondOf dtb__393)) + (v_Vuna_dCompiler_dElab_dTypes_dbucketCount dtb__394))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dinstNamesEq = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__395, dtb__396) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__397, dtb__398) -> (if (dtb__395 = dtb__397) then ((v_Vuna_dCompiler_dElab_dTypes_dinstNamesEq dtb__396) dtb__398) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__399, dtb__400) -> false
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dallBucketsMatch = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__401, dtb__402) -> (match dtb__401 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__403, dtb__404) -> (if ((v_Vuna_dCompiler_dElab_dTypes_dinstNamesEq ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtInstName) dtb__404)) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtInstName) ((Base_dList.v_Base_dList_dfilter (fun i -> ((v_Vuna_dCompiler_dElab_dTypes_dinstFamilyOf i) = dtb__403))) mc0))) then ((v_Vuna_dCompiler_dElab_dTypes_dallBucketsMatch mc0) dtb__402) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decInstsAudit = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__405, dtb__406, dtb__407, dtb__408, dtb__409, dtb__410, dtb__411, dtb__412, dtb__413, dtb__414, dtb__415, dtb__416, dtb__417, dtb__418, dtb__419, dtb__420, dtb__421, dtb__422) -> ((fun pairs -> ((fun list -> (if ((v_Vuna_dCompiler_dElab_dTypes_dbucketCount pairs) = (Base_dList.v_Base_dList_dlength list)) then ((v_Vuna_dCompiler_dElab_dTypes_dallBucketsMatch list) pairs) else false)) (match dtb__411 with
  | C_Vuna_dCompiler_dElab_dTypes_dInstStore_InstStore (dtb__423, dtb__424) -> dtb__423
  | _ -> failwith "DT: impossible branch"
))) ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dString.v_Eq_uString) (match dtb__411 with
  | C_Vuna_dCompiler_dElab_dTypes_dInstStore_InstStore (dtb__425, dtb__426) -> dtb__426
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decClasses = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__427, dtb__428, dtb__429, dtb__430, dtb__431, dtb__432, dtb__433, dtb__434, dtb__435, dtb__436, dtb__437, dtb__438, dtb__439, dtb__440, dtb__441, dtb__442, dtb__443, dtb__444) -> dtb__434
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decAddGoal = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__445, dtb__446, dtb__447, dtb__448, dtb__449, dtb__450, dtb__451, dtb__452, dtb__453, dtb__454, dtb__455, dtb__456, dtb__457, dtb__458, dtb__459, dtb__460, dtb__461, dtb__462) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__445, dtb__446, dtb__447, dtb__448, dtb__449, ((Base_dList.v_Base_dList_dappend dtb__450) (Base_dList.C_Base_dList_dList_Cons (mc1, Base_dList.C_Base_dList_dList_Nil))), dtb__451, dtb__452, dtb__453, dtb__454, dtb__455, dtb__456, dtb__457, dtb__458, dtb__459, dtb__460, dtb__461, dtb__462))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dhasInstName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__463, dtb__464) -> (if ((v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__463) = mc0) then true else ((v_Vuna_dCompiler_dElab_dTypes_dhasInstName mc0) dtb__464))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decAddInstRaw = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__465, dtb__466, dtb__467, dtb__468, dtb__469, dtb__470, dtb__471, dtb__472, dtb__473, dtb__474, dtb__475, dtb__476, dtb__477, dtb__478, dtb__479, dtb__480, dtb__481, dtb__482) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__465, dtb__466, dtb__467, dtb__468, dtb__469, dtb__470, ((v_Vuna_dCompiler_dElab_dTypes_dinstStorePush dtb__471) mc1), dtb__472, dtb__473, dtb__474, dtb__475, dtb__476, dtb__477, dtb__478, dtb__479, dtb__480, dtb__481, dtb__482))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decAddInst = (fun ec i -> (if ((v_Vuna_dCompiler_dElab_dTypes_dhasInstName (v_Vuna_dCompiler_dElab_dTypes_ddtInstName i)) (v_Vuna_dCompiler_dElab_dTypes_decInsts ec)) then ec else ((v_Vuna_dCompiler_dElab_dTypes_decAddInstRaw ec) i)))

let v_Vuna_dCompiler_dElab_dTypes_decAddClass = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__483, dtb__484, dtb__485, dtb__486, dtb__487, dtb__488, dtb__489, dtb__490, dtb__491, dtb__492, dtb__493, dtb__494, dtb__495, dtb__496, dtb__497, dtb__498, dtb__499, dtb__500) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__483, dtb__484, dtb__485, dtb__486, dtb__487, dtb__488, dtb__489, ((Base_dList.v_Base_dList_dappend dtb__490) (Base_dList.C_Base_dList_dList_Cons (mc1, Base_dList.C_Base_dList_dList_Nil))), dtb__491, dtb__492, dtb__493, dtb__494, dtb__495, dtb__496, dtb__497, dtb__498, dtb__499, dtb__500))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decConstraints = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__501, dtb__502, dtb__503, dtb__504, dtb__505, dtb__506, dtb__507, dtb__508, dtb__509, dtb__510, dtb__511, dtb__512, dtb__513, dtb__514, dtb__515, dtb__516, dtb__517, dtb__518) -> dtb__509
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutConstraints = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__519, dtb__520, dtb__521, dtb__522, dtb__523, dtb__524, dtb__525, dtb__526, dtb__527, dtb__528, dtb__529, dtb__530, dtb__531, dtb__532, dtb__533, dtb__534, dtb__535, dtb__536) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__519, dtb__520, dtb__521, dtb__522, dtb__523, dtb__524, dtb__525, dtb__526, mc1, dtb__528, dtb__529, dtb__530, dtb__531, dtb__532, dtb__533, dtb__534, dtb__535, dtb__536))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPending = (fun ec -> (match (v_Vuna_dCompiler_dElab_dTypes_decConstraints ec) with
  | C_Vuna_dCompiler_dElab_dTypes_dConstraintStore_ConstraintStore (dtb__537, dtb__538, dtb__539) -> dtb__537
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutPending = (fun ec pending2 -> (match (v_Vuna_dCompiler_dElab_dTypes_decConstraints ec) with
  | C_Vuna_dCompiler_dElab_dTypes_dConstraintStore_ConstraintStore (dtb__540, dtb__541, dtb__542) -> ((v_Vuna_dCompiler_dElab_dTypes_decPutConstraints ec) (C_Vuna_dCompiler_dElab_dTypes_dConstraintStore_ConstraintStore (pending2, dtb__541, dtb__542)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decAddConstraint = (fun ec kind meta dom span depth -> (match (v_Vuna_dCompiler_dElab_dTypes_decConstraints ec) with
  | C_Vuna_dCompiler_dElab_dTypes_dConstraintStore_ConstraintStore (dtb__543, dtb__544, dtb__545) -> ((v_Vuna_dCompiler_dElab_dTypes_decPutConstraints ec) (C_Vuna_dCompiler_dElab_dTypes_dConstraintStore_ConstraintStore (((Base_dList.v_Base_dList_dappend dtb__543) (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dTypes_dConstraint_Constraint (dtb__544, kind, meta, dom, span, depth)), Base_dList.C_Base_dList_dList_Nil))), (dtb__544 + 1), dtb__545)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dassocIntLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__546, dtb__547) -> (match dtb__546 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__548, dtb__549) -> (if (dtb__548 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__549)) else ((v_Vuna_dCompiler_dElab_dTypes_dassocIntLookup mc0) dtb__547))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decTriedAt = (fun ec cid -> (match (v_Vuna_dCompiler_dElab_dTypes_decConstraints ec) with
  | C_Vuna_dCompiler_dElab_dTypes_dConstraintStore_ConstraintStore (dtb__550, dtb__551, dtb__552) -> ((v_Vuna_dCompiler_dElab_dTypes_dassocIntLookup cid) dtb__552)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dassocIntSet = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__553, dtb__554) -> (match dtb__553 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__555, dtb__556) -> (if (dtb__555 = mc0) then (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__555, mc1)), dtb__554)) else (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__555, dtb__556)), (((v_Vuna_dCompiler_dElab_dTypes_dassocIntSet mc0) mc1) dtb__554))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (mc0, mc1)), Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decRecordTried = (fun ec cid epoch -> (match (v_Vuna_dCompiler_dElab_dTypes_decConstraints ec) with
  | C_Vuna_dCompiler_dElab_dTypes_dConstraintStore_ConstraintStore (dtb__557, dtb__558, dtb__559) -> ((v_Vuna_dCompiler_dElab_dTypes_decPutConstraints ec) (C_Vuna_dCompiler_dElab_dTypes_dConstraintStore_ConstraintStore (dtb__557, dtb__558, (((v_Vuna_dCompiler_dElab_dTypes_dassocIntSet cid) epoch) dtb__559))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decEmpty = (C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (0, Base_dList.C_Base_dList_dList_Nil, Base_dList.C_Base_dList_dList_Nil, Base_dList.C_Base_dList_dList_Nil, Base_dList.C_Base_dList_dList_Nil, Base_dList.C_Base_dList_dList_Nil, v_Vuna_dCompiler_dElab_dTypes_dinstStoreEmpty, Base_dList.C_Base_dList_dList_Nil, v_Vuna_dCompiler_dElab_dTypes_dcsEmpty, ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil), ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil), ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil), ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil), false, ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil), ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil), ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil), false))

let v_Vuna_dCompiler_dElab_dTypes_decSolTbl = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__560, dtb__561, dtb__562, dtb__563, dtb__564, dtb__565, dtb__566, dtb__567, dtb__568, dtb__569, dtb__570, dtb__571, dtb__572, dtb__573, dtb__574, dtb__575, dtb__576, dtb__577) -> dtb__571
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutSolsRaw = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__578, dtb__579, dtb__580, dtb__581, dtb__582, dtb__583, dtb__584, dtb__585, dtb__586, dtb__587, dtb__588, dtb__589, dtb__590, dtb__591, dtb__592, dtb__593, dtb__594, dtb__595) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__578, mc1, dtb__580, dtb__581, dtb__582, dtb__583, dtb__584, dtb__585, dtb__586, dtb__587, dtb__588, mc2, dtb__590, dtb__591, dtb__592, dtb__593, dtb__594, dtb__595))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__596, dtb__597) -> (match dtb__596 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__598, dtb__599) -> (if (dtb__598 = mc0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__598, dtb__599)), ((v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId mc0) dtb__597))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dsolsDelta = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__600, dtb__601) -> (match dtb__600 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__602, dtb__603) -> ((v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId dtb__602) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutSols = (fun ec sols2 -> ((fun delta -> ((fun soltbl2 -> (((v_Vuna_dCompiler_dElab_dTypes_decPutSolsRaw ec) sols2) soltbl2)) (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dInt.v_Hashable_uInt) delta) (v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)))) ((v_Vuna_dCompiler_dElab_dTypes_dsolsDelta (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) sols2)))

let rec v_Vuna_dCompiler_dElab_dTypes_dmemDataNameIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__604, dtb__605) -> (if ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__604) = mc0) then true else ((v_Vuna_dCompiler_dElab_dTypes_dmemDataNameIn mc0) dtb__605))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decAddDef = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__606, dtb__607, dtb__608, dtb__609, dtb__610, dtb__611, dtb__612, dtb__613, dtb__614, dtb__615, dtb__616, dtb__617, dtb__618, dtb__619, dtb__620, dtb__621, dtb__622, dtb__623) -> ((fun delta -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__606, dtb__607, (Base_dList.C_Base_dList_dList_Cons (mc1, dtb__608)), dtb__609, dtb__610, dtb__611, dtb__612, dtb__613, dtb__614, delta, dtb__616, dtb__617, dtb__618, dtb__619, dtb__620, dtb__621, dtb__622, dtb__623))) (if ((v_Vuna_dCompiler_dElab_dTypes_dmemDataNameIn (Base_dPair.v_Base_dPair_dfirstOf mc1)) dtb__609) then dtb__615 else ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) (Base_dPair.v_Base_dPair_dfirstOf mc1)) (Base_dPair.v_Base_dPair_dsecondOf mc1)) dtb__615)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddataCtorPairs = (fun d -> ((Base_dList.v_Base_dList_dmap (fun c -> (Base_dPair.C_Base_dPair_dPair_Pair ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c), c)))) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

let v_Vuna_dCompiler_dElab_dTypes_decAddData = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__624, dtb__625, dtb__626, dtb__627, dtb__628, dtb__629, dtb__630, dtb__631, dtb__632, dtb__633, dtb__634, dtb__635, dtb__636, dtb__637, dtb__638, dtb__639, dtb__640, dtb__641) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__624, dtb__625, dtb__626, ((Base_dList.v_Base_dList_dappend dtb__627) (Base_dList.C_Base_dList_dList_Cons (mc1, Base_dList.C_Base_dList_dList_Nil))), dtb__628, dtb__629, dtb__630, dtb__631, dtb__632, dtb__633, dtb__634, dtb__635, dtb__636, dtb__637, dtb__638, (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) (v_Vuna_dCompiler_dElab_dTypes_ddataCtorPairs mc1)) dtb__639), dtb__640, (if (v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear mc1) then true else dtb__641)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas = (fun datas -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTypes_ddataCtorPairs) datas)) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dElab_dTypes_decPutCtorTbl = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__642, dtb__643, dtb__644, dtb__645, dtb__646, dtb__647, dtb__648, dtb__649, dtb__650, dtb__651, dtb__652, dtb__653, dtb__654, dtb__655, dtb__656, dtb__657, dtb__658, dtb__659) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__642, dtb__643, dtb__644, dtb__645, dtb__646, dtb__647, dtb__648, dtb__649, dtb__650, dtb__651, dtb__652, dtb__653, dtb__654, dtb__655, dtb__656, mc1, dtb__658, dtb__659))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDefVals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__660, dtb__661, dtb__662, dtb__663, dtb__664, dtb__665, dtb__666, dtb__667, dtb__668, dtb__669, dtb__670, dtb__671, dtb__672, dtb__673, dtb__674, dtb__675, dtb__676, dtb__677) -> dtb__676
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decSolsP = (fun ec -> ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsOf (v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) (v_Vuna_dCompiler_dElab_dTypes_decDepthTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decDefVals ec)))

let v_Vuna_dCompiler_dElab_dTypes_decHasLinear = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__678, dtb__679, dtb__680, dtb__681, dtb__682, dtb__683, dtb__684, dtb__685, dtb__686, dtb__687, dtb__688, dtb__689, dtb__690, dtb__691, dtb__692, dtb__693, dtb__694, dtb__695) -> dtb__695
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_ddatasHaveLinear = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__696, dtb__697) -> (if (v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear dtb__696) then true else (v_Vuna_dCompiler_dElab_dTypes_ddatasHaveLinear dtb__697))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutDefVals = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__698, dtb__699, dtb__700, dtb__701, dtb__702, dtb__703, dtb__704, dtb__705, dtb__706, dtb__707, dtb__708, dtb__709, dtb__710, dtb__711, dtb__712, dtb__713, dtb__714, dtb__715) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__698, dtb__699, dtb__700, dtb__701, dtb__702, dtb__703, dtb__704, dtb__705, dtb__706, dtb__707, dtb__708, dtb__709, dtb__710, dtb__711, dtb__712, dtb__713, mc1, dtb__715))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctxDepth = (fun ctx -> (Base_dList.v_Base_dList_dlength (match ctx with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Ctx (dtb__716, dtb__717) -> dtb__716
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_dctxBind = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Ctx (dtb__718, dtb__719) -> (C_Vuna_dCompiler_dElab_dTypes_dCtx_Ctx ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (mc0, mc1)), dtb__718)), dtb__719))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctxBindValue = (fun name dom ctx -> (((v_Vuna_dCompiler_dElab_dTypes_dctxBind name) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dom)) ctx))

let v_Vuna_dCompiler_dElab_dTypes_dctxRefine = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Ctx (dtb__720, dtb__721) -> (C_Vuna_dCompiler_dElab_dTypes_dCtx_Ctx (dtb__720, ((Base_dList.v_Base_dList_dappend dtb__721) mc1)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__722, dtb__723) -> (match dtb__722 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__724, dtb__725) -> (if (dtb__724 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair (mc2, dtb__725)))) else (((v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt mc0) dtb__723) (mc2 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctxLookup = (fun name ctx -> (((v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt name) (match ctx with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Ctx (dtb__726, dtb__727) -> dtb__726
  | _ -> failwith "DT: impossible branch"
)) 0))

let rec v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__728, dtb__729) -> (match dtb__728 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__730, dtb__731) -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__730, ((mc2 - mc1) - 1), Base_dList.C_Base_dList_dList_Nil)))), (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__729) (mc1 + 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctxEnv = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Ctx (dtb__732, dtb__733) -> (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__732) 0) (Base_dList.v_Base_dList_dlength dtb__732))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_drefineLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__734, dtb__735) -> (match dtb__734 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__736, dtb__737) -> (if (dtb__736 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__737)) else ((v_Vuna_dCompiler_dElab_dTypes_drefineLookup mc0) dtb__735))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_drefineValue = (fun refs fuel v -> (if (fuel <= 0) then v else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__738) -> (match dtb__738 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__739, dtb__740, dtb__741) -> ((fun sp2 -> (match ((v_Vuna_dCompiler_dElab_dTypes_drefineLookup dtb__740) refs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__742) -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__742)) sp2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__739, dtb__740, sp2))))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__741))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__743, dtb__744) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__743, ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__744)))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__745, dtb__746) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__745, ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__746)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__747, dtb__748) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__747), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__748)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__749, dtb__750) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__749), dtb__750))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__751, dtb__752, dtb__753) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__751), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__752), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__753)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__754, dtb__755) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__754, ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__755)))
  | _ -> v
)))

let v_Vuna_dCompiler_dElab_dTypes_devalCtx = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Ctx (dtb__756, dtb__757) -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue dtb__757) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel)) (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__756) 0) (Base_dList.v_Base_dList_dlength dtb__756)))) mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Ctx (dtb__758, dtb__759) -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue dtb__759) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel)) (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__758) 0) (Base_dList.v_Base_dList_dlength dtb__758)))) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) (mc1 + 1)) mc2))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_demptyCtx = (C_Vuna_dCompiler_dElab_dTypes_dCtx_Ctx (Base_dList.C_Base_dList_dList_Nil, Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dElab_dTypes_derrAt = (fun sp msg -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": "; msg]))))

let v_Vuna_dCompiler_dElab_dTypes_dnewMeta = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__760, dtb__761, dtb__762, dtb__763, dtb__764, dtb__765, dtb__766, dtb__767, dtb__768, dtb__769, dtb__770, dtb__771, dtb__772, dtb__773, dtb__774, dtb__775, dtb__776, dtb__777) -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__760)), (C_Vuna_dCompiler_dElab_dTypes_dEc_Ec ((dtb__760 + 1), dtb__761, dtb__762, dtb__763, (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__760, (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0))), dtb__764)), dtb__765, dtb__766, dtb__767, dtb__768, dtb__769, dtb__770, dtb__771, ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dInt.v_Hashable_uInt) dtb__760) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0)) dtb__772), dtb__773, dtb__774, dtb__775, dtb__776, dtb__777))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dnewHoleMeta = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc1 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__778, dtb__779, dtb__780, dtb__781, dtb__782, dtb__783, dtb__784, dtb__785, dtb__786, dtb__787, dtb__788, dtb__789, dtb__790, dtb__791, dtb__792, dtb__793, dtb__794, dtb__795) -> ((fun goal -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__778)), (C_Vuna_dCompiler_dElab_dTypes_dEc_Ec ((dtb__778 + 1), dtb__779, dtb__780, dtb__781, (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__778, (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0))), dtb__782)), ((Base_dList.v_Base_dList_dappend dtb__783) (Base_dList.C_Base_dList_dList_Cons (goal, Base_dList.C_Base_dList_dList_Nil))), dtb__784, dtb__785, dtb__786, dtb__787, dtb__788, dtb__789, ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dInt.v_Hashable_uInt) dtb__778) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0)) dtb__790), dtb__791, dtb__792, dtb__793, dtb__794, dtb__795))))) (C_Vuna_dCompiler_dElab_dTypes_dDtGoal_DtGoal (dtb__778, mc2, mc3, (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Ctx (dtb__796, dtb__797) -> dtb__796
  | _ -> failwith "DT: impossible branch"
), mc4)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dforceVal = (fun ec v -> ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_DtProgram (dtb__798, dtb__799, dtb__800, dtb__801, dtb__802, dtb__803, dtb__804, dtb__805, dtb__806, dtb__807) -> dtb__798
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_DtProgram (dtb__808, dtb__809, dtb__810, dtb__811, dtb__812, dtb__813, dtb__814, dtb__815, dtb__816, dtb__817) -> dtb__809
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_DtProgram (dtb__818, dtb__819, dtb__820, dtb__821, dtb__822, dtb__823, dtb__824, dtb__825, dtb__826, dtb__827) -> dtb__820
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgSols = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_DtProgram (dtb__828, dtb__829, dtb__830, dtb__831, dtb__832, dtb__833, dtb__834, dtb__835, dtb__836, dtb__837) -> dtb__831
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_DtProgram (dtb__838, dtb__839, dtb__840, dtb__841, dtb__842, dtb__843, dtb__844, dtb__845, dtb__846, dtb__847) -> dtb__842
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_DtProgram (dtb__848, dtb__849, dtb__850, dtb__851, dtb__852, dtb__853, dtb__854, dtb__855, dtb__856, dtb__857) -> dtb__853
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_DtProgram (dtb__858, dtb__859, dtb__860, dtb__861, dtb__862, dtb__863, dtb__864, dtb__865, dtb__866, dtb__867) -> dtb__864
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dsolsToTbl = (fun sols -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dInt.v_Hashable_uInt) sols) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dElab_dTypes_decPutDefTbl = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__868, dtb__869, dtb__870, dtb__871, dtb__872, dtb__873, dtb__874, dtb__875, dtb__876, dtb__877, dtb__878, dtb__879, dtb__880, dtb__881, dtb__882, dtb__883, dtb__884, dtb__885) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__868, dtb__869, dtb__870, dtb__871, dtb__872, dtb__873, dtb__874, dtb__875, dtb__876, mc1, dtb__878, dtb__879, dtb__880, dtb__881, dtb__882, dtb__883, dtb__884, dtb__885))
  | _ -> failwith "DT: impossible branch"
))
