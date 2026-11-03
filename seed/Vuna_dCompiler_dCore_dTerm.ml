open Vuna_runtime
open Vuna_builtins
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
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
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

let v_Vuna_dCompiler_dCore_dTerm_dlevelZero = fun () -> (C_Vuna_dCompiler_dCore_dTerm_dLevel_Vuna_dCompiler_dCore_dTerm_dMkLevel (0))

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

let v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel = fun () -> 512

let rec v_Vuna_dCompiler_dCore_dTerm_dmetaLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__26, dtb__27) -> (match dtb__26 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__28, dtb__29) -> (if ((bi_eq_int mc0) dtb__28) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__29)) else ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup mc0) dtb__27))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dTerm_ddefLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__30, dtb__31) -> (match dtb__30 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__32, dtb__33) -> (if ((bi_eq_str mc0) dtb__32) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__33)) else ((v_Vuna_dCompiler_dCore_dTerm_ddefLookup mc0) dtb__31))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dTerm_dnotBool = (fun b -> (if b then false else true))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar = (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__34, dtb__35) -> (if ((bi_ge_int dtb__35) depth) then true else false)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__36) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__37) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__38) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__39, dtb__40, dtb__41, dtb__42, dtb__43) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__42) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar ((bi_add depth) 1)) dtb__43))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__44, dtb__45, dtb__46) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar ((bi_add depth) 1)) dtb__46)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__47, dtb__48, dtb__49) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__47) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__48))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__50, dtb__51) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs depth) dtb__51)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__52, dtb__53) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__52) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts depth) dtb__53))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__54) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__55) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__56) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__57, dtb__58, dtb__59) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__57) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__58)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar depth) dtb__59))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__60, dtb__61) -> (match dtb__60 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__62, dtb__63) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar mc0) dtb__62) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs mc0) dtb__61))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__64, dtb__65) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar ((bi_add mc0) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__64)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__64)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts mc0) dtb__65))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasMeta = (fun m -> (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__66) -> ((bi_eq_int m) dtb__66)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__67, dtb__68) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__69) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__70) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__71, dtb__72, dtb__73, dtb__74, dtb__75) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__74) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) ((bi_add depth) 1)) dtb__75))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__76, dtb__77, dtb__78) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) ((bi_add depth) 1)) dtb__78)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__79, dtb__80, dtb__81) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__79) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__80))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__82, dtb__83) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs m) depth) dtb__83)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__84, dtb__85) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__84) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts m) depth) dtb__85))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__86) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__87) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__88) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__89, dtb__90, dtb__91) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__89) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__90)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) depth) dtb__91))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__92, dtb__93) -> (match dtb__92 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__94, dtb__95) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) mc1) dtb__94) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs mc0) mc1) dtb__93))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__96, dtb__97) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasMeta mc0) ((bi_add mc1) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__96)))) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__96)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts mc0) mc1) dtb__97))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCore_dTerm_dshift = (fun depth -> (fun amount -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__98, dtb__99) -> (if ((bi_ge_int dtb__99) depth) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__98, ((bi_add dtb__99) amount))) else t)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__100) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__101) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__102) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__103, dtb__104, dtb__105, dtb__106, dtb__107) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__103, dtb__104, dtb__105, (((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__106), (((v_Vuna_dCompiler_dCore_dTerm_dshift ((bi_add depth) 1)) amount) dtb__107)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__108, dtb__109, dtb__110) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__108, dtb__109, (((v_Vuna_dCompiler_dCore_dTerm_dshift ((bi_add depth) 1)) amount) dtb__110)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__111, dtb__112, dtb__113) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__111), (((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__112), dtb__113))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__114, dtb__115) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__114, (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs depth) amount) dtb__115)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__116, dtb__117) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__116), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts depth) amount) dtb__117)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__118) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__119) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__120) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__121, dtb__122, dtb__123) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__121), (((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__122), (((v_Vuna_dCompiler_dCore_dTerm_dshift depth) amount) dtb__123)))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dshiftArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__124, dtb__125) -> (match dtb__124 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__126, dtb__127) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dTerm_dshift mc0) mc1) dtb__126), dtb__127)), (((v_Vuna_dCompiler_dCore_dTerm_dshiftArgs mc0) mc1) dtb__125)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__128, dtb__129) -> (C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dCore_dTerm_dshiftAlt mc0) mc1) dtb__128), (((v_Vuna_dCompiler_dCore_dTerm_dshiftAlts mc0) mc1) dtb__129)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dshiftAlt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__130, dtb__131, dtb__132) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__130, dtb__131, (((v_Vuna_dCompiler_dCore_dTerm_dshift ((bi_add mc0) (v_Base_dList_dlength dtb__131))) mc1) dtb__132)))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt = (fun idx -> (fun arg -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__133, dtb__134) -> (if ((bi_eq_int dtb__134) idx) then arg else t)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__135) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__136) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__137) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__138, dtb__139, dtb__140, dtb__141, dtb__142) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__138, dtb__139, dtb__140, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__141), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt ((bi_add idx) 1)) arg) dtb__142)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__143, dtb__144, dtb__145) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__143, dtb__144, (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt ((bi_add idx) 1)) arg) dtb__145)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__146, dtb__147, dtb__148) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__146), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__147), dtb__148))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__149, dtb__150) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__149, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__150)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__151, dtb__152) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__151), ((v_Base_dList_dmap ((v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt idx) arg)) dtb__152)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__153) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__154) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__155) -> t
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__156, dtb__157, dtb__158) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__156), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__157), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt idx) arg) dtb__158)))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt = (fun idx -> (fun arg -> (fun alt -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt ((v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt), (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt), (((v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt ((bi_add idx) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)))) arg) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))))))

