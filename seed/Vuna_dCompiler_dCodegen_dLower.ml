open Vuna_runtime
type t_Vuna_dCompiler_dCodegen_dLower_dLwEnv = { f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwShared : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrShared; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDatas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwTyParams : (string, int Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRecordFields : (string, (int, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors : (string, (string, bool Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwOpaques : (string, bool Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnboxed : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRuntimeNames : (string, bool) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnit : string }
and t_Vuna_dCompiler_dCodegen_dLower_dLwSt = int
and t_Vuna_dCompiler_dCodegen_dLower_dLamChainIn = { f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBinders : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBody : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn = { f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeEnv : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aePats : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeSt : t_Vuna_dCompiler_dCodegen_dLower_dLwSt }

let v_Vuna_dCompiler_dCodegen_dLower_dlwEnvShared = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwShared = dtb__0; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDatas = dtb__1; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwTyParams = dtb__2; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRecordFields = dtb__3; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors = dtb__4; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwOpaques = dtb__5; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnboxed = dtb__6; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefs = dtb__7; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRuntimeNames = dtb__8; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnit = dtb__9 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dlwEnvWithUnit = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwShared = dtb__10; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDatas = dtb__11; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwTyParams = dtb__12; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRecordFields = dtb__13; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors = dtb__14; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwOpaques = dtb__15; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnboxed = dtb__16; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefs = dtb__17; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRuntimeNames = dtb__18; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnit = dtb__19 } -> { f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwShared = dtb__10; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDatas = dtb__11; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwTyParams = dtb__12; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRecordFields = dtb__13; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors = dtb__14; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwOpaques = dtb__15; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnboxed = dtb__16; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefs = dtb__17; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRuntimeNames = dtb__18; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnit = mc0 }
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dmemList = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__20, dtb__21) -> (if (dtb__20 = mc0) then true else ((v_Vuna_dCompiler_dCodegen_dLower_dmemList mc0) dtb__21))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dlookupList = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__22, dtb__23) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__22) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__22))) else ((v_Vuna_dCompiler_dCodegen_dLower_dlookupList mc0) dtb__23))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dpushDep = (fun dep deps -> (if (dep = "") then deps else (if ((v_Vuna_dCompiler_dCodegen_dLower_dmemList dep) deps) then deps else ((Base_dList.v_Base_dList_dappend deps) (Base_dList.C_Base_dList_dList_Cons (dep, Base_dList.C_Base_dList_dList_Nil))))))

let rec v_Vuna_dCompiler_dCodegen_dLower_dlistLength = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__24, dtb__25) -> (1 + (v_Vuna_dCompiler_dCodegen_dLower_dlistLength dtb__25))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dbinderErasedOf = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = dtb__26; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = dtb__27 } -> dtb__27
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dmapSome = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__28, dtb__29) -> (match (mc0 dtb__28) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dCodegen_dLower_dmapSome mc0) dtb__29)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__30) -> (Base_dList.C_Base_dList_dList_Cons (dtb__30, ((v_Vuna_dCompiler_dCodegen_dLower_dmapSome mc0) dtb__29)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_disTypeHeadOpaqueDatas = (fun datas name -> (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then false else (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then false else (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData name) datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__31) -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disTypeConstructorName name))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCodegen_dLower_dmemOpaqueLevel = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__32, dtb__33) -> (if (dtb__32 = mc0) then true else ((v_Vuna_dCompiler_dCodegen_dLower_dmemOpaqueLevel mc0) dtb__33))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_disRecordData = (fun d -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataIsRecord d) then ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__34, dtb__35) -> (match dtb__35 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> false
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)) else false))

let rec v_Vuna_dCompiler_dCodegen_dLower_drecordRtFieldsGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__38, dtb__39) -> (if dtb__36 then (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__38).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex; Base_dPair.f_Base_dPair_dPair_second = (dtb__38).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName }, (((v_Vuna_dCompiler_dCodegen_dLower_drecordRtFieldsGo mc0) dtb__37) dtb__39))) else (((v_Vuna_dCompiler_dCodegen_dLower_drecordRtFieldsGo mc0) dtb__37) dtb__39))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_drecordRtFields = (fun d -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__40, dtb__41) -> (match dtb__41 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun arity -> (((v_Vuna_dCompiler_dCodegen_dLower_drecordRtFieldsGo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) ((Base_dList.v_Base_dList_ddrop arity) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags dtb__40))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataFields d))) (v_Vuna_dCompiler_dCodegen_dLower_dlistLength (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams))
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

let v_Vuna_dCompiler_dCodegen_dLower_dhasRecordRepr = (fun d -> (if (v_Vuna_dCompiler_dCodegen_dLower_disRecordData d) then (match (v_Vuna_dCompiler_dCodegen_dLower_drecordRtFields d) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> true
) else false))

let v_Vuna_dCompiler_dCodegen_dLower_disBoolFamilyName = (fun name -> (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName))

let v_Vuna_dCompiler_dCodegen_dLower_disNatFamilyName = (fun name -> (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName))

let v_Vuna_dCompiler_dCodegen_dLower_drtDatasOf = (fun datas -> ((Base_dList.v_Base_dList_dfilter (fun d -> (if (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dCodegen_dLower_disBoolFamilyName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))) then (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dCodegen_dLower_disNatFamilyName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))) else false))) datas))

let rec v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__42, dtb__43) -> (match dtb__42 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__44; Base_dPair.f_Base_dPair_dPair_second = dtb__45 } -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__46, dtb__47, dtb__48, dtb__49, dtb__50) -> ((fun flag -> ((fun fam2 -> ((fun next -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueGo mc0) dtb__43) (mc2 + 1)) next) fam2) (Base_dList.C_Base_dList_dList_Cons (flag, mc5)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__50) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__46, mc2, Base_dList.C_Base_dList_dList_Nil))))))) (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue dtb__49) then (Base_dList.C_Base_dList_dList_Cons (mc2, mc4)) else mc4))) (if (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__45)) then (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped (fun l -> ((v_Vuna_dCompiler_dCodegen_dLower_dmemOpaqueLevel l) mc4))) (v_Vuna_dCompiler_dCodegen_dLower_disTypeHeadOpaqueDatas mc0)) mc2) mc4) dtb__49) else false))
  | _ -> (Base_dList.v_Base_dList_dreverse mc5)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc5)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueFlagsOf = (fun datas c -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueGo datas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dCodegen_dLower_dlocRowPair = (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__51) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (dtb__51).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartLine dtb__51) } }))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dtypeParamLevelsGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__52, dtb__53) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dPair.v_Base_dPair_dsecondOf dtb__52)) then (Base_dList.C_Base_dList_dList_Cons (mc1, ((v_Vuna_dCompiler_dCodegen_dLower_dtypeParamLevelsGo dtb__53) (mc1 + 1)))) else ((v_Vuna_dCompiler_dCodegen_dLower_dtypeParamLevelsGo dtb__53) (mc1 + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dtypeParamLevels = (fun d -> ((v_Vuna_dCompiler_dCodegen_dLower_dtypeParamLevelsGo (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams) 0))

let rec v_Vuna_dCompiler_dCodegen_dLower_dmemIntIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__54, dtb__55) -> (if (dtb__54 = mc0) then true else ((v_Vuna_dCompiler_dCodegen_dLower_dmemIntIn mc0) dtb__55))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dlevelSlotGoIn = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__56, dtb__57) -> (if (dtb__56 = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc2)) else (((v_Vuna_dCompiler_dCodegen_dLower_dlevelSlotGoIn dtb__57) mc1) (mc2 + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dlevelSlotIn = (fun levels lvl -> (((v_Vuna_dCompiler_dCodegen_dLower_dlevelSlotGoIn levels) lvl) 0))

let rec v_Vuna_dCompiler_dCodegen_dLower_dnthValueIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__58, dtb__59) -> (if (mc1 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__58)) else ((v_Vuna_dCompiler_dCodegen_dLower_dnthValueIn dtb__59) (mc1 - 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dlookupUsedIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__60, dtb__61) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__60) = mc1) then (Base_dPair.v_Base_dPair_dsecondOf dtb__60) else ((v_Vuna_dCompiler_dCodegen_dLower_dlookupUsedIn dtb__61) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedLevelsFuel = (fun fuel tps table datas lvl v -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__62, dtb__63, dtb__64, dtb__65, dtb__66) -> (if dtb__63 then ((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) (lvl + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__66) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__62, lvl, Base_dList.C_Base_dList_dList_Nil)))))) else ((Base_dList.v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) lvl) dtb__65)) ((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) (lvl + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__66) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__62, lvl, Base_dList.C_Base_dList_dList_Nil))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__67) -> (match dtb__67 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__68, dtb__69, dtb__70) -> ((Base_dList.v_Base_dList_dappend (if ((v_Vuna_dCompiler_dCodegen_dLower_dmemIntIn dtb__69) tps) then (Base_dList.C_Base_dList_dList_Cons (dtb__69, Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil)) ((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedSpineFuel (fuel - 1)) tps) table) datas) lvl) dtb__70))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__71, dtb__72) -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData dtb__71) datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__73) -> (((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) ((v_Vuna_dCompiler_dCodegen_dLower_dlookupUsedIn table) dtb__71)) dtb__72)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedSpineFuel (fuel - 1)) tps) table) datas) lvl) dtb__72)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)))
and v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedSpineFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__74, dtb__75) -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Nil else ((Base_dList.v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedLevelsFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__74)) ((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedSpineFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__75)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Nil else Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dLower_dcollectFamilyArgsFuel = (fun fuel tps table datas lvl usedPats args -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match usedPats with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__76, dtb__77) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dnthValueIn args) dtb__76) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__78) -> ((Base_dList.v_Base_dList_dappend ((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) lvl) dtb__78)) (((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) dtb__77) args))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) dtb__77) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedLevels = (fun tps table datas lvl v -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedLevelsFuel 256) tps) table) datas) lvl) v))

let v_Vuna_dCompiler_dCodegen_dLower_dcollectFamilyArgs = (fun tps table datas lvl usedPats args -> (((((((v_Vuna_dCompiler_dCodegen_dLower_dcollectFamilyArgsFuel 256) tps) table) datas) lvl) usedPats) args))

