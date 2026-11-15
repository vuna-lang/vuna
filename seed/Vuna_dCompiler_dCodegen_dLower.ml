open Vuna_runtime
type t_Vuna_dCompiler_dCodegen_dLower_dLwEnv = { f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwShared : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrShared; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDatas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwTyParams : (string, int Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRecordFields : (string, (int, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors : (string, (string, bool Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwOpaques : (string, bool Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnboxed : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefTbl : (string, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRuntimeNames : (string, bool) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnit : string }
and t_Vuna_dCompiler_dCodegen_dLower_dLwSt = int
and t_Vuna_dCompiler_dCodegen_dLower_dLamChainIn = { f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBinders : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBody : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn = { f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeEnv : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aePats : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeSt : t_Vuna_dCompiler_dCodegen_dLower_dLwSt }

# 66 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlwEnvShared = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwShared = dtb__0; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDatas = dtb__1; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwTyParams = dtb__2; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRecordFields = dtb__3; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors = dtb__4; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwOpaques = dtb__5; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnboxed = dtb__6; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefs = dtb__7; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefTbl = dtb__8; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRuntimeNames = dtb__9; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnit = dtb__10 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlwEnvWithUnit = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwShared = dtb__11; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDatas = dtb__12; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwTyParams = dtb__13; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRecordFields = dtb__14; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors = dtb__15; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwOpaques = dtb__16; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnboxed = dtb__17; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefs = dtb__18; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefTbl = dtb__19; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRuntimeNames = dtb__20; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnit = dtb__21 } -> { f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwShared = dtb__11; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDatas = dtb__12; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwTyParams = dtb__13; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRecordFields = dtb__14; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors = dtb__15; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwOpaques = dtb__16; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnboxed = dtb__17; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefs = dtb__18; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefTbl = dtb__19; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRuntimeNames = dtb__20; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnit = mc0 }
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dpushDep = (fun dep deps -> (if (dep = "") then deps else (if ((Base_dList.v_Base_dList_dmemName dep) deps) then deps else ((Base_dList.v_Base_dList_dappend deps) (Base_dList.C_Base_dList_dList_Cons (dep, Base_dList.C_Base_dList_dList_Nil))))))

# 82 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dlistLength = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__22, dtb__23) -> (1 + (v_Vuna_dCompiler_dCodegen_dLower_dlistLength dtb__23))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dbinderErasedOf = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = dtb__24; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = dtb__25 } -> dtb__25
  | _ -> failwith "DT: impossible branch"
))

# 95 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dmapSome = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__26, dtb__27) -> (match (mc0 dtb__26) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dCodegen_dLower_dmapSome mc0) dtb__27)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__28) -> (Base_dList.C_Base_dList_dList_Cons (dtb__28, ((v_Vuna_dCompiler_dCodegen_dLower_dmapSome mc0) dtb__27)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_disTypeHeadOpaqueDatas = (fun datas name -> (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then false else (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then false else (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData name) datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__29) -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disTypeConstructorName name))
  | _ -> failwith "DT: impossible branch"
))))

# 110 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dmemOpaqueLevel = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__30, dtb__31) -> (if (dtb__30 = mc0) then true else ((v_Vuna_dCompiler_dCodegen_dLower_dmemOpaqueLevel mc0) dtb__31))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 122 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_disRecordData = (fun d -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataIsRecord d) then ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__32, dtb__33) -> (match dtb__33 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> false
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)) else false))

# 137 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_drecordRtFieldsGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__34, dtb__35) -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (if dtb__34 then (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__36).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex; Base_dPair.f_Base_dPair_dPair_second = (dtb__36).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName }, (((v_Vuna_dCompiler_dCodegen_dLower_drecordRtFieldsGo mc0) dtb__35) dtb__37))) else (((v_Vuna_dCompiler_dCodegen_dLower_drecordRtFieldsGo mc0) dtb__35) dtb__37))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 129 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_drecordRtFields = (fun d -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__38, dtb__39) -> (match dtb__39 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun arity -> (((v_Vuna_dCompiler_dCodegen_dLower_drecordRtFieldsGo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) ((Base_dList.v_Base_dList_ddrop arity) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags dtb__38))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataFields d))) (v_Vuna_dCompiler_dCodegen_dLower_dlistLength (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams))
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

# 145 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dhasRecordRepr = (fun d -> (if (v_Vuna_dCompiler_dCodegen_dLower_disRecordData d) then (match (v_Vuna_dCompiler_dCodegen_dLower_drecordRtFields d) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> true
) else false))

# 152 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_disBoolFamilyName = (fun name -> (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName))

# 156 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_disNatFamilyName = (fun name -> (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName))

# 160 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_drtDatasOf = (fun datas -> ((Base_dList.v_Base_dList_dfilter (fun d -> (if (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dCodegen_dLower_disBoolFamilyName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))) then (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dCodegen_dLower_disNatFamilyName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))) else false))) datas))

# 169 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__40, dtb__41) -> (match dtb__40 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__42; Base_dPair.f_Base_dPair_dPair_second = dtb__43 } -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__44, dtb__45, dtb__46, dtb__47, dtb__48) -> ((fun flag -> ((fun fam2 -> ((fun next -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueGo mc0) dtb__41) (mc2 + 1)) next) fam2) (Base_dList.C_Base_dList_dList_Cons (flag, mc5)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__48) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__44, mc2, Base_dList.C_Base_dList_dList_Nil))))))) (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue dtb__47) then (Base_dList.C_Base_dList_dList_Cons (mc2, mc4)) else mc4))) (if (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__43)) then (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped (fun l -> ((v_Vuna_dCompiler_dCodegen_dLower_dmemOpaqueLevel l) mc4))) (v_Vuna_dCompiler_dCodegen_dLower_disTypeHeadOpaqueDatas mc0)) mc2) mc4) dtb__47) else false))
  | _ -> (Base_dList.v_Base_dList_dreverse mc5)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc5)
  | _ -> failwith "DT: impossible branch"
))

# 166 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueFlagsOf = (fun datas c -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueGo datas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

# 183 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlocRowPair = (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__49) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (dtb__49).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartLine dtb__49) } }))
  | _ -> failwith "DT: impossible branch"
))

# 198 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dtypeParamLevelsGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dPair.v_Base_dPair_dsecondOf dtb__50)) then (Base_dList.C_Base_dList_dList_Cons (mc1, ((v_Vuna_dCompiler_dCodegen_dLower_dtypeParamLevelsGo dtb__51) (mc1 + 1)))) else ((v_Vuna_dCompiler_dCodegen_dLower_dtypeParamLevelsGo dtb__51) (mc1 + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 195 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dtypeParamLevels = (fun d -> ((v_Vuna_dCompiler_dCodegen_dLower_dtypeParamLevelsGo (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams) 0))

# 204 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dmemIntIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__52, dtb__53) -> (if (dtb__52 = mc0) then true else ((v_Vuna_dCompiler_dCodegen_dLower_dmemIntIn mc0) dtb__53))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 211 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dlevelSlotGoIn = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__54, dtb__55) -> (if (dtb__54 = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc2)) else (((v_Vuna_dCompiler_dCodegen_dLower_dlevelSlotGoIn dtb__55) mc1) (mc2 + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 208 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlevelSlotIn = (fun levels lvl -> (((v_Vuna_dCompiler_dCodegen_dLower_dlevelSlotGoIn levels) lvl) 0))

# 215 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dnthValueIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__56, dtb__57) -> (if (mc1 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__56)) else ((v_Vuna_dCompiler_dCodegen_dLower_dnthValueIn dtb__57) (mc1 - 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 219 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dlookupUsedIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__58, dtb__59) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__58) = mc1) then (Base_dPair.v_Base_dPair_dsecondOf dtb__58) else ((v_Vuna_dCompiler_dCodegen_dLower_dlookupUsedIn dtb__59) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 226 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedLevelsFuel = (fun fuel tps table datas lvl v -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__60, dtb__61, dtb__62, dtb__63, dtb__64) -> (if dtb__61 then ((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) (lvl + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__64) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__60, lvl, Base_dList.C_Base_dList_dList_Nil)))))) else ((Base_dList.v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) lvl) dtb__63)) ((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) (lvl + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__64) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__60, lvl, Base_dList.C_Base_dList_dList_Nil))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__65) -> (match dtb__65 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__66, dtb__67, dtb__68) -> ((Base_dList.v_Base_dList_dappend (if ((v_Vuna_dCompiler_dCodegen_dLower_dmemIntIn dtb__67) tps) then (Base_dList.C_Base_dList_dList_Cons (dtb__67, Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil)) ((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedSpineFuel (fuel - 1)) tps) table) datas) lvl) dtb__68))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__69, dtb__70) -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData dtb__69) datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__71) -> (((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) ((v_Vuna_dCompiler_dCodegen_dLower_dlookupUsedIn table) dtb__69)) dtb__70)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedSpineFuel (fuel - 1)) tps) table) datas) lvl) dtb__70)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)))
# 243 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedSpineFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__72, dtb__73) -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Nil else ((Base_dList.v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedLevelsFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__72)) ((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedSpineFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__73)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Nil else Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))
# 254 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dcollectFamilyArgsFuel = (fun fuel tps table datas lvl usedPats args -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match usedPats with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__74, dtb__75) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dnthValueIn args) dtb__74) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__76) -> ((Base_dList.v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) lvl) dtb__76)) (((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) dtb__75) args))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) dtb__75) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 223 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedLevels = (fun tps table datas lvl v -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedLevelsFuel 256) tps) table) datas) lvl) v))

# 250 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dcollectFamilyArgs = (fun tps table datas lvl usedPats args -> (((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectFamilyArgsFuel 256) tps) table) datas) lvl) usedPats) args))

