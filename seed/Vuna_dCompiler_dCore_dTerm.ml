open Vuna_runtime
type t_Vuna_dCompiler_dCore_dTerm_dRig = C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 | C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
and t_Vuna_dCompiler_dCore_dTerm_dLevel = int
and t_Vuna_dCompiler_dCore_dTerm_dTerm = C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar of (string) * (int) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta of (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal of (string) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType of (t_Vuna_dCompiler_dCore_dTerm_dLevel) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi of (string) * (bool) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam of (string) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dRig) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon of (string) * ((t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk of (string) * ((t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (int) * (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (int Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt of (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr of (string) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool of (bool) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat of (string) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord of (string) * ((t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList)
and t_Vuna_dCompiler_dCore_dTerm_dBinder = { f_Vuna_dCompiler_dCore_dTerm_dBinder_binderName : string; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderRig : t_Vuna_dCompiler_dCore_dTerm_dRig; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan }
and t_Vuna_dCompiler_dCore_dTerm_dCaseAlt = { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName : string; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders : t_Vuna_dCompiler_dCore_dTerm_dBinder Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody : t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dCore_dTerm_dClosure = { f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv : t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody : t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dCore_dTerm_dNeutral = C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar of (string) * (int) * (t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal of (string) * (t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList)
and t_Vuna_dCompiler_dCore_dTerm_dValue = C_Vuna_dCompiler_dCore_dTerm_dValue_VType of (t_Vuna_dCompiler_dCore_dTerm_dLevel) | C_Vuna_dCompiler_dCore_dTerm_dValue_VPi of (string) * (bool) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dClosure) | C_Vuna_dCompiler_dCore_dTerm_dValue_VLam of (string) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dClosure) | C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral of (t_Vuna_dCompiler_dCore_dTerm_dNeutral) | C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta of (int) * (t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dValue_VApp of (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dValue) | C_Vuna_dCompiler_dCore_dTerm_dValue_VCon of (string) * (t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dValue_VCase of (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dVCaseAlt Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dValue_VProj of (t_Vuna_dCompiler_dCore_dTerm_dValue) * (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (int) * (int) | C_Vuna_dCompiler_dCore_dTerm_dValue_VInt of (int) | C_Vuna_dCompiler_dCore_dTerm_dValue_VStr of (string) | C_Vuna_dCompiler_dCore_dTerm_dValue_VBool of (bool) | C_Vuna_dCompiler_dCore_dTerm_dValue_VIf of (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dValue) | C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat of (string)
and t_Vuna_dCompiler_dCore_dTerm_dVCaseAlt = { f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltName : string; f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltBinders : (string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltClosure : t_Vuna_dCompiler_dCore_dTerm_dClosure }
and t_Vuna_dCompiler_dCore_dTerm_dSols = { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl : (int, t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList : (int, t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth : (int, int) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap }

# 35 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_drigIsErased = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dRig) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> false
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> false
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> true
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_drigIsLinear = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dRig) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> true
  | _ -> false
))

# 44 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_drigIsOmega = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dRig) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> true
  | _ -> false
))

# 51 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_drigOfBinder = (fun (mc0 : bool) (mc1 : bool) -> (if mc0 then C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 else (if mc1 then C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 else C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)))

# 56 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_ddefaultExplicitRig = C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega

# 63 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_drigAdd = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dRig) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dRig) -> (match mc0 with
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
let v_Vuna_dCompiler_dCore_dTerm_drigScale = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dRig) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dRig) -> (match mc0 with
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
let v_Vuna_dCompiler_dCore_dTerm_drigJoin = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dRig) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dRig) -> (match mc0 with
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
let v_Vuna_dCompiler_dCore_dTerm_drigExact = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dRig) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dRig) -> (match mc0 with
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
let v_Vuna_dCompiler_dCore_dTerm_dshowRig = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dRig) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> "\207\137"
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> "1"
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> "0"
  | _ -> failwith "DT: impossible branch"
))

# 101 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dlevelZero = 0

# 104 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dlevelSucc = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dLevel) -> (let dtb__0 = mc0 in (dtb__0 + 1)))

# 107 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dlevelMax = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dLevel) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dLevel) -> (let dtb__1 = mc0 in (let dtb__2 = mc1 in (if (dtb__1 >= dtb__2) then dtb__1 else dtb__2))))

# 110 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dlevelToInt = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dLevel) -> (let dtb__3 = mc0 in dtb__3))

# 114 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt = (fun n -> n)

# 117 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dlevelEq = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dLevel) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dLevel) -> (let dtb__4 = mc0 in (let dtb__5 = mc1 in (dtb__4 = dtb__5))))

# 120 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dlevelLt = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dLevel) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dLevel) -> (let dtb__6 = mc0 in (let dtb__7 = mc1 in (dtb__6 < dtb__7))))

# 166 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dbinderNameOf = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dBinder) -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dBinder_binderName = dtb__8; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderRig = dtb__9; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderSpan = dtb__10 } -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

# 169 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dbinderRigOf = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dBinder) -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dBinder_binderName = dtb__11; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderRig = dtb__12; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderSpan = dtb__13 } -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dbinderSpanOf = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dBinder) -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dBinder_binderName = dtb__14; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderRig = dtb__15; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderSpan = dtb__16 } -> dtb__16
  | _ -> failwith "DT: impossible branch"
))

# 176 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dbinderPair = (fun b -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dCore_dTerm_dbinderNameOf b); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dCore_dTerm_dbinderRigOf b) })

# 179 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dbinderPairs = (fun bs -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dCore_dTerm_dbinderPair) bs))

# 183 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dbinderOfPair = (fun (mc0 : (string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__17; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__18 } -> { f_Vuna_dCompiler_dCore_dTerm_dBinder_binderName = dtb__17; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderRig = dtb__18; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderSpan = Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty }
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dbindersOfPairs = (fun ps -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dCore_dTerm_dbinderOfPair) ps))

# 195 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dcaseAltName = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__19; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__20; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__21 } -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

# 198 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__22; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__23; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__24 } -> dtb__23
  | _ -> failwith "DT: impossible branch"
))

