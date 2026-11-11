open Vuna_runtime
type t_Vuna_dCompiler_dCore_dTerm_dRig = C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 | C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
and t_Vuna_dCompiler_dCore_dTerm_dLevel = int
and t_Vuna_dCompiler_dCore_dTerm_dTerm = C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar of (string) * (int) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta of (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal of (string) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType of (t_Vuna_dCompiler_dCore_dTerm_dLevel) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi of (string) * (bool) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam of (string) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dRig) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon of (string) * ((t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk of (string) * ((t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (int) * (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (int Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt of (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr of (string) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool of (bool) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat of (string) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord of (string) * ((t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dCore_dTerm_dCaseAlt = { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName : string; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders : (string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody : t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dCore_dTerm_dClosure = { f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv : t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody : t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dCore_dTerm_dNeutral = C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar of (string) * (int) * (t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal of (string) * (t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dCore_dTerm_dValue = C_Vuna_dCompiler_dCore_dTerm_dValue_VType of (t_Vuna_dCompiler_dCore_dTerm_dLevel) | C_Vuna_dCompiler_dCore_dTerm_dValue_VPi of (string) * (bool) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dClosure) | C_Vuna_dCompiler_dCore_dTerm_dValue_VLam of (string) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dClosure) | C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral of (t_Vuna_dCompiler_dCore_dTerm_dNeutral) | C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta of (int) * (t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dValue_VApp of (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dValue) | C_Vuna_dCompiler_dCore_dTerm_dValue_VCon of (string) * (t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dValue_VCase of (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dVCaseAlt Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dValue_VProj of (t_Vuna_dCompiler_dCore_dTerm_dValue) * (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (int) * (int) | C_Vuna_dCompiler_dCore_dTerm_dValue_VInt of (int) | C_Vuna_dCompiler_dCore_dTerm_dValue_VStr of (string) | C_Vuna_dCompiler_dCore_dTerm_dValue_VBool of (bool) | C_Vuna_dCompiler_dCore_dTerm_dValue_VIf of (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dValue) | C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat of (string)
and t_Vuna_dCompiler_dCore_dTerm_dVCaseAlt = { f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltName : string; f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltBinders : (string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltClosure : t_Vuna_dCompiler_dCore_dTerm_dClosure }
and t_Vuna_dCompiler_dCore_dTerm_dSols = { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl : (int, t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList : (int, t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth : (int, int) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals : (string, t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dHashMap.t_Base_dHashMap_dHashMap }

let v_Vuna_dCompiler_dCore_dTerm_drigIsErased = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> false
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> false
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_drigIsLinear = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dTerm_drigIsOmega = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dTerm_drigOfBinder = (fun mc0 mc1 -> (if mc0 then C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 else (if mc1 then C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 else C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)))

let v_Vuna_dCompiler_dCore_dTerm_ddefaultExplicitRig = C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega

let v_Vuna_dCompiler_dCore_dTerm_drigAdd = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> mc0
  | _ -> C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
)
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> mc1
  | _ -> mc1
)
  | _ -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> mc0
  | _ -> C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
)
))

let v_Vuna_dCompiler_dCore_dTerm_drigScale = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0
  | _ -> C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
)
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0
  | _ -> mc1
)
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0
  | _ -> C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_drigJoin = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
  | _ -> C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
)
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1
  | _ -> C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
)
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0
  | _ -> C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_drigExact = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> true
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> true
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dshowRig = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> "\207\137"
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> "1"
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> "0"
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dlevelZero = 0

let v_Vuna_dCompiler_dCore_dTerm_dlevelSucc = (fun mc0 -> (let dtb__0 = mc0 in (dtb__0 + 1)))

let v_Vuna_dCompiler_dCore_dTerm_dlevelMax = (fun mc0 mc1 -> (let dtb__1 = mc0 in (let dtb__2 = mc1 in (if (dtb__1 >= dtb__2) then dtb__1 else dtb__2))))

let v_Vuna_dCompiler_dCore_dTerm_dlevelToInt = (fun mc0 -> (let dtb__3 = mc0 in dtb__3))

let v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt = (fun n -> n)

let v_Vuna_dCompiler_dCore_dTerm_dlevelEq = (fun mc0 mc1 -> (let dtb__4 = mc0 in (let dtb__5 = mc1 in (dtb__4 = dtb__5))))

let v_Vuna_dCompiler_dCore_dTerm_dlevelLt = (fun mc0 mc1 -> (let dtb__6 = mc0 in (let dtb__7 = mc1 in (dtb__6 < dtb__7))))

let v_Vuna_dCompiler_dCore_dTerm_dcaseAltName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__8; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__9; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__10 } -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__11; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__12; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__13 } -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__14; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__15; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__16 } -> dtb__16
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel = 512

let v_Vuna_dCompiler_dCore_dTerm_dnatChainMax = 4611686018427387903

let v_Vuna_dCompiler_dCore_dTerm_dnatChainNext = (fun n -> (if (n >= v_Vuna_dCompiler_dCore_dTerm_dnatChainMax) then v_Vuna_dCompiler_dCore_dTerm_dnatChainMax else (n + 1)))

let rec v_Vuna_dCompiler_dCore_dTerm_dflattenTermAppGo = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__17, dtb__18) -> { Base_dPair.f_Base_dPair_dPair_first = (C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__17)); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__18) mc1) }
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__19, dtb__20, dtb__21) -> ((v_Vuna_dCompiler_dCore_dTerm_dflattenTermAppGo dtb__19) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__20; Base_dPair.f_Base_dPair_dPair_second = dtb__21 }, mc1)))
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }
))