# 264 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dctorUsedLevels = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__77, dtb__78) -> (match dtb__77 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__79; Base_dPair.f_Base_dPair_dPair_second = dtb__80 } -> (match mc6 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__81, dtb__82, dtb__83, dtb__84, dtb__85) -> ((fun isOpq -> ((fun fam2 -> ((fun next -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__80) then (((((((v_Vuna_dCompiler_dCodegen_dLower_dctorUsedLevels mc0) mc1) mc2) fam2) dtb__78) (mc5 + 1)) next) else (if isOpq then (((((((v_Vuna_dCompiler_dCodegen_dLower_dctorUsedLevels mc0) mc1) mc2) fam2) dtb__78) (mc5 + 1)) next) else ((Base_dList.v_Base_dList_dappend (((((v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedLevels mc0) mc1) mc2) mc5) dtb__84)) (((((((v_Vuna_dCompiler_dCodegen_dLower_dctorUsedLevels mc0) mc1) mc2) fam2) dtb__78) (mc5 + 1)) next))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__85) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__81, mc5, Base_dList.C_Base_dList_dList_Nil))))))) (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue dtb__84) then (Base_dList.C_Base_dList_dList_Cons (mc5, mc3)) else mc3))) (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped (fun l -> ((v_Vuna_dCompiler_dCodegen_dLower_dmemOpaqueLevel l) mc3))) (v_Vuna_dCompiler_dCodegen_dLower_disTypeHeadOpaqueDatas mc2)) mc5) mc3) dtb__84))
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 282 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_ddataUsedLevels = (fun d table datas -> ((fun raw -> ((Base_dList.v_Base_dList_dfilter (fun l -> ((v_Vuna_dCompiler_dCodegen_dLower_dmemIntIn l) raw))) (v_Vuna_dCompiler_dCodegen_dLower_dtypeParamLevels d))) ((Base_dList.v_Base_dList_dconcatMap (fun c -> (((((((v_Vuna_dCompiler_dCodegen_dLower_dctorUsedLevels (v_Vuna_dCompiler_dCodegen_dLower_dtypeParamLevels d)) table) datas) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))

# 291 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dlevelListEq = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__86, dtb__87) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__88, dtb__89) -> (if (dtb__86 = dtb__88) then ((v_Vuna_dCompiler_dCodegen_dLower_dlevelListEq dtb__87) dtb__89) else false)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 296 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dsameLevelTable = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__90, dtb__91) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__92, dtb__93) -> (if (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__90) = (Base_dPair.v_Base_dPair_dfirstOf dtb__92)) then ((v_Vuna_dCompiler_dCodegen_dLower_dlevelListEq (Base_dPair.v_Base_dPair_dsecondOf dtb__90)) (Base_dPair.v_Base_dPair_dsecondOf dtb__92)) else false) then ((v_Vuna_dCompiler_dCodegen_dLower_dsameLevelTable dtb__91) dtb__93) else false)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 306 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dusedTableFixFuel = (fun fuel datas table -> (if (fuel <= 0) then table else ((fun next -> (if ((v_Vuna_dCompiler_dCodegen_dLower_dsameLevelTable next) table) then next else (((v_Vuna_dCompiler_dCodegen_dLower_dusedTableFixFuel (fuel - 1)) datas) next))) ((Base_dList.v_Base_dList_dmap (fun d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dCodegen_dLower_ddataUsedLevels d) table) datas) })) datas))))

# 303 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dusedTableFix = (fun datas table -> (((v_Vuna_dCompiler_dCodegen_dLower_dusedTableFixFuel 64) datas) table))

# 314 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dtyParamsOf = (fun datas -> ((v_Vuna_dCompiler_dCodegen_dLower_dusedTableFix datas) ((Base_dList.v_Base_dList_dmap (fun d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil })) datas)))

# 349 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_drenderTyIntrinsic = (fun mc0 mc1 -> (if (mc0 = "Array") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__94, dtb__95) -> (match dtb__95 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (dtb__94))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "IORef") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__96, dtb__97) -> (match dtb__97 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef (dtb__96))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))

# 326 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_drenderTyFuel = (fun fuel levels table datas v -> (if (fuel <= 0) then Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__98) -> (match dtb__98 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__99, dtb__100, dtb__101) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dlevelSlotIn levels) dtb__100) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__102) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__102))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__103, dtb__104) -> ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderTyGlobal fuel) levels) table) datas) dtb__103) dtb__104)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque
)))
# 337 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_drenderTyGlobal = (fun fuel levels table datas g sp -> (match ((v_Vuna_dCompiler_dCodegen_dLower_drenderTyIntrinsic g) ((Base_dList.v_Base_dList_dmap (fun x -> (((((v_Vuna_dCompiler_dCodegen_dLower_drenderTyFuel (fuel - 1)) levels) table) datas) x))) sp)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__105) -> dtb__105
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName) then Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool else (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData g) datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__106) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (g, ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderFamilyArgs (fuel - 1)) levels) table) datas) ((v_Vuna_dCompiler_dCodegen_dLower_dlookupUsedIn table) g)) sp)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
))
# 354 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_drenderFamilyArgs = (fun fuel levels table datas usedPats args -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match usedPats with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__107, dtb__108) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dnthValueIn args) dtb__107) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__109) -> (Base_dList.C_Base_dList_dList_Cons ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderTyFuel (fuel - 1)) levels) table) datas) dtb__109), ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderFamilyArgs (fuel - 1)) levels) table) datas) dtb__108) args)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderFamilyArgs (fuel - 1)) levels) table) datas) dtb__108) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 323 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_drenderTyOf = (fun levels table datas v -> (((((v_Vuna_dCompiler_dCodegen_dLower_drenderTyFuel 256) levels) table) datas) v))

# 368 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_drenderPiTyFuel = (fun fuel levels table datas lvl v -> (if (fuel <= 0) then (((((v_Vuna_dCompiler_dCodegen_dLower_drenderTyFuel fuel) levels) table) datas) v) else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__110, dtb__111, dtb__112, dtb__113, dtb__114) -> ((fun next -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__112) then ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderPiTyFuel (fuel - 1)) levels) table) datas) (lvl + 1)) next) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (((((((v_Vuna_dCompiler_dCodegen_dLower_drenderPiTyFuel (fuel - 1)) levels) table) datas) lvl) dtb__113), ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderPiTyFuel (fuel - 1)) levels) table) datas) (lvl + 1)) next))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__114) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__110, lvl, Base_dList.C_Base_dList_dList_Nil))))))
  | _ -> (((((v_Vuna_dCompiler_dCodegen_dLower_drenderTyFuel fuel) levels) table) datas) v)
)))

# 365 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_drenderPiTy = (fun levels table datas lvl v -> ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderPiTyFuel 256) levels) table) datas) lvl) v))

# 380 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_drenderFieldTy = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__115) -> (match dtb__115 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__116, dtb__117, dtb__118) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dlevelSlotIn mc0) dtb__117) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__119) -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__119)); Base_dPair.f_Base_dPair_dPair_second = mc5 }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (mc5)); Base_dPair.f_Base_dPair_dPair_second = (mc5 + 1) }
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__120, dtb__121) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_drenderTyIntrinsic dtb__120) ((Base_dList.v_Base_dList_dmap (fun x -> (((((v_Vuna_dCompiler_dCodegen_dLower_drenderTyFuel 256) mc0) mc1) mc2) x))) dtb__121)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__122) -> { Base_dPair.f_Base_dPair_dPair_first = dtb__122; Base_dPair.f_Base_dPair_dPair_second = mc5 }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (dtb__120 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then { Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt; Base_dPair.f_Base_dPair_dPair_second = mc5 } else (if (dtb__120 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then { Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt; Base_dPair.f_Base_dPair_dPair_second = mc5 } else (if (dtb__120 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then { Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr; Base_dPair.f_Base_dPair_dPair_second = mc5 } else (if (dtb__120 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName) then { Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat; Base_dPair.f_Base_dPair_dPair_second = mc5 } else (if (dtb__120 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then { Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool; Base_dPair.f_Base_dPair_dPair_second = mc5 } else (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData dtb__120) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__123) -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__120, ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderFamilyArgs 256) mc0) mc1) mc2) ((v_Vuna_dCompiler_dCodegen_dLower_dlookupUsedIn mc1) dtb__120)) dtb__121))); Base_dPair.f_Base_dPair_dPair_second = mc5 }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (mc5)); Base_dPair.f_Base_dPair_dPair_second = (mc5 + 1) }
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__124, dtb__125, dtb__126, dtb__127, dtb__128) -> (if dtb__125 then { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (mc5)); Base_dPair.f_Base_dPair_dPair_second = (mc5 + 1) } else { Base_dPair.f_Base_dPair_dPair_first = (((((v_Vuna_dCompiler_dCodegen_dLower_drenderPiTy mc0) mc1) mc2) mc3) mc4); Base_dPair.f_Base_dPair_dPair_second = mc5 })
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (mc5)); Base_dPair.f_Base_dPair_dPair_second = (mc5 + 1) }
))

# 401 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dflagMatchesRigIn = (fun mc0 mc1 -> (if mc0 then (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased mc1)) else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased mc1)))

# 406 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dctorFieldTys = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__129, dtb__130) -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__131, dtb__132) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__133, dtb__134) -> (match dtb__133 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__135; Base_dPair.f_Base_dPair_dPair_second = dtb__136 } -> (if ((v_Vuna_dCompiler_dCodegen_dLower_dflagMatchesRigIn dtb__129) dtb__136) then (match mc7 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__137, dtb__138, dtb__139, dtb__140, dtb__141) -> ((fun next -> (if dtb__129 then (if dtb__131 then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dCodegen_dLower_dctorFieldTys mc0) mc1) mc2) dtb__130) dtb__132) dtb__134) (mc6 + 1)) next) mc8)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__142; Base_dPair.f_Base_dPair_dPair_second = dtb__143 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque, dtb__142)); Base_dPair.f_Base_dPair_dPair_second = dtb__143 }))
  | _ -> failwith "DT: impossible branch"
))) else (match ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderFieldTy mc0) mc1) mc2) mc6) dtb__140) mc8) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__144; Base_dPair.f_Base_dPair_dPair_second = dtb__145 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dCodegen_dLower_dctorFieldTys mc0) mc1) mc2) dtb__130) dtb__132) dtb__134) (mc6 + 1)) next) dtb__145)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__146; Base_dPair.f_Base_dPair_dPair_second = dtb__147 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__144, dtb__146)); Base_dPair.f_Base_dPair_dPair_second = dtb__147 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) else (((((((((v_Vuna_dCompiler_dCodegen_dLower_dctorFieldTys mc0) mc1) mc2) dtb__130) dtb__132) dtb__134) (mc6 + 1)) next) mc8))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__141) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__137, mc6, Base_dList.C_Base_dList_dList_Nil))))))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "constructor telescope does not match its type")
) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "constructor keep flag disagrees with telescope rig"))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc8 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__148, dtb__149) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "constructor opaque flags shorter than its shape")
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc8 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Nil -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__150, dtb__151) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "constructor shape has more binders than its telescope")
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc8 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Cons (dtb__152, dtb__153) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc8 }))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "constructor opaque flags longer than its shape")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 430 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dctorArityNeed = (fun levels table datas c -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dCodegen_dLower_dctorFieldTys levels) table) datas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c)) ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueFlagsOf datas) c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (v_Vuna_dCompiler_dCodegen_dLower_dlistLength levels))) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dPair.v_Base_dPair_dsecondOf p) - (v_Vuna_dCompiler_dCodegen_dLower_dlistLength levels)))))))

