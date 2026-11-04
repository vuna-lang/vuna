open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dOrd
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Vuna_dCompiler_dPackages_dPkg
open Vuna_dCompiler_dDebug
open Base_dNat
open Base_dVec
open Vuna_dCompiler_dDiagnostics_dCommon
open Vuna_dCompiler_dDiagnostics_dCg
open Vuna_dCompiler_dDiagnostics_dTc
open Vuna_dCompiler_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dDiagnostics
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dIntrinsics
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
type t_Vuna_dCompiler_dCore_dTerm_dRig = C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1 | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega
and t_Vuna_dCompiler_dCore_dTerm_dLevel = C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dMkLevel of (int)
and t_Vuna_dCompiler_dCore_dTerm_dTerm = C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar of (string) * (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta of (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal of (string) | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType of (t_Vuna_dCompiler_dCore_dTerm_dLevel) | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi of (string) * (bool) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam of (string) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dRig) | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon of (string) * ((t_Vuna_dCompiler_dCore_dTerm_dTerm, t_Vuna_dCompiler_dCore_dTerm_dRig) t_Base_dPair_dPair t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dCaseAlt t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt of (int) | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr of (string) | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool of (bool) | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf of (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dCore_dTerm_dCaseAlt = C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt of (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dCore_dTerm_dClosure = C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos of (t_Vuna_dCompiler_dCore_dTerm_dValue t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dCore_dTerm_dNeutral = C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar of (string) * (int) * (t_Vuna_dCompiler_dCore_dTerm_dValue t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal of (string) * (t_Vuna_dCompiler_dCore_dTerm_dValue t_Base_dList_dList)
and t_Vuna_dCompiler_dCore_dTerm_dValue = C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType of (t_Vuna_dCompiler_dCore_dTerm_dLevel) | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi of (string) * (bool) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dClosure) | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam of (string) * (t_Vuna_dCompiler_dCore_dTerm_dRig) * (t_Vuna_dCompiler_dCore_dTerm_dClosure) | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral of (t_Vuna_dCompiler_dCore_dTerm_dNeutral) | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta of (int) * (t_Vuna_dCompiler_dCore_dTerm_dValue t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp of (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dValue) | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon of (string) * (t_Vuna_dCompiler_dCore_dTerm_dValue t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase of (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dVCaseAlt t_Base_dList_dList) | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt of (int) | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr of (string) | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool of (bool) | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf of (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dValue) * (t_Vuna_dCompiler_dCore_dTerm_dValue)
and t_Vuna_dCompiler_dCore_dTerm_dVCaseAlt = C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt of (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dClosure)
and t_Vuna_dCompiler_dCore_dTerm_dSols = C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols of (t_Vuna_dCompiler_dCore_dTerm_dValue t_Vuna_dCompiler_dCommon_dHashTbl) * ((int, t_Vuna_dCompiler_dCore_dTerm_dValue) t_Base_dPair_dPair t_Base_dList_dList) * (int t_Vuna_dCompiler_dCommon_dHashTbl) * (t_Vuna_dCompiler_dCore_dTerm_dValue t_Vuna_dCompiler_dCommon_dHashTbl)

let v_Vuna_dCompiler_dCore_dTerm_drigIsErased = (fun r -> (match r with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 -> true
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1 -> false
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_drigIsLinear = (fun r -> (match r with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1 -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dTerm_drigIsOmega = (fun r -> (match r with
  | C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dTerm_drigOfBinder = (fun implicit -> (fun isTypeDom -> (if implicit then C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 else (if isTypeDom then C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0 else C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))))

let v_Vuna_dCompiler_dCore_dTerm_dlevelZero = (C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dMkLevel (0))

let v_Vuna_dCompiler_dCore_dTerm_dlevelSucc = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dMkLevel (dtb__0) -> (C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dMkLevel (((bi_add dtb__0) 1)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dlevelMax = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dMkLevel (dtb__1) -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dMkLevel (dtb__2) -> (C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dMkLevel ((if ((bi_ge_int dtb__1) dtb__2) then dtb__1 else dtb__2)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dTerm_dlevelToInt = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dMkLevel (dtb__3) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt = (fun n -> (C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dMkLevel (n)))

let v_Vuna_dCompiler_dCore_dTerm_dlevelEq = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dMkLevel (dtb__4) -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dMkLevel (dtb__5) -> ((bi_eq_int dtb__4) dtb__5)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dTerm_dlevelLt = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dMkLevel (dtb__6) -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dMkLevel (dtb__7) -> ((bi_lt_int dtb__6) dtb__7)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

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

let v_Vuna_dCompiler_dCore_dTerm_dvCaseAltName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__17, dtb__18, dtb__19) -> dtb__17
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dvCaseAltBinders = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__20, dtb__21, dtb__22) -> dtb__21
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dvCaseAltClosure = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__23, dtb__24, dtb__25) -> dtb__25
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel = 512

let rec v_Vuna_dCompiler_dCore_dTerm_dmetaLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__26, dtb__27) -> (match dtb__26 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__28, dtb__29) -> (if ((bi_eq_int mc0) dtb__28) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__29)) else ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup mc0) dtb__27))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty = (C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (v_Vuna_dCompiler_dCommon_dtblEmpty, C_Base_dList_dList_Base_dList_dNil, v_Vuna_dCompiler_dCommon_dtblEmpty, v_Vuna_dCompiler_dCommon_dtblEmpty))

let v_Vuna_dCompiler_dCore_dTerm_dsolsFromList = (fun xs -> (C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (((v_Vuna_dCompiler_dCommon_dtblInsertAll ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((bi_strFromInt (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) xs)) v_Vuna_dCompiler_dCommon_dtblEmpty), xs, v_Vuna_dCompiler_dCommon_dtblEmpty, v_Vuna_dCompiler_dCommon_dtblEmpty)))

let v_Vuna_dCompiler_dCore_dTerm_dsolsOf = (fun t -> (fun xs -> (fun d -> (fun dv -> (C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (t, xs, d, dv))))))

let v_Vuna_dCompiler_dCore_dTerm_dsolsList = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (dtb__30, dtb__31, dtb__32, dtb__33) -> dtb__31
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsTbl = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (dtb__34, dtb__35, dtb__36, dtb__37) -> dtb__34
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsDefVals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (dtb__38, dtb__39, dtb__40, dtb__41) -> dtb__41
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsPutDefVals = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (dtb__42, dtb__43, dtb__44, dtb__45) -> (C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (dtb__42, dtb__43, dtb__44, mc1))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dTerm_dsolsDepth = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (dtb__46, dtb__47, dtb__48, dtb__49) -> ((v_Vuna_dCompiler_dCommon_dtblLookup (bi_strFromInt mc0)) dtb__48)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dTerm_dsolsLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (dtb__50, dtb__51, dtb__52, dtb__53) -> ((v_Vuna_dCompiler_dCommon_dtblLookup (bi_strFromInt mc0)) dtb__50)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dTerm_dsolsCons = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (dtb__54, dtb__55, dtb__56, dtb__57) -> (C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols ((((v_Vuna_dCompiler_dCommon_dtblInsert (bi_strFromInt mc0)) mc1) dtb__54), (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), dtb__55)), dtb__56, dtb__57))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta = (fun sols -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__58) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__58) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__59) -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__60, dtb__61) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__62) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__63) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__64, dtb__65, dtb__66, dtb__67, dtb__68) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta sols) dtb__67) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta sols) dtb__68))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__69, dtb__70, dtb__71) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta sols) dtb__71)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__72, dtb__73, dtb__74) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta sols) dtb__72) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta sols) dtb__73))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__75, dtb__76) -> ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs sols) dtb__76)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__77, dtb__78) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta sols) dtb__77) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts sols) dtb__78))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__79) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__80) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__81) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__82, dtb__83, dtb__84) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta sols) dtb__82) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta sols) dtb__83)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta sols) dtb__84))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__85, dtb__86) -> (match dtb__85 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__87, dtb__88) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) dtb__87) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs mc0) dtb__86))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__89, dtb__90) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta mc0) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__89)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts mc0) dtb__90))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dTerm_ddefLookup = (fun name -> (fun tbl -> ((v_Vuna_dCompiler_dCommon_dtblLookup name) tbl)))

