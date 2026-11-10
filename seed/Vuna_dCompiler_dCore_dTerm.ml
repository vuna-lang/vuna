open Vuna_runtime
type t_Vuna_dCompiler_dCore_dTerm_dRig = C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 | C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
and t_Vuna_dCompiler_dCore_dTerm_dLevel = int
and t_Vuna_dCompiler_dCore_dTerm_dTerm = C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar of (string) * (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta of (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal of (string) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType of (t_Vuna_dCompiler_dCore_dTerm_dLevel) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi of (string) * (bool) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam of (string) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dRig) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon of (string) * ((t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk of (string) * ((t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (int) * (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (int Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt of (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr of (string) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool of (bool) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat of (string)
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
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__17, dtb__18, dtb__19) -> ((v_Vuna_dCompiler_dCore_dTerm_dflattenTermAppGo dtb__17) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__18; Base_dPair.f_Base_dPair_dPair_second = dtb__19 }, mc1)))
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }
))

let v_Vuna_dCompiler_dCore_dTerm_dflattenTermApp = (fun t -> ((v_Vuna_dCompiler_dCore_dTerm_dflattenTermAppGo t) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dCore_dTerm_dnatChainGo = (fun fuel t -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match (v_Vuna_dCompiler_dCore_dTerm_dflattenTermApp t) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__20; Base_dPair.f_Base_dPair_dPair_second = dtb__21 } -> (match dtb__20 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__22, dtb__23) -> (((v_Vuna_dCompiler_dCore_dTerm_dnatChainArgs (fuel - 1)) dtb__22) ((Base_dList.v_Base_dList_dappend dtb__23) dtb__21))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__24) -> (((v_Vuna_dCompiler_dCore_dTerm_dnatChainArgs (fuel - 1)) dtb__24) dtb__21)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dTerm_dnatChainArgs = (fun fuel c args -> (if (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then (match args with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (0))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__25, dtb__26) -> (match dtb__25 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__27; Base_dPair.f_Base_dPair_dPair_second = dtb__28 } -> (match dtb__26 with
  | Base_dList.C_Base_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dCore_dTerm_dnatChainGo fuel) dtb__27) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__29) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dCore_dTerm_dnatChainNext dtb__29)))
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
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__30, dtb__31, dtb__32) -> (((1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__30)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__31)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__32))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__33) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__34) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__35) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__36) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__37, dtb__38, dtb__39, dtb__40, dtb__41) -> ((1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__37)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__41))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__42, dtb__43, dtb__44, dtb__45, dtb__46) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__42))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__47, dtb__48) -> ((1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__47)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeAlts dtb__48))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__49, dtb__50) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs dtb__50))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__51, dtb__52) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs dtb__52))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__53, dtb__54, dtb__55) -> ((1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__53)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__54))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__56, dtb__57, dtb__58) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__58))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__59, dtb__60, dtb__61, dtb__62, dtb__63) -> ((1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__62)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__63))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__64) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__65) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__66) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__67, dtb__68) -> 1
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__69, dtb__70) -> (match dtb__69 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__71; Base_dPair.f_Base_dPair_dPair_second = dtb__72 } -> ((v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__71) + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs dtb__70))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dtermSizeAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__73, dtb__74) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermSize (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__73)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeAlts dtb__74))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dmetaLookup = (fun i t -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) i) t))

let rec v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__75, dtb__76) -> (match dtb__75 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__77; Base_dPair.f_Base_dPair_dPair_second = dtb__78 } -> (if (mc0 = dtb__77) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__78)) else ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList mc0) dtb__76))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty = { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil) }

let v_Vuna_dCompiler_dCore_dTerm_dsolsFromList = (fun xs -> { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dInt.v_Hashable_uInt) xs) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil)); f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = xs; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil) })

let v_Vuna_dCompiler_dCore_dTerm_dsolsOf = (fun t xs d dv -> { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = t; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = xs; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = d; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = dv })