# 441 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dmaxIntListIn = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__154, dtb__155) -> (if (dtb__154 >= (v_Vuna_dCompiler_dCodegen_dLower_dmaxIntListIn dtb__155)) then dtb__154 else (v_Vuna_dCompiler_dCodegen_dLower_dmaxIntListIn dtb__155))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 436 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_ddataArityNeed = (fun levels table datas ctors -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (((v_Vuna_dCompiler_dCodegen_dLower_dctorArityNeed levels) table) datas)) ctors)) (fun ns -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dCodegen_dLower_dlistLength levels) + (v_Vuna_dCompiler_dCodegen_dLower_dmaxIntListIn ns)))))))

# 452 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_drecordFieldsOf = (fun datas -> ((Base_dList.v_Base_dList_dmap (fun d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dCodegen_dLower_drecordRtFields d) })) ((Base_dList.v_Base_dList_dfilter v_Vuna_dCompiler_dCodegen_dLower_dhasRecordRepr) ((Base_dList.v_Base_dList_dfilter (fun d -> (Base_dBool.v_Base_dBool_dnot ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet datas))))) datas))))

# 466 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dtyDeclOf = (fun table allDatas unboxed d -> ((fun levels -> ((fun arity -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (v_Vuna_dCompiler_dCodegen_dLower_dhasRecordRepr d) then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__156, dtb__157) -> (match dtb__157 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dCodegen_dLower_dctorFieldTys levels) table) allDatas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags dtb__156)) ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueFlagsOf allDatas) dtb__156)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__156)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__156))) (v_Vuna_dCompiler_dCodegen_dLower_dlistLength levels))) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), arity, (v_Vuna_dCompiler_dCodegen_dLower_drecordRtFields d), (Base_dPair.v_Base_dPair_dfirstOf p)))))))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("record family must have exactly one constructor: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("record family must have exactly one constructor: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dLower_ddataArityNeed levels) table) allDatas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun fullArity -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (fun c -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dCodegen_dLower_dctorFieldTys levels) table) allDatas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c)) ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueFlagsOf allDatas) c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (v_Vuna_dCompiler_dCodegen_dLower_dlistLength levels))) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dfirstOf p) })))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun ctors -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), fullArity, ctors)))))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__158) -> (match dtb__158 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__159; Base_dPair.f_Base_dPair_dPair_second = dtb__160 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dCodegen_dLower_dctorFieldTys levels) table) allDatas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags dtb__159)) ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueFlagsOf allDatas) dtb__159)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__159)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__159))) (v_Vuna_dCompiler_dCodegen_dLower_dlistLength levels))) (fun p -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__161, dtb__162) -> (match dtb__162 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrUnboxedDecl ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), arity, dtb__161))))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("unboxed constructor does not have exactly one kept field: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__159)))
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("unboxed constructor does not have exactly one kept field: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__159)))
)) (Base_dPair.v_Base_dPair_dfirstOf p))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dlookupUnboxedInfo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) unboxed))) (v_Vuna_dCompiler_dCodegen_dLower_dlistLength levels))) ((v_Vuna_dCompiler_dCodegen_dLower_dlookupUsedIn table) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))))

# 460 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dtyDeclsGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__163, dtb__164) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dLower_dtyDeclOf mc0) mc1) mc2) dtb__163)) (fun decl -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dLower_dtyDeclsGo mc0) mc1) mc2) dtb__164)) (fun tail -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (decl, tail))))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 457 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dtyDeclsOf = (fun allDatas subset -> ((((v_Vuna_dCompiler_dCodegen_dLower_dtyDeclsGo (v_Vuna_dCompiler_dCodegen_dLower_dtyParamsOf allDatas)) allDatas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedInfoOf allDatas)) subset))

# 497 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerBudgetFor = (fun size -> (512 + (8 * size)))

# 544 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dbinderAtIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__165, dtb__166) -> (if (mc0 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__165)) else ((v_Vuna_dCompiler_dCodegen_dLower_dbinderAtIn (mc0 - 1)) dtb__166))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 548 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_drecordFieldNameAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__167, dtb__168) -> (match dtb__167 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__169; Base_dPair.f_Base_dPair_dPair_second = dtb__170 } -> (if (dtb__169 = mc0) then dtb__170 else ((v_Vuna_dCompiler_dCodegen_dLower_drecordFieldNameAt mc0) dtb__168))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 553 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_drecordTermAsAppIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__171, dtb__172) -> (match dtb__171 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__173; Base_dPair.f_Base_dPair_dPair_second = dtb__174 } -> ((v_Vuna_dCompiler_dCodegen_dLower_drecordTermAsAppIn (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (mc0, dtb__173, dtb__174))) dtb__172)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 576 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerBridgeGuard = (fun env name ir -> (if (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtBridgesList name) then (if ((Base_dList.v_Base_dList_dmemName Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistFamilyName) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDatas)) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (ir)) else ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_ListBridgeRequired (name))) name)) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (ir))))

# 582 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_deffUnitTyIn = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffUnitTypeName, Base_dList.C_Base_dList_dList_Nil))

# 560 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerGlobalRef = (fun env name -> (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (0)))) else (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtNatSucc)))) else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__175) -> (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dprimEffBind1Name) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffTypeName, Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffMkCtor, v_Vuna_dCompiler_dCodegen_dLower_deffUnitTyIn)))) else (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicReturnsEff dtb__175) then (((v_Vuna_dCompiler_dCodegen_dLower_dlowerBridgeGuard env) name) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffTypeName, Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffMkCtor, v_Vuna_dCompiler_dCodegen_dLower_deffUnitTyIn, (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicArity dtb__175), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ((Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicName dtb__175)))))) else (((v_Vuna_dCompiler_dCodegen_dLower_dlowerBridgeGuard env) name) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ((Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicName dtb__175))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (name))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__176) -> (match dtb__176 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__177; Base_dPair.f_Base_dPair_dPair_second = dtb__178 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__177, name, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dlookupPair name) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors)))))

# 591 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dcollectLamChainIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__179, dtb__180, dtb__181) -> (match (v_Vuna_dCompiler_dCodegen_dLower_dcollectLamChainIn dtb__181) with
  | { f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBinders = dtb__182; f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBody = dtb__183 } -> { f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBinders = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__179; Base_dPair.f_Base_dPair_dPair_second = dtb__180 }, dtb__182)); f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBody = dtb__183 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBinders = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBody = mc0 }
))

# 607 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dbinderOfParam = (fun mc0 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__184; Base_dPair.f_Base_dPair_dPair_second = dtb__185 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__185) then Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased else (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinder dtb__184))
  | _ -> failwith "DT: impossible branch"
))

# 679 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dconcatLeavesIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__186, dtb__187, dtb__188) -> (match dtb__186 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__189, dtb__190, dtb__191) -> (if (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__191) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__188)) then (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__189, dtb__190, dtb__191)), dtb__187, dtb__188)), Base_dList.C_Base_dList_dList_Nil)) else (match dtb__189 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__192) -> (if (dtb__192 = "++") then ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dLower_dconcatLeavesIn dtb__190)) (v_Vuna_dCompiler_dCodegen_dLower_dconcatLeavesIn dtb__187)) else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__189, dtb__190, dtb__191)), dtb__187, dtb__188)), Base_dList.C_Base_dList_dList_Nil)))
  | _ -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__189, dtb__190, dtb__191)), dtb__187, dtb__188)), Base_dList.C_Base_dList_dList_Nil))
))
  | _ -> (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil))
)
  | _ -> (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil))
))

# 672 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dflattenConcatChainIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__193, dtb__194, dtb__195) -> (match dtb__193 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__196, dtb__197, dtb__198) -> (if (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__198) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__195)) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match dtb__196 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__199) -> (if (dtb__199 = "++") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dLower_dconcatLeavesIn dtb__197)) (v_Vuna_dCompiler_dCodegen_dLower_dconcatLeavesIn dtb__194)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 688 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dflattenIntrinsicAppIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__200, dtb__201, dtb__202) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__202) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match dtb__200 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__203) -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity dtb__203) > 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__203; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__201; Base_dPair.f_Base_dPair_dPair_second = dtb__202 }, Base_dList.C_Base_dList_dList_Nil)) })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__204) -> (match dtb__204 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__205; Base_dPair.f_Base_dPair_dPair_second = dtb__206 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__205; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__206) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__201; Base_dPair.f_Base_dPair_dPair_second = dtb__202 }, Base_dList.C_Base_dList_dList_Nil))) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dLower_dflattenIntrinsicAppIn dtb__200))
))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 697 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dinlineArityMatchesIn = (fun name args -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity name) <= 0) then false else ((v_Vuna_dCompiler_dCodegen_dLower_dlistLength args) = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity name))))

# 706 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__207, dtb__208) -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__209, dtb__210) -> (match dtb__209 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__211; Base_dPair.f_Base_dPair_dPair_second = dtb__212 } -> (if dtb__207 then (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__212) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["constructor "; mc0; ": runtime field marked erased"])) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs mc0) dtb__208) dtb__210)) (fun ts -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__211; Base_dPair.f_Base_dPair_dPair_second = dtb__212 }, ts))))))) else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__212) then (((v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs mc0) dtb__208) dtb__210) else (((v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs mc0) dtb__208) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__211; Base_dPair.f_Base_dPair_dPair_second = dtb__212 }, dtb__210)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if dtb__207 then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["constructor "; mc0; ": application has fewer arguments than its shape"])) else (((v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs mc0) dtb__208) Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__213, dtb__214) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["constructor "; mc0; ": application has more arguments than its shape"]))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 733 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dctorArgIr = (fun mc0 mc1 -> (if mc0 then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (mc1)) else mc1))

# 738 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueKeptFlags = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__215, dtb__216) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__217, dtb__218) -> (if dtb__215 then (Base_dList.C_Base_dList_dList_Cons (dtb__217, ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueKeptFlags dtb__216) dtb__218))) else ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueKeptFlags dtb__216) dtb__218))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
))

# 786 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dzipFieldNames = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__219, dtb__220) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__221, dtb__222) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dsecondOf dtb__219); Base_dPair.f_Base_dPair_dPair_second = dtb__221 }, ((v_Vuna_dCompiler_dCodegen_dLower_dzipFieldNames dtb__220) dtb__222)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
))