# 201 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__25; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__26; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__27 } -> dtb__27
  | _ -> failwith "DT: impossible branch"
))

# 239 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel = 512

# 253 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dnatChainMax = 4611686018427387903

# 283 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dnatChainNext = (fun n -> (if (n >= v_Vuna_dCompiler_dCore_dTerm_dnatChainMax) then v_Vuna_dCompiler_dCore_dTerm_dnatChainMax else (n + 1)))

# 290 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dflattenTermAppGo = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc1 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__28, dtb__29) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__28)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__29) mc1) }
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__30, dtb__31, dtb__32) -> ((v_Vuna_dCompiler_dCore_dTerm_dflattenTermAppGo dtb__30) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__31; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__32 }, mc1)))
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }
))

# 287 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dflattenTermApp = (fun t -> ((v_Vuna_dCompiler_dCore_dTerm_dflattenTermAppGo t) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 263 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dnatChainGo = (fun fuel t -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match (v_Vuna_dCompiler_dCore_dTerm_dflattenTermApp t) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__33; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__34 } -> (match dtb__33 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__35, dtb__36) -> (((v_Vuna_dCompiler_dCore_dTerm_dnatChainArgs (fuel - 1)) dtb__35) ((Base_dData_dList.v_Base_dData_dList_dappend dtb__36) dtb__34))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__37) -> (((v_Vuna_dCompiler_dCore_dTerm_dnatChainArgs (fuel - 1)) dtb__37) dtb__34)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)))
# 271 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dnatChainArgs = (fun fuel c args -> (if (c = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor) then (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (0))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (c = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__38, dtb__39) -> (match dtb__38 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__40; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__41 } -> (match dtb__39 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dCore_dTerm_dnatChainGo fuel) dtb__40) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__42) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dCore_dTerm_dnatChainNext dtb__42)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) args) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))

# 260 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dnatChainValue = (fun t -> ((v_Vuna_dCompiler_dCore_dTerm_dnatChainGo 1000000) t))

# 298 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dtermSize = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__43, dtb__44, dtb__45) -> (((1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__43)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__44)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__45))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__46) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__47) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__48) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__49) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__50, dtb__51, dtb__52, dtb__53, dtb__54) -> ((1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__50)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__54))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__55, dtb__56, dtb__57, dtb__58, dtb__59) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__55))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__60, dtb__61) -> ((1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__60)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeAlts dtb__61))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__62, dtb__63) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs dtb__63))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__64, dtb__65) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs dtb__65))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__66, dtb__67) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs dtb__67))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__68, dtb__69, dtb__70) -> ((1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__68)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__69))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__71, dtb__72, dtb__73, dtb__74, dtb__75) -> ((1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeMaybe dtb__73)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__75))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__76, dtb__77, dtb__78, dtb__79, dtb__80) -> ((1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__79)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__80))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__81) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__82) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__83) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__84, dtb__85, dtb__86) -> 1
  | _ -> failwith "DT: impossible branch"
))
# 318 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dtermSizeMaybe = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__87) -> (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__87)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))
# 322 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs = (fun (mc0 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__88, dtb__89) -> (match dtb__88 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__90; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__91 } -> ((v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__90) + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs dtb__89))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 326 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dtermSizeAlts = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__92, dtb__93) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermSize (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__92)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeAlts dtb__93))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 334 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dmetaLookup = (fun i t -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dInt.v_Hashable_uInt) Base_dData_dInt.v_Eq_uInt) i) t))