let v_Vuna_dCompiler_dCore_dTerm_dnotBool = (fun b -> (if b then false else true))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar = (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__91, dtb__92) -> (if ((bi_ge_int dtb__92) depth) then true else false)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__93) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__94) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__95) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__96, dtb__97, dtb__98, dtb__99, dtb__100) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__99) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar ((bi_add depth) 1)) dtb__100))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__101, dtb__102, dtb__103) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar ((bi_add depth) 1)) dtb__103)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__104, dtb__105, dtb__106) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__104) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__105))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__107, dtb__108) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs depth) dtb__108)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__109, dtb__110) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__109) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts depth) dtb__110))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__111) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__112) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__113) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__114, dtb__115, dtb__116) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__114) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__115)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__116))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__117, dtb__118) -> (match dtb__117 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__119, dtb__120) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__119) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__118))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__121, dtb__122) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar ((bi_add mc0) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__121)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__121)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts mc0) dtb__122))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasMeta = (fun m -> (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__123) -> ((bi_eq_int m) dtb__123)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__124, dtb__125) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__126) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__127) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__128, dtb__129, dtb__130, dtb__131, dtb__132) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__131) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) ((bi_add depth) 1)) dtb__132))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__133, dtb__134, dtb__135) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) ((bi_add depth) 1)) dtb__135)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__136, dtb__137, dtb__138) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__136) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__137))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__139, dtb__140) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs m) depth) dtb__140)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__141, dtb__142) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__141) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts m) depth) dtb__142))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__143) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__144) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__145) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__146, dtb__147, dtb__148) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__146) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__147)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__148))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__149, dtb__150) -> (match dtb__149 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__151, dtb__152) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__151) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__150))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__153, dtb__154) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) ((bi_add mc1) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__153)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__153)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts mc0) mc1) dtb__154))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCore_dTerm_dshift = (fun depth -> (fun amount -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__155, dtb__156) -> (if ((bi_ge_int dtb__156) depth) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__155, ((bi_add dtb__156) amount))) else t)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__157) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__158) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__159) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__160, dtb__161, dtb__162, dtb__163, dtb__164) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__160, dtb__161, dtb__162, (((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__163), (((v_Vuna_dCompiler_dCore_dTerm_dshift ((bi_add depth) 1)) amount) dtb__164)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__165, dtb__166, dtb__167) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__165, dtb__166, (((v_Vuna_dCompiler_dCore_dTerm_dshift ((bi_add depth) 1)) amount) dtb__167)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__168, dtb__169, dtb__170) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__168), (((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__169), dtb__170))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__171, dtb__172) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__171, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs depth) amount) dtb__172)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__173, dtb__174) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__173), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts depth) amount) dtb__174)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__175) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__176) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__177) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__178, dtb__179, dtb__180) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__178), (((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__179), (((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__180)))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dshiftArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__181, dtb__182) -> (match dtb__181 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__183, dtb__184) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__183), dtb__184)), (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__182)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__185, dtb__186) -> (C_Base_dList_dList_Base_dList_dCons ((((v_Vuna_dCompiler_dCore_dTerm_dshiftAlt mc0) mc1) dtb__185), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts mc0) mc1) dtb__186)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__187, dtb__188, dtb__189) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__187, dtb__188, (((v_Vuna_dCompiler_dCore_dTerm_dshift ((bi_add mc0) (v_Base_dList_dlength dtb__188))) mc1) dtb__189)))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt = (fun idx -> (fun arg -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__190, dtb__191) -> (if ((bi_eq_int dtb__191) idx) then arg else t)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__192) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__193) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__194) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__195, dtb__196, dtb__197, dtb__198, dtb__199) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__195, dtb__196, dtb__197, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__198), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt ((bi_add idx) 1)) arg) dtb__199)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__200, dtb__201, dtb__202) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__200, dtb__201, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt ((bi_add idx) 1)) arg) dtb__202)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__203, dtb__204, dtb__205) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__203), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__204), dtb__205))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__206, dtb__207) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__206, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__207)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__208, dtb__209) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__208), ((v_Base_dList_dmap ((v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt idx) arg)) dtb__209)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__210) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__211) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__212) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__213, dtb__214, dtb__215) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__213), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__214), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__215)))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt = (fun idx -> (fun arg -> (fun alt -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt ((v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt), (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt ((bi_add idx) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)))) arg) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))))))