let rec v_Vuna_dCompiler_dCodegen_dLower_dctorUsedLevels = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__79, dtb__80) -> (match dtb__79 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__81; Base_dPair.f_Base_dPair_dPair_second = dtb__82 } -> (match mc6 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__83, dtb__84, dtb__85, dtb__86, dtb__87) -> ((fun isOpq -> ((fun fam2 -> ((fun next -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__82) then (((((((v_Vuna_dCompiler_dCodegen_dLower_dctorUsedLevels mc0) mc1) mc2) fam2) dtb__80) (mc5 + 1)) next) else (if isOpq then (((((((v_Vuna_dCompiler_dCodegen_dLower_dctorUsedLevels mc0) mc1) mc2) fam2) dtb__80) (mc5 + 1)) next) else ((Base_dList.v_Base_dList_dappend (((((v_Vuna_dCompiler_dCodegen_dLower_dcollectUsedLevels mc0) mc1) mc2) mc5) dtb__86)) (((((((v_Vuna_dCompiler_dCodegen_dLower_dctorUsedLevels mc0) mc1) mc2) fam2) dtb__80) (mc5 + 1)) next))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__87) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__83, mc5, Base_dList.C_Base_dList_dList_Nil))))))) (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue dtb__86) then (Base_dList.C_Base_dList_dList_Cons (mc5, mc3)) else mc3))) (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped (fun l -> ((v_Vuna_dCompiler_dCodegen_dLower_dmemOpaqueLevel l) mc3))) (v_Vuna_dCompiler_dCodegen_dLower_disTypeHeadOpaqueDatas mc2)) mc5) mc3) dtb__86))
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_ddataUsedLevels = (fun d table datas -> ((fun raw -> ((Base_dList.v_Base_dList_dfilter (fun l -> ((v_Vuna_dCompiler_dCodegen_dLower_dmemIntIn l) raw))) (v_Vuna_dCompiler_dCodegen_dLower_dtypeParamLevels d))) ((Base_dList.v_Base_dList_dconcatMap (fun c -> (((((((v_Vuna_dCompiler_dCodegen_dLower_dctorUsedLevels (v_Vuna_dCompiler_dCodegen_dLower_dtypeParamLevels d)) table) datas) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))

let rec v_Vuna_dCompiler_dCodegen_dLower_dlevelListEq = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__88, dtb__89) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__90, dtb__91) -> (if (dtb__88 = dtb__90) then ((v_Vuna_dCompiler_dCodegen_dLower_dlevelListEq dtb__89) dtb__91) else false)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dsameLevelTable = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__92, dtb__93) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__94, dtb__95) -> (if (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__92) = (Base_dPair.v_Base_dPair_dfirstOf dtb__94)) then ((v_Vuna_dCompiler_dCodegen_dLower_dlevelListEq (Base_dPair.v_Base_dPair_dsecondOf dtb__92)) (Base_dPair.v_Base_dPair_dsecondOf dtb__94)) else false) then ((v_Vuna_dCompiler_dCodegen_dLower_dsameLevelTable dtb__93) dtb__95) else false)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dusedTableFixFuel = (fun fuel datas table -> (if (fuel <= 0) then table else ((fun next -> (if ((v_Vuna_dCompiler_dCodegen_dLower_dsameLevelTable next) table) then next else (((v_Vuna_dCompiler_dCodegen_dLower_dusedTableFixFuel (fuel - 1)) datas) next))) ((Base_dList.v_Base_dList_dmap (fun d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dCodegen_dLower_ddataUsedLevels d) table) datas) })) datas))))

let v_Vuna_dCompiler_dCodegen_dLower_dusedTableFix = (fun datas table -> (((v_Vuna_dCompiler_dCodegen_dLower_dusedTableFixFuel 64) datas) table))

let v_Vuna_dCompiler_dCodegen_dLower_dtyParamsOf = (fun datas -> ((v_Vuna_dCompiler_dCodegen_dLower_dusedTableFix datas) ((Base_dList.v_Base_dList_dmap (fun d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil })) datas)))

let v_Vuna_dCompiler_dCodegen_dLower_drenderTyIntrinsic = (fun mc0 mc1 -> (if (mc0 = "Array") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__96, dtb__97) -> (match dtb__97 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (dtb__96))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "IORef") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__98, dtb__99) -> (match dtb__99 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef (dtb__98))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))

let rec v_Vuna_dCompiler_dCodegen_dLower_drenderTyFuel = (fun fuel levels table datas v -> (if (fuel <= 0) then Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__100) -> (match dtb__100 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__101, dtb__102, dtb__103) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dlevelSlotIn levels) dtb__102) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__104) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__104))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__105, dtb__106) -> ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderTyGlobal fuel) levels) table) datas) dtb__105) dtb__106)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque
)))
and v_Vuna_dCompiler_dCodegen_dLower_drenderTyGlobal = (fun fuel levels table datas g sp -> (match ((v_Vuna_dCompiler_dCodegen_dLower_drenderTyIntrinsic g) ((Base_dList.v_Base_dList_dmap (fun x -> (((((v_Vuna_dCompiler_dCodegen_dLower_drenderTyFuel (fuel - 1)) levels) table) datas) x))) sp)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__107) -> dtb__107
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName) then Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool else (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData g) datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__108) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (g, ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderFamilyArgs (fuel - 1)) levels) table) datas) ((v_Vuna_dCompiler_dCodegen_dLower_dlookupUsedIn table) g)) sp)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dLower_drenderFamilyArgs = (fun fuel levels table datas usedPats args -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Nil else (match usedPats with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__109, dtb__110) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dnthValueIn args) dtb__109) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__111) -> (Base_dList.C_Base_dList_dList_Cons ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderTyFuel (fuel - 1)) levels) table) datas) dtb__111), ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderFamilyArgs (fuel - 1)) levels) table) datas) dtb__110) args)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderFamilyArgs (fuel - 1)) levels) table) datas) dtb__110) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dLower_drenderTyOf = (fun levels table datas v -> (((((v_Vuna_dCompiler_dCodegen_dLower_drenderTyFuel 256) levels) table) datas) v))

let rec v_Vuna_dCompiler_dCodegen_dLower_drenderPiTyFuel = (fun fuel levels table datas lvl v -> (if (fuel <= 0) then (((((v_Vuna_dCompiler_dCodegen_dLower_drenderTyFuel fuel) levels) table) datas) v) else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__112, dtb__113, dtb__114, dtb__115, dtb__116) -> ((fun next -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__114) then ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderPiTyFuel (fuel - 1)) levels) table) datas) (lvl + 1)) next) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (((((((v_Vuna_dCompiler_dCodegen_dLower_drenderPiTyFuel (fuel - 1)) levels) table) datas) lvl) dtb__115), ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderPiTyFuel (fuel - 1)) levels) table) datas) (lvl + 1)) next))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__116) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__112, lvl, Base_dList.C_Base_dList_dList_Nil))))))
  | _ -> (((((v_Vuna_dCompiler_dCodegen_dLower_drenderTyFuel fuel) levels) table) datas) v)
)))

let v_Vuna_dCompiler_dCodegen_dLower_drenderPiTy = (fun levels table datas lvl v -> ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderPiTyFuel 256) levels) table) datas) lvl) v))

let v_Vuna_dCompiler_dCodegen_dLower_drenderFieldTy = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__117) -> (match dtb__117 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__118, dtb__119, dtb__120) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dlevelSlotIn mc0) dtb__119) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__121) -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__121)); Base_dPair.f_Base_dPair_dPair_second = mc5 }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (mc5)); Base_dPair.f_Base_dPair_dPair_second = (mc5 + 1) }
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__122, dtb__123) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_drenderTyIntrinsic dtb__122) ((Base_dList.v_Base_dList_dmap (fun x -> (((((v_Vuna_dCompiler_dCodegen_dLower_drenderTyFuel 256) mc0) mc1) mc2) x))) dtb__123)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__124) -> { Base_dPair.f_Base_dPair_dPair_first = dtb__124; Base_dPair.f_Base_dPair_dPair_second = mc5 }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (dtb__122 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then { Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt; Base_dPair.f_Base_dPair_dPair_second = mc5 } else (if (dtb__122 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then { Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt; Base_dPair.f_Base_dPair_dPair_second = mc5 } else (if (dtb__122 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then { Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr; Base_dPair.f_Base_dPair_dPair_second = mc5 } else (if (dtb__122 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName) then { Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat; Base_dPair.f_Base_dPair_dPair_second = mc5 } else (if (dtb__122 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then { Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool; Base_dPair.f_Base_dPair_dPair_second = mc5 } else (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData dtb__122) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__125) -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__122, ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderFamilyArgs 256) mc0) mc1) mc2) ((v_Vuna_dCompiler_dCodegen_dLower_dlookupUsedIn mc1) dtb__122)) dtb__123))); Base_dPair.f_Base_dPair_dPair_second = mc5 }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (mc5)); Base_dPair.f_Base_dPair_dPair_second = (mc5 + 1) }
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__126, dtb__127, dtb__128, dtb__129, dtb__130) -> (if dtb__127 then { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (mc5)); Base_dPair.f_Base_dPair_dPair_second = (mc5 + 1) } else { Base_dPair.f_Base_dPair_dPair_first = (((((v_Vuna_dCompiler_dCodegen_dLower_drenderPiTy mc0) mc1) mc2) mc3) mc4); Base_dPair.f_Base_dPair_dPair_second = mc5 })
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (mc5)); Base_dPair.f_Base_dPair_dPair_second = (mc5 + 1) }
))

let v_Vuna_dCompiler_dCodegen_dLower_dflagMatchesRigIn = (fun mc0 mc1 -> (if mc0 then (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased mc1)) else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased mc1)))

let rec v_Vuna_dCompiler_dCodegen_dLower_dctorFieldTys = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__131, dtb__132) -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__133, dtb__134) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__135, dtb__136) -> (match dtb__135 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__137; Base_dPair.f_Base_dPair_dPair_second = dtb__138 } -> (if ((v_Vuna_dCompiler_dCodegen_dLower_dflagMatchesRigIn dtb__131) dtb__138) then (match mc7 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__139, dtb__140, dtb__141, dtb__142, dtb__143) -> ((fun next -> (if dtb__131 then (if dtb__133 then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dCodegen_dLower_dctorFieldTys mc0) mc1) mc2) dtb__132) dtb__134) dtb__136) (mc6 + 1)) next) mc8)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__144; Base_dPair.f_Base_dPair_dPair_second = dtb__145 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque, dtb__144)); Base_dPair.f_Base_dPair_dPair_second = dtb__145 }))
  | _ -> failwith "DT: impossible branch"
))) else (match ((((((v_Vuna_dCompiler_dCodegen_dLower_drenderFieldTy mc0) mc1) mc2) mc6) dtb__142) mc8) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__146; Base_dPair.f_Base_dPair_dPair_second = dtb__147 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dCodegen_dLower_dctorFieldTys mc0) mc1) mc2) dtb__132) dtb__134) dtb__136) (mc6 + 1)) next) dtb__147)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__148; Base_dPair.f_Base_dPair_dPair_second = dtb__149 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__146, dtb__148)); Base_dPair.f_Base_dPair_dPair_second = dtb__149 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) else (((((((((v_Vuna_dCompiler_dCodegen_dLower_dctorFieldTys mc0) mc1) mc2) dtb__132) dtb__134) dtb__136) (mc6 + 1)) next) mc8))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__143) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__139, mc6, Base_dList.C_Base_dList_dList_Nil))))))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "constructor telescope does not match its type")
) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "constructor keep flag disagrees with telescope rig"))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc8 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__150, dtb__151) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "constructor opaque flags shorter than its shape")
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc8 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Nil -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__152, dtb__153) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "constructor shape has more binders than its telescope")
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc8 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Cons (dtb__154, dtb__155) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc8 }))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "constructor opaque flags longer than its shape")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dctorArityNeed = (fun levels table datas c -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dCodegen_dLower_dctorFieldTys levels) table) datas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c)) ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueFlagsOf datas) c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (v_Vuna_dCompiler_dCodegen_dLower_dlistLength levels))) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dPair.v_Base_dPair_dsecondOf p) - (v_Vuna_dCompiler_dCodegen_dLower_dlistLength levels)))))))