# 338 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList = (fun (mc0 : int) (mc1 : (int, t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__94, dtb__95) -> (match dtb__94 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__96; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__97 } -> (if (mc0 = dtb__96) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__97)) else ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList mc0) dtb__95))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 357 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty = { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dInt.v_Hashable_uInt) Base_dData_dList.C_Base_dData_dList_dList_Nil); f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dInt.v_Hashable_uInt) Base_dData_dList.C_Base_dData_dList_dList_Nil) }

# 360 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsFromList = (fun xs -> { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = (((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsertAll Base_dData_dInt.v_Hashable_uInt) xs) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dInt.v_Hashable_uInt) Base_dData_dList.C_Base_dData_dList_dList_Nil)); f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = xs; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dInt.v_Hashable_uInt) Base_dData_dList.C_Base_dData_dList_dList_Nil) })

# 364 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsOf = (fun t xs d -> { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = t; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = xs; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = d })

# 367 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsList = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dSols) -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__98; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__99; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__100 } -> dtb__99
  | _ -> failwith "DT: impossible branch"
))

# 371 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsDepth = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dSols) -> (match mc1 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__101; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__102; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__103 } -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dInt.v_Hashable_uInt) Base_dData_dInt.v_Eq_uInt) mc0) dtb__103)
  | _ -> failwith "DT: impossible branch"
))

# 376 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsLookup = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dSols) -> (match mc1 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__104; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__105; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__106 } -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dInt.v_Hashable_uInt) Base_dData_dInt.v_Eq_uInt) mc0) dtb__104)
  | _ -> failwith "DT: impossible branch"
))

# 379 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsCons = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dValue) (mc2 : t_Vuna_dCompiler_dCore_dTerm_dSols) -> (match mc2 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__107; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__108; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__109 } -> { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dInt.v_Hashable_uInt) mc0) mc1) dtb__107); f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }, dtb__108)); f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__109 }
  | _ -> failwith "DT: impossible branch"
))

# 384 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dSols) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__110, dtb__111, dtb__112) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__110) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__111)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__112))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__113) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__114) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__115) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__116) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__117, dtb__118) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__117) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts mc0) dtb__118))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__119, dtb__120, dtb__121, dtb__122, dtb__123) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__119) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__123))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__124, dtb__125, dtb__126, dtb__127, dtb__128) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__124)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__129, dtb__130) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__130)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__131, dtb__132) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__132)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__133, dtb__134) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__134)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__135, dtb__136, dtb__137) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__135) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__136))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__138, dtb__139, dtb__140, dtb__141, dtb__142) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaMaybe mc0) dtb__140) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__142))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__143, dtb__144, dtb__145, dtb__146, dtb__147) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__146) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__147))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__148) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__149) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__150, dtb__151, dtb__152) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__153) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__153) mc0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__154) -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 411 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaMaybe = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dSols) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__155) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__155)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 415 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dSols) (mc1 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__156, dtb__157) -> (match dtb__156 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__158; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__159 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__158) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__157))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 420 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dSols) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__160, dtb__161) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__160)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts mc0) dtb__161))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 427 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__162, dtb__163, dtb__164) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__162) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__163)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__164))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__165) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__166) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__167) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__168, dtb__169) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__168) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat mc0) dtb__169))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__170, dtb__171, dtb__172, dtb__173, dtb__174) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__170) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__174))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__175, dtb__176, dtb__177, dtb__178, dtb__179) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__175)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__180, dtb__181) -> ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__181)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__182, dtb__183) -> ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__183)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__184, dtb__185) -> ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__185)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__186, dtb__187, dtb__188) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__186) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__187))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__189, dtb__190, dtb__191, dtb__192, dtb__193) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__193)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__194, dtb__195, dtb__196, dtb__197, dtb__198) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__197) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__198))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__199) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__200) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__201, dtb__202, dtb__203) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__204) -> ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__204) mc0)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__205) -> true
  | _ -> failwith "DT: impossible branch"
))
# 450 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__206, dtb__207) -> (match dtb__206 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__208; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__209 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__208) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__207))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 455 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__210, dtb__211) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__210)) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat mc0) dtb__211))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 461 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__212, dtb__213, dtb__214) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__212)) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__213)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__214)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__215) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__216) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__217) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__218, dtb__219) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__218)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (a : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody a)))) dtb__219))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__220, dtb__221, dtb__222, dtb__223, dtb__224) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__220)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__224))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__225, dtb__226, dtb__227, dtb__228, dtb__229) -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__225)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__230, dtb__231) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__230, ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (p : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)))) dtb__231)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__232, dtb__233) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (p : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)))) dtb__233)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__234, dtb__235) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (p : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)))) dtb__235)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__236, dtb__237, dtb__238) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__236)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__237))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__239, dtb__240, dtb__241, dtb__242, dtb__243) -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__243)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__244, dtb__245, dtb__246, dtb__247, dtb__248) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__247)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__248))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__249) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__250) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__251, dtb__252, dtb__253) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__254) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__254, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__255) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 509 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dlookupPair = (fun (mc0 : string) (mc1 : (string, t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__256, dtb__257) -> (match dtb__256 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__258; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__259 } -> (if (dtb__258 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__259)) else ((v_Vuna_dCompiler_dCore_dTerm_dlookupPair mc0) dtb__257))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 502 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf = (fun (mc0 : (string, t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__260, dtb__261) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dlookupPair dtb__260) mc0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__262) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__262, ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc0) dtb__261)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc0) dtb__261)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 493 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel = (fun (mc0 : int) (mc1 : (string, t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__263, dtb__264) -> (if (mc0 <= 0) then false else (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc2) dtb__263) then true else ((((v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel (mc0 - 1)) mc1) mc2) ((Base_dData_dList.v_Base_dData_dList_dappend dtb__264) ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc1) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__263))))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 488 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dtermReachesFloat = (fun defs names t -> ((((v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel 4096) defs) names) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (t, Base_dData_dList.C_Base_dData_dList_dList_Nil))))