let rec v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo = (fun m -> (fun name -> (fun q -> (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__216) -> (if ((bi_eq_int dtb__216) m) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (name, ((bi_sub depth) q))) else t)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__217, dtb__218, dtb__219, dtb__220, dtb__221) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__217, dtb__218, dtb__219, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__220), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) ((bi_add depth) 1)) dtb__221)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__222, dtb__223, dtb__224) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__222, dtb__223, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) ((bi_add depth) 1)) dtb__224)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__225, dtb__226, dtb__227) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__225), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__226), dtb__227))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__228, dtb__229) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__228, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__229)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__230, dtb__231) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__230), ((v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt m) name) q) depth)) dtb__231)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__232, dtb__233, dtb__234) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__232), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__233), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__234)))
  | _ -> t
))))))
and v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__235, dtb__236, dtb__237) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__235, dtb__236, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) ((bi_add mc3) (v_Base_dList_dlength dtb__236))) dtb__237)))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar = (fun m -> (fun name -> (fun q -> (fun t -> (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) 0) t)))))

let rec v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__238, dtb__239, dtb__240, dtb__241, dtb__242) -> (if ((bi_eq_int mc3) mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__238, dtb__239, dtb__240, dtb__241, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (mc0, true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, mc2, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__242))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__238, dtb__239, dtb__240, dtb__241, (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo mc0) mc1) mc2) ((bi_add mc3) 1)) dtb__242))))
  | _ -> mc4
))))))