# 777 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerConAppFinish = (fun env st family c irs -> (if ((Base_dList.v_Base_dList_dmemName family) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnboxed) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__223, dtb__224) -> (match dtb__224 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__223; Base_dPair.f_Base_dPair_dPair_second = st }))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "unboxed constructor application does not have exactly one runtime argument")
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "unboxed constructor application does not have exactly one runtime argument")
)) irs) else (match ((Base_dList.v_Base_dList_dlookupPair family) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRecordFields) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__225) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (family, ((v_Vuna_dCompiler_dCodegen_dLower_dzipFieldNames dtb__225) irs))); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (family, c, irs)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | _ -> failwith "DT: impossible branch"
)))

# 801 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_daeEnvOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeEnv = dtb__226; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aePats = dtb__227; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeSt = dtb__228 } -> dtb__226
  | _ -> failwith "DT: impossible branch"
))

# 804 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_daePatsOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeEnv = dtb__229; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aePats = dtb__230; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeSt = dtb__231 } -> dtb__230
  | _ -> failwith "DT: impossible branch"
))

# 807 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_daeStOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeEnv = dtb__232; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aePats = dtb__233; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeSt = dtb__234 } -> dtb__234
  | _ -> failwith "DT: impossible branch"
))

# 810 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dcountKept = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__235, dtb__236) -> (if dtb__235 then (1 + (v_Vuna_dCompiler_dCodegen_dLower_dcountKept dtb__236)) else (v_Vuna_dCompiler_dCodegen_dLower_dcountKept dtb__236))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 814 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_daltEnvGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__237, dtb__238) -> (match dtb__237 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__239; Base_dPair.f_Base_dPair_dPair_second = dtb__240 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__240) then ((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvGo mc0) (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased, mc1))) dtb__238) mc3) else ((fun fresh -> ((fun b -> ((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvGo (fresh + 1)) (Base_dList.C_Base_dList_dList_Cons (b, mc1))) dtb__238) (Base_dList.C_Base_dList_dList_Cons (b, mc3)))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderArm fresh))) (let dtb__241 = mc0 in dtb__241)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeEnv = mc1; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aePats = (Base_dList.v_Base_dList_dreverse mc3); f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeSt = mc0 }
  | _ -> failwith "DT: impossible branch"
))

# 823 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_daltEnvIn = (fun st outer tele -> ((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvGo st) outer) tele) Base_dList.C_Base_dList_dList_Nil))

# 835 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_daltEnvFullIn = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__242, dtb__243) -> (match dtb__242 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__244; Base_dPair.f_Base_dPair_dPair_second = dtb__245 } -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": case branch has more binders than its shape"]))
  | Base_dList.C_Base_dList_dList_Cons (dtb__246, dtb__247) -> (if ((v_Vuna_dCompiler_dCodegen_dLower_dflagMatchesRigIn dtb__246) dtb__245) then (if dtb__246 then ((fun fresh -> ((fun b -> ((((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvFullIn (fresh + 1)) mc1) (Base_dList.C_Base_dList_dList_Cons (b, mc2))) dtb__243) dtb__247) (Base_dList.C_Base_dList_dList_Cons (b, mc5)))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderArm fresh))) (let dtb__248 = mc0 in dtb__248)) else ((((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvFullIn mc0) mc1) (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased, mc2))) dtb__243) dtb__247) mc5)) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": case branch binder rig disagrees with its shape"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeEnv = mc2; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aePats = (Base_dList.v_Base_dList_dreverse mc5); f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeSt = mc0 }))
  | Base_dList.C_Base_dList_dList_Cons (dtb__249, dtb__250) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": case branch has fewer binders than its shape"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 849 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_daltEnvKeptIn = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__251, dtb__252) -> (match dtb__251 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__253; Base_dPair.f_Base_dPair_dPair_second = dtb__254 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__254) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": kept-field branch has an erased binder"])) else ((fun fresh -> ((fun b -> (((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvKeptIn (fresh + 1)) mc1) (Base_dList.C_Base_dList_dList_Cons (b, mc2))) dtb__252) (Base_dList.C_Base_dList_dList_Cons (b, mc4)))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderArm fresh))) (let dtb__255 = mc0 in dtb__255)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeEnv = mc2; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aePats = (Base_dList.v_Base_dList_dreverse mc4); f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeSt = mc0 }))
  | _ -> failwith "DT: impossible branch"
))

# 828 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_daltEnvCheckedIn = (fun st label outer binders flags -> (if ((v_Vuna_dCompiler_dCodegen_dLower_dlistLength binders) = (v_Vuna_dCompiler_dCodegen_dLower_dlistLength flags)) then ((((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvFullIn st) label) outer) binders) flags) Base_dList.C_Base_dList_dList_Nil) else (if ((v_Vuna_dCompiler_dCodegen_dLower_dlistLength binders) = (v_Vuna_dCompiler_dCodegen_dLower_dcountKept flags)) then (((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvKeptIn st) label) outer) binders) Base_dList.C_Base_dList_dList_Nil) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr (String.concat "" ["DT: internal: constructor "; label; ": case branch binder count matches neither full telescope nor kept fields"])))))

# 862 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dhasFallbackAlt = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__256, dtb__257) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__256) = "") then true else (v_Vuna_dCompiler_dCodegen_dLower_dhasFallbackAlt dtb__257))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 866 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dallCatchAll = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__258, dtb__259) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__258) = "") then (v_Vuna_dCompiler_dCodegen_dLower_dallCatchAll dtb__259) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 871 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerUnboxedCaseAlt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__260, dtb__261) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__260) = "") then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun name -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__262) -> (match dtb__262 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__263; Base_dPair.f_Base_dPair_dPair_second = dtb__264 } -> (if ((Base_dList.v_Base_dList_dmemName dtb__263) (mc0).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnboxed) then (if (v_Vuna_dCompiler_dCodegen_dLower_dallCatchAll dtb__261) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__260)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dlookupPair name) (mc0).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__260)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 923 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_disNatCtorName = (fun name -> (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then true else (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor)))

# 930 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dnatCaseAllCtors = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__265, dtb__266) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__265) = "") then (v_Vuna_dCompiler_dCodegen_dLower_dnatCaseAllCtors dtb__266) else ((fun name -> (if (v_Vuna_dCompiler_dCodegen_dLower_disNatCtorName name) then (v_Vuna_dCompiler_dCodegen_dLower_dnatCaseAllCtors dtb__266) else false)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__265)))
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 936 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dnatCaseHasCtor = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__267, dtb__268) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__267) = "") then (v_Vuna_dCompiler_dCodegen_dLower_dnatCaseHasCtor dtb__268) else true)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 926 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dnatCaseApplies = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> (if (v_Vuna_dCompiler_dCodegen_dLower_dnatCaseAllCtors mc0) then (v_Vuna_dCompiler_dCodegen_dLower_dnatCaseHasCtor mc0) else false)
))

# 942 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dfindAltBy = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__269, dtb__270) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__269) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__269)) else ((v_Vuna_dCompiler_dCodegen_dLower_dfindAltBy mc0) dtb__270))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 946 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dfindCatchAllAlt = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__271, dtb__272) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__271) = "") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__271)) else (v_Vuna_dCompiler_dCodegen_dLower_dfindCatchAllAlt dtb__272))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1003 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_drecordProjVarIn = (fun i -> ("@vuna@record@proj" ^ (bi_strFromInt i)))

# 1006 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dprojBindersIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__273, dtb__274) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dCodegen_dLower_drecordProjVarIn mc1); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__273) }, ((v_Vuna_dCompiler_dCodegen_dLower_dprojBindersIn dtb__274) (mc1 + 1))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1013 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dlookupRtLabelIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__275, dtb__276) -> (match dtb__275 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__277; Base_dPair.f_Base_dPair_dPair_second = dtb__278 } -> (if (dtb__277 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__278)) else ((v_Vuna_dCompiler_dCodegen_dLower_dlookupRtLabelIn mc0) dtb__276))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1018 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dlookupRtPosIn = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__279, dtb__280) -> (match dtb__279 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__281; Base_dPair.f_Base_dPair_dPair_second = dtb__282 } -> (if (dtb__281 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc2)) else (((v_Vuna_dCompiler_dCodegen_dLower_dlookupRtPosIn mc0) dtb__280) (mc2 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1023 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dlookupRtPositionsIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__283, dtb__284) -> (match (((v_Vuna_dCompiler_dCodegen_dLower_dlookupRtPosIn dtb__283) mc0) 0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__285) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__283; Base_dPair.f_Base_dPair_dPair_second = dtb__285 }, ((v_Vuna_dCompiler_dCodegen_dLower_dlookupRtPositionsIn mc0) dtb__284)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dCodegen_dLower_dlookupRtPositionsIn mc0) dtb__284)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1029 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dnthOpqArgIn = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__286, dtb__287) -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__288, dtb__289) -> (match dtb__288 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__290; Base_dPair.f_Base_dPair_dPair_second = dtb__291 } -> (if (mc0 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__290)) else (((v_Vuna_dCompiler_dCodegen_dLower_dnthOpqArgIn (mc0 - 1)) dtb__287) dtb__289))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1040 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_deraseTele = (fun b -> Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased)

# 1037 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_drecordAltBindersIn = (fun tele binders -> ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dLower_deraseTele) tele))) binders))