let rec v_Vuna_dCompiler_dCodegen_dLower_dmaxIntListIn = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__156, dtb__157) -> (if (dtb__156 >= (v_Vuna_dCompiler_dCodegen_dLower_dmaxIntListIn dtb__157)) then dtb__156 else (v_Vuna_dCompiler_dCodegen_dLower_dmaxIntListIn dtb__157))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_ddataArityNeed = (fun levels table datas ctors -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (((v_Vuna_dCompiler_dCodegen_dLower_dctorArityNeed levels) table) datas)) ctors)) (fun ns -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dCodegen_dLower_dlistLength levels) + (v_Vuna_dCompiler_dCodegen_dLower_dmaxIntListIn ns)))))))

let v_Vuna_dCompiler_dCodegen_dLower_drecordFieldsOf = (fun datas -> ((Base_dList.v_Base_dList_dmap (fun d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dCodegen_dLower_drecordRtFields d) })) ((Base_dList.v_Base_dList_dfilter v_Vuna_dCompiler_dCodegen_dLower_dhasRecordRepr) ((Base_dList.v_Base_dList_dfilter (fun d -> (Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dCodegen_dLower_dmemList (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet datas))))) datas))))

let v_Vuna_dCompiler_dCodegen_dLower_dtyDeclOf = (fun table allDatas unboxed d -> ((fun levels -> ((fun arity -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (v_Vuna_dCompiler_dCodegen_dLower_dhasRecordRepr d) then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__158, dtb__159) -> (match dtb__159 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dCodegen_dLower_dctorFieldTys levels) table) allDatas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags dtb__158)) ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueFlagsOf allDatas) dtb__158)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__158)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__158))) (v_Vuna_dCompiler_dCodegen_dLower_dlistLength levels))) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), arity, (v_Vuna_dCompiler_dCodegen_dLower_drecordRtFields d), (Base_dPair.v_Base_dPair_dfirstOf p)))))))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("record family must have exactly one constructor: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("record family must have exactly one constructor: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dLower_ddataArityNeed levels) table) allDatas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun fullArity -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (fun c -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dCodegen_dLower_dctorFieldTys levels) table) allDatas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c)) ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueFlagsOf allDatas) c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (v_Vuna_dCompiler_dCodegen_dLower_dlistLength levels))) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dfirstOf p) })))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun ctors -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), fullArity, ctors)))))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__160) -> (match dtb__160 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__161; Base_dPair.f_Base_dPair_dPair_second = dtb__162 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dCodegen_dLower_dctorFieldTys levels) table) allDatas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags dtb__161)) ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueFlagsOf allDatas) dtb__161)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__161)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__161))) (v_Vuna_dCompiler_dCodegen_dLower_dlistLength levels))) (fun p -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__163, dtb__164) -> (match dtb__164 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrUnboxedDecl ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), arity, dtb__163))))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("unboxed constructor does not have exactly one kept field: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__161)))
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("unboxed constructor does not have exactly one kept field: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__161)))
)) (Base_dPair.v_Base_dPair_dfirstOf p))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dlookupUnboxedInfo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) unboxed))) (v_Vuna_dCompiler_dCodegen_dLower_dlistLength levels))) ((v_Vuna_dCompiler_dCodegen_dLower_dlookupUsedIn table) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))))

let rec v_Vuna_dCompiler_dCodegen_dLower_dtyDeclsGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__165, dtb__166) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dLower_dtyDeclOf mc0) mc1) mc2) dtb__165)) (fun decl -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dLower_dtyDeclsGo mc0) mc1) mc2) dtb__166)) (fun tail -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (decl, tail))))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dtyDeclsOf = (fun allDatas subset -> ((((v_Vuna_dCompiler_dCodegen_dLower_dtyDeclsGo (v_Vuna_dCompiler_dCodegen_dLower_dtyParamsOf allDatas)) allDatas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedInfoOf allDatas)) subset))

let v_Vuna_dCompiler_dCodegen_dLower_dlowerBudgetFor = (fun size -> (512 + (8 * size)))

let rec v_Vuna_dCompiler_dCodegen_dLower_dbinderAtIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__167, dtb__168) -> (if (mc0 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__167)) else ((v_Vuna_dCompiler_dCodegen_dLower_dbinderAtIn (mc0 - 1)) dtb__168))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_drecordFieldNameAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__169, dtb__170) -> (match dtb__169 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__171; Base_dPair.f_Base_dPair_dPair_second = dtb__172 } -> (if (dtb__171 = mc0) then dtb__172 else ((v_Vuna_dCompiler_dCodegen_dLower_drecordFieldNameAt mc0) dtb__170))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_drecordTermAsAppIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__173, dtb__174) -> (match dtb__173 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__175; Base_dPair.f_Base_dPair_dPair_second = dtb__176 } -> ((v_Vuna_dCompiler_dCodegen_dLower_drecordTermAsAppIn (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (mc0, dtb__175, dtb__176))) dtb__174)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dlowerBridgeGuard = (fun env name ir -> (if (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtBridgesList name) then (if ((v_Vuna_dCompiler_dCodegen_dLower_dmemList Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistFamilyName) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDatas)) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (ir)) else ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_ListBridgeRequired (name))) name)) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (ir))))

let v_Vuna_dCompiler_dCodegen_dLower_deffUnitTyIn = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffUnitTypeName, Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dCodegen_dLower_dlowerGlobalRef = (fun env name -> (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (0)))) else (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtNatSucc)))) else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__177) -> (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dprimEffBind1Name) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffTypeName, Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffMkCtor, v_Vuna_dCompiler_dCodegen_dLower_deffUnitTyIn)))) else (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicReturnsEff dtb__177) then (((v_Vuna_dCompiler_dCodegen_dLower_dlowerBridgeGuard env) name) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffTypeName, Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffMkCtor, v_Vuna_dCompiler_dCodegen_dLower_deffUnitTyIn, (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicArity dtb__177), (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ((Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicName dtb__177)))))) else (((v_Vuna_dCompiler_dCodegen_dLower_dlowerBridgeGuard env) name) (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt ((Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicName dtb__177))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (name))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__178) -> (match dtb__178 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__179; Base_dPair.f_Base_dPair_dPair_second = dtb__180 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__179, name, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCodegen_dLower_dlookupList name) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors)))))

let rec v_Vuna_dCompiler_dCodegen_dLower_dcollectLamChainIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__181, dtb__182, dtb__183) -> (match (v_Vuna_dCompiler_dCodegen_dLower_dcollectLamChainIn dtb__183) with
  | { f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBinders = dtb__184; f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBody = dtb__185 } -> { f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBinders = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__181; Base_dPair.f_Base_dPair_dPair_second = dtb__182 }, dtb__184)); f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBody = dtb__185 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBinders = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBody = mc0 }
))

let v_Vuna_dCompiler_dCodegen_dLower_dbinderOfParam = (fun mc0 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__186; Base_dPair.f_Base_dPair_dPair_second = dtb__187 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__187) then Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased else (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinder dtb__186))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dconcatLeavesIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__188, dtb__189, dtb__190) -> (match dtb__188 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__191, dtb__192, dtb__193) -> (if (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__193) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__190)) then (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__191, dtb__192, dtb__193)), dtb__189, dtb__190)), Base_dList.C_Base_dList_dList_Nil)) else (match dtb__191 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__194) -> (if (dtb__194 = "++") then ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dLower_dconcatLeavesIn dtb__192)) (v_Vuna_dCompiler_dCodegen_dLower_dconcatLeavesIn dtb__189)) else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__191, dtb__192, dtb__193)), dtb__189, dtb__190)), Base_dList.C_Base_dList_dList_Nil)))
  | _ -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__191, dtb__192, dtb__193)), dtb__189, dtb__190)), Base_dList.C_Base_dList_dList_Nil))
))
  | _ -> (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil))
)
  | _ -> (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil))
))

let v_Vuna_dCompiler_dCodegen_dLower_dflattenConcatChainIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__195, dtb__196, dtb__197) -> (match dtb__195 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__198, dtb__199, dtb__200) -> (if (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__200) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__197)) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match dtb__198 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__201) -> (if (dtb__201 = "++") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dLower_dconcatLeavesIn dtb__199)) (v_Vuna_dCompiler_dCodegen_dLower_dconcatLeavesIn dtb__196)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dflattenIntrinsicAppIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__202, dtb__203, dtb__204) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__204) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match dtb__202 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__205) -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity dtb__205) > 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__205; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__203; Base_dPair.f_Base_dPair_dPair_second = dtb__204 }, Base_dList.C_Base_dList_dList_Nil)) })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__206) -> (match dtb__206 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__207; Base_dPair.f_Base_dPair_dPair_second = dtb__208 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__207; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__208) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__203; Base_dPair.f_Base_dPair_dPair_second = dtb__204 }, Base_dList.C_Base_dList_dList_Nil))) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dLower_dflattenIntrinsicAppIn dtb__202))
))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dCodegen_dLower_dinlineArityMatchesIn = (fun name args -> (if ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity name) <= 0) then false else ((v_Vuna_dCompiler_dCodegen_dLower_dlistLength args) = (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirInlineArity name))))

let rec v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__209, dtb__210) -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__211, dtb__212) -> (match dtb__211 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__213; Base_dPair.f_Base_dPair_dPair_second = dtb__214 } -> (if dtb__209 then (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__214) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["constructor "; mc0; ": runtime field marked erased"])) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs mc0) dtb__210) dtb__212)) (fun ts -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__213; Base_dPair.f_Base_dPair_dPair_second = dtb__214 }, ts))))))) else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__214) then (((v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs mc0) dtb__210) dtb__212) else (((v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs mc0) dtb__210) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__213; Base_dPair.f_Base_dPair_dPair_second = dtb__214 }, dtb__212)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if dtb__209 then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["constructor "; mc0; ": application has fewer arguments than its shape"])) else (((v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs mc0) dtb__210) Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__215, dtb__216) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["constructor "; mc0; ": application has more arguments than its shape"]))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dctorArgIr = (fun mc0 mc1 -> (if mc0 then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (mc1)) else mc1))

