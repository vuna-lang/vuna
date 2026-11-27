open Vuna_runtime
type t_LwEnv = { f_LwEnv_lwShared : Vuna_dIr_dModel.t_IrShared; f_LwEnv_lwDatas : Elab_dTypes.t_DtData B_dData_dList.t_List; f_LwEnv_lwDataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwTyParams : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwUnboxedInfo : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List; f_LwEnv_lwRecordFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwCtors : (string, (string, bool B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwOpaques : (string, bool B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwUnboxed : (string, bool) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwHasListFamily : bool; f_LwEnv_lwDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List; f_LwEnv_lwOrigDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List; f_LwEnv_lwDefTbl : (string, Elab_dTypes.t_DtDef) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwGlobals : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwFacts : (string, Lowering_dChecks.t_TermUse) B_dContainer_dHashMap.t_HashMap; f_LwEnv_lwUnit : string }

# 73 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwDefBodyOf = (fun (dtb_u_u1 : string) (dtb_u_u2 : t_LwEnv) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u1) (dtb_u_u2).f_LwEnv_lwDefTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3) -> (Elab_dTypes.v_dtDefBody dtb_u_u3)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwGlobalTyOf = (fun (dtb_u_u4 : string) (dtb_u_u5 : t_LwEnv) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u4) (dtb_u_u5).f_LwEnv_lwGlobals))

# 83 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwEnvShared = (fun (dtb_u_u6 : t_LwEnv) -> (match dtb_u_u6 with
  | { f_LwEnv_lwShared = dtb_u_u7; f_LwEnv_lwDatas = dtb_u_u8; f_LwEnv_lwDataTbl = dtb_u_u9; f_LwEnv_lwTyParams = dtb_u_u10; f_LwEnv_lwUnboxedInfo = dtb_u_u11; f_LwEnv_lwRecordFields = dtb_u_u12; f_LwEnv_lwCtors = dtb_u_u13; f_LwEnv_lwOpaques = dtb_u_u14; f_LwEnv_lwUnboxed = dtb_u_u15; f_LwEnv_lwHasListFamily = dtb_u_u16; f_LwEnv_lwDefs = dtb_u_u17; f_LwEnv_lwOrigDefs = dtb_u_u18; f_LwEnv_lwDefTbl = dtb_u_u19; f_LwEnv_lwGlobals = dtb_u_u20; f_LwEnv_lwFacts = dtb_u_u21; f_LwEnv_lwUnit = dtb_u_u22 } -> dtb_u_u7
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwEnvWithUnit = (fun (dtb_u_u23 : string) (dtb_u_u24 : t_LwEnv) -> (match dtb_u_u24 with
  | { f_LwEnv_lwShared = dtb_u_u25; f_LwEnv_lwDatas = dtb_u_u26; f_LwEnv_lwDataTbl = dtb_u_u27; f_LwEnv_lwTyParams = dtb_u_u28; f_LwEnv_lwUnboxedInfo = dtb_u_u29; f_LwEnv_lwRecordFields = dtb_u_u30; f_LwEnv_lwCtors = dtb_u_u31; f_LwEnv_lwOpaques = dtb_u_u32; f_LwEnv_lwUnboxed = dtb_u_u33; f_LwEnv_lwHasListFamily = dtb_u_u34; f_LwEnv_lwDefs = dtb_u_u35; f_LwEnv_lwOrigDefs = dtb_u_u36; f_LwEnv_lwDefTbl = dtb_u_u37; f_LwEnv_lwGlobals = dtb_u_u38; f_LwEnv_lwFacts = dtb_u_u39; f_LwEnv_lwUnit = dtb_u_u40 } -> { f_LwEnv_lwShared = dtb_u_u25; f_LwEnv_lwDatas = dtb_u_u26; f_LwEnv_lwDataTbl = dtb_u_u27; f_LwEnv_lwTyParams = dtb_u_u28; f_LwEnv_lwUnboxedInfo = dtb_u_u29; f_LwEnv_lwRecordFields = dtb_u_u30; f_LwEnv_lwCtors = dtb_u_u31; f_LwEnv_lwOpaques = dtb_u_u32; f_LwEnv_lwUnboxed = dtb_u_u33; f_LwEnv_lwHasListFamily = dtb_u_u34; f_LwEnv_lwDefs = dtb_u_u35; f_LwEnv_lwOrigDefs = dtb_u_u36; f_LwEnv_lwDefTbl = dtb_u_u37; f_LwEnv_lwGlobals = dtb_u_u38; f_LwEnv_lwFacts = dtb_u_u39; f_LwEnv_lwUnit = dtb_u_u23 }
  | _ -> failwith "DT: impossible branch"
))

# 109 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_listLength = (fun dtb_u_u42 -> (match dtb_u_u42 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u43, dtb_u_u44) -> (1 + (v_listLength dtb_u_u44))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 114 "Vuna/Compiler/Lowering/Env.vuna"
let v_pushDep = (fun (dtb_u_u45 : string) (dtb_u_u46 : string B_dData_dList.t_List) -> (if (dtb_u_u45 = "") then dtb_u_u46 else (if ((B_dData_dList.v_memName dtb_u_u45) dtb_u_u46) then dtb_u_u46 else ((B_dData_dList.v_append dtb_u_u46) (B_dData_dList.C_List__x58__x58_ (dtb_u_u45, B_dData_dList.C_List_Nil))))))

# 118 "Vuna/Compiler/Lowering/Env.vuna"
let[@tail_mod_cons] rec v_mapSome = (fun dtb_u_u49 dtb_u_u50 -> (match dtb_u_u50 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u51, dtb_u_u52) -> (match (dtb_u_u49 dtb_u_u51) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_mapSome dtb_u_u49) dtb_u_u52)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u53) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u53, ((v_mapSome dtb_u_u49) dtb_u_u52)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Lowering/Env.vuna"
let v_isTypeHeadOpaqueDatas = (fun (dtb_u_u54 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u55 : string) -> (if (Base_dIntrinsics.v_isUnboxedCanonical dtb_u_u55) then false else (match ((Elab_dRepresentation.v_findDtData dtb_u_u55) dtb_u_u54) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u56) -> false
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dBool.v_not (Base_dIntrinsics.v_isTypeConstructorName dtb_u_u55))
  | _ -> failwith "DT: impossible branch"
)))

# 136 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_memOpaqueLevel = (fun (dtb_u_u57 : int) (dtb_u_u58 : int B_dData_dList.t_List) -> (match dtb_u_u58 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u59, dtb_u_u60) -> (if (dtb_u_u59 = dtb_u_u57) then true else ((v_memOpaqueLevel dtb_u_u57) dtb_u_u60))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 148 "Vuna/Compiler/Lowering/Env.vuna"
let v_isRecordData = (fun (dtb_u_u61 : Elab_dTypes.t_DtData) -> (if (Elab_dTypes.v_dtDataIsRecord dtb_u_u61) then (let dtb_u_u62 = (Elab_dTypes.v_dtDataCtors dtb_u_u61) in (match dtb_u_u62 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u63, dtb_u_u64) -> (match dtb_u_u64 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> false
)) else false))

# 167 "Vuna/Compiler/Lowering/Env.vuna"
let[@tail_mod_cons] rec v_recordRtFieldsGo = (fun (dtb_u_u65 : string) (dtb_u_u66 : bool B_dData_dList.t_List) (dtb_u_u67 : Elab_dTypes.t_DtFieldMeta B_dData_dList.t_List) -> (match dtb_u_u66 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u68, dtb_u_u69) -> (match dtb_u_u67 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u70, dtb_u_u71) -> (if dtb_u_u68 then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb_u_u70).Elab_dTypes.f_DtFieldMeta_dtFieldIndex; B_dData_dPair.f_Pair_second = (dtb_u_u70).Elab_dTypes.f_DtFieldMeta_dtFieldName }, (((v_recordRtFieldsGo dtb_u_u65) dtb_u_u69) dtb_u_u71))) else (((v_recordRtFieldsGo dtb_u_u65) dtb_u_u69) dtb_u_u71))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 158 "Vuna/Compiler/Lowering/Env.vuna"
let v_recordRtFields = (fun (dtb_u_u72 : Elab_dTypes.t_DtData) -> (let dtb_u_u73 = (Elab_dTypes.v_dtDataCtors dtb_u_u72) in (match dtb_u_u73 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u74, dtb_u_u75) -> (match dtb_u_u75 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u76 = (v_listLength (dtb_u_u72).Elab_dTypes.f_DtData_dtDataParams) in (((v_recordRtFieldsGo (Elab_dTypes.v_dtDataName dtb_u_u72)) ((B_dData_dList.v_drop dtb_u_u76) (Elab_dRepresentation.v_ctorKeepFlags dtb_u_u74))) (Elab_dTypes.v_dtDataFields dtb_u_u72)))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)))

