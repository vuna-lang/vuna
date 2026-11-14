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
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> mc1
  | _ -> mc1
)
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
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0
  | _ -> C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0
)
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Core/Term.vuna"
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
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__19, dtb__20, dtb__21) -> ((v_Vuna_dCompiler_dCore_dTerm_dflattenTermAppGo dtb__19) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__20; Base_dPair.f_Base_dPair_dPair_second = dtb__21 }, mc1)))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__74, dtb__75) -> (match dtb__74 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__76; Base_dPair.f_Base_dPair_dPair_second = dtb__77 } -> ((v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__76) + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs dtb__75))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 288 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dtermSizeAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__78, dtb__79) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermSize (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__78)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeAlts dtb__79))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 296 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dmetaLookup = (fun i t -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) i) t))

# 300 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__80, dtb__81) -> (match dtb__80 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__82; Base_dPair.f_Base_dPair_dPair_second = dtb__83 } -> (if (mc0 = dtb__82) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__83)) else ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList mc0) dtb__81))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 325 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty = { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil) }

# 328 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsFromList = (fun xs -> { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dInt.v_Hashable_uInt) xs) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil)); f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = xs; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil) })

# 334 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsOf = (fun t xs d dv -> { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = t; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = xs; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = d; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = dv })

# 337 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsList = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__84; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__85; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__86; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = dtb__87 } -> dtb__85
  | _ -> failwith "DT: impossible branch"
))

# 341 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsPutDefVals = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__88; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__89; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__90; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = dtb__91 } -> { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__88; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__89; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__90; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = mc1 }
  | _ -> failwith "DT: impossible branch"
))

# 345 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsDepth = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__92; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__93; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__94; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = dtb__95 } -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) mc0) dtb__94)
  | _ -> failwith "DT: impossible branch"
))

# 350 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsLookup = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__96; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__97; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__98; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = dtb__99 } -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) mc0) dtb__96)
  | _ -> failwith "DT: impossible branch"
))

# 353 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsCons = (fun mc0 mc1 mc2 -> (match mc2 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__100; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__101; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__102; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = dtb__103 } -> { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dInt.v_Hashable_uInt) mc0) mc1) dtb__100); f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }, dtb__101)); f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__102; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDefVals = dtb__103 }
  | _ -> failwith "DT: impossible branch"
))

# 358 "Vuna/Compiler/Core/Term.vuna"
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
# 384 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__147, dtb__148) -> (match dtb__147 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__149; Base_dPair.f_Base_dPair_dPair_second = dtb__150 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__149) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__148))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 389 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__151, dtb__152) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__151)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts mc0) dtb__152))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 396 "Vuna/Compiler/Core/Term.vuna"
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
# 419 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__195, dtb__196) -> (match dtb__195 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__197; Base_dPair.f_Base_dPair_dPair_second = dtb__198 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__197) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__196))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 424 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__199, dtb__200) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__199)) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat mc0) dtb__200))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 430 "Vuna/Compiler/Core/Term.vuna"
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

# 478 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dlookupPair = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__243, dtb__244) -> (match dtb__243 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__245; Base_dPair.f_Base_dPair_dPair_second = dtb__246 } -> (if (dtb__245 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__246)) else ((v_Vuna_dCompiler_dCore_dTerm_dlookupPair mc0) dtb__244))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 471 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__247, dtb__248) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dlookupPair dtb__247) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__249) -> (Base_dList.C_Base_dList_dList_Cons (dtb__249, ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc0) dtb__248)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc0) dtb__248)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 462 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__250, dtb__251) -> (if (mc0 <= 0) then false else (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc2) dtb__250) then true else ((((v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel (mc0 - 1)) mc1) mc2) ((Base_dList.v_Base_dList_dappend dtb__251) ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc1) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__250))))))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 457 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dtermReachesFloat = (fun defs names t -> ((((v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel 4096) defs) names) (Base_dList.C_Base_dList_dList_Cons (t, Base_dList.C_Base_dList_dList_Nil))))

# 482 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_ddefLookup = (fun name tbl -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) tbl))

