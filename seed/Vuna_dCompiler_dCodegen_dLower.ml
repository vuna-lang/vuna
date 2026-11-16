open Vuna_runtime
type t_Vuna_dCompiler_dCodegen_dLower_dLwEnv = { f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwShared : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrShared; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDatas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwTyParams : (string, int Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRecordFields : (string, (int, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors : (string, (string, bool Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwOpaques : (string, bool Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnboxed : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefTbl : (string, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRuntimeNames : (string, bool) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnit : string }
and t_Vuna_dCompiler_dCodegen_dLower_dLwSt = int
and t_Vuna_dCompiler_dCodegen_dLower_dLamChainIn = { f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBinders : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBody : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn = { f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeEnv : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aePats : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeSt : t_Vuna_dCompiler_dCodegen_dLower_dLwSt }

# 67 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlwEnvShared = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwShared = dtb__0; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDatas = dtb__1; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwTyParams = dtb__2; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRecordFields = dtb__3; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors = dtb__4; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwOpaques = dtb__5; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnboxed = dtb__6; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefs = dtb__7; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefTbl = dtb__8; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRuntimeNames = dtb__9; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnit = dtb__10 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlwEnvWithUnit = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwShared = dtb__11; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDatas = dtb__12; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwTyParams = dtb__13; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRecordFields = dtb__14; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors = dtb__15; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwOpaques = dtb__16; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnboxed = dtb__17; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefs = dtb__18; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefTbl = dtb__19; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRuntimeNames = dtb__20; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnit = dtb__21 } -> { f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwShared = dtb__11; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDatas = dtb__12; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwTyParams = dtb__13; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRecordFields = dtb__14; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors = dtb__15; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwOpaques = dtb__16; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnboxed = dtb__17; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefs = dtb__18; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefTbl = dtb__19; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRuntimeNames = dtb__20; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnit = mc0 }
  | _ -> failwith "DT: impossible branch"
))

# 79 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dpushDep = (fun dep deps -> (if (dep = "") then deps else (if ((Base_dList.v_Base_dList_dmemName dep) deps) then deps else ((Base_dList.v_Base_dList_dappend deps) (Base_dList.C_Base_dList_dList_Cons (dep, Base_dList.C_Base_dList_dList_Nil))))))

# 83 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dlistLength = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__22, dtb__23) -> (1 + (v_Vuna_dCompiler_dCodegen_dLower_dlistLength dtb__23))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 92 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dbinderErasedOf = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = dtb__24; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = dtb__25 } -> dtb__25
  | _ -> failwith "DT: impossible branch"
))

# 96 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dmapSome = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__26, dtb__27) -> (match (mc0 dtb__26) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dCodegen_dLower_dmapSome mc0) dtb__27)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__28) -> (Base_dList.C_Base_dList_dList_Cons (dtb__28, ((v_Vuna_dCompiler_dCodegen_dLower_dmapSome mc0) dtb__27)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 104 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_disTypeHeadOpaqueDatas = (fun datas name -> (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disUnboxedCanonical name) then false else (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData name) datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__29) -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disTypeConstructorName name))
  | _ -> failwith "DT: impossible branch"
)))

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
let v_Vuna_dCompiler_dCodegen_dLower_drtDatasOf = (fun datas -> ((Base_dList.v_Base_dList_dfilter (fun d -> (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disUnboxedCanonical (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))))) datas))

# 160 "Vuna/Compiler/Codegen/Lower.vuna"
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

# 157 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueFlagsOf = (fun datas c -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueGo datas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

# 174 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlocRowPair = (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__49) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (dtb__49).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartLine dtb__49) } }))
  | _ -> failwith "DT: impossible branch"
))

# 189 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dtypeParamLevelsGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dPair.v_Base_dPair_dsecondOf dtb__50)) then (Base_dList.C_Base_dList_dList_Cons (mc1, ((v_Vuna_dCompiler_dCodegen_dLower_dtypeParamLevelsGo dtb__51) (mc1 + 1)))) else ((v_Vuna_dCompiler_dCodegen_dLower_dtypeParamLevelsGo dtb__51) (mc1 + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dtypeParamLevels = (fun d -> ((v_Vuna_dCompiler_dCodegen_dLower_dtypeParamLevelsGo (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams) 0))

# 195 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dmemIntIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__52, dtb__53) -> (if (dtb__52 = mc0) then true else ((v_Vuna_dCompiler_dCodegen_dLower_dmemIntIn mc0) dtb__53))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dlevelSlotGoIn = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__54, dtb__55) -> (if (dtb__54 = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc2)) else (((v_Vuna_dCompiler_dCodegen_dLower_dlevelSlotGoIn dtb__55) mc1) (mc2 + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 199 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlevelSlotIn = (fun levels lvl -> (((v_Vuna_dCompiler_dCodegen_dLower_dlevelSlotGoIn levels) lvl) 0))

# 206 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dnthValueIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__56, dtb__57) -> (if (mc1 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__56)) else ((v_Vuna_dCompiler_dCodegen_dLower_dnthValueIn dtb__57) (mc1 - 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 210 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dlookupUsedIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__58, dtb__59) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__58) = mc1) then (Base_dPair.v_Base_dPair_dsecondOf dtb__58) else ((v_Vuna_dCompiler_dCodegen_dLower_dlookupUsedIn dtb__59) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 217 "Vuna/Compiler/Codegen/Lower.vuna"
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
# 234 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedSpineFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__72, dtb__73) -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Nil else ((Base_dList.v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedLevelsFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__72)) ((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedSpineFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__73)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Nil else Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))
# 245 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dcollectFamilyArgsFuel = (fun fuel tps table datas lvl usedPats args -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match usedPats with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__74, dtb__75) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dnthValueIn args) dtb__74) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__76) -> ((Base_dList.v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) lvl) dtb__76)) (((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) dtb__75) args))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) dtb__75) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 214 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedLevels = (fun tps table datas lvl v -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedLevelsFuel 256) tps) table) datas) lvl) v))

# 241 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dcollectFamilyArgs = (fun tps table datas lvl usedPats args -> (((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectFamilyArgsFuel 256) tps) table) datas) lvl) usedPats) args))

# 255 "Vuna/Compiler/Codegen/Lower.vuna"
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

# 273 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_ddataUsedLevels = (fun d table datas -> ((fun raw -> ((Base_dList.v_Base_dList_dfilter (fun l -> ((v_Vuna_dCompiler_dCodegen_dLower_dmemIntIn l) raw))) (v_Vuna_dCompiler_dCodegen_dLower_dtypeParamLevels d))) ((Base_dList.v_Base_dList_dconcatMap (fun c -> (((((((v_Vuna_dCompiler_dCodegen_dLower_dctorUsedLevels (v_Vuna_dCompiler_dCodegen_dLower_dtypeParamLevels d)) table) datas) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))

# 282 "Vuna/Compiler/Codegen/Lower.vuna"
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

# 287 "Vuna/Compiler/Codegen/Lower.vuna"
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

# 297 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dusedTableFixFuel = (fun fuel datas table -> (if (fuel <= 0) then table else ((fun next -> (if ((v_Vuna_dCompiler_dCodegen_dLower_dsameLevelTable next) table) then next else (((v_Vuna_dCompiler_dCodegen_dLower_dusedTableFixFuel (fuel - 1)) datas) next))) ((Base_dList.v_Base_dList_dmap (fun d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dCodegen_dLower_ddataUsedLevels d) table) datas) })) datas))))

# 294 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dusedTableFix = (fun datas table -> (((v_Vuna_dCompiler_dCodegen_dLower_dusedTableFixFuel 64) datas) table))

# 305 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dtyParamsOf = (fun datas -> ((v_Vuna_dCompiler_dCodegen_dLower_dusedTableFix datas) ((Base_dList.v_Base_dList_dmap (fun d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil })) datas)))

# 329 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dreprTyIr = (fun name -> (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt)) else (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr)) else (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat)) else ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__94) -> (match dtb__94 with
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dFamilyRepr_FamReprBool -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool))
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dFamilyRepr_FamReprNat -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dcanonicalReprOf name))))))

# 348 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_drenderTyIntrinsic = (fun mc0 mc1 -> (if (mc0 = "Array") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__95, dtb__96) -> (match dtb__96 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (dtb__95))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "IORef") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__97, dtb__98) -> (match dtb__98 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef (dtb__97))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))

# 317 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_drenderTyFuel = (fun fuel levels table datas v -> (if (fuel <= 0) then Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__99) -> (match dtb__99 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__100, dtb__101, dtb__102) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dlevelSlotIn levels) dtb__101) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__103) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__103))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__104, dtb__105) -> ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderTyGlobal fuel) levels) table) datas) dtb__104) dtb__105)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque
)))
# 338 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_drenderTyGlobal = (fun fuel levels table datas g sp -> (match ((v_Vuna_dCompiler_dCodegen_dLower_drenderTyIntrinsic g) ((Base_dList.v_Base_dList_dmap (fun x -> (((((v_Vuna_dCompiler_dCodegen_dLower_drenderTyFuel (fuel - 1)) levels) table) datas) x))) sp)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__106) -> dtb__106
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dCodegen_dLower_dreprTyIr g) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__107) -> dtb__107
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData g) datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__108) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (g, ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderFamilyArgs (fuel - 1)) levels) table) datas) ((v_Vuna_dCompiler_dCodegen_dLower_dlookupUsedIn table) g)) sp)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 353 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_drenderFamilyArgs = (fun fuel levels table datas usedPats args -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match usedPats with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__109, dtb__110) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dnthValueIn args) dtb__109) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__111) -> (Base_dList.C_Base_dList_dList_Cons ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderTyFuel (fuel - 1)) levels) table) datas) dtb__111), ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderFamilyArgs (fuel - 1)) levels) table) datas) dtb__110) args)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderFamilyArgs (fuel - 1)) levels) table) datas) dtb__110) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 314 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_drenderTyOf = (fun levels table datas v -> (((((v_Vuna_dCompiler_dCodegen_dLower_drenderTyFuel 256) levels) table) datas) v))