let rec v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo = (fun m -> (fun name -> (fun q -> (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__159) -> (if ((bi_eq_int dtb__159) m) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (name, ((bi_sub depth) q))) else t)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__160, dtb__161, dtb__162, dtb__163, dtb__164) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__160, dtb__161, dtb__162, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__163), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) ((bi_add depth) 1)) dtb__164)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__165, dtb__166, dtb__167) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__165, dtb__166, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) ((bi_add depth) 1)) dtb__167)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__168, dtb__169, dtb__170) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__168), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__169), dtb__170))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__171, dtb__172) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__171, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__172)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__173, dtb__174) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__173), ((v_Base_dList_dmap ((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt m) name) q) depth)) dtb__174)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__175, dtb__176, dtb__177) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__175), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__176), (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) depth) dtb__177)))
  | _ -> t
))))))
and v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__178, dtb__179, dtb__180) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__178, dtb__179, (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo mc0) mc1) mc2) ((bi_add mc3) (v_Base_dList_dlength dtb__179))) dtb__180)))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar = (fun m -> (fun name -> (fun q -> (fun t -> (((((v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo m) name) q) 0) t)))))

let rec v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo = (fun name -> (fun idx -> (fun dictDom -> (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__181, dtb__182, dtb__183, dtb__184, dtb__185) -> (if ((bi_eq_int depth) idx) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__181, dtb__182, dtb__183, dtb__184, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (name, true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, dictDom, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__185))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__181, dtb__182, dtb__183, dtb__184, (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo name) idx) dictDom) ((bi_add depth) 1)) dtb__185))))
  | _ -> t
))))))

let v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder = (fun name -> (fun idx -> (fun dictDom -> (fun t -> (((((v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo name) idx) dictDom) 0) t)))))

let v_Vuna_dCompiler_dCore_dTerm_dcutoffOf = (fun total -> (fun idx -> (if ((bi_le_int ((bi_sub total) ((bi_add idx) 1))) 0) then 0 else ((bi_sub total) ((bi_add idx) 1)))))