let v_Vuna_dCompiler_dCore_dTerm_dflattenTermApp = (fun t -> ((v_Vuna_dCompiler_dCore_dTerm_dflattenTermAppGo t) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dCore_dTerm_dnatChainGo = (fun fuel t -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match (v_Vuna_dCompiler_dCore_dTerm_dflattenTermApp t) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__22; Base_dPair.f_Base_dPair_dPair_second = dtb__23 } -> (match dtb__22 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__24, dtb__25) -> (((v_Vuna_dCompiler_dCore_dTerm_dnatChainArgs (fuel - 1)) dtb__24) ((Base_dList.v_Base_dList_dappend dtb__25) dtb__23))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__26) -> (((v_Vuna_dCompiler_dCore_dTerm_dnatChainArgs (fuel - 1)) dtb__26) dtb__23)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dTerm_dnatChainArgs = (fun fuel c args -> (if (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then (match args with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (0))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__27, dtb__28) -> (match dtb__27 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__29; Base_dPair.f_Base_dPair_dPair_second = dtb__30 } -> (match dtb__28 with
  | Base_dList.C_Base_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dCore_dTerm_dnatChainGo fuel) dtb__29) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__31) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dCore_dTerm_dnatChainNext dtb__31)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) args) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))

let v_Vuna_dCompiler_dCore_dTerm_dnatChainValue = (fun t -> ((v_Vuna_dCompiler_dCore_dTerm_dnatChainGo 1000000) t))

let rec v_Vuna_dCompiler_dCore_dTerm_dtermSize = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__32, dtb__33, dtb__34) -> (((1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__32)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__33)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__34))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__35) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__36) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__37) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__38) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__39, dtb__40, dtb__41, dtb__42, dtb__43) -> ((1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__39)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__43))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__44, dtb__45, dtb__46, dtb__47, dtb__48) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__44))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__49, dtb__50) -> ((1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__49)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeAlts dtb__50))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__51, dtb__52) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs dtb__52))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__53, dtb__54) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs dtb__54))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__55, dtb__56) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs dtb__56))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__57, dtb__58, dtb__59) -> ((1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__57)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__58))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__60, dtb__61, dtb__62) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__62))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__63, dtb__64, dtb__65, dtb__66, dtb__67) -> ((1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__66)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__67))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__68) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__69) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__70) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__71, dtb__72, dtb__73) -> 1
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__74, dtb__75) -> (match dtb__74 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__76; Base_dPair.f_Base_dPair_dPair_second = dtb__77 } -> ((v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__76) + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs dtb__75))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dtermSizeAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__78, dtb__79) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermSize (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__78)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeAlts dtb__79))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dmetaLookup = (fun i t -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) i) t))

