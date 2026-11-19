open Vuna_runtime
type t_LwEnv = { f_LwEnv_lwShared : Ir_dModel.t_IrShared; f_LwEnv_lwDatas : Elab_dTypes.t_DtData B_dData_dList.t_List; f_LwEnv_lwTyParams : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwUnboxedInfo : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List; f_LwEnv_lwRecordFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwCtors : (string, (string, bool B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwOpaques : (string, bool B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwUnboxed : (string, bool) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwHasListFamily : bool; f_LwEnv_lwDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List; f_LwEnv_lwDefTbl : (string, Elab_dTypes.t_DtDef) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwGlobals : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwFacts : (string, Lowering_dChecks.t_TermUse) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwUnit : string }

# 65 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwEnvShared = (fun (mc0 : t_LwEnv) -> (match mc0 with
  | { f_LwEnv_lwShared = dtb__0; f_LwEnv_lwDatas = dtb__1; f_LwEnv_lwTyParams = dtb__2; f_LwEnv_lwUnboxedInfo = dtb__3; f_LwEnv_lwRecordFields = dtb__4; f_LwEnv_lwCtors = dtb__5; f_LwEnv_lwOpaques = dtb__6; f_LwEnv_lwUnboxed = dtb__7; f_LwEnv_lwHasListFamily = dtb__8; f_LwEnv_lwDefs = dtb__9; f_LwEnv_lwDefTbl = dtb__10; f_LwEnv_lwGlobals = dtb__11; f_LwEnv_lwFacts = dtb__12; f_LwEnv_lwUnit = dtb__13 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwEnvWithUnit = (fun (mc0 : string) (mc1 : t_LwEnv) -> (match mc1 with
  | { f_LwEnv_lwShared = dtb__14; f_LwEnv_lwDatas = dtb__15; f_LwEnv_lwTyParams = dtb__16; f_LwEnv_lwUnboxedInfo = dtb__17; f_LwEnv_lwRecordFields = dtb__18; f_LwEnv_lwCtors = dtb__19; f_LwEnv_lwOpaques = dtb__20; f_LwEnv_lwUnboxed = dtb__21; f_LwEnv_lwHasListFamily = dtb__22; f_LwEnv_lwDefs = dtb__23; f_LwEnv_lwDefTbl = dtb__24; f_LwEnv_lwGlobals = dtb__25; f_LwEnv_lwFacts = dtb__26; f_LwEnv_lwUnit = dtb__27 } -> { f_LwEnv_lwShared = dtb__14; f_LwEnv_lwDatas = dtb__15; f_LwEnv_lwTyParams = dtb__16; f_LwEnv_lwUnboxedInfo = dtb__17; f_LwEnv_lwRecordFields = dtb__18; f_LwEnv_lwCtors = dtb__19; f_LwEnv_lwOpaques = dtb__20; f_LwEnv_lwUnboxed = dtb__21; f_LwEnv_lwHasListFamily = dtb__22; f_LwEnv_lwDefs = dtb__23; f_LwEnv_lwDefTbl = dtb__24; f_LwEnv_lwGlobals = dtb__25; f_LwEnv_lwFacts = dtb__26; f_LwEnv_lwUnit = mc0 }
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_listLength = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__28, dtb__29) -> (1 + (v_listLength dtb__29))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Lowering/Env.vuna"
let v_pushDep = (fun (dep : string) (deps : string B_dData_dList.t_List) -> (if (dep = "") then deps else (if ((B_dData_dList.v_memName dep) deps) then deps else ((B_dData_dList.v_append deps) (B_dData_dList.C_List__x58__x58_ (dep, B_dData_dList.C_List_Nil))))))

# 84 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_mapSome = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__30, dtb__31) -> (match (mc0 dtb__30) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_mapSome mc0) dtb__31)
  | B_dData_dMaybe.C_Maybe_Just (dtb__32) -> (B_dData_dList.C_List__x58__x58_ (dtb__32, ((v_mapSome mc0) dtb__31)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 93 "Vuna/Compiler/Lowering/Env.vuna"
let v_isTypeHeadOpaqueDatas = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (name : string) -> (if (Base_dIntrinsics.v_isUnboxedCanonical name) then false else (match ((Elab_dRepresentation.v_findDtData name) datas) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__33) -> false
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dBool.v_not (Base_dIntrinsics.v_isTypeConstructorName name))
  | _ -> failwith "DT: impossible branch"
)))

# 102 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_memOpaqueLevel = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__34, dtb__35) -> (if (dtb__34 = mc0) then true else ((v_memOpaqueLevel mc0) dtb__35))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 114 "Vuna/Compiler/Lowering/Env.vuna"
let v_isRecordData = (fun (d : Elab_dTypes.t_DtData) -> (if (Elab_dTypes.v_dtDataIsRecord d) then ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> (match dtb__37 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> false
)) (Elab_dTypes.v_dtDataCtors d)) else false))

# 133 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_recordRtFieldsGo = (fun (mc0 : string) (mc1 : bool B_dData_dList.t_List) (mc2 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__40, dtb__41) -> (if dtb__38 then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb__40).Elab_dTypes.f_DtFieldMeta_dtFieldIndex; B_dData_dPair.f_Pair_second = (dtb__40).Elab_dTypes.f_DtFieldMeta_dtFieldName }, (((v_recordRtFieldsGo mc0) dtb__39) dtb__41))) else (((v_recordRtFieldsGo mc0) dtb__39) dtb__41))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 124 "Vuna/Compiler/Lowering/Env.vuna"
let v_recordRtFields = (fun (d : Elab_dTypes.t_DtData) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__42, dtb__43) -> (match dtb__43 with
  | B_dData_dList.C_List_Nil -> ((fun arity -> (((v_recordRtFieldsGo (Elab_dTypes.v_dtDataName d)) ((B_dData_dList.v_drop arity) (Elab_dRepresentation.v_ctorKeepFlags dtb__42))) (Elab_dTypes.v_dtDataFields d))) (v_listLength (d).Elab_dTypes.f_DtData_dtDataParams))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)) (Elab_dTypes.v_dtDataCtors d)))

