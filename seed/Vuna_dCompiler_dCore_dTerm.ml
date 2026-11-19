open Vuna_runtime
type t_Vuna_dCompiler_dCore_dTerm_dRig = C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 | C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
and t_Vuna_dCompiler_dCore_dTerm_dLevel = int
and t_Vuna_dCompiler_dCore_dTerm_dTerm = C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar of (string) * (int) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta of (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal of (string) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType of (t_Vuna_dCompiler_dCore_dTerm_dLevel) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi of (string) * (bool) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam of (string) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * ((t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe, t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dRig) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon of (string) * ((t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk of (string) * ((t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (int) * (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (int Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt of (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr of (string) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool of (bool) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat of (string) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord of (string) * ((t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList)
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
let v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt = (fun (n : int) -> n)

# 117 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dlevelEq = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dLevel) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dLevel) -> (let dtb__4 = mc0 in (let dtb__5 = mc1 in (dtb__4 = dtb__5))))

# 120 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dlevelLt = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dLevel) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dLevel) -> (let dtb__6 = mc0 in (let dtb__7 = mc1 in (dtb__6 < dtb__7))))

# 167 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dbinderNameOf = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dBinder) -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dBinder_binderName = dtb__8; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderRig = dtb__9; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderSpan = dtb__10 } -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

# 170 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dbinderRigOf = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dBinder) -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dBinder_binderName = dtb__11; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderRig = dtb__12; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderSpan = dtb__13 } -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dbinderSpanOf = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dBinder) -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dBinder_binderName = dtb__14; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderRig = dtb__15; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderSpan = dtb__16 } -> dtb__16
  | _ -> failwith "DT: impossible branch"
))

# 177 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dbinderPair = (fun (b : t_Vuna_dCompiler_dCore_dTerm_dBinder) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dCore_dTerm_dbinderNameOf b); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dCore_dTerm_dbinderRigOf b) })

# 180 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dbinderPairs = (fun (bs : t_Vuna_dCompiler_dCore_dTerm_dBinder Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dCore_dTerm_dbinderPair) bs))

# 184 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dbinderOfPair = (fun (mc0 : (string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__17; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__18 } -> { f_Vuna_dCompiler_dCore_dTerm_dBinder_binderName = dtb__17; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderRig = dtb__18; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderSpan = Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty }
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dbindersOfPairs = (fun (ps : (string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dCore_dTerm_dbinderOfPair) ps))

# 196 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dcaseAltName = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__19; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__20; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__21 } -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

# 199 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__22; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__23; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__24 } -> dtb__23
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__25; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__26; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__27 } -> dtb__27
  | _ -> failwith "DT: impossible branch"
))

# 240 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel = 512

# 254 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dnatChainMax = 4611686018427387903

# 293 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dnatChainNext = (fun (n : int) -> (if (n >= v_Vuna_dCompiler_dCore_dTerm_dnatChainMax) then v_Vuna_dCompiler_dCore_dTerm_dnatChainMax else (n + 1)))

# 300 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dflattenTermAppGo = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc1 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__28, dtb__29) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__28)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__29) mc1) }
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__30, dtb__31, dtb__32) -> ((v_Vuna_dCompiler_dCore_dTerm_dflattenTermAppGo dtb__30) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__31; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__32 }, mc1)))
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }
))

# 297 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dflattenTermApp = (fun (t : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((v_Vuna_dCompiler_dCore_dTerm_dflattenTermAppGo t) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 264 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dnatChainGo = (fun (fuel : int) (t : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match (v_Vuna_dCompiler_dCore_dTerm_dflattenTermApp t) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__33; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__34 } -> (match dtb__33 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__35, dtb__36) -> (((v_Vuna_dCompiler_dCore_dTerm_dnatChainArgs (fuel - 1)) dtb__35) ((Base_dData_dList.v_Base_dData_dList_dappend dtb__36) dtb__34))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__37) -> (((v_Vuna_dCompiler_dCore_dTerm_dnatChainArgs (fuel - 1)) dtb__37) dtb__34)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)))
# 276 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dnatChainArgs = (fun (fuel : int) (c : string) (args : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (c = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor) then (match args with
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

# 261 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dnatChainValue = (fun (t : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((v_Vuna_dCompiler_dCore_dTerm_dnatChainGo 1000000) t))

