open Vuna_runtime
type t_Vuna_dCompiler_dCore_dTerm_dRig = C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 | C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
and t_Vuna_dCompiler_dCore_dTerm_dLevel = int
and t_Vuna_dCompiler_dCore_dTerm_dTerm = C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar of (string) * (int) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta of (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal of (string) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType of (t_Vuna_dCompiler_dCore_dTerm_dLevel) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi of (string) * (bool) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam of (string) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dRig) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon of (string) * ((t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk of (string) * ((t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (int) * (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (int Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt of (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr of (string) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool of (bool) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat of (string) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord of (string) * ((t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dCore_dTerm_dCaseAlt = { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName : string; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders : (string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody : t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dCore_dTerm_dClosure = { f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv : t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody : t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dCore_dTerm_dNeutral = C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar of (string) * (int) * (t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal of (string) * (t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dCore_dTerm_dValue = C_Vuna_dCompiler_dCore_dTerm_dValue_VType of (t_Vuna_dCompiler_dCore_dTerm_dLevel) | C_Vuna_dCompiler_dCore_dTerm_dValue_VPi of (string) * (bool) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dClosure) | C_Vuna_dCompiler_dCore_dTerm_dValue_VLam of (string) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dClosure) | C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral of (t_Vuna_dCompiler_dCore_dTerm_dNeutral) | C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta of (int) * (t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dValue_VApp of (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dValue) | C_Vuna_dCompiler_dCore_dTerm_dValue_VCon of (string) * (t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dValue_VCase of (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dVCaseAlt Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dValue_VProj of (t_Vuna_dCompiler_dCore_dTerm_dValue) * (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (int) * (int) | C_Vuna_dCompiler_dCore_dTerm_dValue_VInt of (int) | C_Vuna_dCompiler_dCore_dTerm_dValue_VStr of (string) | C_Vuna_dCompiler_dCore_dTerm_dValue_VBool of (bool) | C_Vuna_dCompiler_dCore_dTerm_dValue_VIf of (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dValue) | C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat of (string)
and t_Vuna_dCompiler_dCore_dTerm_dVCaseAlt = { f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltName : string; f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltBinders : (string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltClosure : t_Vuna_dCompiler_dCore_dTerm_dClosure }
and t_Vuna_dCompiler_dCore_dTerm_dSols = { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl : (int, t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList : (int, t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth : (int, int) Base_dHashMap.t_Base_dHashMap_dHashMap }

# 35 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_drigIsErased = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> false
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> false
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> true
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_drigIsLinear = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> true
  | _ -> false
))

# 44 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_drigIsOmega = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> true
  | _ -> false
))

# 51 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_drigOfBinder = (fun mc0 mc1 -> (if mc0 then C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 else (if mc1 then C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 else C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)))

# 56 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_ddefaultExplicitRig = C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega

# 63 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_drigAdd = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> mc0
  | _ -> C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
)
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> mc1
  | _ -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> mc0
  | _ -> C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
)
))

# 69 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_drigScale = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0
  | _ -> C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
)
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0
  | _ -> mc1
)
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_drigJoin = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
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

# 83 "Vuna/Compiler/Core/Term.vuna"
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

# 90 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dshowRig = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> "\207\137"
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> "1"
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> "0"
  | _ -> failwith "DT: impossible branch"
))

# 101 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dlevelZero = 0

# 104 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dlevelSucc = (fun mc0 -> (let dtb__0 = mc0 in (dtb__0 + 1)))

# 107 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dlevelMax = (fun mc0 mc1 -> (let dtb__1 = mc0 in (let dtb__2 = mc1 in (if (dtb__1 >= dtb__2) then dtb__1 else dtb__2))))

# 110 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dlevelToInt = (fun mc0 -> (let dtb__3 = mc0 in dtb__3))

# 114 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt = (fun n -> n)

# 117 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dlevelEq = (fun mc0 mc1 -> (let dtb__4 = mc0 in (let dtb__5 = mc1 in (dtb__4 = dtb__5))))

# 120 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dlevelLt = (fun mc0 mc1 -> (let dtb__6 = mc0 in (let dtb__7 = mc1 in (dtb__6 < dtb__7))))

# 161 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dcaseAltName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__8; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__9; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__10 } -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

# 164 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__11; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__12; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__13 } -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

# 167 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__14; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__15; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__16 } -> dtb__16
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel = 512

# 219 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dnatChainMax = 4611686018427387903

# 249 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dnatChainNext = (fun n -> (if (n >= v_Vuna_dCompiler_dCore_dTerm_dnatChainMax) then v_Vuna_dCompiler_dCore_dTerm_dnatChainMax else (n + 1)))

# 256 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dflattenTermAppGo = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__17, dtb__18) -> { Base_dPair.f_Base_dPair_dPair_first = (C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__17)); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__18) mc1) }
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__19, dtb__20, dtb__21) -> ((v_Vuna_dCompiler_dCore_dTerm_dflattenTermAppGo dtb__19) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__20; Base_dPair.f_Base_dPair_dPair_second = dtb__21 }, mc1)))
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }
))