# 513 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_ddefLookup = (fun name tbl -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) tbl))

# 517 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__265, dtb__266, dtb__267) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__265) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__266)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__267))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__268) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__269) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__270) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__271) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__272, dtb__273) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__272) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts mc0) dtb__273))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__274, dtb__275, dtb__276, dtb__277, dtb__278) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__274) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + (Base_dData_dList.v_Base_dData_dList_dlength dtb__276))) dtb__278))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__279, dtb__280, dtb__281, dtb__282, dtb__283) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__279)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__284, dtb__285) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__285)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__286, dtb__287) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__287)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__288, dtb__289) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__289)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__290, dtb__291, dtb__292) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__290) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__291))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__293, dtb__294, dtb__295, dtb__296, dtb__297) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarMaybe mc0) dtb__295) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + 1)) dtb__297))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__298, dtb__299, dtb__300, dtb__301, dtb__302) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__301) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + 1)) dtb__302))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__303) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__304) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__305) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__306, dtb__307, dtb__308) -> (dtb__307 >= mc0)
  | _ -> failwith "DT: impossible branch"
))
# 540 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarMaybe = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__309) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__309)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 544 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs = (fun (mc0 : int) (mc1 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__310, dtb__311) -> (match dtb__310 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__312; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__313 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__312) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__311))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 548 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__314, dtb__315) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + (Base_dData_dList.v_Base_dData_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__314)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__314)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts mc0) dtb__315))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 553 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dhasMeta = (fun (mc0 : int) (mc1 : int) (mc2 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__316, dtb__317, dtb__318) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__316) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__317)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__318))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__319) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__320) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__321) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__322) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__323, dtb__324) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__323) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts mc0) mc1) dtb__324))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__325, dtb__326, dtb__327, dtb__328, dtb__329) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__325) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + (Base_dData_dList.v_Base_dData_dList_dlength dtb__327))) dtb__329))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__330, dtb__331, dtb__332, dtb__333, dtb__334) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__330)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__335, dtb__336) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__336)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__337, dtb__338) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__338)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__339, dtb__340) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__340)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__341, dtb__342, dtb__343) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__341) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__342))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__344, dtb__345, dtb__346, dtb__347, dtb__348) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaMaybe mc0) mc1) dtb__346) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + 1)) dtb__348))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__349, dtb__350, dtb__351, dtb__352, dtb__353) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__352) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + 1)) dtb__353))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__354) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__355) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__356, dtb__357, dtb__358) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__359) -> (mc0 = dtb__359)
  | _ -> failwith "DT: impossible branch"
))
# 574 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaMaybe = (fun (mc0 : int) (mc1 : int) (mc2 : t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__360) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__360)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 578 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs = (fun (mc0 : int) (mc1 : int) (mc2 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__361, dtb__362) -> (match dtb__361 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__363; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__364 } -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__363) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__362))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 582 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts = (fun (mc0 : int) (mc1 : int) (mc2 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__365, dtb__366) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + (Base_dData_dList.v_Base_dData_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__365)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__365)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts mc0) mc1) dtb__366))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 588 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dmapTermMaybe = (fun (mc0 : (t_Vuna_dCompiler_dCore_dTerm_dTerm) -> t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__367) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((mc0 dtb__367)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 596 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dshift = (fun (mc0 : int) (mc1 : int) (mc2 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__368, dtb__369, dtb__370) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__368), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__369), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__370)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__371) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__372) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__373) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__374) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__375, dtb__376) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__375), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts mc0) mc1) dtb__376)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__377, dtb__378, dtb__379, dtb__380, dtb__381) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__377), dtb__378, dtb__379, dtb__380, (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + (Base_dData_dList.v_Base_dData_dList_dlength dtb__379))) mc1) dtb__381)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__382, dtb__383, dtb__384, dtb__385, dtb__386) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__382), dtb__383, dtb__384, dtb__385, dtb__386))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__387, dtb__388) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__387, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__388)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__389, dtb__390) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__389, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__390)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__391, dtb__392) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__391, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__392)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__393, dtb__394, dtb__395) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__393), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__394), dtb__395))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__396, dtb__397, dtb__398, dtb__399, dtb__400) -> ((fun mty2 -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__396, dtb__397, mty2, dtb__399, (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + 1)) mc1) dtb__400)))) (match dtb__398 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__401) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__401)))
  | _ -> failwith "DT: impossible branch"
))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__402, dtb__403, dtb__404, dtb__405, dtb__406) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__402, dtb__403, dtb__404, (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__405), (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + 1)) mc1) dtb__406)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__407) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__408) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__409) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__410, dtb__411, dtb__412) -> (if (dtb__411 >= mc0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__410, (dtb__411 + mc1), dtb__412)) else mc2)
  | _ -> failwith "DT: impossible branch"
))
# 625 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshiftArgs = (fun (mc0 : int) (mc1 : int) (mc2 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__413, dtb__414) -> (match dtb__413 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__415; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__416 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__415); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__416 }, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__414)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 630 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlts = (fun (mc0 : int) (mc1 : int) (mc2 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__417, dtb__418) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dCore_dTerm_dshiftAlt mc0) mc1) dtb__417), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts mc0) mc1) dtb__418)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 634 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlt = (fun (mc0 : int) (mc1 : int) (mc2 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) -> (match mc2 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__419; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__420; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__421 } -> { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__419; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__420; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + (Base_dData_dList.v_Base_dData_dList_dlength dtb__420))) mc1) dtb__421) }
  | _ -> failwith "DT: impossible branch"
))

