open Vuna_runtime
type t_Vuna_dCompiler_dCore_dTerm_dRig = C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1 | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega
and t_Vuna_dCompiler_dCore_dTerm_dLevel = C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dLevel of (int)
and t_Vuna_dCompiler_dCore_dTerm_dTerm = C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar of (string) * (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta of (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal of (string) | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType of (t_Vuna_dCompiler_dCore_dTerm_dLevel) | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi of (string) * (bool) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam of (string) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dRig) | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon of (string) * ((t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt of (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr of (string) | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool of (bool) | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dCore_dTerm_dCaseAlt = C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt of (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dCore_dTerm_dClosure = C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClosure of (t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dCore_dTerm_dNeutral = C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar of (string) * (int) * (t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal of (string) * (t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dCore_dTerm_dValue = C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType of (t_Vuna_dCompiler_dCore_dTerm_dLevel) | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi of (string) * (bool) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dClosure) | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam of (string) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dClosure) | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral of (t_Vuna_dCompiler_dCore_dTerm_dNeutral) | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta of (int) * (t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp of (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dValue) | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon of (string) * (t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase of (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dVCaseAlt Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt of (int) | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr of (string) | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool of (bool) | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf of (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dValue)
and t_Vuna_dCompiler_dCore_dTerm_dVCaseAlt = C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt of (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dClosure)
and t_Vuna_dCompiler_dCore_dTerm_dSols = C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols of (t_Vuna_dCompiler_dCore_dTerm_dValue Base_dIntMap.t_Base_dIntMap_dIntMap) * ((int, t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (int Base_dIntMap.t_Base_dIntMap_dIntMap) * (t_Vuna_dCompiler_dCore_dTerm_dValue Base_dHashMap.t_Base_dHashMap_dHashMap)

let v_Vuna_dCompiler_dCore_dTerm_drigIsErased = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega -> false
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1 -> false
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_drigIsLinear = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1 -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dTerm_drigIsOmega = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dTerm_drigOfBinder = (fun implicit isTypeDom -> (if implicit then C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 else (if isTypeDom then C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 else C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega)))

let v_Vuna_dCompiler_dCore_dTerm_ddefaultExplicitRig = C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega

let v_Vuna_dCompiler_dCore_dTerm_drigAdd = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1 -> C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 -> mc0
  | _ -> C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega
)
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 -> mc1
  | _ -> mc1
)
  | _ -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 -> mc0
  | _ -> C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega
)
))

let v_Vuna_dCompiler_dCore_dTerm_drigScale = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 -> C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0
  | _ -> C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega
)
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 -> C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0
  | _ -> mc1
)
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 -> C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0
  | _ -> C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_drigJoin = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega -> C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega
  | _ -> C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega
)
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega -> C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1 -> C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1
  | _ -> C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega
)
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega -> C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 -> C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0
  | _ -> C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_drigExact = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega -> true
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1 -> true
  | _ -> false
)
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dshowRig = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega -> "\207\137"
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1 -> "1"
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 -> "0"
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dlevelZero = (C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dLevel (0))

let v_Vuna_dCompiler_dCore_dTerm_dlevelSucc = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dLevel (dtb__0) -> (C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dLevel ((dtb__0 + 1)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dlevelMax = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dLevel (dtb__1) -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dLevel (dtb__2) -> (C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dLevel ((if (dtb__1 >= dtb__2) then dtb__1 else dtb__2)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dlevelToInt = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dLevel (dtb__3) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt = (fun n -> (C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dLevel (n)))

let v_Vuna_dCompiler_dCore_dTerm_dlevelEq = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dLevel (dtb__4) -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dLevel (dtb__5) -> (dtb__4 = dtb__5)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dlevelLt = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dLevel (dtb__6) -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dLevel (dtb__7) -> (dtb__6 < dtb__7)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dcaseAltName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__8, dtb__9, dtb__10) -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__11, dtb__12, dtb__13) -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__14, dtb__15, dtb__16) -> dtb__16
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel = 512

let v_Vuna_dCompiler_dCore_dTerm_dmetaLookup = (fun i t -> ((Base_dIntMap.v_Base_dIntMap_dlookup i) t))

let rec v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__17, dtb__18) -> (match dtb__17 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__19, dtb__20) -> (if (mc0 = dtb__19) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__20)) else ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList mc0) dtb__18))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty = (C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols ((Base_dIntMap.v_Base_dIntMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil), Base_dList.C_Base_dList_dList_Base_dList_dNil, (Base_dIntMap.v_Base_dIntMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil), (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)))

let v_Vuna_dCompiler_dCore_dTerm_dsolsFromList = (fun xs -> (C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (((Base_dIntMap.v_Base_dIntMap_dinsertAll xs) (Base_dIntMap.v_Base_dIntMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)), xs, (Base_dIntMap.v_Base_dIntMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil), (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil))))

