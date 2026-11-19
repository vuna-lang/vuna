open Vuna_runtime
type t_Vuna_dCompiler_dLowering_dEnv_dLwEnv = { f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwShared : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrShared; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxedInfo : (string, (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor, int) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwRecordFields : (string, (int, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors : (string, (string, bool Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwOpaques : (string, bool Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxed : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwHasListFamily : bool; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefTbl : (string, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwGlobals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwFacts : (string, Vuna_dCompiler_dLowering_dChecks.t_Vuna_dCompiler_dLowering_dChecks_dTermUse) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnit : string }

# 65 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dlwEnvShared = (fun (mc0 : t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) -> (match mc0 with
  | { f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwShared = dtb__0; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas = dtb__1; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams = dtb__2; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxedInfo = dtb__3; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwRecordFields = dtb__4; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors = dtb__5; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwOpaques = dtb__6; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxed = dtb__7; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwHasListFamily = dtb__8; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefs = dtb__9; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefTbl = dtb__10; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwGlobals = dtb__11; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwFacts = dtb__12; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnit = dtb__13 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dlwEnvWithUnit = (fun (mc0 : string) (mc1 : t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) -> (match mc1 with
  | { f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwShared = dtb__14; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas = dtb__15; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams = dtb__16; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxedInfo = dtb__17; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwRecordFields = dtb__18; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors = dtb__19; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwOpaques = dtb__20; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxed = dtb__21; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwHasListFamily = dtb__22; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefs = dtb__23; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefTbl = dtb__24; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwGlobals = dtb__25; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwFacts = dtb__26; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnit = dtb__27 } -> { f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwShared = dtb__14; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas = dtb__15; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams = dtb__16; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxedInfo = dtb__17; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwRecordFields = dtb__18; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors = dtb__19; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwOpaques = dtb__20; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxed = dtb__21; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwHasListFamily = dtb__22; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefs = dtb__23; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefTbl = dtb__24; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwGlobals = dtb__25; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwFacts = dtb__26; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnit = mc0 }
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dlistLength = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__28, dtb__29) -> (1 + (v_Vuna_dCompiler_dLowering_dEnv_dlistLength dtb__29))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dpushDep = (fun (dep : string) (deps : string Base_dData_dList.t_Base_dData_dList_dList) -> (if (dep = "") then deps else (if ((Base_dData_dList.v_Base_dData_dList_dmemName dep) deps) then deps else ((Base_dData_dList.v_Base_dData_dList_dappend deps) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dep, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))

# 84 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dmapSome = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__30, dtb__31) -> (match (mc0 dtb__30) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dLowering_dEnv_dmapSome mc0) dtb__31)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__32) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__32, ((v_Vuna_dCompiler_dLowering_dEnv_dmapSome mc0) dtb__31)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 93 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_disTypeHeadOpaqueDatas = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (name : string) -> (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disUnboxedCanonical name) then false else (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData name) datas) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__33) -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disTypeConstructorName name))
  | _ -> failwith "DT: impossible branch"
)))

# 102 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dmemOpaqueLevel = (fun (mc0 : int) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__34, dtb__35) -> (if (dtb__34 = mc0) then true else ((v_Vuna_dCompiler_dLowering_dEnv_dmemOpaqueLevel mc0) dtb__35))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 114 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_disRecordData = (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataIsRecord d) then ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__36, dtb__37) -> (match dtb__37 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> false
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)) else false))

# 133 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_drecordRtFieldsGo = (fun (mc0 : string) (mc1 : bool Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__38, dtb__39) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__40, dtb__41) -> (if dtb__38 then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__40).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldIndex; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (dtb__40).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtFieldMeta_dtFieldName }, (((v_Vuna_dCompiler_dLowering_dEnv_drecordRtFieldsGo mc0) dtb__39) dtb__41))) else (((v_Vuna_dCompiler_dLowering_dEnv_drecordRtFieldsGo mc0) dtb__39) dtb__41))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 124 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_drecordRtFields = (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__42, dtb__43) -> (match dtb__43 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun arity -> (((v_Vuna_dCompiler_dLowering_dEnv_drecordRtFieldsGo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) ((Base_dData_dList.v_Base_dData_dList_ddrop arity) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags dtb__42))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataFields d))) (v_Vuna_dCompiler_dLowering_dEnv_dlistLength (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

# 143 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dhasRecordRepr = (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> (if (v_Vuna_dCompiler_dLowering_dEnv_disRecordData d) then (match (v_Vuna_dCompiler_dLowering_dEnv_drecordRtFields d) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> true
) else false))

# 153 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_drtDatasOf = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disUnboxedCanonical (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))))) datas))

# 161 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueGo = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : int) (mc3 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (mc4 : int Base_dData_dList.t_Base_dData_dList_dList) (mc5 : bool Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__44, dtb__45) -> (match dtb__44 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__46; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__47 } -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__48, dtb__49, dtb__50, dtb__51, dtb__52) -> ((fun flag -> ((fun fam2 -> ((fun next -> ((((((v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueGo mc0) dtb__45) (mc2 + 1)) next) fam2) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (flag, mc5)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__52) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__48, mc2, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue dtb__51) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc2, mc4)) else mc4))) (if (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__47)) then (if (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped (fun (l : int) -> ((v_Vuna_dCompiler_dLowering_dEnv_dmemOpaqueLevel l) mc4))) (v_Vuna_dCompiler_dLowering_dEnv_disTypeHeadOpaqueDatas mc0)) mc2) mc4) dtb__51) then true else (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dvalueHasImplicitPi dtb__51)) else false))
  | _ -> (Base_dData_dList.v_Base_dData_dList_dreverse mc5)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc5)
  | _ -> failwith "DT: impossible branch"
))