# 177 "Vuna/Compiler/Lowering/Env.vuna"
let v_hasRecordRepr = (fun (dtb_u_u77 : Elab_dTypes.t_DtData) -> (if (v_isRecordData dtb_u_u77) then (match (v_recordRtFields dtb_u_u77) with
  | B_dData_dList.C_List_Nil -> false
  | _ -> true
) else false))

# 187 "Vuna/Compiler/Lowering/Env.vuna"
let v_rtDatasOf = (fun (dtb_u_u78 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((B_dData_dList.v_filter (fun (dtb_u_u79 : Elab_dTypes.t_DtData) -> (B_dData_dBool.v_not (Base_dIntrinsics.v_isUnboxedCanonical (Elab_dTypes.v_dtDataName dtb_u_u79))))) dtb_u_u78))

# 195 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_ctorOpaqueGo = (fun (dtb_u_u80 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u81 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u82 : int) (dtb_u_u83 : Core_dTerm.t_Value) (dtb_u_u84 : int B_dData_dList.t_List) (dtb_u_u85 : bool B_dData_dList.t_List) -> (match dtb_u_u81 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u86, dtb_u_u87) -> (match dtb_u_u86 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u88; B_dData_dPair.f_Pair_second = dtb_u_u89 } -> (match dtb_u_u83 with
  | Core_dTerm.C_Value_VPi (dtb_u_u90, dtb_u_u91, dtb_u_u92, dtb_u_u93, dtb_u_u94) -> (let dtb_u_u95 = (if (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased dtb_u_u89)) then (if (((((Elab_dMeta.v_valueOpaqueScoped (fun (dtb_u_u98 : int) -> ((v_memOpaqueLevel dtb_u_u98) dtb_u_u84))) (v_isTypeHeadOpaqueDatas dtb_u_u80)) dtb_u_u82) dtb_u_u84) dtb_u_u93) then true else (Elab_dMeta.v_valueHasImplicitPi dtb_u_u93)) else false) in (let dtb_u_u96 = (if (Elab_dMeta.v_isFamilyKindValue dtb_u_u93) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u82, dtb_u_u84)) else dtb_u_u84) in (let dtb_u_u97 = ((Core_dEval.v_applyClosure dtb_u_u94) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u90, dtb_u_u82, B_dData_dList.C_List_Nil))))) in ((((((v_ctorOpaqueGo dtb_u_u80) dtb_u_u87) (dtb_u_u82 + 1)) dtb_u_u97) dtb_u_u96) (B_dData_dList.C_List__x58__x58_ (dtb_u_u95, dtb_u_u85))))))
  | _ -> (B_dData_dList.v_reverse dtb_u_u85)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse dtb_u_u85)
  | _ -> failwith "DT: impossible branch"
))

# 192 "Vuna/Compiler/Lowering/Env.vuna"
let v_ctorOpaqueFlagsOf = (fun (dtb_u_u99 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u100 : Elab_dTypes.t_DtCtor) -> ((((((v_ctorOpaqueGo dtb_u_u99) (Elab_dTypes.v_dtCtorTelescope dtb_u_u100)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb_u_u100))) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 217 "Vuna/Compiler/Lowering/Env.vuna"
let v_locRowPair = (fun (dtb_u_u101 : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefSpan dtb_u_u101) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u102) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName dtb_u_u101); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (dtb_u_u102).Base_dSource.f_Span_spanFile; B_dData_dPair.f_Pair_second = (Base_dSource.v_spanStartLine dtb_u_u102) } }))
  | _ -> failwith "DT: impossible branch"
))

# 233 "Vuna/Compiler/Lowering/Env.vuna"
let[@tail_mod_cons] rec v_typeParamLevelsGo = (fun (dtb_u_u103 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u104 : int) -> (match dtb_u_u103 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u105, dtb_u_u106) -> (if (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf dtb_u_u105)) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u104, ((v_typeParamLevelsGo dtb_u_u106) (dtb_u_u104 + 1)))) else ((v_typeParamLevelsGo dtb_u_u106) (dtb_u_u104 + 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 230 "Vuna/Compiler/Lowering/Env.vuna"
let v_typeParamLevels = (fun (dtb_u_u107 : Elab_dTypes.t_DtData) -> ((v_typeParamLevelsGo (dtb_u_u107).Elab_dTypes.f_DtData_dtDataParams) 0))

# 241 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_memIntIn = (fun (dtb_u_u108 : int) (dtb_u_u109 : int B_dData_dList.t_List) -> (match dtb_u_u109 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u110, dtb_u_u111) -> (if (dtb_u_u110 = dtb_u_u108) then true else ((v_memIntIn dtb_u_u108) dtb_u_u111))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 248 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_levelSlotGoIn = (fun (dtb_u_u112 : int B_dData_dList.t_List) (dtb_u_u113 : int) (dtb_u_u114 : int) -> (match dtb_u_u112 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u115, dtb_u_u116) -> (if (dtb_u_u115 = dtb_u_u113) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u114)) else (((v_levelSlotGoIn dtb_u_u116) dtb_u_u113) (dtb_u_u114 + 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 245 "Vuna/Compiler/Lowering/Env.vuna"
let v_levelSlotIn = (fun (dtb_u_u117 : int B_dData_dList.t_List) (dtb_u_u118 : int) -> (((v_levelSlotGoIn dtb_u_u117) dtb_u_u118) 0))

# 252 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_nthValueIn = (fun (dtb_u_u119 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u120 : int) -> (match dtb_u_u119 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u121, dtb_u_u122) -> (if (dtb_u_u120 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u121)) else ((v_nthValueIn dtb_u_u122) (dtb_u_u120 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 256 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_lookupUsedIn = (fun (dtb_u_u123 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u124 : string) -> (match dtb_u_u123 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u125, dtb_u_u126) -> (if ((B_dData_dPair.v_firstOf dtb_u_u125) = dtb_u_u124) then (B_dData_dPair.v_secondOf dtb_u_u125) else ((v_lookupUsedIn dtb_u_u126) dtb_u_u124))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 261 "Vuna/Compiler/Lowering/Env.vuna"
let v_lookupTyParamsIn = (fun (dtb_u_u127 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u128 : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u128) dtb_u_u127) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u129) -> dtb_u_u129
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 270 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_collectUsedLevelsFuel = (fun (dtb_u_u130 : int) (dtb_u_u131 : int B_dData_dList.t_List) (dtb_u_u132 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u133 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u134 : int) (dtb_u_u135 : Core_dTerm.t_Value) -> (if (dtb_u_u130 <= 0) then B_dData_dList.C_List_Nil else (match dtb_u_u135 with
  | Core_dTerm.C_Value_VPi (dtb_u_u136, dtb_u_u137, dtb_u_u138, dtb_u_u139, dtb_u_u140) -> (if dtb_u_u137 then ((((((v_collectUsedLevelsFuel (dtb_u_u130 - 1)) dtb_u_u131) dtb_u_u132) dtb_u_u133) (dtb_u_u134 + 1)) ((Core_dEval.v_applyClosure dtb_u_u140) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u136, dtb_u_u134, B_dData_dList.C_List_Nil)))))) else ((B_dData_dList.v_append ((((((v_collectUsedLevelsFuel (dtb_u_u130 - 1)) dtb_u_u131) dtb_u_u132) dtb_u_u133) dtb_u_u134) dtb_u_u139)) ((((((v_collectUsedLevelsFuel (dtb_u_u130 - 1)) dtb_u_u131) dtb_u_u132) dtb_u_u133) (dtb_u_u134 + 1)) ((Core_dEval.v_applyClosure dtb_u_u140) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u136, dtb_u_u134, B_dData_dList.C_List_Nil))))))))
  | Core_dTerm.C_Value_VNeutral (dtb_u_u141) -> (match dtb_u_u141 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u142, dtb_u_u143, dtb_u_u144) -> ((B_dData_dList.v_append (if ((v_memIntIn dtb_u_u143) dtb_u_u131) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u143, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)) ((((((v_collectUsedSpineFuel (dtb_u_u130 - 1)) dtb_u_u131) dtb_u_u132) dtb_u_u133) dtb_u_u134) dtb_u_u144))
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u145, dtb_u_u146) -> (match ((Elab_dRepresentation.v_findDtData dtb_u_u145) dtb_u_u133) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u147) -> (((((((v_collectFamilyArgsFuel (dtb_u_u130 - 1)) dtb_u_u131) dtb_u_u132) dtb_u_u133) dtb_u_u134) ((v_lookupUsedIn dtb_u_u132) dtb_u_u145)) dtb_u_u146)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_collectUsedSpineFuel (dtb_u_u130 - 1)) dtb_u_u131) dtb_u_u132) dtb_u_u133) dtb_u_u134) dtb_u_u146)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dList.C_List_Nil
)))
# 286 "Vuna/Compiler/Lowering/Env.vuna"
and v_collectUsedSpineFuel = (fun (dtb_u_u148 : int) (dtb_u_u149 : int B_dData_dList.t_List) (dtb_u_u150 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u151 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u152 : int) (dtb_u_u153 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u153 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u154, dtb_u_u155) -> (if (dtb_u_u148 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append ((((((v_collectUsedLevelsFuel (dtb_u_u148 - 1)) dtb_u_u149) dtb_u_u150) dtb_u_u151) dtb_u_u152) dtb_u_u154)) ((((((v_collectUsedSpineFuel (dtb_u_u148 - 1)) dtb_u_u149) dtb_u_u150) dtb_u_u151) dtb_u_u152) dtb_u_u155)))
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u148 <= 0) then B_dData_dList.C_List_Nil else B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))
# 300 "Vuna/Compiler/Lowering/Env.vuna"
and v_collectFamilyArgsFuel = (fun (dtb_u_u156 : int) (dtb_u_u157 : int B_dData_dList.t_List) (dtb_u_u158 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u159 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u160 : int) (dtb_u_u161 : int B_dData_dList.t_List) (dtb_u_u162 : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (dtb_u_u156 <= 0) then B_dData_dList.C_List_Nil else (match dtb_u_u161 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u163, dtb_u_u164) -> (match ((v_nthValueIn dtb_u_u162) dtb_u_u163) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u165) -> ((B_dData_dList.v_append ((((((v_collectUsedLevelsFuel (dtb_u_u156 - 1)) dtb_u_u157) dtb_u_u158) dtb_u_u159) dtb_u_u160) dtb_u_u165)) (((((((v_collectFamilyArgsFuel (dtb_u_u156 - 1)) dtb_u_u157) dtb_u_u158) dtb_u_u159) dtb_u_u160) dtb_u_u164) dtb_u_u162))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_collectFamilyArgsFuel (dtb_u_u156 - 1)) dtb_u_u157) dtb_u_u158) dtb_u_u159) dtb_u_u160) dtb_u_u164) dtb_u_u162)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 267 "Vuna/Compiler/Lowering/Env.vuna"
let v_collectUsedLevels = (fun (dtb_u_u166 : int B_dData_dList.t_List) (dtb_u_u167 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u168 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u169 : int) (dtb_u_u170 : Core_dTerm.t_Value) -> ((((((v_collectUsedLevelsFuel 256) dtb_u_u166) dtb_u_u167) dtb_u_u168) dtb_u_u169) dtb_u_u170))