# 367 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_drenderPiTyFuel = (fun fuel levels table datas lvl v -> (if (fuel <= 0) then (((((v_Vuna_dCompiler_dCodegen_dLower_drenderTyFuel fuel) levels) table) datas) v) else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__112, dtb__113, dtb__114, dtb__115, dtb__116) -> ((fun next -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__114) then ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderPiTyFuel (fuel - 1)) levels) table) datas) (lvl + 1)) next) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (((((((v_Vuna_dCompiler_dCodegen_dLower_drenderPiTyFuel (fuel - 1)) levels) table) datas) lvl) dtb__115), ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderPiTyFuel (fuel - 1)) levels) table) datas) (lvl + 1)) next))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__116) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__112, lvl, Base_dList.C_Base_dList_dList_Nil))))))
  | _ -> (((((v_Vuna_dCompiler_dCodegen_dLower_drenderTyFuel fuel) levels) table) datas) v)
)))

# 364 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_drenderPiTy = (fun levels table datas lvl v -> ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderPiTyFuel 256) levels) table) datas) lvl) v))

# 379 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_drenderFieldTy = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__117) -> (match dtb__117 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__118, dtb__119, dtb__120) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dlevelSlotIn mc0) dtb__119) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__121) -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__121)); Base_dPair.f_Base_dPair_dPair_second = mc5 }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (mc5)); Base_dPair.f_Base_dPair_dPair_second = (mc5 + 1) }
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__122, dtb__123) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_drenderTyIntrinsic dtb__122) ((Base_dList.v_Base_dList_dmap (fun x -> (((((v_Vuna_dCompiler_dCodegen_dLower_drenderTyFuel 256) mc0) mc1) mc2) x))) dtb__123)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__124) -> { Base_dPair.f_Base_dPair_dPair_first = dtb__124; Base_dPair.f_Base_dPair_dPair_second = mc5 }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dCodegen_dLower_dreprTyIr dtb__122) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__125) -> { Base_dPair.f_Base_dPair_dPair_first = dtb__125; Base_dPair.f_Base_dPair_dPair_second = mc5 }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData dtb__122) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__126) -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__122, ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderFamilyArgs 256) mc0) mc1) mc2) ((v_Vuna_dCompiler_dCodegen_dLower_dlookupUsedIn mc1) dtb__122)) dtb__123))); Base_dPair.f_Base_dPair_dPair_second = mc5 }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (mc5)); Base_dPair.f_Base_dPair_dPair_second = (mc5 + 1) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__127, dtb__128, dtb__129, dtb__130, dtb__131) -> (if dtb__128 then { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (mc5)); Base_dPair.f_Base_dPair_dPair_second = (mc5 + 1) } else { Base_dPair.f_Base_dPair_dPair_first = (((((v_Vuna_dCompiler_dCodegen_dLower_drenderPiTy mc0) mc1) mc2) mc3) mc4); Base_dPair.f_Base_dPair_dPair_second = mc5 })
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (mc5)); Base_dPair.f_Base_dPair_dPair_second = (mc5 + 1) }
))

# 397 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dflagMatchesRigIn = (fun mc0 mc1 -> (if mc0 then (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased mc1)) else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased mc1)))

# 402 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dctorFieldTys = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__132, dtb__133) -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__134, dtb__135) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__136, dtb__137) -> (match dtb__136 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__138; Base_dPair.f_Base_dPair_dPair_second = dtb__139 } -> (if ((v_Vuna_dCompiler_dCodegen_dLower_dflagMatchesRigIn dtb__132) dtb__139) then (match mc7 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__140, dtb__141, dtb__142, dtb__143, dtb__144) -> ((fun next -> (if dtb__132 then (if dtb__134 then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dCodegen_dLower_dctorFieldTys mc0) mc1) mc2) dtb__133) dtb__135) dtb__137) (mc6 + 1)) next) mc8)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__145; Base_dPair.f_Base_dPair_dPair_second = dtb__146 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque, dtb__145)); Base_dPair.f_Base_dPair_dPair_second = dtb__146 }))
  | _ -> failwith "DT: impossible branch"
))) else (match ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderFieldTy mc0) mc1) mc2) mc6) dtb__143) mc8) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__147; Base_dPair.f_Base_dPair_dPair_second = dtb__148 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dCodegen_dLower_dctorFieldTys mc0) mc1) mc2) dtb__133) dtb__135) dtb__137) (mc6 + 1)) next) dtb__148)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__149; Base_dPair.f_Base_dPair_dPair_second = dtb__150 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__147, dtb__149)); Base_dPair.f_Base_dPair_dPair_second = dtb__150 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) else (((((((((v_Vuna_dCompiler_dCodegen_dLower_dctorFieldTys mc0) mc1) mc2) dtb__133) dtb__135) dtb__137) (mc6 + 1)) next) mc8))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__144) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__140, mc6, Base_dList.C_Base_dList_dList_Nil))))))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "constructor telescope does not match its type")
) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "constructor keep flag disagrees with telescope rig"))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc8 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__151, dtb__152) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "constructor opaque flags shorter than its shape")
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc8 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Nil -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__153, dtb__154) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "constructor shape has more binders than its telescope")
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc8 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Cons (dtb__155, dtb__156) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc8 }))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "constructor opaque flags longer than its shape")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 426 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dctorArityNeed = (fun levels table datas c -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dCodegen_dLower_dctorFieldTys levels) table) datas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c)) ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueFlagsOf datas) c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (v_Vuna_dCompiler_dCodegen_dLower_dlistLength levels))) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dPair.v_Base_dPair_dsecondOf p) - (v_Vuna_dCompiler_dCodegen_dLower_dlistLength levels)))))))

# 437 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dmaxIntListIn = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__157, dtb__158) -> (if (dtb__157 >= (v_Vuna_dCompiler_dCodegen_dLower_dmaxIntListIn dtb__158)) then dtb__157 else (v_Vuna_dCompiler_dCodegen_dLower_dmaxIntListIn dtb__158))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 432 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_ddataArityNeed = (fun levels table datas ctors -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (((v_Vuna_dCompiler_dCodegen_dLower_dctorArityNeed levels) table) datas)) ctors)) (fun ns -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dCodegen_dLower_dlistLength levels) + (v_Vuna_dCompiler_dCodegen_dLower_dmaxIntListIn ns)))))))

# 448 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_drecordFieldsOf = (fun datas -> ((Base_dList.v_Base_dList_dmap (fun d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dCodegen_dLower_drecordRtFields d) })) ((Base_dList.v_Base_dList_dfilter v_Vuna_dCompiler_dCodegen_dLower_dhasRecordRepr) ((Base_dList.v_Base_dList_dfilter (fun d -> (Base_dBool.v_Base_dBool_dnot ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet datas))))) datas))))

# 462 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dtyDeclOf = (fun table allDatas unboxed d -> ((fun levels -> ((fun arity -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (v_Vuna_dCompiler_dCodegen_dLower_dhasRecordRepr d) then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__159, dtb__160) -> (match dtb__160 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dCodegen_dLower_dctorFieldTys levels) table) allDatas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags dtb__159)) ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueFlagsOf allDatas) dtb__159)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__159)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__159))) (v_Vuna_dCompiler_dCodegen_dLower_dlistLength levels))) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), arity, (v_Vuna_dCompiler_dCodegen_dLower_drecordRtFields d), (Base_dPair.v_Base_dPair_dfirstOf p)))))))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("record family must have exactly one constructor: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("record family must have exactly one constructor: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dLower_ddataArityNeed levels) table) allDatas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun fullArity -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (fun c -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dCodegen_dLower_dctorFieldTys levels) table) allDatas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c)) ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueFlagsOf allDatas) c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (v_Vuna_dCompiler_dCodegen_dLower_dlistLength levels))) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dfirstOf p) })))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun ctors -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), fullArity, ctors)))))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__161) -> (match dtb__161 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__162; Base_dPair.f_Base_dPair_dPair_second = dtb__163 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dCodegen_dLower_dctorFieldTys levels) table) allDatas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags dtb__162)) ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueFlagsOf allDatas) dtb__162)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__162)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__162))) (v_Vuna_dCompiler_dCodegen_dLower_dlistLength levels))) (fun p -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__164, dtb__165) -> (match dtb__165 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrUnboxedDecl ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), arity, dtb__164))))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("unboxed constructor does not have exactly one kept field: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__162)))
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("unboxed constructor does not have exactly one kept field: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__162)))
)) (Base_dPair.v_Base_dPair_dfirstOf p))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dlookupUnboxedInfo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) unboxed))) (v_Vuna_dCompiler_dCodegen_dLower_dlistLength levels))) ((v_Vuna_dCompiler_dCodegen_dLower_dlookupUsedIn table) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))))

# 456 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dtyDeclsGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__166, dtb__167) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dLower_dtyDeclOf mc0) mc1) mc2) dtb__166)) (fun decl -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dLower_dtyDeclsGo mc0) mc1) mc2) dtb__167)) (fun tail -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (decl, tail))))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 453 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dtyDeclsOf = (fun allDatas subset -> ((((v_Vuna_dCompiler_dCodegen_dLower_dtyDeclsGo (v_Vuna_dCompiler_dCodegen_dLower_dtyParamsOf allDatas)) allDatas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedInfoOf allDatas)) subset))

# 493 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerBudgetFor = (fun size -> (512 + (8 * size)))

# 540 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dbinderAtIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__168, dtb__169) -> (if (mc0 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__168)) else ((v_Vuna_dCompiler_dCodegen_dLower_dbinderAtIn (mc0 - 1)) dtb__169))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 544 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_drecordFieldNameAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__170, dtb__171) -> (match dtb__170 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__172; Base_dPair.f_Base_dPair_dPair_second = dtb__173 } -> (if (dtb__172 = mc0) then dtb__173 else ((v_Vuna_dCompiler_dCodegen_dLower_drecordFieldNameAt mc0) dtb__171))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 549 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_drecordTermAsAppIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__174, dtb__175) -> (match dtb__174 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__176; Base_dPair.f_Base_dPair_dPair_second = dtb__177 } -> ((v_Vuna_dCompiler_dCodegen_dLower_drecordTermAsAppIn (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (mc0, dtb__176, dtb__177))) dtb__175)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 558 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dfloatRenderRefName = "Base.Float.floatRender"