# 486 "Vuna/Compiler/Core/Term.vuna"
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
# 508 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__294, dtb__295) -> (match dtb__294 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__296; Base_dPair.f_Base_dPair_dPair_second = dtb__297 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__296) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__295))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 512 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__298, dtb__299) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__298)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__298)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts mc0) dtb__299))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 517 "Vuna/Compiler/Core/Term.vuna"
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
# 538 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__342, dtb__343) -> (match dtb__342 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__344; Base_dPair.f_Base_dPair_dPair_second = dtb__345 } -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__344) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__343))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 542 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__346, dtb__347) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__346)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__346)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts mc0) mc1) dtb__347))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 551 "Vuna/Compiler/Core/Term.vuna"
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
# 575 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshiftArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__390, dtb__391) -> (match dtb__390 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__392; Base_dPair.f_Base_dPair_dPair_second = dtb__393 } -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__392); Base_dPair.f_Base_dPair_dPair_second = dtb__393 }, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__391)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 580 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlts = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__394, dtb__395) -> (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dCore_dTerm_dshiftAlt mc0) mc1) dtb__394), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts mc0) mc1) dtb__395)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 584 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlt = (fun mc0 mc1 mc2 -> (match mc2 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__396; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__397; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__398 } -> { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__396; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__397; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + (Base_dList.v_Base_dList_dlength dtb__397))) mc1) dtb__398) }
  | _ -> failwith "DT: impossible branch"
))

# 589 "Vuna/Compiler/Core/Term.vuna"
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
# 616 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt = (fun idx arg alt -> { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt); f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt); f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (idx + (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)))) arg) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)) })

# 624 "Vuna/Compiler/Core/Term.vuna"
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
# 647 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__469; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__470; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__471 } -> { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__469; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__470; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + (Base_dList.v_Base_dList_dlength dtb__470))) dtb__471) }
  | _ -> failwith "DT: impossible branch"
))

# 621 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar = (fun m name q t -> (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) 0) t))

# 659 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__472, dtb__473, dtb__474, dtb__475, dtb__476) -> (if (mc3 = mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__472, dtb__473, dtb__474, dtb__475, (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (mc0, true, C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, mc2, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__476))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__472, dtb__473, dtb__474, dtb__475, (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo mc0) mc1) mc2) (mc3 + 1)) dtb__476))))
  | _ -> mc4
))

# 653 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder = (fun name idx dictDom t -> (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo name) idx) dictDom) 0) t))

# 669 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinderGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__477, dtb__478, dtb__479, dtb__480, dtb__481) -> (if (mc4 = mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__477, dtb__478, dtb__479, dtb__480, (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (mc0, true, mc2, mc3, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__481))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__477, dtb__478, dtb__479, dtb__480, ((((((v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinderGo mc0) mc1) mc2) mc3) (mc4 + 1)) dtb__481))))
  | _ -> mc5
))

# 666 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinder = (fun name idx rig dom t -> ((((((v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinderGo name) idx) rig) dom) 0) t))

# 676 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dcutoffOf = (fun total idx -> (if ((total - (idx + 1)) <= 0) then 0 else (total - (idx + 1))))

# 679 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dcountPis = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__482, dtb__483, dtb__484, dtb__485, dtb__486) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dcountPis dtb__486))
  | _ -> 0
))

# 691 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__487, dtb__488, dtb__489) -> (if (mc2 = mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__487, dtb__488, (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (mc0, C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__489))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__487, dtb__488, ((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo mc0) mc1) (mc2 + 1)) dtb__489))))
  | _ -> mc3
))

# 688 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder = (fun name idx t -> ((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo name) idx) 0) t))

# 697 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dcountLams = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__490, dtb__491, dtb__492) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dcountLams dtb__492))
  | _ -> 0
))