# 503 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel = (fun fuel env st binders t -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__292, dtb__293, dtb__294) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dbinderAtIn dtb__293) binders) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__295) -> (if (v_Vuna_dCompiler_dCodegen_dLower_dbinderErasedOf dtb__295) then ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_TypeLevelBindingRuntime (dtb__292))) dtb__292) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__295)); Base_dPair.f_Base_dPair_dPair_second = st })))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "unbound runtime variable")
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__296) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dLower_dlowerGlobalRef env) dtb__296)) (fun ir -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ir; Base_dPair.f_Base_dPair_dPair_second = st }))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__297) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__297)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__298) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__298)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__299) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__299)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__300) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__300)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__301, dtb__302, dtb__303) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) binders) dtb__301)) (fun pc -> (match pc with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__304; Base_dPair.f_Base_dPair_dPair_second = dtb__305 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) dtb__305) binders) dtb__302)) (fun pt -> (match pt with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__306; Base_dPair.f_Base_dPair_dPair_second = dtb__307 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) dtb__307) binders) dtb__303)) (fun pe -> (match pe with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__308; Base_dPair.f_Base_dPair_dPair_second = dtb__309 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__304, dtb__306, dtb__308)); Base_dPair.f_Base_dPair_dPair_second = dtb__309 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__310, dtb__311, dtb__312) -> (((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerLamFuel (fuel - 1)) env) st) binders) dtb__310) dtb__311) dtb__312)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__313, dtb__314, dtb__315) -> (((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerAppFuel (fuel - 1)) env) st) binders) dtb__313) dtb__314) dtb__315)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__316, dtb__317) -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerConAppFuel (fuel - 1)) env) st) binders) dtb__316) dtb__317)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__318, dtb__319) -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerConAppFuel (fuel - 1)) env) st) binders) dtb__318) dtb__319)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__320, dtb__321) -> (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) binders) ((v_Vuna_dCompiler_dCodegen_dLower_drecordTermAsAppIn (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__320))) dtb__321))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__322, dtb__323) -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerCaseFuel (fuel - 1)) env) st) binders) dtb__322) dtb__323)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__324, dtb__325, dtb__326, dtb__327, dtb__328) -> (match ((Base_dList.v_Base_dList_dlookupPair dtb__325) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRecordFields) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__329) -> ((((((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerRecordUpdateFuel (fuel - 1)) env) st) binders) dtb__324) dtb__325) dtb__326) dtb__329) dtb__327) dtb__328)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) binders) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__324, (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__325; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__326; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__328 }, Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__330, dtb__331, dtb__332, dtb__333, dtb__334) -> (match ((Base_dList.v_Base_dList_dlookupPair dtb__331) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRecordFields) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__335) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) binders) dtb__330)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__336; Base_dPair.f_Base_dPair_dPair_second = dtb__337 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__336, dtb__331, ((v_Vuna_dCompiler_dCodegen_dLower_drecordFieldNameAt dtb__334) dtb__335))); Base_dPair.f_Base_dPair_dPair_second = dtb__337 }))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerProjAsCaseFuel (fuel - 1)) env) st) binders) dtb__330) dtb__331) dtb__332) dtb__333) dtb__334)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__338, dtb__339, dtb__340, dtb__341, dtb__342) -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_TypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__343) -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_TypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__344) -> ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_UnsolvedMetavarRuntime ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__344)))) (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__344))
  | _ -> failwith "DT: impossible branch"
)))
# 596 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerLamFuel = (fun fuel env st binders name rig body -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (match (v_Vuna_dCompiler_dCodegen_dLower_dcollectLamChainIn (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, body))) with
  | { f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBinders = dtb__345; f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBody = dtb__346 } -> ((fun bs -> ((fun envB -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) envB) dtb__346)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__347; Base_dPair.f_Base_dPair_dPair_second = dtb__348 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (bs, dtb__347)); Base_dPair.f_Base_dPair_dPair_second = dtb__348 }))
  | _ -> failwith "DT: impossible branch"
)))) ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse bs)) binders))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dLower_dbinderOfParam) dtb__345))
  | _ -> failwith "DT: impossible branch"
)))
# 611 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerAppFuel = (fun fuel env st binders f a rig -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased rig) then (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) binders) f) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerAppOptimizedFuel (fuel - 1)) env) st) binders) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (f, a, rig)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__349) -> (match dtb__349 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__350; Base_dPair.f_Base_dPair_dPair_second = dtb__351 } -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerConAppFuel (fuel - 1)) env) st) binders) dtb__350) dtb__351)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (f, a, rig)))))))
# 618 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerAppOptimizedFuel = (fun fuel env st binders t -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (match (v_Vuna_dCompiler_dCodegen_dLower_dflattenConcatChainIn t) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__352) -> (if ((v_Vuna_dCompiler_dCodegen_dLower_dlistLength dtb__352) >= 3) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermsFuel (fuel - 1)) env) st) binders) dtb__352)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__353; Base_dPair.f_Base_dPair_dPair_second = dtb__354 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__353)); Base_dPair.f_Base_dPair_dPair_second = dtb__354 }))
  | _ -> failwith "DT: impossible branch"
))) else (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerPlainAppFuel (fuel - 1)) env) st) binders) t))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerPlainAppFuel (fuel - 1)) env) st) binders) t)
  | _ -> failwith "DT: impossible branch"
)))
# 627 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerPlainAppFuel = (fun fuel env st binders t -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__355, dtb__356, dtb__357) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerAppFallbackFuel (fuel - 1)) env) st) binders) dtb__355) dtb__356) dtb__357)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__358) -> (match dtb__358 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__359; Base_dPair.f_Base_dPair_dPair_second = dtb__360 } -> (if ((v_Vuna_dCompiler_dCodegen_dLower_dinlineArityMatchesIn dtb__359) dtb__360) then ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerInlineAppFuel (fuel - 1)) env) st) binders) dtb__359) dtb__360) else (((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerAppFallbackFuel (fuel - 1)) env) st) binders) dtb__355) dtb__356) dtb__357))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dLower_dflattenIntrinsicAppIn t))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "lowerPlainApp expects an application")
)))
# 637 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerAppFallbackFuel = (fun fuel env st binders f a rig -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) binders) f)) (fun pf -> (match pf with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__361; Base_dPair.f_Base_dPair_dPair_second = dtb__362 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) dtb__362) binders) a)) (fun pa -> (match pa with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__363; Base_dPair.f_Base_dPair_dPair_second = dtb__364 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__361, dtb__363)); Base_dPair.f_Base_dPair_dPair_second = dtb__364 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
# 645 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerInlineAppFuel = (fun fuel env st binders name args -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerInlineArgsFuel (fuel - 1)) env) st) binders) args)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__365; Base_dPair.f_Base_dPair_dPair_second = dtb__366 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (name, dtb__365)); Base_dPair.f_Base_dPair_dPair_second = dtb__366 }))
  | _ -> failwith "DT: impossible branch"
)))))
# 651 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerInlineArgsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__367, dtb__368) -> (match dtb__367 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__369; Base_dPair.f_Base_dPair_dPair_second = dtb__370 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__370) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "erased argument in inlined builtin application") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__369)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__371; Base_dPair.f_Base_dPair_dPair_second = dtb__372 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerInlineArgsFuel (mc0 - 1)) mc1) dtb__372) mc3) dtb__368)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__373; Base_dPair.f_Base_dPair_dPair_second = dtb__374 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__371, dtb__373)); Base_dPair.f_Base_dPair_dPair_second = dtb__374 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
# 662 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerTermsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__375, dtb__376) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__375)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__377; Base_dPair.f_Base_dPair_dPair_second = dtb__378 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermsFuel (mc0 - 1)) mc1) dtb__378) mc3) dtb__376)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__379; Base_dPair.f_Base_dPair_dPair_second = dtb__380 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__377, dtb__379)); Base_dPair.f_Base_dPair_dPair_second = dtb__380 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
# 720 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerConArgsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__381, dtb__382) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__383, dtb__384) -> (match dtb__383 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__385; Base_dPair.f_Base_dPair_dPair_second = dtb__386 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__385)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__387; Base_dPair.f_Base_dPair_dPair_second = dtb__388 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerConArgsFuel (mc0 - 1)) mc1) dtb__388) mc3) dtb__382) dtb__384)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__389; Base_dPair.f_Base_dPair_dPair_second = dtb__390 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dCodegen_dLower_dctorArgIr dtb__381) dtb__387), dtb__389)); Base_dPair.f_Base_dPair_dPair_second = dtb__390 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__391, dtb__392) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "constructor opaque flags shorter than runtime arguments")
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 744 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerConAppFuel = (fun fuel env st binders c args -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dnatChainValue (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (c, args))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__393) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__393)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerConAppNonChainFuel (fuel - 1)) env) st) binders) c) args)
  | _ -> failwith "DT: impossible branch"
)))
# 750 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerConAppNonChainFuel = (fun fuel env st binders c args -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (if (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then (match (((v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs c) Base_dList.C_Base_dList_dList_Nil) args) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__394) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__394))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__395) -> (match dtb__395 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (0)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "Nat Zero applied to arguments")
)
  | _ -> failwith "DT: impossible branch"
) else (if (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then (match (((v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs c) (Base_dList.C_Base_dList_dList_Cons (true, Base_dList.C_Base_dList_dList_Nil))) args) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__396) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__396))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__397) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerConArgsFuel (fuel - 1)) env) st) binders) (Base_dList.C_Base_dList_dList_Cons (false, Base_dList.C_Base_dList_dList_Nil))) dtb__397)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__398; Base_dPair.f_Base_dPair_dPair_second = dtb__399 } -> (match dtb__398 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__400, dtb__401) -> (match dtb__401 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtNatSucc)), dtb__400)); Base_dPair.f_Base_dPair_dPair_second = dtb__399 }))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "Nat Succ must have exactly one runtime argument")
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "Nat Succ must have exactly one runtime argument")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__402) -> (match dtb__402 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__403; Base_dPair.f_Base_dPair_dPair_second = dtb__404 } -> (match ((Base_dList.v_Base_dList_dlookupPair c) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwOpaques) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("no opaque shape for constructor " ^ c))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__405) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs c) dtb__404) args)) (fun runtimeArgs -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerConArgsFuel (fuel - 1)) env) st) binders) ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueKeptFlags dtb__404) dtb__405)) runtimeArgs)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__406; Base_dPair.f_Base_dPair_dPair_second = dtb__407 } -> (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerConAppFinish env) dtb__407) dtb__403) c) dtb__406)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("unknown constructor " ^ c))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dlookupPair c) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors))))))
# 859 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerArmBodyFuel = (fun fuel env bound body -> (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel fuel) env) (v_Vuna_dCompiler_dCodegen_dLower_daeStOf bound)) (v_Vuna_dCompiler_dCodegen_dLower_daeEnvOf bound)) body))
# 881 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerUnboxedCaseFuel = (fun fuel env st outer scrut alt -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt) = "") then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "unboxed case arm has no constructor") else ((fun name -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__408) -> (match dtb__408 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__409; Base_dPair.f_Base_dPair_dPair_second = dtb__410 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__411; Base_dPair.f_Base_dPair_dPair_second = dtb__412 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvCheckedIn dtb__412) name) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)) dtb__410)) (fun bound -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dLower_dlowerArmBodyFuel (fuel - 1)) env) bound) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__413; Base_dPair.f_Base_dPair_dPair_second = dtb__414 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet ((v_Vuna_dCompiler_dCodegen_dLower_daePatsOf bound), dtb__411, dtb__413)); Base_dPair.f_Base_dPair_dPair_second = dtb__414 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("no shape for constructor " ^ name))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dlookupPair name) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)))))
# 895 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerArmFuel = (fun fuel env st outer alt -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt) = "") then ((fun bound -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dLower_dlowerArmBodyFuel (fuel - 1)) env) bound) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__415; Base_dPair.f_Base_dPair_dPair_second = dtb__416 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (v_Vuna_dCompiler_dCodegen_dLower_daePatsOf bound); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__415 }; Base_dPair.f_Base_dPair_dPair_second = dtb__416 }))
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dCodegen_dLower_daltEnvIn st) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt))) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__417) -> (match dtb__417 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__418; Base_dPair.f_Base_dPair_dPair_second = dtb__419 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvCheckedIn st) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)) dtb__419)) (fun bound -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dLower_dlowerArmBodyFuel (fuel - 1)) env) bound) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__420; Base_dPair.f_Base_dPair_dPair_second = dtb__421 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__418; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt) })); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (v_Vuna_dCompiler_dCodegen_dLower_daePatsOf bound); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__420 }; Base_dPair.f_Base_dPair_dPair_second = dtb__421 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("unknown constructor " ^ (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dlookupPair (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors)))))
# 911 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerArmsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__422, dtb__423) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerArmFuel (mc0 - 1)) mc1) mc2) mc3) dtb__422)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__424; Base_dPair.f_Base_dPair_dPair_second = dtb__425 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerArmsFuel (mc0 - 1)) mc1) dtb__425) mc3) dtb__423)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__426; Base_dPair.f_Base_dPair_dPair_second = dtb__427 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__424, dtb__426)); Base_dPair.f_Base_dPair_dPair_second = dtb__427 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
# 951 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerNatAltFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__428) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((fun bound -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dLower_dlowerArmBodyFuel (mc0 - 1)) mc1) bound) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__428))) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__429; Base_dPair.f_Base_dPair_dPair_second = dtb__430 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (v_Vuna_dCompiler_dCodegen_dLower_daePatsOf bound); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__429 })); Base_dPair.f_Base_dPair_dPair_second = dtb__430 }))
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dCodegen_dLower_daltEnvIn mc2) mc3) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__428))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Base_dPair.f_Base_dPair_dPair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))
# 961 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerNatCaseFuel = (fun fuel env st outer scrut alts -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__431; Base_dPair.f_Base_dPair_dPair_second = dtb__432 } -> ((fun fresh -> ((fun st2 -> ((fun zeroAlt -> ((fun succAlt -> ((fun catchAlt -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerNatAltFuel (fuel - 1)) env) st2) outer) zeroAlt)) (fun pz -> (match pz with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__433; Base_dPair.f_Base_dPair_dPair_second = dtb__434 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerNatAltFuel (fuel - 1)) env) dtb__434) outer) succAlt)) (fun ps -> (match ps with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__435; Base_dPair.f_Base_dPair_dPair_second = dtb__436 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerNatAltFuel (fuel - 1)) env) dtb__436) outer) catchAlt)) (fun pc -> (match pc with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__437; Base_dPair.f_Base_dPair_dPair_second = dtb__438 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__431, fresh, dtb__433, dtb__435, dtb__437)); Base_dPair.f_Base_dPair_dPair_second = dtb__438 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dCodegen_dLower_dfindCatchAllAlt alts))) ((v_Vuna_dCompiler_dCodegen_dLower_dfindAltBy Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) alts))) ((v_Vuna_dCompiler_dCodegen_dLower_dfindAltBy Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) alts))) (fresh + 1))) (let dtb__439 = dtb__432 in dtb__439))
  | _ -> failwith "DT: impossible branch"
)))))
# 983 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerCaseFuel = (fun fuel env st outer scrut alts -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (if (v_Vuna_dCompiler_dCodegen_dLower_dnatCaseApplies alts) then ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerNatCaseFuel (fuel - 1)) env) st) outer) scrut) alts) else (match ((v_Vuna_dCompiler_dCodegen_dLower_dlowerUnboxedCaseAlt env) alts) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__440) -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerUnboxedCaseFuel (fuel - 1)) env) st) outer) scrut) dtb__440)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__441; Base_dPair.f_Base_dPair_dPair_second = dtb__442 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerArmsFuel (fuel - 1)) env) dtb__442) outer) alts)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__443; Base_dPair.f_Base_dPair_dPair_second = dtb__444 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__441, dtb__443)); Base_dPair.f_Base_dPair_dPair_second = dtb__444 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
# 995 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerProjAsCaseFuel = (fun fuel env st outer base c tele i fi -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((fun n -> (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) outer) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (base, (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = c; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = ((v_Vuna_dCompiler_dCodegen_dLower_dprojBindersIn tele) 0); Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar ((v_Vuna_dCompiler_dCodegen_dLower_drecordProjVarIn fi), ((n - 1) - fi), { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })) }, Base_dList.C_Base_dList_dList_Nil)))))) (v_Vuna_dCompiler_dCodegen_dLower_dlistLength tele))))
# 1043 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerRecordUpdateFuel = (fun fuel env st outer base c tele fields idxs body -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) outer) base)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__445; Base_dPair.f_Base_dPair_dPair_second = dtb__446 } -> (match body with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__447, dtb__448) -> (((((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerRecordUpdateArgsFuel (fuel - 1)) env) dtb__446) ((v_Vuna_dCompiler_dCodegen_dLower_drecordAltBindersIn tele) outer)) dtb__445) c) fields) idxs) dtb__448)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__449, dtb__450) -> (((((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerRecordUpdateArgsFuel (fuel - 1)) env) dtb__446) ((v_Vuna_dCompiler_dCodegen_dLower_drecordAltBindersIn tele) outer)) dtb__445) c) fields) idxs) dtb__450)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "record update body is not a constructor application")
)
  | _ -> failwith "DT: impossible branch"
)))))
# 1056 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerRecordUpdateArgsFuel = (fun fuel env st binders baseIr c fields idxs args -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__451) -> (match dtb__451 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__452; Base_dPair.f_Base_dPair_dPair_second = dtb__453 } -> (match ((Base_dList.v_Base_dList_dlookupPair c) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwOpaques) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("no opaque shape for constructor " ^ c))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__454) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs c) dtb__453) args)) (fun runtimeArgs -> ((fun positions -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerUpdFieldsFuel (fuel - 1)) env) st) binders) fields) ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueKeptFlags dtb__453) dtb__454)) positions) runtimeArgs)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__455; Base_dPair.f_Base_dPair_dPair_second = dtb__456 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (baseIr, c, dtb__455)); Base_dPair.f_Base_dPair_dPair_second = dtb__456 }))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dCodegen_dLower_dlookupRtPositionsIn fields) idxs))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("no shape for constructor " ^ c))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dlookupPair c) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors))))
# 1069 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerUpdFieldsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__457, dtb__458) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (match (((v_Vuna_dCompiler_dCodegen_dLower_dnthOpqArgIn (Base_dPair.v_Base_dPair_dsecondOf dtb__457)) mc5) mc7) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "record update position out of range")
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__459) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__459)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__460; Base_dPair.f_Base_dPair_dPair_second = dtb__461 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerUpdFieldsFuel (mc0 - 1)) mc1) dtb__461) mc3) mc4) mc5) dtb__458) mc7)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__462; Base_dPair.f_Base_dPair_dPair_second = dtb__463 } -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dlookupRtLabelIn (Base_dPair.v_Base_dPair_dfirstOf dtb__457)) mc4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__464) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__464; Base_dPair.f_Base_dPair_dPair_second = dtb__460 }, dtb__462)); Base_dPair.f_Base_dPair_dPair_second = dtb__463 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__462; Base_dPair.f_Base_dPair_dPair_second = dtb__463 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))

