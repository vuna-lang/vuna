open Vuna_runtime
type t_Vuna_dCompiler_dCore_dTerm_dRig = C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 | C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 | C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
and t_Vuna_dCompiler_dCore_dTerm_dLevel = int
and t_Vuna_dCompiler_dCore_dTerm_dTerm = C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar of (string) * (int) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta of (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal of (string) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType of (t_Vuna_dCompiler_dCore_dTerm_dLevel) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi of (string) * (bool) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam of (string) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dRig) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon of (string) * ((t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk of (string) * ((t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dList.t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (int) * (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (int Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt of (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr of (string) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool of (bool) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat of (string) | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord of (string) * ((t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dCore_dTerm_dBinder = { f_Vuna_dCompiler_dCore_dTerm_dBinder_binderName : string; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderRig : t_Vuna_dCompiler_dCore_dTerm_dRig; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan }
and t_Vuna_dCompiler_dCore_dTerm_dCaseAlt = { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName : string; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders : t_Vuna_dCompiler_dCore_dTerm_dBinder Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody : t_Vuna_dCompiler_dCore_dTerm_dTerm }
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

# 164 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dbinderNameOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dBinder_binderName = dtb__8; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderRig = dtb__9; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderSpan = dtb__10 } -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

# 167 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dbinderRigOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dBinder_binderName = dtb__11; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderRig = dtb__12; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderSpan = dtb__13 } -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

# 170 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dbinderSpanOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dBinder_binderName = dtb__14; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderRig = dtb__15; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderSpan = dtb__16 } -> dtb__16
  | _ -> failwith "DT: impossible branch"
))

# 174 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dbinderPair = (fun b -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dCore_dTerm_dbinderNameOf b); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dCore_dTerm_dbinderRigOf b) })

# 177 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dbinderPairs = (fun bs -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dCore_dTerm_dbinderPair) bs))

# 181 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dbinderOfPair = (fun mc0 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__17; Base_dPair.f_Base_dPair_dPair_second = dtb__18 } -> { f_Vuna_dCompiler_dCore_dTerm_dBinder_binderName = dtb__17; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderRig = dtb__18; f_Vuna_dCompiler_dCore_dTerm_dBinder_binderSpan = Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty }
  | _ -> failwith "DT: impossible branch"
))

# 184 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dbindersOfPairs = (fun ps -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dCore_dTerm_dbinderOfPair) ps))

# 193 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dcaseAltName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__19; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__20; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__21 } -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

# 196 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__22; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__23; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__24 } -> dtb__23
  | _ -> failwith "DT: impossible branch"
))

# 199 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__25; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__26; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__27 } -> dtb__27
  | _ -> failwith "DT: impossible branch"
))

# 237 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel = 512

# 251 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dnatChainMax = 4611686018427387903

# 281 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dnatChainNext = (fun n -> (if (n >= v_Vuna_dCompiler_dCore_dTerm_dnatChainMax) then v_Vuna_dCompiler_dCore_dTerm_dnatChainMax else (n + 1)))

# 288 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dflattenTermAppGo = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__28, dtb__29) -> { Base_dPair.f_Base_dPair_dPair_first = (C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__28)); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__29) mc1) }
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__30, dtb__31, dtb__32) -> ((v_Vuna_dCompiler_dCore_dTerm_dflattenTermAppGo dtb__30) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__31; Base_dPair.f_Base_dPair_dPair_second = dtb__32 }, mc1)))
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }
))

# 285 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dflattenTermApp = (fun t -> ((v_Vuna_dCompiler_dCore_dTerm_dflattenTermAppGo t) Base_dList.C_Base_dList_dList_Nil))