# 158 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueFlagsOf = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (c : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) -> ((((((v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueGo datas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) Base_dData_dList.C_Base_dData_dList_dList_Nil) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 183 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dlocRowPair = (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__53) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__53).Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartLine dtb__53) } }))
  | _ -> failwith "DT: impossible branch"
))

# 199 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dtypeParamLevelsGo = (fun (mc0 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__54, dtb__55) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__54)) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc1, ((v_Vuna_dCompiler_dLowering_dEnv_dtypeParamLevelsGo dtb__55) (mc1 + 1)))) else ((v_Vuna_dCompiler_dLowering_dEnv_dtypeParamLevelsGo dtb__55) (mc1 + 1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 196 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dtypeParamLevels = (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> ((v_Vuna_dCompiler_dLowering_dEnv_dtypeParamLevelsGo (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams) 0))

# 207 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dmemIntIn = (fun (mc0 : int) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__56, dtb__57) -> (if (dtb__56 = mc0) then true else ((v_Vuna_dCompiler_dLowering_dEnv_dmemIntIn mc0) dtb__57))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 214 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dlevelSlotGoIn = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) (mc2 : int) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__58, dtb__59) -> (if (dtb__58 = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (mc2)) else (((v_Vuna_dCompiler_dLowering_dEnv_dlevelSlotGoIn dtb__59) mc1) (mc2 + 1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 211 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dlevelSlotIn = (fun (levels : int Base_dData_dList.t_Base_dData_dList_dList) (lvl : int) -> (((v_Vuna_dCompiler_dLowering_dEnv_dlevelSlotGoIn levels) lvl) 0))