# 308 "Vuna/Compiler/Core/Term.vuna"
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
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__71, dtb__72, dtb__73, dtb__74, dtb__75) -> ((fun tys -> ((1 + tys) + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__75))) ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__76) -> (match dtb__76 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__77; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__78 } -> ((v_Vuna_dCompiler_dCore_dTerm_dtermSizeMaybe dtb__77) + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeMaybe dtb__78))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
)) dtb__73))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__79, dtb__80, dtb__81, dtb__82, dtb__83) -> ((1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__82)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__83))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__84) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__85) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__86) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__87, dtb__88, dtb__89) -> 1
  | _ -> failwith "DT: impossible branch"
))
# 334 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dtermSizeMaybe = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__90) -> (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__90)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))
# 338 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs = (fun (mc0 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__91, dtb__92) -> (match dtb__91 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__93; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__94 } -> ((v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__93) + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs dtb__92))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 342 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dtermSizeAlts = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__95, dtb__96) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermSize (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__95)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeAlts dtb__96))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 350 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dmetaLookup = (fun (i : int) (t : (int, t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dInt.v_Hashable_uInt) Base_dData_dInt.v_Eq_uInt) i) t))

# 354 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList = (fun (mc0 : int) (mc1 : (int, t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__97, dtb__98) -> (match dtb__97 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__99; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__100 } -> (if (mc0 = dtb__99) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__100)) else ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList mc0) dtb__98))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 373 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty = { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dInt.v_Hashable_uInt) Base_dData_dList.C_Base_dData_dList_dList_Nil); f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dInt.v_Hashable_uInt) Base_dData_dList.C_Base_dData_dList_dList_Nil) }

# 376 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsFromList = (fun (xs : (int, t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = (((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsertAll Base_dData_dInt.v_Hashable_uInt) xs) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dInt.v_Hashable_uInt) Base_dData_dList.C_Base_dData_dList_dList_Nil)); f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = xs; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dInt.v_Hashable_uInt) Base_dData_dList.C_Base_dData_dList_dList_Nil) })

# 380 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsOf = (fun (t : (int, t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (xs : (int, t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (d : (int, int) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = t; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = xs; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = d })

# 383 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsList = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dSols) -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__101; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__102; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__103 } -> dtb__102
  | _ -> failwith "DT: impossible branch"
))

# 387 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsDepth = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dSols) -> (match mc1 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__104; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__105; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__106 } -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dInt.v_Hashable_uInt) Base_dData_dInt.v_Eq_uInt) mc0) dtb__106)
  | _ -> failwith "DT: impossible branch"
))

# 392 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsLookup = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dSols) -> (match mc1 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__107; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__108; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__109 } -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dInt.v_Hashable_uInt) Base_dData_dInt.v_Eq_uInt) mc0) dtb__107)
  | _ -> failwith "DT: impossible branch"
))

# 395 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsCons = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dValue) (mc2 : t_Vuna_dCompiler_dCore_dTerm_dSols) -> (match mc2 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__110; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__111; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__112 } -> { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dInt.v_Hashable_uInt) mc0) mc1) dtb__110); f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }, dtb__111)); f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__112 }
  | _ -> failwith "DT: impossible branch"
))