let v_Vuna_dCompiler_dCore_dTerm_dsolsOf = (fun t xs d dv -> (C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (t, xs, d, dv)))

let v_Vuna_dCompiler_dCore_dTerm_dsolsList = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (dtb__21, dtb__22, dtb__23, dtb__24) -> dtb__22
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsPutDefVals = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (dtb__25, dtb__26, dtb__27, dtb__28) -> (C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (dtb__25, dtb__26, dtb__27, mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsDepth = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (dtb__29, dtb__30, dtb__31, dtb__32) -> ((Base_dIntMap.v_Base_dIntMap_dlookup mc0) dtb__31)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsLookup = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (dtb__33, dtb__34, dtb__35, dtb__36) -> ((Base_dIntMap.v_Base_dIntMap_dlookup mc0) dtb__33)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsCons = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (dtb__37, dtb__38, dtb__39, dtb__40) -> (C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols ((((Base_dIntMap.v_Base_dIntMap_dinsert mc0) mc1) dtb__37), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), dtb__38)), dtb__39, dtb__40))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__41, dtb__42, dtb__43) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__41) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__42)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__43))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__44) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__45) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__46) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__47, dtb__48) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__47) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts mc0) dtb__48))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__49, dtb__50) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__50)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__51, dtb__52, dtb__53) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__51) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__52))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__54, dtb__55, dtb__56) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__56)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__57, dtb__58, dtb__59, dtb__60, dtb__61) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__60) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__61))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__62) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__63) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__64, dtb__65) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__66) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__66) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__67) -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__68, dtb__69) -> (match dtb__68 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__70, dtb__71) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__70) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__69))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__72, dtb__73) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__72)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts mc0) dtb__73))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_ddefLookup = (fun name tbl -> ((Base_dHashMap.v_Base_dHashMap_dlookup name) tbl))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__74, dtb__75, dtb__76) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__74) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__75)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__76))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__77) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__78) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__79) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__80, dtb__81) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__80) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts mc0) dtb__81))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__82, dtb__83) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__83)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__84, dtb__85, dtb__86) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__84) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__85))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__87, dtb__88, dtb__89) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + 1)) dtb__89)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__90, dtb__91, dtb__92, dtb__93, dtb__94) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__93) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + 1)) dtb__94))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__95) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__96) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__97) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__98, dtb__99) -> (dtb__99 >= mc0)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__100, dtb__101) -> (match dtb__100 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__102, dtb__103) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__102) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__101))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__104, dtb__105) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__104)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__104)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts mc0) dtb__105))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasMeta = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__106, dtb__107, dtb__108) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__106) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__107)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__108))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__109) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__110) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__111) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__112, dtb__113) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__112) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts mc0) mc1) dtb__113))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__114, dtb__115) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__115)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__116, dtb__117, dtb__118) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__116) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__117))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__119, dtb__120, dtb__121) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + 1)) dtb__121)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__122, dtb__123, dtb__124, dtb__125, dtb__126) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__125) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + 1)) dtb__126))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__127) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__128) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__129, dtb__130) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__131) -> (mc0 = dtb__131)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__132, dtb__133) -> (match dtb__132 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__134, dtb__135) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__134) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__133))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__136, dtb__137) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__136)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__136)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts mc0) mc1) dtb__137))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dshift = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__138, dtb__139, dtb__140) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__138), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__139), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__140)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__141) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__142) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__143) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__144, dtb__145) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__144), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts mc0) mc1) dtb__145)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__146, dtb__147) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__146, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__147)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__148, dtb__149, dtb__150) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__148), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__149), dtb__150))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__151, dtb__152, dtb__153) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__151, dtb__152, (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + 1)) mc1) dtb__153)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__154, dtb__155, dtb__156, dtb__157, dtb__158) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__154, dtb__155, dtb__156, (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__157), (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + 1)) mc1) dtb__158)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__159) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__160) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__161) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__162, dtb__163) -> (if (dtb__163 >= mc0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__162, (dtb__163 + mc1))) else mc2)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshiftArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__164, dtb__165) -> (match dtb__164 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__166, dtb__167) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__166), dtb__167)), (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__165)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlts = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__168, dtb__169) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((((v_Vuna_dCompiler_dCore_dTerm_dshiftAlt mc0) mc1) dtb__168), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts mc0) mc1) dtb__169)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlt = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__170, dtb__171, dtb__172) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__170, dtb__171, (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + (Base_dList.v_Base_dList_dlength dtb__171))) mc1) dtb__172)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__173, dtb__174, dtb__175) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__173), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__174), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__175)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__176) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__177) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__178) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__179, dtb__180) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__179), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt mc0) mc1)) dtb__180)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__181, dtb__182) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__181, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__182)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__183, dtb__184, dtb__185) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__183), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__184), dtb__185))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__186, dtb__187, dtb__188) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__186, dtb__187, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (mc0 + 1)) mc1) dtb__188)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__189, dtb__190, dtb__191, dtb__192, dtb__193) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__189, dtb__190, dtb__191, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__192), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (mc0 + 1)) mc1) dtb__193)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__194) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__195) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__196) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__197, dtb__198) -> (if (dtb__198 = mc0) then mc1 else mc2)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt = (fun idx arg alt -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt ((v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt), (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (idx + (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)))) arg) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))))