let v_Vuna_dCompiler_dCore_dTerm_dsolsList = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__79; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__80; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__81; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = dtb__82 } -> dtb__80
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsPutDefVals = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__83; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__84; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__85; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = dtb__86 } -> { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__83; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__84; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__85; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = mc1 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsDepth = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__87; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__88; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__89; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = dtb__90 } -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) mc0) dtb__89)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsLookup = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__91; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__92; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__93; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = dtb__94 } -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) mc0) dtb__91)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsCons = (fun mc0 mc1 mc2 -> (match mc2 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__95; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__96; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__97; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = dtb__98 } -> { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dInt.v_Hashable_uInt) mc0) mc1) dtb__95); f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }, dtb__96)); f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__97; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = dtb__98 }
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__99, dtb__100, dtb__101) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__99) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__100)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__101))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__102) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__103) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__104) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__105) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__106, dtb__107) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__106) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts mc0) dtb__107))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__108, dtb__109, dtb__110, dtb__111, dtb__112) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__108) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__112))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__113, dtb__114, dtb__115, dtb__116, dtb__117) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__113)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__118, dtb__119) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__119)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__120, dtb__121) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__121)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__122, dtb__123, dtb__124) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__122) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__123))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__125, dtb__126, dtb__127) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__127)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__128, dtb__129, dtb__130, dtb__131, dtb__132) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__131) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__132))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__133) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__134) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__135, dtb__136) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__137) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__137) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__138) -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__139, dtb__140) -> (match dtb__139 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__141; Base_dPair.f_Base_dPair_dPair_second = dtb__142 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__141) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__140))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__143, dtb__144) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__143)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts mc0) dtb__144))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__145, dtb__146, dtb__147) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__145) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__146)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__147))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__148) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__149) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__150) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__151, dtb__152) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__151) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat mc0) dtb__152))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__153, dtb__154, dtb__155, dtb__156, dtb__157) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__153) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__157))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__158, dtb__159, dtb__160, dtb__161, dtb__162) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__158)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__163, dtb__164) -> ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__164)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__165, dtb__166) -> ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__166)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__167, dtb__168, dtb__169) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__167) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__168))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__170, dtb__171, dtb__172) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__172)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__173, dtb__174, dtb__175, dtb__176, dtb__177) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__176) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__177))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__178) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__179) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__180, dtb__181) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__182) -> ((Base_dList.v_Base_dList_dmemName dtb__182) mc0)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__183) -> true
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__184, dtb__185) -> (match dtb__184 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__186; Base_dPair.f_Base_dPair_dPair_second = dtb__187 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__186) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__185))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__188, dtb__189) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__188)) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat mc0) dtb__189))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__190, dtb__191, dtb__192) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__190)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__191)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__192)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__193) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__194) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__195) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__196, dtb__197) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__196)) ((Base_dList.v_Base_dList_dconcatMap (fun a -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody a)))) dtb__197))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__198, dtb__199, dtb__200, dtb__201, dtb__202) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__198)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__202))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__203, dtb__204, dtb__205, dtb__206, dtb__207) -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__203)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__208, dtb__209) -> ((Base_dList.v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (Base_dPair.v_Base_dPair_dfirstOf p)))) dtb__209)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__210, dtb__211) -> ((Base_dList.v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (Base_dPair.v_Base_dPair_dfirstOf p)))) dtb__211)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__212, dtb__213, dtb__214) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__212)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__213))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__215, dtb__216, dtb__217) -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__217)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__218, dtb__219, dtb__220, dtb__221, dtb__222) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__221)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__222))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__223) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__224) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__225, dtb__226) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__227) -> (Base_dList.C_Base_dList_dList_Cons (dtb__227, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__228) -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dlookupPair = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__229, dtb__230) -> (match dtb__229 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__231; Base_dPair.f_Base_dPair_dPair_second = dtb__232 } -> (if (dtb__231 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__232)) else ((v_Vuna_dCompiler_dCore_dTerm_dlookupPair mc0) dtb__230))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__233, dtb__234) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dlookupPair dtb__233) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__235) -> (Base_dList.C_Base_dList_dList_Cons (dtb__235, ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc0) dtb__234)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc0) dtb__234)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__236, dtb__237) -> (if (mc0 <= 0) then false else (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc2) dtb__236) then true else ((((v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel (mc0 - 1)) mc1) mc2) ((Base_dList.v_Base_dList_dappend dtb__237) ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc1) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__236))))))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dtermReachesFloat = (fun defs names t -> ((((v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel 4096) defs) names) (Base_dList.C_Base_dList_dList_Cons (t, Base_dList.C_Base_dList_dList_Nil))))

