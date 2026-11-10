open Vuna_runtime
type t_Vuna_dCompiler_dCore_dTerm_dRig = C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 | C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
and t_Vuna_dCompiler_dCore_dTerm_dLevel = int
and t_Vuna_dCompiler_dCore_dTerm_dTerm = C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar of (string) * (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta of (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal of (string) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType of (t_Vuna_dCompiler_dCore_dTerm_dLevel) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi of (string) * (bool) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam of (string) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dRig) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon of (string) * ((t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt of (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr of (string) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool of (bool) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat of (string)
and t_Vuna_dCompiler_dCore_dTerm_dCaseAlt = C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt of (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dCore_dTerm_dClosure = C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure of (t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dCore_dTerm_dNeutral = C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar of (string) * (int) * (t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal of (string) * (t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dCore_dTerm_dValue = C_Vuna_dCompiler_dCore_dTerm_dValue_VType of (t_Vuna_dCompiler_dCore_dTerm_dLevel) | C_Vuna_dCompiler_dCore_dTerm_dValue_VPi of (string) * (bool) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dClosure) | C_Vuna_dCompiler_dCore_dTerm_dValue_VLam of (string) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dClosure) | C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral of (t_Vuna_dCompiler_dCore_dTerm_dNeutral) | C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta of (int) * (t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dValue_VApp of (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dValue) | C_Vuna_dCompiler_dCore_dTerm_dValue_VCon of (string) * (t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dValue_VCase of (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dVCaseAlt Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dValue_VInt of (int) | C_Vuna_dCompiler_dCore_dTerm_dValue_VStr of (string) | C_Vuna_dCompiler_dCore_dTerm_dValue_VBool of (bool) | C_Vuna_dCompiler_dCore_dTerm_dValue_VIf of (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dValue) | C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat of (string)
and t_Vuna_dCompiler_dCore_dTerm_dVCaseAlt = C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt of (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dClosure)
and t_Vuna_dCompiler_dCore_dTerm_dSols = C_Vuna_dCompiler_dCore_dTerm_dSols_Sols of ((int, t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((int, t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * ((int, int) Base_dHashMap.t_Base_dHashMap_dHashMap) * ((string, t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dHashMap.t_Base_dHashMap_dHashMap)

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
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__8, dtb__9, dtb__10) -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__11, dtb__12, dtb__13) -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__14, dtb__15, dtb__16) -> dtb__16
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel = 512

let v_Vuna_dCompiler_dCore_dTerm_dnatChainMax = 4611686018427387903

let v_Vuna_dCompiler_dCore_dTerm_dnatChainNext = (fun n -> (if (n >= v_Vuna_dCompiler_dCore_dTerm_dnatChainMax) then v_Vuna_dCompiler_dCore_dTerm_dnatChainMax else (n + 1)))

let rec v_Vuna_dCompiler_dCore_dTerm_dflattenTermAppGo = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__17, dtb__18, dtb__19) -> ((v_Vuna_dCompiler_dCore_dTerm_dflattenTermAppGo dtb__17) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__18, dtb__19)), mc1)))
  | _ -> (Base_dPair.C_Base_dPair_dPair_Pair (mc0, mc1))
))

let v_Vuna_dCompiler_dCore_dTerm_dflattenTermApp = (fun t -> ((v_Vuna_dCompiler_dCore_dTerm_dflattenTermAppGo t) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dCore_dTerm_dnatChainGo = (fun fuel t -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match (v_Vuna_dCompiler_dCore_dTerm_dflattenTermApp t) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__20, dtb__21) -> (match dtb__20 with
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
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__27, dtb__28) -> (match dtb__26 with
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
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__37, dtb__38) -> ((1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__37)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeAlts dtb__38))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__39, dtb__40) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs dtb__40))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__41, dtb__42, dtb__43) -> ((1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__41)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__42))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__44, dtb__45, dtb__46) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__46))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__47, dtb__48, dtb__49, dtb__50, dtb__51) -> ((1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__50)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__51))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__52) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__53) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__54) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__55, dtb__56) -> 1
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__57, dtb__58) -> (match dtb__57 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__59, dtb__60) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__59) + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs dtb__58))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dtermSizeAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__61, dtb__62) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermSize (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__61)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeAlts dtb__62))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dmetaLookup = (fun i t -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) i) t))