# 578 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerBridgeGuard = (fun env name ir -> (if (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtBridgesList name) then (if ((Base_dList.v_Base_dList_dmemName Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistFamilyName) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDatas)) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (ir)) else ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_ListBridgeRequired (name))) name)) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (ir))))

# 584 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_deffUnitTyIn = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffUnitTypeName, Base_dList.C_Base_dList_dList_Nil))

# 561 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerGlobalRef = (fun env name -> (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (0)))) else (if (name = "strFromFloat") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (v_Vuna_dCompiler_dCodegen_dLower_dfloatRenderRefName)))) else (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtNatSucc)))) else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__178) -> (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dprimEffBind1Name) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffTypeName, Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffMkCtor, v_Vuna_dCompiler_dCodegen_dLower_deffUnitTyIn)))) else (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicReturnsEff dtb__178) then (((v_Vuna_dCompiler_dCodegen_dLower_dlowerBridgeGuard env) name) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffTypeName, Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffMkCtor, v_Vuna_dCompiler_dCodegen_dLower_deffUnitTyIn, (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicArity dtb__178), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ((Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicName dtb__178)))))) else (((v_Vuna_dCompiler_dCodegen_dLower_dlowerBridgeGuard env) name) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ((Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicName dtb__178))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (name))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__179) -> (match dtb__179 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__180; Base_dPair.f_Base_dPair_dPair_second = dtb__181 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__180, name, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dlookupPair name) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors))))))

# 593 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dcollectLamChainIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__182, dtb__183, dtb__184) -> (match (v_Vuna_dCompiler_dCodegen_dLower_dcollectLamChainIn dtb__184) with
  | { f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBinders = dtb__185; f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBody = dtb__186 } -> { f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBinders = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__182; Base_dPair.f_Base_dPair_dPair_second = dtb__183 }, dtb__185)); f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBody = dtb__186 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBinders = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBody = mc0 }
))

# 609 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dbinderOfParam = (fun mc0 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__187; Base_dPair.f_Base_dPair_dPair_second = dtb__188 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__188) then Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased else (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinder dtb__187))
  | _ -> failwith "DT: impossible branch"
))

# 681 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dconcatLeavesIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__189, dtb__190, dtb__191) -> (match dtb__189 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__192, dtb__193, dtb__194) -> (if (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__194) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__191)) then (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__192, dtb__193, dtb__194)), dtb__190, dtb__191)), Base_dList.C_Base_dList_dList_Nil)) else (match dtb__192 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__195) -> (if (dtb__195 = "++") then ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dLower_dconcatLeavesIn dtb__193)) (v_Vuna_dCompiler_dCodegen_dLower_dconcatLeavesIn dtb__190)) else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__192, dtb__193, dtb__194)), dtb__190, dtb__191)), Base_dList.C_Base_dList_dList_Nil)))
  | _ -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__192, dtb__193, dtb__194)), dtb__190, dtb__191)), Base_dList.C_Base_dList_dList_Nil))
))
  | _ -> (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil))
)
  | _ -> (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil))
))

# 674 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dflattenConcatChainIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__196, dtb__197, dtb__198) -> (match dtb__196 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__199, dtb__200, dtb__201) -> (if (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__201) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__198)) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match dtb__199 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__202) -> (if (dtb__202 = "++") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dLower_dconcatLeavesIn dtb__200)) (v_Vuna_dCompiler_dCodegen_dLower_dconcatLeavesIn dtb__197)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 690 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dflattenIntrinsicAppIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__203, dtb__204, dtb__205) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__205) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match dtb__203 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__206) -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity dtb__206) > 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__206; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__204; Base_dPair.f_Base_dPair_dPair_second = dtb__205 }, Base_dList.C_Base_dList_dList_Nil)) })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__207) -> (match dtb__207 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__208; Base_dPair.f_Base_dPair_dPair_second = dtb__209 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__208; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__209) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__204; Base_dPair.f_Base_dPair_dPair_second = dtb__205 }, Base_dList.C_Base_dList_dList_Nil))) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dLower_dflattenIntrinsicAppIn dtb__203))
))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 699 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dinlineArityMatchesIn = (fun name args -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity name) <= 0) then false else ((v_Vuna_dCompiler_dCodegen_dLower_dlistLength args) = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity name))))

# 708 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__210, dtb__211) -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__212, dtb__213) -> (match dtb__212 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__214; Base_dPair.f_Base_dPair_dPair_second = dtb__215 } -> (if dtb__210 then (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__215) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["constructor "; mc0; ": runtime field marked erased"])) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs mc0) dtb__211) dtb__213)) (fun ts -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__214; Base_dPair.f_Base_dPair_dPair_second = dtb__215 }, ts))))))) else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__215) then (((v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs mc0) dtb__211) dtb__213) else (((v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs mc0) dtb__211) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__214; Base_dPair.f_Base_dPair_dPair_second = dtb__215 }, dtb__213)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if dtb__210 then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["constructor "; mc0; ": application has fewer arguments than its shape"])) else (((v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs mc0) dtb__211) Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__216, dtb__217) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["constructor "; mc0; ": application has more arguments than its shape"]))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 735 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dctorArgIr = (fun mc0 mc1 -> (if mc0 then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (mc1)) else mc1))

# 740 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueKeptFlags = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__218, dtb__219) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__220, dtb__221) -> (if dtb__218 then (Base_dList.C_Base_dList_dList_Cons (dtb__220, ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueKeptFlags dtb__219) dtb__221))) else ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueKeptFlags dtb__219) dtb__221))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 788 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dzipFieldNames = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__222, dtb__223) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__224, dtb__225) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dsecondOf dtb__222); Base_dPair.f_Base_dPair_dPair_second = dtb__224 }, ((v_Vuna_dCompiler_dCodegen_dLower_dzipFieldNames dtb__223) dtb__225)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 779 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerConAppFinish = (fun env st family c irs -> (if ((Base_dList.v_Base_dList_dmemName family) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnboxed) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__226, dtb__227) -> (match dtb__227 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__226; Base_dPair.f_Base_dPair_dPair_second = st }))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "unboxed constructor application does not have exactly one runtime argument")
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "unboxed constructor application does not have exactly one runtime argument")
)) irs) else (match ((Base_dList.v_Base_dList_dlookupPair family) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRecordFields) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__228) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (family, ((v_Vuna_dCompiler_dCodegen_dLower_dzipFieldNames dtb__228) irs))); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (family, c, irs)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | _ -> failwith "DT: impossible branch"
)))

# 803 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_daeEnvOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeEnv = dtb__229; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aePats = dtb__230; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeSt = dtb__231 } -> dtb__229
  | _ -> failwith "DT: impossible branch"
))

# 806 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_daePatsOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeEnv = dtb__232; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aePats = dtb__233; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeSt = dtb__234 } -> dtb__233
  | _ -> failwith "DT: impossible branch"
))

# 809 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_daeStOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeEnv = dtb__235; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aePats = dtb__236; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeSt = dtb__237 } -> dtb__237
  | _ -> failwith "DT: impossible branch"
))

# 812 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dcountKept = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__238, dtb__239) -> (if dtb__238 then (1 + (v_Vuna_dCompiler_dCodegen_dLower_dcountKept dtb__239)) else (v_Vuna_dCompiler_dCodegen_dLower_dcountKept dtb__239))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 816 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_daltEnvGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__240, dtb__241) -> (match dtb__240 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__242; Base_dPair.f_Base_dPair_dPair_second = dtb__243 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__243) then ((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvGo mc0) (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased, mc1))) dtb__241) mc3) else ((fun fresh -> ((fun b -> ((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvGo (fresh + 1)) (Base_dList.C_Base_dList_dList_Cons (b, mc1))) dtb__241) (Base_dList.C_Base_dList_dList_Cons (b, mc3)))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderArm fresh))) (let dtb__244 = mc0 in dtb__244)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeEnv = mc1; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aePats = (Base_dList.v_Base_dList_dreverse mc3); f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeSt = mc0 }
  | _ -> failwith "DT: impossible branch"
))

# 825 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_daltEnvIn = (fun st outer tele -> ((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvGo st) outer) tele) Base_dList.C_Base_dList_dList_Nil))

# 837 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_daltEnvFullIn = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__245, dtb__246) -> (match dtb__245 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__247; Base_dPair.f_Base_dPair_dPair_second = dtb__248 } -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": case branch has more binders than its shape"]))
  | Base_dList.C_Base_dList_dList_Cons (dtb__249, dtb__250) -> (if ((v_Vuna_dCompiler_dCodegen_dLower_dflagMatchesRigIn dtb__249) dtb__248) then (if dtb__249 then ((fun fresh -> ((fun b -> ((((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvFullIn (fresh + 1)) mc1) (Base_dList.C_Base_dList_dList_Cons (b, mc2))) dtb__246) dtb__250) (Base_dList.C_Base_dList_dList_Cons (b, mc5)))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderArm fresh))) (let dtb__251 = mc0 in dtb__251)) else ((((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvFullIn mc0) mc1) (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased, mc2))) dtb__246) dtb__250) mc5)) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": case branch binder rig disagrees with its shape"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeEnv = mc2; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aePats = (Base_dList.v_Base_dList_dreverse mc5); f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeSt = mc0 }))
  | Base_dList.C_Base_dList_dList_Cons (dtb__252, dtb__253) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": case branch has fewer binders than its shape"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 851 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_daltEnvKeptIn = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__254, dtb__255) -> (match dtb__254 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__256; Base_dPair.f_Base_dPair_dPair_second = dtb__257 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__257) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": kept-field branch has an erased binder"])) else ((fun fresh -> ((fun b -> (((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvKeptIn (fresh + 1)) mc1) (Base_dList.C_Base_dList_dList_Cons (b, mc2))) dtb__255) (Base_dList.C_Base_dList_dList_Cons (b, mc4)))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderArm fresh))) (let dtb__258 = mc0 in dtb__258)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeEnv = mc2; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aePats = (Base_dList.v_Base_dList_dreverse mc4); f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeSt = mc0 }))
  | _ -> failwith "DT: impossible branch"
))

