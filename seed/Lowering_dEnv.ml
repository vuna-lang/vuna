open Vuna_runtime
type t_LwEnv = { f_LwEnv_lwShared : Vuna_dIr_dModel.t_IrShared; f_LwEnv_lwDatas : Elab_dTypes.t_DtData B_dData_dList.t_List; f_LwEnv_lwDataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwTyParams : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwUnboxedInfo : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List; f_LwEnv_lwRecordFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwCtors : (string, (string, bool B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwOpaques : (string, bool B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwUnboxed : (string, bool) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwHasListFamily : bool; f_LwEnv_lwDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List; f_LwEnv_lwOrigDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List; f_LwEnv_lwDefTbl : (string, Elab_dTypes.t_DtDef) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwGlobals : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwFacts : (string, Lowering_dChecks.t_TermUse) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwUnit : string }

# 73 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwDefBodyOf = (fun (name : string) (env : t_LwEnv) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (env).f_LwEnv_lwDefTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> (Elab_dTypes.v_dtDefBody dtb__0)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwGlobalTyOf = (fun (name : string) (env : t_LwEnv) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (env).f_LwEnv_lwGlobals))

# 83 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwEnvShared = (fun (mc0 : t_LwEnv) -> (match mc0 with
  | { f_LwEnv_lwShared = dtb__1; f_LwEnv_lwDatas = dtb__2; f_LwEnv_lwDataTbl = dtb__3; f_LwEnv_lwTyParams = dtb__4; f_LwEnv_lwUnboxedInfo = dtb__5; f_LwEnv_lwRecordFields = dtb__6; f_LwEnv_lwCtors = dtb__7; f_LwEnv_lwOpaques = dtb__8; f_LwEnv_lwUnboxed = dtb__9; f_LwEnv_lwHasListFamily = dtb__10; f_LwEnv_lwDefs = dtb__11; f_LwEnv_lwOrigDefs = dtb__12; f_LwEnv_lwDefTbl = dtb__13; f_LwEnv_lwGlobals = dtb__14; f_LwEnv_lwFacts = dtb__15; f_LwEnv_lwUnit = dtb__16 } -> dtb__1
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwEnvWithUnit = (fun (mc0 : string) (mc1 : t_LwEnv) -> (match mc1 with
  | { f_LwEnv_lwShared = dtb__17; f_LwEnv_lwDatas = dtb__18; f_LwEnv_lwDataTbl = dtb__19; f_LwEnv_lwTyParams = dtb__20; f_LwEnv_lwUnboxedInfo = dtb__21; f_LwEnv_lwRecordFields = dtb__22; f_LwEnv_lwCtors = dtb__23; f_LwEnv_lwOpaques = dtb__24; f_LwEnv_lwUnboxed = dtb__25; f_LwEnv_lwHasListFamily = dtb__26; f_LwEnv_lwDefs = dtb__27; f_LwEnv_lwOrigDefs = dtb__28; f_LwEnv_lwDefTbl = dtb__29; f_LwEnv_lwGlobals = dtb__30; f_LwEnv_lwFacts = dtb__31; f_LwEnv_lwUnit = dtb__32 } -> { f_LwEnv_lwShared = dtb__17; f_LwEnv_lwDatas = dtb__18; f_LwEnv_lwDataTbl = dtb__19; f_LwEnv_lwTyParams = dtb__20; f_LwEnv_lwUnboxedInfo = dtb__21; f_LwEnv_lwRecordFields = dtb__22; f_LwEnv_lwCtors = dtb__23; f_LwEnv_lwOpaques = dtb__24; f_LwEnv_lwUnboxed = dtb__25; f_LwEnv_lwHasListFamily = dtb__26; f_LwEnv_lwDefs = dtb__27; f_LwEnv_lwOrigDefs = dtb__28; f_LwEnv_lwDefTbl = dtb__29; f_LwEnv_lwGlobals = dtb__30; f_LwEnv_lwFacts = dtb__31; f_LwEnv_lwUnit = mc0 }
  | _ -> failwith "DT: impossible branch"
))

# 109 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_listLength = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__33, dtb__34) -> (1 + (v_listLength dtb__34))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 114 "Vuna/Compiler/Lowering/Env.vuna"
let v_pushDep = (fun (dep : string) (deps : string B_dData_dList.t_List) -> (if (dep = "") then deps else (if ((B_dData_dList.v_memName dep) deps) then deps else ((B_dData_dList.v_append deps) (B_dData_dList.C_List__x58__x58_ (dep, B_dData_dList.C_List_Nil))))))

# 118 "Vuna/Compiler/Lowering/Env.vuna"
let[@tail_mod_cons] rec v_mapSome = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__35, dtb__36) -> (match (mc0 dtb__35) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_mapSome mc0) dtb__36)
  | B_dData_dMaybe.C_Maybe_Just (dtb__37) -> (B_dData_dList.C_List__x58__x58_ (dtb__37, ((v_mapSome mc0) dtb__36)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Lowering/Env.vuna"
let v_isTypeHeadOpaqueDatas = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (name : string) -> (if (Base_dIntrinsics.v_isUnboxedCanonical name) then false else (match ((Elab_dRepresentation.v_findDtData name) datas) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__38) -> false
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dBool.v_not (Base_dIntrinsics.v_isTypeConstructorName name))
  | _ -> failwith "DT: impossible branch"
)))

# 136 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_memOpaqueLevel = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__39, dtb__40) -> (if (dtb__39 = mc0) then true else ((v_memOpaqueLevel mc0) dtb__40))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 148 "Vuna/Compiler/Lowering/Env.vuna"
let v_isRecordData = (fun (d : Elab_dTypes.t_DtData) -> (if (Elab_dTypes.v_dtDataIsRecord d) then (let nd_uscrut1 = (Elab_dTypes.v_dtDataCtors d) in (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__41, dtb__42) -> (match dtb__42 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> false
)) else false))