let rec v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__199, dtb__200, dtb__201) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__199), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__200), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__201)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__202, dtb__203) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__202), ((Base_dList.v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt mc0) mc1) mc2) mc3)) dtb__203)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__204, dtb__205) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__204, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__205)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__206, dtb__207, dtb__208) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__206), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__207), dtb__208))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__209, dtb__210, dtb__211) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__209, dtb__210, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__211)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__212, dtb__213, dtb__214, dtb__215, dtb__216) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__212, dtb__213, dtb__214, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__215), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__216)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__217) -> (if (dtb__217 = mc0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (mc1, (mc3 - mc2))) else mc4)
  | _ -> mc4
))
and v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__218, dtb__219, dtb__220) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__218, dtb__219, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + (Base_dList.v_Base_dList_dlength dtb__219))) dtb__220)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar = (fun m name q t -> (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) 0) t))

let rec v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__221, dtb__222, dtb__223, dtb__224, dtb__225) -> (if (mc3 = mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__221, dtb__222, dtb__223, dtb__224, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (mc0, true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega, mc2, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__225))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__221, dtb__222, dtb__223, dtb__224, (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo mc0) mc1) mc2) (mc3 + 1)) dtb__225))))
  | _ -> mc4
))

let v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder = (fun name idx dictDom t -> (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo name) idx) dictDom) 0) t))

let v_Vuna_dCompiler_dCore_dTerm_dcutoffOf = (fun total idx -> (if ((total - (idx + 1)) <= 0) then 0 else (total - (idx + 1))))

let rec v_Vuna_dCompiler_dCore_dTerm_dcountPis = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__226, dtb__227, dtb__228, dtb__229, dtb__230) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dcountPis dtb__230))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__231, dtb__232, dtb__233) -> (if (mc2 = mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__231, dtb__232, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (mc0, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__233))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__231, dtb__232, ((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo mc0) mc1) (mc2 + 1)) dtb__233))))
  | _ -> mc3
))

let v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder = (fun name idx t -> ((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo name) idx) 0) t))

let rec v_Vuna_dCompiler_dCore_dTerm_dcountLams = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__234, dtb__235, dtb__236) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dcountLams dtb__236))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__237, dtb__238, dtb__239) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__237) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__238)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__239))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__240, dtb__241) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__240) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree mc0) dtb__241))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__242, dtb__243) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__243)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__244, dtb__245, dtb__246) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__244) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__245))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__247, dtb__248, dtb__249) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + 1)) dtb__249)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__250, dtb__251, dtb__252, dtb__253, dtb__254) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__253) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + 1)) dtb__254))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__255, dtb__256) -> (dtb__256 >= mc0)
  | _ -> false
))
and v_Vuna_dCompiler_dCore_dTerm_danyPairFree = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__257, dtb__258) -> (match dtb__257 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__259, dtb__260) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__259) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__258))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_danyAltFree = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__261, dtb__262) -> (match dtb__261 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__263, dtb__264, dtb__265) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + (Base_dList.v_Base_dList_dlength dtb__264))) dtb__265) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree mc0) dtb__262))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__266, dtb__267, dtb__268) -> (if (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__266) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__267)) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__268))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__269, dtb__270) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__269) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts dtb__270))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__271, dtb__272) -> (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__272)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__273, dtb__274, dtb__275) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__273) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__274))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__276, dtb__277, dtb__278) -> (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__278)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__279, dtb__280, dtb__281, dtb__282, dtb__283) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__282) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__283))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__284, dtb__285) -> (dtb__285 < 0)
  | _ -> false
))
and v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__286, dtb__287) -> (match dtb__286 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__288, dtb__289) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__288) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__287))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__290, dtb__291) -> (match dtb__290 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__292, dtb__293, dtb__294) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__294) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts dtb__291))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel = (fun fuel sols v -> (if (fuel <= 0) then false else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__295, dtb__296) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__295) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__297) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__297)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__298) -> (match dtb__298 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__299, dtb__300, dtb__301) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__301)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__302, dtb__303) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__303)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__304, dtb__305, dtb__306, dtb__307, dtb__308) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__307) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__308))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__309, dtb__310, dtb__311) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__311)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__312, dtb__313) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__313)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__314, dtb__315) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__314) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__315))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__316, dtb__317) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__316)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__318, dtb__319, dtb__320) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__318) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__319)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__320))
  | _ -> false
)))
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel = (fun fuel sols vs -> (if (fuel <= 0) then false else (match vs with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__321, dtb__322) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__321) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__322))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel = (fun fuel sols clo -> (if (fuel <= 0) then false else (match clo with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClosure (dtb__323, dtb__324) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__323)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue = (fun sols v -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel 64) sols) v))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaList = (fun sols vs -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel 64) sols) vs))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaClo = (fun sols clo -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel 64) sols) clo))

