open Vuna_runtime
type t_Vuna_dCompiler_dLowering_dEnv_dLwEnv = { f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwShared : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrShared; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxedInfo : (string, (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor, int) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwRecordFields : (string, (int, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors : (string, (string, bool Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwOpaques : (string, bool Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxed : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwHasListFamily : bool; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefTbl : (string, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwFacts : (string, Vuna_dCompiler_dLowering_dChecks.t_Vuna_dCompiler_dLowering_dChecks_dTermUse) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnit : string }

# 62 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dlwEnvShared = (fun (mc0 : t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) -> (match mc0 with
  | { f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwShared = dtb__0; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas = dtb__1; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams = dtb__2; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxedInfo = dtb__3; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwRecordFields = dtb__4; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors = dtb__5; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwOpaques = dtb__6; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxed = dtb__7; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwHasListFamily = dtb__8; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefs = dtb__9; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefTbl = dtb__10; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwFacts = dtb__11; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnit = dtb__12 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dlwEnvWithUnit = (fun (mc0 : string) (mc1 : t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) -> (match mc1 with
  | { f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwShared = dtb__13; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas = dtb__14; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams = dtb__15; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxedInfo = dtb__16; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwRecordFields = dtb__17; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors = dtb__18; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwOpaques = dtb__19; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxed = dtb__20; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwHasListFamily = dtb__21; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefs = dtb__22; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefTbl = dtb__23; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwFacts = dtb__24; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnit = dtb__25 } -> { f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwShared = dtb__13; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas = dtb__14; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams = dtb__15; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxedInfo = dtb__16; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwRecordFields = dtb__17; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors = dtb__18; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwOpaques = dtb__19; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxed = dtb__20; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwHasListFamily = dtb__21; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefs = dtb__22; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefTbl = dtb__23; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwFacts = dtb__24; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnit = mc0 }
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dlistLength = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__26, dtb__27) -> (1 + (v_Vuna_dCompiler_dLowering_dEnv_dlistLength dtb__27))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dpushDep = (fun dep deps -> (if (dep = "") then deps else (if ((Base_dData_dList.v_Base_dData_dList_dmemName dep) deps) then deps else ((Base_dData_dList.v_Base_dData_dList_dappend deps) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dep, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))

# 81 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dmapSome = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__28, dtb__29) -> (match (mc0 dtb__28) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dLowering_dEnv_dmapSome mc0) dtb__29)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__30) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__30, ((v_Vuna_dCompiler_dLowering_dEnv_dmapSome mc0) dtb__29)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_disTypeHeadOpaqueDatas = (fun datas name -> (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disUnboxedCanonical name) then false else (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData name) datas) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__31) -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disTypeConstructorName name))
  | _ -> failwith "DT: impossible branch"
)))

# 95 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dmemOpaqueLevel = (fun (mc0 : int) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__32, dtb__33) -> (if (dtb__32 = mc0) then true else ((v_Vuna_dCompiler_dLowering_dEnv_dmemOpaqueLevel mc0) dtb__33))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_disRecordData = (fun d -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataIsRecord d) then ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__34, dtb__35) -> (match dtb__35 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> false
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)) else false))

# 122 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_drecordRtFieldsGo = (fun (mc0 : string) (mc1 : bool Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__36, dtb__37) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__38, dtb__39) -> (if dtb__36 then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__38).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (dtb__38).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName }, (((v_Vuna_dCompiler_dLowering_dEnv_drecordRtFieldsGo mc0) dtb__37) dtb__39))) else (((v_Vuna_dCompiler_dLowering_dEnv_drecordRtFieldsGo mc0) dtb__37) dtb__39))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 114 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_drecordRtFields = (fun d -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__40, dtb__41) -> (match dtb__41 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun arity -> (((v_Vuna_dCompiler_dLowering_dEnv_drecordRtFieldsGo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) ((Base_dData_dList.v_Base_dData_dList_ddrop arity) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags dtb__40))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataFields d))) (v_Vuna_dCompiler_dLowering_dEnv_dlistLength (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

# 130 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dhasRecordRepr = (fun d -> (if (v_Vuna_dCompiler_dLowering_dEnv_disRecordData d) then (match (v_Vuna_dCompiler_dLowering_dEnv_drecordRtFields d) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> true
) else false))

# 137 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_drtDatasOf = (fun datas -> ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disUnboxedCanonical (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))))) datas))

# 145 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueGo = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : int) (mc3 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (mc4 : int Base_dData_dList.t_Base_dData_dList_dList) (mc5 : bool Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__42, dtb__43) -> (match dtb__42 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__44; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__45 } -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__46, dtb__47, dtb__48, dtb__49, dtb__50) -> ((fun flag -> ((fun fam2 -> ((fun next -> ((((((v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueGo mc0) dtb__43) (mc2 + 1)) next) fam2) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (flag, mc5)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__50) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__46, mc2, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue dtb__49) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc2, mc4)) else mc4))) (if (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__45)) then (if (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped (fun (l : int) -> ((v_Vuna_dCompiler_dLowering_dEnv_dmemOpaqueLevel l) mc4))) (v_Vuna_dCompiler_dLowering_dEnv_disTypeHeadOpaqueDatas mc0)) mc2) mc4) dtb__49) then true else (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dvalueHasImplicitPi dtb__49)) else false))
  | _ -> (Base_dData_dList.v_Base_dData_dList_dreverse mc5)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc5)
  | _ -> failwith "DT: impossible branch"
))