# 167 "Vuna/Compiler/Lowering/Env.vuna"
let[@tail_mod_cons] rec v_recordRtFieldsGo = (fun (mc0 : string) (mc1 : bool B_dData_dList.t_List) (mc2 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__43, dtb__44) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__45, dtb__46) -> (if dtb__43 then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb__45).Elab_dTypes.f_DtFieldMeta_dtFieldIndex; B_dData_dPair.f_Pair_second = (dtb__45).Elab_dTypes.f_DtFieldMeta_dtFieldName }, (((v_recordRtFieldsGo mc0) dtb__44) dtb__46))) else (((v_recordRtFieldsGo mc0) dtb__44) dtb__46))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 158 "Vuna/Compiler/Lowering/Env.vuna"
let v_recordRtFields = (fun (d : Elab_dTypes.t_DtData) -> (let nd_uscrut1 = (Elab_dTypes.v_dtDataCtors d) in (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__47, dtb__48) -> (match dtb__48 with
  | B_dData_dList.C_List_Nil -> (let arity = (v_listLength (d).Elab_dTypes.f_DtData_dtDataParams) in (((v_recordRtFieldsGo (Elab_dTypes.v_dtDataName d)) ((B_dData_dList.v_drop arity) (Elab_dRepresentation.v_ctorKeepFlags dtb__47))) (Elab_dTypes.v_dtDataFields d)))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)))

# 177 "Vuna/Compiler/Lowering/Env.vuna"
let v_hasRecordRepr = (fun (d : Elab_dTypes.t_DtData) -> (if (v_isRecordData d) then (match (v_recordRtFields d) with
  | B_dData_dList.C_List_Nil -> false
  | _ -> true
) else false))

# 187 "Vuna/Compiler/Lowering/Env.vuna"
let v_rtDatasOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((B_dData_dList.v_filter (fun (d : Elab_dTypes.t_DtData) -> (B_dData_dBool.v_not (Base_dIntrinsics.v_isUnboxedCanonical (Elab_dTypes.v_dtDataName d))))) datas))

# 195 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_ctorOpaqueGo = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : int) (mc3 : Core_dTerm.t_Value) (mc4 : int B_dData_dList.t_List) (mc5 : bool B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__49, dtb__50) -> (match dtb__49 with
  | { B_dData_dPair.f_Pair_first = dtb__51; B_dData_dPair.f_Pair_second = dtb__52 } -> (match mc3 with
  | Core_dTerm.C_Value_VPi (dtb__53, dtb__54, dtb__55, dtb__56, dtb__57) -> (let flag = (if (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased dtb__52)) then (if (((((((Elab_dMeta.v_valueOpaqueScoped (fun (x : Core_dTerm.t_Value) -> x)) false) (fun (l : int) -> ((v_memOpaqueLevel l) mc4))) (v_isTypeHeadOpaqueDatas mc0)) mc2) mc4) dtb__56) then true else (Elab_dMeta.v_valueHasImplicitPi dtb__56)) else false) in (let fam2 = (if (Elab_dMeta.v_isFamilyKindValue dtb__56) then (B_dData_dList.C_List__x58__x58_ (mc2, mc4)) else mc4) in (let next = ((Core_dEval.v_applyClosure dtb__57) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__53, mc2, B_dData_dList.C_List_Nil))))) in ((((((v_ctorOpaqueGo mc0) dtb__50) (mc2 + 1)) next) fam2) (B_dData_dList.C_List__x58__x58_ (flag, mc5))))))
  | _ -> (B_dData_dList.v_reverse mc5)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc5)
  | _ -> failwith "DT: impossible branch"
))

# 192 "Vuna/Compiler/Lowering/Env.vuna"
let v_ctorOpaqueFlagsOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (c : Elab_dTypes.t_DtCtor) -> ((((((v_ctorOpaqueGo datas) (Elab_dTypes.v_dtCtorTelescope c)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType c))) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 219 "Vuna/Compiler/Lowering/Env.vuna"
let v_locRowPair = (fun (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefSpan d) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__58) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName d); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (dtb__58).Base_dSource.f_Span_spanFile; B_dData_dPair.f_Pair_second = (Base_dSource.v_spanStartLine dtb__58) } }))
  | _ -> failwith "DT: impossible branch"
))