# 143 "Vuna/Compiler/Lowering/Env.vuna"
let v_hasRecordRepr = (fun (d : Elab_dTypes.t_DtData) -> (if (v_isRecordData d) then (match (v_recordRtFields d) with
  | B_dData_dList.C_List_Nil -> false
  | _ -> true
) else false))

# 153 "Vuna/Compiler/Lowering/Env.vuna"
let v_rtDatasOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((B_dData_dList.v_filter (fun (d : Elab_dTypes.t_DtData) -> (B_dData_dBool.v_not (Base_dIntrinsics.v_isUnboxedCanonical (Elab_dTypes.v_dtDataName d))))) datas))

# 161 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_ctorOpaqueGo = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : int) (mc3 : Core_dTerm.t_Value) (mc4 : int B_dData_dList.t_List) (mc5 : bool B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__44, dtb__45) -> (match dtb__44 with
  | { B_dData_dPair.f_Pair_first = dtb__46; B_dData_dPair.f_Pair_second = dtb__47 } -> (match mc3 with
  | Core_dTerm.C_Value_VPi (dtb__48, dtb__49, dtb__50, dtb__51, dtb__52) -> ((fun flag -> ((fun fam2 -> ((fun next -> ((((((v_ctorOpaqueGo mc0) dtb__45) (mc2 + 1)) next) fam2) (B_dData_dList.C_List__x58__x58_ (flag, mc5)))) ((Core_dEval.v_applyClosure dtb__52) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__48, mc2, B_dData_dList.C_List_Nil))))))) (if (Elab_dMeta.v_isFamilyKindValue dtb__51) then (B_dData_dList.C_List__x58__x58_ (mc2, mc4)) else mc4))) (if (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased dtb__47)) then (if (((((Elab_dMeta.v_valueOpaqueScoped (fun (l : int) -> ((v_memOpaqueLevel l) mc4))) (v_isTypeHeadOpaqueDatas mc0)) mc2) mc4) dtb__51) then true else (Elab_dMeta.v_valueHasImplicitPi dtb__51)) else false))
  | _ -> (B_dData_dList.v_reverse mc5)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc5)
  | _ -> failwith "DT: impossible branch"
))

