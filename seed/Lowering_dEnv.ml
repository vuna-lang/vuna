open Vuna_runtime
type t_LwEnv = { f_LwEnv_lwShared : Vuna_dIr_dModel.t_IrShared; f_LwEnv_lwDatas : Elab_dTypes.t_DtData B_dData_dList.t_List; f_LwEnv_lwDataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwTyParams : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwUnboxedInfo : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List; f_LwEnv_lwRecordFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwCtors : (string, (string, bool B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwOpaques : (string, bool B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwUnboxed : (string, bool) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwHasListFamily : bool; f_LwEnv_lwDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List; f_LwEnv_lwOrigDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List; f_LwEnv_lwDefTbl : (string, Elab_dTypes.t_DtDef) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwGlobals : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwFacts : (string, Lowering_dChecks.t_TermUse) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwUnit : string }

# 72 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwEnvShared = (fun (mc0 : t_LwEnv) -> (match mc0 with
  | { f_LwEnv_lwShared = dtb__0; f_LwEnv_lwDatas = dtb__1; f_LwEnv_lwDataTbl = dtb__2; f_LwEnv_lwTyParams = dtb__3; f_LwEnv_lwUnboxedInfo = dtb__4; f_LwEnv_lwRecordFields = dtb__5; f_LwEnv_lwCtors = dtb__6; f_LwEnv_lwOpaques = dtb__7; f_LwEnv_lwUnboxed = dtb__8; f_LwEnv_lwHasListFamily = dtb__9; f_LwEnv_lwDefs = dtb__10; f_LwEnv_lwOrigDefs = dtb__11; f_LwEnv_lwDefTbl = dtb__12; f_LwEnv_lwGlobals = dtb__13; f_LwEnv_lwFacts = dtb__14; f_LwEnv_lwUnit = dtb__15 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 76 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwEnvWithUnit = (fun (mc0 : string) (mc1 : t_LwEnv) -> (match mc1 with
  | { f_LwEnv_lwShared = dtb__16; f_LwEnv_lwDatas = dtb__17; f_LwEnv_lwDataTbl = dtb__18; f_LwEnv_lwTyParams = dtb__19; f_LwEnv_lwUnboxedInfo = dtb__20; f_LwEnv_lwRecordFields = dtb__21; f_LwEnv_lwCtors = dtb__22; f_LwEnv_lwOpaques = dtb__23; f_LwEnv_lwUnboxed = dtb__24; f_LwEnv_lwHasListFamily = dtb__25; f_LwEnv_lwDefs = dtb__26; f_LwEnv_lwOrigDefs = dtb__27; f_LwEnv_lwDefTbl = dtb__28; f_LwEnv_lwGlobals = dtb__29; f_LwEnv_lwFacts = dtb__30; f_LwEnv_lwUnit = dtb__31 } -> { f_LwEnv_lwShared = dtb__16; f_LwEnv_lwDatas = dtb__17; f_LwEnv_lwDataTbl = dtb__18; f_LwEnv_lwTyParams = dtb__19; f_LwEnv_lwUnboxedInfo = dtb__20; f_LwEnv_lwRecordFields = dtb__21; f_LwEnv_lwCtors = dtb__22; f_LwEnv_lwOpaques = dtb__23; f_LwEnv_lwUnboxed = dtb__24; f_LwEnv_lwHasListFamily = dtb__25; f_LwEnv_lwDefs = dtb__26; f_LwEnv_lwOrigDefs = dtb__27; f_LwEnv_lwDefTbl = dtb__28; f_LwEnv_lwGlobals = dtb__29; f_LwEnv_lwFacts = dtb__30; f_LwEnv_lwUnit = mc0 }
  | _ -> failwith "DT: impossible branch"
))

# 98 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_listLength = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__32, dtb__33) -> (1 + (v_listLength dtb__33))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Lowering/Env.vuna"
let v_pushDep = (fun (dep : string) (deps : string B_dData_dList.t_List) -> (if (dep = "") then deps else (if ((B_dData_dList.v_memName dep) deps) then deps else ((B_dData_dList.v_append deps) (B_dData_dList.C_List__x58__x58_ (dep, B_dData_dList.C_List_Nil))))))

# 107 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_mapSome = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__34, dtb__35) -> (match (mc0 dtb__34) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_mapSome mc0) dtb__35)
  | B_dData_dMaybe.C_Maybe_Just (dtb__36) -> (B_dData_dList.C_List__x58__x58_ (dtb__36, ((v_mapSome mc0) dtb__35)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Lowering/Env.vuna"
let v_isTypeHeadOpaqueDatas = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (name : string) -> (if (Base_dIntrinsics.v_isUnboxedCanonical name) then false else (match ((Elab_dRepresentation.v_findDtData name) datas) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__37) -> false
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dBool.v_not (Base_dIntrinsics.v_isTypeConstructorName name))
  | _ -> failwith "DT: impossible branch"
)))

# 125 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_memOpaqueLevel = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (if (dtb__38 = mc0) then true else ((v_memOpaqueLevel mc0) dtb__39))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 137 "Vuna/Compiler/Lowering/Env.vuna"
let v_isRecordData = (fun (d : Elab_dTypes.t_DtData) -> (if (Elab_dTypes.v_dtDataIsRecord d) then (let nd_uscrut1 = (Elab_dTypes.v_dtDataCtors d) in (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__40, dtb__41) -> (match dtb__41 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> false
)) else false))

# 156 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_recordRtFieldsGo = (fun (mc0 : string) (mc1 : bool B_dData_dList.t_List) (mc2 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__42, dtb__43) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__44, dtb__45) -> (if dtb__42 then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb__44).Elab_dTypes.f_DtFieldMeta_dtFieldIndex; B_dData_dPair.f_Pair_second = (dtb__44).Elab_dTypes.f_DtFieldMeta_dtFieldName }, (((v_recordRtFieldsGo mc0) dtb__43) dtb__45))) else (((v_recordRtFieldsGo mc0) dtb__43) dtb__45))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 147 "Vuna/Compiler/Lowering/Env.vuna"
let v_recordRtFields = (fun (d : Elab_dTypes.t_DtData) -> (let nd_uscrut1 = (Elab_dTypes.v_dtDataCtors d) in (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__46, dtb__47) -> (match dtb__47 with
  | B_dData_dList.C_List_Nil -> (let arity = (v_listLength (d).Elab_dTypes.f_DtData_dtDataParams) in (((v_recordRtFieldsGo (Elab_dTypes.v_dtDataName d)) ((B_dData_dList.v_drop arity) (Elab_dRepresentation.v_ctorKeepFlags dtb__46))) (Elab_dTypes.v_dtDataFields d)))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)))

# 166 "Vuna/Compiler/Lowering/Env.vuna"
let v_hasRecordRepr = (fun (d : Elab_dTypes.t_DtData) -> (if (v_isRecordData d) then (match (v_recordRtFields d) with
  | B_dData_dList.C_List_Nil -> false
  | _ -> true
) else false))

# 176 "Vuna/Compiler/Lowering/Env.vuna"
let v_rtDatasOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((B_dData_dList.v_filter (fun (d : Elab_dTypes.t_DtData) -> (B_dData_dBool.v_not (Base_dIntrinsics.v_isUnboxedCanonical (Elab_dTypes.v_dtDataName d))))) datas))

# 184 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_ctorOpaqueGo = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : int) (mc3 : Core_dTerm.t_Value) (mc4 : int B_dData_dList.t_List) (mc5 : bool B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__48, dtb__49) -> (match dtb__48 with
  | { B_dData_dPair.f_Pair_first = dtb__50; B_dData_dPair.f_Pair_second = dtb__51 } -> (match mc3 with
  | Core_dTerm.C_Value_VPi (dtb__52, dtb__53, dtb__54, dtb__55, dtb__56) -> (let flag = (if (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased dtb__51)) then (if (((((Elab_dMeta.v_valueOpaqueScoped (fun (l : int) -> ((v_memOpaqueLevel l) mc4))) (v_isTypeHeadOpaqueDatas mc0)) mc2) mc4) dtb__55) then true else (Elab_dMeta.v_valueHasImplicitPi dtb__55)) else false) in (let fam2 = (if (Elab_dMeta.v_isFamilyKindValue dtb__55) then (B_dData_dList.C_List__x58__x58_ (mc2, mc4)) else mc4) in (let next = ((Core_dEval.v_applyClosure dtb__56) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__52, mc2, B_dData_dList.C_List_Nil))))) in ((((((v_ctorOpaqueGo mc0) dtb__49) (mc2 + 1)) next) fam2) (B_dData_dList.C_List__x58__x58_ (flag, mc5))))))
  | _ -> (B_dData_dList.v_reverse mc5)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc5)
  | _ -> failwith "DT: impossible branch"
))