# 218 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dnthValueIn = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__60, dtb__61) -> (if (mc1 <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__60)) else ((v_Vuna_dCompiler_dLowering_dEnv_dnthValueIn dtb__61) (mc1 - 1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 222 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dlookupUsedIn = (fun (mc0 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__62, dtb__63) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__62) = mc1) then (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__62) else ((v_Vuna_dCompiler_dLowering_dEnv_dlookupUsedIn dtb__63) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 227 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dlookupTyParamsIn = (fun (tbl : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (name : string) -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) tbl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__64) -> dtb__64
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedLevelsFuel = (fun (fuel : int) (tps : int Base_dData_dList.t_Base_dData_dList_dList) (table : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (lvl : int) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__65, dtb__66, dtb__67, dtb__68, dtb__69) -> (if dtb__66 then ((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) (lvl + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__69) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__65, lvl, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) else ((Base_dData_dList.v_Base_dData_dList_dappend ((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) lvl) dtb__68)) ((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) (lvl + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__69) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__65, lvl, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__70) -> (match dtb__70 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__71, dtb__72, dtb__73) -> ((Base_dData_dList.v_Base_dData_dList_dappend (if ((v_Vuna_dCompiler_dLowering_dEnv_dmemIntIn dtb__72) tps) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__72, Base_dData_dList.C_Base_dData_dList_dList_Nil)) else Base_dData_dList.C_Base_dData_dList_dList_Nil)) ((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedSpineFuel (fuel - 1)) tps) table) datas) lvl) dtb__73))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__74, dtb__75) -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData dtb__74) datas) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__76) -> (((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) ((v_Vuna_dCompiler_dLowering_dEnv_dlookupUsedIn table) dtb__74)) dtb__75)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedSpineFuel (fuel - 1)) tps) table) datas) lvl) dtb__75)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)))
# 252 "Vuna/Compiler/Lowering/Env.vuna"
and v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedSpineFuel = (fun (mc0 : int) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (mc4 : int) (mc5 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__77, dtb__78) -> (if (mc0 <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else ((Base_dData_dList.v_Base_dData_dList_dappend ((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedLevelsFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__77)) ((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedSpineFuel (mc0 - 1)) mc1) mc2) mc3) mc4) dtb__78)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))
# 266 "Vuna/Compiler/Lowering/Env.vuna"
and v_Vuna_dCompiler_dLowering_dEnv_dcollectFamilyArgsFuel = (fun (fuel : int) (tps : int Base_dData_dList.t_Base_dData_dList_dList) (table : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (lvl : int) (usedPats : int Base_dData_dList.t_Base_dData_dList_dList) (args : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match usedPats with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__79, dtb__80) -> (match ((v_Vuna_dCompiler_dLowering_dEnv_dnthValueIn args) dtb__79) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__81) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedLevelsFuel (fuel - 1)) tps) table) datas) lvl) dtb__81)) (((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) dtb__80) args))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectFamilyArgsFuel (fuel - 1)) tps) table) datas) lvl) dtb__80) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 233 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedLevels = (fun (tps : int Base_dData_dList.t_Base_dData_dList_dList) (table : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (lvl : int) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> ((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedLevelsFuel 256) tps) table) datas) lvl) v))

# 262 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dcollectFamilyArgs = (fun (tps : int Base_dData_dList.t_Base_dData_dList_dList) (table : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (lvl : int) (usedPats : int Base_dData_dList.t_Base_dData_dList_dList) (args : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (((((((v_Vuna_dCompiler_dLowering_dEnv_dcollectFamilyArgsFuel 256) tps) table) datas) lvl) usedPats) args))

# 278 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dctorUsedLevels = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (mc3 : int Base_dData_dList.t_Base_dData_dList_dList) (mc4 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc5 : int) (mc6 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__82, dtb__83) -> (match dtb__82 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__84; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__85 } -> (match mc6 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__86, dtb__87, dtb__88, dtb__89, dtb__90) -> ((fun isOpq -> ((fun fam2 -> ((fun next -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__85) then (((((((v_Vuna_dCompiler_dLowering_dEnv_dctorUsedLevels mc0) mc1) mc2) fam2) dtb__83) (mc5 + 1)) next) else (if isOpq then (((((((v_Vuna_dCompiler_dLowering_dEnv_dctorUsedLevels mc0) mc1) mc2) fam2) dtb__83) (mc5 + 1)) next) else ((Base_dData_dList.v_Base_dData_dList_dappend (((((v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedLevels mc0) mc1) mc2) mc5) dtb__89)) (((((((v_Vuna_dCompiler_dLowering_dEnv_dctorUsedLevels mc0) mc1) mc2) fam2) dtb__83) (mc5 + 1)) next))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__90) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__86, mc5, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue dtb__89) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc5, mc3)) else mc3))) (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped (fun (l : int) -> ((v_Vuna_dCompiler_dLowering_dEnv_dmemOpaqueLevel l) mc3))) (v_Vuna_dCompiler_dLowering_dEnv_disTypeHeadOpaqueDatas mc2)) mc5) mc3) dtb__89))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 305 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_ddataUsedLevels = (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) (table : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> ((fun raw -> ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (l : int) -> ((v_Vuna_dCompiler_dLowering_dEnv_dmemIntIn l) raw))) (v_Vuna_dCompiler_dLowering_dEnv_dtypeParamLevels d))) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (c : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) -> (((((((v_Vuna_dCompiler_dLowering_dEnv_dctorUsedLevels (v_Vuna_dCompiler_dLowering_dEnv_dtypeParamLevels d)) table) datas) Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))))