let v_Vuna_dCompiler_dCore_dTerm_ddefLookup = (fun name tbl -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) tbl))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__238, dtb__239, dtb__240) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__238) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__239)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__240))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__241) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__242) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__243) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__244) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__245, dtb__246) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__245) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts mc0) dtb__246))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__247, dtb__248, dtb__249, dtb__250, dtb__251) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__247) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + (Base_dList.v_Base_dList_dlength dtb__249))) dtb__251))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__252, dtb__253, dtb__254, dtb__255, dtb__256) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__252)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__257, dtb__258) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__258)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__259, dtb__260) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__260)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__261, dtb__262, dtb__263) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__261) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__262))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__264, dtb__265, dtb__266) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + 1)) dtb__266)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__267, dtb__268, dtb__269, dtb__270, dtb__271) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__270) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + 1)) dtb__271))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__272) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__273) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__274) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__275, dtb__276) -> (dtb__276 >= mc0)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__277, dtb__278) -> (match dtb__277 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__279; Base_dPair.f_Base_dPair_dPair_second = dtb__280 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__279) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__278))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__281, dtb__282) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__281)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__281)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts mc0) dtb__282))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasMeta = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__283, dtb__284, dtb__285) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__283) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__284)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__285))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__286) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__287) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__288) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__289) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__290, dtb__291) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__290) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts mc0) mc1) dtb__291))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__292, dtb__293, dtb__294, dtb__295, dtb__296) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__292) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + (Base_dList.v_Base_dList_dlength dtb__294))) dtb__296))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__297, dtb__298, dtb__299, dtb__300, dtb__301) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__297)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__302, dtb__303) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__303)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__304, dtb__305) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__305)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__306, dtb__307, dtb__308) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__306) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__307))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__309, dtb__310, dtb__311) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + 1)) dtb__311)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__312, dtb__313, dtb__314, dtb__315, dtb__316) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__315) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + 1)) dtb__316))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__317) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__318) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__319, dtb__320) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__321) -> (mc0 = dtb__321)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__322, dtb__323) -> (match dtb__322 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__324; Base_dPair.f_Base_dPair_dPair_second = dtb__325 } -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__324) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__323))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__326, dtb__327) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__326)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__326)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts mc0) mc1) dtb__327))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dshift = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__328, dtb__329, dtb__330) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__328), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__329), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__330)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__331) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__332) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__333) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__334) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__335, dtb__336) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__335), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts mc0) mc1) dtb__336)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__337, dtb__338, dtb__339, dtb__340, dtb__341) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__337), dtb__338, dtb__339, dtb__340, (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + (Base_dList.v_Base_dList_dlength dtb__339))) mc1) dtb__341)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__342, dtb__343, dtb__344, dtb__345, dtb__346) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__342), dtb__343, dtb__344, dtb__345, dtb__346))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__347, dtb__348) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__347, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__348)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__349, dtb__350) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__349, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__350)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__351, dtb__352, dtb__353) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__351), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__352), dtb__353))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__354, dtb__355, dtb__356) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__354, dtb__355, (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + 1)) mc1) dtb__356)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__357, dtb__358, dtb__359, dtb__360, dtb__361) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__357, dtb__358, dtb__359, (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__360), (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + 1)) mc1) dtb__361)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__362) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__363) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__364) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__365, dtb__366) -> (if (dtb__366 >= mc0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__365, (dtb__366 + mc1))) else mc2)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshiftArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__367, dtb__368) -> (match dtb__367 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__369; Base_dPair.f_Base_dPair_dPair_second = dtb__370 } -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__369); Base_dPair.f_Base_dPair_dPair_second = dtb__370 }, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__368)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlts = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__371, dtb__372) -> (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dCore_dTerm_dshiftAlt mc0) mc1) dtb__371), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts mc0) mc1) dtb__372)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlt = (fun mc0 mc1 mc2 -> (match mc2 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__373; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__374; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__375 } -> { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__373; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__374; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + (Base_dList.v_Base_dList_dlength dtb__374))) mc1) dtb__375) }
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__376, dtb__377, dtb__378) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__376), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__377), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__378)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__379) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__380) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__381) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__382) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__383, dtb__384) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__383), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt mc0) mc1)) dtb__384)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__385, dtb__386, dtb__387, dtb__388, dtb__389) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__385), dtb__386, dtb__387, dtb__388, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (mc0 - (Base_dList.v_Base_dList_dlength dtb__387))) mc1) dtb__389)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__390, dtb__391, dtb__392, dtb__393, dtb__394) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__390), dtb__391, dtb__392, dtb__393, dtb__394))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__395, dtb__396) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__395, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__396)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__397, dtb__398) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__397, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__398)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__399, dtb__400, dtb__401) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__399), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__400), dtb__401))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__402, dtb__403, dtb__404) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__402, dtb__403, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (mc0 + 1)) mc1) dtb__404)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__405, dtb__406, dtb__407, dtb__408, dtb__409) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__405, dtb__406, dtb__407, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__408), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (mc0 + 1)) mc1) dtb__409)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__410) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__411) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__412) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__413, dtb__414) -> (if (dtb__414 = mc0) then mc1 else mc2)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt = (fun idx arg alt -> { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt); f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt); f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (idx + (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)))) arg) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)) })