# 400 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dSols) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__113, dtb__114, dtb__115) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__113) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__114)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__115))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__116) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__117) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__118) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__119) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__120, dtb__121) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__120) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts mc0) dtb__121))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__122, dtb__123, dtb__124, dtb__125, dtb__126) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__122) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__126))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__127, dtb__128, dtb__129, dtb__130, dtb__131) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__127)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__132, dtb__133) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__133)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__134, dtb__135) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__135)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__136, dtb__137) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__137)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__138, dtb__139, dtb__140) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__138) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__139))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__141, dtb__142, dtb__143, dtb__144, dtb__145) -> ((fun tys -> (if tys then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__145))) ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__146) -> (match dtb__146 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__147; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__148 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaMaybe mc0) dtb__147) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaMaybe mc0) dtb__148))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) dtb__143))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__149, dtb__150, dtb__151, dtb__152, dtb__153) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__152) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__153))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__154) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__155) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__156, dtb__157, dtb__158) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__159) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__159) mc0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__160) -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 433 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaMaybe = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dSols) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__161) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__161)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 437 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dSols) (mc1 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__162, dtb__163) -> (match dtb__162 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__164; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__165 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__164) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__163))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 442 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dSols) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__166, dtb__167) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__166)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts mc0) dtb__167))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 449 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__168, dtb__169, dtb__170) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__168) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__169)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__170))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__171) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__172) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__173) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__174, dtb__175) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__174) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat mc0) dtb__175))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__176, dtb__177, dtb__178, dtb__179, dtb__180) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__176) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__180))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__181, dtb__182, dtb__183, dtb__184, dtb__185) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__181)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__186, dtb__187) -> ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__187)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__188, dtb__189) -> ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__189)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__190, dtb__191) -> ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__191)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__192, dtb__193, dtb__194) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__192) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__193))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__195, dtb__196, dtb__197, dtb__198, dtb__199) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__199)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__200, dtb__201, dtb__202, dtb__203, dtb__204) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__203) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__204))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__205) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__206) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__207, dtb__208, dtb__209) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__210) -> ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__210) mc0)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__211) -> true
  | _ -> failwith "DT: impossible branch"
))
# 472 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__212, dtb__213) -> (match dtb__212 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__214; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__215 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__214) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__213))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 477 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__216, dtb__217) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__216)) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat mc0) dtb__217))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 483 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__218, dtb__219, dtb__220) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__218)) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__219)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__220)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__221) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__222) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__223) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__224, dtb__225) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__224)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (a : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody a)))) dtb__225))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__226, dtb__227, dtb__228, dtb__229, dtb__230) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__226)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__230))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__231, dtb__232, dtb__233, dtb__234, dtb__235) -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__231)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__236, dtb__237) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__236, ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (p : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)))) dtb__237)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__238, dtb__239) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (p : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)))) dtb__239)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__240, dtb__241) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (p : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)))) dtb__241)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__242, dtb__243, dtb__244) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__242)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__243))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__245, dtb__246, dtb__247, dtb__248, dtb__249) -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__249)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__250, dtb__251, dtb__252, dtb__253, dtb__254) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__253)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__254))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__255) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__256) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__257, dtb__258, dtb__259) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__260) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__260, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__261) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 535 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dlookupPair = (fun (mc0 : string) (mc1 : (string, t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__262, dtb__263) -> (match dtb__262 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__264; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__265 } -> (if (dtb__264 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__265)) else ((v_Vuna_dCompiler_dCore_dTerm_dlookupPair mc0) dtb__263))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 527 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf = (fun (mc0 : (string, t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__266, dtb__267) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dlookupPair dtb__266) mc0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__268) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__268, ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc0) dtb__267)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc0) dtb__267)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 515 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel = (fun (mc0 : int) (mc1 : (string, t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__269, dtb__270) -> (if (mc0 <= 0) then false else (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc2) dtb__269) then true else ((((v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel (mc0 - 1)) mc1) mc2) ((Base_dData_dList.v_Base_dData_dList_dappend dtb__270) ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc1) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__269))))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 510 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dtermReachesFloat = (fun (defs : (string, t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (names : string Base_dData_dList.t_Base_dData_dList_dList) (t : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((((v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel 4096) defs) names) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (t, Base_dData_dList.C_Base_dData_dList_dList_Nil))))

# 539 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_ddefLookup = (fun (name : string) (tbl : (string, t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) tbl))

# 543 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__271, dtb__272, dtb__273) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__271) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__272)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__273))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__274) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__275) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__276) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__277) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__278, dtb__279) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__278) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts mc0) dtb__279))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__280, dtb__281, dtb__282, dtb__283, dtb__284) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__280) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + (Base_dData_dList.v_Base_dData_dList_dlength dtb__282))) dtb__284))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__285, dtb__286, dtb__287, dtb__288, dtb__289) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__285)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__290, dtb__291) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__291)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__292, dtb__293) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__293)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__294, dtb__295) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__295)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__296, dtb__297, dtb__298) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__296) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__297))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__299, dtb__300, dtb__301, dtb__302, dtb__303) -> ((fun tys -> (if tys then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + 1)) dtb__303))) ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__304) -> (match dtb__304 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__305; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__306 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarMaybe mc0) dtb__305) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarMaybe (mc0 + 1)) dtb__306))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) dtb__301))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__307, dtb__308, dtb__309, dtb__310, dtb__311) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__310) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + 1)) dtb__311))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__312) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__313) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__314) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__315, dtb__316, dtb__317) -> (dtb__316 >= mc0)
  | _ -> failwith "DT: impossible branch"
))
# 571 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarMaybe = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__318) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__318)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 575 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs = (fun (mc0 : int) (mc1 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__319, dtb__320) -> (match dtb__319 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__321; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__322 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__321) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__320))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 579 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__323, dtb__324) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + (Base_dData_dList.v_Base_dData_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__323)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__323)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts mc0) dtb__324))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 584 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dhasMeta = (fun (mc0 : int) (mc1 : int) (mc2 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__325, dtb__326, dtb__327) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__325) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__326)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__327))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__328) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__329) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__330) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__331) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__332, dtb__333) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__332) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts mc0) mc1) dtb__333))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__334, dtb__335, dtb__336, dtb__337, dtb__338) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__334) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + (Base_dData_dList.v_Base_dData_dList_dlength dtb__336))) dtb__338))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__339, dtb__340, dtb__341, dtb__342, dtb__343) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__339)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__344, dtb__345) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__345)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__346, dtb__347) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__347)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__348, dtb__349) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__349)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__350, dtb__351, dtb__352) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__350) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__351))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__353, dtb__354, dtb__355, dtb__356, dtb__357) -> ((fun tys -> (if tys then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + 1)) dtb__357))) ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__358) -> (match dtb__358 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__359; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__360 } -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaMaybe mc0) mc1) dtb__359) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaMaybe mc0) (mc1 + 1)) dtb__360))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) dtb__355))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__361, dtb__362, dtb__363, dtb__364, dtb__365) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__364) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + 1)) dtb__365))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__366) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__367) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__368, dtb__369, dtb__370) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__371) -> (mc0 = dtb__371)
  | _ -> failwith "DT: impossible branch"
))
# 611 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaMaybe = (fun (mc0 : int) (mc1 : int) (mc2 : t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__372) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__372)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 615 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs = (fun (mc0 : int) (mc1 : int) (mc2 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__373, dtb__374) -> (match dtb__373 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__375; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__376 } -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__375) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__374))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 619 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts = (fun (mc0 : int) (mc1 : int) (mc2 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__377, dtb__378) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + (Base_dData_dList.v_Base_dData_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__377)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__377)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts mc0) mc1) dtb__378))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 625 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dmapTermMaybe = (fun (mc0 : (t_Vuna_dCompiler_dCore_dTerm_dTerm) -> t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__379) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((mc0 dtb__379)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 636 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dlamBinderTyOf = (fun (mc0 : (t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe, t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__380) -> (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__380)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 640 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dlamResultTyOf = (fun (mc0 : (t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe, t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__381) -> (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__381)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 644 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dlamTyOf = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }))
)
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }))
))