# 296 "Vuna/Compiler/Lowering/Env.vuna"
let v_collectFamilyArgs = (fun (dtb_u_u171 : int B_dData_dList.t_List) (dtb_u_u172 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u173 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u174 : int) (dtb_u_u175 : int B_dData_dList.t_List) (dtb_u_u176 : Core_dTerm.t_Value B_dData_dList.t_List) -> (((((((v_collectFamilyArgsFuel 256) dtb_u_u171) dtb_u_u172) dtb_u_u173) dtb_u_u174) dtb_u_u175) dtb_u_u176))

# 312 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_ctorUsedLevels = (fun (dtb_u_u177 : int B_dData_dList.t_List) (dtb_u_u178 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u179 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u180 : int B_dData_dList.t_List) (dtb_u_u181 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u182 : int) (dtb_u_u183 : Core_dTerm.t_Value) -> (match dtb_u_u181 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u184, dtb_u_u185) -> (match dtb_u_u184 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u186; B_dData_dPair.f_Pair_second = dtb_u_u187 } -> (match dtb_u_u183 with
  | Core_dTerm.C_Value_VPi (dtb_u_u188, dtb_u_u189, dtb_u_u190, dtb_u_u191, dtb_u_u192) -> (let dtb_u_u193 = (((((Elab_dMeta.v_valueOpaqueScoped (fun (dtb_u_u196 : int) -> ((v_memOpaqueLevel dtb_u_u196) dtb_u_u180))) (v_isTypeHeadOpaqueDatas dtb_u_u179)) dtb_u_u182) dtb_u_u180) dtb_u_u191) in (let dtb_u_u194 = (if (Elab_dMeta.v_isFamilyKindValue dtb_u_u191) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u182, dtb_u_u180)) else dtb_u_u180) in (let dtb_u_u195 = ((Core_dEval.v_applyClosure dtb_u_u192) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u188, dtb_u_u182, B_dData_dList.C_List_Nil))))) in (if (Core_dTerm.v_rigIsErased dtb_u_u187) then (((((((v_ctorUsedLevels dtb_u_u177) dtb_u_u178) dtb_u_u179) dtb_u_u194) dtb_u_u185) (dtb_u_u182 + 1)) dtb_u_u195) else (if dtb_u_u193 then (((((((v_ctorUsedLevels dtb_u_u177) dtb_u_u178) dtb_u_u179) dtb_u_u194) dtb_u_u185) (dtb_u_u182 + 1)) dtb_u_u195) else ((B_dData_dList.v_append (((((v_collectUsedLevels dtb_u_u177) dtb_u_u178) dtb_u_u179) dtb_u_u182) dtb_u_u191)) (((((((v_ctorUsedLevels dtb_u_u177) dtb_u_u178) dtb_u_u179) dtb_u_u194) dtb_u_u185) (dtb_u_u182 + 1)) dtb_u_u195)))))))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 339 "Vuna/Compiler/Lowering/Env.vuna"
let v_dataUsedLevels = (fun (dtb_u_u197 : Elab_dTypes.t_DtData) (dtb_u_u198 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u199 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (let dtb_u_u200 = ((B_dData_dList.v_concatMap (fun (dtb_u_u202 : Elab_dTypes.t_DtCtor) -> (((((((v_ctorUsedLevels (v_typeParamLevels dtb_u_u197)) dtb_u_u198) dtb_u_u199) B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorTelescope dtb_u_u202)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb_u_u202))))) (Elab_dTypes.v_dtDataCtors dtb_u_u197)) in ((B_dData_dList.v_filter (fun (dtb_u_u201 : int) -> ((v_memIntIn dtb_u_u201) dtb_u_u200))) (v_typeParamLevels dtb_u_u197))))

# 348 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_levelListEq = (fun (dtb_u_u203 : int B_dData_dList.t_List) (dtb_u_u204 : int B_dData_dList.t_List) -> (match dtb_u_u203 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u205, dtb_u_u206) -> (match dtb_u_u204 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u207, dtb_u_u208) -> (if (dtb_u_u205 = dtb_u_u207) then ((v_levelListEq dtb_u_u206) dtb_u_u208) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (match dtb_u_u204 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 353 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_sameLevelTable = (fun (dtb_u_u209 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u210 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u209 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u211, dtb_u_u212) -> (match dtb_u_u210 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u213, dtb_u_u214) -> (if (if ((B_dData_dPair.v_firstOf dtb_u_u211) = (B_dData_dPair.v_firstOf dtb_u_u213)) then ((v_levelListEq (B_dData_dPair.v_secondOf dtb_u_u211)) (B_dData_dPair.v_secondOf dtb_u_u213)) else false) then ((v_sameLevelTable dtb_u_u212) dtb_u_u214) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (match dtb_u_u210 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 367 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_usedSlotCount = (fun (dtb_u_u215 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match dtb_u_u215 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u216, dtb_u_u217) -> ((B_dData_dList.v_length (v_typeParamLevels dtb_u_u216)) + (v_usedSlotCount dtb_u_u217))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 364 "Vuna/Compiler/Lowering/Env.vuna"
let v_usedFixRounds = (fun (dtb_u_u218 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (1 + (v_usedSlotCount dtb_u_u218)))

# 374 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_usedTableFixFuel = (fun (dtb_u_u219 : int) (dtb_u_u220 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u221 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u219 <= 0) then dtb_u_u221 else (let dtb_u_u222 = ((B_dData_dList.v_map (fun (dtb_u_u223 : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName dtb_u_u223); B_dData_dPair.f_Pair_second = (((v_dataUsedLevels dtb_u_u223) dtb_u_u221) dtb_u_u220) })) dtb_u_u220) in (if ((v_sameLevelTable dtb_u_u222) dtb_u_u221) then dtb_u_u222 else (((v_usedTableFixFuel (dtb_u_u219 - 1)) dtb_u_u220) dtb_u_u222)))))

# 371 "Vuna/Compiler/Lowering/Env.vuna"
let v_usedTableFix = (fun (dtb_u_u224 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u225 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_usedTableFixFuel (v_usedFixRounds dtb_u_u224)) dtb_u_u224) dtb_u_u225))