# 142 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueFlagsOf = (fun datas c -> ((((((v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueGo datas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) Base_dData_dList.C_Base_dData_dList_dList_Nil) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 159 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dlocRowPair = (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__51) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__51).Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartLine dtb__51) } }))
  | _ -> failwith "DT: impossible branch"
))

# 174 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dtypeParamLevelsGo = (fun (mc0 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__52, dtb__53) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__52)) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc1, ((v_Vuna_dCompiler_dLowering_dEnv_dtypeParamLevelsGo dtb__53) (mc1 + 1)))) else ((v_Vuna_dCompiler_dLowering_dEnv_dtypeParamLevelsGo dtb__53) (mc1 + 1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 171 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dtypeParamLevels = (fun d -> ((v_Vuna_dCompiler_dLowering_dEnv_dtypeParamLevelsGo (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams) 0))

# 180 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dmemIntIn = (fun (mc0 : int) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__54, dtb__55) -> (if (dtb__54 = mc0) then true else ((v_Vuna_dCompiler_dLowering_dEnv_dmemIntIn mc0) dtb__55))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dlevelSlotGoIn = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) (mc2 : int) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__56, dtb__57) -> (if (dtb__56 = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (mc2)) else (((v_Vuna_dCompiler_dLowering_dEnv_dlevelSlotGoIn dtb__57) mc1) (mc2 + 1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 184 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dlevelSlotIn = (fun levels lvl -> (((v_Vuna_dCompiler_dLowering_dEnv_dlevelSlotGoIn levels) lvl) 0))

# 191 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dnthValueIn = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__58, dtb__59) -> (if (mc1 <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__58)) else ((v_Vuna_dCompiler_dLowering_dEnv_dnthValueIn dtb__59) (mc1 - 1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 195 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dlookupUsedIn = (fun (mc0 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__60, dtb__61) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__60) = mc1) then (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__60) else ((v_Vuna_dCompiler_dLowering_dEnv_dlookupUsedIn dtb__61) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 200 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dlookupTyParamsIn = (fun tbl name -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) tbl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__62) -> dtb__62
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 208 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedLevelsFuel = (fun fuel tps table datas lvl v -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__63, dtb__64, dtb__65, dtb__66, dtb__67) -> (if dtb__64 then ((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) (lvl + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__67) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__63, lvl, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) else ((Base_dData_dList.v_Base_dData_dList_dappend ((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) lvl) dtb__66)) ((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) (lvl + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__67) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__63, lvl, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__68) -> (match dtb__68 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__69, dtb__70, dtb__71) -> ((Base_dData_dList.v_Base_dData_dList_dappend (if ((v_Vuna_dCompiler_dLowering_dEnv_dmemIntIn dtb__70) tps) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__70, Base_dData_dList.C_Base_dData_dList_dList_Nil)) else Base_dData_dList.C_Base_dData_dList_dList_Nil)) ((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedSpineFuel (fuel - 1)) tps) table) datas) lvl) dtb__71))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__72, dtb__73) -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData dtb__72) datas) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__74) -> (((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) ((v_Vuna_dCompiler_dLowering_dEnv_dlookupUsedIn table) dtb__72)) dtb__73)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedSpineFuel (fuel - 1)) tps) table) datas) lvl) dtb__73)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)))
# 225 "Vuna/Compiler/Lowering/Env.vuna"
and v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedSpineFuel = (fun (mc0 : int) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (mc4 : int) (mc5 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__75, dtb__76) -> (if (mc0 <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else ((Base_dData_dList.v_Base_dData_dList_dappend ((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedLevelsFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__75)) ((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedSpineFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__76)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))
# 236 "Vuna/Compiler/Lowering/Env.vuna"
and v_Vuna_dCompiler_dLowering_dEnv_dcollectFamilyArgsFuel = (fun fuel tps table datas lvl usedPats args -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match usedPats with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__77, dtb__78) -> (match ((v_Vuna_dCompiler_dLowering_dEnv_dnthValueIn args) dtb__77) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__79) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) lvl) dtb__79)) (((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) dtb__78) args))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) dtb__78) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 205 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedLevels = (fun tps table datas lvl v -> ((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedLevelsFuel 256) tps) table) datas) lvl) v))

