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
and t_Vuna_dCompiler_dCore_dTerm_dSols = C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols of (t_Vuna_dCompiler_dCore_dTerm_dValue t_Vuna_dCompiler_dCommon_dHashTbl) * ((int, t_Vuna_dCompiler_dCore_dTerm_dValue) t_Base_dPair_dPair t_Base_dList_dList)

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
  | C_Base_dList_dList_Cons (dtb__26, dtb__27) -> (match dtb__26 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__28, dtb__29) -> (if ((bi_eq_int mc0) dtb__28) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__29)) else ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup mc0) dtb__27))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty = (C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (v_Vuna_dCompiler_dCommon_dtblEmpty, C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dCore_dTerm_dsolsFromList = (fun xs -> (C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (((v_Vuna_dCompiler_dCommon_dtblInsertAll ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((bi_strFromInt (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) xs)) v_Vuna_dCompiler_dCommon_dtblEmpty), xs)))

let v_Vuna_dCompiler_dCore_dTerm_dsolsList = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (dtb__30, dtb__31) -> dtb__31
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsTbl = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (dtb__32, dtb__33) -> dtb__32
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dsolsLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (dtb__34, dtb__35) -> ((v_Vuna_dCompiler_dCommon_dtblLookup (bi_strFromInt mc0)) dtb__34)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dTerm_dsolsCons = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols (dtb__36, dtb__37) -> (C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols ((((v_Vuna_dCompiler_dCommon_dtblInsert (bi_strFromInt mc0)) mc1) dtb__36), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), dtb__37))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCore_dTerm_ddefLookup = (fun name -> (fun tbl -> ((v_Vuna_dCompiler_dCommon_dtblLookup name) tbl)))

let v_Vuna_dCompiler_dCore_dTerm_dnotBool = (fun b -> (if b then false else true))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar = (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__38, dtb__39) -> (if ((bi_ge_int dtb__39) depth) then true else false)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__40) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__41) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__42) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__43, dtb__44, dtb__45, dtb__46, dtb__47) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__46) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar ((bi_add depth) 1)) dtb__47))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__48, dtb__49, dtb__50) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar ((bi_add depth) 1)) dtb__50)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__51, dtb__52, dtb__53) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__51) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__52))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__54, dtb__55) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs depth) dtb__55)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__56, dtb__57) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__56) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts depth) dtb__57))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__58) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__59) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__60) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__61, dtb__62, dtb__63) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__61) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__62)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__63))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__64, dtb__65) -> (match dtb__64 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__66, dtb__67) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__66) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__65))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__68, dtb__69) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar ((bi_add mc0) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__68)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__68)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts mc0) dtb__69))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasMeta = (fun m -> (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__70) -> ((bi_eq_int m) dtb__70)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__71, dtb__72) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__73) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__74) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__75, dtb__76, dtb__77, dtb__78, dtb__79) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__78) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) ((bi_add depth) 1)) dtb__79))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__80, dtb__81, dtb__82) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) ((bi_add depth) 1)) dtb__82)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__83, dtb__84, dtb__85) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__83) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__84))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__86, dtb__87) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs m) depth) dtb__87)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__88, dtb__89) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__88) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts m) depth) dtb__89))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__90) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__91) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__92) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__93, dtb__94, dtb__95) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__93) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__94)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__95))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__96, dtb__97) -> (match dtb__96 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__98, dtb__99) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__98) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__97))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__100, dtb__101) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) ((bi_add mc1) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__100)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__100)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts mc0) mc1) dtb__101))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCore_dTerm_dshift = (fun depth -> (fun amount -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__102, dtb__103) -> (if ((bi_ge_int dtb__103) depth) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__102, ((bi_add dtb__103) amount))) else t)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__104) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__105) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__106) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__107, dtb__108, dtb__109, dtb__110, dtb__111) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__107, dtb__108, dtb__109, (((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__110), (((v_Vuna_dCompiler_dCore_dTerm_dshift ((bi_add depth) 1)) amount) dtb__111)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__112, dtb__113, dtb__114) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__112, dtb__113, (((v_Vuna_dCompiler_dCore_dTerm_dshift ((bi_add depth) 1)) amount) dtb__114)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__115, dtb__116, dtb__117) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__115), (((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__116), dtb__117))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__118, dtb__119) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__118, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs depth) amount) dtb__119)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__120, dtb__121) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__120), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts depth) amount) dtb__121)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__122) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__123) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__124) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__125, dtb__126, dtb__127) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__125), (((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__126), (((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__127)))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dshiftArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__128, dtb__129) -> (match dtb__128 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__130, dtb__131) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__130), dtb__131)), (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__129)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__132, dtb__133) -> (C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dCore_dTerm_dshiftAlt mc0) mc1) dtb__132), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts mc0) mc1) dtb__133)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__134, dtb__135, dtb__136) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__134, dtb__135, (((v_Vuna_dCompiler_dCore_dTerm_dshift ((bi_add mc0) (v_Base_dList_dlength dtb__135))) mc1) dtb__136)))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt = (fun idx -> (fun arg -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__137, dtb__138) -> (if ((bi_eq_int dtb__138) idx) then arg else t)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__139) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__140) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__141) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__142, dtb__143, dtb__144, dtb__145, dtb__146) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__142, dtb__143, dtb__144, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__145), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt ((bi_add idx) 1)) arg) dtb__146)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__147, dtb__148, dtb__149) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__147, dtb__148, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt ((bi_add idx) 1)) arg) dtb__149)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__150, dtb__151, dtb__152) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__150), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__151), dtb__152))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__153, dtb__154) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__153, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__154)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__155, dtb__156) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__155), ((v_Base_dList_dmap ((v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt idx) arg)) dtb__156)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__157) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__158) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__159) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__160, dtb__161, dtb__162) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__160), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__161), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__162)))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt = (fun idx -> (fun arg -> (fun alt -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt ((v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt), (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt ((bi_add idx) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)))) arg) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))))))