let v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder = (fun name -> (fun idx -> (fun dictDom -> (fun t -> (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo name) idx) dictDom) 0) t)))))

let v_Vuna_dCompiler_dCore_dTerm_dcutoffOf = (fun total -> (fun idx -> (if ((bi_le_int ((bi_sub total) ((bi_add idx) 1))) 0) then 0 else ((bi_sub total) ((bi_add idx) 1)))))

let rec v_Vuna_dCompiler_dCore_dTerm_dcountPis = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__243, dtb__244, dtb__245, dtb__246, dtb__247) -> ((bi_add 1) (v_Vuna_dCompiler_dCore_dTerm_dcountPis dtb__247))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__248, dtb__249, dtb__250) -> (if ((bi_eq_int mc2) mc1) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__248, dtb__249, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (mc0, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__250))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__248, dtb__249, ((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo mc0) mc1) ((bi_add mc2) 1)) dtb__250))))
  | _ -> mc3
)))))

let v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder = (fun name -> (fun idx -> (fun t -> ((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo name) idx) 0) t))))

let rec v_Vuna_dCompiler_dCore_dTerm_dcountLams = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__251, dtb__252, dtb__253) -> ((bi_add 1) (v_Vuna_dCompiler_dCore_dTerm_dcountLams dtb__253))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar = (fun d -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__254, dtb__255) -> ((bi_ge_int dtb__255) d)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__256, dtb__257, dtb__258, dtb__259, dtb__260) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__259) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar ((bi_add d) 1)) dtb__260))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__261, dtb__262, dtb__263) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar ((bi_add d) 1)) dtb__263)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__264, dtb__265, dtb__266) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__264) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__265))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__267, dtb__268) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree d) dtb__268)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__269, dtb__270) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__269) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree d) dtb__270))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__271, dtb__272, dtb__273) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__271) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__272)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__273))
  | _ -> false
)))
and v_Vuna_dCompiler_dCore_dTerm_danyPairFree = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__274, dtb__275) -> (match dtb__274 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__276, dtb__277) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__276) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__275))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dTerm_danyAltFree = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__278, dtb__279) -> (match dtb__278 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__280, dtb__281, dtb__282) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar ((bi_add mc0) (v_Base_dList_dlength dtb__281))) dtb__282) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree mc0) dtb__279))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel = (fun fuel -> (fun sols -> (fun v -> (if ((bi_le_int fuel) 0) then false else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__283, dtb__284) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__283) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__285) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__285)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__286) -> (match dtb__286 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__287, dtb__288, dtb__289) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel ((bi_sub fuel) 1)) sols) dtb__289)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__290, dtb__291) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel ((bi_sub fuel) 1)) sols) dtb__291)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__292, dtb__293, dtb__294, dtb__295, dtb__296) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__295) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel ((bi_sub fuel) 1)) sols) dtb__296))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__297, dtb__298, dtb__299) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel ((bi_sub fuel) 1)) sols) dtb__299)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__300, dtb__301) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel ((bi_sub fuel) 1)) sols) dtb__301)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__302, dtb__303) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__302) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__303))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__304, dtb__305) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__304)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__306, dtb__307, dtb__308) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__306) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__307)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__308))
  | _ -> false
)))))
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel = (fun fuel -> (fun sols -> (fun vs -> (if ((bi_le_int fuel) 0) then false else (match vs with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__309, dtb__310) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__309) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel ((bi_sub fuel) 1)) sols) dtb__310))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel = (fun fuel -> (fun sols -> (fun clo -> (if ((bi_le_int fuel) 0) then false else (match clo with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__311, dtb__312) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel ((bi_sub fuel) 1)) sols) dtb__311)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue = (fun sols -> (fun v -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel 64) sols) v)))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaList = (fun sols -> (fun vs -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel 64) sols) vs)))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaClo = (fun sols -> (fun clo -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel 64) sols) clo)))