# 648 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dlamTyWithBinder = (fun (binderTy : t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> ((v_Vuna_dCompiler_dCore_dTerm_dlamTyOf binderTy) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))

# 651 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dlamTyWithResult = (fun (resultTy : t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> ((v_Vuna_dCompiler_dCore_dTerm_dlamTyOf Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) resultTy))

# 654 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dlamTyMap = (fun (mc0 : (int) -> (t_Vuna_dCompiler_dCore_dTerm_dTerm) -> t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc1 : int) (mc2 : (t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe, t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__382) -> ((v_Vuna_dCompiler_dCore_dTerm_dlamTyOf ((v_Vuna_dCompiler_dCore_dTerm_dmapTermMaybe (mc0 mc1)) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__382))) ((v_Vuna_dCompiler_dCore_dTerm_dmapTermMaybe (mc0 (mc1 + 1))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__382)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 663 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dshift = (fun (mc0 : int) (mc1 : int) (mc2 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__383, dtb__384, dtb__385) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__383), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__384), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__385)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__386) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__387) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__388) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__389) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__390, dtb__391) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__390), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts mc0) mc1) dtb__391)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__392, dtb__393, dtb__394, dtb__395, dtb__396) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__392), dtb__393, dtb__394, dtb__395, (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + (Base_dData_dList.v_Base_dData_dList_dlength dtb__394))) mc1) dtb__396)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__397, dtb__398, dtb__399, dtb__400, dtb__401) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__397), dtb__398, dtb__399, dtb__400, dtb__401))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__402, dtb__403) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__402, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__403)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__404, dtb__405) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__404, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__405)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__406, dtb__407) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__406, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__407)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__408, dtb__409, dtb__410) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__408), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__409), dtb__410))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__411, dtb__412, dtb__413, dtb__414, dtb__415) -> ((fun slot2 -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__411, dtb__412, slot2, dtb__414, (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + 1)) mc1) dtb__415)))) ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__416) -> (match dtb__416 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__417; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__418 } -> ((v_Vuna_dCompiler_dCore_dTerm_dlamTyOf (match dtb__417 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__419) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__419)))
  | _ -> failwith "DT: impossible branch"
)) (match dtb__418 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__420) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + 1)) mc1) dtb__420)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) dtb__413))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__421, dtb__422, dtb__423, dtb__424, dtb__425) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__421, dtb__422, dtb__423, (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__424), (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + 1)) mc1) dtb__425)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__426) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__427) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__428) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__429, dtb__430, dtb__431) -> (if (dtb__430 >= mc0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__429, (dtb__430 + mc1), dtb__431)) else mc2)
  | _ -> failwith "DT: impossible branch"
))
# 702 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshiftArgs = (fun (mc0 : int) (mc1 : int) (mc2 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__432, dtb__433) -> (match dtb__432 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__434; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__435 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__434); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__435 }, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__433)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 707 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlts = (fun (mc0 : int) (mc1 : int) (mc2 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__436, dtb__437) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dCore_dTerm_dshiftAlt mc0) mc1) dtb__436), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts mc0) mc1) dtb__437)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 711 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlt = (fun (mc0 : int) (mc1 : int) (mc2 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) -> (match mc2 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__438; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__439; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__440 } -> { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__438; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__439; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + (Base_dData_dList.v_Base_dData_dList_dlength dtb__439))) mc1) dtb__440) }
  | _ -> failwith "DT: impossible branch"
))