let rec v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo = (fun m -> (fun name -> (fun q -> (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__163) -> (if ((bi_eq_int dtb__163) m) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (name, ((bi_sub depth) q))) else t)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__164, dtb__165, dtb__166, dtb__167, dtb__168) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__164, dtb__165, dtb__166, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__167), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) ((bi_add depth) 1)) dtb__168)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__169, dtb__170, dtb__171) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__169, dtb__170, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) ((bi_add depth) 1)) dtb__171)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__172, dtb__173, dtb__174) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__172), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__173), dtb__174))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__175, dtb__176) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__175, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__176)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__177, dtb__178) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__177), ((v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt m) name) q) depth)) dtb__178)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__179, dtb__180, dtb__181) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__179), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__180), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__181)))
  | _ -> t
))))))
and v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__182, dtb__183, dtb__184) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__182, dtb__183, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) ((bi_add mc3) (v_Base_dList_dlength dtb__183))) dtb__184)))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar = (fun m -> (fun name -> (fun q -> (fun t -> (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) 0) t)))))

let rec v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo = (fun name -> (fun idx -> (fun dictDom -> (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__185, dtb__186, dtb__187, dtb__188, dtb__189) -> (if ((bi_eq_int depth) idx) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__185, dtb__186, dtb__187, dtb__188, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (name, true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, dictDom, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__189))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__185, dtb__186, dtb__187, dtb__188, (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo name) idx) dictDom) ((bi_add depth) 1)) dtb__189))))
  | _ -> t
))))))

let v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder = (fun name -> (fun idx -> (fun dictDom -> (fun t -> (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo name) idx) dictDom) 0) t)))))

let v_Vuna_dCompiler_dCore_dTerm_dcutoffOf = (fun total -> (fun idx -> (if ((bi_le_int ((bi_sub total) ((bi_add idx) 1))) 0) then 0 else ((bi_sub total) ((bi_add idx) 1)))))