# 181 "Vuna/Compiler/Lowering/Env.vuna"
let v_ctorOpaqueFlagsOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (c : Elab_dTypes.t_DtCtor) -> ((((((v_ctorOpaqueGo datas) (Elab_dTypes.v_dtCtorTelescope c)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType c))) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 206 "Vuna/Compiler/Lowering/Env.vuna"
let v_locRowPair = (fun (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefSpan d) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__57) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName d); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (dtb__57).Base_dSource.f_Span_spanFile; B_dData_dPair.f_Pair_second = (Base_dSource.v_spanStartLine dtb__57) } }))
  | _ -> failwith "DT: impossible branch"
))

# 222 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_typeParamLevelsGo = (fun (mc0 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__58, dtb__59) -> (if (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf dtb__58)) then (B_dData_dList.C_List__x58__x58_ (mc1, ((v_typeParamLevelsGo dtb__59) (mc1 + 1)))) else ((v_typeParamLevelsGo dtb__59) (mc1 + 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 219 "Vuna/Compiler/Lowering/Env.vuna"
let v_typeParamLevels = (fun (d : Elab_dTypes.t_DtData) -> ((v_typeParamLevelsGo (d).Elab_dTypes.f_DtData_dtDataParams) 0))

# 230 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_memIntIn = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__60, dtb__61) -> (if (dtb__60 = mc0) then true else ((v_memIntIn mc0) dtb__61))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 237 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_levelSlotGoIn = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__62, dtb__63) -> (if (dtb__62 = mc1) then (B_dData_dMaybe.C_Maybe_Just (mc2)) else (((v_levelSlotGoIn dtb__63) mc1) (mc2 + 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 234 "Vuna/Compiler/Lowering/Env.vuna"
let v_levelSlotIn = (fun (levels : int B_dData_dList.t_List) (lvl : int) -> (((v_levelSlotGoIn levels) lvl) 0))