let rec v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__415, dtb__416, dtb__417) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__415), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__416), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__417)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__418, dtb__419) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__418), ((Base_dList.v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt mc0) mc1) mc2) mc3)) dtb__419)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__420, dtb__421, dtb__422, dtb__423, dtb__424) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__420), dtb__421, dtb__422, dtb__423, dtb__424))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__425, dtb__426) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__425, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__426)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__427, dtb__428) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__427, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__428)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__429, dtb__430, dtb__431) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__429), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__430), dtb__431))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__432, dtb__433, dtb__434) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__432, dtb__433, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__434)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__435, dtb__436, dtb__437, dtb__438, dtb__439) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__435, dtb__436, dtb__437, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__438), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__439)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__440) -> (if (dtb__440 = mc0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (mc1, (mc3 - mc2))) else mc4)
  | _ -> mc4
))
and v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__441; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__442; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__443 } -> { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__441; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__442; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + (Base_dList.v_Base_dList_dlength dtb__442))) dtb__443) }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar = (fun m name q t -> (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) 0) t))

let rec v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__444, dtb__445, dtb__446, dtb__447, dtb__448) -> (if (mc3 = mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__444, dtb__445, dtb__446, dtb__447, (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (mc0, true, C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, mc2, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__448))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__444, dtb__445, dtb__446, dtb__447, (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo mc0) mc1) mc2) (mc3 + 1)) dtb__448))))
  | _ -> mc4
))

let v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder = (fun name idx dictDom t -> (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo name) idx) dictDom) 0) t))

let v_Vuna_dCompiler_dCore_dTerm_dcutoffOf = (fun total idx -> (if ((total - (idx + 1)) <= 0) then 0 else (total - (idx + 1))))

let rec v_Vuna_dCompiler_dCore_dTerm_dcountPis = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__449, dtb__450, dtb__451, dtb__452, dtb__453) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dcountPis dtb__453))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__454, dtb__455, dtb__456) -> (if (mc2 = mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__454, dtb__455, (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (mc0, C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__456))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__454, dtb__455, ((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo mc0) mc1) (mc2 + 1)) dtb__456))))
  | _ -> mc3
))

let v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder = (fun name idx t -> ((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo name) idx) 0) t))