# 830 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_daltEnvCheckedIn = (fun st label outer binders flags -> (if ((v_Vuna_dCompiler_dCodegen_dLower_dlistLength binders) = (v_Vuna_dCompiler_dCodegen_dLower_dlistLength flags)) then ((((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvFullIn st) label) outer) binders) flags) Base_dList.C_Base_dList_dList_Nil) else (if ((v_Vuna_dCompiler_dCodegen_dLower_dlistLength binders) = (v_Vuna_dCompiler_dCodegen_dLower_dcountKept flags)) then (((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvKeptIn st) label) outer) binders) Base_dList.C_Base_dList_dList_Nil) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr (String.concat "" ["DT: internal: constructor "; label; ": case branch binder count matches neither full telescope nor kept fields"])))))

# 864 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dhasFallbackAlt = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__259, dtb__260) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__259) = "") then true else (v_Vuna_dCompiler_dCodegen_dLower_dhasFallbackAlt dtb__260))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 868 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dallCatchAll = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__261, dtb__262) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__261) = "") then (v_Vuna_dCompiler_dCodegen_dLower_dallCatchAll dtb__262) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 873 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerUnboxedCaseAlt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__263, dtb__264) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__263) = "") then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun name -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__265) -> (match dtb__265 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__266; Base_dPair.f_Base_dPair_dPair_second = dtb__267 } -> (if ((Base_dList.v_Base_dList_dmemName dtb__266) (mc0).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnboxed) then (if (v_Vuna_dCompiler_dCodegen_dLower_dallCatchAll dtb__264) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__263)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dlookupPair name) (mc0).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__263)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 925 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_disNatCtorName = (fun name -> (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then true else (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor)))

# 932 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dnatCaseAllCtors = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__268, dtb__269) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__268) = "") then (v_Vuna_dCompiler_dCodegen_dLower_dnatCaseAllCtors dtb__269) else ((fun name -> (if (v_Vuna_dCompiler_dCodegen_dLower_disNatCtorName name) then (v_Vuna_dCompiler_dCodegen_dLower_dnatCaseAllCtors dtb__269) else false)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__268)))
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 938 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dnatCaseHasCtor = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__270, dtb__271) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__270) = "") then (v_Vuna_dCompiler_dCodegen_dLower_dnatCaseHasCtor dtb__271) else true)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 928 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dnatCaseApplies = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> (if (v_Vuna_dCompiler_dCodegen_dLower_dnatCaseAllCtors mc0) then (v_Vuna_dCompiler_dCodegen_dLower_dnatCaseHasCtor mc0) else false)
))

# 944 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dfindAltBy = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__272, dtb__273) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__272) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__272)) else ((v_Vuna_dCompiler_dCodegen_dLower_dfindAltBy mc0) dtb__273))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 948 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dfindCatchAllAlt = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__274, dtb__275) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__274) = "") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__274)) else (v_Vuna_dCompiler_dCodegen_dLower_dfindCatchAllAlt dtb__275))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1005 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_drecordProjVarIn = (fun i -> ("@vuna@record@proj" ^ (bi_strFromInt i)))

# 1008 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dprojBindersIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__276, dtb__277) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dCodegen_dLower_drecordProjVarIn mc1); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__276) }, ((v_Vuna_dCompiler_dCodegen_dLower_dprojBindersIn dtb__277) (mc1 + 1))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1015 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dlookupRtLabelIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__278, dtb__279) -> (match dtb__278 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__280; Base_dPair.f_Base_dPair_dPair_second = dtb__281 } -> (if (dtb__280 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__281)) else ((v_Vuna_dCompiler_dCodegen_dLower_dlookupRtLabelIn mc0) dtb__279))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1020 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dlookupRtPosIn = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__282, dtb__283) -> (match dtb__282 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__284; Base_dPair.f_Base_dPair_dPair_second = dtb__285 } -> (if (dtb__284 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc2)) else (((v_Vuna_dCompiler_dCodegen_dLower_dlookupRtPosIn mc0) dtb__283) (mc2 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1025 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dlookupRtPositionsIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__286, dtb__287) -> (match (((v_Vuna_dCompiler_dCodegen_dLower_dlookupRtPosIn dtb__286) mc0) 0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__288) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__286; Base_dPair.f_Base_dPair_dPair_second = dtb__288 }, ((v_Vuna_dCompiler_dCodegen_dLower_dlookupRtPositionsIn mc0) dtb__287)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dCodegen_dLower_dlookupRtPositionsIn mc0) dtb__287)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1031 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dnthOpqArgIn = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__289, dtb__290) -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__291, dtb__292) -> (match dtb__291 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__293; Base_dPair.f_Base_dPair_dPair_second = dtb__294 } -> (if (mc0 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__293)) else (((v_Vuna_dCompiler_dCodegen_dLower_dnthOpqArgIn (mc0 - 1)) dtb__290) dtb__292))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1042 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_deraseTele = (fun b -> Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased)

# 1039 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_drecordAltBindersIn = (fun tele binders -> ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dLower_deraseTele) tele))) binders))