# 241 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_nthValueIn = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__64, dtb__65) -> (if (mc1 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__64)) else ((v_nthValueIn dtb__65) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 245 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_lookupUsedIn = (fun (mc0 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__66, dtb__67) -> (if ((B_dData_dPair.v_firstOf dtb__66) = mc1) then (B_dData_dPair.v_secondOf dtb__66) else ((v_lookupUsedIn dtb__67) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 250 "Vuna/Compiler/Lowering/Env.vuna"
let v_lookupTyParamsIn = (fun (tbl : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__68) -> dtb__68
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 259 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_collectUsedLevelsFuel = (fun (fuel : int) (tps : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (lvl : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match v with
  | Core_dTerm.C_Value_VPi (dtb__69, dtb__70, dtb__71, dtb__72, dtb__73) -> (if dtb__70 then ((((((v_collectUsedLevelsFuel (fuel - 1)) tps) table) datas) (lvl + 1)) ((Core_dEval.v_applyClosure dtb__73) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__69, lvl, B_dData_dList.C_List_Nil)))))) else ((B_dData_dList.v_append ((((((v_collectUsedLevelsFuel (fuel - 1)) tps) table) datas) lvl) dtb__72)) ((((((v_collectUsedLevelsFuel (fuel - 1)) tps) table) datas) (lvl + 1)) ((Core_dEval.v_applyClosure dtb__73) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__69, lvl, B_dData_dList.C_List_Nil))))))))
  | Core_dTerm.C_Value_VNeutral (dtb__74) -> (match dtb__74 with
  | Core_dTerm.C_Neutral_NVar (dtb__75, dtb__76, dtb__77) -> ((B_dData_dList.v_append (if ((v_memIntIn dtb__76) tps) then (B_dData_dList.C_List__x58__x58_ (dtb__76, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)) ((((((v_collectUsedSpineFuel (fuel - 1)) tps) table) datas) lvl) dtb__77))
  | Core_dTerm.C_Neutral_NGlobal (dtb__78, dtb__79) -> (match ((Elab_dRepresentation.v_findDtData dtb__78) datas) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__80) -> (((((((v_collectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) ((v_lookupUsedIn table) dtb__78)) dtb__79)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_collectUsedSpineFuel (fuel - 1)) tps) table) datas) lvl) dtb__79)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dList.C_List_Nil
)))
# 275 "Vuna/Compiler/Lowering/Env.vuna"
and v_collectUsedSpineFuel = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) (mc2 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc4 : int) (mc5 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__81, dtb__82) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append ((((((v_collectUsedLevelsFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__81)) ((((((v_collectUsedSpineFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__82)))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))
# 289 "Vuna/Compiler/Lowering/Env.vuna"
and v_collectFamilyArgsFuel = (fun (fuel : int) (tps : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (lvl : int) (usedPats : int B_dData_dList.t_List) (args : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match usedPats with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__83, dtb__84) -> (match ((v_nthValueIn args) dtb__83) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__85) -> ((B_dData_dList.v_append ((((((v_collectUsedLevelsFuel (fuel - 1)) tps) table) datas) lvl) dtb__85)) (((((((v_collectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) dtb__84) args))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_collectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) dtb__84) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 256 "Vuna/Compiler/Lowering/Env.vuna"
let v_collectUsedLevels = (fun (tps : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (lvl : int) (v : Core_dTerm.t_Value) -> ((((((v_collectUsedLevelsFuel 256) tps) table) datas) lvl) v))

# 285 "Vuna/Compiler/Lowering/Env.vuna"
let v_collectFamilyArgs = (fun (tps : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (lvl : int) (usedPats : int B_dData_dList.t_List) (args : Core_dTerm.t_Value B_dData_dList.t_List) -> (((((((v_collectFamilyArgsFuel 256) tps) table) datas) lvl) usedPats) args))

# 301 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_ctorUsedLevels = (fun (mc0 : int B_dData_dList.t_List) (mc1 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc3 : int B_dData_dList.t_List) (mc4 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : int) (mc6 : Core_dTerm.t_Value) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__86, dtb__87) -> (match dtb__86 with
  | { B_dData_dPair.f_Pair_first = dtb__88; B_dData_dPair.f_Pair_second = dtb__89 } -> (match mc6 with
  | Core_dTerm.C_Value_VPi (dtb__90, dtb__91, dtb__92, dtb__93, dtb__94) -> (let isOpq = (((((Elab_dMeta.v_valueOpaqueScoped (fun (l : int) -> ((v_memOpaqueLevel l) mc3))) (v_isTypeHeadOpaqueDatas mc2)) mc5) mc3) dtb__93) in (let fam2 = (if (Elab_dMeta.v_isFamilyKindValue dtb__93) then (B_dData_dList.C_List__x58__x58_ (mc5, mc3)) else mc3) in (let next = ((Core_dEval.v_applyClosure dtb__94) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__90, mc5, B_dData_dList.C_List_Nil))))) in (if (Core_dTerm.v_rigIsErased dtb__89) then (((((((v_ctorUsedLevels mc0) mc1) mc2) fam2) dtb__87) (mc5 + 1)) next) else (if isOpq then (((((((v_ctorUsedLevels mc0) mc1) mc2) fam2) dtb__87) (mc5 + 1)) next) else ((B_dData_dList.v_append (((((v_collectUsedLevels mc0) mc1) mc2) mc5) dtb__93)) (((((((v_ctorUsedLevels mc0) mc1) mc2) fam2) dtb__87) (mc5 + 1)) next)))))))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 328 "Vuna/Compiler/Lowering/Env.vuna"
let v_dataUsedLevels = (fun (d : Elab_dTypes.t_DtData) (table : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (let raw = ((B_dData_dList.v_concatMap (fun (c : Elab_dTypes.t_DtCtor) -> (((((((v_ctorUsedLevels (v_typeParamLevels d)) table) datas) B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorTelescope c)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType c))))) (Elab_dTypes.v_dtDataCtors d)) in ((B_dData_dList.v_filter (fun (l : int) -> ((v_memIntIn l) raw))) (v_typeParamLevels d))))

# 337 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_levelListEq = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__95, dtb__96) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__97, dtb__98) -> (if (dtb__95 = dtb__97) then ((v_levelListEq dtb__96) dtb__98) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (match mc1 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 342 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_sameLevelTable = (fun (mc0 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__99, dtb__100) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__101, dtb__102) -> (if (if ((B_dData_dPair.v_firstOf dtb__99) = (B_dData_dPair.v_firstOf dtb__101)) then ((v_levelListEq (B_dData_dPair.v_secondOf dtb__99)) (B_dData_dPair.v_secondOf dtb__101)) else false) then ((v_sameLevelTable dtb__100) dtb__102) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (match mc1 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 356 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_usedSlotCount = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__103, dtb__104) -> ((B_dData_dList.v_length (v_typeParamLevels dtb__103)) + (v_usedSlotCount dtb__104))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 353 "Vuna/Compiler/Lowering/Env.vuna"
let v_usedFixRounds = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (1 + (v_usedSlotCount datas)))

# 363 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_usedTableFixFuel = (fun (fuel : int) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then table else (let next = ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName d); B_dData_dPair.f_Pair_second = (((v_dataUsedLevels d) table) datas) })) datas) in (if ((v_sameLevelTable next) table) then next else (((v_usedTableFixFuel (fuel - 1)) datas) next)))))

# 360 "Vuna/Compiler/Lowering/Env.vuna"
let v_usedTableFix = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_usedTableFixFuel (v_usedFixRounds datas)) datas) table))

# 373 "Vuna/Compiler/Lowering/Env.vuna"
let v_tyParamsOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((v_usedTableFix datas) ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName d); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })) datas)))