# 158 "Vuna/Compiler/Lowering/Env.vuna"
let v_ctorOpaqueFlagsOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (c : Elab_dTypes.t_DtCtor) -> ((((((v_ctorOpaqueGo datas) (Elab_dTypes.v_dtCtorTelescope c)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType c))) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 183 "Vuna/Compiler/Lowering/Env.vuna"
let v_locRowPair = (fun (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefSpan d) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__53) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName d); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (dtb__53).Base_dSource.f_Span_spanFile; B_dData_dPair.f_Pair_second = (Base_dSource.v_spanStartLine dtb__53) } }))
  | _ -> failwith "DT: impossible branch"
))

# 199 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_typeParamLevelsGo = (fun (mc0 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__54, dtb__55) -> (if (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf dtb__54)) then (B_dData_dList.C_List__x58__x58_ (mc1, ((v_typeParamLevelsGo dtb__55) (mc1 + 1)))) else ((v_typeParamLevelsGo dtb__55) (mc1 + 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 196 "Vuna/Compiler/Lowering/Env.vuna"
let v_typeParamLevels = (fun (d : Elab_dTypes.t_DtData) -> ((v_typeParamLevelsGo (d).Elab_dTypes.f_DtData_dtDataParams) 0))

# 207 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_memIntIn = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__56, dtb__57) -> (if (dtb__56 = mc0) then true else ((v_memIntIn mc0) dtb__57))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 214 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_levelSlotGoIn = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__58, dtb__59) -> (if (dtb__58 = mc1) then (B_dData_dMaybe.C_Maybe_Just (mc2)) else (((v_levelSlotGoIn dtb__59) mc1) (mc2 + 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 211 "Vuna/Compiler/Lowering/Env.vuna"
let v_levelSlotIn = (fun (levels : int B_dData_dList.t_List) (lvl : int) -> (((v_levelSlotGoIn levels) lvl) 0))