# 261 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dnatChainGo = (fun fuel t -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match (v_Vuna_dCompiler_dCore_dTerm_dflattenTermApp t) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__33; Base_dPair.f_Base_dPair_dPair_second = dtb__34 } -> (match dtb__33 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__35, dtb__36) -> (((v_Vuna_dCompiler_dCore_dTerm_dnatChainArgs (fuel - 1)) dtb__35) ((Base_dList.v_Base_dList_dappend dtb__36) dtb__34))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__37) -> (((v_Vuna_dCompiler_dCore_dTerm_dnatChainArgs (fuel - 1)) dtb__37) dtb__34)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)))
# 269 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dnatChainArgs = (fun fuel c args -> (if (c = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor) then (match args with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (0))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (c = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__38, dtb__39) -> (match dtb__38 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__40; Base_dPair.f_Base_dPair_dPair_second = dtb__41 } -> (match dtb__39 with
  | Base_dList.C_Base_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dCore_dTerm_dnatChainGo fuel) dtb__40) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__42) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dCore_dTerm_dnatChainNext dtb__42)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) args) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))

# 258 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dnatChainValue = (fun t -> ((v_Vuna_dCompiler_dCore_dTerm_dnatChainGo 1000000) t))

# 296 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dtermSize = (fun mc0 -> (match mc0 with
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
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__71, dtb__72, dtb__73, dtb__74) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__74))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__75, dtb__76, dtb__77, dtb__78, dtb__79) -> ((1 + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__78)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__79))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__80) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__81) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__82) -> 1
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__83, dtb__84, dtb__85) -> 1
  | _ -> failwith "DT: impossible branch"
))
# 316 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__86, dtb__87) -> (match dtb__86 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__88; Base_dPair.f_Base_dPair_dPair_second = dtb__89 } -> ((v_Vuna_dCompiler_dCore_dTerm_dtermSize dtb__88) + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs dtb__87))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 320 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dtermSizeAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__90, dtb__91) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermSize (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__90)) + (v_Vuna_dCompiler_dCore_dTerm_dtermSizeAlts dtb__91))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 328 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dmetaLookup = (fun i t -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) i) t))

# 332 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__92, dtb__93) -> (match dtb__92 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__94; Base_dPair.f_Base_dPair_dPair_second = dtb__95 } -> (if (mc0 = dtb__94) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__95)) else ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList mc0) dtb__93))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 351 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty = { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil); f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil) }

# 354 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsFromList = (fun xs -> { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dInt.v_Hashable_uInt) xs) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil)); f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = xs; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil) })

# 359 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsOf = (fun t xs d -> { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = t; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = xs; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = d })

# 362 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsList = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__96; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__97; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__98 } -> dtb__97
  | _ -> failwith "DT: impossible branch"
))

# 366 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsDepth = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__99; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__100; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__101 } -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) mc0) dtb__101)
  | _ -> failwith "DT: impossible branch"
))

# 371 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsLookup = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__102; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__103; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__104 } -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dInt.v_Hashable_uInt) Base_dInt.v_Eq_uInt) mc0) dtb__102)
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsolsCons = (fun mc0 mc1 mc2 -> (match mc2 with
  | { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = dtb__105; f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = dtb__106; f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__107 } -> { f_Vuna_dCompiler_dCore_dTerm_dSols_solsTbl = ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dInt.v_Hashable_uInt) mc0) mc1) dtb__105); f_Vuna_dCompiler_dCore_dTerm_dSols_solsList = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }, dtb__106)); f_Vuna_dCompiler_dCore_dTerm_dSols_solsDepth = dtb__107 }
  | _ -> failwith "DT: impossible branch"
))