# 384 "Vuna/Compiler/Lowering/Env.vuna"
let v_tyParamsOf = (fun (dtb_u_u226 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((v_usedTableFix dtb_u_u226) ((B_dData_dList.v_map (fun (dtb_u_u227 : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName dtb_u_u227); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })) dtb_u_u226)))

# 387 "Vuna/Compiler/Lowering/Env.vuna"
let v_recordFieldsOf = (fun (dtb_u_u228 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (dtb_u_u229 : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName dtb_u_u229); B_dData_dPair.f_Pair_second = (v_recordRtFields dtb_u_u229) })) ((B_dData_dList.v_filter v_hasRecordRepr) ((B_dData_dList.v_filter (fun (dtb_u_u230 : Elab_dTypes.t_DtData) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName (Elab_dTypes.v_dtDataName dtb_u_u230)) (Elab_dRepresentation.v_unboxedFamilySet dtb_u_u228))))) dtb_u_u228))))

# 395 "Vuna/Compiler/Lowering/Env.vuna"
let v_floatRenderRefName = "Base.Data.Float.floatRender"

# 434 "Vuna/Compiler/Lowering/Env.vuna"
let v_unboxedRowOf = (fun (dtb_u_u231 : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (match dtb_u_u231 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u232; B_dData_dPair.f_Pair_second = dtb_u_u233 } -> (match dtb_u_u233 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u234; B_dData_dPair.f_Pair_second = dtb_u_u235 } -> { B_dData_dPair.f_Pair_first = dtb_u_u232; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName dtb_u_u234); B_dData_dPair.f_Pair_second = dtb_u_u235 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 443 "Vuna/Compiler/Lowering/Env.vuna"
let v_lookupFacts = (fun (dtb_u_u236 : (string, Lowering_dChecks.t_TermUse) B_dContainer_dHashMap.t_HashMap) (dtb_u_u237 : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u237) dtb_u_u236) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u238) -> dtb_u_u238
  | B_dData_dMaybe.C_Maybe_Nothing -> { Lowering_dChecks.f_TermUse_termUseDeps = B_dData_dList.C_List_Nil; Lowering_dChecks.f_TermUse_termUseFlags = Lowering_dChecks.v_noUseFlags; Lowering_dChecks.f_TermUse_termUseFloatLit = false }
  | _ -> failwith "DT: impossible branch"
))

# 403 "Vuna/Compiler/Lowering/Env.vuna"
let v_factsOf = (fun (dtb_u_u239 : t_LwEnv) (dtb_u_u240 : string) -> ((v_lookupFacts (dtb_u_u239).f_LwEnv_lwFacts) dtb_u_u240))

# 399 "Vuna/Compiler/Lowering/Env.vuna"
let v_factsDepsOf = (fun (dtb_u_u241 : t_LwEnv) (dtb_u_u242 : string) -> ((B_dData_dList.v_map (fun (dtb_u_u243 : string) -> (if (dtb_u_u243 = "strFromFloat") then v_floatRenderRefName else dtb_u_u243))) (((v_factsOf dtb_u_u241) dtb_u_u242)).Lowering_dChecks.f_TermUse_termUseDeps))

# 438 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_anyDefFlag = (fun (dtb_u_u244 : (Lowering_dChecks.t_TermUse) -> bool) (dtb_u_u245 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u246 : (string, Lowering_dChecks.t_TermUse) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u245 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u247, dtb_u_u248) -> (if (dtb_u_u244 ((v_lookupFacts dtb_u_u246) (Elab_dTypes.v_dtDefName dtb_u_u247))) then true else (((v_anyDefFlag dtb_u_u244) dtb_u_u248) dtb_u_u246))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 461 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_findFamilyCtor = (fun (dtb_u_u249 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (dtb_u_u250 : string) -> (match dtb_u_u249 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u251, dtb_u_u252) -> (if ((Elab_dTypes.v_dtCtorName dtb_u_u251) = dtb_u_u250) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u251)) else ((v_findFamilyCtor dtb_u_u252) dtb_u_u250))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 465 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_findListFamilyData = (fun (dtb_u_u253 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match dtb_u_u253 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u254, dtb_u_u255) -> (if ((Elab_dTypes.v_dtDataName dtb_u_u254) = Base_dIntrinsics.v_listFamilyName) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u254)) else (v_findListFamilyData dtb_u_u255))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 449 "Vuna/Compiler/Lowering/Env.vuna"
let v_listFamOf = (fun (dtb_u_u256 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match (v_findListFamilyData dtb_u_u256) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u257) -> (match ((v_findFamilyCtor (Elab_dTypes.v_dtDataCtors dtb_u_u257)) Base_dIntrinsics.v_listNilCtor) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u258) -> (match ((v_findFamilyCtor (Elab_dTypes.v_dtDataCtors dtb_u_u257)) Base_dIntrinsics.v_listConsCtor) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u259) -> (B_dData_dMaybe.C_Maybe_Just ({ Vuna_dIr_dModel.f_IrListFam_irListFamily = (Elab_dTypes.v_dtDataName dtb_u_u257); Vuna_dIr_dModel.f_IrListFam_irListNil = (Elab_dTypes.v_dtCtorName dtb_u_u258); Vuna_dIr_dModel.f_IrListFam_irListCons = (Elab_dTypes.v_dtCtorName dtb_u_u259) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 470 "Vuna/Compiler/Lowering/Env.vuna"
let v_ctorTableOf = (fun (dtb_u_u260 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap (fun (dtb_u_u261 : Elab_dTypes.t_DtData) -> ((B_dData_dList.v_map (fun (dtb_u_u262 : Elab_dTypes.t_DtCtor) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName dtb_u_u262); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorFamily dtb_u_u262); B_dData_dPair.f_Pair_second = (Elab_dRepresentation.v_ctorKeepFlags dtb_u_u262) } })) (Elab_dTypes.v_dtDataCtors dtb_u_u261)))) dtb_u_u260))