# 218 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_nthValueIn = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__60, dtb__61) -> (if (mc1 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__60)) else ((v_nthValueIn dtb__61) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 222 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_lookupUsedIn = (fun (mc0 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__62, dtb__63) -> (if ((B_dData_dPair.v_firstOf dtb__62) = mc1) then (B_dData_dPair.v_secondOf dtb__62) else ((v_lookupUsedIn dtb__63) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 227 "Vuna/Compiler/Lowering/Env.vuna"
let v_lookupTyParamsIn = (fun (tbl : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__64) -> dtb__64
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_collectUsedLevelsFuel = (fun (fuel : int) (tps : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (lvl : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match v with
  | Core_dTerm.C_Value_VPi (dtb__65, dtb__66, dtb__67, dtb__68, dtb__69) -> (if dtb__66 then ((((((v_collectUsedLevelsFuel (fuel - 1)) tps) table) datas) (lvl + 1)) ((Core_dEval.v_applyClosure dtb__69) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__65, lvl, B_dData_dList.C_List_Nil)))))) else ((B_dData_dList.v_append ((((((v_collectUsedLevelsFuel (fuel - 1)) tps) table) datas) lvl) dtb__68)) ((((((v_collectUsedLevelsFuel (fuel - 1)) tps) table) datas) (lvl + 1)) ((Core_dEval.v_applyClosure dtb__69) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__65, lvl, B_dData_dList.C_List_Nil))))))))
  | Core_dTerm.C_Value_VNeutral (dtb__70) -> (match dtb__70 with
  | Core_dTerm.C_Neutral_NVar (dtb__71, dtb__72, dtb__73) -> ((B_dData_dList.v_append (if ((v_memIntIn dtb__72) tps) then (B_dData_dList.C_List__x58__x58_ (dtb__72, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)) ((((((v_collectUsedSpineFuel (fuel - 1)) tps) table) datas) lvl) dtb__73))
  | Core_dTerm.C_Neutral_NGlobal (dtb__74, dtb__75) -> (match ((Elab_dRepresentation.v_findDtData dtb__74) datas) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__76) -> (((((((v_collectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) ((v_lookupUsedIn table) dtb__74)) dtb__75)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_collectUsedSpineFuel (fuel - 1)) tps) table) datas) lvl) dtb__75)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dList.C_List_Nil
)))
# 252 "Vuna/Compiler/Lowering/Env.vuna"
and v_collectUsedSpineFuel = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) (mc2 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc4 : int) (mc5 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__77, dtb__78) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append ((((((v_collectUsedLevelsFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__77)) ((((((v_collectUsedSpineFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__78)))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))
# 266 "Vuna/Compiler/Lowering/Env.vuna"
and v_collectFamilyArgsFuel = (fun (fuel : int) (tps : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (lvl : int) (usedPats : int B_dData_dList.t_List) (args : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match usedPats with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__79, dtb__80) -> (match ((v_nthValueIn args) dtb__79) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__81) -> ((B_dData_dList.v_append ((((((v_collectUsedLevelsFuel (fuel - 1)) tps) table) datas) lvl) dtb__81)) (((((((v_collectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) dtb__80) args))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_collectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) dtb__80) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 233 "Vuna/Compiler/Lowering/Env.vuna"
let v_collectUsedLevels = (fun (tps : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (lvl : int) (v : Core_dTerm.t_Value) -> ((((((v_collectUsedLevelsFuel 256) tps) table) datas) lvl) v))

# 262 "Vuna/Compiler/Lowering/Env.vuna"
let v_collectFamilyArgs = (fun (tps : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (lvl : int) (usedPats : int B_dData_dList.t_List) (args : Core_dTerm.t_Value B_dData_dList.t_List) -> (((((((v_collectFamilyArgsFuel 256) tps) table) datas) lvl) usedPats) args))

# 278 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_ctorUsedLevels = (fun (mc0 : int B_dData_dList.t_List) (mc1 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc3 : int B_dData_dList.t_List) (mc4 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc5 : int) (mc6 : Core_dTerm.t_Value) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__82, dtb__83) -> (match dtb__82 with
  | { B_dData_dPair.f_Pair_first = dtb__84; B_dData_dPair.f_Pair_second = dtb__85 } -> (match mc6 with
  | Core_dTerm.C_Value_VPi (dtb__86, dtb__87, dtb__88, dtb__89, dtb__90) -> ((fun isOpq -> ((fun fam2 -> ((fun next -> (if (Core_dTerm.v_rigIsErased dtb__85) then (((((((v_ctorUsedLevels mc0) mc1) mc2) fam2) dtb__83) (mc5 + 1)) next) else (if isOpq then (((((((v_ctorUsedLevels mc0) mc1) mc2) fam2) dtb__83) (mc5 + 1)) next) else ((B_dData_dList.v_append (((((v_collectUsedLevels mc0) mc1) mc2) mc5) dtb__89)) (((((((v_ctorUsedLevels mc0) mc1) mc2) fam2) dtb__83) (mc5 + 1)) next))))) ((Core_dEval.v_applyClosure dtb__90) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__86, mc5, B_dData_dList.C_List_Nil))))))) (if (Elab_dMeta.v_isFamilyKindValue dtb__89) then (B_dData_dList.C_List__x58__x58_ (mc5, mc3)) else mc3))) (((((Elab_dMeta.v_valueOpaqueScoped (fun (l : int) -> ((v_memOpaqueLevel l) mc3))) (v_isTypeHeadOpaqueDatas mc2)) mc5) mc3) dtb__89))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 305 "Vuna/Compiler/Lowering/Env.vuna"
let v_dataUsedLevels = (fun (d : Elab_dTypes.t_DtData) (table : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((fun raw -> ((B_dData_dList.v_filter (fun (l : int) -> ((v_memIntIn l) raw))) (v_typeParamLevels d))) ((B_dData_dList.v_concatMap (fun (c : Elab_dTypes.t_DtCtor) -> (((((((v_ctorUsedLevels (v_typeParamLevels d)) table) datas) B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorTelescope c)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType c))))) (Elab_dTypes.v_dtDataCtors d))))

# 314 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_levelListEq = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__91, dtb__92) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__93, dtb__94) -> (if (dtb__91 = dtb__93) then ((v_levelListEq dtb__92) dtb__94) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (match mc1 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 319 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_sameLevelTable = (fun (mc0 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__95, dtb__96) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__97, dtb__98) -> (if (if ((B_dData_dPair.v_firstOf dtb__95) = (B_dData_dPair.v_firstOf dtb__97)) then ((v_levelListEq (B_dData_dPair.v_secondOf dtb__95)) (B_dData_dPair.v_secondOf dtb__97)) else false) then ((v_sameLevelTable dtb__96) dtb__98) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (match mc1 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 333 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_usedSlotCount = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__99, dtb__100) -> ((B_dData_dList.v_length (v_typeParamLevels dtb__99)) + (v_usedSlotCount dtb__100))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 330 "Vuna/Compiler/Lowering/Env.vuna"
let v_usedFixRounds = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (1 + (v_usedSlotCount datas)))

# 340 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_usedTableFixFuel = (fun (fuel : int) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then table else ((fun next -> (if ((v_sameLevelTable next) table) then next else (((v_usedTableFixFuel (fuel - 1)) datas) next))) ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName d); B_dData_dPair.f_Pair_second = (((v_dataUsedLevels d) table) datas) })) datas))))

# 337 "Vuna/Compiler/Lowering/Env.vuna"
let v_usedTableFix = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_usedTableFixFuel (v_usedFixRounds datas)) datas) table))

# 350 "Vuna/Compiler/Lowering/Env.vuna"
let v_tyParamsOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((v_usedTableFix datas) ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName d); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })) datas)))