# 379 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__108, dtb__109, dtb__110) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__108) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__109)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__110))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__111) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__112) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__113) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__114) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__115, dtb__116) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__115) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts mc0) dtb__116))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__117, dtb__118, dtb__119, dtb__120, dtb__121) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__117) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__121))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__122, dtb__123, dtb__124, dtb__125, dtb__126) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__122)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__127, dtb__128) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__128)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__129, dtb__130) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__130)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__131, dtb__132) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__132)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__133, dtb__134, dtb__135) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__133) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__134))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__136, dtb__137, dtb__138, dtb__139) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__139)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__140, dtb__141, dtb__142, dtb__143, dtb__144) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__143) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__144))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__145) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__146) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__147, dtb__148, dtb__149) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__150) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__150) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__151) -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 405 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__152, dtb__153) -> (match dtb__152 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__154; Base_dPair.f_Base_dPair_dPair_second = dtb__155 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__154) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__153))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 410 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__156, dtb__157) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__156)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts mc0) dtb__157))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 417 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__158, dtb__159, dtb__160) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__158) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__159)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__160))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__161) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__162) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__163) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__164, dtb__165) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__164) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat mc0) dtb__165))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__166, dtb__167, dtb__168, dtb__169, dtb__170) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__166) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__170))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__171, dtb__172, dtb__173, dtb__174, dtb__175) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__171)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__176, dtb__177) -> ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__177)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__178, dtb__179) -> ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__179)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__180, dtb__181) -> ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__181)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__182, dtb__183, dtb__184) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__182) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__183))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__185, dtb__186, dtb__187, dtb__188) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__188)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__189, dtb__190, dtb__191, dtb__192, dtb__193) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__192) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__193))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__194) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__195) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__196, dtb__197, dtb__198) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__199) -> ((Base_dList.v_Base_dList_dmemName dtb__199) mc0)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__200) -> true
  | _ -> failwith "DT: impossible branch"
))
# 440 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__201, dtb__202) -> (match dtb__201 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__203; Base_dPair.f_Base_dPair_dPair_second = dtb__204 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) dtb__203) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat mc0) dtb__202))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 445 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__205, dtb__206) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc0) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__205)) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat mc0) dtb__206))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 451 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__207, dtb__208, dtb__209) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__207)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__208)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__209)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__210) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__211) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__212) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__213, dtb__214) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__213)) ((Base_dList.v_Base_dList_dconcatMap (fun a -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody a)))) dtb__214))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__215, dtb__216, dtb__217, dtb__218, dtb__219) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__215)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__219))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__220, dtb__221, dtb__222, dtb__223, dtb__224) -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__220)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__225, dtb__226) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__225, ((Base_dList.v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (Base_dPair.v_Base_dPair_dfirstOf p)))) dtb__226)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__227, dtb__228) -> ((Base_dList.v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (Base_dPair.v_Base_dPair_dfirstOf p)))) dtb__228)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__229, dtb__230) -> ((Base_dList.v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (Base_dPair.v_Base_dPair_dfirstOf p)))) dtb__230)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__231, dtb__232, dtb__233) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__231)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__232))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__234, dtb__235, dtb__236, dtb__237) -> (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__237)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__238, dtb__239, dtb__240, dtb__241, dtb__242) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__241)) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__242))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__243) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__244) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__245, dtb__246, dtb__247) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__248) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__248, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__249) -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 499 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dlookupPair = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__250, dtb__251) -> (match dtb__250 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__252; Base_dPair.f_Base_dPair_dPair_second = dtb__253 } -> (if (dtb__252 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__253)) else ((v_Vuna_dCompiler_dCore_dTerm_dlookupPair mc0) dtb__251))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 492 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__254, dtb__255) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dlookupPair dtb__254) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__256) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__256, ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc0) dtb__255)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc0) dtb__255)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 483 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__257, dtb__258) -> (if (mc0 <= 0) then false else (if ((v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat mc2) dtb__257) then true else ((((v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel (mc0 - 1)) mc1) mc2) ((Base_dList.v_Base_dList_dappend dtb__258) ((v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf mc1) (v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__257))))))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 478 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dtermReachesFloat = (fun defs names t -> ((((v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel 4096) defs) names) (Base_dList.C_Base_dList_dList__x58__x58_ (t, Base_dList.C_Base_dList_dList_Nil))))

# 503 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_ddefLookup = (fun name tbl -> ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) tbl))