let v_Vuna_dCompiler_dCore_dTerm_disTypeValue = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__313) -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__314) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__314))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes = (fun limit -> (fun depth -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__315) -> (match dtb__315 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__316, dtb__317, dtb__318) -> (if ((bi_ge_int dtb__317) limit) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList limit) dtb__318))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__319, dtb__320) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList limit) dtb__320)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__321, dtb__322, dtb__323, dtb__324, dtb__325) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__324) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo limit) dtb__325))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__326, dtb__327, dtb__328) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo limit) dtb__328)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__329, dtb__330) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList limit) dtb__330)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__331, dtb__332) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList limit) dtb__332)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__333, dtb__334) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__333) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__334))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__335, dtb__336) -> (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__335)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__337, dtb__338, dtb__339) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__337) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__338)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__339))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__340) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__341) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__342) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__343) -> false
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__344, dtb__345) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) 0) dtb__344) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__345))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__346, dtb__347) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__346)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowBinders = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__348, dtb__349) -> (match dtb__348 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__350, dtb__351) -> ((bi_concat " ") ((bi_concat dtb__350) (v_Vuna_dCompiler_dCore_dTerm_dshowBinders dtb__349)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__352, dtb__353) -> (if ((bi_eq_int dtb__352) 34) then ((bi_concat "\\\"") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__353)) else (if ((bi_eq_int dtb__352) 92) then ((bi_concat "\\\\") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__353)) else (if ((bi_eq_int dtb__352) 10) then ((bi_concat "\\n") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__353)) else (if ((bi_eq_int dtb__352) 9) then ((bi_concat "\\t") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__353)) else (if ((bi_eq_int dtb__352) 13) then ((bi_concat "\\r") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__353)) else ((bi_concat (dtp_pack (C_Base_dList_dList_Base_dList_dCons (dtb__352, C_Base_dList_dList_Base_dList_dNil)))) (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__353)))))))
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dshowCoreString = (fun s -> ((bi_concat "\"") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars (dtp_unpack s))) "\"")))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowTerm = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__354, dtb__355) -> dtb__354
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__356) -> ((bi_concat "?") (bi_strFromInt dtb__356))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__357) -> dtb__357
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__358) -> (if ((bi_eq_int (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__358)) 0) then "Type" else ((bi_concat "Type ") (bi_strFromInt (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__358))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__359, dtb__360, dtb__361, dtb__362, dtb__363) -> (if ((bi_eq_str dtb__359) "_") then ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__362)) ((bi_concat " -> ") (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__363))) else (if dtb__360 then ((bi_concat "{") ((bi_concat dtb__359) ((bi_concat " : ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__362)) ((bi_concat "} -> ") (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__363)))))) else ((bi_concat "(") ((bi_concat dtb__359) ((bi_concat " : ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__362)) ((bi_concat ") -> ") (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__363))))))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__364, dtb__365, dtb__366) -> ((bi_concat "\\") ((bi_concat dtb__364) ((bi_concat " => ") (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__366))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__367, dtb__368, dtb__369) -> ((bi_concat "(") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__367)) ((bi_concat " ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__368)) ")"))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__370, dtb__371) -> ((bi_concat "(") ((bi_concat dtb__370) ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__371)) ")")))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__372, dtb__373) -> ((bi_concat "case ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__372)) ((bi_concat " of ") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__373))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__374) -> (bi_strFromInt dtb__374)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__375) -> (v_Vuna_dCompiler_dCore_dTerm_dshowCoreString dtb__375)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__376) -> (if dtb__376 then "True" else "False")
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__377, dtb__378, dtb__379) -> ((bi_concat "if ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__377)) ((bi_concat " then ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__378)) ((bi_concat " else ") (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__379))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__380, dtb__381) -> (match dtb__380 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__382, dtb__383) -> ((bi_concat " ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__382)) (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__381)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__384, dtb__385) -> ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__384)) ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowBinders (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__384))) ((bi_concat " => ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__384))) ((bi_concat " | ") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__385))))))
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))