# 253 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dflattenTermApp = (fun t -> ((v_Vuna_dCompiler_dCore_dTerm_dflattenTermAppGo t) Base_dList.C_Base_dList_dList_Nil))

# 229 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dnatChainGo = (fun fuel t -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match (v_Vuna_dCompiler_dCore_dTerm_dflattenTermApp t) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__22; Base_dPair.f_Base_dPair_dPair_second = dtb__23 } -> (match dtb__22 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__24, dtb__25) -> (((v_Vuna_dCompiler_dCore_dTerm_dnatChainArgs (fuel - 1)) dtb__24) ((Base_dList.v_Base_dList_dappend dtb__25) dtb__23))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__26) -> (((v_Vuna_dCompiler_dCore_dTerm_dnatChainArgs (fuel - 1)) dtb__26) dtb__23)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)))
# 237 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dnatChainArgs = (fun fuel c args -> (if (c = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor) then (match args with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (0))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (c = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__27, dtb__28) -> (match dtb__27 with
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

# 226 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dnatChainValue = (fun t -> ((v_Vuna_dCompiler_dCore_dTerm_dnatChainGo 1000000) t))

# 264 "Vuna/Compiler/Core/Term.vuna"
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
# 284 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__74, dtb__75) -> (match dtb__74 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__76; Base_dPair.f_Base_dPair_dPair_second = dtb__77 } -> ((v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__76) + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs dtb__75))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 288 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dtermSizeAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__78, dtb__79) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermSize (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__78)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeAlts dtb__79))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 296 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dmetaLookup = (fun i t -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) i) t))

# 300 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__80, dtb__81) -> (match dtb__80 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__82; Base_dPair.f_Base_dPair_dPair_second = dtb__83 } -> (if (mc0 = dtb__82) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__83)) else ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList mc0) dtb__81))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 319 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty = { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil) }

# 322 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsFromList = (fun xs -> { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dInt.v_Hashable_uInt) xs) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil)); f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = xs; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil) })

# 327 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsOf = (fun t xs d -> { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = t; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = xs; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = d })

# 330 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsList = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__84; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__85; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__86 } -> dtb__85
  | _ -> failwith "DT: impossible branch"
))

# 334 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsDepth = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__87; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__88; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__89 } -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) mc0) dtb__89)
  | _ -> failwith "DT: impossible branch"
))

# 339 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsLookup = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__90; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__91; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__92 } -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) mc0) dtb__90)
  | _ -> failwith "DT: impossible branch"
))

# 342 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsCons = (fun mc0 mc1 mc2 -> (match mc2 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__93; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__94; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__95 } -> { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dInt.v_Hashable_uInt) mc0) mc1) dtb__93); f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }, dtb__94)); f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__95 }
  | _ -> failwith "DT: impossible branch"
))

