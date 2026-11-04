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
and t_Vuna_dCompiler_dCore_dTerm_dSols = C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols of (t_Vuna_dCompiler_dCore_dTerm_dValue t_Vuna_dCompiler_dCommon_dHashTbl) * ((int, t_Vuna_dCompiler_dCore_dTerm_dValue) t_Base_dPair_dPair t_Base_dList_dList) * (int t_Vuna_dCompiler_dCommon_dHashTbl)

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

let v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty = (C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (v_Vuna_dCompiler_dCommon_dtblEmpty, C_Base_dList_dList_Base_dList_dNil, v_Vuna_dCompiler_dCommon_dtblEmpty))

let v_Vuna_dCompiler_dCore_dTerm_dsolsFromList = (fun xs -> (C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (((v_Vuna_dCompiler_dCommon_dtblInsertAll ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((bi_strFromInt (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) xs)) v_Vuna_dCompiler_dCommon_dtblEmpty), xs, v_Vuna_dCompiler_dCommon_dtblEmpty)))

let v_Vuna_dCompiler_dCore_dTerm_dsolsOf = (fun t -> (fun xs -> (fun d -> (C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (t, xs, d)))))

let v_Vuna_dCompiler_dCore_dTerm_dsolsList = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (dtb__30, dtb__31, dtb__32) -> dtb__31
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsTbl = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (dtb__33, dtb__34, dtb__35) -> dtb__33
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsDepth = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (dtb__36, dtb__37, dtb__38) -> ((v_Vuna_dCompiler_dCommon_dtblLookup (bi_strFromInt mc0)) dtb__38)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dTerm_dsolsLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (dtb__39, dtb__40, dtb__41) -> ((v_Vuna_dCompiler_dCommon_dtblLookup (bi_strFromInt mc0)) dtb__39)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dTerm_dsolsCons = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (dtb__42, dtb__43, dtb__44) -> (C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols ((((v_Vuna_dCompiler_dCommon_dtblInsert (bi_strFromInt mc0)) mc1) dtb__42), (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), dtb__43)), dtb__44))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCore_dTerm_ddefLookup = (fun name -> (fun tbl -> ((v_Vuna_dCompiler_dCommon_dtblLookup name) tbl)))