# 507 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__259, dtb__260, dtb__261) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__259) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__260)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__261))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__262) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__263) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__264) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__265) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__266, dtb__267) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__266) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts mc0) dtb__267))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__268, dtb__269, dtb__270, dtb__271, dtb__272) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__268) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + (Base_dList.v_Base_dList_dlength dtb__270))) dtb__272))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__273, dtb__274, dtb__275, dtb__276, dtb__277) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__273)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__278, dtb__279) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__279)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__280, dtb__281) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__281)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__282, dtb__283) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__283)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__284, dtb__285, dtb__286) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__284) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__285))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__287, dtb__288, dtb__289, dtb__290) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + 1)) dtb__290)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__291, dtb__292, dtb__293, dtb__294, dtb__295) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__294) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + 1)) dtb__295))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__296) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__297) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__298) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__299, dtb__300, dtb__301) -> (dtb__300 >= mc0)
  | _ -> failwith "DT: impossible branch"
))
# 529 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__302, dtb__303) -> (match dtb__302 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__304; Base_dPair.f_Base_dPair_dPair_second = dtb__305 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__304) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__303))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 533 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__306, dtb__307) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar (mc0 + (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__306)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__306)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts mc0) dtb__307))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 538 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dhasMeta = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__308, dtb__309, dtb__310) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__308) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__309)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__310))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__311) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__312) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__313) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__314) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__315, dtb__316) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__315) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts mc0) mc1) dtb__316))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__317, dtb__318, dtb__319, dtb__320, dtb__321) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__317) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + (Base_dList.v_Base_dList_dlength dtb__319))) dtb__321))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__322, dtb__323, dtb__324, dtb__325, dtb__326) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__322)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__327, dtb__328) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__328)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__329, dtb__330) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__330)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__331, dtb__332) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__332)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__333, dtb__334, dtb__335) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__333) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__334))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__336, dtb__337, dtb__338, dtb__339) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + 1)) dtb__339)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__340, dtb__341, dtb__342, dtb__343, dtb__344) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__343) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + 1)) dtb__344))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__345) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__346) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__347, dtb__348, dtb__349) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__350) -> (mc0 = dtb__350)
  | _ -> failwith "DT: impossible branch"
))
# 559 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__351, dtb__352) -> (match dtb__351 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__353; Base_dPair.f_Base_dPair_dPair_second = dtb__354 } -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__353) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__352))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 563 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__355, dtb__356) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) (mc1 + (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__355)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__355)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts mc0) mc1) dtb__356))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 572 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dshift = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__357, dtb__358, dtb__359) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__357), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__358), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__359)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__360) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__361) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__362) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__363) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__364, dtb__365) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__364), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts mc0) mc1) dtb__365)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__366, dtb__367, dtb__368, dtb__369, dtb__370) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__366), dtb__367, dtb__368, dtb__369, (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + (Base_dList.v_Base_dList_dlength dtb__368))) mc1) dtb__370)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__371, dtb__372, dtb__373, dtb__374, dtb__375) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__371), dtb__372, dtb__373, dtb__374, dtb__375))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__376, dtb__377) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__376, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__377)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__378, dtb__379) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__378, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__379)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__380, dtb__381) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__380, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__381)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__382, dtb__383, dtb__384) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__382), (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__383), dtb__384))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__385, dtb__386, dtb__387, dtb__388) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__385, dtb__386, dtb__387, (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + 1)) mc1) dtb__388)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__389, dtb__390, dtb__391, dtb__392, dtb__393) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__389, dtb__390, dtb__391, (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__392), (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + 1)) mc1) dtb__393)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__394) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__395) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__396) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__397, dtb__398, dtb__399) -> (if (dtb__398 >= mc0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__397, (dtb__398 + mc1), dtb__399)) else mc2)
  | _ -> failwith "DT: impossible branch"
))
# 596 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshiftArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__400, dtb__401) -> (match dtb__400 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__402; Base_dPair.f_Base_dPair_dPair_second = dtb__403 } -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__402); Base_dPair.f_Base_dPair_dPair_second = dtb__403 }, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__401)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 601 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlts = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__404, dtb__405) -> (Base_dList.C_Base_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dCore_dTerm_dshiftAlt mc0) mc1) dtb__404), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts mc0) mc1) dtb__405)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 605 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlt = (fun mc0 mc1 mc2 -> (match mc2 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__406; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__407; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__408 } -> { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__406; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__407; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((v_Vuna_dCompiler_dCore_dTerm_dshift (mc0 + (Base_dList.v_Base_dList_dlength dtb__407))) mc1) dtb__408) }
  | _ -> failwith "DT: impossible branch"
))