# 347 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__96, dtb__97, dtb__98) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__96) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__97)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__98))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__99) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__100) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__101) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__102) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__103, dtb__104) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__103) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts mc0) dtb__104))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__105, dtb__106, dtb__107, dtb__108, dtb__109) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__105) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__109))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__110, dtb__111, dtb__112, dtb__113, dtb__114) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__110)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__115, dtb__116) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__116)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__117, dtb__118) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__118)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__119, dtb__120) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__120)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__121, dtb__122, dtb__123) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__121) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__122))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__124, dtb__125, dtb__126) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__126)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__127, dtb__128, dtb__129, dtb__130, dtb__131) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__130) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__131))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__132) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__133) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__134, dtb__135, dtb__136) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__137) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__137) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__138) -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 373 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__139, dtb__140) -> (match dtb__139 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__141; Base_dPair.f_Base_dPair_dPair_second = dtb__142 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__141) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__140))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 378 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__143, dtb__144) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__143)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts mc0) dtb__144))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 385 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__145, dtb__146, dtb__147) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__145) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__146)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__147))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__148) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__149) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__150) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__151, dtb__152) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__151) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat mc0) dtb__152))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__153, dtb__154, dtb__155, dtb__156, dtb__157) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__153) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__157))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__158, dtb__159, dtb__160, dtb__161, dtb__162) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__158)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__163, dtb__164) -> ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__164)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__165, dtb__166) -> ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__166)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__167, dtb__168) -> ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__168)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__169, dtb__170, dtb__171) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__169) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__170))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__172, dtb__173, dtb__174) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__174)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__175, dtb__176, dtb__177, dtb__178, dtb__179) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__178) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__179))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__180) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__181) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__182, dtb__183, dtb__184) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__185) -> ((Base_dList.v_Base_dList_dmemName dtb__185) mc0)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__186) -> true
  | _ -> failwith "DT: impossible branch"
))
# 408 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__187, dtb__188) -> (match dtb__187 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__189; Base_dPair.f_Base_dPair_dPair_second = dtb__190 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__189) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__188))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 413 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__191, dtb__192) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__191)) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat mc0) dtb__192))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 419 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__193, dtb__194, dtb__195) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__193)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__194)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__195)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__196) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__197) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__198) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__199, dtb__200) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__199)) ((Base_dList.v_Base_dList_dconcatMap (fun a -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody a)))) dtb__200))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__201, dtb__202, dtb__203, dtb__204, dtb__205) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__201)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__205))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__206, dtb__207, dtb__208, dtb__209, dtb__210) -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__206)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__211, dtb__212) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__211, ((Base_dList.v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (Base_dPair.v_Base_dPair_dfirstOf p)))) dtb__212)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__213, dtb__214) -> ((Base_dList.v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (Base_dPair.v_Base_dPair_dfirstOf p)))) dtb__214)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__215, dtb__216) -> ((Base_dList.v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (Base_dPair.v_Base_dPair_dfirstOf p)))) dtb__216)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__217, dtb__218, dtb__219) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__217)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__218))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__220, dtb__221, dtb__222) -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__222)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__223, dtb__224, dtb__225, dtb__226, dtb__227) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__226)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__227))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__228) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__229) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__230, dtb__231, dtb__232) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__233) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__233, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__234) -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 467 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dlookupPair = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__235, dtb__236) -> (match dtb__235 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__237; Base_dPair.f_Base_dPair_dPair_second = dtb__238 } -> (if (dtb__237 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__238)) else ((v_Vuna_dCompiler_dCore_dTerm_dlookupPair mc0) dtb__236))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 460 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__239, dtb__240) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dlookupPair dtb__239) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__241) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__241, ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc0) dtb__240)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc0) dtb__240)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 451 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__242, dtb__243) -> (if (mc0 <= 0) then false else (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc2) dtb__242) then true else ((((v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel (mc0 - 1)) mc1) mc2) ((Base_dList.v_Base_dList_dappend dtb__243) ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc1) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__242))))))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 446 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dtermReachesFloat = (fun defs names t -> ((((v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel 4096) defs) names) (Base_dList.C_Base_dList_dList__x58__x58_ (t, Base_dList.C_Base_dList_dList_Nil))))

# 471 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_ddefLookup = (fun name tbl -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) tbl))