let v_Vuna_dCompiler_dCore_dTerm_dnotBool = (fun b -> (if b then false else true))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar = (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__45, dtb__46) -> (if ((bi_ge_int dtb__46) depth) then true else false)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__47) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__48) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__49) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__50, dtb__51, dtb__52, dtb__53, dtb__54) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__53) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar ((bi_add depth) 1)) dtb__54))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__55, dtb__56, dtb__57) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar ((bi_add depth) 1)) dtb__57)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__58, dtb__59, dtb__60) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__58) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__59))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__61, dtb__62) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs depth) dtb__62)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__63, dtb__64) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__63) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts depth) dtb__64))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__65) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__66) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__67) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__68, dtb__69, dtb__70) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__68) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__69)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__70))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__71, dtb__72) -> (match dtb__71 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__73, dtb__74) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__73) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__72))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__75, dtb__76) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar ((bi_add mc0) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__75)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__75)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts mc0) dtb__76))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasMeta = (fun m -> (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__77) -> ((bi_eq_int m) dtb__77)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__78, dtb__79) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__80) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__81) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__82, dtb__83, dtb__84, dtb__85, dtb__86) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__85) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) ((bi_add depth) 1)) dtb__86))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__87, dtb__88, dtb__89) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) ((bi_add depth) 1)) dtb__89)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__90, dtb__91, dtb__92) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__90) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__91))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__93, dtb__94) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs m) depth) dtb__94)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__95, dtb__96) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__95) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts m) depth) dtb__96))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__97) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__98) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__99) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__100, dtb__101, dtb__102) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__100) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__101)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__102))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__103, dtb__104) -> (match dtb__103 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__105, dtb__106) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__105) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__104))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__107, dtb__108) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) ((bi_add mc1) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__107)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__107)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts mc0) mc1) dtb__108))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCore_dTerm_dshift = (fun depth -> (fun amount -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__109, dtb__110) -> (if ((bi_ge_int dtb__110) depth) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__109, ((bi_add dtb__110) amount))) else t)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__111) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__112) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__113) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__114, dtb__115, dtb__116, dtb__117, dtb__118) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__114, dtb__115, dtb__116, (((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__117), (((v_Vuna_dCompiler_dCore_dTerm_dshift ((bi_add depth) 1)) amount) dtb__118)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__119, dtb__120, dtb__121) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__119, dtb__120, (((v_Vuna_dCompiler_dCore_dTerm_dshift ((bi_add depth) 1)) amount) dtb__121)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__122, dtb__123, dtb__124) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__122), (((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__123), dtb__124))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__125, dtb__126) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__125, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs depth) amount) dtb__126)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__127, dtb__128) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__127), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts depth) amount) dtb__128)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__129) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__130) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__131) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__132, dtb__133, dtb__134) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__132), (((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__133), (((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__134)))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dshiftArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__135, dtb__136) -> (match dtb__135 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__137, dtb__138) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__137), dtb__138)), (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__136)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__139, dtb__140) -> (C_Base_dList_dList_Base_dList_dCons ((((v_Vuna_dCompiler_dCore_dTerm_dshiftAlt mc0) mc1) dtb__139), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts mc0) mc1) dtb__140)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__141, dtb__142, dtb__143) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__141, dtb__142, (((v_Vuna_dCompiler_dCore_dTerm_dshift ((bi_add mc0) (v_Base_dList_dlength dtb__142))) mc1) dtb__143)))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt = (fun idx -> (fun arg -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__144, dtb__145) -> (if ((bi_eq_int dtb__145) idx) then arg else t)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__146) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__147) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__148) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__149, dtb__150, dtb__151, dtb__152, dtb__153) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__149, dtb__150, dtb__151, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__152), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt ((bi_add idx) 1)) arg) dtb__153)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__154, dtb__155, dtb__156) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__154, dtb__155, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt ((bi_add idx) 1)) arg) dtb__156)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__157, dtb__158, dtb__159) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__157), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__158), dtb__159))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__160, dtb__161) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__160, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__161)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__162, dtb__163) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__162), ((v_Base_dList_dmap ((v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt idx) arg)) dtb__163)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__164) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__165) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__166) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__167, dtb__168, dtb__169) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__167), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__168), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__169)))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt = (fun idx -> (fun arg -> (fun alt -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt ((v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt), (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt ((bi_add idx) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)))) arg) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))))))

let rec v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo = (fun m -> (fun name -> (fun q -> (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__170) -> (if ((bi_eq_int dtb__170) m) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (name, ((bi_sub depth) q))) else t)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__171, dtb__172, dtb__173, dtb__174, dtb__175) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__171, dtb__172, dtb__173, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__174), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) ((bi_add depth) 1)) dtb__175)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__176, dtb__177, dtb__178) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__176, dtb__177, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) ((bi_add depth) 1)) dtb__178)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__179, dtb__180, dtb__181) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__179), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__180), dtb__181))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__182, dtb__183) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__182, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__183)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__184, dtb__185) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__184), ((v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt m) name) q) depth)) dtb__185)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__186, dtb__187, dtb__188) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__186), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__187), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__188)))
  | _ -> t
))))))
and v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__189, dtb__190, dtb__191) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__189, dtb__190, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) ((bi_add mc3) (v_Base_dList_dlength dtb__190))) dtb__191)))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar = (fun m -> (fun name -> (fun q -> (fun t -> (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) 0) t)))))

let rec v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo = (fun name -> (fun idx -> (fun dictDom -> (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__192, dtb__193, dtb__194, dtb__195, dtb__196) -> (if ((bi_eq_int depth) idx) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__192, dtb__193, dtb__194, dtb__195, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (name, true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, dictDom, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__196))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__192, dtb__193, dtb__194, dtb__195, (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo name) idx) dictDom) ((bi_add depth) 1)) dtb__196))))
  | _ -> t
))))))