# 702 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__493, dtb__494, dtb__495) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__493) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__494)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__495))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__496, dtb__497) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__496) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree mc0) dtb__497))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__498, dtb__499, dtb__500, dtb__501, dtb__502) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__498) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + (Base_dList.v_Base_dList_dlength dtb__500))) dtb__502))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__503, dtb__504, dtb__505, dtb__506, dtb__507) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__503)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__508, dtb__509) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__509)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__510, dtb__511) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__511)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__512, dtb__513) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__513)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__514, dtb__515, dtb__516) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__514) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__515))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__517, dtb__518, dtb__519) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + 1)) dtb__519)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__520, dtb__521, dtb__522, dtb__523, dtb__524) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__523) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + 1)) dtb__524))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__525, dtb__526, dtb__527) -> (dtb__526 >= mc0)
  | _ -> false
))
# 719 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyPairFree = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__528, dtb__529) -> (match dtb__528 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__530; Base_dPair.f_Base_dPair_dPair_second = dtb__531 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__530) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__529))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 723 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyAltFree = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__532, dtb__533) -> (match dtb__532 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__534; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__535; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__536 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + (Base_dList.v_Base_dList_dlength dtb__535))) dtb__536) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree mc0) dtb__533))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 730 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__537, dtb__538, dtb__539) -> (if (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__537) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__538)) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__539))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__540, dtb__541) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__540) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts dtb__541))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__542, dtb__543, dtb__544, dtb__545, dtb__546) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__542) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__546))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__547, dtb__548, dtb__549, dtb__550, dtb__551) -> (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__547)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__552, dtb__553) -> (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__553)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__554, dtb__555) -> (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__555)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__556, dtb__557) -> (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__557)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__558, dtb__559, dtb__560) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__558) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__559))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__561, dtb__562, dtb__563) -> (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__563)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__564, dtb__565, dtb__566, dtb__567, dtb__568) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__567) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__568))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__569, dtb__570, dtb__571) -> (dtb__570 < 0)
  | _ -> false
))
# 744 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__572, dtb__573) -> (match dtb__572 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__574; Base_dPair.f_Base_dPair_dPair_second = dtb__575 } -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__574) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__573))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 748 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__576, dtb__577) -> (match dtb__576 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__578; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__579; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__580 } -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__580) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts dtb__577))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 756 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel = (fun fuel sols v -> (if (fuel <= 0) then false else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__581, dtb__582) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__581) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__583) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__583)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__584) -> (match dtb__584 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__585, dtb__586, dtb__587) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__587)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__588, dtb__589) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__589)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__590, dtb__591, dtb__592, dtb__593, dtb__594) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__593) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__594))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__595, dtb__596, dtb__597) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__597)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__598, dtb__599) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__599)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__600, dtb__601) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__600) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__601))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__602, dtb__603) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__602)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (dtb__604, dtb__605, dtb__606, dtb__607, dtb__608) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__604)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__609, dtb__610, dtb__611) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__609) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__610)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__611))
  | _ -> false
)))
# 782 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel = (fun fuel sols vs -> (if (fuel <= 0) then false else (match vs with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__612, dtb__613) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__612) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__613))
  | _ -> failwith "DT: impossible branch"
)))
# 792 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel = (fun fuel sols clo -> (if (fuel <= 0) then false else (match clo with
  | { f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = dtb__614; f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__615 } -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__614)
  | _ -> failwith "DT: impossible branch"
)))

# 753 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue = (fun sols v -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel 64) sols) v))

# 779 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaList = (fun sols vs -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel 64) sols) vs))

# 789 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaClo = (fun sols clo -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel 64) sols) clo))

# 800 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_disTypeValue = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__616) -> true
  | _ -> false
))

# 804 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__617) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__617))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 812 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__618) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__619) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__620) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__621) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__622) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__623, dtb__624, dtb__625) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__623) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__624)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__625))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (dtb__626, dtb__627, dtb__628, dtb__629, dtb__630) -> (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__626)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__631, dtb__632) -> (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__631)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__633, dtb__634) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__633) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__634))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__635, dtb__636) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__636)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__637, dtb__638) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__638)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__639, dtb__640, dtb__641) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo mc0) dtb__641)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__642, dtb__643, dtb__644, dtb__645, dtb__646) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__645) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo mc0) dtb__646))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__647) -> (match dtb__647 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__648, dtb__649, dtb__650) -> (if (dtb__649 >= mc0) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__650))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__651, dtb__652) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__652)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 832 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__653, dtb__654) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) 0) dtb__653) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__654))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 836 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = dtb__655; f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__656 } -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__655)
  | _ -> failwith "DT: impossible branch"
))

# 905 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dshowBinders = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__657, dtb__658) -> (match dtb__657 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__659; Base_dPair.f_Base_dPair_dPair_second = dtb__660 } -> (String.concat "" [" "; dtb__659; (v_Vuna_dCompiler_dCore_dTerm_dshowBinders dtb__658)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 912 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__661, dtb__662) -> (if (dtb__661 = 34) then ("\\\"" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__662)) else (if (dtb__661 = 92) then ("\\\\" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__662)) else (if (dtb__661 = 10) then ("\\n" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__662)) else (if (dtb__661 = 9) then ("\\t" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__662)) else (if (dtb__661 = 13) then ("\\r" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__662)) else ((Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Cons (dtb__661, Base_dList.C_Base_dList_dList_Nil))) ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__662)))))))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 909 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dshowCoreString = (fun s -> (String.concat "" ["\""; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars (Base_dList.dtp_unpack s)); "\""]))