# 409 "Vuna/Compiler/Lowering/Env.vuna"
let v_lowerSharedOf = (fun (dtb_u_u263 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u264 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u265 : (string, Lowering_dChecks.t_TermUse) B_dContainer_dHashMap.t_HashMap) -> (let dtb_u_u266 = (v_rtDatasOf dtb_u_u263) in (let dtb_u_u267 = ((v_mapSome v_locRowPair) dtb_u_u264) in (let dtb_u_u268 = (((v_anyDefFlag (fun (dtb_u_u278 : Lowering_dChecks.t_TermUse) -> ((dtb_u_u278).Lowering_dChecks.f_TermUse_termUseFlags).Lowering_dChecks.f_UseFlags_useFlagsTrace)) dtb_u_u264) dtb_u_u265) in (let dtb_u_u269 = (((v_anyDefFlag (fun (dtb_u_u277 : Lowering_dChecks.t_TermUse) -> ((dtb_u_u277).Lowering_dChecks.f_TermUse_termUseFlags).Lowering_dChecks.f_UseFlags_useFlagsObs)) dtb_u_u264) dtb_u_u265) in (let dtb_u_u270 = (if (if (((v_anyDefFlag (fun (dtb_u_u276 : Lowering_dChecks.t_TermUse) -> ((dtb_u_u276).Lowering_dChecks.f_TermUse_termUseFlags).Lowering_dChecks.f_UseFlags_useFlagsHost)) dtb_u_u264) dtb_u_u265) then true else dtb_u_u268) then true else dtb_u_u269) in (let dtb_u_u271 = (((v_anyDefFlag (fun (dtb_u_u275 : Lowering_dChecks.t_TermUse) -> ((dtb_u_u275).Lowering_dChecks.f_TermUse_termUseFlags).Lowering_dChecks.f_UseFlags_useFlagsSched)) dtb_u_u264) dtb_u_u265) in (let dtb_u_u272 = (((v_anyDefFlag (fun (dtb_u_u274 : Lowering_dChecks.t_TermUse) -> ((dtb_u_u274).Lowering_dChecks.f_TermUse_termUseFlags).Lowering_dChecks.f_UseFlags_useFlagsEff)) dtb_u_u264) dtb_u_u265) in { Vuna_dIr_dModel.f_IrShared_irSharedRecordFields = (v_recordFieldsOf dtb_u_u266); Vuna_dIr_dModel.f_IrShared_irSharedListFam = (v_listFamOf dtb_u_u266); Vuna_dIr_dModel.f_IrShared_irSharedUsesFloat = (((v_anyDefFlag (fun (dtb_u_u273 : Lowering_dChecks.t_TermUse) -> (if ((dtb_u_u273).Lowering_dChecks.f_TermUse_termUseFlags).Lowering_dChecks.f_UseFlags_useFlagsFloat then true else (dtb_u_u273).Lowering_dChecks.f_TermUse_termUseFloatLit))) dtb_u_u264) dtb_u_u265); Vuna_dIr_dModel.f_IrShared_irSharedUsesTrace = dtb_u_u268; Vuna_dIr_dModel.f_IrShared_irSharedUsesObs = dtb_u_u269; Vuna_dIr_dModel.f_IrShared_irSharedDefLocs = dtb_u_u267; Vuna_dIr_dModel.f_IrShared_irSharedUnboxed = ((B_dData_dList.v_map v_unboxedRowOf) (Elab_dRepresentation.v_unboxedInfoOf dtb_u_u266)); Vuna_dIr_dModel.f_IrShared_irSharedCtorShapes = (v_ctorTableOf dtb_u_u266); Vuna_dIr_dModel.f_IrShared_irSharedUsesHost = dtb_u_u270; Vuna_dIr_dModel.f_IrShared_irSharedUsesSched = dtb_u_u271; Vuna_dIr_dModel.f_IrShared_irSharedUsesEff = dtb_u_u272 }))))))))

# 476 "Vuna/Compiler/Lowering/Env.vuna"
let v_ctorOpaqueTableOf = (fun (dtb_u_u279 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap (fun (dtb_u_u280 : Elab_dTypes.t_DtData) -> ((B_dData_dList.v_map (fun (dtb_u_u281 : Elab_dTypes.t_DtCtor) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName dtb_u_u281); B_dData_dPair.f_Pair_second = ((v_ctorOpaqueFlagsOf dtb_u_u279) dtb_u_u281) })) (Elab_dTypes.v_dtDataCtors dtb_u_u280)))) dtb_u_u279))

# 496 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_eraseDefsGo = (fun (dtb_u_u282 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u283 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u284 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u283 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u285, dtb_u_u286) -> (match dtb_u_u285 with
  | Elab_dTypes.C_DtDef_DtDef (dtb_u_u287, dtb_u_u288, dtb_u_u289, dtb_u_u290) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u287) dtb_u_u282) then ((Base_dCommon.v_bind (Lowering_dErased.v_eraseTerm dtb_u_u289)) (fun (dtb_u_u291 : Core_dTerm.t_Term) -> (((v_eraseDefsGo dtb_u_u282) dtb_u_u286) (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.C_DtDef_DtDef (dtb_u_u287, dtb_u_u288, dtb_u_u291, dtb_u_u290)), dtb_u_u284))))) else (((v_eraseDefsGo dtb_u_u282) dtb_u_u286) (B_dData_dList.C_List__x58__x58_ (dtb_u_u285, dtb_u_u284))))
  | _ -> (((v_eraseDefsGo dtb_u_u282) dtb_u_u286) (B_dData_dList.C_List__x58__x58_ (dtb_u_u285, dtb_u_u284)))
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse dtb_u_u284)))
  | _ -> failwith "DT: impossible branch"
))

# 489 "Vuna/Compiler/Lowering/Env.vuna"
let v_eraseDefs = (fun (dtb_u_u292 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let dtb_u_u293 = ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) (B_dData_dPair.v_firstOf ((Lowering_dChecks.v_partitionDefs (Lowering_dChecks.v_defTable dtb_u_u292)) dtb_u_u292))) in (let dtb_u_u294 = ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (dtb_u_u295 : string) -> { B_dData_dPair.f_Pair_first = dtb_u_u295; B_dData_dPair.f_Pair_second = true })) dtb_u_u293)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) in (((v_eraseDefsGo dtb_u_u294) dtb_u_u292) B_dData_dList.C_List_Nil))))

# 550 "Vuna/Compiler/Lowering/Env.vuna"
let v_intrinsicUseFlagsTbl = ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u296 : string) -> { B_dData_dPair.f_Pair_first = dtb_u_u296; B_dData_dPair.f_Pair_second = { Lowering_dChecks.f_UseFlags_useFlagsFloat = true; Lowering_dChecks.f_UseFlags_useFlagsTrace = false; Lowering_dChecks.f_UseFlags_useFlagsObs = false; Lowering_dChecks.f_UseFlags_useFlagsHost = false; Lowering_dChecks.f_UseFlags_useFlagsSched = false; Lowering_dChecks.f_UseFlags_useFlagsEff = false } })) Base_dIntrinsics.v_floatIntrinsicNames)) ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u297 : string) -> { B_dData_dPair.f_Pair_first = dtb_u_u297; B_dData_dPair.f_Pair_second = { Lowering_dChecks.f_UseFlags_useFlagsFloat = false; Lowering_dChecks.f_UseFlags_useFlagsTrace = true; Lowering_dChecks.f_UseFlags_useFlagsObs = false; Lowering_dChecks.f_UseFlags_useFlagsHost = false; Lowering_dChecks.f_UseFlags_useFlagsSched = false; Lowering_dChecks.f_UseFlags_useFlagsEff = false } })) Base_dIntrinsics.v_logIntrinsicNames)) ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u298 : string) -> { B_dData_dPair.f_Pair_first = dtb_u_u298; B_dData_dPair.f_Pair_second = { Lowering_dChecks.f_UseFlags_useFlagsFloat = false; Lowering_dChecks.f_UseFlags_useFlagsTrace = false; Lowering_dChecks.f_UseFlags_useFlagsObs = true; Lowering_dChecks.f_UseFlags_useFlagsHost = false; Lowering_dChecks.f_UseFlags_useFlagsSched = false; Lowering_dChecks.f_UseFlags_useFlagsEff = false } })) Base_dIntrinsics.v_obsIntrinsicNames)) ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u299 : string) -> { B_dData_dPair.f_Pair_first = dtb_u_u299; B_dData_dPair.f_Pair_second = { Lowering_dChecks.f_UseFlags_useFlagsFloat = false; Lowering_dChecks.f_UseFlags_useFlagsTrace = false; Lowering_dChecks.f_UseFlags_useFlagsObs = false; Lowering_dChecks.f_UseFlags_useFlagsHost = true; Lowering_dChecks.f_UseFlags_useFlagsSched = false; Lowering_dChecks.f_UseFlags_useFlagsEff = false } })) Base_dIntrinsics.v_hostIntrinsicNames)) ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u300 : string) -> { B_dData_dPair.f_Pair_first = dtb_u_u300; B_dData_dPair.f_Pair_second = { Lowering_dChecks.f_UseFlags_useFlagsFloat = false; Lowering_dChecks.f_UseFlags_useFlagsTrace = false; Lowering_dChecks.f_UseFlags_useFlagsObs = false; Lowering_dChecks.f_UseFlags_useFlagsHost = false; Lowering_dChecks.f_UseFlags_useFlagsSched = true; Lowering_dChecks.f_UseFlags_useFlagsEff = false } })) Base_dIntrinsics.v_schedIntrinsicNames)) ((B_dData_dList.v_map (fun (dtb_u_u301 : string) -> { B_dData_dPair.f_Pair_first = dtb_u_u301; B_dData_dPair.f_Pair_second = { Lowering_dChecks.f_UseFlags_useFlagsFloat = false; Lowering_dChecks.f_UseFlags_useFlagsTrace = false; Lowering_dChecks.f_UseFlags_useFlagsObs = false; Lowering_dChecks.f_UseFlags_useFlagsHost = false; Lowering_dChecks.f_UseFlags_useFlagsSched = false; Lowering_dChecks.f_UseFlags_useFlagsEff = true } })) Base_dIntrinsics.v_effIntrinsicNames))))))) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil))