let rec v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__80, dtb__81) -> (match dtb__80 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__82; Base_dPair.f_Base_dPair_dPair_second = dtb__83 } -> (if (mc0 = dtb__82) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__83)) else ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList mc0) dtb__81))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty = { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil) }

let v_Vuna_dCompiler_dCore_dTerm_dsolsFromList = (fun xs -> { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dInt.v_Hashable_uInt) xs) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil)); f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = xs; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil) })

let v_Vuna_dCompiler_dCore_dTerm_dsolsOf = (fun t xs d dv -> { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = t; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = xs; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = d; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = dv })

let v_Vuna_dCompiler_dCore_dTerm_dsolsList = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__84; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__85; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__86; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = dtb__87 } -> dtb__85
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsPutDefVals = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__88; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__89; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__90; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = dtb__91 } -> { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__88; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__89; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__90; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = mc1 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsDepth = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__92; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__93; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__94; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = dtb__95 } -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) mc0) dtb__94)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsLookup = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__96; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__97; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__98; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = dtb__99 } -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) mc0) dtb__96)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsCons = (fun mc0 mc1 mc2 -> (match mc2 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__100; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__101; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__102; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = dtb__103 } -> { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dInt.v_Hashable_uInt) mc0) mc1) dtb__100); f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }, dtb__101)); f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__102; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = dtb__103 }
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__104, dtb__105, dtb__106) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__104) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__105)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__106))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__107) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__108) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__109) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__110) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__111, dtb__112) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__111) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts mc0) dtb__112))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__113, dtb__114, dtb__115, dtb__116, dtb__117) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__113) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__117))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__118, dtb__119, dtb__120, dtb__121, dtb__122) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__118)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__123, dtb__124) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__124)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__125, dtb__126) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__126)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__127, dtb__128) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__128)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__129, dtb__130, dtb__131) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__129) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__130))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__132, dtb__133, dtb__134) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__134)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__135, dtb__136, dtb__137, dtb__138, dtb__139) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__138) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__139))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__140) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__141) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__142, dtb__143, dtb__144) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__145) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__145) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__146) -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__147, dtb__148) -> (match dtb__147 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__149; Base_dPair.f_Base_dPair_dPair_second = dtb__150 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__149) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__148))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__151, dtb__152) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__151)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts mc0) dtb__152))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__153, dtb__154, dtb__155) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__153) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__154)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__155))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__156) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__157) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__158) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__159, dtb__160) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__159) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat mc0) dtb__160))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__161, dtb__162, dtb__163, dtb__164, dtb__165) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__161) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__165))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__166, dtb__167, dtb__168, dtb__169, dtb__170) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__166)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__171, dtb__172) -> ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__172)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__173, dtb__174) -> ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__174)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__175, dtb__176) -> ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__176)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__177, dtb__178, dtb__179) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__177) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__178))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__180, dtb__181, dtb__182) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__182)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__183, dtb__184, dtb__185, dtb__186, dtb__187) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__186) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__187))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__188) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__189) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__190, dtb__191, dtb__192) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__193) -> ((Base_dList.v_Base_dList_dmemName dtb__193) mc0)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__194) -> true
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__195, dtb__196) -> (match dtb__195 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__197; Base_dPair.f_Base_dPair_dPair_second = dtb__198 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__197) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__196))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__199, dtb__200) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__199)) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat mc0) dtb__200))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__201, dtb__202, dtb__203) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__201)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__202)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__203)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__204) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__205) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__206) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__207, dtb__208) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__207)) ((Base_dList.v_Base_dList_dconcatMap (fun a -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody a)))) dtb__208))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__209, dtb__210, dtb__211, dtb__212, dtb__213) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__209)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__213))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__214, dtb__215, dtb__216, dtb__217, dtb__218) -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__214)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__219, dtb__220) -> (Base_dList.C_Base_dList_dList_Cons (dtb__219, ((Base_dList.v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (Base_dPair.v_Base_dPair_dfirstOf p)))) dtb__220)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__221, dtb__222) -> ((Base_dList.v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (Base_dPair.v_Base_dPair_dfirstOf p)))) dtb__222)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__223, dtb__224) -> ((Base_dList.v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (Base_dPair.v_Base_dPair_dfirstOf p)))) dtb__224)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__225, dtb__226, dtb__227) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__225)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__226))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__228, dtb__229, dtb__230) -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__230)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__231, dtb__232, dtb__233, dtb__234, dtb__235) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__234)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__235))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__236) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__237) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__238, dtb__239, dtb__240) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__241) -> (Base_dList.C_Base_dList_dList_Cons (dtb__241, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__242) -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dlookupPair = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__243, dtb__244) -> (match dtb__243 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__245; Base_dPair.f_Base_dPair_dPair_second = dtb__246 } -> (if (dtb__245 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__246)) else ((v_Vuna_dCompiler_dCore_dTerm_dlookupPair mc0) dtb__244))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__247, dtb__248) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dlookupPair dtb__247) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__249) -> (Base_dList.C_Base_dList_dList_Cons (dtb__249, ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc0) dtb__248)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc0) dtb__248)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__250, dtb__251) -> (if (mc0 <= 0) then false else (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc2) dtb__250) then true else ((((v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel (mc0 - 1)) mc1) mc2) ((Base_dList.v_Base_dList_dappend dtb__251) ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc1) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__250))))))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dtermReachesFloat = (fun defs names t -> ((((v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel 4096) defs) names) (Base_dList.C_Base_dList_dList_Cons (t, Base_dList.C_Base_dList_dList_Nil))))