# 232 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dcollectFamilyArgs = (fun tps table datas lvl usedPats args -> (((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectFamilyArgsFuel 256) tps) table) datas) lvl) usedPats) args))

# 246 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dctorUsedLevels = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (mc3 : int Base_dData_dList.t_Base_dData_dList_dList) (mc4 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc5 : int) (mc6 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__80, dtb__81) -> (match dtb__80 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__82; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__83 } -> (match mc6 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__84, dtb__85, dtb__86, dtb__87, dtb__88) -> ((fun isOpq -> ((fun fam2 -> ((fun next -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__83) then (((((((v_Vuna_dCompiler_dLowering_dEnv_dctorUsedLevels mc0) mc1) mc2) fam2) dtb__81) (mc5 + 1)) next) else (if isOpq then (((((((v_Vuna_dCompiler_dLowering_dEnv_dctorUsedLevels mc0) mc1) mc2) fam2) dtb__81) (mc5 + 1)) next) else ((Base_dData_dList.v_Base_dData_dList_dappend (((((v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedLevels mc0) mc1) mc2) mc5) dtb__87)) (((((((v_Vuna_dCompiler_dLowering_dEnv_dctorUsedLevels mc0) mc1) mc2) fam2) dtb__81) (mc5 + 1)) next))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__88) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__84, mc5, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue dtb__87) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc5, mc3)) else mc3))) (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped (fun (l : int) -> ((v_Vuna_dCompiler_dLowering_dEnv_dmemOpaqueLevel l) mc3))) (v_Vuna_dCompiler_dLowering_dEnv_disTypeHeadOpaqueDatas mc2)) mc5) mc3) dtb__87))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 264 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_ddataUsedLevels = (fun d table datas -> ((fun raw -> ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (l : int) -> ((v_Vuna_dCompiler_dLowering_dEnv_dmemIntIn l) raw))) (v_Vuna_dCompiler_dLowering_dEnv_dtypeParamLevels d))) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (c : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) -> (((((((v_Vuna_dCompiler_dLowering_dEnv_dctorUsedLevels (v_Vuna_dCompiler_dLowering_dEnv_dtypeParamLevels d)) table) datas) Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))

# 273 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dlevelListEq = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__89, dtb__90) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__91, dtb__92) -> (if (dtb__89 = dtb__91) then ((v_Vuna_dCompiler_dLowering_dEnv_dlevelListEq dtb__90) dtb__92) else false)
  | _ -> false
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 278 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dsameLevelTable = (fun (mc0 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__93, dtb__94) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__95, dtb__96) -> (if (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__93) = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__95)) then ((v_Vuna_dCompiler_dLowering_dEnv_dlevelListEq (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__93)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__95)) else false) then ((v_Vuna_dCompiler_dLowering_dEnv_dsameLevelTable dtb__94) dtb__96) else false)
  | _ -> false
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 288 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dusedTableFixFuel = (fun fuel datas table -> (if (fuel <= 0) then table else ((fun next -> (if ((v_Vuna_dCompiler_dLowering_dEnv_dsameLevelTable next) table) then next else (((v_Vuna_dCompiler_dLowering_dEnv_dusedTableFixFuel (fuel - 1)) datas) next))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((v_Vuna_dCompiler_dLowering_dEnv_ddataUsedLevels d) table) datas) })) datas))))

# 285 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dusedTableFix = (fun datas table -> (((v_Vuna_dCompiler_dLowering_dEnv_dusedTableFixFuel 64) datas) table))