let rec v_Vuna_dCompiler_dCore_dTerm_dcountPis = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__190, dtb__191, dtb__192, dtb__193, dtb__194) -> ((bi_add 1) (v_Vuna_dCompiler_dCore_dTerm_dcountPis dtb__194))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo = (fun name -> (fun idx -> (fun total -> (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__195, dtb__196, dtb__197) -> (if ((bi_eq_int depth) idx) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__195, dtb__196, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (name, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (((v_Vuna_dCompiler_dCore_dTerm_dshift ((v_Vuna_dCompiler_dCore_dTerm_dcutoffOf total) idx)) 1) dtb__197))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__195, dtb__196, (((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo name) idx) total) ((bi_add depth) 1)) dtb__197))))
  | _ -> t
))))))

let rec v_Vuna_dCompiler_dCore_dTerm_dcountLams = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__198, dtb__199, dtb__200) -> ((bi_add 1) (v_Vuna_dCompiler_dCore_dTerm_dcountLams dtb__200))
  | _ -> 0
))

let v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder = (fun name -> (fun idx -> (fun t -> (((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo name) idx) (v_Vuna_dCompiler_dCore_dTerm_dcountLams t)) 0) t))))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar = (fun d -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__201, dtb__202) -> ((bi_ge_int dtb__202) d)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__203, dtb__204, dtb__205, dtb__206, dtb__207) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__206) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar ((bi_add d) 1)) dtb__207))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__208, dtb__209, dtb__210) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar ((bi_add d) 1)) dtb__210)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__211, dtb__212, dtb__213) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__211) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__212))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__214, dtb__215) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree d) dtb__215)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__216, dtb__217) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__216) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree d) dtb__217))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__218, dtb__219, dtb__220) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__218) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__219)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__220))
  | _ -> false
)))
and v_Vuna_dCompiler_dCore_dTerm_danyPairFree = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__221, dtb__222) -> (match dtb__221 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__223, dtb__224) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__223) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__222))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dTerm_danyAltFree = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__225, dtb__226) -> (match dtb__225 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__227, dtb__228, dtb__229) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar ((bi_add mc0) (v_Base_dList_dlength dtb__228))) dtb__229) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree mc0) dtb__226))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel = (fun fuel -> (fun sols -> (fun v -> (if ((bi_le_int fuel) 0) then false else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__230, dtb__231) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__230) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__232) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__232)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__233) -> (match dtb__233 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__234, dtb__235, dtb__236) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel ((bi_sub fuel) 1)) sols) dtb__236)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__237, dtb__238) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel ((bi_sub fuel) 1)) sols) dtb__238)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__239, dtb__240, dtb__241, dtb__242, dtb__243) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__242) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel ((bi_sub fuel) 1)) sols) dtb__243))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__244, dtb__245, dtb__246) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel ((bi_sub fuel) 1)) sols) dtb__246)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__247, dtb__248) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel ((bi_sub fuel) 1)) sols) dtb__248)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__249, dtb__250) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__249) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__250))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__251, dtb__252) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__251)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__253, dtb__254, dtb__255) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__253) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__254)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__255))
  | _ -> false
)))))
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel = (fun fuel -> (fun sols -> (fun vs -> (if ((bi_le_int fuel) 0) then false else (match vs with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__256, dtb__257) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__256) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel ((bi_sub fuel) 1)) sols) dtb__257))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel = (fun fuel -> (fun sols -> (fun clo -> (if ((bi_le_int fuel) 0) then false else (match clo with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__258, dtb__259) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel ((bi_sub fuel) 1)) sols) dtb__258)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue = (fun sols -> (fun v -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel 64) sols) v)))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaList = (fun sols -> (fun vs -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel 64) sols) vs)))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaClo = (fun sols -> (fun clo -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel 64) sols) clo)))