let v_Vuna_dCompiler_dCore_dTerm_ddefLookup = (fun name tbl -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) tbl))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__252, dtb__253, dtb__254) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__252) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__253)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__254))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__255) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__256) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__257) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__258) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__259, dtb__260) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__259) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts mc0) dtb__260))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__261, dtb__262, dtb__263, dtb__264, dtb__265) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__261) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + (Base_dList.v_Base_dList_dlength dtb__263))) dtb__265))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__266, dtb__267, dtb__268, dtb__269, dtb__270) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__266)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__271, dtb__272) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__272)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__273, dtb__274) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__274)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__275, dtb__276) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__276)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__277, dtb__278, dtb__279) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__277) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__278))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__280, dtb__281, dtb__282) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + 1)) dtb__282)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__283, dtb__284, dtb__285, dtb__286, dtb__287) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__286) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + 1)) dtb__287))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__288) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__289) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__290) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__291, dtb__292, dtb__293) -> (dtb__292 >= mc0)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__294, dtb__295) -> (match dtb__294 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__296; Base_dPair.f_Base_dPair_dPair_second = dtb__297 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__296) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__295))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__298, dtb__299) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__298)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__298)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts mc0) dtb__299))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasMeta = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__300, dtb__301, dtb__302) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__300) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__301)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__302))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__303) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__304) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__305) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__306) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__307, dtb__308) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__307) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts mc0) mc1) dtb__308))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__309, dtb__310, dtb__311, dtb__312, dtb__313) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__309) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + (Base_dList.v_Base_dList_dlength dtb__311))) dtb__313))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__314, dtb__315, dtb__316, dtb__317, dtb__318) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__314)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__319, dtb__320) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__320)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__321, dtb__322) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__322)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__323, dtb__324) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__324)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__325, dtb__326, dtb__327) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__325) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__326))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__328, dtb__329, dtb__330) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + 1)) dtb__330)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__331, dtb__332, dtb__333, dtb__334, dtb__335) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__334) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + 1)) dtb__335))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__336) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__337) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__338, dtb__339, dtb__340) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__341) -> (mc0 = dtb__341)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__342, dtb__343) -> (match dtb__342 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__344; Base_dPair.f_Base_dPair_dPair_second = dtb__345 } -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__344) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__343))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__346, dtb__347) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__346)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__346)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts mc0) mc1) dtb__347))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dshift = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__348, dtb__349, dtb__350) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__348), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__349), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__350)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__351) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__352) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__353) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__354) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__355, dtb__356) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__355), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts mc0) mc1) dtb__356)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__357, dtb__358, dtb__359, dtb__360, dtb__361) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__357), dtb__358, dtb__359, dtb__360, (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + (Base_dList.v_Base_dList_dlength dtb__359))) mc1) dtb__361)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__362, dtb__363, dtb__364, dtb__365, dtb__366) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__362), dtb__363, dtb__364, dtb__365, dtb__366))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__367, dtb__368) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__367, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__368)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__369, dtb__370) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__369, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__370)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__371, dtb__372) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__371, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__372)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__373, dtb__374, dtb__375) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__373), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__374), dtb__375))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__376, dtb__377, dtb__378) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__376, dtb__377, (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + 1)) mc1) dtb__378)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__379, dtb__380, dtb__381, dtb__382, dtb__383) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__379, dtb__380, dtb__381, (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__382), (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + 1)) mc1) dtb__383)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__384) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__385) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__386) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__387, dtb__388, dtb__389) -> (if (dtb__388 >= mc0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__387, (dtb__388 + mc1), dtb__389)) else mc2)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshiftArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__390, dtb__391) -> (match dtb__390 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__392; Base_dPair.f_Base_dPair_dPair_second = dtb__393 } -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__392); Base_dPair.f_Base_dPair_dPair_second = dtb__393 }, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__391)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlts = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__394, dtb__395) -> (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dCore_dTerm_dshiftAlt mc0) mc1) dtb__394), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts mc0) mc1) dtb__395)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlt = (fun mc0 mc1 mc2 -> (match mc2 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__396; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__397; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__398 } -> { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__396; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__397; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + (Base_dList.v_Base_dList_dlength dtb__397))) mc1) dtb__398) }
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__399, dtb__400, dtb__401) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__399), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__400), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__401)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__402) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__403) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__404) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__405) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__406, dtb__407) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__406), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt mc0) mc1)) dtb__407)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__408, dtb__409, dtb__410, dtb__411, dtb__412) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__408), dtb__409, dtb__410, dtb__411, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (mc0 - (Base_dList.v_Base_dList_dlength dtb__410))) mc1) dtb__412)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__413, dtb__414, dtb__415, dtb__416, dtb__417) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__413), dtb__414, dtb__415, dtb__416, dtb__417))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__418, dtb__419) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__418, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__419)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__420, dtb__421) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__420, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__421)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__422, dtb__423) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__422, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__423)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__424, dtb__425, dtb__426) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__424), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__425), dtb__426))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__427, dtb__428, dtb__429) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__427, dtb__428, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (mc0 + 1)) mc1) dtb__429)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__430, dtb__431, dtb__432, dtb__433, dtb__434) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__430, dtb__431, dtb__432, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__433), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (mc0 + 1)) mc1) dtb__434)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__435) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__436) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__437) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__438, dtb__439, dtb__440) -> (if (dtb__439 = mc0) then mc1 else mc2)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt = (fun idx arg alt -> { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt); f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt); f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (idx + (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)))) arg) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)) })