# 353 "Vuna/Compiler/Lowering/Env.vuna"
let v_recordFieldsOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName d); B_dData_dPair.f_Pair_second = (v_recordRtFields d) })) ((B_dData_dList.v_filter v_hasRecordRepr) ((B_dData_dList.v_filter (fun (d : Elab_dTypes.t_DtData) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName (Elab_dTypes.v_dtDataName d)) (Elab_dRepresentation.v_unboxedFamilySet datas))))) datas))))

# 361 "Vuna/Compiler/Lowering/Env.vuna"
let v_floatRenderRefName = "Base.Data.Float.floatRender"

# 391 "Vuna/Compiler/Lowering/Env.vuna"
let v_unboxedRowOf = (fun (mc0 : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__101; B_dData_dPair.f_Pair_second = dtb__102 } -> (match dtb__102 with
  | { B_dData_dPair.f_Pair_first = dtb__103; B_dData_dPair.f_Pair_second = dtb__104 } -> { B_dData_dPair.f_Pair_first = dtb__101; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName dtb__103); B_dData_dPair.f_Pair_second = dtb__104 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 400 "Vuna/Compiler/Lowering/Env.vuna"
let v_lookupFacts = (fun (facts : (string, Lowering_dChecks.t_TermUse) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) facts) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__105) -> dtb__105
  | B_dData_dMaybe.C_Maybe_Nothing -> { Lowering_dChecks.f_TermUse_termUseDeps = B_dData_dList.C_List_Nil; Lowering_dChecks.f_TermUse_termUseFlags = Lowering_dChecks.v_noUseFlags; Lowering_dChecks.f_TermUse_termUseFloatLit = false }
  | _ -> failwith "DT: impossible branch"
))

# 369 "Vuna/Compiler/Lowering/Env.vuna"
let v_factsOf = (fun (env : t_LwEnv) (name : string) -> ((v_lookupFacts (env).f_LwEnv_lwFacts) name))

# 365 "Vuna/Compiler/Lowering/Env.vuna"
let v_factsDepsOf = (fun (env : t_LwEnv) (name : string) -> ((B_dData_dList.v_map (fun (d : string) -> (if (d = "strFromFloat") then v_floatRenderRefName else d))) (((v_factsOf env) name)).Lowering_dChecks.f_TermUse_termUseDeps))