# 235 "Vuna/Compiler/Lowering/Env.vuna"
let[@tail_mod_cons] rec v_typeParamLevelsGo = (fun (mc0 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__60) -> (if (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf dtb__59)) then (B_dData_dList.C_List__x58__x58_ (mc1, ((v_typeParamLevelsGo dtb__60) (mc1 + 1)))) else ((v_typeParamLevelsGo dtb__60) (mc1 + 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 232 "Vuna/Compiler/Lowering/Env.vuna"
let v_typeParamLevels = (fun (d : Elab_dTypes.t_DtData) -> ((v_typeParamLevelsGo (d).Elab_dTypes.f_DtData_dtDataParams) 0))

# 243 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_memIntIn = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__61, dtb__62) -> (if (dtb__61 = mc0) then true else ((v_memIntIn mc0) dtb__62))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 250 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_levelSlotGoIn = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64) -> (if (dtb__63 = mc1) then (B_dData_dMaybe.C_Maybe_Just (mc2)) else (((v_levelSlotGoIn dtb__64) mc1) (mc2 + 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 247 "Vuna/Compiler/Lowering/Env.vuna"
let v_levelSlotIn = (fun (levels : int B_dData_dList.t_List) (lvl : int) -> (((v_levelSlotGoIn levels) lvl) 0))

# 254 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_nthValueIn = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__65, dtb__66) -> (if (mc1 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__65)) else ((v_nthValueIn dtb__66) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 258 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_lookupUsedIn = (fun (mc0 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__67, dtb__68) -> (if ((B_dData_dPair.v_firstOf dtb__67) = mc1) then (B_dData_dPair.v_secondOf dtb__67) else ((v_lookupUsedIn dtb__68) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 263 "Vuna/Compiler/Lowering/Env.vuna"
let v_lookupTyParamsIn = (fun (tbl : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__69) -> dtb__69
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 272 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_collectUsedLevelsFuel = (fun (fuel : int) (tps : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (lvl : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match v with
  | Core_dTerm.C_Value_VPi (dtb__70, dtb__71, dtb__72, dtb__73, dtb__74) -> (if dtb__71 then ((((((v_collectUsedLevelsFuel (fuel - 1)) tps) table) datas) (lvl + 1)) ((Core_dEval.v_applyClosure dtb__74) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__70, lvl, B_dData_dList.C_List_Nil)))))) else ((B_dData_dList.v_append ((((((v_collectUsedLevelsFuel (fuel - 1)) tps) table) datas) lvl) dtb__73)) ((((((v_collectUsedLevelsFuel (fuel - 1)) tps) table) datas) (lvl + 1)) ((Core_dEval.v_applyClosure dtb__74) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__70, lvl, B_dData_dList.C_List_Nil))))))))
  | Core_dTerm.C_Value_VNeutral (dtb__75) -> (match dtb__75 with
  | Core_dTerm.C_Neutral_NVar (dtb__76, dtb__77, dtb__78) -> ((B_dData_dList.v_append (if ((v_memIntIn dtb__77) tps) then (B_dData_dList.C_List__x58__x58_ (dtb__77, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)) ((((((v_collectUsedSpineFuel (fuel - 1)) tps) table) datas) lvl) dtb__78))
  | Core_dTerm.C_Neutral_NGlobal (dtb__79, dtb__80) -> (match ((Elab_dRepresentation.v_findDtData dtb__79) datas) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__81) -> (((((((v_collectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) ((v_lookupUsedIn table) dtb__79)) dtb__80)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_collectUsedSpineFuel (fuel - 1)) tps) table) datas) lvl) dtb__80)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dList.C_List_Nil
)))
# 288 "Vuna/Compiler/Lowering/Env.vuna"
and v_collectUsedSpineFuel = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) (mc2 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc4 : int) (mc5 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__82, dtb__83) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append ((((((v_collectUsedLevelsFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__82)) ((((((v_collectUsedSpineFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__83)))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))
# 302 "Vuna/Compiler/Lowering/Env.vuna"
and v_collectFamilyArgsFuel = (fun (fuel : int) (tps : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (lvl : int) (usedPats : int B_dData_dList.t_List) (args : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match usedPats with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> (match ((v_nthValueIn args) dtb__84) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__86) -> ((B_dData_dList.v_append ((((((v_collectUsedLevelsFuel (fuel - 1)) tps) table) datas) lvl) dtb__86)) (((((((v_collectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) dtb__85) args))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_collectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) dtb__85) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 269 "Vuna/Compiler/Lowering/Env.vuna"
let v_collectUsedLevels = (fun (tps : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (lvl : int) (v : Core_dTerm.t_Value) -> ((((((v_collectUsedLevelsFuel 256) tps) table) datas) lvl) v))

# 298 "Vuna/Compiler/Lowering/Env.vuna"
let v_collectFamilyArgs = (fun (tps : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (lvl : int) (usedPats : int B_dData_dList.t_List) (args : Core_dTerm.t_Value B_dData_dList.t_List) -> (((((((v_collectFamilyArgsFuel 256) tps) table) datas) lvl) usedPats) args))

# 314 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_ctorUsedLevels = (fun (mc0 : int B_dData_dList.t_List) (mc1 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc3 : int B_dData_dList.t_List) (mc4 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : int) (mc6 : Core_dTerm.t_Value) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__87, dtb__88) -> (match dtb__87 with
  | { B_dData_dPair.f_Pair_first = dtb__89; B_dData_dPair.f_Pair_second = dtb__90 } -> (match mc6 with
  | Core_dTerm.C_Value_VPi (dtb__91, dtb__92, dtb__93, dtb__94, dtb__95) -> (let isOpq = (((((((Elab_dMeta.v_valueOpaqueScoped (fun (x : Core_dTerm.t_Value) -> x)) false) (fun (l : int) -> ((v_memOpaqueLevel l) mc3))) (v_isTypeHeadOpaqueDatas mc2)) mc5) mc3) dtb__94) in (let fam2 = (if (Elab_dMeta.v_isFamilyKindValue dtb__94) then (B_dData_dList.C_List__x58__x58_ (mc5, mc3)) else mc3) in (let next = ((Core_dEval.v_applyClosure dtb__95) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__91, mc5, B_dData_dList.C_List_Nil))))) in (if (Core_dTerm.v_rigIsErased dtb__90) then (((((((v_ctorUsedLevels mc0) mc1) mc2) fam2) dtb__88) (mc5 + 1)) next) else (if isOpq then (((((((v_ctorUsedLevels mc0) mc1) mc2) fam2) dtb__88) (mc5 + 1)) next) else ((B_dData_dList.v_append (((((v_collectUsedLevels mc0) mc1) mc2) mc5) dtb__94)) (((((((v_ctorUsedLevels mc0) mc1) mc2) fam2) dtb__88) (mc5 + 1)) next)))))))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 343 "Vuna/Compiler/Lowering/Env.vuna"
let v_dataUsedLevels = (fun (d : Elab_dTypes.t_DtData) (table : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (let raw = ((B_dData_dList.v_concatMap (fun (c : Elab_dTypes.t_DtCtor) -> (((((((v_ctorUsedLevels (v_typeParamLevels d)) table) datas) B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorTelescope c)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType c))))) (Elab_dTypes.v_dtDataCtors d)) in ((B_dData_dList.v_filter (fun (l : int) -> ((v_memIntIn l) raw))) (v_typeParamLevels d))))

# 352 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_levelListEq = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__96, dtb__97) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__98, dtb__99) -> (if (dtb__96 = dtb__98) then ((v_levelListEq dtb__97) dtb__99) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (match mc1 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 357 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_sameLevelTable = (fun (mc0 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__102, dtb__103) -> (if (if ((B_dData_dPair.v_firstOf dtb__100) = (B_dData_dPair.v_firstOf dtb__102)) then ((v_levelListEq (B_dData_dPair.v_secondOf dtb__100)) (B_dData_dPair.v_secondOf dtb__102)) else false) then ((v_sameLevelTable dtb__101) dtb__103) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (match mc1 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 371 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_usedSlotCount = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__104, dtb__105) -> ((B_dData_dList.v_length (v_typeParamLevels dtb__104)) + (v_usedSlotCount dtb__105))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 368 "Vuna/Compiler/Lowering/Env.vuna"
let v_usedFixRounds = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (1 + (v_usedSlotCount datas)))

# 378 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_usedTableFixFuel = (fun (fuel : int) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then table else (let next = ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName d); B_dData_dPair.f_Pair_second = (((v_dataUsedLevels d) table) datas) })) datas) in (if ((v_sameLevelTable next) table) then next else (((v_usedTableFixFuel (fuel - 1)) datas) next)))))

# 375 "Vuna/Compiler/Lowering/Env.vuna"
let v_usedTableFix = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_usedTableFixFuel (v_usedFixRounds datas)) datas) table))

# 388 "Vuna/Compiler/Lowering/Env.vuna"
let v_tyParamsOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((v_usedTableFix datas) ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName d); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })) datas)))

# 391 "Vuna/Compiler/Lowering/Env.vuna"
let v_recordFieldsOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName d); B_dData_dPair.f_Pair_second = (v_recordRtFields d) })) ((B_dData_dList.v_filter v_hasRecordRepr) ((B_dData_dList.v_filter (fun (d : Elab_dTypes.t_DtData) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName (Elab_dTypes.v_dtDataName d)) (Elab_dRepresentation.v_unboxedFamilySet datas))))) datas))))