# 314 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dlevelListEq = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__91, dtb__92) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__93, dtb__94) -> (if (dtb__91 = dtb__93) then ((v_Vuna_dCompiler_dLowering_dEnv_dlevelListEq dtb__92) dtb__94) else false)
  | _ -> false
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 319 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dsameLevelTable = (fun (mc0 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__95, dtb__96) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__97, dtb__98) -> (if (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__95) = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__97)) then ((v_Vuna_dCompiler_dLowering_dEnv_dlevelListEq (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__95)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__97)) else false) then ((v_Vuna_dCompiler_dLowering_dEnv_dsameLevelTable dtb__96) dtb__98) else false)
  | _ -> false
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 333 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dusedSlotCount = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__99, dtb__100) -> ((Base_dData_dList.v_Base_dData_dList_dlength (v_Vuna_dCompiler_dLowering_dEnv_dtypeParamLevels dtb__99)) + (v_Vuna_dCompiler_dLowering_dEnv_dusedSlotCount dtb__100))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 330 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dusedFixRounds = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> (1 + (v_Vuna_dCompiler_dLowering_dEnv_dusedSlotCount datas)))

# 340 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dusedTableFixFuel = (fun (fuel : int) (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (table : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then table else ((fun next -> (if ((v_Vuna_dCompiler_dLowering_dEnv_dsameLevelTable next) table) then next else (((v_Vuna_dCompiler_dLowering_dEnv_dusedTableFixFuel (fuel - 1)) datas) next))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((v_Vuna_dCompiler_dLowering_dEnv_ddataUsedLevels d) table) datas) })) datas))))

# 337 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dusedTableFix = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (table : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (((v_Vuna_dCompiler_dLowering_dEnv_dusedTableFixFuel (v_Vuna_dCompiler_dLowering_dEnv_dusedFixRounds datas)) datas) table))

# 350 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dtyParamsOf = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> ((v_Vuna_dCompiler_dLowering_dEnv_dusedTableFix datas) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil })) datas)))

# 353 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_drecordFieldsOf = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dLowering_dEnv_drecordRtFields d) })) ((Base_dData_dList.v_Base_dData_dList_dfilter v_Vuna_dCompiler_dLowering_dEnv_dhasRecordRepr) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> (Base_dData_dBool.v_Base_dData_dBool_dnot ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet datas))))) datas))))

# 361 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dfloatRenderRefName = "Base.Data.Float.floatRender"

# 391 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dunboxedRowOf = (fun (mc0 : (string, (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor, int) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__101; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__102 } -> (match dtb__102 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__103; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__104 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__101; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__103); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__104 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 400 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dlookupFacts = (fun (facts : (string, Vuna_dCompiler_dLowering_dChecks.t_Vuna_dCompiler_dLowering_dChecks_dTermUse) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (name : string) -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) facts) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__105) -> dtb__105
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> { Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps = Base_dData_dList.C_Base_dData_dList_dList_Nil; Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags = Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dnoUseFlags; Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit = false }
  | _ -> failwith "DT: impossible branch"
))

# 369 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dfactsOf = (fun (env : t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (name : string) -> ((v_Vuna_dCompiler_dLowering_dEnv_dlookupFacts (env).f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwFacts) name))

# 365 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dfactsDepsOf = (fun (env : t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (name : string) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (d : string) -> (if (d = "strFromFloat") then v_Vuna_dCompiler_dLowering_dEnv_dfloatRenderRefName else d))) (((v_Vuna_dCompiler_dLowering_dEnv_dfactsOf env) name)).Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps))