let rec v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueKeptFlags = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__217, dtb__218) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__219, dtb__220) -> (if dtb__217 then (Base_dList.C_Base_dList_dList_Cons (dtb__219, ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueKeptFlags dtb__218) dtb__220))) else ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueKeptFlags dtb__218) dtb__220))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dzipFieldNames = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__221, dtb__222) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__223, dtb__224) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dsecondOf dtb__221); Base_dPair.f_Base_dPair_dPair_second = dtb__223 }, ((v_Vuna_dCompiler_dCodegen_dLower_dzipFieldNames dtb__222) dtb__224)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dlowerConAppFinish = (fun env st family c irs -> (if ((v_Vuna_dCompiler_dCodegen_dLower_dmemList family) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnboxed) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__225, dtb__226) -> (match dtb__226 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__225; Base_dPair.f_Base_dPair_dPair_second = st }))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "unboxed constructor application does not have exactly one runtime argument")
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "unboxed constructor application does not have exactly one runtime argument")
)) irs) else (match ((v_Vuna_dCompiler_dCodegen_dLower_dlookupList family) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRecordFields) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__227) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (family, ((v_Vuna_dCompiler_dCodegen_dLower_dzipFieldNames dtb__227) irs))); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (family, c, irs)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dLower_daeEnvOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeEnv = dtb__228; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aePats = dtb__229; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeSt = dtb__230 } -> dtb__228
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_daePatsOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeEnv = dtb__231; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aePats = dtb__232; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeSt = dtb__233 } -> dtb__232
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_daeStOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeEnv = dtb__234; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aePats = dtb__235; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeSt = dtb__236 } -> dtb__236
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dcountKept = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__237, dtb__238) -> (if dtb__237 then (1 + (v_Vuna_dCompiler_dCodegen_dLower_dcountKept dtb__238)) else (v_Vuna_dCompiler_dCodegen_dLower_dcountKept dtb__238))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_daltEnvGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__239, dtb__240) -> (match dtb__239 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__241; Base_dPair.f_Base_dPair_dPair_second = dtb__242 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__242) then ((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvGo mc0) (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased, mc1))) dtb__240) mc3) else ((fun fresh -> ((fun b -> ((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvGo (fresh + 1)) (Base_dList.C_Base_dList_dList_Cons (b, mc1))) dtb__240) (Base_dList.C_Base_dList_dList_Cons (b, mc3)))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderArm fresh))) (let dtb__243 = mc0 in dtb__243)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeEnv = mc1; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aePats = (Base_dList.v_Base_dList_dreverse mc3); f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeSt = mc0 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_daltEnvIn = (fun st outer tele -> ((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvGo st) outer) tele) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dCodegen_dLower_daltEnvFullIn = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__244, dtb__245) -> (match dtb__244 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__246; Base_dPair.f_Base_dPair_dPair_second = dtb__247 } -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": case branch has more binders than its shape"]))
  | Base_dList.C_Base_dList_dList_Cons (dtb__248, dtb__249) -> (if ((v_Vuna_dCompiler_dCodegen_dLower_dflagMatchesRigIn dtb__248) dtb__247) then (if dtb__248 then ((fun fresh -> ((fun b -> ((((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvFullIn (fresh + 1)) mc1) (Base_dList.C_Base_dList_dList_Cons (b, mc2))) dtb__245) dtb__249) (Base_dList.C_Base_dList_dList_Cons (b, mc5)))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderArm fresh))) (let dtb__250 = mc0 in dtb__250)) else ((((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvFullIn mc0) mc1) (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased, mc2))) dtb__245) dtb__249) mc5)) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": case branch binder rig disagrees with its shape"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeEnv = mc2; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aePats = (Base_dList.v_Base_dList_dreverse mc5); f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeSt = mc0 }))
  | Base_dList.C_Base_dList_dList_Cons (dtb__251, dtb__252) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": case branch has fewer binders than its shape"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_daltEnvKeptIn = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__253, dtb__254) -> (match dtb__253 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__255; Base_dPair.f_Base_dPair_dPair_second = dtb__256 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__256) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["constructor "; mc1; ": kept-field branch has an erased binder"])) else ((fun fresh -> ((fun b -> (((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvKeptIn (fresh + 1)) mc1) (Base_dList.C_Base_dList_dList_Cons (b, mc2))) dtb__254) (Base_dList.C_Base_dList_dList_Cons (b, mc4)))) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderArm fresh))) (let dtb__257 = mc0 in dtb__257)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeEnv = mc2; f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aePats = (Base_dList.v_Base_dList_dreverse mc4); f_Vuna_dCompiler_dCodegen_dLower_dAltEnvIn_aeSt = mc0 }))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_daltEnvCheckedIn = (fun st label outer binders flags -> (if ((v_Vuna_dCompiler_dCodegen_dLower_dlistLength binders) = (v_Vuna_dCompiler_dCodegen_dLower_dlistLength flags)) then ((((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvFullIn st) label) outer) binders) flags) Base_dList.C_Base_dList_dList_Nil) else (if ((v_Vuna_dCompiler_dCodegen_dLower_dlistLength binders) = (v_Vuna_dCompiler_dCodegen_dLower_dcountKept flags)) then (((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvKeptIn st) label) outer) binders) Base_dList.C_Base_dList_dList_Nil) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr (String.concat "" ["DT: internal: constructor "; label; ": case branch binder count matches neither full telescope nor kept fields"])))))

let rec v_Vuna_dCompiler_dCodegen_dLower_dhasFallbackAlt = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__258, dtb__259) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__258) = "") then true else (v_Vuna_dCompiler_dCodegen_dLower_dhasFallbackAlt dtb__259))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dallCatchAll = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__260, dtb__261) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__260) = "") then (v_Vuna_dCompiler_dCodegen_dLower_dallCatchAll dtb__261) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dlowerUnboxedCaseAlt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__262, dtb__263) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__262) = "") then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun name -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__264) -> (match dtb__264 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__265; Base_dPair.f_Base_dPair_dPair_second = dtb__266 } -> (if ((v_Vuna_dCompiler_dCodegen_dLower_dmemList dtb__265) (mc0).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnboxed) then (if (v_Vuna_dCompiler_dCodegen_dLower_dallCatchAll dtb__263) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__262)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCodegen_dLower_dlookupList name) (mc0).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__262)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_disNatCtorName = (fun name -> (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then true else (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor)))

let rec v_Vuna_dCompiler_dCodegen_dLower_dnatCaseAllCtors = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__267, dtb__268) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__267) = "") then (v_Vuna_dCompiler_dCodegen_dLower_dnatCaseAllCtors dtb__268) else ((fun name -> (if (v_Vuna_dCompiler_dCodegen_dLower_disNatCtorName name) then (v_Vuna_dCompiler_dCodegen_dLower_dnatCaseAllCtors dtb__268) else false)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__267)))
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dnatCaseHasCtor = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__269, dtb__270) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__269) = "") then (v_Vuna_dCompiler_dCodegen_dLower_dnatCaseHasCtor dtb__270) else true)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dnatCaseApplies = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> (if (v_Vuna_dCompiler_dCodegen_dLower_dnatCaseAllCtors mc0) then (v_Vuna_dCompiler_dCodegen_dLower_dnatCaseHasCtor mc0) else false)
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dfindAltBy = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__271, dtb__272) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__271) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__271)) else ((v_Vuna_dCompiler_dCodegen_dLower_dfindAltBy mc0) dtb__272))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dfindCatchAllAlt = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__273, dtb__274) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__273) = "") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__273)) else (v_Vuna_dCompiler_dCodegen_dLower_dfindCatchAllAlt dtb__274))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_drecordProjVarIn = (fun i -> ("@vuna@record@proj" ^ (bi_strFromInt i)))

let rec v_Vuna_dCompiler_dCodegen_dLower_dprojBindersIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__275, dtb__276) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dCodegen_dLower_drecordProjVarIn mc1); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__275) }, ((v_Vuna_dCompiler_dCodegen_dLower_dprojBindersIn dtb__276) (mc1 + 1))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dlookupRtLabelIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__277, dtb__278) -> (match dtb__277 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__279; Base_dPair.f_Base_dPair_dPair_second = dtb__280 } -> (if (dtb__279 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__280)) else ((v_Vuna_dCompiler_dCodegen_dLower_dlookupRtLabelIn mc0) dtb__278))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dlookupRtPosIn = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__281, dtb__282) -> (match dtb__281 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__283; Base_dPair.f_Base_dPair_dPair_second = dtb__284 } -> (if (dtb__283 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc2)) else (((v_Vuna_dCompiler_dCodegen_dLower_dlookupRtPosIn mc0) dtb__282) (mc2 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dlookupRtPositionsIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__285, dtb__286) -> (match (((v_Vuna_dCompiler_dCodegen_dLower_dlookupRtPosIn dtb__285) mc0) 0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__287) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__285; Base_dPair.f_Base_dPair_dPair_second = dtb__287 }, ((v_Vuna_dCompiler_dCodegen_dLower_dlookupRtPositionsIn mc0) dtb__286)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dCodegen_dLower_dlookupRtPositionsIn mc0) dtb__286)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dnthOpqArgIn = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__288, dtb__289) -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__290, dtb__291) -> (match dtb__290 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__292; Base_dPair.f_Base_dPair_dPair_second = dtb__293 } -> (if (mc0 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__292)) else (((v_Vuna_dCompiler_dCodegen_dLower_dnthOpqArgIn (mc0 - 1)) dtb__289) dtb__291))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_deraseTele = (fun b -> Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased)

let v_Vuna_dCompiler_dCodegen_dLower_drecordAltBindersIn = (fun tele binders -> ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dLower_deraseTele) tele))) binders))