# 399 "Vuna/Compiler/Lowering/Env.vuna"
let v_floatRenderRefName = "Base.Data.Float.floatRender"

# 438 "Vuna/Compiler/Lowering/Env.vuna"
let v_unboxedRowOf = (fun (mc0 : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__106; B_dData_dPair.f_Pair_second = dtb__107 } -> (match dtb__107 with
  | { B_dData_dPair.f_Pair_first = dtb__108; B_dData_dPair.f_Pair_second = dtb__109 } -> { B_dData_dPair.f_Pair_first = dtb__106; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName dtb__108); B_dData_dPair.f_Pair_second = dtb__109 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 447 "Vuna/Compiler/Lowering/Env.vuna"
let v_lookupFacts = (fun (facts : (string, Lowering_dChecks.t_TermUse) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) facts) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__110) -> dtb__110
  | B_dData_dMaybe.C_Maybe_Nothing -> { Lowering_dChecks.f_TermUse_termUseDeps = B_dData_dList.C_List_Nil; Lowering_dChecks.f_TermUse_termUseFlags = Lowering_dChecks.v_noUseFlags; Lowering_dChecks.f_TermUse_termUseFloatLit = false }
  | _ -> failwith "DT: impossible branch"
))

# 407 "Vuna/Compiler/Lowering/Env.vuna"
let v_factsOf = (fun (env : t_LwEnv) (name : string) -> ((v_lookupFacts (env).f_LwEnv_lwFacts) name))

# 403 "Vuna/Compiler/Lowering/Env.vuna"
let v_factsDepsOf = (fun (env : t_LwEnv) (name : string) -> ((B_dData_dList.v_map (fun (d : string) -> (if (d = "strFromFloat") then v_floatRenderRefName else d))) (((v_factsOf env) name)).Lowering_dChecks.f_TermUse_termUseDeps))

# 442 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_anyDefFlag = (fun (mc0 : (Lowering_dChecks.t_TermUse) -> bool) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (mc2 : (string, Lowering_dChecks.t_TermUse) B_dContainer_dHashMap.t_HashMap) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__111, dtb__112) -> (if (mc0 ((v_lookupFacts mc2) (Elab_dTypes.v_dtDefName dtb__111))) then true else (((v_anyDefFlag mc0) dtb__112) mc2))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 465 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_findFamilyCtor = (fun (mc0 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__113, dtb__114) -> (if ((Elab_dTypes.v_dtCtorName dtb__113) = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__113)) else ((v_findFamilyCtor dtb__114) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 469 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_findListFamilyData = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__115, dtb__116) -> (if ((Elab_dTypes.v_dtDataName dtb__115) = Base_dIntrinsics.v_listFamilyName) then (B_dData_dMaybe.C_Maybe_Just (dtb__115)) else (v_findListFamilyData dtb__116))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 453 "Vuna/Compiler/Lowering/Env.vuna"
let v_listFamOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match (v_findListFamilyData datas) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__117) -> (match ((v_findFamilyCtor (Elab_dTypes.v_dtDataCtors dtb__117)) Base_dIntrinsics.v_listNilCtor) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__118) -> (match ((v_findFamilyCtor (Elab_dTypes.v_dtDataCtors dtb__117)) Base_dIntrinsics.v_listConsCtor) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__119) -> (B_dData_dMaybe.C_Maybe_Just ({ Vuna_dIr_dModel.f_IrListFam_irListFamily = (Elab_dTypes.v_dtDataName dtb__117); Vuna_dIr_dModel.f_IrListFam_irListNil = (Elab_dTypes.v_dtCtorName dtb__118); Vuna_dIr_dModel.f_IrListFam_irListCons = (Elab_dTypes.v_dtCtorName dtb__119) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 474 "Vuna/Compiler/Lowering/Env.vuna"
let v_ctorTableOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap (fun (d : Elab_dTypes.t_DtData) -> ((B_dData_dList.v_map (fun (c : Elab_dTypes.t_DtCtor) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName c); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorFamily c); B_dData_dPair.f_Pair_second = (Elab_dRepresentation.v_ctorKeepFlags c) } })) (Elab_dTypes.v_dtDataCtors d)))) datas))

# 413 "Vuna/Compiler/Lowering/Env.vuna"
let v_lowerSharedOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (facts : (string, Lowering_dChecks.t_TermUse) B_dContainer_dHashMap.t_HashMap) -> (let runtime = (v_rtDatasOf datas) in (let locRows = ((v_mapSome v_locRowPair) defs) in (let usesTrace = (((v_anyDefFlag (fun (f : Lowering_dChecks.t_TermUse) -> ((f).Lowering_dChecks.f_TermUse_termUseFlags).Lowering_dChecks.f_UseFlags_useFlagsTrace)) defs) facts) in (let usesObs = (((v_anyDefFlag (fun (f : Lowering_dChecks.t_TermUse) -> ((f).Lowering_dChecks.f_TermUse_termUseFlags).Lowering_dChecks.f_UseFlags_useFlagsObs)) defs) facts) in (let usesHost = (if (if (((v_anyDefFlag (fun (f : Lowering_dChecks.t_TermUse) -> ((f).Lowering_dChecks.f_TermUse_termUseFlags).Lowering_dChecks.f_UseFlags_useFlagsHost)) defs) facts) then true else usesTrace) then true else usesObs) in (let usesSched = (((v_anyDefFlag (fun (f : Lowering_dChecks.t_TermUse) -> ((f).Lowering_dChecks.f_TermUse_termUseFlags).Lowering_dChecks.f_UseFlags_useFlagsSched)) defs) facts) in (let usesEff = (((v_anyDefFlag (fun (f : Lowering_dChecks.t_TermUse) -> ((f).Lowering_dChecks.f_TermUse_termUseFlags).Lowering_dChecks.f_UseFlags_useFlagsEff)) defs) facts) in { Vuna_dIr_dModel.f_IrShared_irSharedRecordFields = (v_recordFieldsOf runtime); Vuna_dIr_dModel.f_IrShared_irSharedListFam = (v_listFamOf runtime); Vuna_dIr_dModel.f_IrShared_irSharedUsesFloat = (((v_anyDefFlag (fun (f : Lowering_dChecks.t_TermUse) -> (if ((f).Lowering_dChecks.f_TermUse_termUseFlags).Lowering_dChecks.f_UseFlags_useFlagsFloat then true else (f).Lowering_dChecks.f_TermUse_termUseFloatLit))) defs) facts); Vuna_dIr_dModel.f_IrShared_irSharedUsesTrace = usesTrace; Vuna_dIr_dModel.f_IrShared_irSharedUsesObs = usesObs; Vuna_dIr_dModel.f_IrShared_irSharedDefLocs = locRows; Vuna_dIr_dModel.f_IrShared_irSharedUnboxed = ((B_dData_dList.v_map v_unboxedRowOf) (Elab_dRepresentation.v_unboxedInfoOf runtime)); Vuna_dIr_dModel.f_IrShared_irSharedCtorShapes = (v_ctorTableOf runtime); Vuna_dIr_dModel.f_IrShared_irSharedUsesHost = usesHost; Vuna_dIr_dModel.f_IrShared_irSharedUsesSched = usesSched; Vuna_dIr_dModel.f_IrShared_irSharedUsesEff = usesEff }))))))))