let rec v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__441, dtb__442, dtb__443) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__441), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__442), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__443)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__444, dtb__445) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__444), ((Base_dList.v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt mc0) mc1) mc2) mc3)) dtb__445)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__446, dtb__447, dtb__448, dtb__449, dtb__450) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__446), dtb__447, dtb__448, dtb__449, dtb__450))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__451, dtb__452) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__451, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__452)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__453, dtb__454) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__453, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__454)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__455, dtb__456) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__455, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__456)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__457, dtb__458, dtb__459) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__457), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__458), dtb__459))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__460, dtb__461, dtb__462) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__460, dtb__461, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__462)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__463, dtb__464, dtb__465, dtb__466, dtb__467) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__463, dtb__464, dtb__465, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__466), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__467)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__468) -> (if (dtb__468 = mc0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (mc1, (mc3 - mc2), { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })) else mc4)
  | _ -> mc4
))
and v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__469; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__470; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__471 } -> { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__469; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__470; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + (Base_dList.v_Base_dList_dlength dtb__470))) dtb__471) }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar = (fun m name q t -> (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) 0) t))

let rec v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__472, dtb__473, dtb__474, dtb__475, dtb__476) -> (if (mc3 = mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__472, dtb__473, dtb__474, dtb__475, (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (mc0, true, C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, mc2, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__476))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__472, dtb__473, dtb__474, dtb__475, (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo mc0) mc1) mc2) (mc3 + 1)) dtb__476))))
  | _ -> mc4
))