# 376 "Vuna/Compiler/Lowering/Env.vuna"
let v_recordFieldsOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName d); B_dData_dPair.f_Pair_second = (v_recordRtFields d) })) ((B_dData_dList.v_filter v_hasRecordRepr) ((B_dData_dList.v_filter (fun (d : Elab_dTypes.t_DtData) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName (Elab_dTypes.v_dtDataName d)) (Elab_dRepresentation.v_unboxedFamilySet datas))))) datas))))

# 384 "Vuna/Compiler/Lowering/Env.vuna"
let v_floatRenderRefName = "Base.Data.Float.floatRender"

# 414 "Vuna/Compiler/Lowering/Env.vuna"
let v_unboxedRowOf = (fun (mc0 : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__105; B_dData_dPair.f_Pair_second = dtb__106 } -> (match dtb__106 with
  | { B_dData_dPair.f_Pair_first = dtb__107; B_dData_dPair.f_Pair_second = dtb__108 } -> { B_dData_dPair.f_Pair_first = dtb__105; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName dtb__107); B_dData_dPair.f_Pair_second = dtb__108 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 423 "Vuna/Compiler/Lowering/Env.vuna"
let v_lookupFacts = (fun (facts : (string, Lowering_dChecks.t_TermUse) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) facts) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__109) -> dtb__109
  | B_dData_dMaybe.C_Maybe_Nothing -> { Lowering_dChecks.f_TermUse_termUseDeps = B_dData_dList.C_List_Nil; Lowering_dChecks.f_TermUse_termUseFlags = Lowering_dChecks.v_noUseFlags; Lowering_dChecks.f_TermUse_termUseFloatLit = false }
  | _ -> failwith "DT: impossible branch"
))

