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

let v_Vuna_dCompiler_dCore_dTerm_dmetaLookup = (fun i t -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) i) t))

let rec v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__17, dtb__18) -> (match dtb__17 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__19, dtb__20) -> (if (mc0 = dtb__19) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__20)) else ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList mc0) dtb__18))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty = (C_Vuna_dCompiler_dCore_dTerm_dSols_Sols (((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil), Base_dList.C_Base_dList_dList_Nil, ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil), ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dCore_dTerm_dsolsFromList = (fun xs -> (C_Vuna_dCompiler_dCore_dTerm_dSols_Sols ((((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dInt.v_Hashable_uInt) xs) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil)), xs, ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil), ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil))))

let v_Vuna_dCompiler_dCore_dTerm_dsolsOf = (fun t xs d dv -> (C_Vuna_dCompiler_dCore_dTerm_dSols_Sols (t, xs, d, dv)))

let v_Vuna_dCompiler_dCore_dTerm_dsolsList = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Sols (dtb__21, dtb__22, dtb__23, dtb__24) -> dtb__22
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsPutDefVals = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Sols (dtb__25, dtb__26, dtb__27, dtb__28) -> (C_Vuna_dCompiler_dCore_dTerm_dSols_Sols (dtb__25, dtb__26, dtb__27, mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsDepth = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Sols (dtb__29, dtb__30, dtb__31, dtb__32) -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) mc0) dtb__31)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsLookup = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Sols (dtb__33, dtb__34, dtb__35, dtb__36) -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) mc0) dtb__33)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsCons = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Sols (dtb__37, dtb__38, dtb__39, dtb__40) -> (C_Vuna_dCompiler_dCore_dTerm_dSols_Sols (((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dInt.v_Hashable_uInt) mc0) mc1) dtb__37), (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (mc0, mc1)), dtb__38)), dtb__39, dtb__40))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__41, dtb__42, dtb__43) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__41) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__42)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__43))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__44) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__45) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__46) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__47) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__48, dtb__49) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__48) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts mc0) dtb__49))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__50, dtb__51) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__51)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__52, dtb__53, dtb__54) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__52) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__53))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__55, dtb__56, dtb__57) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__57)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__58, dtb__59, dtb__60, dtb__61, dtb__62) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__61) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__62))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__63) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__64) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__65, dtb__66) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__67) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__67) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__68) -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__69, dtb__70) -> (match dtb__69 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__71, dtb__72) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__71) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__70))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__73, dtb__74) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__73)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts mc0) dtb__74))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__75, dtb__76, dtb__77) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__75) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__76)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__77))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__78) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__79) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__80) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__81, dtb__82) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__81) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat mc0) dtb__82))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__83, dtb__84) -> ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__84)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__85, dtb__86, dtb__87) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__85) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__86))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__88, dtb__89, dtb__90) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__90)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__91, dtb__92, dtb__93, dtb__94, dtb__95) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__94) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__95))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__96) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__97) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__98, dtb__99) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__100) -> ((Base_dList.v_Base_dList_dmemName dtb__100) mc0)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__101) -> true
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__102, dtb__103) -> (match dtb__102 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__104, dtb__105) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__104) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__103))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__106, dtb__107) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__106)) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat mc0) dtb__107))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__108, dtb__109, dtb__110) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__108)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__109)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__110)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__111) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__112) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__113) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__114, dtb__115) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__114)) ((Base_dList.v_Base_dList_dconcatMap (fun a -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody a)))) dtb__115))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__116, dtb__117) -> ((Base_dList.v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (Base_dPair.v_Base_dPair_dfirstOf p)))) dtb__117)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__118, dtb__119, dtb__120) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__118)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__119))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__121, dtb__122, dtb__123) -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__123)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__124, dtb__125, dtb__126, dtb__127, dtb__128) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__127)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__128))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__129) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__130) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__131, dtb__132) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__133) -> (Base_dList.C_Base_dList_dList_Cons (dtb__133, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__134) -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dlookupPair = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__135, dtb__136) -> (match dtb__135 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__137, dtb__138) -> (if (dtb__137 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__138)) else ((v_Vuna_dCompiler_dCore_dTerm_dlookupPair mc0) dtb__136))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__139, dtb__140) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dlookupPair dtb__139) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__141) -> (Base_dList.C_Base_dList_dList_Cons (dtb__141, ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc0) dtb__140)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc0) dtb__140)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__142, dtb__143) -> (if (mc0 <= 0) then false else (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc2) dtb__142) then true else ((((v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel (mc0 - 1)) mc1) mc2) ((Base_dList.v_Base_dList_dappend dtb__143) ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc1) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__142))))))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dtermReachesFloat = (fun defs names t -> ((((v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel 4096) defs) names) (Base_dList.C_Base_dList_dList_Cons (t, Base_dList.C_Base_dList_dList_Nil))))