# 499 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel = (fun fuel env st binders t -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__295, dtb__296, dtb__297) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dbinderAtIn dtb__296) binders) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__298) -> (if (v_Vuna_dCompiler_dCodegen_dLower_dbinderErasedOf dtb__298) then ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_TypeLevelBindingRuntime (dtb__295))) dtb__295) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__298)); Base_dPair.f_Base_dPair_dPair_second = st })))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "unbound runtime variable")
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__299) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dLower_dlowerGlobalRef env) dtb__299)) (fun ir -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ir; Base_dPair.f_Base_dPair_dPair_second = st }))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__300) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__300)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__301) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__301)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__302) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__302)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__303) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__303)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__304, dtb__305, dtb__306) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) binders) dtb__304)) (fun pc -> (match pc with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__307; Base_dPair.f_Base_dPair_dPair_second = dtb__308 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) dtb__308) binders) dtb__305)) (fun pt -> (match pt with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__309; Base_dPair.f_Base_dPair_dPair_second = dtb__310 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) dtb__310) binders) dtb__306)) (fun pe -> (match pe with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__311; Base_dPair.f_Base_dPair_dPair_second = dtb__312 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__307, dtb__309, dtb__311)); Base_dPair.f_Base_dPair_dPair_second = dtb__312 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__313, dtb__314, dtb__315) -> (((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerLamFuel (fuel - 1)) env) st) binders) dtb__313) dtb__314) dtb__315)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__316, dtb__317, dtb__318) -> (((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerAppFuel (fuel - 1)) env) st) binders) dtb__316) dtb__317) dtb__318)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__319, dtb__320) -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerConAppFuel (fuel - 1)) env) st) binders) dtb__319) dtb__320)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__321, dtb__322) -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerConAppFuel (fuel - 1)) env) st) binders) dtb__321) dtb__322)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__323, dtb__324) -> (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) binders) ((v_Vuna_dCompiler_dCodegen_dLower_drecordTermAsAppIn (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__323))) dtb__324))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__325, dtb__326) -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerCaseFuel (fuel - 1)) env) st) binders) dtb__325) dtb__326)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__327, dtb__328, dtb__329, dtb__330, dtb__331) -> (match ((Base_dList.v_Base_dList_dlookupPair dtb__328) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRecordFields) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__332) -> ((((((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerRecordUpdateFuel (fuel - 1)) env) st) binders) dtb__327) dtb__328) dtb__329) dtb__332) dtb__330) dtb__331)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) binders) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__327, (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__328; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__329; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__331 }, Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__333, dtb__334, dtb__335, dtb__336, dtb__337) -> (match ((Base_dList.v_Base_dList_dlookupPair dtb__334) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRecordFields) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__338) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) binders) dtb__333)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__339; Base_dPair.f_Base_dPair_dPair_second = dtb__340 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__339, dtb__334, ((v_Vuna_dCompiler_dCodegen_dLower_drecordFieldNameAt dtb__337) dtb__338))); Base_dPair.f_Base_dPair_dPair_second = dtb__340 }))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerProjAsCaseFuel (fuel - 1)) env) st) binders) dtb__333) dtb__334) dtb__335) dtb__336) dtb__337)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__341, dtb__342, dtb__343, dtb__344, dtb__345) -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_TypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__346) -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_TypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__347) -> ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_UnsolvedMetavarRuntime ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__347)))) (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__347))
  | _ -> failwith "DT: impossible branch"
)))
# 598 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerLamFuel = (fun fuel env st binders name rig body -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (match (v_Vuna_dCompiler_dCodegen_dLower_dcollectLamChainIn (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, body))) with
  | { f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBinders = dtb__348; f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBody = dtb__349 } -> ((fun bs -> ((fun envB -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) envB) dtb__349)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__350; Base_dPair.f_Base_dPair_dPair_second = dtb__351 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (bs, dtb__350)); Base_dPair.f_Base_dPair_dPair_second = dtb__351 }))
  | _ -> failwith "DT: impossible branch"
)))) ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse bs)) binders))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dLower_dbinderOfParam) dtb__348))
  | _ -> failwith "DT: impossible branch"
)))
# 613 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerAppFuel = (fun fuel env st binders f a rig -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased rig) then (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) binders) f) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerAppOptimizedFuel (fuel - 1)) env) st) binders) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (f, a, rig)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__352) -> (match dtb__352 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__353; Base_dPair.f_Base_dPair_dPair_second = dtb__354 } -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerConAppFuel (fuel - 1)) env) st) binders) dtb__353) dtb__354)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (f, a, rig)))))))
# 620 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerAppOptimizedFuel = (fun fuel env st binders t -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (match (v_Vuna_dCompiler_dCodegen_dLower_dflattenConcatChainIn t) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__355) -> (if ((v_Vuna_dCompiler_dCodegen_dLower_dlistLength dtb__355) >= 3) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermsFuel (fuel - 1)) env) st) binders) dtb__355)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__356; Base_dPair.f_Base_dPair_dPair_second = dtb__357 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__356)); Base_dPair.f_Base_dPair_dPair_second = dtb__357 }))
  | _ -> failwith "DT: impossible branch"
))) else (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerPlainAppFuel (fuel - 1)) env) st) binders) t))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerPlainAppFuel (fuel - 1)) env) st) binders) t)
  | _ -> failwith "DT: impossible branch"
)))
# 629 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerPlainAppFuel = (fun fuel env st binders t -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__358, dtb__359, dtb__360) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerAppFallbackFuel (fuel - 1)) env) st) binders) dtb__358) dtb__359) dtb__360)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__361) -> (match dtb__361 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__362; Base_dPair.f_Base_dPair_dPair_second = dtb__363 } -> (if ((v_Vuna_dCompiler_dCodegen_dLower_dinlineArityMatchesIn dtb__362) dtb__363) then ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerInlineAppFuel (fuel - 1)) env) st) binders) dtb__362) dtb__363) else (((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerAppFallbackFuel (fuel - 1)) env) st) binders) dtb__358) dtb__359) dtb__360))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dLower_dflattenIntrinsicAppIn t))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "lowerPlainApp expects an application")
)))
# 639 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerAppFallbackFuel = (fun fuel env st binders f a rig -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) binders) f)) (fun pf -> (match pf with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__364; Base_dPair.f_Base_dPair_dPair_second = dtb__365 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) dtb__365) binders) a)) (fun pa -> (match pa with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__366; Base_dPair.f_Base_dPair_dPair_second = dtb__367 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__364, dtb__366)); Base_dPair.f_Base_dPair_dPair_second = dtb__367 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
# 647 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerInlineAppFuel = (fun fuel env st binders name args -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerInlineArgsFuel (fuel - 1)) env) st) binders) args)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__368; Base_dPair.f_Base_dPair_dPair_second = dtb__369 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (name, dtb__368)); Base_dPair.f_Base_dPair_dPair_second = dtb__369 }))
  | _ -> failwith "DT: impossible branch"
)))))
# 653 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerInlineArgsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__370, dtb__371) -> (match dtb__370 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__372; Base_dPair.f_Base_dPair_dPair_second = dtb__373 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__373) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "erased argument in inlined builtin application") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__372)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__374; Base_dPair.f_Base_dPair_dPair_second = dtb__375 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerInlineArgsFuel (mc0 - 1)) mc1) dtb__375) mc3) dtb__371)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__376; Base_dPair.f_Base_dPair_dPair_second = dtb__377 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__374, dtb__376)); Base_dPair.f_Base_dPair_dPair_second = dtb__377 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
# 664 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerTermsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__378, dtb__379) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__378)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__380; Base_dPair.f_Base_dPair_dPair_second = dtb__381 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermsFuel (mc0 - 1)) mc1) dtb__381) mc3) dtb__379)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__382; Base_dPair.f_Base_dPair_dPair_second = dtb__383 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__380, dtb__382)); Base_dPair.f_Base_dPair_dPair_second = dtb__383 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
# 722 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerConArgsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__384, dtb__385) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__386, dtb__387) -> (match dtb__386 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__388; Base_dPair.f_Base_dPair_dPair_second = dtb__389 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__388)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__390; Base_dPair.f_Base_dPair_dPair_second = dtb__391 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerConArgsFuel (mc0 - 1)) mc1) dtb__391) mc3) dtb__385) dtb__387)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__392; Base_dPair.f_Base_dPair_dPair_second = dtb__393 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dCodegen_dLower_dctorArgIr dtb__384) dtb__390), dtb__392)); Base_dPair.f_Base_dPair_dPair_second = dtb__393 }))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__394, dtb__395) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "constructor opaque flags shorter than runtime arguments")
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 746 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerConAppFuel = (fun fuel env st binders c args -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dnatChainValue (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (c, args))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__396) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__396)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerConAppNonChainFuel (fuel - 1)) env) st) binders) c) args)
  | _ -> failwith "DT: impossible branch"
)))
# 752 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerConAppNonChainFuel = (fun fuel env st binders c args -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (if (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then (match (((v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs c) Base_dList.C_Base_dList_dList_Nil) args) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__397) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__397))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__398) -> (match dtb__398 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (0)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "Nat Zero applied to arguments")
)
  | _ -> failwith "DT: impossible branch"
) else (if (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then (match (((v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs c) (Base_dList.C_Base_dList_dList_Cons (true, Base_dList.C_Base_dList_dList_Nil))) args) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__399) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__399))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__400) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerConArgsFuel (fuel - 1)) env) st) binders) (Base_dList.C_Base_dList_dList_Cons (false, Base_dList.C_Base_dList_dList_Nil))) dtb__400)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__401; Base_dPair.f_Base_dPair_dPair_second = dtb__402 } -> (match dtb__401 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__403, dtb__404) -> (match dtb__404 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtNatSucc)), dtb__403)); Base_dPair.f_Base_dPair_dPair_second = dtb__402 }))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "Nat Succ must have exactly one runtime argument")
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "Nat Succ must have exactly one runtime argument")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__405) -> (match dtb__405 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__406; Base_dPair.f_Base_dPair_dPair_second = dtb__407 } -> (match ((Base_dList.v_Base_dList_dlookupPair c) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwOpaques) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("no opaque shape for constructor " ^ c))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__408) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs c) dtb__407) args)) (fun runtimeArgs -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerConArgsFuel (fuel - 1)) env) st) binders) ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueKeptFlags dtb__407) dtb__408)) runtimeArgs)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__409; Base_dPair.f_Base_dPair_dPair_second = dtb__410 } -> (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerConAppFinish env) dtb__410) dtb__406) c) dtb__409)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("unknown constructor " ^ c))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dlookupPair c) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors))))))
# 861 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerArmBodyFuel = (fun fuel env bound body -> (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel fuel) env) (v_Vuna_dCompiler_dCodegen_dLower_daeStOf bound)) (v_Vuna_dCompiler_dCodegen_dLower_daeEnvOf bound)) body))
# 883 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerUnboxedCaseFuel = (fun fuel env st outer scrut alt -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt) = "") then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "unboxed case arm has no constructor") else ((fun name -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__411) -> (match dtb__411 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__412; Base_dPair.f_Base_dPair_dPair_second = dtb__413 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__414; Base_dPair.f_Base_dPair_dPair_second = dtb__415 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvCheckedIn dtb__415) name) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)) dtb__413)) (fun bound -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dLower_dlowerArmBodyFuel (fuel - 1)) env) bound) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__416; Base_dPair.f_Base_dPair_dPair_second = dtb__417 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet ((v_Vuna_dCompiler_dCodegen_dLower_daePatsOf bound), dtb__414, dtb__416)); Base_dPair.f_Base_dPair_dPair_second = dtb__417 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("no shape for constructor " ^ name))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dlookupPair name) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)))))
# 897 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerArmFuel = (fun fuel env st outer alt -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt) = "") then ((fun bound -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dLower_dlowerArmBodyFuel (fuel - 1)) env) bound) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__418; Base_dPair.f_Base_dPair_dPair_second = dtb__419 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (v_Vuna_dCompiler_dCodegen_dLower_daePatsOf bound); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__418 }; Base_dPair.f_Base_dPair_dPair_second = dtb__419 }))
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dCodegen_dLower_daltEnvIn st) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt))) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__420) -> (match dtb__420 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__421; Base_dPair.f_Base_dPair_dPair_second = dtb__422 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvCheckedIn st) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)) dtb__422)) (fun bound -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dLower_dlowerArmBodyFuel (fuel - 1)) env) bound) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__423; Base_dPair.f_Base_dPair_dPair_second = dtb__424 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__421; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt) })); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (v_Vuna_dCompiler_dCodegen_dLower_daePatsOf bound); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__423 }; Base_dPair.f_Base_dPair_dPair_second = dtb__424 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("unknown constructor " ^ (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dlookupPair (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors)))))
# 913 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerArmsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__425, dtb__426) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerArmFuel (mc0 - 1)) mc1) mc2) mc3) dtb__425)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__427; Base_dPair.f_Base_dPair_dPair_second = dtb__428 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerArmsFuel (mc0 - 1)) mc1) dtb__428) mc3) dtb__426)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__429; Base_dPair.f_Base_dPair_dPair_second = dtb__430 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__427, dtb__429)); Base_dPair.f_Base_dPair_dPair_second = dtb__430 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
# 953 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerNatAltFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__431) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((fun bound -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dLower_dlowerArmBodyFuel (mc0 - 1)) mc1) bound) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__431))) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__432; Base_dPair.f_Base_dPair_dPair_second = dtb__433 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (v_Vuna_dCompiler_dCodegen_dLower_daePatsOf bound); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__432 })); Base_dPair.f_Base_dPair_dPair_second = dtb__433 }))
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dCodegen_dLower_daltEnvIn mc2) mc3) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__431))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Base_dPair.f_Base_dPair_dPair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))
# 963 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerNatCaseFuel = (fun fuel env st outer scrut alts -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__434; Base_dPair.f_Base_dPair_dPair_second = dtb__435 } -> ((fun fresh -> ((fun st2 -> ((fun zeroAlt -> ((fun succAlt -> ((fun catchAlt -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerNatAltFuel (fuel - 1)) env) st2) outer) zeroAlt)) (fun pz -> (match pz with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__436; Base_dPair.f_Base_dPair_dPair_second = dtb__437 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerNatAltFuel (fuel - 1)) env) dtb__437) outer) succAlt)) (fun ps -> (match ps with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__438; Base_dPair.f_Base_dPair_dPair_second = dtb__439 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerNatAltFuel (fuel - 1)) env) dtb__439) outer) catchAlt)) (fun pc -> (match pc with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__440; Base_dPair.f_Base_dPair_dPair_second = dtb__441 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__434, fresh, dtb__436, dtb__438, dtb__440)); Base_dPair.f_Base_dPair_dPair_second = dtb__441 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dCodegen_dLower_dfindCatchAllAlt alts))) ((v_Vuna_dCompiler_dCodegen_dLower_dfindAltBy Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) alts))) ((v_Vuna_dCompiler_dCodegen_dLower_dfindAltBy Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) alts))) (fresh + 1))) (let dtb__442 = dtb__435 in dtb__442))
  | _ -> failwith "DT: impossible branch"
)))))
# 985 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerCaseFuel = (fun fuel env st outer scrut alts -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (if (v_Vuna_dCompiler_dCodegen_dLower_dnatCaseApplies alts) then ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerNatCaseFuel (fuel - 1)) env) st) outer) scrut) alts) else (match ((v_Vuna_dCompiler_dCodegen_dLower_dlowerUnboxedCaseAlt env) alts) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__443) -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerUnboxedCaseFuel (fuel - 1)) env) st) outer) scrut) dtb__443)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__444; Base_dPair.f_Base_dPair_dPair_second = dtb__445 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerArmsFuel (fuel - 1)) env) dtb__445) outer) alts)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__446; Base_dPair.f_Base_dPair_dPair_second = dtb__447 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__444, dtb__446)); Base_dPair.f_Base_dPair_dPair_second = dtb__447 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
# 997 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerProjAsCaseFuel = (fun fuel env st outer base c tele i fi -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((fun n -> (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) outer) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (base, (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = c; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = ((v_Vuna_dCompiler_dCodegen_dLower_dprojBindersIn tele) 0); Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar ((v_Vuna_dCompiler_dCodegen_dLower_drecordProjVarIn fi), ((n - 1) - fi), { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })) }, Base_dList.C_Base_dList_dList_Nil)))))) (v_Vuna_dCompiler_dCodegen_dLower_dlistLength tele))))
# 1045 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerRecordUpdateFuel = (fun fuel env st outer base c tele fields idxs body -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) outer) base)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__448; Base_dPair.f_Base_dPair_dPair_second = dtb__449 } -> (match body with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__450, dtb__451) -> (((((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerRecordUpdateArgsFuel (fuel - 1)) env) dtb__449) ((v_Vuna_dCompiler_dCodegen_dLower_drecordAltBindersIn tele) outer)) dtb__448) c) fields) idxs) dtb__451)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__452, dtb__453) -> (((((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerRecordUpdateArgsFuel (fuel - 1)) env) dtb__449) ((v_Vuna_dCompiler_dCodegen_dLower_drecordAltBindersIn tele) outer)) dtb__448) c) fields) idxs) dtb__453)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "record update body is not a constructor application")
)
  | _ -> failwith "DT: impossible branch"
)))))
# 1058 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerRecordUpdateArgsFuel = (fun fuel env st binders baseIr c fields idxs args -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__454) -> (match dtb__454 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__455; Base_dPair.f_Base_dPair_dPair_second = dtb__456 } -> (match ((Base_dList.v_Base_dList_dlookupPair c) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwOpaques) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("no opaque shape for constructor " ^ c))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__457) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs c) dtb__456) args)) (fun runtimeArgs -> ((fun positions -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerUpdFieldsFuel (fuel - 1)) env) st) binders) fields) ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueKeptFlags dtb__456) dtb__457)) positions) runtimeArgs)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__458; Base_dPair.f_Base_dPair_dPair_second = dtb__459 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (baseIr, c, dtb__458)); Base_dPair.f_Base_dPair_dPair_second = dtb__459 }))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dCodegen_dLower_dlookupRtPositionsIn fields) idxs))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("no shape for constructor " ^ c))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dlookupPair c) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors))))
# 1071 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dlowerUpdFieldsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__460, dtb__461) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (match (((v_Vuna_dCompiler_dCodegen_dLower_dnthOpqArgIn (Base_dPair.v_Base_dPair_dsecondOf dtb__460)) mc5) mc7) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "record update position out of range")
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__462) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__462)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__463; Base_dPair.f_Base_dPair_dPair_second = dtb__464 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerUpdFieldsFuel (mc0 - 1)) mc1) dtb__464) mc3) mc4) mc5) dtb__461) mc7)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__465; Base_dPair.f_Base_dPair_dPair_second = dtb__466 } -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dlookupRtLabelIn (Base_dPair.v_Base_dPair_dfirstOf dtb__460)) mc4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__467) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__467; Base_dPair.f_Base_dPair_dPair_second = dtb__463 }, dtb__465)); Base_dPair.f_Base_dPair_dPair_second = dtb__466 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__465; Base_dPair.f_Base_dPair_dPair_second = dtb__466 }))
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