# 839 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dshowTerm = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__663, dtb__664, dtb__665) -> (String.concat "" ["if "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__663); " then "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__664); " else "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__665)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__666) -> (if dtb__666 then "True" else "False")
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__667) -> dtb__667
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__668) -> (v_Vuna_dCompiler_dCore_dTerm_dshowCoreString dtb__668)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__669) -> (bi_strFromInt dtb__669)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__670, dtb__671) -> (String.concat "" ["case "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__670); " of "; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__671)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__672, dtb__673, dtb__674, dtb__675, dtb__676) -> (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__672); " with "; dtb__673; " "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__676)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__677, dtb__678, dtb__679, dtb__680, dtb__681) -> (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__677); "."; dtb__678; "#"; (bi_strFromInt dtb__681)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__682, dtb__683) -> ((v_Vuna_dCompiler_dCore_dTerm_drecordAppShow dtb__682) dtb__683)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__684, dtb__685) -> (String.concat "" ["("; dtb__684; (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__685); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__686, dtb__687) -> (String.concat "" ["("; dtb__686; (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__687); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__688, dtb__689, dtb__690) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__688); " "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__689); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__691, dtb__692, dtb__693) -> (String.concat "" ["\\"; dtb__691; " => "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__693)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__694, dtb__695, dtb__696, dtb__697, dtb__698) -> (if (dtb__694 = "_") then (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__697); " -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__698)]) else (if dtb__695 then (String.concat "" ["{"; dtb__694; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__697); "} -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__698)]) else (String.concat "" ["("; dtb__694; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__697); ") -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__698)])))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__699) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__699) = 0) then "Type" else ("Type " ^ (bi_strFromInt (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__699))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__700) -> dtb__700
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__701) -> ("?" ^ (bi_strFromInt dtb__701))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__702, dtb__703, dtb__704) -> dtb__702
  | _ -> failwith "DT: impossible branch"
))
# 885 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__705, dtb__706) -> (match dtb__705 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__707; Base_dPair.f_Base_dPair_dPair_second = dtb__708 } -> (String.concat "" [" "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__707); (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__706)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 890 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_drecordAppShow = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__709, dtb__710) -> (match dtb__709 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__711; Base_dPair.f_Base_dPair_dPair_second = dtb__712 } -> ((v_Vuna_dCompiler_dCore_dTerm_drecordAppShow (String.concat "" ["("; mc0; " "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__711); ")"])) dtb__710)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))
# 900 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__713, dtb__714) -> (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__713); (v_Vuna_dCompiler_dCore_dTerm_dshowBinders (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__713)); " => "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__713)); " | "; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__714)])
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 866 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__715, dtb__716) -> ((v_Vuna_dCompiler_dCore_dTerm_dshowSigAppText dtb__715) dtb__716)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__717, dtb__718) -> (match dtb__718 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__717
  | _ -> (String.concat "" ["("; dtb__717; (v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs dtb__718); ")"])
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__719, dtb__720, dtb__721) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__719); " "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__720); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__722, dtb__723, dtb__724, dtb__725, dtb__726) -> (if (dtb__722 = "_") then (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__725); " -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__726)]) else (if dtb__723 then (String.concat "" ["{"; dtb__722; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__725); "} -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__726)]) else (String.concat "" ["("; dtb__722; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__725); ") -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dtb__726)])))
  | _ -> (v_Vuna_dCompiler_dCore_dTerm_dshowTerm mc0)
))
# 877 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__727, dtb__728, dtb__729, dtb__730, dtb__731) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__727, dtb__728, dtb__729, dtb__730, dtb__731))); ")"])
  | _ -> (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig mc0)
))
# 881 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__732, dtb__733) -> (match dtb__732 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__734; Base_dPair.f_Base_dPair_dPair_second = dtb__735 } -> (String.concat "" [" "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__734); (v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs dtb__733)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 895 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowSigAppText = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__736, dtb__737) -> (match dtb__736 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__738; Base_dPair.f_Base_dPair_dPair_second = dtb__739 } -> ((v_Vuna_dCompiler_dCore_dTerm_dshowSigAppText (String.concat "" ["("; mc0; " "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__738); ")"])) dtb__737)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))