# 475 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__244, dtb__245, dtb__246) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__244) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__245)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__246))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__247) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__248) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__249) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__250) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__251, dtb__252) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__251) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts mc0) dtb__252))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__253, dtb__254, dtb__255, dtb__256, dtb__257) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__253) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + (Base_dList.v_Base_dList_dlength dtb__255))) dtb__257))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__258, dtb__259, dtb__260, dtb__261, dtb__262) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__258)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__263, dtb__264) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__264)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__265, dtb__266) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__266)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__267, dtb__268) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__268)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__269, dtb__270, dtb__271) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__269) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__270))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__272, dtb__273, dtb__274) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + 1)) dtb__274)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__275, dtb__276, dtb__277, dtb__278, dtb__279) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__278) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + 1)) dtb__279))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__280) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__281) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__282) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__283, dtb__284, dtb__285) -> (dtb__284 >= mc0)
  | _ -> failwith "DT: impossible branch"
))
# 497 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__286, dtb__287) -> (match dtb__286 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__288; Base_dPair.f_Base_dPair_dPair_second = dtb__289 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__288) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__287))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 501 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__290, dtb__291) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__290)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__290)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts mc0) dtb__291))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 506 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dhasMeta = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__292, dtb__293, dtb__294) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__292) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__293)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__294))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__295) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__296) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__297) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__298) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__299, dtb__300) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__299) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts mc0) mc1) dtb__300))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__301, dtb__302, dtb__303, dtb__304, dtb__305) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__301) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + (Base_dList.v_Base_dList_dlength dtb__303))) dtb__305))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__306, dtb__307, dtb__308, dtb__309, dtb__310) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__306)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__311, dtb__312) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__312)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__313, dtb__314) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__314)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__315, dtb__316) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__316)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__317, dtb__318, dtb__319) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__317) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__318))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__320, dtb__321, dtb__322) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + 1)) dtb__322)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__323, dtb__324, dtb__325, dtb__326, dtb__327) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__326) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + 1)) dtb__327))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__328) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__329) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__330, dtb__331, dtb__332) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__333) -> (mc0 = dtb__333)
  | _ -> failwith "DT: impossible branch"
))
# 527 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__334, dtb__335) -> (match dtb__334 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__336; Base_dPair.f_Base_dPair_dPair_second = dtb__337 } -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__336) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__335))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 531 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__338, dtb__339) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__338)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__338)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts mc0) mc1) dtb__339))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 540 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dshift = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__340, dtb__341, dtb__342) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__340), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__341), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__342)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__343) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__344) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__345) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__346) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__347, dtb__348) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__347), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts mc0) mc1) dtb__348)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__349, dtb__350, dtb__351, dtb__352, dtb__353) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__349), dtb__350, dtb__351, dtb__352, (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + (Base_dList.v_Base_dList_dlength dtb__351))) mc1) dtb__353)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__354, dtb__355, dtb__356, dtb__357, dtb__358) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__354), dtb__355, dtb__356, dtb__357, dtb__358))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__359, dtb__360) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__359, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__360)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__361, dtb__362) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__361, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__362)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__363, dtb__364) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__363, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__364)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__365, dtb__366, dtb__367) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__365), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__366), dtb__367))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__368, dtb__369, dtb__370) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__368, dtb__369, (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + 1)) mc1) dtb__370)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__371, dtb__372, dtb__373, dtb__374, dtb__375) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__371, dtb__372, dtb__373, (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__374), (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + 1)) mc1) dtb__375)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__376) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__377) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__378) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__379, dtb__380, dtb__381) -> (if (dtb__380 >= mc0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__379, (dtb__380 + mc1), dtb__381)) else mc2)
  | _ -> failwith "DT: impossible branch"
))
# 564 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshiftArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__382, dtb__383) -> (match dtb__382 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__384; Base_dPair.f_Base_dPair_dPair_second = dtb__385 } -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__384); Base_dPair.f_Base_dPair_dPair_second = dtb__385 }, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__383)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 569 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlts = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__386, dtb__387) -> (Base_dList.C_Base_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dCore_dTerm_dshiftAlt mc0) mc1) dtb__386), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts mc0) mc1) dtb__387)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 573 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlt = (fun mc0 mc1 mc2 -> (match mc2 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__388; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__389; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__390 } -> { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__388; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__389; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + (Base_dList.v_Base_dList_dlength dtb__389))) mc1) dtb__390) }
  | _ -> failwith "DT: impossible branch"
))

# 578 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__391, dtb__392, dtb__393) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__391), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__392), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__393)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__394) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__395) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__396) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__397) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__398, dtb__399) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__398), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt mc0) mc1)) dtb__399)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__400, dtb__401, dtb__402, dtb__403, dtb__404) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__400), dtb__401, dtb__402, dtb__403, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (mc0 - (Base_dList.v_Base_dList_dlength dtb__402))) mc1) dtb__404)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__405, dtb__406, dtb__407, dtb__408, dtb__409) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__405), dtb__406, dtb__407, dtb__408, dtb__409))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__410, dtb__411) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__410, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__411)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__412, dtb__413) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__412, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__413)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__414, dtb__415) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__414, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__415)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__416, dtb__417, dtb__418) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__416), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__417), dtb__418))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__419, dtb__420, dtb__421) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__419, dtb__420, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (mc0 + 1)) mc1) dtb__421)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__422, dtb__423, dtb__424, dtb__425, dtb__426) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__422, dtb__423, dtb__424, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__425), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (mc0 + 1)) mc1) dtb__426)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__427) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__428) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__429) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__430, dtb__431, dtb__432) -> (if (dtb__431 = mc0) then mc1 else mc2)
  | _ -> failwith "DT: impossible branch"
))
# 605 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt = (fun idx arg alt -> { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt); f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt); f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (idx + (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)))) arg) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)) })