let v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder = (fun name -> (fun idx -> (fun dictDom -> (fun t -> (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo name) idx) dictDom) 0) t)))))

let v_Vuna_dCompiler_dCore_dTerm_dcutoffOf = (fun total -> (fun idx -> (if ((bi_le_int ((bi_sub total) ((bi_add idx) 1))) 0) then 0 else ((bi_sub total) ((bi_add idx) 1)))))

let rec v_Vuna_dCompiler_dCore_dTerm_dcountPis = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__197, dtb__198, dtb__199, dtb__200, dtb__201) -> ((bi_add 1) (v_Vuna_dCompiler_dCore_dTerm_dcountPis dtb__201))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo = (fun name -> (fun idx -> (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__202, dtb__203, dtb__204) -> (if ((bi_eq_int depth) idx) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__202, dtb__203, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (name, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__204))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__202, dtb__203, ((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo name) idx) ((bi_add depth) 1)) dtb__204))))
  | _ -> t
)))))

let v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder = (fun name -> (fun idx -> (fun t -> ((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo name) idx) 0) t))))

let rec v_Vuna_dCompiler_dCore_dTerm_dcountLams = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__205, dtb__206, dtb__207) -> ((bi_add 1) (v_Vuna_dCompiler_dCore_dTerm_dcountLams dtb__207))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar = (fun d -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__208, dtb__209) -> ((bi_ge_int dtb__209) d)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__210, dtb__211, dtb__212, dtb__213, dtb__214) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__213) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar ((bi_add d) 1)) dtb__214))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__215, dtb__216, dtb__217) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar ((bi_add d) 1)) dtb__217)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__218, dtb__219, dtb__220) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__218) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__219))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__221, dtb__222) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree d) dtb__222)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__223, dtb__224) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__223) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree d) dtb__224))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__225, dtb__226, dtb__227) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__225) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__226)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__227))
  | _ -> false
)))
and v_Vuna_dCompiler_dCore_dTerm_danyPairFree = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__228, dtb__229) -> (match dtb__228 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__230, dtb__231) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__230) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__229))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dTerm_danyAltFree = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__232, dtb__233) -> (match dtb__232 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__234, dtb__235, dtb__236) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar ((bi_add mc0) (v_Base_dList_dlength dtb__235))) dtb__236) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree mc0) dtb__233))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel = (fun fuel -> (fun sols -> (fun v -> (if ((bi_le_int fuel) 0) then false else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__237, dtb__238) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__237) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__239) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__239)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__240) -> (match dtb__240 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__241, dtb__242, dtb__243) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel ((bi_sub fuel) 1)) sols) dtb__243)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__244, dtb__245) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel ((bi_sub fuel) 1)) sols) dtb__245)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__246, dtb__247, dtb__248, dtb__249, dtb__250) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__249) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel ((bi_sub fuel) 1)) sols) dtb__250))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__251, dtb__252, dtb__253) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel ((bi_sub fuel) 1)) sols) dtb__253)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__254, dtb__255) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel ((bi_sub fuel) 1)) sols) dtb__255)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__256, dtb__257) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__256) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__257))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__258, dtb__259) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__258)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__260, dtb__261, dtb__262) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__260) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__261)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__262))
  | _ -> false
)))))
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel = (fun fuel -> (fun sols -> (fun vs -> (if ((bi_le_int fuel) 0) then false else (match vs with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__263, dtb__264) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__263) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel ((bi_sub fuel) 1)) sols) dtb__264))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel = (fun fuel -> (fun sols -> (fun clo -> (if ((bi_le_int fuel) 0) then false else (match clo with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__265, dtb__266) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel ((bi_sub fuel) 1)) sols) dtb__265)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue = (fun sols -> (fun v -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel 64) sols) v)))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaList = (fun sols -> (fun vs -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel 64) sols) vs)))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaClo = (fun sols -> (fun clo -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel 64) sols) clo)))