# 716 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc2 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__441, dtb__442, dtb__443) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__441), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__442), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__443)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__444) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__445) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__446) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__447) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__448, dtb__449) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__448), ((Base_dData_dList.v_Base_dData_dList_dmap ((v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt mc0) mc1)) dtb__449)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__450, dtb__451, dtb__452, dtb__453, dtb__454) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__450), dtb__451, dtb__452, dtb__453, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (mc0 - (Base_dData_dList.v_Base_dData_dList_dlength dtb__452))) mc1) dtb__454)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__455, dtb__456, dtb__457, dtb__458, dtb__459) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__455), dtb__456, dtb__457, dtb__458, dtb__459))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__460, dtb__461) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__460, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__461)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__462, dtb__463) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__462, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__463)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__464, dtb__465) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__464, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__465)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__466, dtb__467, dtb__468) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__466), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__467), dtb__468))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__469, dtb__470, dtb__471, dtb__472, dtb__473) -> ((fun slot2 -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__469, dtb__470, slot2, dtb__472, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (mc0 + 1)) mc1) dtb__473)))) ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__474) -> (match dtb__474 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__475; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__476 } -> ((v_Vuna_dCompiler_dCore_dTerm_dlamTyOf (match dtb__475 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__477) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__477)))
  | _ -> failwith "DT: impossible branch"
)) (match dtb__476 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__478) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (mc0 + 1)) mc1) dtb__478)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) dtb__471))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__479, dtb__480, dtb__481, dtb__482, dtb__483) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__479, dtb__480, dtb__481, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__482), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (mc0 + 1)) mc1) dtb__483)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__484) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__485) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__486) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__487, dtb__488, dtb__489) -> (if (dtb__488 = mc0) then mc1 else mc2)
  | _ -> failwith "DT: impossible branch"
))
# 758 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt = (fun (idx : int) (arg : t_Vuna_dCompiler_dCore_dTerm_dTerm) (alt : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) -> { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt); f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt); f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (idx + (Base_dData_dList.v_Base_dData_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)))) arg) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)) })

# 768 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo = (fun (mc0 : int) (mc1 : string) (mc2 : int) (mc3 : int) (mc4 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__490, dtb__491, dtb__492) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__490), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__491), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__492)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__493, dtb__494) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__493), ((Base_dData_dList.v_Base_dData_dList_dmap ((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt mc0) mc1) mc2) mc3)) dtb__494)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__495, dtb__496, dtb__497, dtb__498, dtb__499) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__495), dtb__496, dtb__497, dtb__498, dtb__499))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__500, dtb__501) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__500, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__501)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__502, dtb__503) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__502, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__503)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__504, dtb__505) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__504, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__505)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__506, dtb__507, dtb__508) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__506), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__507), dtb__508))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__509, dtb__510, dtb__511, dtb__512, dtb__513) -> ((fun slot2 -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__509, dtb__510, slot2, dtb__512, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__513)))) ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__514) -> (match dtb__514 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__515; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__516 } -> ((v_Vuna_dCompiler_dCore_dTerm_dlamTyOf (match dtb__515 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__517) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__517)))
  | _ -> failwith "DT: impossible branch"
)) (match dtb__516 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__518) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__518)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) dtb__511))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__519, dtb__520, dtb__521, dtb__522, dtb__523) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__519, dtb__520, dtb__521, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__522), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__523)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__524) -> (if (dtb__524 = mc0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (mc1, (mc3 - mc2), { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })) else mc4)
  | _ -> mc4
))
# 808 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt = (fun (mc0 : int) (mc1 : string) (mc2 : int) (mc3 : int) (mc4 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) -> (match mc4 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__525; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__526; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__527 } -> { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__525; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__526; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + (Base_dData_dList.v_Base_dData_dList_dlength dtb__526))) dtb__527) }
  | _ -> failwith "DT: impossible branch"
))

# 765 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar = (fun (m : int) (name : string) (q : int) (t : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) 0) t))

