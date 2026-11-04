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
open Base_dIO
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
open Vuna_dCompiler_dCore_dTerm
open Vuna_dCompiler_dCore_dEval
open Vuna_dCompiler_dCore_dConv
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dElab_dTypes
let v_Vuna_dCompiler_dElab_dPrelude_dintTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (v_Vuna_dCompiler_dIntrinsics_dintTypeName))

let v_Vuna_dCompiler_dElab_dPrelude_dstrTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (v_Vuna_dCompiler_dIntrinsics_dstrTypeName))

let v_Vuna_dCompiler_dElab_dPrelude_dboolTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName))

let v_Vuna_dCompiler_dElab_dPrelude_dfun2 = (fun a -> (fun b -> (fun c -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, a, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) b), (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 2) c))))))))

let v_Vuna_dCompiler_dElab_dPrelude_deqOps = (C_Base_dList_dList_Base_dList_dCons ("==", (C_Base_dList_dList_Base_dList_dCons ("/=", C_Base_dList_dList_Base_dList_dNil))))

let v_Vuna_dCompiler_dElab_dPrelude_disEqOp = (fun name -> ((v_Base_dList_dmemName name) v_Vuna_dCompiler_dElab_dPrelude_deqOps))

let v_Vuna_dCompiler_dElab_dPrelude_dbuiltinTyName = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__0) -> (match dtb__0 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__1, dtb__2) -> (if ((bi_eq_int (v_Base_dList_dlength dtb__2)) 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dPrelude_deqRuntimeName = (fun mc0 -> (fun mc1 -> (if ((bi_eq_str mc1) "Int") then (if ((bi_eq_str mc0) "==") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_eq_int")) else (C_Base_dResult_dResult_Base_dResult_dOk ("bi_neq_int"))) else (if ((bi_eq_str mc1) "String") then (if ((bi_eq_str mc0) "==") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_eq_str")) else (C_Base_dResult_dResult_Base_dResult_dOk ("bi_neq_str"))) else (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dOpOnlyIntString (mc0, mc1))) (C_Base_dVec_dVec_Base_dVec_dVCons (mc0, (C_Base_dVec_dVec_Base_dVec_dVCons (mc1, C_Base_dVec_dVec_Base_dVec_dVNil)))))))))))

let v_Vuna_dCompiler_dElab_dPrelude_dpolyEqTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("a", true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)), (((v_Vuna_dCompiler_dElab_dPrelude_dfun2 (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar ("a", 0))) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar ("a", 0))) v_Vuna_dCompiler_dElab_dPrelude_dboolTy)))

let rec v_Vuna_dCompiler_dElab_dPrelude_dityToTerm = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dIntrinsics_dIType_Vuna_dCompiler_dIntrinsics_dIPolyEq -> v_Vuna_dCompiler_dElab_dPrelude_dpolyEqTy
  | C_Vuna_dCompiler_dIntrinsics_dIType_Vuna_dCompiler_dIntrinsics_dIFun (dtb__3, dtb__4) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (v_Vuna_dCompiler_dElab_dPrelude_dityToTerm dtb__3), (v_Vuna_dCompiler_dElab_dPrelude_dityToTerm dtb__4)))
  | C_Vuna_dCompiler_dIntrinsics_dIType_Vuna_dCompiler_dIntrinsics_dIIO (dtb__5) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (v_Vuna_dCompiler_dIntrinsics_dioFamilyName)), (v_Vuna_dCompiler_dElab_dPrelude_dityToTerm dtb__5), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))
  | C_Vuna_dCompiler_dIntrinsics_dIType_Vuna_dCompiler_dIntrinsics_dIList (dtb__6) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (v_Vuna_dCompiler_dIntrinsics_dlistFamilyName)), (v_Vuna_dCompiler_dElab_dPrelude_dityToTerm dtb__6), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))
  | C_Vuna_dCompiler_dIntrinsics_dIType_Vuna_dCompiler_dIntrinsics_dIBool -> v_Vuna_dCompiler_dElab_dPrelude_dboolTy
  | C_Vuna_dCompiler_dIntrinsics_dIType_Vuna_dCompiler_dIntrinsics_dIStr -> v_Vuna_dCompiler_dElab_dPrelude_dstrTy
  | C_Vuna_dCompiler_dIntrinsics_dIType_Vuna_dCompiler_dIntrinsics_dIInt -> v_Vuna_dCompiler_dElab_dPrelude_dintTy
  | C_Vuna_dCompiler_dIntrinsics_dIType_Vuna_dCompiler_dIntrinsics_dITy -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dPrelude_dpreludeTypeGlobals = ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)))))) v_Vuna_dCompiler_dIntrinsics_dtypeIntrinsicNames)

let v_Vuna_dCompiler_dElab_dPrelude_dpreludeValueGlobals = ((v_Base_dList_dmap (fun i -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dIntrinsics_dintrinsicName i), (v_Vuna_dCompiler_dElab_dPrelude_dityToTerm (v_Vuna_dCompiler_dIntrinsics_dintrinsicSignature i)))))) v_Vuna_dCompiler_dIntrinsics_duserIntrinsics)

let v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals = ((v_Base_dList_dappend v_Vuna_dCompiler_dElab_dPrelude_dpreludeTypeGlobals) v_Vuna_dCompiler_dElab_dPrelude_dpreludeValueGlobals)

let v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames = ((v_Base_dList_dappend v_Vuna_dCompiler_dIntrinsics_dtypeIntrinsicNames) v_Vuna_dCompiler_dIntrinsics_dpreludeValueNames)

let v_Vuna_dCompiler_dElab_dPrelude_dbuiltinEqTyName = (fun v -> (match (v_Vuna_dCompiler_dElab_dPrelude_dbuiltinTyName v) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__7) -> (if ((bi_eq_str dtb__7) v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (v_Vuna_dCompiler_dIntrinsics_dintTypeName)) else (if ((bi_eq_str dtb__7) v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (v_Vuna_dCompiler_dIntrinsics_dstrTypeName)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dPrelude_dcmpBuiltinTyName = (fun v -> (match (v_Vuna_dCompiler_dElab_dPrelude_dbuiltinTyName v) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__8) -> (if ((bi_eq_str dtb__8) v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (v_Vuna_dCompiler_dIntrinsics_dintTypeName)) else (if ((bi_eq_str dtb__8) v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (v_Vuna_dCompiler_dIntrinsics_dstrTypeName)) else (if ((bi_eq_str dtb__8) v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (v_Vuna_dCompiler_dIntrinsics_dboolTypeName)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dPrelude_dprependParams = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__9, dtb__10) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__9, false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)), ((v_Vuna_dCompiler_dElab_dPrelude_dprependParams dtb__10) mc1)))
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dPrelude_dbaseNameOf = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__11, dtb__12) -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjectionGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__13, dtb__14) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dPrelude_dbaseNameOf (v_Base_dPair_dfirstOf dtb__13))) mc0) then (v_Base_dPair_dfirstOf dtb__13) else (((v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjectionGo mc0) dtb__14) mc2))
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection = (fun methods -> (fun short -> (((v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjectionGo short) methods) short)))