# 395 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_danyDefFlag = (fun (mc0 : (Vuna_dCompiler_dLowering_dChecks.t_Vuna_dCompiler_dLowering_dChecks_dTermUse) -> bool) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, Vuna_dCompiler_dLowering_dChecks.t_Vuna_dCompiler_dLowering_dChecks_dTermUse) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__106, dtb__107) -> (if (mc0 ((v_Vuna_dCompiler_dLowering_dEnv_dlookupFacts mc2) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__106))) then true else (((v_Vuna_dCompiler_dLowering_dEnv_danyDefFlag mc0) dtb__107) mc2))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 418 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dfindFamilyCtor = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__108, dtb__109) -> (if ((Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dctorSpellingKey (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__108)) = (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dctorSpellingKey mc1)) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__108)) else ((v_Vuna_dCompiler_dLowering_dEnv_dfindFamilyCtor dtb__109) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 426 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dfindListFamilyData = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__110, dtb__111) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__110) = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dlistFamilyName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__110)) else (v_Vuna_dCompiler_dLowering_dEnv_dfindListFamilyData dtb__111))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 406 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dlistFamOf = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> (match (v_Vuna_dCompiler_dLowering_dEnv_dfindListFamilyData datas) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__112) -> (match ((v_Vuna_dCompiler_dLowering_dEnv_dfindFamilyCtor (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__112)) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dlistNilCtor) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__113) -> (match ((v_Vuna_dCompiler_dLowering_dEnv_dfindFamilyCtor (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__112)) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dlistConsCtor) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__114) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListFamily = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__112); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListNil = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__113); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrListFam_irListCons = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__114) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 431 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dctorTableOf = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (c : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c) } })) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))) datas))

# 375 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dlowerSharedOf = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (defs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) (facts : (string, Vuna_dCompiler_dLowering_dChecks.t_Vuna_dCompiler_dLowering_dChecks_dTermUse) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> ((fun runtime -> ((fun locRows -> { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedRecordFields = (v_Vuna_dCompiler_dLowering_dEnv_drecordFieldsOf runtime); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedListFam = (v_Vuna_dCompiler_dLowering_dEnv_dlistFamOf runtime); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesFloat = (((v_Vuna_dCompiler_dLowering_dEnv_danyDefFlag (fun (f : Vuna_dCompiler_dLowering_dChecks.t_Vuna_dCompiler_dLowering_dChecks_dTermUse) -> (if ((f).Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags).Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsFloat then true else (f).Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit))) defs) facts); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesTrace = (((v_Vuna_dCompiler_dLowering_dEnv_danyDefFlag (fun (f : Vuna_dCompiler_dLowering_dChecks.t_Vuna_dCompiler_dLowering_dChecks_dTermUse) -> ((f).Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags).Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsTrace)) defs) facts); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesObs = (((v_Vuna_dCompiler_dLowering_dEnv_danyDefFlag (fun (f : Vuna_dCompiler_dLowering_dChecks.t_Vuna_dCompiler_dLowering_dChecks_dTermUse) -> ((f).Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags).Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsObs)) defs) facts); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedDefLocs = locRows; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUnboxed = ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLowering_dEnv_dunboxedRowOf) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedInfoOf runtime)); Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedCtorShapes = (v_Vuna_dCompiler_dLowering_dEnv_dctorTableOf runtime) }) ((v_Vuna_dCompiler_dLowering_dEnv_dmapSome v_Vuna_dCompiler_dLowering_dEnv_dlocRowPair) defs))) (v_Vuna_dCompiler_dLowering_dEnv_drtDatasOf datas)))

# 437 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueTableOf = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (c : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueFlagsOf datas) c) })) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))) datas))