# 639 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc2 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__422, dtb__423, dtb__424) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__422), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__423), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__424)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__425) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__426) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__427) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__428) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__429, dtb__430) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__429), ((Base_dData_dList.v_Base_dData_dList_dmap ((v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt mc0) mc1)) dtb__430)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__431, dtb__432, dtb__433, dtb__434, dtb__435) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__431), dtb__432, dtb__433, dtb__434, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (mc0 - (Base_dData_dList.v_Base_dData_dList_dlength dtb__433))) mc1) dtb__435)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__436, dtb__437, dtb__438, dtb__439, dtb__440) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__436), dtb__437, dtb__438, dtb__439, dtb__440))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__441, dtb__442) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__441, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__442)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__443, dtb__444) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__443, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__444)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__445, dtb__446) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__445, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__446)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__447, dtb__448, dtb__449) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__447), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__448), dtb__449))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__450, dtb__451, dtb__452, dtb__453, dtb__454) -> ((fun mty2 -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__450, dtb__451, mty2, dtb__453, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (mc0 + 1)) mc1) dtb__454)))) (match dtb__452 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__455) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__455)))
  | _ -> failwith "DT: impossible branch"
))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__456, dtb__457, dtb__458, dtb__459, dtb__460) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__456, dtb__457, dtb__458, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__459), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (mc0 + 1)) mc1) dtb__460)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__461) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__462) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__463) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__464, dtb__465, dtb__466) -> (if (dtb__465 = mc0) then mc1 else mc2)
  | _ -> failwith "DT: impossible branch"
))
# 671 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt = (fun idx arg alt -> { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt); f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt); f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (idx + (Base_dData_dList.v_Base_dData_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)))) arg) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)) })