# 610 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__409, dtb__410, dtb__411) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__409), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__410), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__411)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__412) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__413) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__414) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__415) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__416, dtb__417) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__416), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt mc0) mc1)) dtb__417)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__418, dtb__419, dtb__420, dtb__421, dtb__422) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__418), dtb__419, dtb__420, dtb__421, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (mc0 - (Base_dList.v_Base_dList_dlength dtb__420))) mc1) dtb__422)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__423, dtb__424, dtb__425, dtb__426, dtb__427) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__423), dtb__424, dtb__425, dtb__426, dtb__427))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__428, dtb__429) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__428, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__429)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__430, dtb__431) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__430, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__431)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__432, dtb__433) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__432, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__433)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__434, dtb__435, dtb__436) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__434), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__435), dtb__436))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__437, dtb__438, dtb__439, dtb__440) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__437, dtb__438, dtb__439, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (mc0 + 1)) mc1) dtb__440)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__441, dtb__442, dtb__443, dtb__444, dtb__445) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__441, dtb__442, dtb__443, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt mc0) mc1) dtb__444), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (mc0 + 1)) mc1) dtb__445)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__446) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__447) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__448) -> mc2
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__449, dtb__450, dtb__451) -> (if (dtb__450 = mc0) then mc1 else mc2)
  | _ -> failwith "DT: impossible branch"
))
# 637 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt = (fun idx arg alt -> { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt); f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt); f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt (idx + (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)))) arg) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)) })

# 645 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__452, dtb__453, dtb__454) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__452), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__453), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__454)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__455, dtb__456) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__455), ((Base_dList.v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt mc0) mc1) mc2) mc3)) dtb__456)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__457, dtb__458, dtb__459, dtb__460, dtb__461) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__457), dtb__458, dtb__459, dtb__460, dtb__461))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__462, dtb__463) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__462, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__463)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__464, dtb__465) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__464, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__465)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__466, dtb__467) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__466, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__467)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__468, dtb__469, dtb__470) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__468), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__469), dtb__470))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__471, dtb__472, dtb__473, dtb__474) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__471, dtb__472, dtb__473, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__474)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__475, dtb__476, dtb__477, dtb__478, dtb__479) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__475, dtb__476, dtb__477, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) mc3) dtb__478), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__479)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__480) -> (if (dtb__480 = mc0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (mc1, (mc3 - mc2), { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })) else mc4)
  | _ -> mc4
))
# 668 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__481; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__482; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__483 } -> { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__481; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__482; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) (mc3 + (Base_dList.v_Base_dList_dlength dtb__482))) dtb__483) }
  | _ -> failwith "DT: impossible branch"
))

# 642 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar = (fun m name q t -> (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) 0) t))

# 680 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__484, dtb__485, dtb__486, dtb__487, dtb__488) -> (if (mc3 = mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__484, dtb__485, dtb__486, dtb__487, (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (mc0, true, C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, mc2, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__488))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__484, dtb__485, dtb__486, dtb__487, (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo mc0) mc1) mc2) (mc3 + 1)) dtb__488))))
  | _ -> mc4
))

# 674 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder = (fun name idx dictDom t -> (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo name) idx) dictDom) 0) t))

# 690 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinderGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__489, dtb__490, dtb__491, dtb__492, dtb__493) -> (if (mc4 = mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__489, dtb__490, dtb__491, dtb__492, (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (mc0, true, mc2, mc3, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__493))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__489, dtb__490, dtb__491, dtb__492, ((((((v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinderGo mc0) mc1) mc2) mc3) (mc4 + 1)) dtb__493))))
  | _ -> mc5
))