# 296 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dtyParamsOf = (fun datas -> ((v_Vuna_dCompiler_dLowering_dEnv_dusedTableFix datas) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil })) datas)))

# 299 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_drecordFieldsOf = (fun datas -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dLowering_dEnv_drecordRtFields d) })) ((Base_dData_dList.v_Base_dData_dList_dfilter v_Vuna_dCompiler_dLowering_dEnv_dhasRecordRepr) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> (Base_dData_dBool.v_Base_dData_dBool_dnot ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet datas))))) datas))))

# 306 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dfloatRenderRefName = "Base.Data.Float.floatRender"

# 332 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dunboxedRowOf = (fun (mc0 : (string, (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor, int) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__97; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__98 } -> (match dtb__98 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__99; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__100 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__97; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__99); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__100 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 341 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dlookupFacts = (fun facts name -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) facts) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__101) -> dtb__101
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> { Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps = Base_dData_dList.C_Base_dData_dList_dList_Nil; Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags = Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dnoUseFlags; Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit = false }
  | _ -> failwith "DT: impossible branch"
))

# 314 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dfactsOf = (fun env name -> ((v_Vuna_dCompiler_dLowering_dEnv_dlookupFacts (env).f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwFacts) name))

# 310 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dfactsDepsOf = (fun env name -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (d : string) -> (if (d = "strFromFloat") then v_Vuna_dCompiler_dLowering_dEnv_dfloatRenderRefName else d))) (((v_Vuna_dCompiler_dLowering_dEnv_dfactsOf env) name)).Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps))

# 336 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_danyDefFlag = (fun (mc0 : (Vuna_dCompiler_dLowering_dChecks.t_Vuna_dCompiler_dLowering_dChecks_dTermUse) -> bool) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, Vuna_dCompiler_dLowering_dChecks.t_Vuna_dCompiler_dLowering_dChecks_dTermUse) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__102, dtb__103) -> (if (mc0 ((v_Vuna_dCompiler_dLowering_dEnv_dlookupFacts mc2) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__102))) then true else (((v_Vuna_dCompiler_dLowering_dEnv_danyDefFlag mc0) dtb__103) mc2))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 355 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dfindFamilyCtor = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__104, dtb__105) -> (if ((Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dctorSpellingKey (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__104)) = (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dctorSpellingKey mc1)) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__104)) else ((v_Vuna_dCompiler_dLowering_dEnv_dfindFamilyCtor dtb__105) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 361 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dfindListFamilyData = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__106, dtb__107) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__106) = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dlistFamilyName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__106)) else (v_Vuna_dCompiler_dLowering_dEnv_dfindListFamilyData dtb__107))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 346 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dlistFamOf = (fun datas -> (match (v_Vuna_dCompiler_dLowering_dEnv_dfindListFamilyData datas) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__108) -> (match ((v_Vuna_dCompiler_dLowering_dEnv_dfindFamilyCtor (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__108)) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dlistNilCtor) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__109) -> (match ((v_Vuna_dCompiler_dLowering_dEnv_dfindFamilyCtor (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__108)) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dlistConsCtor) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__110) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListFamily = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__108); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListNil = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__109); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListCons = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__110) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 366 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dctorTableOf = (fun datas -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (c : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c) } })) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))) datas))

# 320 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dlowerSharedOf = (fun datas defs facts -> ((fun runtime -> ((fun locRows -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedRecordFields = (v_Vuna_dCompiler_dLowering_dEnv_drecordFieldsOf runtime); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedListFam = (v_Vuna_dCompiler_dLowering_dEnv_dlistFamOf runtime); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesFloat = (((v_Vuna_dCompiler_dLowering_dEnv_danyDefFlag (fun (f : Vuna_dCompiler_dLowering_dChecks.t_Vuna_dCompiler_dLowering_dChecks_dTermUse) -> (if ((f).Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags).Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsFloat then true else (f).Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit))) defs) facts); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesTrace = (((v_Vuna_dCompiler_dLowering_dEnv_danyDefFlag (fun (f : Vuna_dCompiler_dLowering_dChecks.t_Vuna_dCompiler_dLowering_dChecks_dTermUse) -> ((f).Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags).Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsTrace)) defs) facts); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesObs = (((v_Vuna_dCompiler_dLowering_dEnv_danyDefFlag (fun (f : Vuna_dCompiler_dLowering_dChecks.t_Vuna_dCompiler_dLowering_dChecks_dTermUse) -> ((f).Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags).Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsObs)) defs) facts); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedDefLocs = locRows; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUnboxed = ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLowering_dEnv_dunboxedRowOf) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedInfoOf runtime)); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtorShapes = (v_Vuna_dCompiler_dLowering_dEnv_dctorTableOf runtime) }) ((v_Vuna_dCompiler_dLowering_dEnv_dmapSome v_Vuna_dCompiler_dLowering_dEnv_dlocRowPair) defs))) (v_Vuna_dCompiler_dLowering_dEnv_drtDatasOf datas)))