# 679 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo = (fun (mc0 : int) (mc1 : string) (mc2 : int) (mc3 : int) (mc4 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__467, dtb__468, dtb__469) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__467), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__468), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__469)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__470, dtb__471) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__470), ((Base_dData_dList.v_Base_dData_dList_dmap ((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt mc0) mc1) mc2) mc3)) dtb__471)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__472, dtb__473, dtb__474, dtb__475, dtb__476) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__472), dtb__473, dtb__474, dtb__475, dtb__476))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__477, dtb__478) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__477, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__478)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__479, dtb__480) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__479, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__480)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__481, dtb__482) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__481, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__482)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__483, dtb__484, dtb__485) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__483), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__484), dtb__485))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__486, dtb__487, dtb__488, dtb__489, dtb__490) -> ((fun mty2 -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__486, dtb__487, mty2, dtb__489, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__490)))) (match dtb__488 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__491) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__491)))
  | _ -> failwith "DT: impossible branch"
))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__492, dtb__493, dtb__494, dtb__495, dtb__496) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__492, dtb__493, dtb__494, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__495), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__496)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__497) -> (if (dtb__497 = mc0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (mc1, (mc3 - mc2), { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })) else mc4)
  | _ -> mc4
))
# 707 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt = (fun (mc0 : int) (mc1 : string) (mc2 : int) (mc3 : int) (mc4 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) -> (match mc4 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__498; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__499; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__500 } -> { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__498; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__499; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + (Base_dData_dList.v_Base_dData_dList_dlength dtb__499))) dtb__500) }
  | _ -> failwith "DT: impossible branch"
))

# 676 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar = (fun m name q t -> (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) 0) t))

# 719 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo = (fun (mc0 : string) (mc1 : int) (mc2 : t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc3 : int) (mc4 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__501, dtb__502, dtb__503, dtb__504, dtb__505) -> (if (mc3 = mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__501, dtb__502, dtb__503, dtb__504, (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (mc0, true, C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, mc2, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__505))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__501, dtb__502, dtb__503, dtb__504, (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo mc0) mc1) mc2) (mc3 + 1)) dtb__505))))
  | _ -> mc4
))

# 713 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder = (fun name idx dictDom t -> (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo name) idx) dictDom) 0) t))

# 729 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinderGo = (fun (mc0 : string) (mc1 : int) (mc2 : t_Vuna_dCompiler_dCore_dTerm_dRig) (mc3 : t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc4 : int) (mc5 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc5 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__506, dtb__507, dtb__508, dtb__509, dtb__510) -> (if (mc4 = mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__506, dtb__507, dtb__508, dtb__509, (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (mc0, true, mc2, mc3, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__510))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__506, dtb__507, dtb__508, dtb__509, ((((((v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinderGo mc0) mc1) mc2) mc3) (mc4 + 1)) dtb__510))))
  | _ -> mc5
))

# 726 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinder = (fun name idx rig dom t -> ((((((v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinderGo name) idx) rig) dom) 0) t))

# 736 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dcutoffOf = (fun total idx -> (if ((total - (idx + 1)) <= 0) then 0 else (total - (idx + 1))))

# 739 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dcountPis = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__511, dtb__512, dtb__513, dtb__514, dtb__515) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dcountPis dtb__515))
  | _ -> 0
))

# 751 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo = (fun (mc0 : string) (mc1 : int) (mc2 : int) (mc3 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc3 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__516, dtb__517, dtb__518, dtb__519, dtb__520) -> (if (mc2 = mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__516, dtb__517, dtb__518, dtb__519, (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (mc0, C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__520))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__516, dtb__517, dtb__518, dtb__519, ((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo mc0) mc1) (mc2 + 1)) dtb__520))))
  | _ -> mc3
))

# 748 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder = (fun name idx t -> ((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo name) idx) 0) t))

# 757 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dcountLams = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__521, dtb__522, dtb__523, dtb__524, dtb__525) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dcountLams dtb__525))
  | _ -> 0
))