# 392 "Vuna/Compiler/Lowering/Env.vuna"
let v_factsOf = (fun (env : t_LwEnv) (name : string) -> ((v_lookupFacts (env).f_LwEnv_lwFacts) name))

# 388 "Vuna/Compiler/Lowering/Env.vuna"
let v_factsDepsOf = (fun (env : t_LwEnv) (name : string) -> ((B_dData_dList.v_map (fun (d : string) -> (if (d = "strFromFloat") then v_floatRenderRefName else d))) (((v_factsOf env) name)).Lowering_dChecks.f_TermUse_termUseDeps))

# 418 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_anyDefFlag = (fun (mc0 : (Lowering_dChecks.t_TermUse) -> bool) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (mc2 : (string, Lowering_dChecks.t_TermUse) B_dContainer_dHashMap.t_HashMap) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__110, dtb__111) -> (if (mc0 ((v_lookupFacts mc2) (Elab_dTypes.v_dtDefName dtb__110))) then true else (((v_anyDefFlag mc0) dtb__111) mc2))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 441 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_findFamilyCtor = (fun (mc0 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__112, dtb__113) -> (if ((Base_dIntrinsics.v_ctorSpellingKey (Elab_dTypes.v_dtCtorName dtb__112)) = (Base_dIntrinsics.v_ctorSpellingKey mc1)) then (B_dData_dMaybe.C_Maybe_Just (dtb__112)) else ((v_findFamilyCtor dtb__113) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 449 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_findListFamilyData = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__114, dtb__115) -> (if ((Elab_dTypes.v_dtDataName dtb__114) = Base_dIntrinsics.v_listFamilyName) then (B_dData_dMaybe.C_Maybe_Just (dtb__114)) else (v_findListFamilyData dtb__115))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 429 "Vuna/Compiler/Lowering/Env.vuna"
let v_listFamOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match (v_findListFamilyData datas) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__116) -> (match ((v_findFamilyCtor (Elab_dTypes.v_dtDataCtors dtb__116)) Base_dIntrinsics.v_listNilCtor) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__117) -> (match ((v_findFamilyCtor (Elab_dTypes.v_dtDataCtors dtb__116)) Base_dIntrinsics.v_listConsCtor) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__118) -> (B_dData_dMaybe.C_Maybe_Just ({ Vuna_dIr_dModel.f_IrListFam_irListFamily = (Elab_dTypes.v_dtDataName dtb__116); Vuna_dIr_dModel.f_IrListFam_irListNil = (Elab_dTypes.v_dtCtorName dtb__117); Vuna_dIr_dModel.f_IrListFam_irListCons = (Elab_dTypes.v_dtCtorName dtb__118) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 454 "Vuna/Compiler/Lowering/Env.vuna"
let v_ctorTableOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap (fun (d : Elab_dTypes.t_DtData) -> ((B_dData_dList.v_map (fun (c : Elab_dTypes.t_DtCtor) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName c); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorFamily c); B_dData_dPair.f_Pair_second = (Elab_dRepresentation.v_ctorKeepFlags c) } })) (Elab_dTypes.v_dtDataCtors d)))) datas))