# 372 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueTableOf = (fun datas -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (c : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueFlagsOf datas) c) })) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))) datas))

# 404 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dintrinsicUseFlagsTbl = (((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsertAll Base_dData_dString.v_Hashable_uString) ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap (fun (n : string) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = n; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsFloat = true; Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsTrace = false; Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsObs = false } })) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfloatIntrinsicNames)) ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap (fun (n : string) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = n; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsFloat = false; Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsTrace = true; Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsObs = false } })) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dtraceIntrinsicNames)) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (n : string) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = n; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsFloat = false; Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsTrace = false; Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsObs = true } })) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dobsIntrinsicNames)))) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 410 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_duseFlagsOfName = (fun name -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) v_Vuna_dCompiler_dLowering_dEnv_dintrinsicUseFlagsTbl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__111) -> dtb__111
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dnoUseFlags
  | _ -> failwith "DT: impossible branch"
))

# 398 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_ddefFactsOf = (fun names d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> { Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps = Base_dData_dList.C_Base_dData_dList_dList_Nil; Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags = Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dnoUseFlags; Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit = false }
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__112) -> (((Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dtermUseInto names) v_Vuna_dCompiler_dLowering_dEnv_duseFlagsOfName) dtb__112)
  | _ -> failwith "DT: impossible branch"
))

# 416 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_ddefTblOf = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__113, dtb__114) -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__113)) dtb__113) (v_Vuna_dCompiler_dLowering_dEnv_ddefTblOf dtb__114))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 421 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dstrTblOf = (fun pairs -> (((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsertAll Base_dData_dString.v_Hashable_uString) pairs) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 425 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dhasDataNamed = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__115, dtb__116) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__115) = mc0) then true else ((v_Vuna_dCompiler_dLowering_dEnv_dhasDataNamed mc0) dtb__116))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 429 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dnameSetOf = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__117, dtb__118) -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) dtb__117) true) (v_Vuna_dCompiler_dLowering_dEnv_dnameSetOf dtb__118))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 390 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_ddefFactsTblOf = (fun defs -> ((fun names -> (((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsertAll Base_dData_dString.v_Hashable_uString) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dLowering_dEnv_ddefFactsOf names) d) })) defs)) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil))) (v_Vuna_dCompiler_dLowering_dEnv_dnameSetOf (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("strFromFloat", (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_druntimeNamesOf defs))))))

# 378 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dmkLwEnv = (fun datas defs unit -> ((fun facts -> ((fun shared -> ((fun runtime -> { f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwShared = shared; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas = runtime; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams = (v_Vuna_dCompiler_dLowering_dEnv_dstrTblOf (v_Vuna_dCompiler_dLowering_dEnv_dtyParamsOf runtime)); f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxedInfo = (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedInfoOf runtime); f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwRecordFields = (v_Vuna_dCompiler_dLowering_dEnv_dstrTblOf (shared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedRecordFields); f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors = (v_Vuna_dCompiler_dLowering_dEnv_dstrTblOf (v_Vuna_dCompiler_dLowering_dEnv_dctorTableOf runtime)); f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwOpaques = (v_Vuna_dCompiler_dLowering_dEnv_dstrTblOf (v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueTableOf runtime)); f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxed = (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet runtime)); f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwHasListFamily = ((v_Vuna_dCompiler_dLowering_dEnv_dhasDataNamed Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dlistFamilyName) datas); f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefs = defs; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefTbl = (v_Vuna_dCompiler_dLowering_dEnv_ddefTblOf defs); f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwFacts = facts; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnit = unit }) (v_Vuna_dCompiler_dLowering_dEnv_drtDatasOf datas))) (((v_Vuna_dCompiler_dLowering_dEnv_dlowerSharedOf datas) defs) facts))) (v_Vuna_dCompiler_dLowering_dEnv_ddefFactsTblOf defs)))