let rec v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel = (fun fuel env st binders t -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__294, dtb__295, dtb__296) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dbinderAtIn dtb__295) binders) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__297) -> (if (v_Vuna_dCompiler_dCodegen_dLower_dbinderErasedOf dtb__297) then ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_TypeLevelBindingRuntime (dtb__294))) dtb__294) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__297)); Base_dPair.f_Base_dPair_dPair_second = st })))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "unbound runtime variable")
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__298) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dLower_dlowerGlobalRef env) dtb__298)) (fun ir -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ir; Base_dPair.f_Base_dPair_dPair_second = st }))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__299) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__299)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__300) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__300)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__301) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__301)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__302) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__302)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__303, dtb__304, dtb__305) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) binders) dtb__303)) (fun pc -> (match pc with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__306; Base_dPair.f_Base_dPair_dPair_second = dtb__307 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) dtb__307) binders) dtb__304)) (fun pt -> (match pt with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__308; Base_dPair.f_Base_dPair_dPair_second = dtb__309 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) dtb__309) binders) dtb__305)) (fun pe -> (match pe with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__310; Base_dPair.f_Base_dPair_dPair_second = dtb__311 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__306, dtb__308, dtb__310)); Base_dPair.f_Base_dPair_dPair_second = dtb__311 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__312, dtb__313, dtb__314) -> (((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerLamFuel (fuel - 1)) env) st) binders) dtb__312) dtb__313) dtb__314)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__315, dtb__316, dtb__317) -> (((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerAppFuel (fuel - 1)) env) st) binders) dtb__315) dtb__316) dtb__317)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__318, dtb__319) -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerConAppFuel (fuel - 1)) env) st) binders) dtb__318) dtb__319)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__320, dtb__321) -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerConAppFuel (fuel - 1)) env) st) binders) dtb__320) dtb__321)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__322, dtb__323) -> (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) binders) ((v_Vuna_dCompiler_dCodegen_dLower_drecordTermAsAppIn (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__322))) dtb__323))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__324, dtb__325) -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerCaseFuel (fuel - 1)) env) st) binders) dtb__324) dtb__325)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__326, dtb__327, dtb__328, dtb__329, dtb__330) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dlookupList dtb__327) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRecordFields) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__331) -> ((((((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerRecordUpdateFuel (fuel - 1)) env) st) binders) dtb__326) dtb__327) dtb__328) dtb__331) dtb__329) dtb__330)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) binders) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__326, (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__327; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__328; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__330 }, Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__332, dtb__333, dtb__334, dtb__335, dtb__336) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dlookupList dtb__333) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRecordFields) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__337) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) binders) dtb__332)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__338; Base_dPair.f_Base_dPair_dPair_second = dtb__339 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__338, dtb__333, ((v_Vuna_dCompiler_dCodegen_dLower_drecordFieldNameAt dtb__336) dtb__337))); Base_dPair.f_Base_dPair_dPair_second = dtb__339 }))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerProjAsCaseFuel (fuel - 1)) env) st) binders) dtb__332) dtb__333) dtb__334) dtb__335) dtb__336)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__340, dtb__341, dtb__342, dtb__343, dtb__344) -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_TypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__345) -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_TypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__346) -> ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_UnsolvedMetavarRuntime ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__346)))) (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__346))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dLower_dlowerLamFuel = (fun fuel env st binders name rig body -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (match (v_Vuna_dCompiler_dCodegen_dLower_dcollectLamChainIn (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, body))) with
  | { f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBinders = dtb__347; f_Vuna_dCompiler_dCodegen_dLower_dLamChainIn_lamChainBody = dtb__348 } -> ((fun bs -> ((fun envB -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) envB) dtb__348)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__349; Base_dPair.f_Base_dPair_dPair_second = dtb__350 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (bs, dtb__349)); Base_dPair.f_Base_dPair_dPair_second = dtb__350 }))
  | _ -> failwith "DT: impossible branch"
)))) ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse bs)) binders))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dLower_dbinderOfParam) dtb__347))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dLower_dlowerAppFuel = (fun fuel env st binders f a rig -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased rig) then (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) binders) f) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerAppOptimizedFuel (fuel - 1)) env) st) binders) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (f, a, rig)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__351) -> (match dtb__351 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__352; Base_dPair.f_Base_dPair_dPair_second = dtb__353 } -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerConAppFuel (fuel - 1)) env) st) binders) dtb__352) dtb__353)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (f, a, rig)))))))
and v_Vuna_dCompiler_dCodegen_dLower_dlowerAppOptimizedFuel = (fun fuel env st binders t -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (match (v_Vuna_dCompiler_dCodegen_dLower_dflattenConcatChainIn t) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__354) -> (if ((v_Vuna_dCompiler_dCodegen_dLower_dlistLength dtb__354) >= 3) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermsFuel (fuel - 1)) env) st) binders) dtb__354)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__355; Base_dPair.f_Base_dPair_dPair_second = dtb__356 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__355)); Base_dPair.f_Base_dPair_dPair_second = dtb__356 }))
  | _ -> failwith "DT: impossible branch"
))) else (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerPlainAppFuel (fuel - 1)) env) st) binders) t))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerPlainAppFuel (fuel - 1)) env) st) binders) t)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dLower_dlowerPlainAppFuel = (fun fuel env st binders t -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__357, dtb__358, dtb__359) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerAppFallbackFuel (fuel - 1)) env) st) binders) dtb__357) dtb__358) dtb__359)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__360) -> (match dtb__360 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__361; Base_dPair.f_Base_dPair_dPair_second = dtb__362 } -> (if ((v_Vuna_dCompiler_dCodegen_dLower_dinlineArityMatchesIn dtb__361) dtb__362) then ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerInlineAppFuel (fuel - 1)) env) st) binders) dtb__361) dtb__362) else (((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerAppFallbackFuel (fuel - 1)) env) st) binders) dtb__357) dtb__358) dtb__359))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dLower_dflattenIntrinsicAppIn t))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "lowerPlainApp expects an application")
)))
and v_Vuna_dCompiler_dCodegen_dLower_dlowerAppFallbackFuel = (fun fuel env st binders f a rig -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) binders) f)) (fun pf -> (match pf with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__363; Base_dPair.f_Base_dPair_dPair_second = dtb__364 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) dtb__364) binders) a)) (fun pa -> (match pa with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__365; Base_dPair.f_Base_dPair_dPair_second = dtb__366 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__363, dtb__365)); Base_dPair.f_Base_dPair_dPair_second = dtb__366 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dLower_dlowerInlineAppFuel = (fun fuel env st binders name args -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerInlineArgsFuel (fuel - 1)) env) st) binders) args)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__367; Base_dPair.f_Base_dPair_dPair_second = dtb__368 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (name, dtb__367)); Base_dPair.f_Base_dPair_dPair_second = dtb__368 }))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dLower_dlowerInlineArgsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__369, dtb__370) -> (match dtb__369 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__371; Base_dPair.f_Base_dPair_dPair_second = dtb__372 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__372) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "erased argument in inlined builtin application") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__371)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__373; Base_dPair.f_Base_dPair_dPair_second = dtb__374 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerInlineArgsFuel (mc0 - 1)) mc1) dtb__374) mc3) dtb__370)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__375; Base_dPair.f_Base_dPair_dPair_second = dtb__376 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__373, dtb__375)); Base_dPair.f_Base_dPair_dPair_second = dtb__376 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dLower_dlowerTermsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__377, dtb__378) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__377)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__379; Base_dPair.f_Base_dPair_dPair_second = dtb__380 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermsFuel (mc0 - 1)) mc1) dtb__380) mc3) dtb__378)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__381; Base_dPair.f_Base_dPair_dPair_second = dtb__382 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__379, dtb__381)); Base_dPair.f_Base_dPair_dPair_second = dtb__382 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dLower_dlowerConArgsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__383, dtb__384) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__385, dtb__386) -> (match dtb__385 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__387; Base_dPair.f_Base_dPair_dPair_second = dtb__388 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__387)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__389; Base_dPair.f_Base_dPair_dPair_second = dtb__390 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerConArgsFuel (mc0 - 1)) mc1) dtb__390) mc3) dtb__384) dtb__386)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__391; Base_dPair.f_Base_dPair_dPair_second = dtb__392 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dCodegen_dLower_dctorArgIr dtb__383) dtb__389), dtb__391)); Base_dPair.f_Base_dPair_dPair_second = dtb__392 }))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__393, dtb__394) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "constructor opaque flags shorter than runtime arguments")
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dLower_dlowerConAppFuel = (fun fuel env st binders c args -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dnatChainValue (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (c, args))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__395) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__395)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerConAppNonChainFuel (fuel - 1)) env) st) binders) c) args)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dLower_dlowerConAppNonChainFuel = (fun fuel env st binders c args -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (if (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then (match (((v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs c) Base_dList.C_Base_dList_dList_Nil) args) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__396) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__396))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__397) -> (match dtb__397 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (0)); Base_dPair.f_Base_dPair_dPair_second = st }))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "Nat Zero applied to arguments")
)
  | _ -> failwith "DT: impossible branch"
) else (if (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then (match (((v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs c) (Base_dList.C_Base_dList_dList_Cons (true, Base_dList.C_Base_dList_dList_Nil))) args) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__398) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__398))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__399) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerConArgsFuel (fuel - 1)) env) st) binders) (Base_dList.C_Base_dList_dList_Cons (false, Base_dList.C_Base_dList_dList_Nil))) dtb__399)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__400; Base_dPair.f_Base_dPair_dPair_second = dtb__401 } -> (match dtb__400 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__402, dtb__403) -> (match dtb__403 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtNatSucc)), dtb__402)); Base_dPair.f_Base_dPair_dPair_second = dtb__401 }))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "Nat Succ must have exactly one runtime argument")
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "Nat Succ must have exactly one runtime argument")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__404) -> (match dtb__404 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__405; Base_dPair.f_Base_dPair_dPair_second = dtb__406 } -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dlookupList c) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwOpaques) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("no opaque shape for constructor " ^ c))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__407) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs c) dtb__406) args)) (fun runtimeArgs -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerConArgsFuel (fuel - 1)) env) st) binders) ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueKeptFlags dtb__406) dtb__407)) runtimeArgs)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__408; Base_dPair.f_Base_dPair_dPair_second = dtb__409 } -> (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerConAppFinish env) dtb__409) dtb__405) c) dtb__408)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("unknown constructor " ^ c))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCodegen_dLower_dlookupList c) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors))))))
and v_Vuna_dCompiler_dCodegen_dLower_dlowerArmBodyFuel = (fun fuel env bound body -> (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel fuel) env) (v_Vuna_dCompiler_dCodegen_dLower_daeStOf bound)) (v_Vuna_dCompiler_dCodegen_dLower_daeEnvOf bound)) body))
and v_Vuna_dCompiler_dCodegen_dLower_dlowerUnboxedCaseFuel = (fun fuel env st outer scrut alt -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt) = "") then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "unboxed case arm has no constructor") else ((fun name -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__410) -> (match dtb__410 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__411; Base_dPair.f_Base_dPair_dPair_second = dtb__412 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__413; Base_dPair.f_Base_dPair_dPair_second = dtb__414 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvCheckedIn dtb__414) name) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)) dtb__412)) (fun bound -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dLower_dlowerArmBodyFuel (fuel - 1)) env) bound) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__415; Base_dPair.f_Base_dPair_dPair_second = dtb__416 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet ((v_Vuna_dCompiler_dCodegen_dLower_daePatsOf bound), dtb__413, dtb__415)); Base_dPair.f_Base_dPair_dPair_second = dtb__416 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("no shape for constructor " ^ name))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCodegen_dLower_dlookupList name) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)))))
and v_Vuna_dCompiler_dCodegen_dLower_dlowerArmFuel = (fun fuel env st outer alt -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt) = "") then ((fun bound -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dLower_dlowerArmBodyFuel (fuel - 1)) env) bound) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__417; Base_dPair.f_Base_dPair_dPair_second = dtb__418 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (v_Vuna_dCompiler_dCodegen_dLower_daePatsOf bound); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__417 }; Base_dPair.f_Base_dPair_dPair_second = dtb__418 }))
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dCodegen_dLower_daltEnvIn st) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt))) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__419) -> (match dtb__419 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__420; Base_dPair.f_Base_dPair_dPair_second = dtb__421 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_daltEnvCheckedIn st) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)) dtb__421)) (fun bound -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dLower_dlowerArmBodyFuel (fuel - 1)) env) bound) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__422; Base_dPair.f_Base_dPair_dPair_second = dtb__423 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__420; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt) })); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (v_Vuna_dCompiler_dCodegen_dLower_daePatsOf bound); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__422 }; Base_dPair.f_Base_dPair_dPair_second = dtb__423 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("unknown constructor " ^ (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCodegen_dLower_dlookupList (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors)))))
and v_Vuna_dCompiler_dCodegen_dLower_dlowerArmsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__424, dtb__425) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerArmFuel (mc0 - 1)) mc1) mc2) mc3) dtb__424)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__426; Base_dPair.f_Base_dPair_dPair_second = dtb__427 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerArmsFuel (mc0 - 1)) mc1) dtb__427) mc3) dtb__425)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__428; Base_dPair.f_Base_dPair_dPair_second = dtb__429 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__426, dtb__428)); Base_dPair.f_Base_dPair_dPair_second = dtb__429 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 })))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dLower_dlowerNatAltFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__430) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((fun bound -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dLower_dlowerArmBodyFuel (mc0 - 1)) mc1) bound) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__430))) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__431; Base_dPair.f_Base_dPair_dPair_second = dtb__432 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltCtor = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBinders = (v_Vuna_dCompiler_dCodegen_dLower_daePatsOf bound); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrAlt_irAltBody = dtb__431 })); Base_dPair.f_Base_dPair_dPair_second = dtb__432 }))
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dCodegen_dLower_daltEnvIn mc2) mc3) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__430))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Base_dPair.f_Base_dPair_dPair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dLower_dlowerNatCaseFuel = (fun fuel env st outer scrut alts -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__433; Base_dPair.f_Base_dPair_dPair_second = dtb__434 } -> ((fun fresh -> ((fun st2 -> ((fun zeroAlt -> ((fun succAlt -> ((fun catchAlt -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerNatAltFuel (fuel - 1)) env) st2) outer) zeroAlt)) (fun pz -> (match pz with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__435; Base_dPair.f_Base_dPair_dPair_second = dtb__436 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerNatAltFuel (fuel - 1)) env) dtb__436) outer) succAlt)) (fun ps -> (match ps with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__437; Base_dPair.f_Base_dPair_dPair_second = dtb__438 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerNatAltFuel (fuel - 1)) env) dtb__438) outer) catchAlt)) (fun pc -> (match pc with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__439; Base_dPair.f_Base_dPair_dPair_second = dtb__440 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__433, fresh, dtb__435, dtb__437, dtb__439)); Base_dPair.f_Base_dPair_dPair_second = dtb__440 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dCodegen_dLower_dfindCatchAllAlt alts))) ((v_Vuna_dCompiler_dCodegen_dLower_dfindAltBy Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) alts))) ((v_Vuna_dCompiler_dCodegen_dLower_dfindAltBy Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) alts))) (fresh + 1))) (let dtb__441 = dtb__434 in dtb__441))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dLower_dlowerCaseFuel = (fun fuel env st outer scrut alts -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (if (v_Vuna_dCompiler_dCodegen_dLower_dnatCaseApplies alts) then ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerNatCaseFuel (fuel - 1)) env) st) outer) scrut) alts) else (match ((v_Vuna_dCompiler_dCodegen_dLower_dlowerUnboxedCaseAlt env) alts) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__442) -> ((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerUnboxedCaseFuel (fuel - 1)) env) st) outer) scrut) dtb__442)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) outer) scrut)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__443; Base_dPair.f_Base_dPair_dPair_second = dtb__444 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerArmsFuel (fuel - 1)) env) dtb__444) outer) alts)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__445; Base_dPair.f_Base_dPair_dPair_second = dtb__446 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__443, dtb__445)); Base_dPair.f_Base_dPair_dPair_second = dtb__446 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCodegen_dLower_dlowerProjAsCaseFuel = (fun fuel env st outer base c tele i fi -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((fun n -> (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) outer) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (base, (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = c; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = ((v_Vuna_dCompiler_dCodegen_dLower_dprojBindersIn tele) 0); Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar ((v_Vuna_dCompiler_dCodegen_dLower_drecordProjVarIn fi), ((n - 1) - fi), { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })) }, Base_dList.C_Base_dList_dList_Nil)))))) (v_Vuna_dCompiler_dCodegen_dLower_dlistLength tele))))
and v_Vuna_dCompiler_dCodegen_dLower_dlowerRecordUpdateFuel = (fun fuel env st outer base c tele fields idxs body -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (fuel - 1)) env) st) outer) base)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__447; Base_dPair.f_Base_dPair_dPair_second = dtb__448 } -> (match body with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__449, dtb__450) -> (((((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerRecordUpdateArgsFuel (fuel - 1)) env) dtb__448) ((v_Vuna_dCompiler_dCodegen_dLower_drecordAltBindersIn tele) outer)) dtb__447) c) fields) idxs) dtb__450)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__451, dtb__452) -> (((((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerRecordUpdateArgsFuel (fuel - 1)) env) dtb__448) ((v_Vuna_dCompiler_dCodegen_dLower_drecordAltBindersIn tele) outer)) dtb__447) c) fields) idxs) dtb__452)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "record update body is not a constructor application")
)
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dLower_dlowerRecordUpdateArgsFuel = (fun fuel env st binders baseIr c fields idxs args -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__453) -> (match dtb__453 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__454; Base_dPair.f_Base_dPair_dPair_second = dtb__455 } -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dlookupList c) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwOpaques) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("no opaque shape for constructor " ^ c))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__456) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dalignCtorArgs c) dtb__455) args)) (fun runtimeArgs -> ((fun positions -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerUpdFieldsFuel (fuel - 1)) env) st) binders) fields) ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueKeptFlags dtb__455) dtb__456)) positions) runtimeArgs)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__457; Base_dPair.f_Base_dPair_dPair_second = dtb__458 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (baseIr, c, dtb__457)); Base_dPair.f_Base_dPair_dPair_second = dtb__458 }))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dCodegen_dLower_dlookupRtPositionsIn fields) idxs))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("no shape for constructor " ^ c))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCodegen_dLower_dlookupList c) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors))))
and v_Vuna_dCompiler_dCodegen_dLower_dlowerUpdFieldsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__459, dtb__460) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "ir-lower") else (match (((v_Vuna_dCompiler_dCodegen_dLower_dnthOpqArgIn (Base_dPair.v_Base_dPair_dsecondOf dtb__459)) mc5) mc7) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "record update position out of range")
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__461) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (mc0 - 1)) mc1) mc2) mc3) dtb__461)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__462; Base_dPair.f_Base_dPair_dPair_second = dtb__463 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dCodegen_dLower_dlowerUpdFieldsFuel (mc0 - 1)) mc1) dtb__463) mc3) mc4) mc5) dtb__460) mc7)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__464; Base_dPair.f_Base_dPair_dPair_second = dtb__465 } -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dlookupRtLabelIn (Base_dPair.v_Base_dPair_dfirstOf dtb__459)) mc4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__466) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__466; Base_dPair.f_Base_dPair_dPair_second = dtb__462 }, dtb__464)); Base_dPair.f_Base_dPair_dPair_second = dtb__465 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__464; Base_dPair.f_Base_dPair_dPair_second = dtb__465 }))
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