let rec v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__63, dtb__64) -> (match dtb__63 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__65, dtb__66) -> (if (mc0 = dtb__65) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__66)) else ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList mc0) dtb__64))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty = (C_Vuna_dCompiler_dCore_dTerm_dSols_Sols (((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil), Base_dList.C_Base_dList_dList_Nil, ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil), ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dCore_dTerm_dsolsFromList = (fun xs -> (C_Vuna_dCompiler_dCore_dTerm_dSols_Sols ((((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dInt.v_Hashable_uInt) xs) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil)), xs, ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil), ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil))))

let v_Vuna_dCompiler_dCore_dTerm_dsolsOf = (fun t xs d dv -> (C_Vuna_dCompiler_dCore_dTerm_dSols_Sols (t, xs, d, dv)))

let v_Vuna_dCompiler_dCore_dTerm_dsolsList = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Sols (dtb__67, dtb__68, dtb__69, dtb__70) -> dtb__68
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsPutDefVals = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Sols (dtb__71, dtb__72, dtb__73, dtb__74) -> (C_Vuna_dCompiler_dCore_dTerm_dSols_Sols (dtb__71, dtb__72, dtb__73, mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsDepth = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Sols (dtb__75, dtb__76, dtb__77, dtb__78) -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) mc0) dtb__77)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsLookup = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Sols (dtb__79, dtb__80, dtb__81, dtb__82) -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) mc0) dtb__79)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsCons = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Sols (dtb__83, dtb__84, dtb__85, dtb__86) -> (C_Vuna_dCompiler_dCore_dTerm_dSols_Sols (((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dInt.v_Hashable_uInt) mc0) mc1) dtb__83), (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (mc0, mc1)), dtb__84)), dtb__85, dtb__86))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__87, dtb__88, dtb__89) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__87) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__88)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__89))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__90) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__91) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__92) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__93) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__94, dtb__95) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__94) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts mc0) dtb__95))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__96, dtb__97) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__97)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__98, dtb__99, dtb__100) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__98) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__99))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__101, dtb__102, dtb__103) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__103)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__104, dtb__105, dtb__106, dtb__107, dtb__108) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__107) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__108))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__109) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__110) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__111, dtb__112) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__113) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__113) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__114) -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__115, dtb__116) -> (match dtb__115 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__117, dtb__118) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__117) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__116))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__119, dtb__120) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__119)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts mc0) dtb__120))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__121, dtb__122, dtb__123) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__121) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__122)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__123))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__124) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__125) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__126) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__127, dtb__128) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__127) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat mc0) dtb__128))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__129, dtb__130) -> ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__130)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__131, dtb__132, dtb__133) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__131) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__132))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__134, dtb__135, dtb__136) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__136)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__137, dtb__138, dtb__139, dtb__140, dtb__141) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__140) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__141))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__142) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__143) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__144, dtb__145) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__146) -> ((Base_dList.v_Base_dList_dmemName dtb__146) mc0)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__147) -> true
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__148, dtb__149) -> (match dtb__148 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__150, dtb__151) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__150) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__149))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__152, dtb__153) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__152)) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat mc0) dtb__153))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__154, dtb__155, dtb__156) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__154)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__155)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__156)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__157) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__158) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__159) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__160, dtb__161) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__160)) ((Base_dList.v_Base_dList_dconcatMap (fun a -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody a)))) dtb__161))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__162, dtb__163) -> ((Base_dList.v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (Base_dPair.v_Base_dPair_dfirstOf p)))) dtb__163)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__164, dtb__165, dtb__166) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__164)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__165))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__167, dtb__168, dtb__169) -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__169)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__170, dtb__171, dtb__172, dtb__173, dtb__174) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__173)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__174))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__175) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__176) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__177, dtb__178) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__179) -> (Base_dList.C_Base_dList_dList_Cons (dtb__179, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__180) -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dlookupPair = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__181, dtb__182) -> (match dtb__181 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__183, dtb__184) -> (if (dtb__183 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__184)) else ((v_Vuna_dCompiler_dCore_dTerm_dlookupPair mc0) dtb__182))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__185, dtb__186) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dlookupPair dtb__185) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__187) -> (Base_dList.C_Base_dList_dList_Cons (dtb__187, ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc0) dtb__186)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc0) dtb__186)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__188, dtb__189) -> (if (mc0 <= 0) then false else (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc2) dtb__188) then true else ((((v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel (mc0 - 1)) mc1) mc2) ((Base_dList.v_Base_dList_dappend dtb__189) ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc1) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__188))))))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dtermReachesFloat = (fun defs names t -> ((((v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel 4096) defs) names) (Base_dList.C_Base_dList_dList_Cons (t, Base_dList.C_Base_dList_dList_Nil))))