# 687 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinder = (fun name idx rig dom t -> ((((((v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinderGo name) idx) rig) dom) 0) t))

# 697 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dcutoffOf = (fun total idx -> (if ((total - (idx + 1)) <= 0) then 0 else (total - (idx + 1))))

# 700 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dcountPis = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__494, dtb__495, dtb__496, dtb__497, dtb__498) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dcountPis dtb__498))
  | _ -> 0
))

# 712 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__499, dtb__500, dtb__501, dtb__502) -> (if (mc2 = mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__499, dtb__500, dtb__501, (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (mc0, C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__502))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__499, dtb__500, dtb__501, ((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo mc0) mc1) (mc2 + 1)) dtb__502))))
  | _ -> mc3
))

# 709 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder = (fun name idx t -> ((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo name) idx) 0) t))

# 718 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dcountLams = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__503, dtb__504, dtb__505, dtb__506) -> (1 + (v_Vuna_dCompiler_dCore_dTerm_dcountLams dtb__506))
  | _ -> 0
))

# 723 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__507, dtb__508, dtb__509) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__507) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__508)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__509))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__510, dtb__511) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__510) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree mc0) dtb__511))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__512, dtb__513, dtb__514, dtb__515, dtb__516) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__512) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + (Base_dList.v_Base_dList_dlength dtb__514))) dtb__516))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__517, dtb__518, dtb__519, dtb__520, dtb__521) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__517)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__522, dtb__523) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__523)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__524, dtb__525) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__525)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__526, dtb__527) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__527)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__528, dtb__529, dtb__530) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__528) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__529))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__531, dtb__532, dtb__533, dtb__534) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + 1)) dtb__534)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__535, dtb__536, dtb__537, dtb__538, dtb__539) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__538) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + 1)) dtb__539))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__540, dtb__541, dtb__542) -> (dtb__541 >= mc0)
  | _ -> false
))
# 740 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyPairFree = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__543, dtb__544) -> (match dtb__543 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__545; Base_dPair.f_Base_dPair_dPair_second = dtb__546 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__545) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__544))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 744 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyAltFree = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__547, dtb__548) -> (match dtb__547 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__549; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__550; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__551 } -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar (mc0 + (Base_dList.v_Base_dList_dlength dtb__550))) dtb__551) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree mc0) dtb__548))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 751 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__552, dtb__553, dtb__554) -> (if (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__552) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__553)) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__554))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__555, dtb__556) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__555) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts dtb__556))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__557, dtb__558, dtb__559, dtb__560, dtb__561) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__557) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__561))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__562, dtb__563, dtb__564, dtb__565, dtb__566) -> (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__562)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__567, dtb__568) -> (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__568)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__569, dtb__570) -> (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__570)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__571, dtb__572) -> (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__572)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__573, dtb__574, dtb__575) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__573) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__574))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__576, dtb__577, dtb__578, dtb__579) -> (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__579)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__580, dtb__581, dtb__582, dtb__583, dtb__584) -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__583) then true else (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__584))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__585, dtb__586, dtb__587) -> (dtb__586 < 0)
  | _ -> false
))
# 765 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__588, dtb__589) -> (match dtb__588 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__590; Base_dPair.f_Base_dPair_dPair_second = dtb__591 } -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__590) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs dtb__589))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 769 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__592, dtb__593) -> (match dtb__592 with
  | { f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__594; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__595; f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__596 } -> (if (v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__596) then true else (v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts dtb__593))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 777 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel = (fun fuel sols v -> (if (fuel <= 0) then false else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__597, dtb__598) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__597) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__599) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__599)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__600) -> (match dtb__600 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__601, dtb__602, dtb__603) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__603)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__604, dtb__605) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__605)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__606, dtb__607, dtb__608, dtb__609, dtb__610) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__609) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__610))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__611, dtb__612, dtb__613) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__613)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__614, dtb__615) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__615)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__616, dtb__617) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__616) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__617))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__618, dtb__619) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__618)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (dtb__620, dtb__621, dtb__622, dtb__623, dtb__624) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__620)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__625, dtb__626, dtb__627) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__625) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__626)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__627))
  | _ -> false
)))
# 803 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel = (fun fuel sols vs -> (if (fuel <= 0) then false else (match vs with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__628, dtb__629) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__628) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__629))
  | _ -> failwith "DT: impossible branch"
)))
# 813 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel = (fun fuel sols clo -> (if (fuel <= 0) then false else (match clo with
  | { f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = dtb__630; f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__631 } -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__630)
  | _ -> failwith "DT: impossible branch"
)))