# 496 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerTerm = (fun env st binders t -> (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (v_Vuna_dCompiler_dCodegen_dLower_dlowerBudgetFor (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize t))) env) st) binders) t))

# 1089 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_druntimeArityIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__468, dtb__469, dtb__470) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__469) then (v_Vuna_dCompiler_dCodegen_dLower_druntimeArityIn dtb__470) else (1 + (v_Vuna_dCompiler_dCodegen_dLower_druntimeArityIn dtb__470)))
  | _ -> 0
))

# 1094 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_drecursiveValueAllowedIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__471, dtb__472) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__473, dtb__474, dtb__475) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__474) then (v_Vuna_dCompiler_dCodegen_dLower_drecursiveValueAllowedIn dtb__475) else true)
  | _ -> false
))

# 1100 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dinitGuardOf = (fun mc0 mc1 mc2 mc3 -> (if mc1 then false else (if (if (if ((mc0).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnit = "Main") then (mc2 = "main") else false) then ((v_Vuna_dCompiler_dCodegen_dLower_druntimeArityIn mc3) = 0) else false) then true else false)))

# 1125 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_ddepsOfBody = (fun env body -> (((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRuntimeNames) Base_dList.C_Base_dList_dList_Nil) body))

# 1130 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_ddepsWithFloatRender = (fun env body -> ((fun names -> ((fun ds -> ((Base_dList.v_Base_dList_dmap (fun d -> (if (d = "strFromFloat") then v_Vuna_dCompiler_dCodegen_dLower_dfloatRenderRefName else d))) ds)) (((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto names) Base_dList.C_Base_dList_dList_Nil) body))) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) "strFromFloat") true) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRuntimeNames)))

# 1158 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dexternBasicIr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__476) -> (match dtb__476 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__477, dtb__478) -> (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disFfiScalarName dtb__477) then (match (v_Vuna_dCompiler_dCodegen_dLower_dreprTyIr dtb__477) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__479) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__479))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("extern type has no runtime representation: " ^ dtb__477))
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("extern type is not basic: " ^ dtb__477)))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "extern type is not a global type")
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "extern type is not basic")
))

# 1152 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dexternDomIr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__480) -> (match dtb__480 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__481, dtb__482) -> (if (dtb__481 = "Array") then (match dtb__482 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__483, dtb__484) -> (match dtb__484 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dCodegen_dLower_dexternBasicIr dtb__483)) (fun e -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (e))))))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "extern Array needs one type argument")
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "extern Array needs one type argument")
) else (if (dtb__481 = "Array") then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "extern Array needs one type argument") else (v_Vuna_dCompiler_dCodegen_dLower_dexternBasicIr mc0)))
  | _ -> (v_Vuna_dCompiler_dCodegen_dLower_dexternBasicIr mc0)
)
  | _ -> (v_Vuna_dCompiler_dCodegen_dLower_dexternBasicIr mc0)
))

# 1144 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dexternTyIr = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__485, dtb__486, dtb__487, dtb__488, dtb__489) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "extern type is too deep") else (if dtb__486 then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "extern has an implicit parameter") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dCodegen_dLower_dexternDomIr dtb__488)) (fun domIr -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dexternTyIr (mc0 - 1)) (mc1 + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__489) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__485, mc1, Base_dList.C_Base_dList_dList_Nil))))))) (fun resIr -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (domIr, resIr))))))))))
  | _ -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "extern type is too deep") else (v_Vuna_dCompiler_dCodegen_dLower_dexternDomIr mc2))
))

# 1141 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerExternTy = (fun ty -> (((v_Vuna_dCompiler_dCodegen_dLower_dexternTyIr 64) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) ty)))

# 1109 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerDef = (fun env st d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__490) -> (match (v_Vuna_dCompiler_dCodegen_dLower_dlowerExternTy (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__491) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC ((((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) dtb__491)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__492) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), dtb__492, dtb__490, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d))); Base_dPair.f_Base_dPair_dPair_second = st }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__493) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__494) -> (match dtb__494 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__495; Base_dPair.f_Base_dPair_dPair_second = dtb__496 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (v_Vuna_dCompiler_dCodegen_dLower_druntimeArityIn dtb__493), ((v_Vuna_dCompiler_dCodegen_dLower_ddepsWithFloatRender env) dtb__493), dtb__495, (v_Vuna_dCompiler_dCodegen_dLower_drecursiveValueAllowedIn dtb__493), ((((v_Vuna_dCompiler_dCodegen_dLower_dinitGuardOf env) false) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) dtb__493), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d))); Base_dPair.f_Base_dPair_dPair_second = dtb__496 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__497) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC ((((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) dtb__497)))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTerm env) st) Base_dList.C_Base_dList_dList_Nil) dtb__493))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC ((((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) (((((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagNoLoc Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevError) Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhInternal) Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatInternal) "IC_AxiomRuntime") "axiom reached runtime code generation (partition must erase it)"))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1166 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dlowerDefs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__498, dtb__499) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dlowerDef mc0) mc1) dtb__498)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__500; Base_dPair.f_Base_dPair_dPair_second = dtb__501 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dlowerDefs mc0) dtb__501) dtb__499)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__502; Base_dPair.f_Base_dPair_dPair_second = dtb__503 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__500, dtb__502)); Base_dPair.f_Base_dPair_dPair_second = dtb__503 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 1196 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dfindFamilyCtor = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__504, dtb__505) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__504) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__504)) else ((v_Vuna_dCompiler_dCodegen_dLower_dfindFamilyCtor dtb__505) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1200 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dfindListFamilyData = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__506, dtb__507) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__506) = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistFamilyName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__506)) else (v_Vuna_dCompiler_dCodegen_dLower_dfindListFamilyData dtb__507))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1187 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlistFamOf = (fun datas -> (match (v_Vuna_dCompiler_dCodegen_dLower_dfindListFamilyData datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__508) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dfindFamilyCtor (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__508)) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistNilCtor) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__509) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dfindFamilyCtor (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__508)) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistConsCtor) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__510) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListFamily = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__508); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListNil = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__509); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListCons = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__510) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1205 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dctorTableOf = (fun datas -> ((Base_dList.v_Base_dList_dconcatMap (fun d -> ((Base_dList.v_Base_dList_dmap (fun c -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c) } })) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))) datas))