# 500 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerTerm = (fun env st binders t -> (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (v_Vuna_dCompiler_dCodegen_dLower_dlowerBudgetFor (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize t))) env) st) binders) t))

# 1087 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_druntimeArityIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__465, dtb__466, dtb__467) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__466) then (v_Vuna_dCompiler_dCodegen_dLower_druntimeArityIn dtb__467) else (1 + (v_Vuna_dCompiler_dCodegen_dLower_druntimeArityIn dtb__467)))
  | _ -> 0
))

# 1092 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_drecursiveValueAllowedIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__468, dtb__469) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__470, dtb__471, dtb__472) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__471) then (v_Vuna_dCompiler_dCodegen_dLower_drecursiveValueAllowedIn dtb__472) else true)
  | _ -> false
))

# 1098 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dinitGuardOf = (fun mc0 mc1 mc2 mc3 -> (if mc1 then false else (if (if (if ((mc0).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnit = "Main") then (mc2 = "main") else false) then ((v_Vuna_dCompiler_dCodegen_dLower_druntimeArityIn mc3) = 0) else false) then true else false)))

# 1123 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_ddepsOfBody = (fun env body -> (((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRuntimeNames) Base_dList.C_Base_dList_dList_Nil) body))

# 1145 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dexternBasicIr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__473) -> (match dtb__473 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__474, dtb__475) -> (if (dtb__474 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt)) else (if (dtb__474 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr)) else (if (dtb__474 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool)) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("extern type is not basic: " ^ dtb__474)))))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "extern type is not a global type")
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "extern type is not basic")
))

# 1139 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dexternDomIr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__476) -> (match dtb__476 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__477, dtb__478) -> (if (dtb__477 = "Array") then (match dtb__478 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__479, dtb__480) -> (match dtb__480 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dCodegen_dLower_dexternBasicIr dtb__479)) (fun e -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (e))))))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "extern Array needs one type argument")
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "extern Array needs one type argument")
) else (if (dtb__477 = "Array") then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "extern Array needs one type argument") else (v_Vuna_dCompiler_dCodegen_dLower_dexternBasicIr mc0)))
  | _ -> (v_Vuna_dCompiler_dCodegen_dLower_dexternBasicIr mc0)
)
  | _ -> (v_Vuna_dCompiler_dCodegen_dLower_dexternBasicIr mc0)
))

# 1131 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dexternTyIr = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__481, dtb__482, dtb__483, dtb__484, dtb__485) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "extern type is too deep") else (if dtb__482 then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "extern has an implicit parameter") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dCodegen_dLower_dexternDomIr dtb__484)) (fun domIr -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dexternTyIr (mc0 - 1)) (mc1 + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__485) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__481, mc1, Base_dList.C_Base_dList_dList_Nil))))))) (fun resIr -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (domIr, resIr))))))))))
  | _ -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "extern type is too deep") else (v_Vuna_dCompiler_dCodegen_dLower_dexternDomIr mc2))
))