# 774 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue = (fun sols v -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel 64) sols) v))

# 800 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaList = (fun sols vs -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel 64) sols) vs))

# 810 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaClo = (fun sols clo -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel 64) sols) clo))

# 821 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_disTypeValue = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__632) -> true
  | _ -> false
))

# 825 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__633) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__633))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 833 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__634) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__635) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__636) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__637) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__638) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__639, dtb__640, dtb__641) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__639) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__640)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__641))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (dtb__642, dtb__643, dtb__644, dtb__645, dtb__646) -> (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__642)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__647, dtb__648) -> (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__647)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__649, dtb__650) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__649) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__650))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__651, dtb__652) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__652)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__653, dtb__654) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__654)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__655, dtb__656, dtb__657) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo mc0) dtb__657)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__658, dtb__659, dtb__660, dtb__661, dtb__662) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) mc1) dtb__661) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo mc0) dtb__662))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__663) -> (match dtb__663 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__664, dtb__665, dtb__666) -> (if (dtb__665 >= mc0) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__666))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__667, dtb__668) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__668)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 853 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__669, dtb__670) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) 0) dtb__669) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__670))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 857 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = dtb__671; f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = dtb__672 } -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__671)
  | _ -> failwith "DT: impossible branch"
))

# 931 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dshowBinders = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__673, dtb__674) -> (match dtb__673 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__675; Base_dPair.f_Base_dPair_dPair_second = dtb__676 } -> (String.concat "" [" "; dtb__675; (v_Vuna_dCompiler_dCore_dTerm_dshowBinders dtb__674)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 938 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__677, dtb__678) -> (if (dtb__677 = 34) then ("\\\"" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__678)) else (if (dtb__677 = 92) then ("\\\\" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__678)) else (if (dtb__677 = 10) then ("\\n" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__678)) else (if (dtb__677 = 9) then ("\\t" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__678)) else (if (dtb__677 = 13) then ("\\r" ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__678)) else ((Base_dList.dtp_pack (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__677, Base_dList.C_Base_dList_dList_Nil))) ^ (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__678)))))))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 935 "Vuna/Compiler/Core/Term.vuna"
let v_Vuna_dCompiler_dCore_dTerm_dshowCoreString = (fun s -> (String.concat "" ["\""; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars (Base_dList.dtp_unpack s)); "\""]))