# 762 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__526, dtb__527, dtb__528) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__526) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__527)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__528))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__529, dtb__530) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__529) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree mc0) dtb__530))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__531, dtb__532, dtb__533, dtb__534, dtb__535) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__531) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + (Base_dData_dList.v_Base_dData_dList_dlength dtb__533))) dtb__535))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__536, dtb__537, dtb__538, dtb__539, dtb__540) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__536)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__541, dtb__542) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__542)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__543, dtb__544) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__544)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__545, dtb__546) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__546)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__547, dtb__548, dtb__549) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__547) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__548))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__550, dtb__551, dtb__552, dtb__553, dtb__554) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVarMaybe mc0) dtb__552) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + 1)) dtb__554))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__555, dtb__556, dtb__557, dtb__558, dtb__559) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__558) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + 1)) dtb__559))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__560, dtb__561, dtb__562) -> (dtb__561 >= mc0)
  | _ -> false
))
# 779 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVarMaybe = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__563) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__563)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 783 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyPairFree = (fun (mc0 : int) (mc1 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__564, dtb__565) -> (match dtb__564 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__566; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__567 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__566) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__565))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 787 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyAltFree = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__568, dtb__569) -> (match dtb__568 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__570; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__571; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__572 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + (Base_dData_dList.v_Base_dData_dList_dlength dtb__571))) dtb__572) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree mc0) dtb__569))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 794 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__573, dtb__574, dtb__575) -> (if (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__573) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__574)) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__575))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__576, dtb__577) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__576) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts dtb__577))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__578, dtb__579, dtb__580, dtb__581, dtb__582) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__578) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__582))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__583, dtb__584, dtb__585, dtb__586, dtb__587) -> (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__583)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__588, dtb__589) -> (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__589)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__590, dtb__591) -> (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__591)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__592, dtb__593) -> (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__593)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__594, dtb__595, dtb__596) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__594) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__595))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__597, dtb__598, dtb__599, dtb__600, dtb__601) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVarMaybe dtb__599) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__601))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__602, dtb__603, dtb__604, dtb__605, dtb__606) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__605) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__606))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__607, dtb__608, dtb__609) -> (dtb__608 < 0)
  | _ -> false
))
# 808 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVarMaybe = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__610) -> (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__610)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 812 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs = (fun (mc0 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__611, dtb__612) -> (match dtb__611 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__613; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__614 } -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__613) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__612))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 816 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__615, dtb__616) -> (match dtb__615 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__617; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__618; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__619 } -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__619) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts dtb__616))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 824 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel = (fun fuel sols v -> (if (fuel <= 0) then false else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__620, dtb__621) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__620) sols) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__622) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__622)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__623) -> (match dtb__623 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__624, dtb__625, dtb__626) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__626)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__627, dtb__628) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__628)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__629, dtb__630, dtb__631, dtb__632, dtb__633) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__632) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__633))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__634, dtb__635, dtb__636) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__636)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__637, dtb__638) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__638)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__639, dtb__640) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__639) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__640))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__641, dtb__642) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__641)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (dtb__643, dtb__644, dtb__645, dtb__646, dtb__647) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__643)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__648, dtb__649, dtb__650) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__648) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__649)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__650))
  | _ -> false
)))
# 850 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel = (fun fuel sols vs -> (if (fuel <= 0) then false else (match vs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__651, dtb__652) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__651) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__652))
  | _ -> failwith "DT: impossible branch"
)))
# 860 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel = (fun fuel sols clo -> (if (fuel <= 0) then false else (match clo with
  | { f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = dtb__653; f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__654 } -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__653)
  | _ -> failwith "DT: impossible branch"
)))

# 821 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue = (fun sols v -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel 64) sols) v))

# 847 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaList = (fun sols vs -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel 64) sols) vs))

# 857 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaClo = (fun sols clo -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel 64) sols) clo))

# 868 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_disTypeValue = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__655) -> true
  | _ -> false
))

# 872 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__656) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__656))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 880 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes = (fun (mc0 : int) (mc1 : int) (mc2 : t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__657) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__658) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__659) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__660) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__661) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__662, dtb__663, dtb__664) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__662) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__663)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__664))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (dtb__665, dtb__666, dtb__667, dtb__668, dtb__669) -> (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__665)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__670, dtb__671) -> (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__670)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__672, dtb__673) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__672) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__673))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__674, dtb__675) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__675)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__676, dtb__677) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__677)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__678, dtb__679, dtb__680) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo mc0) dtb__680)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__681, dtb__682, dtb__683, dtb__684, dtb__685) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__684) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo mc0) dtb__685))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__686) -> (match dtb__686 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__687, dtb__688, dtb__689) -> (if (dtb__688 >= mc0) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__689))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__690, dtb__691) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__691)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 900 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__692, dtb__693) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) 0) dtb__692) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__693))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 904 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dClosure) -> (match mc1 with
  | { f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = dtb__694; f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__695 } -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__694)
  | _ -> failwith "DT: impossible branch"
))

# 978 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dshowBinders = (fun (mc0 : (string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__696, dtb__697) -> (match dtb__696 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__698; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__699 } -> (String.concat "" [" "; dtb__698; (v_Vuna_dCompiler_dCore_dTerm_dshowBinders dtb__697)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 985 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__700, dtb__701) -> (if (dtb__700 = 34) then ("\\\"" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__701)) else (if (dtb__700 = 92) then ("\\\\" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__701)) else (if (dtb__700 = 10) then ("\\n" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__701)) else (if (dtb__700 = 9) then ("\\t" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__701)) else (if (dtb__700 = 13) then ("\\r" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__701)) else ((Base_dData_dList.dtp_pack (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__700, Base_dData_dList.C_Base_dData_dList_dList_Nil))) ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__701)))))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 982 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dshowCoreString = (fun s -> (String.concat "" ["\""; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars (Base_dData_dList.dtp_unpack s)); "\""]))