# 1128 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerExternTy = (fun ty -> (((v_Vuna_dCompiler_dCodegen_dLower_dexternTyIr 64) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) ty)))

# 1107 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerDef = (fun env st d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__486) -> (match (v_Vuna_dCompiler_dCodegen_dLower_dlowerExternTy (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__487) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC ((((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) dtb__487)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__488) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), dtb__488, dtb__486, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d))); Base_dPair.f_Base_dPair_dPair_second = st }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__489) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__490) -> (match dtb__490 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__491; Base_dPair.f_Base_dPair_dPair_second = dtb__492 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (v_Vuna_dCompiler_dCodegen_dLower_druntimeArityIn dtb__489), ((v_Vuna_dCompiler_dCodegen_dLower_ddepsOfBody env) dtb__489), dtb__491, (v_Vuna_dCompiler_dCodegen_dLower_drecursiveValueAllowedIn dtb__489), ((((v_Vuna_dCompiler_dCodegen_dLower_dinitGuardOf env) false) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) dtb__489), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d))); Base_dPair.f_Base_dPair_dPair_second = dtb__492 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__493) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC ((((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) dtb__493)))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTerm env) st) Base_dList.C_Base_dList_dList_Nil) dtb__489))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC ((((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) (((((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagNoLoc Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevError) Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhInternal) Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatInternal) "IC_AxiomRuntime") "axiom reached runtime code generation (partition must erase it)"))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1153 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dlowerDefs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__494, dtb__495) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dlowerDef mc0) mc1) dtb__494)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__496; Base_dPair.f_Base_dPair_dPair_second = dtb__497 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dlowerDefs mc0) dtb__497) dtb__495)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__498; Base_dPair.f_Base_dPair_dPair_second = dtb__499 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__496, dtb__498)); Base_dPair.f_Base_dPair_dPair_second = dtb__499 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 1183 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dfindFamilyCtor = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__500, dtb__501) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__500) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__500)) else ((v_Vuna_dCompiler_dCodegen_dLower_dfindFamilyCtor dtb__501) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1187 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dfindListFamilyData = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__502, dtb__503) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__502) = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistFamilyName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__502)) else (v_Vuna_dCompiler_dCodegen_dLower_dfindListFamilyData dtb__503))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1174 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlistFamOf = (fun datas -> (match (v_Vuna_dCompiler_dCodegen_dLower_dfindListFamilyData datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__504) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dfindFamilyCtor (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__504)) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistNilCtor) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__505) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dfindFamilyCtor (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__504)) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistConsCtor) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__506) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListFamily = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__504); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListNil = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__505); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListCons = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__506) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1192 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dctorTableOf = (fun datas -> ((Base_dList.v_Base_dList_dconcatMap (fun d -> ((Base_dList.v_Base_dList_dmap (fun c -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c) } })) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))) datas))

# 1198 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueTableOf = (fun datas -> ((Base_dList.v_Base_dList_dconcatMap (fun d -> ((Base_dList.v_Base_dList_dmap (fun c -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueFlagsOf datas) c) })) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))) datas))

# 1205 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesFloat = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__507, dtb__508) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__507) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesFloat dtb__508)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__509) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatIntrinsicNames) dtb__509) then true else (v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesFloat dtb__508))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1211 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesTrace = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__510, dtb__511) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__510) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesTrace dtb__511)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__512) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dtraceIntrinsicNames) dtb__512) then true else (v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesTrace dtb__511))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1218 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesObs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__513, dtb__514) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__513) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesObs dtb__514)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__515) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dobsIntrinsicNames) dtb__515) then true else (v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesObs dtb__514))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1164 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerSharedOf = (fun datas defs -> ((fun runtime -> ((fun table -> ((fun locRows -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedRecordFields = (v_Vuna_dCompiler_dCodegen_dLower_drecordFieldsOf runtime); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedListFam = (v_Vuna_dCompiler_dCodegen_dLower_dlistFamOf runtime); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesFloat = (v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesFloat defs); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesTrace = (v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesTrace defs); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesObs = (v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesObs defs); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtors = (v_Vuna_dCompiler_dCodegen_dLower_dctorTableOf runtime); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtorOpaques = (v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueTableOf runtime); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUnboxed = (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet runtime); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedTyParams = table; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedDefLocs = locRows }) ((v_Vuna_dCompiler_dCodegen_dLower_dmapSome v_Vuna_dCompiler_dCodegen_dLower_dlocRowPair) defs))) (v_Vuna_dCompiler_dCodegen_dLower_dtyParamsOf runtime))) (v_Vuna_dCompiler_dCodegen_dLower_drtDatasOf datas)))

# 1231 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dcheckNoDupOcamlNamesGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__516, dtb__517) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__516) mc2) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["OCaml name collision among "; mc0; "s: `"; dtb__516; "`"])) else (((v_Vuna_dCompiler_dCodegen_dLower_dcheckNoDupOcamlNamesGo mc0) dtb__517) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__516) true) mc2)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 1228 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dcheckNoDupOcamlNames = (fun kind names -> (((v_Vuna_dCompiler_dCodegen_dLower_dcheckNoDupOcamlNamesGo kind) names) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

# 1237 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_densureUniqueOcamlNamesIn = (fun datas defs -> ((fun runtime -> ((fun unboxed -> ((fun valueNames -> ((fun typeNames -> ((fun ctorNames -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dLower_dcheckNoDupOcamlNames "value") valueNames)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dLower_dcheckNoDupOcamlNames "type") typeNames)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dLower_dcheckNoDupOcamlNames "constructor") ctorNames)))))) ((Base_dList.v_Base_dList_dconcatMap (fun d -> (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) unboxed) then Base_dList.C_Base_dList_dList_Nil else ((Base_dList.v_Base_dList_dmap (fun c -> ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))) runtime))) ((Base_dList.v_Base_dList_dmap (fun d -> (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dtypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))) runtime))) ((Base_dList.v_Base_dList_dmap (fun d -> (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)))) defs))) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet runtime))) (v_Vuna_dCompiler_dCodegen_dLower_drtDatasOf datas)))

# 1253 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dprepareProgram = (fun datas defs -> ((fun table -> ((fun familyNames -> ((fun axiomNames -> (match ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefs table) defs) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__518; Base_dPair.f_Base_dPair_dPair_second = dtb__519 } -> ((fun runtimeNames -> ((fun familyTypeNames -> ((fun allTypeNames -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntime axiomNames) dtb__518)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes defs)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dLower_densureUniqueOcamlNamesIn datas) dtb__518)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dcheckAllErasure allTypeNames) dtb__518)) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__518))))))))))) ((Base_dList.v_Base_dList_dappend dtb__519) familyTypeNames))) ((Base_dList.v_Base_dList_dfilter (fun n -> (Base_dBool.v_Base_dBool_dnot ((Base_dList.v_Base_dList_dmemName n) runtimeNames)))) familyNames))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) dtb__518))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_daxiomNamesOf defs))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas))) (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_ddefTable defs)))

# 1289 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_ddefTblOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__520, dtb__521) -> ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__520)) dtb__520) (v_Vuna_dCompiler_dCodegen_dLower_ddefTblOf dtb__521))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 1293 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dtblLookup = (fun tbl name -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) tbl))

# 1296 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_drecOkOfTbl = (fun tbl name -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dtblLookup tbl) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__522) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__522) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__523) -> (v_Vuna_dCompiler_dCodegen_dLower_drecursiveValueAllowedIn dtb__523)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1303 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dspanOfTbl = (fun tbl name -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dtblLookup tbl) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__524) -> (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__524)
  | _ -> failwith "DT: impossible branch"
))

# 1324 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dmapMaybeDef = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__525, dtb__526) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dtblLookup mc0) dtb__525) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dCodegen_dLower_dmapMaybeDef mc0) dtb__526)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__527) -> (Base_dList.C_Base_dList_dList_Cons (dtb__527, ((v_Vuna_dCompiler_dCodegen_dLower_dmapMaybeDef mc0) dtb__526)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1308 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dappendGroups = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__528, dtb__529) -> ((fun isRec -> ((fun members -> ((fun defs -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dlowerDefs mc0) mc1) defs)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__530; Base_dPair.f_Base_dPair_dPair_second = dtb__531 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dIr_dAnalysis.v_Vuna_dCompiler_dIr_dAnalysis_dcheckUniqueDefNames dtb__530)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dappendGroups mc0) dtb__531) dtb__529)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__532; Base_dPair.f_Base_dPair_dPair_second = dtb__533 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = isRec; Base_dPair.f_Base_dPair_dPair_second = dtb__530 }, dtb__532)); Base_dPair.f_Base_dPair_dPair_second = dtb__533 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dCodegen_dLower_dmapMaybeDef (mc0).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefTbl) members))) (Base_dPair.v_Base_dPair_dsecondOf dtb__528))) (Base_dPair.v_Base_dPair_dfirstOf dtb__528))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 1360 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dfirstOfList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__534, dtb__535) -> dtb__534
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1341 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dcheckRuntimeContract = ((fun intrinsicNames -> ((fun contractNames -> ((fun missingFromContract -> ((fun extrasInContract -> (if ((v_Vuna_dCompiler_dCodegen_dLower_dlistLength missingFromContract) > 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["runtime contract misses intrinsic `"; (v_Vuna_dCompiler_dCodegen_dLower_dfirstOfList missingFromContract); "`"])) else (if ((v_Vuna_dCompiler_dCodegen_dLower_dlistLength extrasInContract) > 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["runtime contract declares unknown symbol `"; (v_Vuna_dCompiler_dCodegen_dLower_dfirstOfList extrasInContract); "`"])) else (if ((v_Vuna_dCompiler_dCodegen_dLower_dlistLength Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextGaps) > 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["OCaml runtime table misses contract symbol `"; (v_Vuna_dCompiler_dCodegen_dLower_dfirstOfList Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextGaps); "`"])) else (if ((v_Vuna_dCompiler_dCodegen_dLower_dlistLength Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextExtras) > 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["OCaml runtime table has symbol outside the contract: `"; (v_Vuna_dCompiler_dCodegen_dLower_dfirstOfList Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextExtras); "`"])) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))))))) ((Base_dList.v_Base_dList_dfilter (fun n -> (if ((Base_dList.v_Base_dList_dmemName n) intrinsicNames) then false else (if ((Base_dList.v_Base_dList_dmemName n) Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtSyntheticNames) then false else true)))) contractNames))) ((Base_dList.v_Base_dList_dfilter (fun n -> (if (n = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dprimEffBind1Name) then false else (if ((Base_dList.v_Base_dList_dmemName n) contractNames) then false else true)))) intrinsicNames))) Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtNames)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dallIntrinsics))