# 860 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dshowTerm = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__679, dtb__680, dtb__681) -> (String.concat "" ["if "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__679); " then "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__680); " else "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__681)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__682) -> (if dtb__682 then "True" else "False")
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__683) -> dtb__683
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__684) -> (v_Vuna_dCompiler_dCore_dTerm_dshowCoreString dtb__684)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__685) -> (bi_strFromInt dtb__685)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__686, dtb__687) -> (String.concat "" ["case "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__686); " of "; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__687)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__688, dtb__689, dtb__690, dtb__691, dtb__692) -> (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__688); " with "; dtb__689; " "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__692)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__693, dtb__694, dtb__695, dtb__696, dtb__697) -> (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__693); "."; dtb__694; "#"; (bi_strFromInt dtb__697)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__698, dtb__699) -> ((v_Vuna_dCompiler_dCore_dTerm_drecordAppShow dtb__698) dtb__699)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__700, dtb__701) -> (String.concat "" ["("; dtb__700; (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__701); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__702, dtb__703) -> (String.concat "" ["("; dtb__702; (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__703); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__704, dtb__705, dtb__706) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__704); " "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__705); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__707, dtb__708, dtb__709, dtb__710) -> (String.concat "" ["\\"; dtb__707; " => "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__710)])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__711, dtb__712, dtb__713, dtb__714, dtb__715) -> (if (dtb__711 = "_") then (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__714); " -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__715)]) else (if dtb__712 then (String.concat "" ["{"; dtb__711; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__714); "} -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__715)]) else (String.concat "" ["("; dtb__711; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__714); ") -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__715)])))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__716) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__716) = 0) then "Type" else ("Type " ^ (bi_strFromInt (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__716))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__717) -> dtb__717
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__718) -> ("?" ^ (bi_strFromInt dtb__718))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__719, dtb__720, dtb__721) -> dtb__719
  | _ -> failwith "DT: impossible branch"
))
# 911 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__722, dtb__723) -> (match dtb__722 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__724; Base_dPair.f_Base_dPair_dPair_second = dtb__725 } -> (String.concat "" [" "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__724); (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__723)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 916 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_drecordAppShow = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__726, dtb__727) -> (match dtb__726 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__728; Base_dPair.f_Base_dPair_dPair_second = dtb__729 } -> ((v_Vuna_dCompiler_dCore_dTerm_drecordAppShow (String.concat "" ["("; mc0; " "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__728); ")"])) dtb__727)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))
# 926 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__730, dtb__731) -> (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__730); (v_Vuna_dCompiler_dCore_dTerm_dshowBinders (v_Vuna_dCompiler_dCore_dTerm_dbinderPairs (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__730))); " => "; (v_Vuna_dCompiler_dCore_dTerm_dshowTerm (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__730)); " | "; (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__731)])
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 889 "Vuna/Compiler/Core/Term.vuna"
let rec v_Vuna_dCompiler_dCore_dTerm_dshowPiSig = (fun name implicit dom cod -> (if (name = "_") then (String.concat "" [(v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dom); " -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig cod)]) else (if implicit then (String.concat "" ["{"; name; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dom); "} -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig cod)]) else (String.concat "" ["("; name; " : "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig dom); ") -> "; (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig cod)]))))
# 895 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__732, dtb__733) -> ((v_Vuna_dCompiler_dCore_dTerm_dshowSigAppText dtb__732) dtb__733)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__734, dtb__735) -> (match dtb__735 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__734
  | _ -> (String.concat "" ["("; dtb__734; (v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs dtb__735); ")"])
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__736, dtb__737, dtb__738) -> (String.concat "" ["("; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__736); " "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__737); ")"])
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__739, dtb__740, dtb__741, dtb__742, dtb__743) -> ((((v_Vuna_dCompiler_dCore_dTerm_dshowPiSig dtb__739) dtb__740) dtb__742) dtb__743)
  | _ -> (v_Vuna_dCompiler_dCore_dTerm_dshowTerm mc0)
))
# 903 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__744, dtb__745, dtb__746, dtb__747, dtb__748) -> (String.concat "" ["("; ((((v_Vuna_dCompiler_dCore_dTerm_dshowPiSig dtb__744) dtb__745) dtb__747) dtb__748); ")"])
  | _ -> (v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig mc0)
))
# 907 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__749, dtb__750) -> (match dtb__749 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__751; Base_dPair.f_Base_dPair_dPair_second = dtb__752 } -> (String.concat "" [" "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__751); (v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs dtb__750)])
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 921 "Vuna/Compiler/Core/Term.vuna"
and v_Vuna_dCompiler_dCore_dTerm_dshowSigAppText = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__753, dtb__754) -> (match dtb__753 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__755; Base_dPair.f_Base_dPair_dPair_second = dtb__756 } -> ((v_Vuna_dCompiler_dCore_dTerm_dshowSigAppText (String.concat "" ["("; mc0; " "; (v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi dtb__755); ")"])) dtb__754)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))