# 907 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dshowTerm = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__702, dtb__703, dtb__704) -> (String.concat "" ["if "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__702); " then "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__703); " else "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__704)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__705) -> (if dtb__705 then "True" else "False")
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__706) -> dtb__706
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__707) -> (v_Vuna_dCompiler_dCore_dTerm_dshowCoreString dtb__707)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__708) -> (bi_strFromInt dtb__708)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__709, dtb__710) -> (String.concat "" ["case "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__709); " of "; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__710)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__711, dtb__712, dtb__713, dtb__714, dtb__715) -> (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__711); " with "; dtb__712; " "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__715)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__716, dtb__717, dtb__718, dtb__719, dtb__720) -> (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__716); "."; dtb__717; "#"; (bi_strFromInt dtb__720)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__721, dtb__722) -> ((v_Vuna_dCompiler_dCore_dTerm_drecordAppShow dtb__721) dtb__722)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__723, dtb__724) -> (String.concat "" ["("; dtb__723; (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__724); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__725, dtb__726) -> (String.concat "" ["("; dtb__725; (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__726); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__727, dtb__728, dtb__729) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__727); " "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__728); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__730, dtb__731, dtb__732, dtb__733, dtb__734) -> (String.concat "" ["\\"; dtb__730; " => "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__734)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__735, dtb__736, dtb__737, dtb__738, dtb__739) -> (if (dtb__735 = "_") then (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__738); " -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__739)]) else (if dtb__736 then (String.concat "" ["{"; dtb__735; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__738); "} -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__739)]) else (String.concat "" ["("; dtb__735; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__738); ") -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__739)])))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__740) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__740) = 0) then "Type" else ("Type " ^ (bi_strFromInt (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__740))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__741) -> dtb__741
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__742) -> ("?" ^ (bi_strFromInt dtb__742))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__743, dtb__744, dtb__745) -> dtb__743
  | _ -> failwith "DT: impossible branch"
))
# 958 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms = (fun (mc0 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__746, dtb__747) -> (match dtb__746 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__748; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__749 } -> (String.concat "" [" "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__748); (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__747)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 963 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_drecordAppShow = (fun (mc0 : string) (mc1 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__750, dtb__751) -> (match dtb__750 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__752; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__753 } -> ((v_Vuna_dCompiler_dCore_dTerm_drecordAppShow (String.concat "" ["("; mc0; " "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__752); ")"])) dtb__751)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))
# 973 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__754, dtb__755) -> (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__754); (v_Vuna_dCompiler_dCore_dTerm_dshowBinders (v_Vuna_dCompiler_dCore_dTerm_dbinderPairs (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__754))); " => "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__754)); " | "; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__755)])
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 936 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dshowPiSig = (fun name implicit dom cod -> (if (name = "_") then (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dom); " -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig cod)]) else (if implicit then (String.concat "" ["{"; name; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dom); "} -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig cod)]) else (String.concat "" ["("; name; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dom); ") -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig cod)]))))
# 942 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__756, dtb__757) -> ((v_Vuna_dCompiler_dCore_dTerm_dshowSigAppText dtb__756) dtb__757)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__758, dtb__759) -> (match dtb__759 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__758
  | _ -> (String.concat "" ["("; dtb__758; (v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs dtb__759); ")"])
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__760, dtb__761, dtb__762) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__760); " "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__761); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__763, dtb__764, dtb__765, dtb__766, dtb__767) -> ((((v_Vuna_dCompiler_dCore_dTerm_dshowPiSig dtb__763) dtb__764) dtb__766) dtb__767)
  | _ -> (v_Vuna_dCompiler_dCore_dTerm_dshowTerm mc0)
))
# 950 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__768, dtb__769, dtb__770, dtb__771, dtb__772) -> (String.concat "" ["("; ((((v_Vuna_dCompiler_dCore_dTerm_dshowPiSig dtb__768) dtb__769) dtb__771) dtb__772); ")"])
  | _ -> (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig mc0)
))
# 954 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs = (fun (mc0 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__773, dtb__774) -> (match dtb__773 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__775; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__776 } -> (String.concat "" [" "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__775); (v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs dtb__774)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 968 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowSigAppText = (fun (mc0 : string) (mc1 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__777, dtb__778) -> (match dtb__777 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__779; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__780 } -> ((v_Vuna_dCompiler_dCore_dTerm_dshowSigAppText (String.concat "" ["("; mc0; " "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__779); ")"])) dtb__778)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))