# 395 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_anyDefFlag = (fun (mc0 : (Lowering_dChecks.t_TermUse) -> bool) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (mc2 : (string, Lowering_dChecks.t_TermUse) B_dContainer_dHashMap.t_HashMap) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__106, dtb__107) -> (if (mc0 ((v_lookupFacts mc2) (Elab_dTypes.v_dtDefName dtb__106))) then true else (((v_anyDefFlag mc0) dtb__107) mc2))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 418 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_findFamilyCtor = (fun (mc0 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__108, dtb__109) -> (if ((Base_dIntrinsics.v_ctorSpellingKey (Elab_dTypes.v_dtCtorName dtb__108)) = (Base_dIntrinsics.v_ctorSpellingKey mc1)) then (B_dData_dMaybe.C_Maybe_Just (dtb__108)) else ((v_findFamilyCtor dtb__109) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 426 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_findListFamilyData = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__110, dtb__111) -> (if ((Elab_dTypes.v_dtDataName dtb__110) = Base_dIntrinsics.v_listFamilyName) then (B_dData_dMaybe.C_Maybe_Just (dtb__110)) else (v_findListFamilyData dtb__111))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 406 "Vuna/Compiler/Lowering/Env.vuna"
let v_listFamOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match (v_findListFamilyData datas) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__112) -> (match ((v_findFamilyCtor (Elab_dTypes.v_dtDataCtors dtb__112)) Base_dIntrinsics.v_listNilCtor) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__113) -> (match ((v_findFamilyCtor (Elab_dTypes.v_dtDataCtors dtb__112)) Base_dIntrinsics.v_listConsCtor) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__114) -> (B_dData_dMaybe.C_Maybe_Just ({ Ir_dModel.f_IrListFam_irListFamily = (Elab_dTypes.v_dtDataName dtb__112); Ir_dModel.f_IrListFam_irListNil = (Elab_dTypes.v_dtCtorName dtb__113); Ir_dModel.f_IrListFam_irListCons = (Elab_dTypes.v_dtCtorName dtb__114) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 431 "Vuna/Compiler/Lowering/Env.vuna"
let v_ctorTableOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap (fun (d : Elab_dTypes.t_DtData) -> ((B_dData_dList.v_map (fun (c : Elab_dTypes.t_DtCtor) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName c); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorFamily c); B_dData_dPair.f_Pair_second = (Elab_dRepresentation.v_ctorKeepFlags c) } })) (Elab_dTypes.v_dtDataCtors d)))) datas))

# 375 "Vuna/Compiler/Lowering/Env.vuna"
let v_lowerSharedOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (facts : (string, Lowering_dChecks.t_TermUse) B_dContainer_dHashMap.t_HashMap) -> ((fun runtime -> ((fun locRows -> { Ir_dModel.f_IrShared_irSharedRecordFields = (v_recordFieldsOf runtime); Ir_dModel.f_IrShared_irSharedListFam = (v_listFamOf runtime); Ir_dModel.f_IrShared_irSharedUsesFloat = (((v_anyDefFlag (fun (f : Lowering_dChecks.t_TermUse) -> (if ((f).Lowering_dChecks.f_TermUse_termUseFlags).Lowering_dChecks.f_UseFlags_useFlagsFloat then true else (f).Lowering_dChecks.f_TermUse_termUseFloatLit))) defs) facts); Ir_dModel.f_IrShared_irSharedUsesTrace = (((v_anyDefFlag (fun (f : Lowering_dChecks.t_TermUse) -> ((f).Lowering_dChecks.f_TermUse_termUseFlags).Lowering_dChecks.f_UseFlags_useFlagsTrace)) defs) facts); Ir_dModel.f_IrShared_irSharedUsesObs = (((v_anyDefFlag (fun (f : Lowering_dChecks.t_TermUse) -> ((f).Lowering_dChecks.f_TermUse_termUseFlags).Lowering_dChecks.f_UseFlags_useFlagsObs)) defs) facts); Ir_dModel.f_IrShared_irSharedDefLocs = locRows; Ir_dModel.f_IrShared_irSharedUnboxed = ((B_dData_dList.v_map v_unboxedRowOf) (Elab_dRepresentation.v_unboxedInfoOf runtime)); Ir_dModel.f_IrShared_irSharedCtorShapes = (v_ctorTableOf runtime) }) ((v_mapSome v_locRowPair) defs))) (v_rtDatasOf datas)))

# 437 "Vuna/Compiler/Lowering/Env.vuna"
let v_ctorOpaqueTableOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap (fun (d : Elab_dTypes.t_DtData) -> ((B_dData_dList.v_map (fun (c : Elab_dTypes.t_DtCtor) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName c); B_dData_dPair.f_Pair_second = ((v_ctorOpaqueFlagsOf datas) c) })) (Elab_dTypes.v_dtDataCtors d)))) datas))

# 484 "Vuna/Compiler/Lowering/Env.vuna"
let v_intrinsicUseFlagsTbl = (((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_uString) ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = { Lowering_dChecks.f_UseFlags_useFlagsFloat = true; Lowering_dChecks.f_UseFlags_useFlagsTrace = false; Lowering_dChecks.f_UseFlags_useFlagsObs = false } })) Base_dIntrinsics.v_floatIntrinsicNames)) ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = { Lowering_dChecks.f_UseFlags_useFlagsFloat = false; Lowering_dChecks.f_UseFlags_useFlagsTrace = true; Lowering_dChecks.f_UseFlags_useFlagsObs = false } })) Base_dIntrinsics.v_traceIntrinsicNames)) ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = { Lowering_dChecks.f_UseFlags_useFlagsFloat = false; Lowering_dChecks.f_UseFlags_useFlagsTrace = false; Lowering_dChecks.f_UseFlags_useFlagsObs = true } })) Base_dIntrinsics.v_obsIntrinsicNames)))) ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dList.C_List_Nil))