let v_Vuna_dCompiler_dCore_dTerm_disTypeValue = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__325) -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__326) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__326))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__327) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__328) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__329) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__330) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__331, dtb__332, dtb__333) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__331) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__332)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__333))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__334, dtb__335) -> (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__334)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__336, dtb__337) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__336) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__337))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__338, dtb__339) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__339)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__340, dtb__341) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__341)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__342, dtb__343, dtb__344) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo mc0) dtb__344)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__345, dtb__346, dtb__347, dtb__348, dtb__349) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__348) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo mc0) dtb__349))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__350) -> (match dtb__350 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__351, dtb__352, dtb__353) -> (if (dtb__352 >= mc0) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__353))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__354, dtb__355) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__355)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__356, dtb__357) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) 0) dtb__356) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__357))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClosure (dtb__358, dtb__359) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__358)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowBinders = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__360, dtb__361) -> (match dtb__360 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__362, dtb__363) -> (String.concat "" [" "; dtb__362; (v_Vuna_dCompiler_dCore_dTerm_dshowBinders dtb__361)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__364, dtb__365) -> (if (dtb__364 = 34) then ("\\\"" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__365)) else (if (dtb__364 = 92) then ("\\\\" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__365)) else (if (dtb__364 = 10) then ("\\n" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__365)) else (if (dtb__364 = 9) then ("\\t" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__365)) else (if (dtb__364 = 13) then ("\\r" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__365)) else ((Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__364, Base_dList.C_Base_dList_dList_Base_dList_dNil))) ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__365)))))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dshowCoreString = (fun s -> (String.concat "" ["\""; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars (Base_dList.dtp_unpack s)); "\""]))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowTerm = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__366, dtb__367, dtb__368) -> (String.concat "" ["if "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__366); " then "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__367); " else "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__368)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__369) -> (if dtb__369 then "True" else "False")
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__370) -> (v_Vuna_dCompiler_dCore_dTerm_dshowCoreString dtb__370)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__371) -> (bi_strFromInt dtb__371)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__372, dtb__373) -> (String.concat "" ["case "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__372); " of "; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__373)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__374, dtb__375) -> (String.concat "" ["("; dtb__374; (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__375); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__376, dtb__377, dtb__378) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__376); " "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__377); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__379, dtb__380, dtb__381) -> (String.concat "" ["\\"; dtb__379; " => "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__381)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__382, dtb__383, dtb__384, dtb__385, dtb__386) -> (if (dtb__382 = "_") then (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__385); " -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__386)]) else (if dtb__383 then (String.concat "" ["{"; dtb__382; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__385); "} -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__386)]) else (String.concat "" ["("; dtb__382; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__385); ") -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__386)])))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__387) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__387) = 0) then "Type" else ("Type " ^ (bi_strFromInt (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__387))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__388) -> dtb__388
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__389) -> ("?" ^ (bi_strFromInt dtb__389))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__390, dtb__391) -> dtb__390
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__392, dtb__393) -> (match dtb__392 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__394, dtb__395) -> (String.concat "" [" "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__394); (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__393)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__396, dtb__397) -> (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__396); (v_Vuna_dCompiler_dCore_dTerm_dshowBinders (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__396)); " => "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__396)); " | "; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__397)])
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__398, dtb__399) -> (match dtb__399 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> dtb__398
  | _ -> (String.concat "" ["("; dtb__398; (v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs dtb__399); ")"])
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__400, dtb__401, dtb__402) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__400); " "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__401); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__403, dtb__404, dtb__405, dtb__406, dtb__407) -> (if (dtb__403 = "_") then (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__406); " -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__407)]) else (if dtb__404 then (String.concat "" ["{"; dtb__403; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__406); "} -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__407)]) else (String.concat "" ["("; dtb__403; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__406); ") -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__407)])))
  | _ -> (v_Vuna_dCompiler_dCore_dTerm_dshowTerm mc0)
))
and v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__408, dtb__409, dtb__410, dtb__411, dtb__412) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__408, dtb__409, dtb__410, dtb__411, dtb__412))); ")"])
  | _ -> (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig t)
))
and v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__413, dtb__414) -> (match dtb__413 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__415, dtb__416) -> (String.concat "" [" "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__415); (v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs dtb__414)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))