# 556 "Vuna/Compiler/Lowering/Env.vuna"
let v_useFlagsOfName = (fun (dtb_u_u302 : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u302) v_intrinsicUseFlagsTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u303) -> dtb_u_u303
  | B_dData_dMaybe.C_Maybe_Nothing -> Lowering_dChecks.v_noUseFlags
  | _ -> failwith "DT: impossible branch"
))

# 543 "Vuna/Compiler/Lowering/Env.vuna"
let v_defFactsOf = (fun (dtb_u_u304 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u305 : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefBody dtb_u_u305) with
  | B_dData_dMaybe.C_Maybe_Nothing -> { Lowering_dChecks.f_TermUse_termUseDeps = B_dData_dList.C_List_Nil; Lowering_dChecks.f_TermUse_termUseFlags = Lowering_dChecks.v_noUseFlags; Lowering_dChecks.f_TermUse_termUseFloatLit = false }
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u306) -> (((Lowering_dChecks.v_termUseInto dtb_u_u304) v_useFlagsOfName) dtb_u_u306)
  | _ -> failwith "DT: impossible branch"
))

# 563 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_defTblOf = (fun (dtb_u_u307 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u307 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u308, dtb_u_u309) -> (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Elab_dTypes.v_dtDefName dtb_u_u308)) dtb_u_u308) (v_defTblOf dtb_u_u309))
  | B_dData_dList.C_List_Nil -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 568 "Vuna/Compiler/Lowering/Env.vuna"
let v_strTblOf = (fun dtb_u_u311 -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u311) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 572 "Vuna/Compiler/Lowering/Env.vuna"
let v_dataTblOf = (fun (dtb_u_u312 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (dtb_u_u313 : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName dtb_u_u313); B_dData_dPair.f_Pair_second = dtb_u_u313 })) dtb_u_u312)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 576 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_hasDataNamed = (fun (dtb_u_u314 : string) (dtb_u_u315 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match dtb_u_u315 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u316, dtb_u_u317) -> (if ((Elab_dTypes.v_dtDataName dtb_u_u316) = dtb_u_u314) then true else ((v_hasDataNamed dtb_u_u314) dtb_u_u317))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 580 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_nameSetOf = (fun (dtb_u_u318 : string B_dData_dList.t_List) -> (match dtb_u_u318 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u319, dtb_u_u320) -> (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u319) true) (v_nameSetOf dtb_u_u320))
  | B_dData_dList.C_List_Nil -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 535 "Vuna/Compiler/Lowering/Env.vuna"
let v_defFactsTblOf = (fun (dtb_u_u321 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let dtb_u_u322 = (v_nameSetOf (B_dData_dList.C_List__x58__x58_ ("strFromFloat", (Lowering_dChecks.v_runtimeNamesOf dtb_u_u321)))) in ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (dtb_u_u323 : Elab_dTypes.t_DtDef) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName dtb_u_u323); B_dData_dPair.f_Pair_second = ((v_defFactsOf dtb_u_u322) dtb_u_u323) })) dtb_u_u321)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil))))

# 510 "Vuna/Compiler/Lowering/Env.vuna"
let v_mkLwEnvFromErased = (fun (dtb_u_u324 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u325 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u326 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u327 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u328 : string) -> (let dtb_u_u329 = (v_defFactsTblOf dtb_u_u325) in (let dtb_u_u330 = (((v_lowerSharedOf dtb_u_u324) dtb_u_u325) dtb_u_u329) in (let dtb_u_u331 = (v_rtDatasOf dtb_u_u324) in { f_LwEnv_lwShared = dtb_u_u330; f_LwEnv_lwDatas = dtb_u_u331; f_LwEnv_lwDataTbl = (v_dataTblOf dtb_u_u331); f_LwEnv_lwTyParams = (v_strTblOf (v_tyParamsOf dtb_u_u331)); f_LwEnv_lwUnboxedInfo = (Elab_dRepresentation.v_unboxedInfoOf dtb_u_u331); f_LwEnv_lwRecordFields = (v_strTblOf (dtb_u_u330).Vuna_dIr_dModel.f_IrShared_irSharedRecordFields); f_LwEnv_lwCtors = (v_strTblOf (v_ctorTableOf dtb_u_u331)); f_LwEnv_lwOpaques = (v_strTblOf (v_ctorOpaqueTableOf dtb_u_u331)); f_LwEnv_lwUnboxed = (B_dContainer_dHashMap.v_ofNames (Elab_dRepresentation.v_unboxedFamilySet dtb_u_u331)); f_LwEnv_lwHasListFamily = ((v_hasDataNamed Base_dIntrinsics.v_listFamilyName) dtb_u_u324); f_LwEnv_lwDefs = dtb_u_u325; f_LwEnv_lwOrigDefs = dtb_u_u326; f_LwEnv_lwDefTbl = (v_defTblOf dtb_u_u325); f_LwEnv_lwGlobals = (v_strTblOf dtb_u_u327); f_LwEnv_lwFacts = dtb_u_u329; f_LwEnv_lwUnit = dtb_u_u328 }))))

# 481 "Vuna/Compiler/Lowering/Env.vuna"
let v_mkLwEnv = (fun (dtb_u_u332 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u333 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u334 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u335 : string) -> ((Base_dCommon.v_bind (v_eraseDefs dtb_u_u333)) (fun (dtb_u_u336 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((((((v_mkLwEnvFromErased dtb_u_u332) dtb_u_u336) dtb_u_u333) dtb_u_u334) dtb_u_u335))))))

# 33 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwShared = (fun (dtb_u_u337 : t_LwEnv) -> (match dtb_u_u337 with
  | { f_LwEnv_lwShared = dtb_u_u338; f_LwEnv_lwDatas = dtb_u_u339; f_LwEnv_lwDataTbl = dtb_u_u340; f_LwEnv_lwTyParams = dtb_u_u341; f_LwEnv_lwUnboxedInfo = dtb_u_u342; f_LwEnv_lwRecordFields = dtb_u_u343; f_LwEnv_lwCtors = dtb_u_u344; f_LwEnv_lwOpaques = dtb_u_u345; f_LwEnv_lwUnboxed = dtb_u_u346; f_LwEnv_lwHasListFamily = dtb_u_u347; f_LwEnv_lwDefs = dtb_u_u348; f_LwEnv_lwOrigDefs = dtb_u_u349; f_LwEnv_lwDefTbl = dtb_u_u350; f_LwEnv_lwGlobals = dtb_u_u351; f_LwEnv_lwFacts = dtb_u_u352; f_LwEnv_lwUnit = dtb_u_u353 } -> dtb_u_u338
  | _ -> failwith "DT: impossible branch"
))