# 480 "Vuna/Compiler/Lowering/Env.vuna"
let v_ctorOpaqueTableOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap (fun (d : Elab_dTypes.t_DtData) -> ((B_dData_dList.v_map (fun (c : Elab_dTypes.t_DtCtor) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName c); B_dData_dPair.f_Pair_second = ((v_ctorOpaqueFlagsOf datas) c) })) (Elab_dTypes.v_dtDataCtors d)))) datas))

# 500 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_eraseDefsGo = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (mc2 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__120, dtb__121) -> (match dtb__120 with
  | Elab_dTypes.C_DtDef_DtDef (dtb__122, dtb__123, dtb__124, dtb__125) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__122) mc0) then ((Base_dCommon.v_bind (Lowering_dErased.v_eraseTerm dtb__124)) (fun (body2 : Core_dTerm.t_Term) -> (((v_eraseDefsGo mc0) dtb__121) (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.C_DtDef_DtDef (dtb__122, dtb__123, body2, dtb__125)), mc2))))) else (((v_eraseDefsGo mc0) dtb__121) (B_dData_dList.C_List__x58__x58_ (dtb__120, mc2))))
  | _ -> (((v_eraseDefsGo mc0) dtb__121) (B_dData_dList.C_List__x58__x58_ (dtb__120, mc2)))
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse mc2)))
  | _ -> failwith "DT: impossible branch"
))

# 493 "Vuna/Compiler/Lowering/Env.vuna"
let v_eraseDefs = (fun (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let runtimeNames = ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) (B_dData_dPair.v_firstOf ((Lowering_dChecks.v_partitionDefs (Lowering_dChecks.v_defTable defs)) defs))) in (let runtimeTbl = ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = (Obj.magic n); B_dData_dPair.f_Pair_second = true })) runtimeNames)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) in (((v_eraseDefsGo runtimeTbl) defs) B_dData_dList.C_List_Nil))))

# 554 "Vuna/Compiler/Lowering/Env.vuna"
let v_intrinsicUseFlagsTbl = ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = (Obj.magic n); B_dData_dPair.f_Pair_second = { Lowering_dChecks.f_UseFlags_useFlagsFloat = true; Lowering_dChecks.f_UseFlags_useFlagsTrace = false; Lowering_dChecks.f_UseFlags_useFlagsObs = false; Lowering_dChecks.f_UseFlags_useFlagsHost = false; Lowering_dChecks.f_UseFlags_useFlagsSched = false; Lowering_dChecks.f_UseFlags_useFlagsEff = false } })) Base_dIntrinsics.v_floatIntrinsicNames)) ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = (Obj.magic n); B_dData_dPair.f_Pair_second = { Lowering_dChecks.f_UseFlags_useFlagsFloat = false; Lowering_dChecks.f_UseFlags_useFlagsTrace = true; Lowering_dChecks.f_UseFlags_useFlagsObs = false; Lowering_dChecks.f_UseFlags_useFlagsHost = false; Lowering_dChecks.f_UseFlags_useFlagsSched = false; Lowering_dChecks.f_UseFlags_useFlagsEff = false } })) Base_dIntrinsics.v_logIntrinsicNames)) ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = (Obj.magic n); B_dData_dPair.f_Pair_second = { Lowering_dChecks.f_UseFlags_useFlagsFloat = false; Lowering_dChecks.f_UseFlags_useFlagsTrace = false; Lowering_dChecks.f_UseFlags_useFlagsObs = true; Lowering_dChecks.f_UseFlags_useFlagsHost = false; Lowering_dChecks.f_UseFlags_useFlagsSched = false; Lowering_dChecks.f_UseFlags_useFlagsEff = false } })) Base_dIntrinsics.v_obsIntrinsicNames)) ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = (Obj.magic n); B_dData_dPair.f_Pair_second = { Lowering_dChecks.f_UseFlags_useFlagsFloat = false; Lowering_dChecks.f_UseFlags_useFlagsTrace = false; Lowering_dChecks.f_UseFlags_useFlagsObs = false; Lowering_dChecks.f_UseFlags_useFlagsHost = true; Lowering_dChecks.f_UseFlags_useFlagsSched = false; Lowering_dChecks.f_UseFlags_useFlagsEff = false } })) Base_dIntrinsics.v_hostIntrinsicNames)) ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = (Obj.magic n); B_dData_dPair.f_Pair_second = { Lowering_dChecks.f_UseFlags_useFlagsFloat = false; Lowering_dChecks.f_UseFlags_useFlagsTrace = false; Lowering_dChecks.f_UseFlags_useFlagsObs = false; Lowering_dChecks.f_UseFlags_useFlagsHost = false; Lowering_dChecks.f_UseFlags_useFlagsSched = true; Lowering_dChecks.f_UseFlags_useFlagsEff = false } })) Base_dIntrinsics.v_schedIntrinsicNames)) ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = (Obj.magic n); B_dData_dPair.f_Pair_second = { Lowering_dChecks.f_UseFlags_useFlagsFloat = false; Lowering_dChecks.f_UseFlags_useFlagsTrace = false; Lowering_dChecks.f_UseFlags_useFlagsObs = false; Lowering_dChecks.f_UseFlags_useFlagsHost = false; Lowering_dChecks.f_UseFlags_useFlagsSched = false; Lowering_dChecks.f_UseFlags_useFlagsEff = true } })) Base_dIntrinsics.v_effIntrinsicNames))))))) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil))

# 560 "Vuna/Compiler/Lowering/Env.vuna"
let v_useFlagsOfName = (fun (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) v_intrinsicUseFlagsTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__126) -> dtb__126
  | B_dData_dMaybe.C_Maybe_Nothing -> Lowering_dChecks.v_noUseFlags
  | _ -> failwith "DT: impossible branch"
))