# 1334 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dcheckProgramOf = (fun env -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dLower_dprepareProgram (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDatas) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefs)) (fun _u -> v_Vuna_dCompiler_dCodegen_dLower_dcheckRuntimeContract)))

# 1396 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dtyDeclTys = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrUnboxedDecl (dtb__536, dtb__537, dtb__538) -> (Base_dList.C_Base_dList_dList_Cons (dtb__538, Base_dList.C_Base_dList_dList_Nil))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl (dtb__539, dtb__540, dtb__541, dtb__542) -> dtb__542
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl (dtb__543, dtb__544, dtb__545) -> ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) dtb__545)
  | _ -> failwith "DT: impossible branch"
))

# 1405 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dfoldlTyNames = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__546, dtb__547) -> ((v_Vuna_dCompiler_dCodegen_dLower_dfoldlTyNames dtb__547) ((v_Vuna_dCompiler_dCodegen_dLower_dtyNamesInto dtb__546) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1409 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dtyNamesInto = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__548, dtb__549) -> ((v_Vuna_dCompiler_dCodegen_dLower_dfoldlTyNames dtb__549) ((v_Vuna_dCompiler_dCodegen_dLower_dpushDep dtb__548) mc1))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__550, dtb__551) -> ((v_Vuna_dCompiler_dCodegen_dLower_dtyNamesInto dtb__551) ((v_Vuna_dCompiler_dCodegen_dLower_dtyNamesInto dtb__550) mc1))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef (dtb__552) -> ((v_Vuna_dCompiler_dCodegen_dLower_dtyNamesInto dtb__552) mc1)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (dtb__553) -> ((v_Vuna_dCompiler_dCodegen_dLower_dtyNamesInto dtb__553) mc1)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__554) -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 1401 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dtyDeclRefsGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__555, dtb__556) -> ((v_Vuna_dCompiler_dCodegen_dLower_dtyDeclRefsGo dtb__556) ((v_Vuna_dCompiler_dCodegen_dLower_dfoldlTyNames dtb__555) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 1393 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dtyDeclRefs = (fun decls -> ((v_Vuna_dCompiler_dCodegen_dLower_dtyDeclRefsGo ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dLower_dtyDeclTys) decls)) Base_dList.C_Base_dList_dList_Nil))

# 1424 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dbodyOrDummy = (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__557) -> dtb__557
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (0))
  | _ -> failwith "DT: impossible branch"
))

# 1421 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dadjOfDef = (fun env d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dCodegen_dLower_ddepsOfBody env) (v_Vuna_dCompiler_dCodegen_dLower_dbodyOrDummy d)) })

# 1275 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dgroupDefs = (fun env defs -> ((fun adj -> ((fun names -> ((fun tbl -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dIr_dAnalysis.v_Vuna_dCompiler_dIr_dAnalysis_dassembleGroupNames adj) names) (v_Vuna_dCompiler_dCodegen_dLower_drecOkOfTbl tbl)) (v_Vuna_dCompiler_dCodegen_dLower_dspanOfTbl tbl))) (fun groups -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dappendGroups env) 0) groups)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__558; Base_dPair.f_Base_dPair_dPair_second = dtb__559 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__558))
  | _ -> failwith "DT: impossible branch"
)))))) (v_Vuna_dCompiler_dCodegen_dLower_ddefTblOf defs))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) defs))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dCodegen_dLower_dadjOfDef env)) defs)))

# 1434 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dactionResultTyIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__560, dtb__561, dtb__562) -> (match dtb__560 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__563, dtb__564, dtb__565) -> (match dtb__563 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__566) -> (if (dtb__566 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffTypeName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = "eff"; Base_dPair.f_Base_dPair_dPair_second = dtb__561 })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 1440 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dcollectBuiltinRowTags = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__567, dtb__568) -> (if (dtb__567 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__569, dtb__570) -> (match dtb__570 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__571, dtb__572) -> (match dtb__572 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__573, dtb__574) -> ((fun rest -> ((fun tagTerm -> (match tagTerm with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__575) -> (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disBuiltinEffectTag dtb__575) then (Base_dList.C_Base_dList_dList_Cons (dtb__575, rest)) else rest)
  | _ -> rest
)) (Base_dPair.v_Base_dPair_dfirstOf dtb__571))) (v_Vuna_dCompiler_dCodegen_dLower_dcollectBuiltinRowTags (Base_dPair.v_Base_dPair_dfirstOf dtb__573)))
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)) dtb__568) else Base_dList.C_Base_dList_dList_Nil)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

# 1453 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dmainRowTags = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__576, dtb__577, dtb__578) -> (match dtb__576 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__579, dtb__580, dtb__581) -> (match dtb__579 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__582) -> (if (dtb__582 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffTypeName) then (v_Vuna_dCompiler_dCodegen_dLower_dcollectBuiltinRowTags ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__580))) else Base_dList.C_Base_dList_dList_Nil)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

# 1468 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dmainShowForNameIr = (fun g -> (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtShowInt)) else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtShowNat)) else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtShowStr)) else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtShowFloat)) else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtShowBool)) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dmainShowDefName))))))))

# 1461 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dmainShowIr = (fun tyTerm -> (match ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) tyTerm)) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__583) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__584, dtb__585) -> (match dtb__585 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dCodegen_dLower_dmainShowForNameIr dtb__584)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dmainShowDefName))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dmainShowDefName))
)) dtb__583)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dmainShowDefName))
))

# 1490 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dfilterMapRunHost = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__586, dtb__587) -> ((fun host -> (if (host = "") then (v_Vuna_dCompiler_dCodegen_dLower_dfilterMapRunHost dtb__587) else (Base_dList.C_Base_dList_dList_Cons (host, (v_Vuna_dCompiler_dCodegen_dLower_dfilterMapRunHost dtb__587))))) (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dbuiltinEffectImplOf dtb__586))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1477 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerEntryOf = (fun defs -> (match ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef "main") defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__588) -> (match (v_Vuna_dCompiler_dCodegen_dLower_dactionResultTyIn (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__588)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__589) -> ((fun innerTy -> ((fun tags -> ((fun handlers -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = (v_Vuna_dCompiler_dCodegen_dLower_dmainShowIr innerTy); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = "main"; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = true; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffMainRunName)); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = handlers }))))) (v_Vuna_dCompiler_dCodegen_dLower_dfilterMapRunHost tags))) (v_Vuna_dCompiler_dCodegen_dLower_dmainRowTags (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__588)))) (Base_dPair.v_Base_dPair_dsecondOf dtb__589))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = (v_Vuna_dCompiler_dCodegen_dLower_dmainShowIr (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__588)); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = "main"; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = false; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = Base_dList.C_Base_dList_dList_Nil }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1497 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dgroupOfPair = (fun mc0 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__590; Base_dPair.f_Base_dPair_dPair_second = dtb__591 } -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = dtb__590; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = dtb__591 }
  | _ -> failwith "DT: impossible branch"
))

# 1510 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dnameSetOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__592, dtb__593) -> ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__592) true) (v_Vuna_dCompiler_dCodegen_dLower_dnameSetOf dtb__593))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 1501 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dmkLwEnv = (fun datas defs unit -> ((fun shared -> ((fun runtime -> { f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwShared = shared; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDatas = runtime; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwTyParams = (v_Vuna_dCompiler_dCodegen_dLower_dtyParamsOf runtime); f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRecordFields = (v_Vuna_dCompiler_dCodegen_dLower_drecordFieldsOf runtime); f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors = (shared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtors; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwOpaques = (shared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtorOpaques; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnboxed = (shared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUnboxed; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefs = defs; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefTbl = (v_Vuna_dCompiler_dCodegen_dLower_ddefTblOf defs); f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRuntimeNames = (v_Vuna_dCompiler_dCodegen_dLower_dnameSetOf (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf defs)); f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnit = unit }) (v_Vuna_dCompiler_dCodegen_dLower_drtDatasOf datas))) ((v_Vuna_dCompiler_dCodegen_dLower_dlowerSharedOf datas) defs)))

# 1529 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dpartitionRuntimeDefs = (fun defs -> (match ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefs (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_ddefTable defs)) defs) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__594; Base_dPair.f_Base_dPair_dPair_second = dtb__595 } -> dtb__594
  | _ -> failwith "DT: impossible branch"
))

# 1374 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerUnitAfterChecks = (fun env defNames dataNames -> ((fun datas -> ((fun defNameTbl -> ((fun defs -> ((fun dataNameTbl -> ((fun unitDatas -> ((fun runtime -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dLower_dgroupDefs env) runtime)) (fun groups -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dLower_dtyDeclsOf datas) unitDatas)) (fun decls -> ((fun groups2 -> ((fun hasList -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls = decls; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups = groups2; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily = hasList; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs = (v_Vuna_dCompiler_dCodegen_dLower_dtyDeclRefs decls); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing }))) ((Base_dList.v_Base_dList_dmemName Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistFamilyName) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) unitDatas)))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dLower_dgroupOfPair) groups))))))) (v_Vuna_dCompiler_dCodegen_dLower_dpartitionRuntimeDefs defs))) ((Base_dList.v_Base_dList_dfilter (fun d -> ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) dataNameTbl))) datas))) (Base_dHashMap.v_Base_dHashMap_dofNames dataNames))) ((Base_dList.v_Base_dList_dfilter (fun d -> ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) defNameTbl))) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefs))) (Base_dHashMap.v_Base_dHashMap_dofNames defNames))) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDatas))

# 1367 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerUnitOf = (fun env defNames dataNames -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dCodegen_dLower_dcheckProgramOf env)) (fun _u -> (((v_Vuna_dCompiler_dCodegen_dLower_dlowerUnitAfterChecks env) defNames) dataNames))))

# 1515 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerProgramOf = (fun datas defs -> ((fun env -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dlowerUnitOf env) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) defs)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas))) (fun unitIr -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dCodegen_dLower_dlowerEntryOf defs)) (fun entry -> ((fun program -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dIr.v_Vuna_dCompiler_dIr_dvalidateProgram program)) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (program))))) { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgShared = (v_Vuna_dCompiler_dCodegen_dLower_dlwEnvShared env); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit = { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry = entry } })))))) (((v_Vuna_dCompiler_dCodegen_dLower_dmkLwEnv datas) defs) "")))