let v_Vuna_dCompiler_dCore_dTerm_ddefLookup = (fun name tbl -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) tbl))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__190, dtb__191, dtb__192) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__190) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__191)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__192))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__193) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__194) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__195) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__196) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__197, dtb__198) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__197) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts mc0) dtb__198))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__199, dtb__200) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__200)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__201, dtb__202, dtb__203) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__201) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__202))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__204, dtb__205, dtb__206) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + 1)) dtb__206)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__207, dtb__208, dtb__209, dtb__210, dtb__211) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__210) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + 1)) dtb__211))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__212) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__213) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__214) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__215, dtb__216) -> (dtb__216 >= mc0)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__217, dtb__218) -> (match dtb__217 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__219, dtb__220) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__219) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__218))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__221, dtb__222) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__221)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__221)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts mc0) dtb__222))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasMeta = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__223, dtb__224, dtb__225) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__223) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__224)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__225))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__226) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__227) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__228) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__229) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__230, dtb__231) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__230) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts mc0) mc1) dtb__231))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__232, dtb__233) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__233)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__234, dtb__235, dtb__236) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__234) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__235))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__237, dtb__238, dtb__239) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + 1)) dtb__239)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__240, dtb__241, dtb__242, dtb__243, dtb__244) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__243) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + 1)) dtb__244))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__245) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__246) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__247, dtb__248) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__249) -> (mc0 = dtb__249)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__250, dtb__251) -> (match dtb__250 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__252, dtb__253) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__252) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__251))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__254, dtb__255) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__254)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__254)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts mc0) mc1) dtb__255))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dshift = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__256, dtb__257, dtb__258) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__256), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__257), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__258)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__259) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__260) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__261) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__262) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__263, dtb__264) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__263), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts mc0) mc1) dtb__264)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__265, dtb__266) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__265, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__266)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__267, dtb__268, dtb__269) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__267), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__268), dtb__269))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__270, dtb__271, dtb__272) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__270, dtb__271, (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + 1)) mc1) dtb__272)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__273, dtb__274, dtb__275, dtb__276, dtb__277) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__273, dtb__274, dtb__275, (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__276), (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + 1)) mc1) dtb__277)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__278) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__279) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__280) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__281, dtb__282) -> (if (dtb__282 >= mc0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__281, (dtb__282 + mc1))) else mc2)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshiftArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__283, dtb__284) -> (match dtb__283 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__285, dtb__286) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__285), dtb__286)), (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__284)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlts = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__287, dtb__288) -> (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dCore_dTerm_dshiftAlt mc0) mc1) dtb__287), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts mc0) mc1) dtb__288)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlt = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__289, dtb__290, dtb__291) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__289, dtb__290, (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + (Base_dList.v_Base_dList_dlength dtb__290))) mc1) dtb__291)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__292, dtb__293, dtb__294) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__292), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__293), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__294)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__295) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__296) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__297) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__298) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__299, dtb__300) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__299), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt mc0) mc1)) dtb__300)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__301, dtb__302) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__301, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Pair ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__302)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__303, dtb__304, dtb__305) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__303), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__304), dtb__305))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__306, dtb__307, dtb__308) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__306, dtb__307, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (mc0 + 1)) mc1) dtb__308)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__309, dtb__310, dtb__311, dtb__312, dtb__313) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__309, dtb__310, dtb__311, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__312), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (mc0 + 1)) mc1) dtb__313)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__314) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__315) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__316) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__317, dtb__318) -> (if (dtb__318 = mc0) then mc1 else mc2)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt = (fun idx arg alt -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt ((v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt), (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (idx + (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)))) arg) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))))