# 398 "Vuna/Compiler/Lowering/Env.vuna"
let v_lowerSharedOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (facts : (string, Lowering_dChecks.t_TermUse) B_dContainer_dHashMap.t_HashMap) -> (let runtime = (v_rtDatasOf datas) in (let locRows = ((v_mapSome v_locRowPair) defs) in { Vuna_dIr_dModel.f_IrShared_irSharedRecordFields = (v_recordFieldsOf runtime); Vuna_dIr_dModel.f_IrShared_irSharedListFam = (v_listFamOf runtime); Vuna_dIr_dModel.f_IrShared_irSharedUsesFloat = (((v_anyDefFlag (fun (f : Lowering_dChecks.t_TermUse) -> (if ((f).Lowering_dChecks.f_TermUse_termUseFlags).Lowering_dChecks.f_UseFlags_useFlagsFloat then true else (f).Lowering_dChecks.f_TermUse_termUseFloatLit))) defs) facts); Vuna_dIr_dModel.f_IrShared_irSharedUsesTrace = (((v_anyDefFlag (fun (f : Lowering_dChecks.t_TermUse) -> ((f).Lowering_dChecks.f_TermUse_termUseFlags).Lowering_dChecks.f_UseFlags_useFlagsTrace)) defs) facts); Vuna_dIr_dModel.f_IrShared_irSharedUsesObs = (((v_anyDefFlag (fun (f : Lowering_dChecks.t_TermUse) -> ((f).Lowering_dChecks.f_TermUse_termUseFlags).Lowering_dChecks.f_UseFlags_useFlagsObs)) defs) facts); Vuna_dIr_dModel.f_IrShared_irSharedDefLocs = locRows; Vuna_dIr_dModel.f_IrShared_irSharedUnboxed = ((B_dData_dList.v_map v_unboxedRowOf) (Elab_dRepresentation.v_unboxedInfoOf runtime)); Vuna_dIr_dModel.f_IrShared_irSharedCtorShapes = (v_ctorTableOf runtime) })))