# 613 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__433, dtb__434, dtb__435) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__433), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__434), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__435)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__436, dtb__437) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__436), ((Base_dList.v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt mc0) mc1) mc2) mc3)) dtb__437)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__438, dtb__439, dtb__440, dtb__441, dtb__442) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__438), dtb__439, dtb__440, dtb__441, dtb__442))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__443, dtb__444) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__443, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__444)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__445, dtb__446) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__445, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__446)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__447, dtb__448) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__447, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__448)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__449, dtb__450, dtb__451) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__449), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__450), dtb__451))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__452, dtb__453, dtb__454) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__452, dtb__453, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__454)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__455, dtb__456, dtb__457, dtb__458, dtb__459) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__455, dtb__456, dtb__457, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__458), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__459)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__460) -> (if (dtb__460 = mc0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (mc1, (mc3 - mc2), { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })) else mc4)
  | _ -> mc4
))
# 636 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__461; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__462; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__463 } -> { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__461; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__462; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + (Base_dList.v_Base_dList_dlength dtb__462))) dtb__463) }
  | _ -> failwith "DT: impossible branch"
))

# 610 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar = (fun m name q t -> (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) 0) t))

# 648 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__464, dtb__465, dtb__466, dtb__467, dtb__468) -> (if (mc3 = mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__464, dtb__465, dtb__466, dtb__467, (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (mc0, true, C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, mc2, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__468))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__464, dtb__465, dtb__466, dtb__467, (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo mc0) mc1) mc2) (mc3 + 1)) dtb__468))))
  | _ -> mc4
))

# 642 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder = (fun name idx dictDom t -> (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo name) idx) dictDom) 0) t))

# 658 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinderGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__469, dtb__470, dtb__471, dtb__472, dtb__473) -> (if (mc4 = mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__469, dtb__470, dtb__471, dtb__472, (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (mc0, true, mc2, mc3, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__473))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__469, dtb__470, dtb__471, dtb__472, ((((((v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinderGo mc0) mc1) mc2) mc3) (mc4 + 1)) dtb__473))))
  | _ -> mc5
))

# 655 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinder = (fun name idx rig dom t -> ((((((v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinderGo name) idx) rig) dom) 0) t))

# 665 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dcutoffOf = (fun total idx -> (if ((total - (idx + 1)) <= 0) then 0 else (total - (idx + 1))))

# 668 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dcountPis = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__474, dtb__475, dtb__476, dtb__477, dtb__478) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dcountPis dtb__478))
  | _ -> 0
))

# 680 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__479, dtb__480, dtb__481) -> (if (mc2 = mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__479, dtb__480, (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (mc0, C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__481))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__479, dtb__480, ((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo mc0) mc1) (mc2 + 1)) dtb__481))))
  | _ -> mc3
))

# 677 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder = (fun name idx t -> ((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo name) idx) 0) t))

# 686 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dcountLams = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__482, dtb__483, dtb__484) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dcountLams dtb__484))
  | _ -> 0
))