let v_Vuna_dCompiler_dCore_dTerm_ddefLookup = (fun name tbl -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) tbl))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__144, dtb__145, dtb__146) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__144) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__145)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__146))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__147) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__148) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__149) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__150) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__151, dtb__152) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__151) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts mc0) dtb__152))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__153, dtb__154) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__154)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__155, dtb__156, dtb__157) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__155) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__156))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__158, dtb__159, dtb__160) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + 1)) dtb__160)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__161, dtb__162, dtb__163, dtb__164, dtb__165) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__164) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + 1)) dtb__165))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__166) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__167) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__168) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__169, dtb__170) -> (dtb__170 >= mc0)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__171, dtb__172) -> (match dtb__171 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__173, dtb__174) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__173) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__172))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__175, dtb__176) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__175)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__175)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts mc0) dtb__176))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasMeta = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__177, dtb__178, dtb__179) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__177) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__178)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__179))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__180) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__181) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__182) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__183) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__184, dtb__185) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__184) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts mc0) mc1) dtb__185))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__186, dtb__187) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__187)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__188, dtb__189, dtb__190) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__188) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__189))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__191, dtb__192, dtb__193) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + 1)) dtb__193)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__194, dtb__195, dtb__196, dtb__197, dtb__198) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__197) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + 1)) dtb__198))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__199) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__200) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__201, dtb__202) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__203) -> (mc0 = dtb__203)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__204, dtb__205) -> (match dtb__204 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__206, dtb__207) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__206) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__205))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__208, dtb__209) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__208)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__208)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts mc0) mc1) dtb__209))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dshift = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__210, dtb__211, dtb__212) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__210), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__211), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__212)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__213) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__214) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__215) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__216) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__217, dtb__218) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__217), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts mc0) mc1) dtb__218)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__219, dtb__220) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__219, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__220)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__221, dtb__222, dtb__223) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__221), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__222), dtb__223))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__224, dtb__225, dtb__226) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__224, dtb__225, (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + 1)) mc1) dtb__226)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__227, dtb__228, dtb__229, dtb__230, dtb__231) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__227, dtb__228, dtb__229, (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__230), (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + 1)) mc1) dtb__231)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__232) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__233) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__234) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__235, dtb__236) -> (if (dtb__236 >= mc0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__235, (dtb__236 + mc1))) else mc2)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshiftArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__237, dtb__238) -> (match dtb__237 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__239, dtb__240) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__239), dtb__240)), (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__238)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlts = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__241, dtb__242) -> (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dCore_dTerm_dshiftAlt mc0) mc1) dtb__241), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts mc0) mc1) dtb__242)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlt = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__243, dtb__244, dtb__245) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__243, dtb__244, (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + (Base_dList.v_Base_dList_dlength dtb__244))) mc1) dtb__245)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__246, dtb__247, dtb__248) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__246), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__247), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__248)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__249) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__250) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__251) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__252) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__253, dtb__254) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__253), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt mc0) mc1)) dtb__254)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__255, dtb__256) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__255, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Pair ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__256)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__257, dtb__258, dtb__259) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__257), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__258), dtb__259))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__260, dtb__261, dtb__262) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__260, dtb__261, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (mc0 + 1)) mc1) dtb__262)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__263, dtb__264, dtb__265, dtb__266, dtb__267) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__263, dtb__264, dtb__265, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__266), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (mc0 + 1)) mc1) dtb__267)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__268) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__269) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__270) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__271, dtb__272) -> (if (dtb__272 = mc0) then mc1 else mc2)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt = (fun idx arg alt -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt ((v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt), (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (idx + (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)))) arg) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))))

