open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Base_dArray
open Base_dHashMap
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
open Vuna_dCompiler_dLoader_dFixity
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dIntrinsics
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Base_dIntMap
open Vuna_dCompiler_dCore_dTerm
open Vuna_dCompiler_dCore_dEval
open Vuna_dCompiler_dCore_dConv
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dElab_dTypes
let v_Vuna_dCompiler_dElab_dPrelude_dintTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (v_Vuna_dCompiler_dIntrinsics_dintTypeName))

let v_Vuna_dCompiler_dElab_dPrelude_dstrTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (v_Vuna_dCompiler_dIntrinsics_dstrTypeName))

let v_Vuna_dCompiler_dElab_dPrelude_dboolTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName))

let v_Vuna_dCompiler_dElab_dPrelude_dfun2 = (fun a b c -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, a, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) b), (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 2) c))))))

let v_Vuna_dCompiler_dElab_dPrelude_dbuiltinTyName = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__0) -> (match dtb__0 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__1, dtb__2) -> (if ((v_Base_dList_dlength dtb__2) = 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dPrelude_deqRuntimeName = (fun mc0 mc1 -> (if (mc1 = "Int") then (if (mc0 = "eq") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_eq_int")) else (C_Base_dResult_dResult_Base_dResult_dOk ("bi_neq_int"))) else (if (mc1 = "String") then (if (mc0 = "eq") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_eq_str")) else (C_Base_dResult_dResult_Base_dResult_dOk ("bi_neq_str"))) else (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dOpOnlyIntString (mc0, mc1))) (C_Base_dVec_dVec_Base_dVec_dVCons (mc0, (C_Base_dVec_dVec_Base_dVec_dVCons (mc1, C_Base_dVec_dVec_Base_dVec_dVNil))))))))))

let rec v_Vuna_dCompiler_dElab_dPrelude_dindexOfNameGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__3, dtb__4) -> (if (dtb__3 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc2)) else (((v_Vuna_dCompiler_dElab_dPrelude_dindexOfNameGo mc0) dtb__4) (mc2 + 1)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dPrelude_dindexOfName = (fun name env -> (((v_Vuna_dCompiler_dElab_dPrelude_dindexOfNameGo name) env) 0))

let rec v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dIntrinsics_dIType_Vuna_dCompiler_dIntrinsics_dIPi (dtb__5, dtb__6) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__5, true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)), ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv (C_Base_dList_dList_Base_dList_dCons (dtb__5, mc0))) dtb__6)))
  | C_Vuna_dCompiler_dIntrinsics_dIType_Vuna_dCompiler_dIntrinsics_dIBuf -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Buffer"))
  | C_Vuna_dCompiler_dIntrinsics_dIType_Vuna_dCompiler_dIntrinsics_dIMArray (dtb__7) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("MArray")), ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv mc0) dtb__7), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))
  | C_Vuna_dCompiler_dIntrinsics_dIType_Vuna_dCompiler_dIntrinsics_dIRef (dtb__8) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("IORef")), ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv mc0) dtb__8), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))
  | C_Vuna_dCompiler_dIntrinsics_dIType_Vuna_dCompiler_dIntrinsics_dIArray (dtb__9) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Array")), ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv mc0) dtb__9), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))
  | C_Vuna_dCompiler_dIntrinsics_dIType_Vuna_dCompiler_dIntrinsics_dIVar (dtb__10) -> (match ((v_Vuna_dCompiler_dElab_dPrelude_dindexOfName dtb__10) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__11) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__10, dtb__11))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__10))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dIntrinsics_dIType_Vuna_dCompiler_dIntrinsics_dIFun (dtb__12, dtb__13) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv mc0) dtb__12), ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv (C_Base_dList_dList_Base_dList_dCons ("_", mc0))) dtb__13)))
  | C_Vuna_dCompiler_dIntrinsics_dIType_Vuna_dCompiler_dIntrinsics_dIIO (dtb__14) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (v_Vuna_dCompiler_dIntrinsics_dioFamilyName)), ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv mc0) dtb__14), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))
  | C_Vuna_dCompiler_dIntrinsics_dIType_Vuna_dCompiler_dIntrinsics_dIList (dtb__15) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (v_Vuna_dCompiler_dIntrinsics_dlistFamilyName)), ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv mc0) dtb__15), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))
  | C_Vuna_dCompiler_dIntrinsics_dIType_Vuna_dCompiler_dIntrinsics_dIBool -> v_Vuna_dCompiler_dElab_dPrelude_dboolTy
  | C_Vuna_dCompiler_dIntrinsics_dIType_Vuna_dCompiler_dIntrinsics_dIStr -> v_Vuna_dCompiler_dElab_dPrelude_dstrTy
  | C_Vuna_dCompiler_dIntrinsics_dIType_Vuna_dCompiler_dIntrinsics_dIInt -> v_Vuna_dCompiler_dElab_dPrelude_dintTy
  | C_Vuna_dCompiler_dIntrinsics_dIType_Vuna_dCompiler_dIntrinsics_dITy -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dPrelude_dityToTerm = (fun ty -> ((v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv C_Base_dList_dList_Base_dList_dNil) ty))