# 547 "Vuna/Compiler/Lowering/Env.vuna"
let v_defFactsOf = (fun (names : (string, bool) B_dContainer_dHashMap.t_HashMap) (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefBody d) with
  | B_dData_dMaybe.C_Maybe_Nothing -> { Lowering_dChecks.f_TermUse_termUseDeps = B_dData_dList.C_List_Nil; Lowering_dChecks.f_TermUse_termUseFlags = Lowering_dChecks.v_noUseFlags; Lowering_dChecks.f_TermUse_termUseFloatLit = false }
  | B_dData_dMaybe.C_Maybe_Just (dtb__127) -> (((Lowering_dChecks.v_termUseInto names) v_useFlagsOfName) dtb__127)
  | _ -> failwith "DT: impossible branch"
))

# 567 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_defTblOf = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__128, dtb__129) -> (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Elab_dTypes.v_dtDefName dtb__128)) dtb__128) (v_defTblOf dtb__129))
  | B_dData_dList.C_List_Nil -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 572 "Vuna/Compiler/Lowering/Env.vuna"
let v_strTblOf = (fun pairs -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) pairs) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 576 "Vuna/Compiler/Lowering/Env.vuna"
let v_dataTblOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName d); B_dData_dPair.f_Pair_second = d })) datas)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 580 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_hasDataNamed = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__130, dtb__131) -> (if ((Elab_dTypes.v_dtDataName dtb__130) = mc0) then true else ((v_hasDataNamed mc0) dtb__131))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 584 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_nameSetOf = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__132, dtb__133) -> (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__132) true) (v_nameSetOf dtb__133))
  | B_dData_dList.C_List_Nil -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 539 "Vuna/Compiler/Lowering/Env.vuna"
let v_defFactsTblOf = (fun (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let names = (v_nameSetOf (B_dData_dList.C_List__x58__x58_ ("strFromFloat", (Lowering_dChecks.v_runtimeNamesOf defs)))) in ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtDef) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName d); B_dData_dPair.f_Pair_second = ((v_defFactsOf names) d) })) defs)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil))))

# 514 "Vuna/Compiler/Lowering/Env.vuna"
let v_mkLwEnvFromErased = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (origDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (unit : string) -> (let facts = (v_defFactsTblOf defs) in (let shared = (((v_lowerSharedOf datas) defs) facts) in (let runtime = (v_rtDatasOf datas) in { f_LwEnv_lwShared = shared; f_LwEnv_lwDatas = runtime; f_LwEnv_lwDataTbl = (v_dataTblOf runtime); f_LwEnv_lwTyParams = (v_strTblOf (v_tyParamsOf runtime)); f_LwEnv_lwUnboxedInfo = (Elab_dRepresentation.v_unboxedInfoOf runtime); f_LwEnv_lwRecordFields = (v_strTblOf (shared).Vuna_dIr_dModel.f_IrShared_irSharedRecordFields); f_LwEnv_lwCtors = (v_strTblOf (v_ctorTableOf runtime)); f_LwEnv_lwOpaques = (v_strTblOf (v_ctorOpaqueTableOf runtime)); f_LwEnv_lwUnboxed = (B_dContainer_dHashMap.v_ofNames (Elab_dRepresentation.v_unboxedFamilySet runtime)); f_LwEnv_lwHasListFamily = ((v_hasDataNamed Base_dIntrinsics.v_listFamilyName) datas); f_LwEnv_lwDefs = defs; f_LwEnv_lwOrigDefs = origDefs; f_LwEnv_lwDefTbl = (v_defTblOf defs); f_LwEnv_lwGlobals = (v_strTblOf globals); f_LwEnv_lwFacts = facts; f_LwEnv_lwUnit = unit }))))

# 485 "Vuna/Compiler/Lowering/Env.vuna"
let v_mkLwEnv = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (unit : string) -> ((Base_dCommon.v_bind (v_eraseDefs defs)) (fun (defs2 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((((((v_mkLwEnvFromErased datas) defs2) defs) globals) unit))))))

# 33 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwShared = (fun (p : t_LwEnv) -> (match p with
  | { f_LwEnv_lwShared = dtb__134; f_LwEnv_lwDatas = dtb__135; f_LwEnv_lwDataTbl = dtb__136; f_LwEnv_lwTyParams = dtb__137; f_LwEnv_lwUnboxedInfo = dtb__138; f_LwEnv_lwRecordFields = dtb__139; f_LwEnv_lwCtors = dtb__140; f_LwEnv_lwOpaques = dtb__141; f_LwEnv_lwUnboxed = dtb__142; f_LwEnv_lwHasListFamily = dtb__143; f_LwEnv_lwDefs = dtb__144; f_LwEnv_lwOrigDefs = dtb__145; f_LwEnv_lwDefTbl = dtb__146; f_LwEnv_lwGlobals = dtb__147; f_LwEnv_lwFacts = dtb__148; f_LwEnv_lwUnit = dtb__149 } -> dtb__134
  | _ -> failwith "DT: impossible branch"
))