let rec v_Vuna_dCompiler_dCore_dTerm_dcountLams = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__457, dtb__458, dtb__459) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dcountLams dtb__459))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__460, dtb__461, dtb__462) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__460) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__461)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__462))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__463, dtb__464) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__463) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree mc0) dtb__464))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__465, dtb__466, dtb__467, dtb__468, dtb__469) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__465) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__469))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__470, dtb__471, dtb__472, dtb__473, dtb__474) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__470)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__475, dtb__476) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__476)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__477, dtb__478) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__478)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__479, dtb__480, dtb__481) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__479) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__480))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__482, dtb__483, dtb__484) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + 1)) dtb__484)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__485, dtb__486, dtb__487, dtb__488, dtb__489) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__488) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + 1)) dtb__489))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__490, dtb__491) -> (dtb__491 >= mc0)
  | _ -> false
))
and v_Vuna_dCompiler_dCore_dTerm_danyPairFree = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__492, dtb__493) -> (match dtb__492 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__494; Base_dPair.f_Base_dPair_dPair_second = dtb__495 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__494) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__493))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_danyAltFree = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__496, dtb__497) -> (match dtb__496 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__498; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__499; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__500 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + (Base_dList.v_Base_dList_dlength dtb__499))) dtb__500) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree mc0) dtb__497))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__501, dtb__502, dtb__503) -> (if (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__501) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__502)) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__503))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__504, dtb__505) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__504) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts dtb__505))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__506, dtb__507, dtb__508, dtb__509, dtb__510) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__506) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__510))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__511, dtb__512, dtb__513, dtb__514, dtb__515) -> (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__511)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__516, dtb__517) -> (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__517)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__518, dtb__519) -> (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__519)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__520, dtb__521, dtb__522) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__520) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__521))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__523, dtb__524, dtb__525) -> (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__525)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__526, dtb__527, dtb__528, dtb__529, dtb__530) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__529) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__530))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__531, dtb__532) -> (dtb__532 < 0)
  | _ -> false
))
and v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__533, dtb__534) -> (match dtb__533 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__535; Base_dPair.f_Base_dPair_dPair_second = dtb__536 } -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__535) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__534))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__537, dtb__538) -> (match dtb__537 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__539; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__540; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__541 } -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__541) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts dtb__538))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel = (fun fuel sols v -> (if (fuel <= 0) then false else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__542, dtb__543) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__542) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__544) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__544)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__545) -> (match dtb__545 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__546, dtb__547, dtb__548) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__548)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__549, dtb__550) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__550)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__551, dtb__552, dtb__553, dtb__554, dtb__555) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__554) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__555))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__556, dtb__557, dtb__558) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__558)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__559, dtb__560) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__560)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__561, dtb__562) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__561) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__562))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__563, dtb__564) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__563)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (dtb__565, dtb__566, dtb__567, dtb__568, dtb__569) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__565)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__570, dtb__571, dtb__572) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__570) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__571)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__572))
  | _ -> false
)))
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel = (fun fuel sols vs -> (if (fuel <= 0) then false else (match vs with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__573, dtb__574) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__573) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__574))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel = (fun fuel sols clo -> (if (fuel <= 0) then false else (match clo with
  | { f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = dtb__575; f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__576 } -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__575)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue = (fun sols v -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel 64) sols) v))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaList = (fun sols vs -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel 64) sols) vs))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaClo = (fun sols clo -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel 64) sols) clo))