let v_Vuna_dCompiler_dCore_dTerm_disTypeValue = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__260) -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__261) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__261))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes = (fun limit -> (fun depth -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__262) -> (match dtb__262 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__263, dtb__264, dtb__265) -> (if ((bi_ge_int dtb__264) limit) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList limit) dtb__265))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__266, dtb__267) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList limit) dtb__267)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__268, dtb__269, dtb__270, dtb__271, dtb__272) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__271) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo limit) dtb__272))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__273, dtb__274, dtb__275) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo limit) dtb__275)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__276, dtb__277) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList limit) dtb__277)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__278, dtb__279) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList limit) dtb__279)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__280, dtb__281) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__280) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__281))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__282, dtb__283) -> (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__282)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__284, dtb__285, dtb__286) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__284) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__285)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__286))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__287) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__288) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__289) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__290) -> false
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__291, dtb__292) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) 0) dtb__291) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__292))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo = (fun limit -> (fun clo -> (match clo with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__293, dtb__294) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList limit) dtb__293)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowBinders = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__295, dtb__296) -> (match dtb__295 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__297, dtb__298) -> ((bi_concat " ") ((bi_concat dtb__297) (v_Vuna_dCompiler_dCore_dTerm_dshowBinders dtb__296)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__299, dtb__300) -> (if ((bi_eq_int dtb__299) 34) then ((bi_concat "\\\"") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__300)) else (if ((bi_eq_int dtb__299) 92) then ((bi_concat "\\\\") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__300)) else (if ((bi_eq_int dtb__299) 10) then ((bi_concat "\\n") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__300)) else (if ((bi_eq_int dtb__299) 9) then ((bi_concat "\\t") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__300)) else (if ((bi_eq_int dtb__299) 13) then ((bi_concat "\\r") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__300)) else ((bi_concat (dtp_pack (C_Base_dList_dList_Cons (dtb__299, C_Base_dList_dList_Nil)))) (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__300)))))))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dshowCoreString = (fun s -> ((bi_concat "\"") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars (dtp_unpack s))) "\"")))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowTerm = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__301, dtb__302) -> dtb__301
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__303) -> ((bi_concat "?") (bi_strFromInt dtb__303))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__304) -> dtb__304
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__305) -> (if ((bi_eq_int (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__305)) 0) then "Type" else ((bi_concat "Type ") (bi_strFromInt (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__305))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__306, dtb__307, dtb__308, dtb__309, dtb__310) -> (if ((bi_eq_str dtb__306) "_") then ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__309)) ((bi_concat " -> ") (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__310))) else (if dtb__307 then ((bi_concat "{") ((bi_concat dtb__306) ((bi_concat " : ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__309)) ((bi_concat "} -> ") (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__310)))))) else ((bi_concat "(") ((bi_concat dtb__306) ((bi_concat " : ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__309)) ((bi_concat ") -> ") (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__310))))))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__311, dtb__312, dtb__313) -> ((bi_concat "\\") ((bi_concat dtb__311) ((bi_concat " => ") (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__313))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__314, dtb__315, dtb__316) -> ((bi_concat "(") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__314)) ((bi_concat " ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__315)) ")"))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__317, dtb__318) -> ((bi_concat "(") ((bi_concat dtb__317) ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__318)) ")")))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__319, dtb__320) -> ((bi_concat "case ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__319)) ((bi_concat " of ") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__320))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__321) -> (bi_strFromInt dtb__321)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__322) -> (v_Vuna_dCompiler_dCore_dTerm_dshowCoreString dtb__322)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__323) -> (if dtb__323 then "True" else "False")
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__324, dtb__325, dtb__326) -> ((bi_concat "if ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__324)) ((bi_concat " then ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__325)) ((bi_concat " else ") (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__326))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__327, dtb__328) -> (match dtb__327 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__329, dtb__330) -> ((bi_concat " ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__329)) (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__328)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__331, dtb__332) -> ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__331)) ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowBinders (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__331))) ((bi_concat " => ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__331))) ((bi_concat " | ") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__332))))))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