# 691 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__485, dtb__486, dtb__487) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__485) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__486)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__487))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__488, dtb__489) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__488) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree mc0) dtb__489))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__490, dtb__491, dtb__492, dtb__493, dtb__494) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__490) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + (Base_dList.v_Base_dList_dlength dtb__492))) dtb__494))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__495, dtb__496, dtb__497, dtb__498, dtb__499) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__495)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__500, dtb__501) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__501)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__502, dtb__503) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__503)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__504, dtb__505) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__505)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__506, dtb__507, dtb__508) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__506) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__507))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__509, dtb__510, dtb__511) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + 1)) dtb__511)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__512, dtb__513, dtb__514, dtb__515, dtb__516) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__515) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + 1)) dtb__516))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__517, dtb__518, dtb__519) -> (dtb__518 >= mc0)
  | _ -> false
))
# 708 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyPairFree = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__520, dtb__521) -> (match dtb__520 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__522; Base_dPair.f_Base_dPair_dPair_second = dtb__523 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__522) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__521))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 712 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyAltFree = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__524, dtb__525) -> (match dtb__524 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__526; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__527; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__528 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + (Base_dList.v_Base_dList_dlength dtb__527))) dtb__528) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree mc0) dtb__525))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 719 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__529, dtb__530, dtb__531) -> (if (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__529) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__530)) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__531))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__532, dtb__533) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__532) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts dtb__533))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__534, dtb__535, dtb__536, dtb__537, dtb__538) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__534) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__538))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__539, dtb__540, dtb__541, dtb__542, dtb__543) -> (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__539)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__544, dtb__545) -> (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__545)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__546, dtb__547) -> (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__547)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__548, dtb__549) -> (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__549)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__550, dtb__551, dtb__552) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__550) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__551))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__553, dtb__554, dtb__555) -> (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__555)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__556, dtb__557, dtb__558, dtb__559, dtb__560) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__559) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__560))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__561, dtb__562, dtb__563) -> (dtb__562 < 0)
  | _ -> false
))
# 733 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__564, dtb__565) -> (match dtb__564 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__566; Base_dPair.f_Base_dPair_dPair_second = dtb__567 } -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__566) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__565))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 737 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__568, dtb__569) -> (match dtb__568 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__570; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__571; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__572 } -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__572) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts dtb__569))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 745 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel = (fun fuel sols v -> (if (fuel <= 0) then false else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__573, dtb__574) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__573) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__575) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__575)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__576) -> (match dtb__576 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__577, dtb__578, dtb__579) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__579)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__580, dtb__581) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__581)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__582, dtb__583, dtb__584, dtb__585, dtb__586) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__585) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__586))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__587, dtb__588, dtb__589) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__589)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__590, dtb__591) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__591)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__592, dtb__593) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__592) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__593))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__594, dtb__595) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__594)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (dtb__596, dtb__597, dtb__598, dtb__599, dtb__600) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__596)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__601, dtb__602, dtb__603) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__601) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__602)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__603))
  | _ -> false
)))
# 771 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel = (fun fuel sols vs -> (if (fuel <= 0) then false else (match vs with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__604, dtb__605) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__604) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__605))
  | _ -> failwith "DT: impossible branch"
)))
# 781 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel = (fun fuel sols clo -> (if (fuel <= 0) then false else (match clo with
  | { f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = dtb__606; f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__607 } -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__606)
  | _ -> failwith "DT: impossible branch"
)))

# 742 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue = (fun sols v -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel 64) sols) v))

# 768 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaList = (fun sols vs -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel 64) sols) vs))

# 778 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaClo = (fun sols clo -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel 64) sols) clo))

# 789 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_disTypeValue = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__608) -> true
  | _ -> false
))

# 793 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__609) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__609))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 801 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__610) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__611) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__612) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__613) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__614) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__615, dtb__616, dtb__617) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__615) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__616)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__617))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (dtb__618, dtb__619, dtb__620, dtb__621, dtb__622) -> (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__618)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__623, dtb__624) -> (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__623)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__625, dtb__626) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__625) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__626))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__627, dtb__628) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__628)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__629, dtb__630) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__630)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__631, dtb__632, dtb__633) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo mc0) dtb__633)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__634, dtb__635, dtb__636, dtb__637, dtb__638) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__637) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo mc0) dtb__638))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__639) -> (match dtb__639 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__640, dtb__641, dtb__642) -> (if (dtb__641 >= mc0) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__642))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__643, dtb__644) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__644)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 821 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__645, dtb__646) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) 0) dtb__645) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__646))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 825 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = dtb__647; f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__648 } -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__647)
  | _ -> failwith "DT: impossible branch"
))

# 894 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dshowBinders = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__649, dtb__650) -> (match dtb__649 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__651; Base_dPair.f_Base_dPair_dPair_second = dtb__652 } -> (String.concat "" [" "; dtb__651; (v_Vuna_dCompiler_dCore_dTerm_dshowBinders dtb__650)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 901 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__653, dtb__654) -> (if (dtb__653 = 34) then ("\\\"" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__654)) else (if (dtb__653 = 92) then ("\\\\" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__654)) else (if (dtb__653 = 10) then ("\\n" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__654)) else (if (dtb__653 = 9) then ("\\t" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__654)) else (if (dtb__653 = 13) then ("\\r" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__654)) else ((Base_dList.dtp_pack (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__653, Base_dList.C_Base_dList_dList_Nil))) ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__654)))))))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 898 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dshowCoreString = (fun s -> (String.concat "" ["\""; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars (Base_dList.dtp_unpack s)); "\""]))