# 35 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwDatas = (fun (dtb_u_u354 : t_LwEnv) -> (match dtb_u_u354 with
  | { f_LwEnv_lwShared = dtb_u_u355; f_LwEnv_lwDatas = dtb_u_u356; f_LwEnv_lwDataTbl = dtb_u_u357; f_LwEnv_lwTyParams = dtb_u_u358; f_LwEnv_lwUnboxedInfo = dtb_u_u359; f_LwEnv_lwRecordFields = dtb_u_u360; f_LwEnv_lwCtors = dtb_u_u361; f_LwEnv_lwOpaques = dtb_u_u362; f_LwEnv_lwUnboxed = dtb_u_u363; f_LwEnv_lwHasListFamily = dtb_u_u364; f_LwEnv_lwDefs = dtb_u_u365; f_LwEnv_lwOrigDefs = dtb_u_u366; f_LwEnv_lwDefTbl = dtb_u_u367; f_LwEnv_lwGlobals = dtb_u_u368; f_LwEnv_lwFacts = dtb_u_u369; f_LwEnv_lwUnit = dtb_u_u370 } -> dtb_u_u356
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwDataTbl = (fun (dtb_u_u371 : t_LwEnv) -> (match dtb_u_u371 with
  | { f_LwEnv_lwShared = dtb_u_u372; f_LwEnv_lwDatas = dtb_u_u373; f_LwEnv_lwDataTbl = dtb_u_u374; f_LwEnv_lwTyParams = dtb_u_u375; f_LwEnv_lwUnboxedInfo = dtb_u_u376; f_LwEnv_lwRecordFields = dtb_u_u377; f_LwEnv_lwCtors = dtb_u_u378; f_LwEnv_lwOpaques = dtb_u_u379; f_LwEnv_lwUnboxed = dtb_u_u380; f_LwEnv_lwHasListFamily = dtb_u_u381; f_LwEnv_lwDefs = dtb_u_u382; f_LwEnv_lwOrigDefs = dtb_u_u383; f_LwEnv_lwDefTbl = dtb_u_u384; f_LwEnv_lwGlobals = dtb_u_u385; f_LwEnv_lwFacts = dtb_u_u386; f_LwEnv_lwUnit = dtb_u_u387 } -> dtb_u_u374
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwTyParams = (fun (dtb_u_u388 : t_LwEnv) -> (match dtb_u_u388 with
  | { f_LwEnv_lwShared = dtb_u_u389; f_LwEnv_lwDatas = dtb_u_u390; f_LwEnv_lwDataTbl = dtb_u_u391; f_LwEnv_lwTyParams = dtb_u_u392; f_LwEnv_lwUnboxedInfo = dtb_u_u393; f_LwEnv_lwRecordFields = dtb_u_u394; f_LwEnv_lwCtors = dtb_u_u395; f_LwEnv_lwOpaques = dtb_u_u396; f_LwEnv_lwUnboxed = dtb_u_u397; f_LwEnv_lwHasListFamily = dtb_u_u398; f_LwEnv_lwDefs = dtb_u_u399; f_LwEnv_lwOrigDefs = dtb_u_u400; f_LwEnv_lwDefTbl = dtb_u_u401; f_LwEnv_lwGlobals = dtb_u_u402; f_LwEnv_lwFacts = dtb_u_u403; f_LwEnv_lwUnit = dtb_u_u404 } -> dtb_u_u392
  | _ -> failwith "DT: impossible branch"
))

# 42 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwUnboxedInfo = (fun (dtb_u_u405 : t_LwEnv) -> (match dtb_u_u405 with
  | { f_LwEnv_lwShared = dtb_u_u406; f_LwEnv_lwDatas = dtb_u_u407; f_LwEnv_lwDataTbl = dtb_u_u408; f_LwEnv_lwTyParams = dtb_u_u409; f_LwEnv_lwUnboxedInfo = dtb_u_u410; f_LwEnv_lwRecordFields = dtb_u_u411; f_LwEnv_lwCtors = dtb_u_u412; f_LwEnv_lwOpaques = dtb_u_u413; f_LwEnv_lwUnboxed = dtb_u_u414; f_LwEnv_lwHasListFamily = dtb_u_u415; f_LwEnv_lwDefs = dtb_u_u416; f_LwEnv_lwOrigDefs = dtb_u_u417; f_LwEnv_lwDefTbl = dtb_u_u418; f_LwEnv_lwGlobals = dtb_u_u419; f_LwEnv_lwFacts = dtb_u_u420; f_LwEnv_lwUnit = dtb_u_u421 } -> dtb_u_u410
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwRecordFields = (fun (dtb_u_u422 : t_LwEnv) -> (match dtb_u_u422 with
  | { f_LwEnv_lwShared = dtb_u_u423; f_LwEnv_lwDatas = dtb_u_u424; f_LwEnv_lwDataTbl = dtb_u_u425; f_LwEnv_lwTyParams = dtb_u_u426; f_LwEnv_lwUnboxedInfo = dtb_u_u427; f_LwEnv_lwRecordFields = dtb_u_u428; f_LwEnv_lwCtors = dtb_u_u429; f_LwEnv_lwOpaques = dtb_u_u430; f_LwEnv_lwUnboxed = dtb_u_u431; f_LwEnv_lwHasListFamily = dtb_u_u432; f_LwEnv_lwDefs = dtb_u_u433; f_LwEnv_lwOrigDefs = dtb_u_u434; f_LwEnv_lwDefTbl = dtb_u_u435; f_LwEnv_lwGlobals = dtb_u_u436; f_LwEnv_lwFacts = dtb_u_u437; f_LwEnv_lwUnit = dtb_u_u438 } -> dtb_u_u428
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwCtors = (fun (dtb_u_u439 : t_LwEnv) -> (match dtb_u_u439 with
  | { f_LwEnv_lwShared = dtb_u_u440; f_LwEnv_lwDatas = dtb_u_u441; f_LwEnv_lwDataTbl = dtb_u_u442; f_LwEnv_lwTyParams = dtb_u_u443; f_LwEnv_lwUnboxedInfo = dtb_u_u444; f_LwEnv_lwRecordFields = dtb_u_u445; f_LwEnv_lwCtors = dtb_u_u446; f_LwEnv_lwOpaques = dtb_u_u447; f_LwEnv_lwUnboxed = dtb_u_u448; f_LwEnv_lwHasListFamily = dtb_u_u449; f_LwEnv_lwDefs = dtb_u_u450; f_LwEnv_lwOrigDefs = dtb_u_u451; f_LwEnv_lwDefTbl = dtb_u_u452; f_LwEnv_lwGlobals = dtb_u_u453; f_LwEnv_lwFacts = dtb_u_u454; f_LwEnv_lwUnit = dtb_u_u455 } -> dtb_u_u446
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwOpaques = (fun (dtb_u_u456 : t_LwEnv) -> (match dtb_u_u456 with
  | { f_LwEnv_lwShared = dtb_u_u457; f_LwEnv_lwDatas = dtb_u_u458; f_LwEnv_lwDataTbl = dtb_u_u459; f_LwEnv_lwTyParams = dtb_u_u460; f_LwEnv_lwUnboxedInfo = dtb_u_u461; f_LwEnv_lwRecordFields = dtb_u_u462; f_LwEnv_lwCtors = dtb_u_u463; f_LwEnv_lwOpaques = dtb_u_u464; f_LwEnv_lwUnboxed = dtb_u_u465; f_LwEnv_lwHasListFamily = dtb_u_u466; f_LwEnv_lwDefs = dtb_u_u467; f_LwEnv_lwOrigDefs = dtb_u_u468; f_LwEnv_lwDefTbl = dtb_u_u469; f_LwEnv_lwGlobals = dtb_u_u470; f_LwEnv_lwFacts = dtb_u_u471; f_LwEnv_lwUnit = dtb_u_u472 } -> dtb_u_u464
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwUnboxed = (fun (dtb_u_u473 : t_LwEnv) -> (match dtb_u_u473 with
  | { f_LwEnv_lwShared = dtb_u_u474; f_LwEnv_lwDatas = dtb_u_u475; f_LwEnv_lwDataTbl = dtb_u_u476; f_LwEnv_lwTyParams = dtb_u_u477; f_LwEnv_lwUnboxedInfo = dtb_u_u478; f_LwEnv_lwRecordFields = dtb_u_u479; f_LwEnv_lwCtors = dtb_u_u480; f_LwEnv_lwOpaques = dtb_u_u481; f_LwEnv_lwUnboxed = dtb_u_u482; f_LwEnv_lwHasListFamily = dtb_u_u483; f_LwEnv_lwDefs = dtb_u_u484; f_LwEnv_lwOrigDefs = dtb_u_u485; f_LwEnv_lwDefTbl = dtb_u_u486; f_LwEnv_lwGlobals = dtb_u_u487; f_LwEnv_lwFacts = dtb_u_u488; f_LwEnv_lwUnit = dtb_u_u489 } -> dtb_u_u482
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwHasListFamily = (fun (dtb_u_u490 : t_LwEnv) -> (match dtb_u_u490 with
  | { f_LwEnv_lwShared = dtb_u_u491; f_LwEnv_lwDatas = dtb_u_u492; f_LwEnv_lwDataTbl = dtb_u_u493; f_LwEnv_lwTyParams = dtb_u_u494; f_LwEnv_lwUnboxedInfo = dtb_u_u495; f_LwEnv_lwRecordFields = dtb_u_u496; f_LwEnv_lwCtors = dtb_u_u497; f_LwEnv_lwOpaques = dtb_u_u498; f_LwEnv_lwUnboxed = dtb_u_u499; f_LwEnv_lwHasListFamily = dtb_u_u500; f_LwEnv_lwDefs = dtb_u_u501; f_LwEnv_lwOrigDefs = dtb_u_u502; f_LwEnv_lwDefTbl = dtb_u_u503; f_LwEnv_lwGlobals = dtb_u_u504; f_LwEnv_lwFacts = dtb_u_u505; f_LwEnv_lwUnit = dtb_u_u506 } -> dtb_u_u500
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwDefs = (fun (dtb_u_u507 : t_LwEnv) -> (match dtb_u_u507 with
  | { f_LwEnv_lwShared = dtb_u_u508; f_LwEnv_lwDatas = dtb_u_u509; f_LwEnv_lwDataTbl = dtb_u_u510; f_LwEnv_lwTyParams = dtb_u_u511; f_LwEnv_lwUnboxedInfo = dtb_u_u512; f_LwEnv_lwRecordFields = dtb_u_u513; f_LwEnv_lwCtors = dtb_u_u514; f_LwEnv_lwOpaques = dtb_u_u515; f_LwEnv_lwUnboxed = dtb_u_u516; f_LwEnv_lwHasListFamily = dtb_u_u517; f_LwEnv_lwDefs = dtb_u_u518; f_LwEnv_lwOrigDefs = dtb_u_u519; f_LwEnv_lwDefTbl = dtb_u_u520; f_LwEnv_lwGlobals = dtb_u_u521; f_LwEnv_lwFacts = dtb_u_u522; f_LwEnv_lwUnit = dtb_u_u523 } -> dtb_u_u518
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwOrigDefs = (fun (dtb_u_u524 : t_LwEnv) -> (match dtb_u_u524 with
  | { f_LwEnv_lwShared = dtb_u_u525; f_LwEnv_lwDatas = dtb_u_u526; f_LwEnv_lwDataTbl = dtb_u_u527; f_LwEnv_lwTyParams = dtb_u_u528; f_LwEnv_lwUnboxedInfo = dtb_u_u529; f_LwEnv_lwRecordFields = dtb_u_u530; f_LwEnv_lwCtors = dtb_u_u531; f_LwEnv_lwOpaques = dtb_u_u532; f_LwEnv_lwUnboxed = dtb_u_u533; f_LwEnv_lwHasListFamily = dtb_u_u534; f_LwEnv_lwDefs = dtb_u_u535; f_LwEnv_lwOrigDefs = dtb_u_u536; f_LwEnv_lwDefTbl = dtb_u_u537; f_LwEnv_lwGlobals = dtb_u_u538; f_LwEnv_lwFacts = dtb_u_u539; f_LwEnv_lwUnit = dtb_u_u540 } -> dtb_u_u536
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwDefTbl = (fun (dtb_u_u541 : t_LwEnv) -> (match dtb_u_u541 with
  | { f_LwEnv_lwShared = dtb_u_u542; f_LwEnv_lwDatas = dtb_u_u543; f_LwEnv_lwDataTbl = dtb_u_u544; f_LwEnv_lwTyParams = dtb_u_u545; f_LwEnv_lwUnboxedInfo = dtb_u_u546; f_LwEnv_lwRecordFields = dtb_u_u547; f_LwEnv_lwCtors = dtb_u_u548; f_LwEnv_lwOpaques = dtb_u_u549; f_LwEnv_lwUnboxed = dtb_u_u550; f_LwEnv_lwHasListFamily = dtb_u_u551; f_LwEnv_lwDefs = dtb_u_u552; f_LwEnv_lwOrigDefs = dtb_u_u553; f_LwEnv_lwDefTbl = dtb_u_u554; f_LwEnv_lwGlobals = dtb_u_u555; f_LwEnv_lwFacts = dtb_u_u556; f_LwEnv_lwUnit = dtb_u_u557 } -> dtb_u_u554
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwGlobals = (fun (dtb_u_u558 : t_LwEnv) -> (match dtb_u_u558 with
  | { f_LwEnv_lwShared = dtb_u_u559; f_LwEnv_lwDatas = dtb_u_u560; f_LwEnv_lwDataTbl = dtb_u_u561; f_LwEnv_lwTyParams = dtb_u_u562; f_LwEnv_lwUnboxedInfo = dtb_u_u563; f_LwEnv_lwRecordFields = dtb_u_u564; f_LwEnv_lwCtors = dtb_u_u565; f_LwEnv_lwOpaques = dtb_u_u566; f_LwEnv_lwUnboxed = dtb_u_u567; f_LwEnv_lwHasListFamily = dtb_u_u568; f_LwEnv_lwDefs = dtb_u_u569; f_LwEnv_lwOrigDefs = dtb_u_u570; f_LwEnv_lwDefTbl = dtb_u_u571; f_LwEnv_lwGlobals = dtb_u_u572; f_LwEnv_lwFacts = dtb_u_u573; f_LwEnv_lwUnit = dtb_u_u574 } -> dtb_u_u572
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwFacts = (fun (dtb_u_u575 : t_LwEnv) -> (match dtb_u_u575 with
  | { f_LwEnv_lwShared = dtb_u_u576; f_LwEnv_lwDatas = dtb_u_u577; f_LwEnv_lwDataTbl = dtb_u_u578; f_LwEnv_lwTyParams = dtb_u_u579; f_LwEnv_lwUnboxedInfo = dtb_u_u580; f_LwEnv_lwRecordFields = dtb_u_u581; f_LwEnv_lwCtors = dtb_u_u582; f_LwEnv_lwOpaques = dtb_u_u583; f_LwEnv_lwUnboxed = dtb_u_u584; f_LwEnv_lwHasListFamily = dtb_u_u585; f_LwEnv_lwDefs = dtb_u_u586; f_LwEnv_lwOrigDefs = dtb_u_u587; f_LwEnv_lwDefTbl = dtb_u_u588; f_LwEnv_lwGlobals = dtb_u_u589; f_LwEnv_lwFacts = dtb_u_u590; f_LwEnv_lwUnit = dtb_u_u591 } -> dtb_u_u590
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Lowering/Env.vuna"
let v_lwUnit = (fun (dtb_u_u592 : t_LwEnv) -> (match dtb_u_u592 with
  | { f_LwEnv_lwShared = dtb_u_u593; f_LwEnv_lwDatas = dtb_u_u594; f_LwEnv_lwDataTbl = dtb_u_u595; f_LwEnv_lwTyParams = dtb_u_u596; f_LwEnv_lwUnboxedInfo = dtb_u_u597; f_LwEnv_lwRecordFields = dtb_u_u598; f_LwEnv_lwCtors = dtb_u_u599; f_LwEnv_lwOpaques = dtb_u_u600; f_LwEnv_lwUnboxed = dtb_u_u601; f_LwEnv_lwHasListFamily = dtb_u_u602; f_LwEnv_lwDefs = dtb_u_u603; f_LwEnv_lwOrigDefs = dtb_u_u604; f_LwEnv_lwDefTbl = dtb_u_u605; f_LwEnv_lwGlobals = dtb_u_u606; f_LwEnv_lwFacts = dtb_u_u607; f_LwEnv_lwUnit = dtb_u_u608 } -> dtb_u_u608
  | _ -> failwith "DT: impossible branch"
))