# 35 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwDatas = (fun (p : t_LwEnv) -> (match p with
  | { f_LwEnv_lwShared = dtb__150; f_LwEnv_lwDatas = dtb__151; f_LwEnv_lwDataTbl = dtb__152; f_LwEnv_lwTyParams = dtb__153; f_LwEnv_lwUnboxedInfo = dtb__154; f_LwEnv_lwRecordFields = dtb__155; f_LwEnv_lwCtors = dtb__156; f_LwEnv_lwOpaques = dtb__157; f_LwEnv_lwUnboxed = dtb__158; f_LwEnv_lwHasListFamily = dtb__159; f_LwEnv_lwDefs = dtb__160; f_LwEnv_lwOrigDefs = dtb__161; f_LwEnv_lwDefTbl = dtb__162; f_LwEnv_lwGlobals = dtb__163; f_LwEnv_lwFacts = dtb__164; f_LwEnv_lwUnit = dtb__165 } -> dtb__151
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwDataTbl = (fun (p : t_LwEnv) -> (match p with
  | { f_LwEnv_lwShared = dtb__166; f_LwEnv_lwDatas = dtb__167; f_LwEnv_lwDataTbl = dtb__168; f_LwEnv_lwTyParams = dtb__169; f_LwEnv_lwUnboxedInfo = dtb__170; f_LwEnv_lwRecordFields = dtb__171; f_LwEnv_lwCtors = dtb__172; f_LwEnv_lwOpaques = dtb__173; f_LwEnv_lwUnboxed = dtb__174; f_LwEnv_lwHasListFamily = dtb__175; f_LwEnv_lwDefs = dtb__176; f_LwEnv_lwOrigDefs = dtb__177; f_LwEnv_lwDefTbl = dtb__178; f_LwEnv_lwGlobals = dtb__179; f_LwEnv_lwFacts = dtb__180; f_LwEnv_lwUnit = dtb__181 } -> dtb__168
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwTyParams = (fun (p : t_LwEnv) -> (match p with
  | { f_LwEnv_lwShared = dtb__182; f_LwEnv_lwDatas = dtb__183; f_LwEnv_lwDataTbl = dtb__184; f_LwEnv_lwTyParams = dtb__185; f_LwEnv_lwUnboxedInfo = dtb__186; f_LwEnv_lwRecordFields = dtb__187; f_LwEnv_lwCtors = dtb__188; f_LwEnv_lwOpaques = dtb__189; f_LwEnv_lwUnboxed = dtb__190; f_LwEnv_lwHasListFamily = dtb__191; f_LwEnv_lwDefs = dtb__192; f_LwEnv_lwOrigDefs = dtb__193; f_LwEnv_lwDefTbl = dtb__194; f_LwEnv_lwGlobals = dtb__195; f_LwEnv_lwFacts = dtb__196; f_LwEnv_lwUnit = dtb__197 } -> dtb__185
  | _ -> failwith "DT: impossible branch"
))

# 42 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwUnboxedInfo = (fun (p : t_LwEnv) -> (match p with
  | { f_LwEnv_lwShared = dtb__198; f_LwEnv_lwDatas = dtb__199; f_LwEnv_lwDataTbl = dtb__200; f_LwEnv_lwTyParams = dtb__201; f_LwEnv_lwUnboxedInfo = dtb__202; f_LwEnv_lwRecordFields = dtb__203; f_LwEnv_lwCtors = dtb__204; f_LwEnv_lwOpaques = dtb__205; f_LwEnv_lwUnboxed = dtb__206; f_LwEnv_lwHasListFamily = dtb__207; f_LwEnv_lwDefs = dtb__208; f_LwEnv_lwOrigDefs = dtb__209; f_LwEnv_lwDefTbl = dtb__210; f_LwEnv_lwGlobals = dtb__211; f_LwEnv_lwFacts = dtb__212; f_LwEnv_lwUnit = dtb__213 } -> dtb__202
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwRecordFields = (fun (p : t_LwEnv) -> (match p with
  | { f_LwEnv_lwShared = dtb__214; f_LwEnv_lwDatas = dtb__215; f_LwEnv_lwDataTbl = dtb__216; f_LwEnv_lwTyParams = dtb__217; f_LwEnv_lwUnboxedInfo = dtb__218; f_LwEnv_lwRecordFields = dtb__219; f_LwEnv_lwCtors = dtb__220; f_LwEnv_lwOpaques = dtb__221; f_LwEnv_lwUnboxed = dtb__222; f_LwEnv_lwHasListFamily = dtb__223; f_LwEnv_lwDefs = dtb__224; f_LwEnv_lwOrigDefs = dtb__225; f_LwEnv_lwDefTbl = dtb__226; f_LwEnv_lwGlobals = dtb__227; f_LwEnv_lwFacts = dtb__228; f_LwEnv_lwUnit = dtb__229 } -> dtb__219
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwCtors = (fun (p : t_LwEnv) -> (match p with
  | { f_LwEnv_lwShared = dtb__230; f_LwEnv_lwDatas = dtb__231; f_LwEnv_lwDataTbl = dtb__232; f_LwEnv_lwTyParams = dtb__233; f_LwEnv_lwUnboxedInfo = dtb__234; f_LwEnv_lwRecordFields = dtb__235; f_LwEnv_lwCtors = dtb__236; f_LwEnv_lwOpaques = dtb__237; f_LwEnv_lwUnboxed = dtb__238; f_LwEnv_lwHasListFamily = dtb__239; f_LwEnv_lwDefs = dtb__240; f_LwEnv_lwOrigDefs = dtb__241; f_LwEnv_lwDefTbl = dtb__242; f_LwEnv_lwGlobals = dtb__243; f_LwEnv_lwFacts = dtb__244; f_LwEnv_lwUnit = dtb__245 } -> dtb__236
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwOpaques = (fun (p : t_LwEnv) -> (match p with
  | { f_LwEnv_lwShared = dtb__246; f_LwEnv_lwDatas = dtb__247; f_LwEnv_lwDataTbl = dtb__248; f_LwEnv_lwTyParams = dtb__249; f_LwEnv_lwUnboxedInfo = dtb__250; f_LwEnv_lwRecordFields = dtb__251; f_LwEnv_lwCtors = dtb__252; f_LwEnv_lwOpaques = dtb__253; f_LwEnv_lwUnboxed = dtb__254; f_LwEnv_lwHasListFamily = dtb__255; f_LwEnv_lwDefs = dtb__256; f_LwEnv_lwOrigDefs = dtb__257; f_LwEnv_lwDefTbl = dtb__258; f_LwEnv_lwGlobals = dtb__259; f_LwEnv_lwFacts = dtb__260; f_LwEnv_lwUnit = dtb__261 } -> dtb__253
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwUnboxed = (fun (p : t_LwEnv) -> (match p with
  | { f_LwEnv_lwShared = dtb__262; f_LwEnv_lwDatas = dtb__263; f_LwEnv_lwDataTbl = dtb__264; f_LwEnv_lwTyParams = dtb__265; f_LwEnv_lwUnboxedInfo = dtb__266; f_LwEnv_lwRecordFields = dtb__267; f_LwEnv_lwCtors = dtb__268; f_LwEnv_lwOpaques = dtb__269; f_LwEnv_lwUnboxed = dtb__270; f_LwEnv_lwHasListFamily = dtb__271; f_LwEnv_lwDefs = dtb__272; f_LwEnv_lwOrigDefs = dtb__273; f_LwEnv_lwDefTbl = dtb__274; f_LwEnv_lwGlobals = dtb__275; f_LwEnv_lwFacts = dtb__276; f_LwEnv_lwUnit = dtb__277 } -> dtb__270
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwHasListFamily = (fun (p : t_LwEnv) -> (match p with
  | { f_LwEnv_lwShared = dtb__278; f_LwEnv_lwDatas = dtb__279; f_LwEnv_lwDataTbl = dtb__280; f_LwEnv_lwTyParams = dtb__281; f_LwEnv_lwUnboxedInfo = dtb__282; f_LwEnv_lwRecordFields = dtb__283; f_LwEnv_lwCtors = dtb__284; f_LwEnv_lwOpaques = dtb__285; f_LwEnv_lwUnboxed = dtb__286; f_LwEnv_lwHasListFamily = dtb__287; f_LwEnv_lwDefs = dtb__288; f_LwEnv_lwOrigDefs = dtb__289; f_LwEnv_lwDefTbl = dtb__290; f_LwEnv_lwGlobals = dtb__291; f_LwEnv_lwFacts = dtb__292; f_LwEnv_lwUnit = dtb__293 } -> dtb__287
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwDefs = (fun (p : t_LwEnv) -> (match p with
  | { f_LwEnv_lwShared = dtb__294; f_LwEnv_lwDatas = dtb__295; f_LwEnv_lwDataTbl = dtb__296; f_LwEnv_lwTyParams = dtb__297; f_LwEnv_lwUnboxedInfo = dtb__298; f_LwEnv_lwRecordFields = dtb__299; f_LwEnv_lwCtors = dtb__300; f_LwEnv_lwOpaques = dtb__301; f_LwEnv_lwUnboxed = dtb__302; f_LwEnv_lwHasListFamily = dtb__303; f_LwEnv_lwDefs = dtb__304; f_LwEnv_lwOrigDefs = dtb__305; f_LwEnv_lwDefTbl = dtb__306; f_LwEnv_lwGlobals = dtb__307; f_LwEnv_lwFacts = dtb__308; f_LwEnv_lwUnit = dtb__309 } -> dtb__304
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwOrigDefs = (fun (p : t_LwEnv) -> (match p with
  | { f_LwEnv_lwShared = dtb__310; f_LwEnv_lwDatas = dtb__311; f_LwEnv_lwDataTbl = dtb__312; f_LwEnv_lwTyParams = dtb__313; f_LwEnv_lwUnboxedInfo = dtb__314; f_LwEnv_lwRecordFields = dtb__315; f_LwEnv_lwCtors = dtb__316; f_LwEnv_lwOpaques = dtb__317; f_LwEnv_lwUnboxed = dtb__318; f_LwEnv_lwHasListFamily = dtb__319; f_LwEnv_lwDefs = dtb__320; f_LwEnv_lwOrigDefs = dtb__321; f_LwEnv_lwDefTbl = dtb__322; f_LwEnv_lwGlobals = dtb__323; f_LwEnv_lwFacts = dtb__324; f_LwEnv_lwUnit = dtb__325 } -> dtb__321
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwDefTbl = (fun (p : t_LwEnv) -> (match p with
  | { f_LwEnv_lwShared = dtb__326; f_LwEnv_lwDatas = dtb__327; f_LwEnv_lwDataTbl = dtb__328; f_LwEnv_lwTyParams = dtb__329; f_LwEnv_lwUnboxedInfo = dtb__330; f_LwEnv_lwRecordFields = dtb__331; f_LwEnv_lwCtors = dtb__332; f_LwEnv_lwOpaques = dtb__333; f_LwEnv_lwUnboxed = dtb__334; f_LwEnv_lwHasListFamily = dtb__335; f_LwEnv_lwDefs = dtb__336; f_LwEnv_lwOrigDefs = dtb__337; f_LwEnv_lwDefTbl = dtb__338; f_LwEnv_lwGlobals = dtb__339; f_LwEnv_lwFacts = dtb__340; f_LwEnv_lwUnit = dtb__341 } -> dtb__338
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwGlobals = (fun (p : t_LwEnv) -> (match p with
  | { f_LwEnv_lwShared = dtb__342; f_LwEnv_lwDatas = dtb__343; f_LwEnv_lwDataTbl = dtb__344; f_LwEnv_lwTyParams = dtb__345; f_LwEnv_lwUnboxedInfo = dtb__346; f_LwEnv_lwRecordFields = dtb__347; f_LwEnv_lwCtors = dtb__348; f_LwEnv_lwOpaques = dtb__349; f_LwEnv_lwUnboxed = dtb__350; f_LwEnv_lwHasListFamily = dtb__351; f_LwEnv_lwDefs = dtb__352; f_LwEnv_lwOrigDefs = dtb__353; f_LwEnv_lwDefTbl = dtb__354; f_LwEnv_lwGlobals = dtb__355; f_LwEnv_lwFacts = dtb__356; f_LwEnv_lwUnit = dtb__357 } -> dtb__355
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwFacts = (fun (p : t_LwEnv) -> (match p with
  | { f_LwEnv_lwShared = dtb__358; f_LwEnv_lwDatas = dtb__359; f_LwEnv_lwDataTbl = dtb__360; f_LwEnv_lwTyParams = dtb__361; f_LwEnv_lwUnboxedInfo = dtb__362; f_LwEnv_lwRecordFields = dtb__363; f_LwEnv_lwCtors = dtb__364; f_LwEnv_lwOpaques = dtb__365; f_LwEnv_lwUnboxed = dtb__366; f_LwEnv_lwHasListFamily = dtb__367; f_LwEnv_lwDefs = dtb__368; f_LwEnv_lwOrigDefs = dtb__369; f_LwEnv_lwDefTbl = dtb__370; f_LwEnv_lwGlobals = dtb__371; f_LwEnv_lwFacts = dtb__372; f_LwEnv_lwUnit = dtb__373 } -> dtb__372
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwUnit = (fun (p : t_LwEnv) -> (match p with
  | { f_LwEnv_lwShared = dtb__374; f_LwEnv_lwDatas = dtb__375; f_LwEnv_lwDataTbl = dtb__376; f_LwEnv_lwTyParams = dtb__377; f_LwEnv_lwUnboxedInfo = dtb__378; f_LwEnv_lwRecordFields = dtb__379; f_LwEnv_lwCtors = dtb__380; f_LwEnv_lwOpaques = dtb__381; f_LwEnv_lwUnboxed = dtb__382; f_LwEnv_lwHasListFamily = dtb__383; f_LwEnv_lwDefs = dtb__384; f_LwEnv_lwOrigDefs = dtb__385; f_LwEnv_lwDefTbl = dtb__386; f_LwEnv_lwGlobals = dtb__387; f_LwEnv_lwFacts = dtb__388; f_LwEnv_lwUnit = dtb__389 } -> dtb__389
  | _ -> failwith "DT: impossible branch"
))