let rec v_Vuna_dCompiler_dCore_dTerm_dcountPis = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__186, dtb__187, dtb__188, dtb__189, dtb__190) -> ((bi_add 1) (v_Vuna_dCompiler_dCore_dTerm_dcountPis dtb__190))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo = (fun name -> (fun idx -> (fun total -> (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__191, dtb__192, dtb__193) -> (if ((bi_eq_int depth) idx) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__191, dtb__192, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (name, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (((v_Vuna_dCompiler_dCore_dTerm_dshift ((v_Vuna_dCompiler_dCore_dTerm_dcutoffOf total) idx)) 1) dtb__193))))) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__191, dtb__192, (((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo name) idx) total) ((bi_add depth) 1)) dtb__193))))
  | _ -> t
))))))

let rec v_Vuna_dCompiler_dCore_dTerm_dcountLams = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__194, dtb__195, dtb__196) -> ((bi_add 1) (v_Vuna_dCompiler_dCore_dTerm_dcountLams dtb__196))
  | _ -> 0
))

let v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder = (fun name -> (fun idx -> (fun t -> (((((v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo name) idx) (v_Vuna_dCompiler_dCore_dTerm_dcountLams t)) 0) t))))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar = (fun d -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__197, dtb__198) -> ((bi_ge_int dtb__198) d)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__199, dtb__200, dtb__201, dtb__202, dtb__203) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__202) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar ((bi_add d) 1)) dtb__203))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__204, dtb__205, dtb__206) -> ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar ((bi_add d) 1)) dtb__206)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__207, dtb__208, dtb__209) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__207) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__208))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__210, dtb__211) -> ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree d) dtb__211)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__212, dtb__213) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__212) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree d) dtb__213))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__214, dtb__215, dtb__216) -> (if (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__214) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__215)) then true else ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar d) dtb__216))
  | _ -> false
)))
and v_Vuna_dCompiler_dCore_dTerm_danyPairFree = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__217, dtb__218) -> (match dtb__217 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__219, dtb__220) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc0) dtb__219) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyPairFree mc0) dtb__218))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dTerm_danyAltFree = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__221, dtb__222) -> (match dtb__221 with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__223, dtb__224, dtb__225) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar ((bi_add mc0) (v_Base_dList_dlength dtb__224))) dtb__225) then true else ((v_Vuna_dCompiler_dCore_dTerm_danyAltFree mc0) dtb__222))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel = (fun fuel -> (fun sols -> (fun v -> (if ((bi_le_int fuel) 0) then false else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__226, dtb__227) -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__226) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__228) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__228)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__229) -> (match dtb__229 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__230, dtb__231, dtb__232) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel ((bi_sub fuel) 1)) sols) dtb__232)
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__233, dtb__234) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel ((bi_sub fuel) 1)) sols) dtb__234)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__235, dtb__236, dtb__237, dtb__238, dtb__239) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__238) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel ((bi_sub fuel) 1)) sols) dtb__239))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__240, dtb__241, dtb__242) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel ((bi_sub fuel) 1)) sols) dtb__242)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__243, dtb__244) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel ((bi_sub fuel) 1)) sols) dtb__244)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__245, dtb__246) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__245) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__246))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__247, dtb__248) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__247)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__249, dtb__250, dtb__251) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__249) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__250)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__251))
  | _ -> false
)))))
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel = (fun fuel -> (fun sols -> (fun vs -> (if ((bi_le_int fuel) 0) then false else (match vs with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__252, dtb__253) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel ((bi_sub fuel) 1)) sols) dtb__252) then true else (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel ((bi_sub fuel) 1)) sols) dtb__253))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel = (fun fuel -> (fun sols -> (fun clo -> (if ((bi_le_int fuel) 0) then false else (match clo with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__254, dtb__255) -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel ((bi_sub fuel) 1)) sols) dtb__254)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue = (fun sols -> (fun v -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel 64) sols) v)))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaList = (fun sols -> (fun vs -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel 64) sols) vs)))

let v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaClo = (fun sols -> (fun clo -> (((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel 64) sols) clo)))