let v_Vuna_dCompiler_dCodegen_dLower_dlowerTerm = (fun env st binders t -> (((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTermFuel (v_Vuna_dCompiler_dCodegen_dLower_dlowerBudgetFor (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermSize t))) env) st) binders) t))

let rec v_Vuna_dCompiler_dCodegen_dLower_druntimeArityIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__467, dtb__468, dtb__469) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__468) then (v_Vuna_dCompiler_dCodegen_dLower_druntimeArityIn dtb__469) else (1 + (v_Vuna_dCompiler_dCodegen_dLower_druntimeArityIn dtb__469)))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dCodegen_dLower_drecursiveValueAllowedIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__470, dtb__471) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__472, dtb__473, dtb__474) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__473) then (v_Vuna_dCompiler_dCodegen_dLower_drecursiveValueAllowedIn dtb__474) else true)
  | _ -> false
))

let v_Vuna_dCompiler_dCodegen_dLower_dinitGuardOf = (fun mc0 mc1 mc2 mc3 -> (if mc1 then false else (if (if (if ((mc0).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnit = "Main") then (mc2 = "main") else false) then ((v_Vuna_dCompiler_dCodegen_dLower_druntimeArityIn mc3) = 0) else false) then true else false)))

let v_Vuna_dCompiler_dCodegen_dLower_ddepsOfBody = (fun env body -> (((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRuntimeNames) Base_dList.C_Base_dList_dList_Nil) body))

let v_Vuna_dCompiler_dCodegen_dLower_dexternBasicIr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__475) -> (match dtb__475 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__476, dtb__477) -> (if (dtb__476 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt)) else (if (dtb__476 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr)) else (if (dtb__476 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool)) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("extern type is not basic: " ^ dtb__476)))))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "extern type is not a global type")
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "extern type is not basic")
))