# 1211 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueTableOf = (fun datas -> ((Base_dList.v_Base_dList_dconcatMap (fun d -> ((Base_dList.v_Base_dList_dmap (fun c -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueFlagsOf datas) c) })) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))) datas))

# 1218 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesFloat = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__511, dtb__512) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__511) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesFloat dtb__512)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__513) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatIntrinsicNames) dtb__513) then true else (v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesFloat dtb__512))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1224 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesTrace = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__514, dtb__515) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__514) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesTrace dtb__515)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__516) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dtraceIntrinsicNames) dtb__516) then true else (v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesTrace dtb__515))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1231 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesObs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__517, dtb__518) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__517) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesObs dtb__518)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__519) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dobsIntrinsicNames) dtb__519) then true else (v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesObs dtb__518))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1177 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerSharedOf = (fun datas defs -> ((fun runtime -> ((fun table -> ((fun locRows -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedRecordFields = (v_Vuna_dCompiler_dCodegen_dLower_drecordFieldsOf runtime); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedListFam = (v_Vuna_dCompiler_dCodegen_dLower_dlistFamOf runtime); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesFloat = (v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesFloat defs); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesTrace = (v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesTrace defs); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesObs = (v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesObs defs); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtors = (v_Vuna_dCompiler_dCodegen_dLower_dctorTableOf runtime); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtorOpaques = (v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueTableOf runtime); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUnboxed = (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet runtime); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedTyParams = table; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedDefLocs = locRows }) ((v_Vuna_dCompiler_dCodegen_dLower_dmapSome v_Vuna_dCompiler_dCodegen_dLower_dlocRowPair) defs))) (v_Vuna_dCompiler_dCodegen_dLower_dtyParamsOf runtime))) (v_Vuna_dCompiler_dCodegen_dLower_drtDatasOf datas)))

# 1244 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dcheckNoDupOcamlNamesGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__520, dtb__521) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__520) mc2) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["OCaml name collision among "; mc0; "s: `"; dtb__520; "`"])) else (((v_Vuna_dCompiler_dCodegen_dLower_dcheckNoDupOcamlNamesGo mc0) dtb__521) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__520) true) mc2)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 1241 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dcheckNoDupOcamlNames = (fun kind names -> (((v_Vuna_dCompiler_dCodegen_dLower_dcheckNoDupOcamlNamesGo kind) names) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

# 1250 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_densureUniqueOcamlNamesIn = (fun datas defs -> ((fun runtime -> ((fun unboxed -> ((fun valueNames -> ((fun typeNames -> ((fun ctorNames -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dLower_dcheckNoDupOcamlNames "value") valueNames)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dLower_dcheckNoDupOcamlNames "type") typeNames)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dLower_dcheckNoDupOcamlNames "constructor") ctorNames)))))) ((Base_dList.v_Base_dList_dconcatMap (fun d -> (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) unboxed) then Base_dList.C_Base_dList_dList_Nil else ((Base_dList.v_Base_dList_dmap (fun c -> ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))) runtime))) ((Base_dList.v_Base_dList_dmap (fun d -> (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dtypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))) runtime))) ((Base_dList.v_Base_dList_dmap (fun d -> (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)))) defs))) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet runtime))) (v_Vuna_dCompiler_dCodegen_dLower_drtDatasOf datas)))

# 1266 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dprepareProgram = (fun datas defs -> ((fun table -> ((fun familyNames -> ((fun axiomNames -> (match ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefs table) defs) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__522; Base_dPair.f_Base_dPair_dPair_second = dtb__523 } -> ((fun runtimeNames -> ((fun familyTypeNames -> ((fun allTypeNames -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntime axiomNames) dtb__522)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes defs)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dLower_densureUniqueOcamlNamesIn datas) dtb__522)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dcheckAllErasure allTypeNames) dtb__522)) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__522))))))))))) ((Base_dList.v_Base_dList_dappend dtb__523) familyTypeNames))) ((Base_dList.v_Base_dList_dfilter (fun n -> (Base_dBool.v_Base_dBool_dnot ((Base_dList.v_Base_dList_dmemName n) runtimeNames)))) familyNames))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) dtb__522))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_daxiomNamesOf defs))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas))) (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_ddefTable defs)))

# 1302 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_ddefTblOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__524, dtb__525) -> ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__524)) dtb__524) (v_Vuna_dCompiler_dCodegen_dLower_ddefTblOf dtb__525))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 1306 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dtblLookup = (fun tbl name -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) tbl))

# 1309 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_drecOkOfTbl = (fun tbl name -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dtblLookup tbl) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__526) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__526) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__527) -> (v_Vuna_dCompiler_dCodegen_dLower_drecursiveValueAllowedIn dtb__527)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1316 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dspanOfTbl = (fun tbl name -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dtblLookup tbl) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__528) -> (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__528)
  | _ -> failwith "DT: impossible branch"
))

# 1337 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dmapMaybeDef = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__529, dtb__530) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dtblLookup mc0) dtb__529) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dCodegen_dLower_dmapMaybeDef mc0) dtb__530)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__531) -> (Base_dList.C_Base_dList_dList_Cons (dtb__531, ((v_Vuna_dCompiler_dCodegen_dLower_dmapMaybeDef mc0) dtb__530)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1321 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dappendGroups = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__532, dtb__533) -> ((fun isRec -> ((fun members -> ((fun defs -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dlowerDefs mc0) mc1) defs)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__534; Base_dPair.f_Base_dPair_dPair_second = dtb__535 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dIr_dAnalysis.v_Vuna_dCompiler_dIr_dAnalysis_dcheckUniqueDefNames dtb__534)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dappendGroups mc0) dtb__535) dtb__533)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__536; Base_dPair.f_Base_dPair_dPair_second = dtb__537 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = isRec; Base_dPair.f_Base_dPair_dPair_second = dtb__534 }, dtb__536)); Base_dPair.f_Base_dPair_dPair_second = dtb__537 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dCodegen_dLower_dmapMaybeDef (mc0).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefTbl) members))) (Base_dPair.v_Base_dPair_dsecondOf dtb__532))) (Base_dPair.v_Base_dPair_dfirstOf dtb__532))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

# 1373 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dfirstOfList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__538, dtb__539) -> dtb__538
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1354 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dcheckRuntimeContract = ((fun intrinsicNames -> ((fun contractNames -> ((fun missingFromContract -> ((fun extrasInContract -> (if ((v_Vuna_dCompiler_dCodegen_dLower_dlistLength missingFromContract) > 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["runtime contract misses intrinsic `"; (v_Vuna_dCompiler_dCodegen_dLower_dfirstOfList missingFromContract); "`"])) else (if ((v_Vuna_dCompiler_dCodegen_dLower_dlistLength extrasInContract) > 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["runtime contract declares unknown symbol `"; (v_Vuna_dCompiler_dCodegen_dLower_dfirstOfList extrasInContract); "`"])) else (if ((v_Vuna_dCompiler_dCodegen_dLower_dlistLength Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextGaps) > 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["OCaml runtime table misses contract symbol `"; (v_Vuna_dCompiler_dCodegen_dLower_dfirstOfList Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextGaps); "`"])) else (if ((v_Vuna_dCompiler_dCodegen_dLower_dlistLength Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextExtras) > 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["OCaml runtime table has symbol outside the contract: `"; (v_Vuna_dCompiler_dCodegen_dLower_dfirstOfList Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextExtras); "`"])) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))))))) ((Base_dList.v_Base_dList_dfilter (fun n -> (if ((Base_dList.v_Base_dList_dmemName n) intrinsicNames) then false else (if ((Base_dList.v_Base_dList_dmemName n) Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtSyntheticNames) then false else true)))) contractNames))) ((Base_dList.v_Base_dList_dfilter (fun n -> (if (n = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dprimEffBind1Name) then false else (if ((Base_dList.v_Base_dList_dmemName n) contractNames) then false else true)))) intrinsicNames))) Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtNames)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dallIntrinsics))

# 1347 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dcheckProgramOf = (fun env -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dLower_dprepareProgram (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDatas) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefs)) (fun _u -> v_Vuna_dCompiler_dCodegen_dLower_dcheckRuntimeContract)))

# 1409 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dtyDeclTys = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrUnboxedDecl (dtb__540, dtb__541, dtb__542) -> (Base_dList.C_Base_dList_dList_Cons (dtb__542, Base_dList.C_Base_dList_dList_Nil))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl (dtb__543, dtb__544, dtb__545, dtb__546) -> dtb__546
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl (dtb__547, dtb__548, dtb__549) -> ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) dtb__549)
  | _ -> failwith "DT: impossible branch"
))

# 1418 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dfoldlTyNames = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__550, dtb__551) -> ((v_Vuna_dCompiler_dCodegen_dLower_dfoldlTyNames dtb__551) ((v_Vuna_dCompiler_dCodegen_dLower_dtyNamesInto dtb__550) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1422 "Vuna/Compiler/Codegen/Lower.vuna"
and v_Vuna_dCompiler_dCodegen_dLower_dtyNamesInto = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__552, dtb__553) -> ((v_Vuna_dCompiler_dCodegen_dLower_dfoldlTyNames dtb__553) ((v_Vuna_dCompiler_dCodegen_dLower_dpushDep dtb__552) mc1))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__554, dtb__555) -> ((v_Vuna_dCompiler_dCodegen_dLower_dtyNamesInto dtb__555) ((v_Vuna_dCompiler_dCodegen_dLower_dtyNamesInto dtb__554) mc1))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef (dtb__556) -> ((v_Vuna_dCompiler_dCodegen_dLower_dtyNamesInto dtb__556) mc1)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (dtb__557) -> ((v_Vuna_dCompiler_dCodegen_dLower_dtyNamesInto dtb__557) mc1)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__558) -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 1414 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dtyDeclRefsGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__559, dtb__560) -> ((v_Vuna_dCompiler_dCodegen_dLower_dtyDeclRefsGo dtb__560) ((v_Vuna_dCompiler_dCodegen_dLower_dfoldlTyNames dtb__559) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 1406 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dtyDeclRefs = (fun decls -> ((v_Vuna_dCompiler_dCodegen_dLower_dtyDeclRefsGo ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dLower_dtyDeclTys) decls)) Base_dList.C_Base_dList_dList_Nil))