let v_Vuna_dCompiler_dCore_dTerm_disTypeValue = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__256) -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__257) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__257))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes = (fun limit -> (fun depth -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__258) -> (match dtb__258 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__259, dtb__260, dtb__261) -> (if ((bi_ge_int dtb__260) limit) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList limit) dtb__261))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__262, dtb__263) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList limit) dtb__263)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__264, dtb__265, dtb__266, dtb__267, dtb__268) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__267) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo limit) dtb__268))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__269, dtb__270, dtb__271) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo limit) dtb__271)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__272, dtb__273) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList limit) dtb__273)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__274, dtb__275) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList limit) dtb__275)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__276, dtb__277) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__276) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__277))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__278, dtb__279) -> (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__278)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__280, dtb__281, dtb__282) -> (if (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__280) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__281)) then true else (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes limit) depth) dtb__282))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__283) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__284) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__285) -> false
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__286) -> false
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__287, dtb__288) -> (if (((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes mc0) 0) dtb__287) then true else ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList mc0) dtb__288))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo = (fun limit -> (fun clo -> (match clo with
  | C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClos (dtb__289, dtb__290) -> ((v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList limit) dtb__289)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowBinders = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__291, dtb__292) -> (match dtb__291 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__293, dtb__294) -> ((bi_concat " ") ((bi_concat dtb__293) (v_Vuna_dCompiler_dCore_dTerm_dshowBinders dtb__292)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__295, dtb__296) -> (if ((bi_eq_int dtb__295) 34) then ((bi_concat "\\\"") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__296)) else (if ((bi_eq_int dtb__295) 92) then ((bi_concat "\\\\") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__296)) else (if ((bi_eq_int dtb__295) 10) then ((bi_concat "\\n") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__296)) else (if ((bi_eq_int dtb__295) 9) then ((bi_concat "\\t") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__296)) else (if ((bi_eq_int dtb__295) 13) then ((bi_concat "\\r") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__296)) else ((bi_concat (dtp_pack (C_Base_dList_dList_Cons (dtb__295, C_Base_dList_dList_Nil)))) (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars dtb__296)))))))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dTerm_dshowCoreString = (fun s -> ((bi_concat "\"") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars (dtp_unpack s))) "\"")))

let rec v_Vuna_dCompiler_dCore_dTerm_dshowTerm = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__297, dtb__298) -> dtb__297
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__299) -> ((bi_concat "?") (bi_strFromInt dtb__299))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__300) -> dtb__300
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__301) -> (if ((bi_eq_int (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__301)) 0) then "Type" else ((bi_concat "Type ") (bi_strFromInt (v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__301))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__302, dtb__303, dtb__304, dtb__305, dtb__306) -> (if ((bi_eq_str dtb__302) "_") then ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__305)) ((bi_concat " -> ") (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__306))) else (if dtb__303 then ((bi_concat "{") ((bi_concat dtb__302) ((bi_concat " : ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__305)) ((bi_concat "} -> ") (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__306)))))) else ((bi_concat "(") ((bi_concat dtb__302) ((bi_concat " : ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__305)) ((bi_concat ") -> ") (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__306))))))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__307, dtb__308, dtb__309) -> ((bi_concat "\\") ((bi_concat dtb__307) ((bi_concat " => ") (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__309))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__310, dtb__311, dtb__312) -> ((bi_concat "(") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__310)) ((bi_concat " ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__311)) ")"))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__313, dtb__314) -> ((bi_concat "(") ((bi_concat dtb__313) ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__314)) ")")))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__315, dtb__316) -> ((bi_concat "case ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__315)) ((bi_concat " of ") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__316))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__317) -> (bi_strFromInt dtb__317)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__318) -> (v_Vuna_dCompiler_dCore_dTerm_dshowCoreString dtb__318)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__319) -> (if dtb__319 then "True" else "False")
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__320, dtb__321, dtb__322) -> ((bi_concat "if ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__320)) ((bi_concat " then ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__321)) ((bi_concat " else ") (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__322))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__323, dtb__324) -> (match dtb__323 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__325, dtb__326) -> ((bi_concat " ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__325)) (v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms dtb__324)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__327, dtb__328) -> ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__327)) ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowBinders (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__327))) ((bi_concat " => ") ((bi_concat (v_Vuna_dCompiler_dCore_dTerm_dshowTerm (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__327))) ((bi_concat " | ") (v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts dtb__328))))))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