# 490 "Vuna/Compiler/Lowering/Env.vuna"
let v_useFlagsOfName = (fun (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) v_intrinsicUseFlagsTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__115) -> dtb__115
  | B_dData_dMaybe.C_Maybe_Nothing -> Lowering_dChecks.v_noUseFlags
  | _ -> failwith "DT: impossible branch"
))

# 477 "Vuna/Compiler/Lowering/Env.vuna"
let v_defFactsOf = (fun (names : (string, bool) B_dContainer_dHashMap.t_HashMap) (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefBody d) with
  | B_dData_dMaybe.C_Maybe_Nothing -> { Lowering_dChecks.f_TermUse_termUseDeps = B_dData_dList.C_List_Nil; Lowering_dChecks.f_TermUse_termUseFlags = Lowering_dChecks.v_noUseFlags; Lowering_dChecks.f_TermUse_termUseFloatLit = false }
  | B_dData_dMaybe.C_Maybe_Just (dtb__116) -> (((Lowering_dChecks.v_termUseInto names) v_useFlagsOfName) dtb__116)
  | _ -> failwith "DT: impossible branch"
))

# 497 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_defTblOf = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__117, dtb__118) -> ((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) (Elab_dTypes.v_dtDefName dtb__117)) dtb__117) (v_defTblOf dtb__118))
  | B_dData_dList.C_List_Nil -> ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 502 "Vuna/Compiler/Lowering/Env.vuna"
let v_strTblOf = (fun pairs -> (((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_uString) pairs) ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dList.C_List_Nil)))

# 506 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_hasDataNamed = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__119, dtb__120) -> (if ((Elab_dTypes.v_dtDataName dtb__119) = mc0) then true else ((v_hasDataNamed mc0) dtb__120))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 510 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_nameSetOf = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__121, dtb__122) -> ((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) dtb__121) true) (v_nameSetOf dtb__122))
  | B_dData_dList.C_List_Nil -> ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 467 "Vuna/Compiler/Lowering/Env.vuna"
let v_defFactsTblOf = (fun (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((fun names -> (((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_uString) ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtDef) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName d); B_dData_dPair.f_Pair_second = ((v_defFactsOf names) d) })) defs)) ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dList.C_List_Nil))) (v_nameSetOf (B_dData_dList.C_List__x58__x58_ ("strFromFloat", (Lowering_dChecks.v_runtimeNamesOf defs))))))

# 444 "Vuna/Compiler/Lowering/Env.vuna"
let v_mkLwEnv = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (unit : string) -> ((fun facts -> ((fun shared -> ((fun runtime -> { f_LwEnv_lwShared = shared; f_LwEnv_lwDatas = runtime; f_LwEnv_lwTyParams = (v_strTblOf (v_tyParamsOf runtime)); f_LwEnv_lwUnboxedInfo = (Elab_dRepresentation.v_unboxedInfoOf runtime); f_LwEnv_lwRecordFields = (v_strTblOf (shared).Ir_dModel.f_IrShared_irSharedRecordFields); f_LwEnv_lwCtors = (v_strTblOf (v_ctorTableOf runtime)); f_LwEnv_lwOpaques = (v_strTblOf (v_ctorOpaqueTableOf runtime)); f_LwEnv_lwUnboxed = (B_dContainer_dHashMap.v_ofNames (Elab_dRepresentation.v_unboxedFamilySet runtime)); f_LwEnv_lwHasListFamily = ((v_hasDataNamed Base_dIntrinsics.v_listFamilyName) datas); f_LwEnv_lwDefs = defs; f_LwEnv_lwDefTbl = (v_defTblOf defs); f_LwEnv_lwGlobals = (v_strTblOf globals); f_LwEnv_lwFacts = facts; f_LwEnv_lwUnit = unit }) (v_rtDatasOf datas))) (((v_lowerSharedOf datas) defs) facts))) (v_defFactsTblOf defs)))