# 1437 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dbodyOrDummy = (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__561) -> dtb__561
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (0))
  | _ -> failwith "DT: impossible branch"
))

# 1434 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dadjOfDef = (fun env d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dCodegen_dLower_ddepsWithFloatRender env) (v_Vuna_dCompiler_dCodegen_dLower_dbodyOrDummy d)) })

# 1288 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dgroupDefs = (fun env defs -> ((fun adj -> ((fun names -> ((fun tbl -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dIr_dAnalysis.v_Vuna_dCompiler_dIr_dAnalysis_dassembleGroupNames adj) names) (v_Vuna_dCompiler_dCodegen_dLower_drecOkOfTbl tbl)) (v_Vuna_dCompiler_dCodegen_dLower_dspanOfTbl tbl))) (fun groups -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dappendGroups env) 0) groups)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__562; Base_dPair.f_Base_dPair_dPair_second = dtb__563 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__562))
  | _ -> failwith "DT: impossible branch"
)))))) (v_Vuna_dCompiler_dCodegen_dLower_ddefTblOf defs))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) defs))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dCodegen_dLower_dadjOfDef env)) defs)))

# 1447 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dactionResultTyIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__564, dtb__565, dtb__566) -> (match dtb__564 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__567, dtb__568, dtb__569) -> (match dtb__567 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__570) -> (if (dtb__570 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffTypeName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = "eff"; Base_dPair.f_Base_dPair_dPair_second = dtb__565 })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 1453 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dcollectBuiltinRowTags = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__571, dtb__572) -> (if (dtb__571 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__573, dtb__574) -> (match dtb__574 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__575, dtb__576) -> (match dtb__576 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__577, dtb__578) -> ((fun rest -> ((fun tagTerm -> (match tagTerm with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__579) -> (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disBuiltinEffectTag dtb__579) then (Base_dList.C_Base_dList_dList_Cons (dtb__579, rest)) else rest)
  | _ -> rest
)) (Base_dPair.v_Base_dPair_dfirstOf dtb__575))) (v_Vuna_dCompiler_dCodegen_dLower_dcollectBuiltinRowTags (Base_dPair.v_Base_dPair_dfirstOf dtb__577)))
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)) dtb__572) else Base_dList.C_Base_dList_dList_Nil)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

# 1466 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dmainRowTags = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__580, dtb__581, dtb__582) -> (match dtb__580 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__583, dtb__584, dtb__585) -> (match dtb__583 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__586) -> (if (dtb__586 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffTypeName) then (v_Vuna_dCompiler_dCodegen_dLower_dcollectBuiltinRowTags ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__584))) else Base_dList.C_Base_dList_dList_Nil)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

# 1486 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dmainShowRtIr = (fun g -> (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtShowInt)))) else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtShowNat)))) else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtShowStr)))) else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtShowFloat)))) else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtShowBool)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))))

# 1481 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dmainShowForNameIr = (fun g -> (match (v_Vuna_dCompiler_dCodegen_dLower_dmainShowRtIr g) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__587) -> dtb__587
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dmainShowDefName))
  | _ -> failwith "DT: impossible branch"
))

# 1474 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dmainShowIr = (fun tyTerm -> (match ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) tyTerm)) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__588) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__589, dtb__590) -> (match dtb__590 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dCodegen_dLower_dmainShowForNameIr dtb__589)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dmainShowDefName))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dmainShowDefName))
)) dtb__588)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dmainShowDefName))
))

# 1508 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dfilterMapRunHost = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__591, dtb__592) -> ((fun host -> (if (host = "") then (v_Vuna_dCompiler_dCodegen_dLower_dfilterMapRunHost dtb__592) else (Base_dList.C_Base_dList_dList_Cons (host, (v_Vuna_dCompiler_dCodegen_dLower_dfilterMapRunHost dtb__592))))) (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dbuiltinEffectImplOf dtb__591))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1517 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dfilterMapErrorRunHost = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__593, dtb__594) -> ((fun host -> (if (host = "") then (v_Vuna_dCompiler_dCodegen_dLower_dfilterMapErrorRunHost dtb__594) else (Base_dList.C_Base_dList_dList_Cons (host, (v_Vuna_dCompiler_dCodegen_dLower_dfilterMapErrorRunHost dtb__594))))) (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dbuiltinEffectErrorRunHostOf dtb__593))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1495 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerEntryOf = (fun defs -> (match ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef "main") defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__595) -> (match (v_Vuna_dCompiler_dCodegen_dLower_dactionResultTyIn (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__595)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__596) -> ((fun innerTy -> ((fun tags -> ((fun handlers -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = (v_Vuna_dCompiler_dCodegen_dLower_dmainShowIr innerTy); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = "main"; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = true; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffMainRunName)); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = handlers }))))) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dLower_dfilterMapRunHost tags)) (v_Vuna_dCompiler_dCodegen_dLower_dfilterMapErrorRunHost tags)))) (v_Vuna_dCompiler_dCodegen_dLower_dmainRowTags (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__595)))) (Base_dPair.v_Base_dPair_dsecondOf dtb__596))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = (v_Vuna_dCompiler_dCodegen_dLower_dmainShowIr (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__595)); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = "main"; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = false; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = Base_dList.C_Base_dList_dList_Nil }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1524 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dgroupOfPair = (fun mc0 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__597; Base_dPair.f_Base_dPair_dPair_second = dtb__598 } -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = dtb__597; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = dtb__598 }
  | _ -> failwith "DT: impossible branch"
))

# 1537 "Vuna/Compiler/Codegen/Lower.vuna"
let rec v_Vuna_dCompiler_dCodegen_dLower_dnameSetOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__599, dtb__600) -> ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__599) true) (v_Vuna_dCompiler_dCodegen_dLower_dnameSetOf dtb__600))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 1528 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dmkLwEnv = (fun datas defs unit -> ((fun shared -> ((fun runtime -> { f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwShared = shared; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDatas = runtime; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwTyParams = (v_Vuna_dCompiler_dCodegen_dLower_dtyParamsOf runtime); f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRecordFields = (v_Vuna_dCompiler_dCodegen_dLower_drecordFieldsOf runtime); f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors = (shared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtors; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwOpaques = (shared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtorOpaques; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnboxed = (shared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUnboxed; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefs = defs; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefTbl = (v_Vuna_dCompiler_dCodegen_dLower_ddefTblOf defs); f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRuntimeNames = (v_Vuna_dCompiler_dCodegen_dLower_dnameSetOf (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf defs)); f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnit = unit }) (v_Vuna_dCompiler_dCodegen_dLower_drtDatasOf datas))) ((v_Vuna_dCompiler_dCodegen_dLower_dlowerSharedOf datas) defs)))

# 1555 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dpartitionRuntimeDefs = (fun defs -> (match ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefs (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_ddefTable defs)) defs) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__601; Base_dPair.f_Base_dPair_dPair_second = dtb__602 } -> dtb__601
  | _ -> failwith "DT: impossible branch"
))

# 1387 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerUnitAfterChecks = (fun env defNames dataNames -> ((fun datas -> ((fun defNameTbl -> ((fun defs -> ((fun dataNameTbl -> ((fun unitDatas -> ((fun runtime -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dLower_dgroupDefs env) runtime)) (fun groups -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dLower_dtyDeclsOf datas) unitDatas)) (fun decls -> ((fun groups2 -> ((fun hasList -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls = decls; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups = groups2; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily = hasList; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs = (v_Vuna_dCompiler_dCodegen_dLower_dtyDeclRefs decls); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing }))) ((Base_dList.v_Base_dList_dmemName Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistFamilyName) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) unitDatas)))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dLower_dgroupOfPair) groups))))))) (v_Vuna_dCompiler_dCodegen_dLower_dpartitionRuntimeDefs defs))) ((Base_dList.v_Base_dList_dfilter (fun d -> ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) dataNameTbl))) datas))) (Base_dHashMap.v_Base_dHashMap_dofNames dataNames))) ((Base_dList.v_Base_dList_dfilter (fun d -> ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) defNameTbl))) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefs))) (Base_dHashMap.v_Base_dHashMap_dofNames defNames))) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDatas))

# 1380 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerUnitOf = (fun env defNames dataNames -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dCodegen_dLower_dcheckProgramOf env)) (fun _u -> (((v_Vuna_dCompiler_dCodegen_dLower_dlowerUnitAfterChecks env) defNames) dataNames))))

# 1542 "Vuna/Compiler/Codegen/Lower.vuna"
let v_Vuna_dCompiler_dCodegen_dLower_dlowerProgramOf = (fun datas defs -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCheck "vuna.codegen.env") (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dCodegen_dLower_dmkLwEnv datas) defs) "")))))) (fun env -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCheck "vuna.codegen.prepare") (fun _u -> (v_Vuna_dCompiler_dCodegen_dLower_dcheckProgramOf env)))) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCheck "vuna.codegen.unit") (fun _u -> (((v_Vuna_dCompiler_dCodegen_dLower_dlowerUnitAfterChecks env) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) defs)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas))))) (fun unitIr -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCheck "vuna.codegen.entry") (fun _u -> (v_Vuna_dCompiler_dCodegen_dLower_dlowerEntryOf defs)))) (fun entry -> ((fun program -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dIr.v_Vuna_dCompiler_dIr_dvalidateProgram program)) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (program))))) { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgShared = (v_Vuna_dCompiler_dCodegen_dLower_dlwEnvShared env); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit = { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry = entry } }))))))))))