let v_Vuna_dCompiler_dCodegen_dLower_dexternDomIr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__478) -> (match dtb__478 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__479, dtb__480) -> (if (dtb__479 = "Array") then (match dtb__480 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__481, dtb__482) -> (match dtb__482 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dCodegen_dLower_dexternBasicIr dtb__481)) (fun e -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (e))))))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "extern Array needs one type argument")
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "extern Array needs one type argument")
) else (if (dtb__479 = "Array") then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "extern Array needs one type argument") else (v_Vuna_dCompiler_dCodegen_dLower_dexternBasicIr mc0)))
  | _ -> (v_Vuna_dCompiler_dCodegen_dLower_dexternBasicIr mc0)
)
  | _ -> (v_Vuna_dCompiler_dCodegen_dLower_dexternBasicIr mc0)
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dexternTyIr = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__483, dtb__484, dtb__485, dtb__486, dtb__487) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "extern type is too deep") else (if dtb__484 then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "extern has an implicit parameter") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dCodegen_dLower_dexternDomIr dtb__486)) (fun domIr -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dexternTyIr (mc0 - 1)) (mc1 + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__487) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__483, mc1, Base_dList.C_Base_dList_dList_Nil))))))) (fun resIr -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (domIr, resIr))))))))))
  | _ -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "extern type is too deep") else (v_Vuna_dCompiler_dCodegen_dLower_dexternDomIr mc2))
))

let v_Vuna_dCompiler_dCodegen_dLower_dlowerExternTy = (fun ty -> (((v_Vuna_dCompiler_dCodegen_dLower_dexternTyIr 64) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) ty)))

let v_Vuna_dCompiler_dCodegen_dLower_dlowerDef = (fun env st d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__488) -> (match (v_Vuna_dCompiler_dCodegen_dLower_dlowerExternTy (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__489) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC ((((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) dtb__489)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__490) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrExternDef ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), dtb__490, dtb__488, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d))); Base_dPair.f_Base_dPair_dPair_second = st }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__491) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__492) -> (match dtb__492 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__493; Base_dPair.f_Base_dPair_dPair_second = dtb__494 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrDef_IrDef ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (v_Vuna_dCompiler_dCodegen_dLower_druntimeArityIn dtb__491), ((v_Vuna_dCompiler_dCodegen_dLower_ddepsOfBody env) dtb__491), dtb__493, (v_Vuna_dCompiler_dCodegen_dLower_drecursiveValueAllowedIn dtb__491), ((((v_Vuna_dCompiler_dCodegen_dLower_dinitGuardOf env) false) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) dtb__491), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d))); Base_dPair.f_Base_dPair_dPair_second = dtb__494 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__495) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC ((((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) dtb__495)))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dCodegen_dLower_dlowerTerm env) st) Base_dList.C_Base_dList_dList_Nil) dtb__491))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC ((((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithContext (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) (((((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagNoLoc Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevError) Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhInternal) Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatInternal) "IC_AxiomRuntime") "axiom reached runtime code generation (partition must erase it)"))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dlowerDefs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__496, dtb__497) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dlowerDef mc0) mc1) dtb__496)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__498; Base_dPair.f_Base_dPair_dPair_second = dtb__499 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dlowerDefs mc0) dtb__499) dtb__497)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__500; Base_dPair.f_Base_dPair_dPair_second = dtb__501 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__498, dtb__500)); Base_dPair.f_Base_dPair_dPair_second = dtb__501 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dfindFamilyCtor = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__502, dtb__503) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__502) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__502)) else ((v_Vuna_dCompiler_dCodegen_dLower_dfindFamilyCtor dtb__503) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dfindListFamilyData = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__504, dtb__505) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__504) = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistFamilyName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__504)) else (v_Vuna_dCompiler_dCodegen_dLower_dfindListFamilyData dtb__505))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dlistFamOf = (fun datas -> (match (v_Vuna_dCompiler_dCodegen_dLower_dfindListFamilyData datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__506) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dfindFamilyCtor (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__506)) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistNilCtor) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__507) -> (match ((v_Vuna_dCompiler_dCodegen_dLower_dfindFamilyCtor (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__506)) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistConsCtor) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__508) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListFamily = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__506); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListNil = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__507); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListCons = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__508) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dctorTableOf = (fun datas -> ((Base_dList.v_Base_dList_dconcatMap (fun d -> ((Base_dList.v_Base_dList_dmap (fun c -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c) } })) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))) datas))

let v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueTableOf = (fun datas -> ((Base_dList.v_Base_dList_dconcatMap (fun d -> ((Base_dList.v_Base_dList_dmap (fun c -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueFlagsOf datas) c) })) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))) datas))

let rec v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesFloat = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__509, dtb__510) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__509) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesFloat dtb__510)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__511) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatIntrinsicNames) dtb__511) then true else (v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesFloat dtb__510))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesTrace = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__512, dtb__513) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__512) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesTrace dtb__513)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__514) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dtraceIntrinsicNames) dtb__514) then true else (v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesTrace dtb__513))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dlowerSharedOf = (fun datas defs -> ((fun runtime -> ((fun table -> ((fun locRows -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedRecordFields = (v_Vuna_dCompiler_dCodegen_dLower_drecordFieldsOf runtime); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedListFam = (v_Vuna_dCompiler_dCodegen_dLower_dlistFamOf runtime); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesFloat = (v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesFloat defs); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesTrace = (v_Vuna_dCompiler_dCodegen_dLower_danyDefUsesTrace defs); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtors = (v_Vuna_dCompiler_dCodegen_dLower_dctorTableOf runtime); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtorOpaques = (v_Vuna_dCompiler_dCodegen_dLower_dctorOpaqueTableOf runtime); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUnboxed = (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet runtime); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedTyParams = table; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedDefLocs = locRows }) ((v_Vuna_dCompiler_dCodegen_dLower_dmapSome v_Vuna_dCompiler_dCodegen_dLower_dlocRowPair) defs))) (v_Vuna_dCompiler_dCodegen_dLower_dtyParamsOf runtime))) (v_Vuna_dCompiler_dCodegen_dLower_drtDatasOf datas)))

let rec v_Vuna_dCompiler_dCodegen_dLower_dcheckNoDupOcamlNamesGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__515, dtb__516) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__515) mc2) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["OCaml name collision among "; mc0; "s: `"; dtb__515; "`"])) else (((v_Vuna_dCompiler_dCodegen_dLower_dcheckNoDupOcamlNamesGo mc0) dtb__516) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__515) true) mc2)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dcheckNoDupOcamlNames = (fun kind names -> (((v_Vuna_dCompiler_dCodegen_dLower_dcheckNoDupOcamlNamesGo kind) names) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dCodegen_dLower_densureUniqueOcamlNamesIn = (fun datas defs -> ((fun runtime -> ((fun unboxed -> ((fun valueNames -> ((fun typeNames -> ((fun ctorNames -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dLower_dcheckNoDupOcamlNames "value") valueNames)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dLower_dcheckNoDupOcamlNames "type") typeNames)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dLower_dcheckNoDupOcamlNames "constructor") ctorNames)))))) ((Base_dList.v_Base_dList_dconcatMap (fun d -> (if ((v_Vuna_dCompiler_dCodegen_dLower_dmemList (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) unboxed) then Base_dList.C_Base_dList_dList_Nil else ((Base_dList.v_Base_dList_dmap (fun c -> ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))) runtime))) ((Base_dList.v_Base_dList_dmap (fun d -> (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dtypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))) runtime))) ((Base_dList.v_Base_dList_dmap (fun d -> (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)))) defs))) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet runtime))) (v_Vuna_dCompiler_dCodegen_dLower_drtDatasOf datas)))

let v_Vuna_dCompiler_dCodegen_dLower_dprepareProgram = (fun datas defs -> ((fun table -> ((fun familyNames -> ((fun axiomNames -> (match ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefs table) defs) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__517; Base_dPair.f_Base_dPair_dPair_second = dtb__518 } -> ((fun runtimeNames -> ((fun familyTypeNames -> ((fun allTypeNames -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntime axiomNames) dtb__517)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes defs)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dLower_densureUniqueOcamlNamesIn datas) dtb__517)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dcheckAllErasure allTypeNames) dtb__517)) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__517))))))))))) ((Base_dList.v_Base_dList_dappend dtb__518) familyTypeNames))) ((Base_dList.v_Base_dList_dfilter (fun n -> (Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dCodegen_dLower_dmemList n) runtimeNames)))) familyNames))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) dtb__517))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_daxiomNamesOf defs))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas))) (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_ddefTable defs)))

let v_Vuna_dCompiler_dCodegen_dLower_drecOkOfIn = (fun defs name -> (match ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef name) defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__519) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__519) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__520) -> (v_Vuna_dCompiler_dCodegen_dLower_drecursiveValueAllowedIn dtb__520)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dspanOfIn = (fun defs name -> (match ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef name) defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__521) -> (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__521)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dappendGroups = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__522, dtb__523) -> ((fun isRec -> ((fun members -> ((fun defs -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dlowerDefs mc0) mc1) defs)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__524; Base_dPair.f_Base_dPair_dPair_second = dtb__525 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dIr_dAnalysis.v_Vuna_dCompiler_dIr_dAnalysis_dcheckUniqueDefNames dtb__524)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dappendGroups mc0) dtb__525) dtb__523)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__526; Base_dPair.f_Base_dPair_dPair_second = dtb__527 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = isRec; Base_dPair.f_Base_dPair_dPair_second = dtb__524 }, dtb__526)); Base_dPair.f_Base_dPair_dPair_second = dtb__527 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))) ((Base_dList.v_Base_dList_dfilter (fun d -> ((v_Vuna_dCompiler_dCodegen_dLower_dmemList (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) members))) (mc0).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefs))) (Base_dPair.v_Base_dPair_dsecondOf dtb__522))) (Base_dPair.v_Base_dPair_dfirstOf dtb__522))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dfirstOfList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__528, dtb__529) -> dtb__528
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dcheckRuntimeContract = ((fun intrinsicNames -> ((fun contractNames -> ((fun missingFromContract -> ((fun extrasInContract -> (if ((v_Vuna_dCompiler_dCodegen_dLower_dlistLength missingFromContract) > 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["runtime contract misses intrinsic `"; (v_Vuna_dCompiler_dCodegen_dLower_dfirstOfList missingFromContract); "`"])) else (if ((v_Vuna_dCompiler_dCodegen_dLower_dlistLength extrasInContract) > 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["runtime contract declares unknown symbol `"; (v_Vuna_dCompiler_dCodegen_dLower_dfirstOfList extrasInContract); "`"])) else (if ((v_Vuna_dCompiler_dCodegen_dLower_dlistLength Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextGaps) > 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["OCaml runtime table misses contract symbol `"; (v_Vuna_dCompiler_dCodegen_dLower_dfirstOfList Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextGaps); "`"])) else (if ((v_Vuna_dCompiler_dCodegen_dLower_dlistLength Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextExtras) > 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["OCaml runtime table has symbol outside the contract: `"; (v_Vuna_dCompiler_dCodegen_dLower_dfirstOfList Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_drtTextExtras); "`"])) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))))))) ((Base_dList.v_Base_dList_dfilter (fun n -> (if ((Base_dList.v_Base_dList_dmemName n) intrinsicNames) then false else (if ((Base_dList.v_Base_dList_dmemName n) Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtSyntheticNames) then false else true)))) contractNames))) ((Base_dList.v_Base_dList_dfilter (fun n -> (if (n = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dprimEffBind1Name) then false else (if ((Base_dList.v_Base_dList_dmemName n) contractNames) then false else true)))) intrinsicNames))) Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtNames)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dallIntrinsics))