# 460 "Vuna/Compiler/Lowering/Env.vuna"
let v_ctorOpaqueTableOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap (fun (d : Elab_dTypes.t_DtData) -> ((B_dData_dList.v_map (fun (c : Elab_dTypes.t_DtCtor) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName c); B_dData_dPair.f_Pair_second = ((v_ctorOpaqueFlagsOf datas) c) })) (Elab_dTypes.v_dtDataCtors d)))) datas))

# 480 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_eraseDefsGo = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (mc2 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__119, dtb__120) -> (match dtb__119 with
  | Elab_dTypes.C_DtDef_DtDef (dtb__121, dtb__122, dtb__123, dtb__124) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__121) mc0) then ((Base_dCommon.v_bind (Lowering_dErased.v_eraseTerm dtb__123)) (fun (body2 : Core_dTerm.t_Term) -> (((v_eraseDefsGo mc0) dtb__120) (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.C_DtDef_DtDef (dtb__121, dtb__122, body2, dtb__124)), mc2))))) else (((v_eraseDefsGo mc0) dtb__120) (B_dData_dList.C_List__x58__x58_ (dtb__119, mc2))))
  | _ -> (((v_eraseDefsGo mc0) dtb__120) (B_dData_dList.C_List__x58__x58_ (dtb__119, mc2)))
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse mc2)))
  | _ -> failwith "DT: impossible branch"
))

# 473 "Vuna/Compiler/Lowering/Env.vuna"
let v_eraseDefs = (fun (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let runtimeNames = ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) (B_dData_dPair.v_firstOf ((Lowering_dChecks.v_partitionDefs (Lowering_dChecks.v_defTable defs)) defs))) in (let runtimeTbl = ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = true })) runtimeNames)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) in (((v_eraseDefsGo runtimeTbl) defs) B_dData_dList.C_List_Nil))))

# 534 "Vuna/Compiler/Lowering/Env.vuna"
let v_intrinsicUseFlagsTbl = ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = { Lowering_dChecks.f_UseFlags_useFlagsFloat = true; Lowering_dChecks.f_UseFlags_useFlagsTrace = false; Lowering_dChecks.f_UseFlags_useFlagsObs = false } })) Base_dIntrinsics.v_floatIntrinsicNames)) ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = { Lowering_dChecks.f_UseFlags_useFlagsFloat = false; Lowering_dChecks.f_UseFlags_useFlagsTrace = true; Lowering_dChecks.f_UseFlags_useFlagsObs = false } })) Base_dIntrinsics.v_logIntrinsicNames)) ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = { Lowering_dChecks.f_UseFlags_useFlagsFloat = false; Lowering_dChecks.f_UseFlags_useFlagsTrace = false; Lowering_dChecks.f_UseFlags_useFlagsObs = true } })) Base_dIntrinsics.v_obsIntrinsicNames)))) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil))

# 540 "Vuna/Compiler/Lowering/Env.vuna"
let v_useFlagsOfName = (fun (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) v_intrinsicUseFlagsTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__125) -> dtb__125
  | B_dData_dMaybe.C_Maybe_Nothing -> Lowering_dChecks.v_noUseFlags
  | _ -> failwith "DT: impossible branch"
))