# 820 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo = (fun (mc0 : string) (mc1 : int) (mc2 : t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc3 : int) (mc4 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__528, dtb__529, dtb__530, dtb__531, dtb__532) -> (if (mc3 = mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__528, dtb__529, dtb__530, dtb__531, (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (mc0, true, C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, mc2, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__532))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__528, dtb__529, dtb__530, dtb__531, (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo mc0) mc1) mc2) (mc3 + 1)) dtb__532))))
  | _ -> mc4
))

# 814 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder = (fun (name : string) (idx : int) (dictDom : t_Vuna_dCompiler_dCore_dTerm_dTerm) (t : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo name) idx) dictDom) 0) t))

# 832 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinderGo = (fun (mc0 : string) (mc1 : int) (mc2 : t_Vuna_dCompiler_dCore_dTerm_dRig) (mc3 : t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc4 : int) (mc5 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc5 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__533, dtb__534, dtb__535, dtb__536, dtb__537) -> (if (mc4 = mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__533, dtb__534, dtb__535, dtb__536, (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (mc0, true, mc2, mc3, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__537))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__533, dtb__534, dtb__535, dtb__536, ((((((v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinderGo mc0) mc1) mc2) mc3) (mc4 + 1)) dtb__537))))
  | _ -> mc5
))

# 829 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinder = (fun (name : string) (idx : int) (rig : t_Vuna_dCompiler_dCore_dTerm_dRig) (dom : t_Vuna_dCompiler_dCore_dTerm_dTerm) (t : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((((((v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinderGo name) idx) rig) dom) 0) t))

# 841 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dcutoffOf = (fun (total : int) (idx : int) -> (if ((total - (idx + 1)) <= 0) then 0 else (total - (idx + 1))))

# 844 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dcountPis = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__538, dtb__539, dtb__540, dtb__541, dtb__542) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dcountPis dtb__542))
  | _ -> 0
))

# 856 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo = (fun (mc0 : string) (mc1 : int) (mc2 : int) (mc3 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc3 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__543, dtb__544, dtb__545, dtb__546, dtb__547) -> (if (mc2 = mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__543, dtb__544, dtb__545, dtb__546, (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (mc0, C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__547))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__543, dtb__544, dtb__545, dtb__546, ((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo mc0) mc1) (mc2 + 1)) dtb__547))))
  | _ -> mc3
))

# 853 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder = (fun (name : string) (idx : int) (t : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo name) idx) 0) t))

# 864 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dcountLams = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__548, dtb__549, dtb__550, dtb__551, dtb__552) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dcountLams dtb__552))
  | _ -> 0
))

# 869 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__553, dtb__554, dtb__555) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__553) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__554)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__555))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__556, dtb__557) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__556) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree mc0) dtb__557))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__558, dtb__559, dtb__560, dtb__561, dtb__562) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__558) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + (Base_dData_dList.v_Base_dData_dList_dlength dtb__560))) dtb__562))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__563, dtb__564, dtb__565, dtb__566, dtb__567) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__563)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__568, dtb__569) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__569)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__570, dtb__571) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__571)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__572, dtb__573) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__573)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__574, dtb__575, dtb__576) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__574) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__575))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__577, dtb__578, dtb__579, dtb__580, dtb__581) -> ((fun tys -> (if tys then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + 1)) dtb__581))) ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__582) -> (match dtb__582 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__583; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__584 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVarMaybe mc0) dtb__583) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVarMaybe (mc0 + 1)) dtb__584))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) dtb__579))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__585, dtb__586, dtb__587, dtb__588, dtb__589) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__588) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + 1)) dtb__589))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__590, dtb__591, dtb__592) -> (dtb__591 >= mc0)
  | _ -> false
))
# 892 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVarMaybe = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__593) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__593)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 896 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyPairFree = (fun (mc0 : int) (mc1 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__594, dtb__595) -> (match dtb__594 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__596; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__597 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__596) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__595))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 900 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyAltFree = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__598, dtb__599) -> (match dtb__598 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__600; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__601; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__602 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + (Base_dData_dList.v_Base_dData_dList_dlength dtb__601))) dtb__602) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree mc0) dtb__599))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 907 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__603, dtb__604, dtb__605) -> (if (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__603) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__604)) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__605))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__606, dtb__607) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__606) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts dtb__607))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__608, dtb__609, dtb__610, dtb__611, dtb__612) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__608) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__612))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__613, dtb__614, dtb__615, dtb__616, dtb__617) -> (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__613)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__618, dtb__619) -> (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__619)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__620, dtb__621) -> (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__621)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__622, dtb__623) -> (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__623)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__624, dtb__625, dtb__626) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__624) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__625))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__627, dtb__628, dtb__629, dtb__630, dtb__631) -> ((fun tys -> (if tys then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__631))) ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__632) -> (match dtb__632 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__633; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__634 } -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVarMaybe dtb__633) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVarMaybe dtb__634))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) dtb__629))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__635, dtb__636, dtb__637, dtb__638, dtb__639) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__638) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__639))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__640, dtb__641, dtb__642) -> (dtb__641 < 0)
  | _ -> false
))
# 927 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVarMaybe = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__643) -> (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__643)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 931 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs = (fun (mc0 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__644, dtb__645) -> (match dtb__644 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__646; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__647 } -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__646) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__645))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 935 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__648, dtb__649) -> (match dtb__648 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__650; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__651; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__652 } -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__652) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts dtb__649))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 943 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel = (fun (fuel : int) (sols : t_Vuna_dCompiler_dCore_dTerm_dSols) (v : t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then false else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__653, dtb__654) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__653) sols) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__655) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__655)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__656) -> (match dtb__656 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__657, dtb__658, dtb__659) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__659)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__660, dtb__661) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__661)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__662, dtb__663, dtb__664, dtb__665, dtb__666) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__665) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__666))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__667, dtb__668, dtb__669) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__669)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__670, dtb__671) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__671)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__672, dtb__673) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__672) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__673))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__674, dtb__675) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__674)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (dtb__676, dtb__677, dtb__678, dtb__679, dtb__680) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__676)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__681, dtb__682, dtb__683) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__681) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__682)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__683))
  | _ -> false
)))
# 969 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel = (fun (fuel : int) (sols : t_Vuna_dCompiler_dCore_dTerm_dSols) (vs : t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then false else (match vs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__684, dtb__685) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__684) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__685))
  | _ -> failwith "DT: impossible branch"
)))
# 981 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel = (fun (fuel : int) (sols : t_Vuna_dCompiler_dCore_dTerm_dSols) (clo : t_Vuna_dCompiler_dCore_dTerm_dClosure) -> (if (fuel <= 0) then false else (match clo with
  | { f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = dtb__686; f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__687 } -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__686)
  | _ -> failwith "DT: impossible branch"
)))