let rec v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__273, dtb__274, dtb__275) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__273), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__274), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__275)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__276, dtb__277) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__276), ((Base_dList.v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt mc0) mc1) mc2) mc3)) dtb__277)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__278, dtb__279) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__278, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Pair ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__279)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__280, dtb__281, dtb__282) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__280), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__281), dtb__282))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__283, dtb__284, dtb__285) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__283, dtb__284, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__285)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__286, dtb__287, dtb__288, dtb__289, dtb__290) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__286, dtb__287, dtb__288, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__289), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__290)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__291) -> (if (dtb__291 = mc0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (mc1, (mc3 - mc2))) else mc4)
  | _ -> mc4
))
and v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__292, dtb__293, dtb__294) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__292, dtb__293, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + (Base_dList.v_Base_dList_dlength dtb__293))) dtb__294)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar = (fun m name q t -> (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) 0) t))

let rec v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__295, dtb__296, dtb__297, dtb__298, dtb__299) -> (if (mc3 = mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__295, dtb__296, dtb__297, dtb__298, (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (mc0, true, C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, mc2, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__299))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__295, dtb__296, dtb__297, dtb__298, (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo mc0) mc1) mc2) (mc3 + 1)) dtb__299))))
  | _ -> mc4
))

let v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder = (fun name idx dictDom t -> (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo name) idx) dictDom) 0) t))

let v_Vuna_dCompiler_dCore_dTerm_dcutoffOf = (fun total idx -> (if ((total - (idx + 1)) <= 0) then 0 else (total - (idx + 1))))

let rec v_Vuna_dCompiler_dCore_dTerm_dcountPis = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__300, dtb__301, dtb__302, dtb__303, dtb__304) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dcountPis dtb__304))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__305, dtb__306, dtb__307) -> (if (mc2 = mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__305, dtb__306, (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (mc0, C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__307))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__305, dtb__306, ((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo mc0) mc1) (mc2 + 1)) dtb__307))))
  | _ -> mc3
))

let v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder = (fun name idx t -> ((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo name) idx) 0) t))

let rec v_Vuna_dCompiler_dCore_dTerm_dcountLams = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__308, dtb__309, dtb__310) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dcountLams dtb__310))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__311, dtb__312, dtb__313) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__311) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__312)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__313))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__314, dtb__315) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__314) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree mc0) dtb__315))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__316, dtb__317) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__317)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__318, dtb__319, dtb__320) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__318) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__319))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__321, dtb__322, dtb__323) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + 1)) dtb__323)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__324, dtb__325, dtb__326, dtb__327, dtb__328) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__327) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + 1)) dtb__328))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__329, dtb__330) -> (dtb__330 >= mc0)
  | _ -> false
))
and v_Vuna_dCompiler_dCore_dTerm_danyPairFree = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__331, dtb__332) -> (match dtb__331 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__333, dtb__334) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__333) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__332))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_danyAltFree = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__335, dtb__336) -> (match dtb__335 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__337, dtb__338, dtb__339) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + (Base_dList.v_Base_dList_dlength dtb__338))) dtb__339) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree mc0) dtb__336))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__340, dtb__341, dtb__342) -> (if (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__340) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__341)) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__342))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__343, dtb__344) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__343) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts dtb__344))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__345, dtb__346) -> (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__346)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__347, dtb__348, dtb__349) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__347) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__348))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__350, dtb__351, dtb__352) -> (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__352)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__353, dtb__354, dtb__355, dtb__356, dtb__357) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__356) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__357))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__358, dtb__359) -> (dtb__359 < 0)
  | _ -> false
))
and v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__360, dtb__361) -> (match dtb__360 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__362, dtb__363) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__362) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__361))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__364, dtb__365) -> (match dtb__364 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__366, dtb__367, dtb__368) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__368) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts dtb__365))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel = (fun fuel sols v -> (if (fuel <= 0) then false else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__369, dtb__370) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__369) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__371) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__371)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__372) -> (match dtb__372 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__373, dtb__374, dtb__375) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__375)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__376, dtb__377) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__377)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__378, dtb__379, dtb__380, dtb__381, dtb__382) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__381) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__382))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__383, dtb__384, dtb__385) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__385)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__386, dtb__387) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__387)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__388, dtb__389) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__388) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__389))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__390, dtb__391) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__390)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__392, dtb__393, dtb__394) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__392) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__393)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__394))
  | _ -> false
)))
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel = (fun fuel sols vs -> (if (fuel <= 0) then false else (match vs with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__395, dtb__396) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__395) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__396))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel = (fun fuel sols clo -> (if (fuel <= 0) then false else (match clo with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure (dtb__397, dtb__398) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__397)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue = (fun sols v -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel 64) sols) v))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaList = (fun sols vs -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel 64) sols) vs))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaClo = (fun sols clo -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel 64) sols) clo))