let v_Vuna_dCompiler_dCore_dTerm_disTypeValue = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__267) -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__268) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__268))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes = (fun limit -> (fun depth -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__269) -> (match dtb__269 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__270, dtb__271, dtb__272) -> (if ((bi_ge_int dtb__271) limit) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList limit) dtb__272))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__273, dtb__274) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList limit) dtb__274)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__275, dtb__276, dtb__277, dtb__278, dtb__279) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__278) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo limit) dtb__279))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__280, dtb__281, dtb__282) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo limit) dtb__282)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__283, dtb__284) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList limit) dtb__284)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__285, dtb__286) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList limit) dtb__286)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__287, dtb__288) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__287) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__288))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__289, dtb__290) -> (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__289)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__291, dtb__292, dtb__293) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__291) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__292)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__293))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__294) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__295) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__296) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__297) -> false
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__298, dtb__299) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) 0) dtb__298) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__299))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo = (fun limit -> (fun clo -> (match clo with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__300, dtb__301) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList limit) dtb__300)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowBinders = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__302, dtb__303) -> (match dtb__302 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__304, dtb__305) -> ((bi_concat " ") ((bi_concat dtb__304) (v_Vuna_dCompiler_dCore_dTerm_dshowBinders dtb__303)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__306, dtb__307) -> (if ((bi_eq_int dtb__306) 34) then ((bi_concat "\\\"") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__307)) else (if ((bi_eq_int dtb__306) 92) then ((bi_concat "\\\\") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__307)) else (if ((bi_eq_int dtb__306) 10) then ((bi_concat "\\n") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__307)) else (if ((bi_eq_int dtb__306) 9) then ((bi_concat "\\t") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__307)) else (if ((bi_eq_int dtb__306) 13) then ((bi_concat "\\r") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__307)) else ((bi_concat (dtp_pack (C_Base_dList_dList_Base_dList_dCons (dtb__306, C_Base_dList_dList_Base_dList_dNil)))) (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__307)))))))
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dshowCoreString = (fun s -> ((bi_concat "\"") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars (dtp_unpack s))) "\"")))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowTerm = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__308, dtb__309) -> dtb__308
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__310) -> ((bi_concat "?") (bi_strFromInt dtb__310))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__311) -> dtb__311
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__312) -> (if ((bi_eq_int (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__312)) 0) then "Type" else ((bi_concat "Type ") (bi_strFromInt (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__312))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__313, dtb__314, dtb__315, dtb__316, dtb__317) -> (if ((bi_eq_str dtb__313) "_") then ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__316)) ((bi_concat " -> ") (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__317))) else (if dtb__314 then ((bi_concat "{") ((bi_concat dtb__313) ((bi_concat " : ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__316)) ((bi_concat "} -> ") (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__317)))))) else ((bi_concat "(") ((bi_concat dtb__313) ((bi_concat " : ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__316)) ((bi_concat ") -> ") (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__317))))))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__318, dtb__319, dtb__320) -> ((bi_concat "\\") ((bi_concat dtb__318) ((bi_concat " => ") (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__320))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__321, dtb__322, dtb__323) -> ((bi_concat "(") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__321)) ((bi_concat " ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__322)) ")"))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__324, dtb__325) -> ((bi_concat "(") ((bi_concat dtb__324) ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__325)) ")")))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__326, dtb__327) -> ((bi_concat "case ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__326)) ((bi_concat " of ") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__327))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__328) -> (bi_strFromInt dtb__328)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__329) -> (v_Vuna_dCompiler_dCore_dTerm_dshowCoreString dtb__329)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__330) -> (if dtb__330 then "True" else "False")
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__331, dtb__332, dtb__333) -> ((bi_concat "if ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__331)) ((bi_concat " then ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__332)) ((bi_concat " else ") (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__333))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__334, dtb__335) -> (match dtb__334 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__336, dtb__337) -> ((bi_concat " ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__336)) (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__335)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__338, dtb__339) -> ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__338)) ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowBinders (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__338))) ((bi_concat " => ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__338))) ((bi_concat " | ") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__339))))))
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))