# 940 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue = (fun (sols : t_Vuna_dCompiler_dCore_dTerm_dSols) (v : t_Vuna_dCompiler_dCore_dTerm_dValue) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel 64) sols) v))

# 966 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaList = (fun (sols : t_Vuna_dCompiler_dCore_dTerm_dSols) (vs : t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel 64) sols) vs))

# 978 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaClo = (fun (sols : t_Vuna_dCompiler_dCore_dTerm_dSols) (clo : t_Vuna_dCompiler_dCore_dTerm_dClosure) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel 64) sols) clo))

# 992 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_disTypeValue = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__688) -> true
  | _ -> false
))

# 996 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__689) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__689))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 1004 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes = (fun (mc0 : int) (mc1 : int) (mc2 : t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__690) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__691) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__692) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__693) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__694) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__695, dtb__696, dtb__697) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__695) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__696)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__697))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (dtb__698, dtb__699, dtb__700, dtb__701, dtb__702) -> (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__698)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__703, dtb__704) -> (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__703)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__705, dtb__706) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__705) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__706))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__707, dtb__708) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__708)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__709, dtb__710) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__710)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__711, dtb__712, dtb__713) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo mc0) dtb__713)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__714, dtb__715, dtb__716, dtb__717, dtb__718) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__717) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo mc0) dtb__718))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__719) -> (match dtb__719 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__720, dtb__721, dtb__722) -> (if (dtb__721 >= mc0) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__722))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__723, dtb__724) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__724)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 1025 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__725, dtb__726) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) 0) dtb__725) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__726))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1029 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dCore_dTerm_dClosure) -> (match mc1 with
  | { f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = dtb__727; f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__728 } -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__727)
  | _ -> failwith "DT: impossible branch"
))

# 1109 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dshowBinders = (fun (mc0 : (string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__729, dtb__730) -> (match dtb__729 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__731; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__732 } -> (String.concat "" [" "; dtb__731; (v_Vuna_dCompiler_dCore_dTerm_dshowBinders dtb__730)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1116 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__733, dtb__734) -> (if (dtb__733 = 34) then ("\\\"" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__734)) else (if (dtb__733 = 92) then ("\\\\" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__734)) else (if (dtb__733 = 10) then ("\\n" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__734)) else (if (dtb__733 = 9) then ("\\t" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__734)) else (if (dtb__733 = 13) then ("\\r" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__734)) else ((Base_dData_dList.dtp_pack (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__733, Base_dData_dList.C_Base_dData_dList_dList_Nil))) ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__734)))))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1113 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dshowCoreString = (fun (s : string) -> (String.concat "" ["\""; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars (Base_dData_dList.dtp_unpack s)); "\""]))