# 484 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dintrinsicUseFlagsTbl = (((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsertAll Base_dData_dString.v_Hashable_uString) ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap (fun (n : string) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = n; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsFloat = true; Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsTrace = false; Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsObs = false } })) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfloatIntrinsicNames)) ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap (fun (n : string) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = n; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsFloat = false; Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsTrace = true; Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsObs = false } })) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dtraceIntrinsicNames)) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (n : string) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = n; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsFloat = false; Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsTrace = false; Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dUseFlags_useFlagsObs = true } })) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dobsIntrinsicNames)))) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 490 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_duseFlagsOfName = (fun (name : string) -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) v_Vuna_dCompiler_dLowering_dEnv_dintrinsicUseFlagsTbl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__115) -> dtb__115
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dnoUseFlags
  | _ -> failwith "DT: impossible branch"
))

# 477 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_ddefFactsOf = (fun (names : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> { Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseDeps = Base_dData_dList.C_Base_dData_dList_dList_Nil; Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFlags = Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dnoUseFlags; Vuna_dCompiler_dLowering_dChecks.f_Vuna_dCompiler_dLowering_dChecks_dTermUse_termUseFloatLit = false }
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__116) -> (((Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_dtermUseInto names) v_Vuna_dCompiler_dLowering_dEnv_duseFlagsOfName) dtb__116)
  | _ -> failwith "DT: impossible branch"
))

# 497 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_ddefTblOf = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__117, dtb__118) -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__117)) dtb__117) (v_Vuna_dCompiler_dLowering_dEnv_ddefTblOf dtb__118))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 502 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dstrTblOf = (fun pairs -> (((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsertAll Base_dData_dString.v_Hashable_uString) pairs) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 506 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dhasDataNamed = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__119, dtb__120) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__119) = mc0) then true else ((v_Vuna_dCompiler_dLowering_dEnv_dhasDataNamed mc0) dtb__120))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 510 "Vuna/Compiler/Lowering/Env.vuna"
let rec v_Vuna_dCompiler_dLowering_dEnv_dnameSetOf = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__121, dtb__122) -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) dtb__121) true) (v_Vuna_dCompiler_dLowering_dEnv_dnameSetOf dtb__122))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 467 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_ddefFactsTblOf = (fun (defs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> ((fun names -> (((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsertAll Base_dData_dString.v_Hashable_uString) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dLowering_dEnv_ddefFactsOf names) d) })) defs)) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil))) (v_Vuna_dCompiler_dLowering_dEnv_dnameSetOf (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("strFromFloat", (Vuna_dCompiler_dLowering_dChecks.v_Vuna_dCompiler_dLowering_dChecks_druntimeNamesOf defs))))))

# 444 "Vuna/Compiler/Lowering/Env.vuna"
let v_Vuna_dCompiler_dLowering_dEnv_dmkLwEnv = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (defs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) (globals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (unit : string) -> ((fun facts -> ((fun shared -> ((fun runtime -> { f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwShared = shared; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas = runtime; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams = (v_Vuna_dCompiler_dLowering_dEnv_dstrTblOf (v_Vuna_dCompiler_dLowering_dEnv_dtyParamsOf runtime)); f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxedInfo = (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedInfoOf runtime); f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwRecordFields = (v_Vuna_dCompiler_dLowering_dEnv_dstrTblOf (shared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedRecordFields); f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors = (v_Vuna_dCompiler_dLowering_dEnv_dstrTblOf (v_Vuna_dCompiler_dLowering_dEnv_dctorTableOf runtime)); f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwOpaques = (v_Vuna_dCompiler_dLowering_dEnv_dstrTblOf (v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueTableOf runtime)); f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnboxed = (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet runtime)); f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwHasListFamily = ((v_Vuna_dCompiler_dLowering_dEnv_dhasDataNamed Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dlistFamilyName) datas); f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefs = defs; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefTbl = (v_Vuna_dCompiler_dLowering_dEnv_ddefTblOf defs); f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwGlobals = (v_Vuna_dCompiler_dLowering_dEnv_dstrTblOf globals); f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwFacts = facts; f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwUnit = unit }) (v_Vuna_dCompiler_dLowering_dEnv_drtDatasOf datas))) (((v_Vuna_dCompiler_dLowering_dEnv_dlowerSharedOf datas) defs) facts))) (v_Vuna_dCompiler_dLowering_dEnv_ddefFactsTblOf defs)))