let rec v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__319, dtb__320, dtb__321) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__319), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__320), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__321)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__322, dtb__323) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__322), ((Base_dList.v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt mc0) mc1) mc2) mc3)) dtb__323)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__324, dtb__325) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__324, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Pair ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__325)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__326, dtb__327, dtb__328) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__326), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__327), dtb__328))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__329, dtb__330, dtb__331) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__329, dtb__330, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__331)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__332, dtb__333, dtb__334, dtb__335, dtb__336) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__332, dtb__333, dtb__334, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__335), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__336)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__337) -> (if (dtb__337 = mc0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (mc1, (mc3 - mc2))) else mc4)
  | _ -> mc4
))
and v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__338, dtb__339, dtb__340) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__338, dtb__339, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + (Base_dList.v_Base_dList_dlength dtb__339))) dtb__340)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar = (fun m name q t -> (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) 0) t))

let rec v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__341, dtb__342, dtb__343, dtb__344, dtb__345) -> (if (mc3 = mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__341, dtb__342, dtb__343, dtb__344, (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (mc0, true, C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, mc2, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__345))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__341, dtb__342, dtb__343, dtb__344, (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo mc0) mc1) mc2) (mc3 + 1)) dtb__345))))
  | _ -> mc4
))

let v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder = (fun name idx dictDom t -> (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo name) idx) dictDom) 0) t))

let v_Vuna_dCompiler_dCore_dTerm_dcutoffOf = (fun total idx -> (if ((total - (idx + 1)) <= 0) then 0 else (total - (idx + 1))))

let rec v_Vuna_dCompiler_dCore_dTerm_dcountPis = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__346, dtb__347, dtb__348, dtb__349, dtb__350) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dcountPis dtb__350))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__351, dtb__352, dtb__353) -> (if (mc2 = mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__351, dtb__352, (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (mc0, C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__353))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__351, dtb__352, ((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo mc0) mc1) (mc2 + 1)) dtb__353))))
  | _ -> mc3
))

let v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder = (fun name idx t -> ((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo name) idx) 0) t))

let rec v_Vuna_dCompiler_dCore_dTerm_dcountLams = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__354, dtb__355, dtb__356) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dcountLams dtb__356))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__357, dtb__358, dtb__359) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__357) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__358)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__359))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__360, dtb__361) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__360) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree mc0) dtb__361))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__362, dtb__363) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__363)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__364, dtb__365, dtb__366) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__364) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__365))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__367, dtb__368, dtb__369) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + 1)) dtb__369)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__370, dtb__371, dtb__372, dtb__373, dtb__374) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__373) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + 1)) dtb__374))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__375, dtb__376) -> (dtb__376 >= mc0)
  | _ -> false
))
and v_Vuna_dCompiler_dCore_dTerm_danyPairFree = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__377, dtb__378) -> (match dtb__377 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__379, dtb__380) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__379) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__378))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_danyAltFree = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__381, dtb__382) -> (match dtb__381 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__383, dtb__384, dtb__385) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + (Base_dList.v_Base_dList_dlength dtb__384))) dtb__385) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree mc0) dtb__382))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__386, dtb__387, dtb__388) -> (if (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__386) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__387)) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__388))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__389, dtb__390) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__389) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts dtb__390))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__391, dtb__392) -> (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__392)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__393, dtb__394, dtb__395) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__393) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__394))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__396, dtb__397, dtb__398) -> (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__398)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__399, dtb__400, dtb__401, dtb__402, dtb__403) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__402) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__403))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__404, dtb__405) -> (dtb__405 < 0)
  | _ -> false
))
and v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__406, dtb__407) -> (match dtb__406 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__408, dtb__409) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__408) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__407))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__410, dtb__411) -> (match dtb__410 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__412, dtb__413, dtb__414) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__414) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts dtb__411))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel = (fun fuel sols v -> (if (fuel <= 0) then false else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__415, dtb__416) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__415) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__417) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__417)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__418) -> (match dtb__418 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__419, dtb__420, dtb__421) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__421)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__422, dtb__423) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__423)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__424, dtb__425, dtb__426, dtb__427, dtb__428) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__427) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__428))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__429, dtb__430, dtb__431) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__431)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__432, dtb__433) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__433)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__434, dtb__435) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__434) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__435))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__436, dtb__437) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__436)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__438, dtb__439, dtb__440) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__438) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__439)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__440))
  | _ -> false
)))
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel = (fun fuel sols vs -> (if (fuel <= 0) then false else (match vs with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__441, dtb__442) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__441) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__442))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel = (fun fuel sols clo -> (if (fuel <= 0) then false else (match clo with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure (dtb__443, dtb__444) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__443)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue = (fun sols v -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel 64) sols) v))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaList = (fun sols vs -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel 64) sols) vs))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaClo = (fun sols clo -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel 64) sols) clo))