let v_Vuna_dCompiler_dCore_dTerm_disTypeValue = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__399) -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__400) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__400))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let rec v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__401) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__402) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__403) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__404) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__405) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__406, dtb__407, dtb__408) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__406) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__407)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__408))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__409, dtb__410) -> (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__409)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__411, dtb__412) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__411) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__412))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__413, dtb__414) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__414)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__415, dtb__416) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__416)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__417, dtb__418, dtb__419) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo mc0) dtb__419)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__420, dtb__421, dtb__422, dtb__423, dtb__424) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__423) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo mc0) dtb__424))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__425) -> (match dtb__425 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__426, dtb__427, dtb__428) -> (if (dtb__427 >= mc0) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__428))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__429, dtb__430) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__430)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__431, dtb__432) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) 0) dtb__431) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__432))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure (dtb__433, dtb__434) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__433)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowBinders = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__435, dtb__436) -> (match dtb__435 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__437, dtb__438) -> (String.concat "" [" "; dtb__437; (v_Vuna_dCompiler_dCore_dTerm_dshowBinders dtb__436)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__439, dtb__440) -> (if (dtb__439 = 34) then ("\\\"" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__440)) else (if (dtb__439 = 92) then ("\\\\" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__440)) else (if (dtb__439 = 10) then ("\\n" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__440)) else (if (dtb__439 = 9) then ("\\t" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__440)) else (if (dtb__439 = 13) then ("\\r" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__440)) else ((Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Cons (dtb__439, Base_dList.C_Base_dList_dList_Nil))) ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__440)))))))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dshowCoreString = (fun s -> (String.concat "" ["\""; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars (Base_dList.dtp_unpack s)); "\""]))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowTerm = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__441, dtb__442, dtb__443) -> (String.concat "" ["if "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__441); " then "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__442); " else "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__443)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__444) -> (if dtb__444 then "True" else "False")
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__445) -> dtb__445
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__446) -> (v_Vuna_dCompiler_dCore_dTerm_dshowCoreString dtb__446)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__447) -> (bi_strFromInt dtb__447)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__448, dtb__449) -> (String.concat "" ["case "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__448); " of "; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__449)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__450, dtb__451) -> (String.concat "" ["("; dtb__450; (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__451); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__452, dtb__453, dtb__454) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__452); " "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__453); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__455, dtb__456, dtb__457) -> (String.concat "" ["\\"; dtb__455; " => "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__457)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__458, dtb__459, dtb__460, dtb__461, dtb__462) -> (if (dtb__458 = "_") then (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__461); " -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__462)]) else (if dtb__459 then (String.concat "" ["{"; dtb__458; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__461); "} -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__462)]) else (String.concat "" ["("; dtb__458; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__461); ") -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__462)])))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__463) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__463) = 0) then "Type" else ("Type " ^ (bi_strFromInt (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__463))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__464) -> dtb__464
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__465) -> ("?" ^ (bi_strFromInt dtb__465))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__466, dtb__467) -> dtb__466
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__468, dtb__469) -> (match dtb__468 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__470, dtb__471) -> (String.concat "" [" "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__470); (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__469)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__472, dtb__473) -> (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__472); (v_Vuna_dCompiler_dCore_dTerm_dshowBinders (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__472)); " => "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__472)); " | "; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__473)])
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__474, dtb__475) -> (match dtb__475 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__474
  | _ -> (String.concat "" ["("; dtb__474; (v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs dtb__475); ")"])
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__476, dtb__477, dtb__478) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__476); " "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__477); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__479, dtb__480, dtb__481, dtb__482, dtb__483) -> (if (dtb__479 = "_") then (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__482); " -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__483)]) else (if dtb__480 then (String.concat "" ["{"; dtb__479; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__482); "} -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__483)]) else (String.concat "" ["("; dtb__479; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__482); ") -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__483)])))
  | _ -> (v_Vuna_dCompiler_dCore_dTerm_dshowTerm mc0)
))
and v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__484, dtb__485, dtb__486, dtb__487, dtb__488) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__484, dtb__485, dtb__486, dtb__487, dtb__488))); ")"])
  | _ -> (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig mc0)
))
and v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__489, dtb__490) -> (match dtb__489 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__491, dtb__492) -> (String.concat "" [" "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__491); (v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs dtb__490)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