# 1032 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dshowTerm = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__735, dtb__736, dtb__737) -> (String.concat "" ["if "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__735); " then "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__736); " else "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__737)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__738) -> (if dtb__738 then "True" else "False")
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__739) -> dtb__739
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__740) -> (v_Vuna_dCompiler_dCore_dTerm_dshowCoreString dtb__740)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__741) -> (bi_strFromInt dtb__741)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__742, dtb__743) -> (String.concat "" ["case "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__742); " of "; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__743)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__744, dtb__745, dtb__746, dtb__747, dtb__748) -> (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__744); " with "; dtb__745; " "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__748)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__749, dtb__750, dtb__751, dtb__752, dtb__753) -> (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__749); "."; dtb__750; "#"; (bi_strFromInt dtb__753)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__754, dtb__755) -> ((v_Vuna_dCompiler_dCore_dTerm_drecordAppShow dtb__754) dtb__755)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__756, dtb__757) -> (String.concat "" ["("; dtb__756; (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__757); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__758, dtb__759) -> (String.concat "" ["("; dtb__758; (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__759); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__760, dtb__761, dtb__762) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__760); " "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__761); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__763, dtb__764, dtb__765, dtb__766, dtb__767) -> (String.concat "" ["\\"; dtb__763; " => "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__767)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__768, dtb__769, dtb__770, dtb__771, dtb__772) -> (if (dtb__768 = "_") then (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__771); " -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__772)]) else (if dtb__769 then (String.concat "" ["{"; dtb__768; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__771); "} -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__772)]) else (String.concat "" ["("; dtb__768; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__771); ") -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__772)])))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__773) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__773) = 0) then "Type" else ("Type " ^ (bi_strFromInt (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__773))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__774) -> dtb__774
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__775) -> ("?" ^ (bi_strFromInt dtb__775))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__776, dtb__777, dtb__778) -> dtb__776
  | _ -> failwith "DT: impossible branch"
))
# 1089 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms = (fun (mc0 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__779, dtb__780) -> (match dtb__779 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__781; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__782 } -> (String.concat "" [" "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__781); (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__780)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 1094 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_drecordAppShow = (fun (mc0 : string) (mc1 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__783, dtb__784) -> (match dtb__783 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__785; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__786 } -> ((v_Vuna_dCompiler_dCore_dTerm_drecordAppShow (String.concat "" ["("; mc0; " "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__785); ")"])) dtb__784)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))
# 1104 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__787, dtb__788) -> (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__787); (v_Vuna_dCompiler_dCore_dTerm_dshowBinders (v_Vuna_dCompiler_dCore_dTerm_dbinderPairs (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__787))); " => "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__787)); " | "; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__788)])
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1064 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dshowPiSig = (fun (name : string) (implicit : bool) (dom : t_Vuna_dCompiler_dCore_dTerm_dTerm) (cod : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (if (name = "_") then (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dom); " -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig cod)]) else (if implicit then (String.concat "" ["{"; name; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dom); "} -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig cod)]) else (String.concat "" ["("; name; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dom); ") -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig cod)]))))
# 1073 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__789, dtb__790) -> ((v_Vuna_dCompiler_dCore_dTerm_dshowSigAppText dtb__789) dtb__790)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__791, dtb__792) -> (match dtb__792 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__791
  | _ -> (String.concat "" ["("; dtb__791; (v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs dtb__792); ")"])
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__793, dtb__794, dtb__795) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__793); " "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__794); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__796, dtb__797, dtb__798, dtb__799, dtb__800) -> ((((v_Vuna_dCompiler_dCore_dTerm_dshowPiSig dtb__796) dtb__797) dtb__799) dtb__800)
  | _ -> (v_Vuna_dCompiler_dCore_dTerm_dshowTerm mc0)
))
# 1081 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi = (fun (mc0 : t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__801, dtb__802, dtb__803, dtb__804, dtb__805) -> (String.concat "" ["("; ((((v_Vuna_dCompiler_dCore_dTerm_dshowPiSig dtb__801) dtb__802) dtb__804) dtb__805); ")"])
  | _ -> (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig mc0)
))
# 1085 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs = (fun (mc0 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__806, dtb__807) -> (match dtb__806 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__808; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__809 } -> (String.concat "" [" "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__808); (v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs dtb__807)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 1099 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowSigAppText = (fun (mc0 : string) (mc1 : (t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__810, dtb__811) -> (match dtb__810 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__812; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__813 } -> ((v_Vuna_dCompiler_dCore_dTerm_dshowSigAppText (String.concat "" ["("; mc0; " "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__812); ")"])) dtb__811)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))