let v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder = (fun name idx dictDom t -> (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo name) idx) dictDom) 0) t))

let v_Vuna_dCompiler_dCore_dTerm_dcutoffOf = (fun total idx -> (if ((total - (idx + 1)) <= 0) then 0 else (total - (idx + 1))))

let rec v_Vuna_dCompiler_dCore_dTerm_dcountPis = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__477, dtb__478, dtb__479, dtb__480, dtb__481) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dcountPis dtb__481))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__482, dtb__483, dtb__484) -> (if (mc2 = mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__482, dtb__483, (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (mc0, C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__484))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__482, dtb__483, ((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo mc0) mc1) (mc2 + 1)) dtb__484))))
  | _ -> mc3
))

let v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder = (fun name idx t -> ((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo name) idx) 0) t))

let rec v_Vuna_dCompiler_dCore_dTerm_dcountLams = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__485, dtb__486, dtb__487) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dcountLams dtb__487))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__488, dtb__489, dtb__490) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__488) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__489)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__490))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__491, dtb__492) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__491) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree mc0) dtb__492))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__493, dtb__494, dtb__495, dtb__496, dtb__497) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__493) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__497))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__498, dtb__499, dtb__500, dtb__501, dtb__502) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__498)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__503, dtb__504) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__504)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__505, dtb__506) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__506)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__507, dtb__508) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__508)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__509, dtb__510, dtb__511) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__509) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__510))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__512, dtb__513, dtb__514) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + 1)) dtb__514)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__515, dtb__516, dtb__517, dtb__518, dtb__519) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__518) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + 1)) dtb__519))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__520, dtb__521, dtb__522) -> (dtb__521 >= mc0)
  | _ -> false
))
and v_Vuna_dCompiler_dCore_dTerm_danyPairFree = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__523, dtb__524) -> (match dtb__523 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__525; Base_dPair.f_Base_dPair_dPair_second = dtb__526 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__525) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__524))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_danyAltFree = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__527, dtb__528) -> (match dtb__527 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__529; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__530; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__531 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + (Base_dList.v_Base_dList_dlength dtb__530))) dtb__531) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree mc0) dtb__528))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__532, dtb__533, dtb__534) -> (if (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__532) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__533)) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__534))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__535, dtb__536) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__535) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts dtb__536))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__537, dtb__538, dtb__539, dtb__540, dtb__541) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__537) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__541))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__542, dtb__543, dtb__544, dtb__545, dtb__546) -> (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__542)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__547, dtb__548) -> (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__548)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__549, dtb__550) -> (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__550)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__551, dtb__552) -> (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__552)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__553, dtb__554, dtb__555) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__553) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__554))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__556, dtb__557, dtb__558) -> (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__558)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__559, dtb__560, dtb__561, dtb__562, dtb__563) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__562) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__563))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__564, dtb__565, dtb__566) -> (dtb__565 < 0)
  | _ -> false
))
and v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__567, dtb__568) -> (match dtb__567 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__569; Base_dPair.f_Base_dPair_dPair_second = dtb__570 } -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__569) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__568))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__571, dtb__572) -> (match dtb__571 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__573; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__574; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__575 } -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__575) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts dtb__572))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel = (fun fuel sols v -> (if (fuel <= 0) then false else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__576, dtb__577) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__576) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__578) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__578)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__579) -> (match dtb__579 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__580, dtb__581, dtb__582) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__582)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__583, dtb__584) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__584)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__585, dtb__586, dtb__587, dtb__588, dtb__589) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__588) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__589))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__590, dtb__591, dtb__592) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__592)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__593, dtb__594) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__594)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__595, dtb__596) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__595) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__596))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__597, dtb__598) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__597)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (dtb__599, dtb__600, dtb__601, dtb__602, dtb__603) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__599)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__604, dtb__605, dtb__606) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__604) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__605)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__606))
  | _ -> false
)))
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel = (fun fuel sols vs -> (if (fuel <= 0) then false else (match vs with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__607, dtb__608) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__607) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__608))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel = (fun fuel sols clo -> (if (fuel <= 0) then false else (match clo with
  | { f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = dtb__609; f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__610 } -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__609)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue = (fun sols v -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel 64) sols) v))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaList = (fun sols vs -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel 64) sols) vs))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaClo = (fun sols clo -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel 64) sols) clo))