# 828 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dshowTerm = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__655, dtb__656, dtb__657) -> (String.concat "" ["if "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__655); " then "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__656); " else "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__657)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__658) -> (if dtb__658 then "True" else "False")
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__659) -> dtb__659
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__660) -> (v_Vuna_dCompiler_dCore_dTerm_dshowCoreString dtb__660)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__661) -> (bi_strFromInt dtb__661)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__662, dtb__663) -> (String.concat "" ["case "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__662); " of "; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__663)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__664, dtb__665, dtb__666, dtb__667, dtb__668) -> (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__664); " with "; dtb__665; " "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__668)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__669, dtb__670, dtb__671, dtb__672, dtb__673) -> (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__669); "."; dtb__670; "#"; (bi_strFromInt dtb__673)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__674, dtb__675) -> ((v_Vuna_dCompiler_dCore_dTerm_drecordAppShow dtb__674) dtb__675)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__676, dtb__677) -> (String.concat "" ["("; dtb__676; (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__677); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__678, dtb__679) -> (String.concat "" ["("; dtb__678; (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__679); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__680, dtb__681, dtb__682) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__680); " "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__681); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__683, dtb__684, dtb__685) -> (String.concat "" ["\\"; dtb__683; " => "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__685)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__686, dtb__687, dtb__688, dtb__689, dtb__690) -> (if (dtb__686 = "_") then (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__689); " -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__690)]) else (if dtb__687 then (String.concat "" ["{"; dtb__686; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__689); "} -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__690)]) else (String.concat "" ["("; dtb__686; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__689); ") -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__690)])))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__691) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__691) = 0) then "Type" else ("Type " ^ (bi_strFromInt (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__691))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__692) -> dtb__692
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__693) -> ("?" ^ (bi_strFromInt dtb__693))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__694, dtb__695, dtb__696) -> dtb__694
  | _ -> failwith "DT: impossible branch"
))
# 874 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__697, dtb__698) -> (match dtb__697 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__699; Base_dPair.f_Base_dPair_dPair_second = dtb__700 } -> (String.concat "" [" "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__699); (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__698)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 879 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_drecordAppShow = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__701, dtb__702) -> (match dtb__701 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__703; Base_dPair.f_Base_dPair_dPair_second = dtb__704 } -> ((v_Vuna_dCompiler_dCore_dTerm_drecordAppShow (String.concat "" ["("; mc0; " "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__703); ")"])) dtb__702)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))
# 889 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__705, dtb__706) -> (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__705); (v_Vuna_dCompiler_dCore_dTerm_dshowBinders (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__705)); " => "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__705)); " | "; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__706)])
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 855 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__707, dtb__708) -> ((v_Vuna_dCompiler_dCore_dTerm_dshowSigAppText dtb__707) dtb__708)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__709, dtb__710) -> (match dtb__710 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__709
  | _ -> (String.concat "" ["("; dtb__709; (v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs dtb__710); ")"])
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__711, dtb__712, dtb__713) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__711); " "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__712); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__714, dtb__715, dtb__716, dtb__717, dtb__718) -> (if (dtb__714 = "_") then (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__717); " -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__718)]) else (if dtb__715 then (String.concat "" ["{"; dtb__714; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__717); "} -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__718)]) else (String.concat "" ["("; dtb__714; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__717); ") -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__718)])))
  | _ -> (v_Vuna_dCompiler_dCore_dTerm_dshowTerm mc0)
))
# 866 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__719, dtb__720, dtb__721, dtb__722, dtb__723) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__719, dtb__720, dtb__721, dtb__722, dtb__723))); ")"])
  | _ -> (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig mc0)
))
# 870 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__724, dtb__725) -> (match dtb__724 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__726; Base_dPair.f_Base_dPair_dPair_second = dtb__727 } -> (String.concat "" [" "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__726); (v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs dtb__725)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 884 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowSigAppText = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__728, dtb__729) -> (match dtb__728 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__730; Base_dPair.f_Base_dPair_dPair_second = dtb__731 } -> ((v_Vuna_dCompiler_dCore_dTerm_dshowSigAppText (String.concat "" ["("; mc0; " "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__730); ")"])) dtb__729)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))