let v_Vuna_dCompiler_dCore_dTerm_disTypeValue = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__445) -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__446) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__446))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let rec v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__447) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__448) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__449) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__450) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__451) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__452, dtb__453, dtb__454) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__452) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__453)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__454))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__455, dtb__456) -> (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__455)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__457, dtb__458) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__457) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__458))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__459, dtb__460) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__460)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__461, dtb__462) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__462)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__463, dtb__464, dtb__465) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo mc0) dtb__465)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__466, dtb__467, dtb__468, dtb__469, dtb__470) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__469) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo mc0) dtb__470))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__471) -> (match dtb__471 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__472, dtb__473, dtb__474) -> (if (dtb__473 >= mc0) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__474))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__475, dtb__476) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__476)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__477, dtb__478) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) 0) dtb__477) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__478))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure (dtb__479, dtb__480) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__479)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowBinders = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__481, dtb__482) -> (match dtb__481 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__483, dtb__484) -> (String.concat "" [" "; dtb__483; (v_Vuna_dCompiler_dCore_dTerm_dshowBinders dtb__482)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__485, dtb__486) -> (if (dtb__485 = 34) then ("\\\"" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__486)) else (if (dtb__485 = 92) then ("\\\\" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__486)) else (if (dtb__485 = 10) then ("\\n" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__486)) else (if (dtb__485 = 9) then ("\\t" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__486)) else (if (dtb__485 = 13) then ("\\r" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__486)) else ((Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Cons (dtb__485, Base_dList.C_Base_dList_dList_Nil))) ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__486)))))))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dshowCoreString = (fun s -> (String.concat "" ["\""; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars (Base_dList.dtp_unpack s)); "\""]))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowTerm = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__487, dtb__488, dtb__489) -> (String.concat "" ["if "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__487); " then "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__488); " else "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__489)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__490) -> (if dtb__490 then "True" else "False")
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__491) -> dtb__491
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__492) -> (v_Vuna_dCompiler_dCore_dTerm_dshowCoreString dtb__492)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__493) -> (bi_strFromInt dtb__493)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__494, dtb__495) -> (String.concat "" ["case "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__494); " of "; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__495)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__496, dtb__497) -> (String.concat "" ["("; dtb__496; (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__497); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__498, dtb__499, dtb__500) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__498); " "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__499); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__501, dtb__502, dtb__503) -> (String.concat "" ["\\"; dtb__501; " => "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__503)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__504, dtb__505, dtb__506, dtb__507, dtb__508) -> (if (dtb__504 = "_") then (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__507); " -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__508)]) else (if dtb__505 then (String.concat "" ["{"; dtb__504; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__507); "} -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__508)]) else (String.concat "" ["("; dtb__504; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__507); ") -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__508)])))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__509) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__509) = 0) then "Type" else ("Type " ^ (bi_strFromInt (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__509))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__510) -> dtb__510
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__511) -> ("?" ^ (bi_strFromInt dtb__511))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__512, dtb__513) -> dtb__512
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__514, dtb__515) -> (match dtb__514 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__516, dtb__517) -> (String.concat "" [" "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__516); (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__515)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__518, dtb__519) -> (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__518); (v_Vuna_dCompiler_dCore_dTerm_dshowBinders (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__518)); " => "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__518)); " | "; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__519)])
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__520, dtb__521) -> (match dtb__521 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__520
  | _ -> (String.concat "" ["("; dtb__520; (v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs dtb__521); ")"])
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__522, dtb__523, dtb__524) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__522); " "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__523); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__525, dtb__526, dtb__527, dtb__528, dtb__529) -> (if (dtb__525 = "_") then (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__528); " -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__529)]) else (if dtb__526 then (String.concat "" ["{"; dtb__525; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__528); "} -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__529)]) else (String.concat "" ["("; dtb__525; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__528); ") -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__529)])))
  | _ -> (v_Vuna_dCompiler_dCore_dTerm_dshowTerm mc0)
))
and v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__530, dtb__531, dtb__532, dtb__533, dtb__534) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__530, dtb__531, dtb__532, dtb__533, dtb__534))); ")"])
  | _ -> (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig mc0)
))
and v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__535, dtb__536) -> (match dtb__535 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__537, dtb__538) -> (String.concat "" [" "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__537); (v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs dtb__536)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