let v_Vuna_dCompiler_dCore_dTerm_disTypeValue = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__611) -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__612) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__612))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let rec v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__613) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__614) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__615) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__616) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__617) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__618, dtb__619, dtb__620) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__618) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__619)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__620))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (dtb__621, dtb__622, dtb__623, dtb__624, dtb__625) -> (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__621)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__626, dtb__627) -> (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__626)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__628, dtb__629) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__628) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__629))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__630, dtb__631) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__631)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__632, dtb__633) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__633)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__634, dtb__635, dtb__636) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo mc0) dtb__636)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__637, dtb__638, dtb__639, dtb__640, dtb__641) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__640) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo mc0) dtb__641))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__642) -> (match dtb__642 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__643, dtb__644, dtb__645) -> (if (dtb__644 >= mc0) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__645))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__646, dtb__647) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__647)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__648, dtb__649) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) 0) dtb__648) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__649))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = dtb__650; f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__651 } -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__650)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowBinders = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__652, dtb__653) -> (match dtb__652 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__654; Base_dPair.f_Base_dPair_dPair_second = dtb__655 } -> (String.concat "" [" "; dtb__654; (v_Vuna_dCompiler_dCore_dTerm_dshowBinders dtb__653)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__656, dtb__657) -> (if (dtb__656 = 34) then ("\\\"" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__657)) else (if (dtb__656 = 92) then ("\\\\" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__657)) else (if (dtb__656 = 10) then ("\\n" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__657)) else (if (dtb__656 = 9) then ("\\t" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__657)) else (if (dtb__656 = 13) then ("\\r" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__657)) else ((Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Cons (dtb__656, Base_dList.C_Base_dList_dList_Nil))) ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__657)))))))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dshowCoreString = (fun s -> (String.concat "" ["\""; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars (Base_dList.dtp_unpack s)); "\""]))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowTerm = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__658, dtb__659, dtb__660) -> (String.concat "" ["if "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__658); " then "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__659); " else "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__660)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__661) -> (if dtb__661 then "True" else "False")
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__662) -> dtb__662
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__663) -> (v_Vuna_dCompiler_dCore_dTerm_dshowCoreString dtb__663)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__664) -> (bi_strFromInt dtb__664)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__665, dtb__666) -> (String.concat "" ["case "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__665); " of "; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__666)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__667, dtb__668, dtb__669, dtb__670, dtb__671) -> (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__667); " with "; dtb__668; " "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__671)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__672, dtb__673, dtb__674, dtb__675, dtb__676) -> (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__672); "."; dtb__673; "#"; (bi_strFromInt dtb__676)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__677, dtb__678) -> ((v_Vuna_dCompiler_dCore_dTerm_drecordAppShow dtb__677) dtb__678)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__679, dtb__680) -> (String.concat "" ["("; dtb__679; (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__680); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__681, dtb__682) -> (String.concat "" ["("; dtb__681; (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__682); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__683, dtb__684, dtb__685) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__683); " "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__684); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__686, dtb__687, dtb__688) -> (String.concat "" ["\\"; dtb__686; " => "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__688)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__689, dtb__690, dtb__691, dtb__692, dtb__693) -> (if (dtb__689 = "_") then (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__692); " -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__693)]) else (if dtb__690 then (String.concat "" ["{"; dtb__689; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__692); "} -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__693)]) else (String.concat "" ["("; dtb__689; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__692); ") -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__693)])))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__694) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__694) = 0) then "Type" else ("Type " ^ (bi_strFromInt (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__694))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__695) -> dtb__695
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__696) -> ("?" ^ (bi_strFromInt dtb__696))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__697, dtb__698, dtb__699) -> dtb__697
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__700, dtb__701) -> (match dtb__700 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__702; Base_dPair.f_Base_dPair_dPair_second = dtb__703 } -> (String.concat "" [" "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__702); (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__701)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_drecordAppShow = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__704, dtb__705) -> (match dtb__704 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__706; Base_dPair.f_Base_dPair_dPair_second = dtb__707 } -> ((v_Vuna_dCompiler_dCore_dTerm_drecordAppShow (String.concat "" ["("; mc0; " "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__706); ")"])) dtb__705)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__708, dtb__709) -> (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__708); (v_Vuna_dCompiler_dCore_dTerm_dshowBinders (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__708)); " => "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__708)); " | "; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__709)])
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__710, dtb__711) -> ((v_Vuna_dCompiler_dCore_dTerm_dshowSigAppText dtb__710) dtb__711)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__712, dtb__713) -> (match dtb__713 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__712
  | _ -> (String.concat "" ["("; dtb__712; (v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs dtb__713); ")"])
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__714, dtb__715, dtb__716) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__714); " "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__715); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__717, dtb__718, dtb__719, dtb__720, dtb__721) -> (if (dtb__717 = "_") then (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__720); " -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__721)]) else (if dtb__718 then (String.concat "" ["{"; dtb__717; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__720); "} -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__721)]) else (String.concat "" ["("; dtb__717; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__720); ") -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__721)])))
  | _ -> (v_Vuna_dCompiler_dCore_dTerm_dshowTerm mc0)
))
and v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__722, dtb__723, dtb__724, dtb__725, dtb__726) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__722, dtb__723, dtb__724, dtb__725, dtb__726))); ")"])
  | _ -> (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig mc0)
))
and v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__727, dtb__728) -> (match dtb__727 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__729; Base_dPair.f_Base_dPair_dPair_second = dtb__730 } -> (String.concat "" [" "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__729); (v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs dtb__728)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshowSigAppText = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__731, dtb__732) -> (match dtb__731 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__733; Base_dPair.f_Base_dPair_dPair_second = dtb__734 } -> ((v_Vuna_dCompiler_dCore_dTerm_dshowSigAppText (String.concat "" ["("; mc0; " "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__733); ")"])) dtb__732)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))