# 527 "Vuna/Compiler/Lowering/Env.vuna"
let v_defFactsOf = (fun (names : (string, bool) B_dContainer_dHashMap.t_HashMap) (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefBody d) with
  | B_dData_dMaybe.C_Maybe_Nothing -> { Lowering_dChecks.f_TermUse_termUseDeps = B_dData_dList.C_List_Nil; Lowering_dChecks.f_TermUse_termUseFlags = Lowering_dChecks.v_noUseFlags; Lowering_dChecks.f_TermUse_termUseFloatLit = false }
  | B_dData_dMaybe.C_Maybe_Just (dtb__126) -> (((Lowering_dChecks.v_termUseInto names) v_useFlagsOfName) dtb__126)
  | _ -> failwith "DT: impossible branch"
))

# 547 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_defTblOf = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__127, dtb__128) -> (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Elab_dTypes.v_dtDefName dtb__127)) dtb__127) (v_defTblOf dtb__128))
  | B_dData_dList.C_List_Nil -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 552 "Vuna/Compiler/Lowering/Env.vuna"
let v_strTblOf = (fun pairs -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) pairs) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 556 "Vuna/Compiler/Lowering/Env.vuna"
let v_dataTblOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName d); B_dData_dPair.f_Pair_second = d })) datas)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 560 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_hasDataNamed = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__129, dtb__130) -> (if ((Elab_dTypes.v_dtDataName dtb__129) = mc0) then true else ((v_hasDataNamed mc0) dtb__130))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 564 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_nameSetOf = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__131, dtb__132) -> (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__131) true) (v_nameSetOf dtb__132))
  | B_dData_dList.C_List_Nil -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 519 "Vuna/Compiler/Lowering/Env.vuna"
let v_defFactsTblOf = (fun (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let names = (v_nameSetOf (B_dData_dList.C_List__x58__x58_ ("strFromFloat", (Lowering_dChecks.v_runtimeNamesOf defs)))) in ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtDef) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName d); B_dData_dPair.f_Pair_second = ((v_defFactsOf names) d) })) defs)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil))))

# 494 "Vuna/Compiler/Lowering/Env.vuna"
let v_mkLwEnvFromErased = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (origDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (unit : string) -> (let facts = (v_defFactsTblOf defs) in (let shared = (((v_lowerSharedOf datas) defs) facts) in (let runtime = (v_rtDatasOf datas) in { f_LwEnv_lwShared = shared; f_LwEnv_lwDatas = runtime; f_LwEnv_lwDataTbl = (v_dataTblOf runtime); f_LwEnv_lwTyParams = (v_strTblOf (v_tyParamsOf runtime)); f_LwEnv_lwUnboxedInfo = (Elab_dRepresentation.v_unboxedInfoOf runtime); f_LwEnv_lwRecordFields = (v_strTblOf (shared).Vuna_dIr_dModel.f_IrShared_irSharedRecordFields); f_LwEnv_lwCtors = (v_strTblOf (v_ctorTableOf runtime)); f_LwEnv_lwOpaques = (v_strTblOf (v_ctorOpaqueTableOf runtime)); f_LwEnv_lwUnboxed = (B_dContainer_dHashMap.v_ofNames (Elab_dRepresentation.v_unboxedFamilySet runtime)); f_LwEnv_lwHasListFamily = ((v_hasDataNamed Base_dIntrinsics.v_listFamilyName) datas); f_LwEnv_lwDefs = defs; f_LwEnv_lwOrigDefs = origDefs; f_LwEnv_lwDefTbl = (v_defTblOf defs); f_LwEnv_lwGlobals = (v_strTblOf globals); f_LwEnv_lwFacts = facts; f_LwEnv_lwUnit = unit }))))

# 465 "Vuna/Compiler/Lowering/Env.vuna"
let v_mkLwEnv = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (unit : string) -> ((Base_dCommon.v_bind (v_eraseDefs defs)) (fun (defs2 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((((((v_mkLwEnvFromErased datas) defs2) defs) globals) unit))))))