let v_Vuna_dCompiler_dCore_dTerm_disTypeValue = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__577) -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__578) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__578))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let rec v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__579) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__580) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__581) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__582) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__583) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__584, dtb__585, dtb__586) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__584) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__585)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__586))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (dtb__587, dtb__588, dtb__589, dtb__590, dtb__591) -> (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__587)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__592, dtb__593) -> (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__592)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__594, dtb__595) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__594) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__595))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__596, dtb__597) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__597)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__598, dtb__599) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__599)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__600, dtb__601, dtb__602) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo mc0) dtb__602)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__603, dtb__604, dtb__605, dtb__606, dtb__607) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__606) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo mc0) dtb__607))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__608) -> (match dtb__608 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__609, dtb__610, dtb__611) -> (if (dtb__610 >= mc0) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__611))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__612, dtb__613) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__613)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__614, dtb__615) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) 0) dtb__614) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__615))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = dtb__616; f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__617 } -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__616)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowBinders = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__618, dtb__619) -> (match dtb__618 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__620; Base_dPair.f_Base_dPair_dPair_second = dtb__621 } -> (String.concat "" [" "; dtb__620; (v_Vuna_dCompiler_dCore_dTerm_dshowBinders dtb__619)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__622, dtb__623) -> (if (dtb__622 = 34) then ("\\\"" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__623)) else (if (dtb__622 = 92) then ("\\\\" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__623)) else (if (dtb__622 = 10) then ("\\n" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__623)) else (if (dtb__622 = 9) then ("\\t" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__623)) else (if (dtb__622 = 13) then ("\\r" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__623)) else ((Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Cons (dtb__622, Base_dList.C_Base_dList_dList_Nil))) ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__623)))))))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dshowCoreString = (fun s -> (String.concat "" ["\""; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars (Base_dList.dtp_unpack s)); "\""]))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowTerm = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__624, dtb__625, dtb__626) -> (String.concat "" ["if "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__624); " then "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__625); " else "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__626)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__627) -> (if dtb__627 then "True" else "False")
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__628) -> dtb__628
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__629) -> (v_Vuna_dCompiler_dCore_dTerm_dshowCoreString dtb__629)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__630) -> (bi_strFromInt dtb__630)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__631, dtb__632) -> (String.concat "" ["case "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__631); " of "; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__632)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__633, dtb__634, dtb__635, dtb__636, dtb__637) -> (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__633); " with "; dtb__634; " "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__637)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__638, dtb__639, dtb__640, dtb__641, dtb__642) -> (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__638); "."; dtb__639; "#"; (bi_strFromInt dtb__642)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__643, dtb__644) -> (String.concat "" ["("; dtb__643; (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__644); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__645, dtb__646) -> (String.concat "" ["("; dtb__645; (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__646); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__647, dtb__648, dtb__649) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__647); " "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__648); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__650, dtb__651, dtb__652) -> (String.concat "" ["\\"; dtb__650; " => "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__652)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__653, dtb__654, dtb__655, dtb__656, dtb__657) -> (if (dtb__653 = "_") then (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__656); " -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__657)]) else (if dtb__654 then (String.concat "" ["{"; dtb__653; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__656); "} -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__657)]) else (String.concat "" ["("; dtb__653; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__656); ") -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__657)])))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__658) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__658) = 0) then "Type" else ("Type " ^ (bi_strFromInt (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__658))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__659) -> dtb__659
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__660) -> ("?" ^ (bi_strFromInt dtb__660))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__661, dtb__662) -> dtb__661
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__663, dtb__664) -> (match dtb__663 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__665; Base_dPair.f_Base_dPair_dPair_second = dtb__666 } -> (String.concat "" [" "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__665); (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__664)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__667, dtb__668) -> (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__667); (v_Vuna_dCompiler_dCore_dTerm_dshowBinders (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__667)); " => "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__667)); " | "; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__668)])
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__669, dtb__670) -> (match dtb__670 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__669
  | _ -> (String.concat "" ["("; dtb__669; (v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs dtb__670); ")"])
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__671, dtb__672, dtb__673) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__671); " "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__672); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__674, dtb__675, dtb__676, dtb__677, dtb__678) -> (if (dtb__674 = "_") then (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__677); " -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__678)]) else (if dtb__675 then (String.concat "" ["{"; dtb__674; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__677); "} -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__678)]) else (String.concat "" ["("; dtb__674; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__677); ") -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__678)])))
  | _ -> (v_Vuna_dCompiler_dCore_dTerm_dshowTerm mc0)
))
and v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__679, dtb__680, dtb__681, dtb__682, dtb__683) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__679, dtb__680, dtb__681, dtb__682, dtb__683))); ")"])
  | _ -> (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig mc0)
))
and v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__684, dtb__685) -> (match dtb__684 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__686; Base_dPair.f_Base_dPair_dPair_second = dtb__687 } -> (String.concat "" [" "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__686); (v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs dtb__685)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