let rec v_Vuna_dCompiler_dElab_dPrelude_dtypeCtorKindTerm = (fun arity -> (if (arity <= 0) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)) else (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)), (v_Vuna_dCompiler_dElab_dPrelude_dtypeCtorKindTerm (arity - 1))))))

let v_Vuna_dCompiler_dElab_dPrelude_dpreludeTypeGlobals = ((v_Base_dList_dappend ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)))))) v_Vuna_dCompiler_dIntrinsics_dtypeIntrinsicNames)) ((v_Base_dList_dmap (fun t -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dIntrinsics_dtypeIntrinsicCtorName t), (v_Vuna_dCompiler_dElab_dPrelude_dtypeCtorKindTerm (v_Vuna_dCompiler_dIntrinsics_dtypeIntrinsicCtorArity t)))))) v_Vuna_dCompiler_dIntrinsics_dtypeIntrinsicArities))

let v_Vuna_dCompiler_dElab_dPrelude_dpreludeValueGlobals = ((v_Base_dList_dmap (fun i -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dIntrinsics_dintrinsicName i), (v_Vuna_dCompiler_dElab_dPrelude_dityToTerm (v_Vuna_dCompiler_dIntrinsics_dintrinsicSignature i)))))) v_Vuna_dCompiler_dIntrinsics_duserIntrinsics)

let v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals = ((v_Base_dList_dappend v_Vuna_dCompiler_dElab_dPrelude_dpreludeTypeGlobals) v_Vuna_dCompiler_dElab_dPrelude_dpreludeValueGlobals)

let v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames = ((v_Base_dList_dappend v_Vuna_dCompiler_dIntrinsics_dpreludeTypeNames) v_Vuna_dCompiler_dIntrinsics_dpreludeValueNames)

let v_Vuna_dCompiler_dElab_dPrelude_dbuiltinEqTyName = (fun v -> (match (v_Vuna_dCompiler_dElab_dPrelude_dbuiltinTyName v) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__16) -> (if (dtb__16 = v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (v_Vuna_dCompiler_dIntrinsics_dintTypeName)) else (if (dtb__16 = v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (v_Vuna_dCompiler_dIntrinsics_dstrTypeName)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dPrelude_dcmpBuiltinTyName = (fun v -> (match (v_Vuna_dCompiler_dElab_dPrelude_dbuiltinTyName v) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__17) -> (if (dtb__17 = v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (v_Vuna_dCompiler_dIntrinsics_dintTypeName)) else (if (dtb__17 = v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (v_Vuna_dCompiler_dIntrinsics_dstrTypeName)) else (if (dtb__17 = v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (v_Vuna_dCompiler_dIntrinsics_dboolTypeName)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dPrelude_dprependParams = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__18, dtb__19) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__18, false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)), ((v_Vuna_dCompiler_dElab_dPrelude_dprependParams dtb__19) mc1)))
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dPrelude_dbaseNameOf = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__20, dtb__21) -> dtb__21
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjectionGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__22, dtb__23) -> (if ((v_Vuna_dCompiler_dElab_dPrelude_dbaseNameOf (v_Base_dPair_dfirstOf dtb__22)) = mc0) then (v_Base_dPair_dfirstOf dtb__22) else (((v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjectionGo mc0) dtb__23) mc2))
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection = (fun methods short -> (((v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjectionGo short) methods) short))