let v_Vuna_dCompiler_dCodegen_dLower_dcheckProgramOf = (fun env -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dLower_dprepareProgram (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDatas) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefs)) (fun _u -> v_Vuna_dCompiler_dCodegen_dLower_dcheckRuntimeContract)))

let v_Vuna_dCompiler_dCodegen_dLower_dtyDeclTys = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrUnboxedDecl (dtb__530, dtb__531, dtb__532) -> (Base_dList.C_Base_dList_dList_Cons (dtb__532, Base_dList.C_Base_dList_dList_Nil))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl (dtb__533, dtb__534, dtb__535, dtb__536) -> dtb__536
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl (dtb__537, dtb__538, dtb__539) -> ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) dtb__539)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dfoldlTyNames = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__540, dtb__541) -> ((v_Vuna_dCompiler_dCodegen_dLower_dfoldlTyNames dtb__541) ((v_Vuna_dCompiler_dCodegen_dLower_dtyNamesInto dtb__540) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dLower_dtyNamesInto = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__542, dtb__543) -> ((v_Vuna_dCompiler_dCodegen_dLower_dfoldlTyNames dtb__543) ((v_Vuna_dCompiler_dCodegen_dLower_dpushDep dtb__542) mc1))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__544, dtb__545) -> ((v_Vuna_dCompiler_dCodegen_dLower_dtyNamesInto dtb__545) ((v_Vuna_dCompiler_dCodegen_dLower_dtyNamesInto dtb__544) mc1))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef (dtb__546) -> ((v_Vuna_dCompiler_dCodegen_dLower_dtyNamesInto dtb__546) mc1)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (dtb__547) -> ((v_Vuna_dCompiler_dCodegen_dLower_dtyNamesInto dtb__547) mc1)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__548) -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dtyDeclRefsGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__549, dtb__550) -> ((v_Vuna_dCompiler_dCodegen_dLower_dtyDeclRefsGo dtb__550) ((v_Vuna_dCompiler_dCodegen_dLower_dfoldlTyNames dtb__549) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dtyDeclRefs = (fun decls -> ((v_Vuna_dCompiler_dCodegen_dLower_dtyDeclRefsGo ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dLower_dtyDeclTys) decls)) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dCodegen_dLower_dbodyOrDummy = (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__551) -> dtb__551
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dadjOfDef = (fun env d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dCodegen_dLower_ddepsOfBody env) (v_Vuna_dCompiler_dCodegen_dLower_dbodyOrDummy d)) })

let v_Vuna_dCompiler_dCodegen_dLower_dgroupDefs = (fun env defs -> ((fun adj -> ((fun names -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dIr_dAnalysis.v_Vuna_dCompiler_dIr_dAnalysis_dassembleGroupNames adj) names) (v_Vuna_dCompiler_dCodegen_dLower_drecOkOfIn defs)) (v_Vuna_dCompiler_dCodegen_dLower_dspanOfIn defs))) (fun groups -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dappendGroups env) 0) groups)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__552; Base_dPair.f_Base_dPair_dPair_second = dtb__553 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__552))
  | _ -> failwith "DT: impossible branch"
)))))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) defs))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dCodegen_dLower_dadjOfDef env)) defs)))

let v_Vuna_dCompiler_dCodegen_dLower_dactionResultTyIn = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__554, dtb__555, dtb__556) -> (match dtb__554 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__557, dtb__558, dtb__559) -> (match dtb__557 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__560) -> (if (dtb__560 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffTypeName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = "eff"; Base_dPair.f_Base_dPair_dPair_second = dtb__555 })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dcollectBuiltinRowTags = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__561, dtb__562) -> (if (dtb__561 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__563, dtb__564) -> (match dtb__564 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__565, dtb__566) -> (match dtb__566 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__567, dtb__568) -> ((fun rest -> ((fun tagTerm -> (match tagTerm with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__569) -> (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disBuiltinEffectTag dtb__569) then (Base_dList.C_Base_dList_dList_Cons (dtb__569, rest)) else rest)
  | _ -> rest
)) (Base_dPair.v_Base_dPair_dfirstOf dtb__565))) (v_Vuna_dCompiler_dCodegen_dLower_dcollectBuiltinRowTags (Base_dPair.v_Base_dPair_dfirstOf dtb__567)))
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)) dtb__562) else Base_dList.C_Base_dList_dList_Nil)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let v_Vuna_dCompiler_dCodegen_dLower_dmainRowTags = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__570, dtb__571, dtb__572) -> (match dtb__570 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__573, dtb__574, dtb__575) -> (match dtb__573 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__576) -> (if (dtb__576 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffTypeName) then (v_Vuna_dCompiler_dCodegen_dLower_dcollectBuiltinRowTags ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__574))) else Base_dList.C_Base_dList_dList_Nil)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let v_Vuna_dCompiler_dCodegen_dLower_dmainShowForNameIr = (fun g -> (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtShowInt)) else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtShowNat)) else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtShowStr)) else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtShowFloat)) else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtShowBool)) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dmainShowDefName))))))))

let v_Vuna_dCompiler_dCodegen_dLower_dmainShowIr = (fun tyTerm -> (match ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) tyTerm)) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__577) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__578, dtb__579) -> (match dtb__579 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dCodegen_dLower_dmainShowForNameIr dtb__578)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dmainShowDefName))
)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dmainShowDefName))
)) dtb__577)
  | _ -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dmainShowDefName))
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dfilterMapRunHost = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__580, dtb__581) -> ((fun host -> (if (host = "") then (v_Vuna_dCompiler_dCodegen_dLower_dfilterMapRunHost dtb__581) else (Base_dList.C_Base_dList_dList_Cons (host, (v_Vuna_dCompiler_dCodegen_dLower_dfilterMapRunHost dtb__581))))) (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dbuiltinEffectImplOf dtb__580))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dlowerEntryOf = (fun defs -> (match ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef "main") defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__582) -> (match (v_Vuna_dCompiler_dCodegen_dLower_dactionResultTyIn (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__582)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__583) -> ((fun innerTy -> ((fun tags -> ((fun handlers -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = (v_Vuna_dCompiler_dCodegen_dLower_dmainShowIr innerTy); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = "main"; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = true; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffMainRunName)); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = handlers }))))) (v_Vuna_dCompiler_dCodegen_dLower_dfilterMapRunHost tags))) (v_Vuna_dCompiler_dCodegen_dLower_dmainRowTags (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__582)))) (Base_dPair.v_Base_dPair_dsecondOf dtb__583))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryShow = (v_Vuna_dCompiler_dCodegen_dLower_dmainShowIr (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__582)); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryMain = "main"; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryIsAction = false; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRunMain = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryHandlers = Base_dList.C_Base_dList_dList_Nil }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dgroupOfPair = (fun mc0 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__584; Base_dPair.f_Base_dPair_dPair_second = dtb__585 } -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupIsRec = dtb__584; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrGroup_irGroupDefs = dtb__585 }
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dLower_dnameSetOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__586, dtb__587) -> ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__586) true) (v_Vuna_dCompiler_dCodegen_dLower_dnameSetOf dtb__587))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dmkLwEnv = (fun datas defs unit -> ((fun shared -> ((fun runtime -> { f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwShared = shared; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDatas = runtime; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwTyParams = (v_Vuna_dCompiler_dCodegen_dLower_dtyParamsOf runtime); f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRecordFields = (v_Vuna_dCompiler_dCodegen_dLower_drecordFieldsOf runtime); f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwCtors = (shared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtors; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwOpaques = (shared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtorOpaques; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnboxed = (shared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUnboxed; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefs = defs; f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwRuntimeNames = (v_Vuna_dCompiler_dCodegen_dLower_dnameSetOf (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf defs)); f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwUnit = unit }) (v_Vuna_dCompiler_dCodegen_dLower_drtDatasOf datas))) ((v_Vuna_dCompiler_dCodegen_dLower_dlowerSharedOf datas) defs)))

let v_Vuna_dCompiler_dCodegen_dLower_dpartitionRuntimeDefs = (fun defs -> (match ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefs (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_ddefTable defs)) defs) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__588; Base_dPair.f_Base_dPair_dPair_second = dtb__589 } -> dtb__588
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dLower_dlowerUnitAfterChecks = (fun env defNames dataNames -> ((fun datas -> ((fun defs -> ((fun unitDatas -> ((fun runtime -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dLower_dgroupDefs env) runtime)) (fun groups -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dLower_dtyDeclsOf datas) unitDatas)) (fun decls -> ((fun groups2 -> ((fun hasList -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls = decls; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups = groups2; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily = hasList; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs = (v_Vuna_dCompiler_dCodegen_dLower_dtyDeclRefs decls); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing }))) ((v_Vuna_dCompiler_dCodegen_dLower_dmemList Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistFamilyName) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) unitDatas)))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dLower_dgroupOfPair) groups))))))) (v_Vuna_dCompiler_dCodegen_dLower_dpartitionRuntimeDefs defs))) ((Base_dList.v_Base_dList_dfilter (fun d -> ((v_Vuna_dCompiler_dCodegen_dLower_dmemList (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) dataNames))) datas))) ((Base_dList.v_Base_dList_dfilter (fun d -> ((v_Vuna_dCompiler_dCodegen_dLower_dmemList (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) defNames))) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDefs))) (env).f_Vuna_dCompiler_dCodegen_dLower_dLwEnv_lwDatas))

let v_Vuna_dCompiler_dCodegen_dLower_dlowerUnitOf = (fun env defNames dataNames -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dCodegen_dLower_dcheckProgramOf env)) (fun _u -> (((v_Vuna_dCompiler_dCodegen_dLower_dlowerUnitAfterChecks env) defNames) dataNames))))

let v_Vuna_dCompiler_dCodegen_dLower_dlowerProgramOf = (fun datas defs -> ((fun env -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dLower_dlowerUnitOf env) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) defs)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas))) (fun unitIr -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dCodegen_dLower_dlowerEntryOf defs)) (fun entry -> ((fun program -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dIr.v_Vuna_dCompiler_dIr_dvalidateProgram program)) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (program))))) { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgShared = (v_Vuna_dCompiler_dCodegen_dLower_dlwEnvShared env); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit = { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTyDecls; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitGroups; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitHasListFamily; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs = (unitIr).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitTypeRefs; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry = entry } })))))) (((v_Vuna_dCompiler_dCodegen_dLower_dmkLwEnv datas) defs) "")))
