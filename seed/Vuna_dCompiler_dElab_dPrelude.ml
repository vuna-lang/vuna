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
open Vuna_dCompiler_dCore_dTerm
open Vuna_dCompiler_dCore_dEval
open Vuna_dCompiler_dCore_dConv
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dElab_dTypes
let v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames = (C_Base_dList_dList_Cons ("Int", (C_Base_dList_dList_Cons ("String", (C_Base_dList_dList_Cons ("+", (C_Base_dList_dList_Cons ("-", (C_Base_dList_dList_Cons ("*", (C_Base_dList_dList_Cons ("/", (C_Base_dList_dList_Cons ("==", (C_Base_dList_dList_Cons ("/=", (C_Base_dList_dList_Cons ("<", (C_Base_dList_dList_Cons ("<=", (C_Base_dList_dList_Cons (">", (C_Base_dList_dList_Cons (">=", (C_Base_dList_dList_Cons ("++", (C_Base_dList_dList_Cons ("strFromInt", (C_Base_dList_dList_Cons ("strUnpack", (C_Base_dList_dList_Cons ("strPack", (C_Base_dList_dList_Cons ("strLength", (C_Base_dList_dList_Cons ("strConcatMany", (C_Base_dList_dList_Cons ("strSubstTemplate", (C_Base_dList_dList_Cons ("timeUs", (C_Base_dList_dList_Cons ("strHash", (C_Base_dList_dList_Cons ("strAt", (C_Base_dList_dList_Cons ("&&", (C_Base_dList_dList_Cons ("||", C_Base_dList_dList_Nil))))))))))))))))))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dElab_dPrelude_dintTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))

let v_Vuna_dCompiler_dElab_dPrelude_dstrTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("String"))

let v_Vuna_dCompiler_dElab_dPrelude_dboolTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Bool"))

let v_Vuna_dCompiler_dElab_dPrelude_dfun2 = (fun a -> (fun b -> (fun c -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, a, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) b), (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 2) c))))))))

let v_Vuna_dCompiler_dElab_dPrelude_deqOps = (C_Base_dList_dList_Cons ("==", (C_Base_dList_dList_Cons ("/=", C_Base_dList_dList_Nil))))

let v_Vuna_dCompiler_dElab_dPrelude_disEqOp = (fun name -> ((v_Base_dList_dmemName name) v_Vuna_dCompiler_dElab_dPrelude_deqOps))

let v_Vuna_dCompiler_dElab_dPrelude_dbuiltinTyName = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__0) -> (match dtb__0 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__1, dtb__2) -> (if ((bi_eq_generic dtb__2) C_Base_dList_dList_Nil) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dPrelude_deqRuntimeName = (fun op -> (fun tyName -> (if ((bi_eq_str tyName) "Int") then (if ((bi_eq_str op) "==") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_eq_int")) else (C_Base_dResult_dResult_Base_dResult_dOk ("bi_neq_int"))) else (if ((bi_eq_str tyName) "String") then (if ((bi_eq_str op) "==") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_eq_str")) else (C_Base_dResult_dResult_Base_dResult_dOk ("bi_neq_str"))) else (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dDiagnostics_dtcMsg (C_Vuna_dCompiler_dDiagnostics_dTcErr_Vuna_dCompiler_dDiagnostics_dOpOnlyIntString (op, tyName))) (C_Base_dVec_dVec_Base_dVec_dVCons (op, (C_Base_dVec_dVec_Base_dVec_dVCons (tyName, C_Base_dVec_dVec_Base_dVec_dVNil)))))))))))

let v_Vuna_dCompiler_dElab_dPrelude_dpolyEqTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("a", true, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)), (((v_Vuna_dCompiler_dElab_dPrelude_dfun2 (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar ("a", 0))) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar ("a", 0))) v_Vuna_dCompiler_dElab_dPrelude_dboolTy)))

let v_Vuna_dCompiler_dElab_dPrelude_dstrFromIntTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, v_Vuna_dCompiler_dElab_dPrelude_dintTy, v_Vuna_dCompiler_dElab_dPrelude_dstrTy))

let v_Vuna_dCompiler_dElab_dPrelude_dstrUnpackTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, v_Vuna_dCompiler_dElab_dPrelude_dstrTy, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("List")), v_Vuna_dCompiler_dElab_dPrelude_dintTy, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1))))

let v_Vuna_dCompiler_dElab_dPrelude_dstrPackTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("List")), v_Vuna_dCompiler_dElab_dPrelude_dintTy, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), v_Vuna_dCompiler_dElab_dPrelude_dstrTy))

let v_Vuna_dCompiler_dElab_dPrelude_dstrLengthTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, v_Vuna_dCompiler_dElab_dPrelude_dstrTy, v_Vuna_dCompiler_dElab_dPrelude_dintTy))

let v_Vuna_dCompiler_dElab_dPrelude_dlistOfTy = (fun t -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Base.List.List")), t, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)))

let v_Vuna_dCompiler_dElab_dPrelude_dstrConcatManyTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (v_Vuna_dCompiler_dElab_dPrelude_dlistOfTy v_Vuna_dCompiler_dElab_dPrelude_dstrTy), v_Vuna_dCompiler_dElab_dPrelude_dstrTy))

let v_Vuna_dCompiler_dElab_dPrelude_dstrSubstTemplateTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, v_Vuna_dCompiler_dElab_dPrelude_dstrTy, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (v_Vuna_dCompiler_dElab_dPrelude_dlistOfTy v_Vuna_dCompiler_dElab_dPrelude_dstrTy), v_Vuna_dCompiler_dElab_dPrelude_dstrTy))))

let v_Vuna_dCompiler_dElab_dPrelude_dprimReadFileTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, v_Vuna_dCompiler_dElab_dPrelude_dstrTy, v_Vuna_dCompiler_dElab_dPrelude_dstrTy))

let v_Vuna_dCompiler_dElab_dPrelude_dprimWriteFileTy = (((v_Vuna_dCompiler_dElab_dPrelude_dfun2 v_Vuna_dCompiler_dElab_dPrelude_dstrTy) v_Vuna_dCompiler_dElab_dPrelude_dstrTy) v_Vuna_dCompiler_dElab_dPrelude_dintTy)

let v_Vuna_dCompiler_dElab_dPrelude_dprimPrintTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, v_Vuna_dCompiler_dElab_dPrelude_dstrTy, v_Vuna_dCompiler_dElab_dPrelude_dintTy))

let v_Vuna_dCompiler_dElab_dPrelude_dprimGetArgsTy = (v_Vuna_dCompiler_dElab_dPrelude_dlistOfTy v_Vuna_dCompiler_dElab_dPrelude_dstrTy)

let v_Vuna_dCompiler_dElab_dPrelude_dprimReadLineTy = v_Vuna_dCompiler_dElab_dPrelude_dstrTy

let v_Vuna_dCompiler_dElab_dPrelude_dprimReadDirTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, v_Vuna_dCompiler_dElab_dPrelude_dstrTy, (v_Vuna_dCompiler_dElab_dPrelude_dlistOfTy v_Vuna_dCompiler_dElab_dPrelude_dstrTy)))

let v_Vuna_dCompiler_dElab_dPrelude_dprimIsDirectoryTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, v_Vuna_dCompiler_dElab_dPrelude_dstrTy, v_Vuna_dCompiler_dElab_dPrelude_dboolTy))

let v_Vuna_dCompiler_dElab_dPrelude_dprimMakeDirTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, v_Vuna_dCompiler_dElab_dPrelude_dstrTy, v_Vuna_dCompiler_dElab_dPrelude_dintTy))

let v_Vuna_dCompiler_dElab_dPrelude_dprimRemoveFileTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, v_Vuna_dCompiler_dElab_dPrelude_dstrTy, v_Vuna_dCompiler_dElab_dPrelude_dintTy))

let v_Vuna_dCompiler_dElab_dPrelude_dprimFileExistsTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, v_Vuna_dCompiler_dElab_dPrelude_dstrTy, v_Vuna_dCompiler_dElab_dPrelude_dboolTy))

let v_Vuna_dCompiler_dElab_dPrelude_dprimFileMtimeTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, v_Vuna_dCompiler_dElab_dPrelude_dstrTy, v_Vuna_dCompiler_dElab_dPrelude_dintTy))

let v_Vuna_dCompiler_dElab_dPrelude_dprimFileSizeTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, v_Vuna_dCompiler_dElab_dPrelude_dstrTy, v_Vuna_dCompiler_dElab_dPrelude_dintTy))

let v_Vuna_dCompiler_dElab_dPrelude_dprimExitTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, v_Vuna_dCompiler_dElab_dPrelude_dintTy, v_Vuna_dCompiler_dElab_dPrelude_dintTy))

let v_Vuna_dCompiler_dElab_dPrelude_dprimRunInTy = (((v_Vuna_dCompiler_dElab_dPrelude_dfun2 v_Vuna_dCompiler_dElab_dPrelude_dstrTy) (v_Vuna_dCompiler_dElab_dPrelude_dlistOfTy v_Vuna_dCompiler_dElab_dPrelude_dstrTy)) v_Vuna_dCompiler_dElab_dPrelude_dintTy)

let v_Vuna_dCompiler_dElab_dPrelude_dprimGetenvTy = (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, v_Vuna_dCompiler_dElab_dPrelude_dstrTy, v_Vuna_dCompiler_dElab_dPrelude_dstrTy))

let v_Vuna_dCompiler_dElab_dPrelude_dprimGetcwdTy = v_Vuna_dCompiler_dElab_dPrelude_dstrTy

let v_Vuna_dCompiler_dElab_dPrelude_dprimExecPathTy = v_Vuna_dCompiler_dElab_dPrelude_dstrTy

let v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals = (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("Int", (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("String", (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("Bool", (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("+", (((v_Vuna_dCompiler_dElab_dPrelude_dfun2 v_Vuna_dCompiler_dElab_dPrelude_dintTy) v_Vuna_dCompiler_dElab_dPrelude_dintTy) v_Vuna_dCompiler_dElab_dPrelude_dintTy))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("-", (((v_Vuna_dCompiler_dElab_dPrelude_dfun2 v_Vuna_dCompiler_dElab_dPrelude_dintTy) v_Vuna_dCompiler_dElab_dPrelude_dintTy) v_Vuna_dCompiler_dElab_dPrelude_dintTy))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("*", (((v_Vuna_dCompiler_dElab_dPrelude_dfun2 v_Vuna_dCompiler_dElab_dPrelude_dintTy) v_Vuna_dCompiler_dElab_dPrelude_dintTy) v_Vuna_dCompiler_dElab_dPrelude_dintTy))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("/", (((v_Vuna_dCompiler_dElab_dPrelude_dfun2 v_Vuna_dCompiler_dElab_dPrelude_dintTy) v_Vuna_dCompiler_dElab_dPrelude_dintTy) v_Vuna_dCompiler_dElab_dPrelude_dintTy))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("==", v_Vuna_dCompiler_dElab_dPrelude_dpolyEqTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("bi_eq_generic", v_Vuna_dCompiler_dElab_dPrelude_dpolyEqTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("bi_neq_generic", v_Vuna_dCompiler_dElab_dPrelude_dpolyEqTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("/=", v_Vuna_dCompiler_dElab_dPrelude_dpolyEqTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("<", (((v_Vuna_dCompiler_dElab_dPrelude_dfun2 v_Vuna_dCompiler_dElab_dPrelude_dintTy) v_Vuna_dCompiler_dElab_dPrelude_dintTy) v_Vuna_dCompiler_dElab_dPrelude_dboolTy))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("<=", (((v_Vuna_dCompiler_dElab_dPrelude_dfun2 v_Vuna_dCompiler_dElab_dPrelude_dintTy) v_Vuna_dCompiler_dElab_dPrelude_dintTy) v_Vuna_dCompiler_dElab_dPrelude_dboolTy))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (">", (((v_Vuna_dCompiler_dElab_dPrelude_dfun2 v_Vuna_dCompiler_dElab_dPrelude_dintTy) v_Vuna_dCompiler_dElab_dPrelude_dintTy) v_Vuna_dCompiler_dElab_dPrelude_dboolTy))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (">=", (((v_Vuna_dCompiler_dElab_dPrelude_dfun2 v_Vuna_dCompiler_dElab_dPrelude_dintTy) v_Vuna_dCompiler_dElab_dPrelude_dintTy) v_Vuna_dCompiler_dElab_dPrelude_dboolTy))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("++", (((v_Vuna_dCompiler_dElab_dPrelude_dfun2 v_Vuna_dCompiler_dElab_dPrelude_dstrTy) v_Vuna_dCompiler_dElab_dPrelude_dstrTy) v_Vuna_dCompiler_dElab_dPrelude_dstrTy))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("&&", (((v_Vuna_dCompiler_dElab_dPrelude_dfun2 v_Vuna_dCompiler_dElab_dPrelude_dboolTy) v_Vuna_dCompiler_dElab_dPrelude_dboolTy) v_Vuna_dCompiler_dElab_dPrelude_dboolTy))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("||", (((v_Vuna_dCompiler_dElab_dPrelude_dfun2 v_Vuna_dCompiler_dElab_dPrelude_dboolTy) v_Vuna_dCompiler_dElab_dPrelude_dboolTy) v_Vuna_dCompiler_dElab_dPrelude_dboolTy))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("strFromInt", v_Vuna_dCompiler_dElab_dPrelude_dstrFromIntTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("strUnpack", v_Vuna_dCompiler_dElab_dPrelude_dstrUnpackTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("strPack", v_Vuna_dCompiler_dElab_dPrelude_dstrPackTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("strLength", v_Vuna_dCompiler_dElab_dPrelude_dstrLengthTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("strConcatMany", v_Vuna_dCompiler_dElab_dPrelude_dstrConcatManyTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("strSubstTemplate", v_Vuna_dCompiler_dElab_dPrelude_dstrSubstTemplateTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("timeUs", v_Vuna_dCompiler_dElab_dPrelude_dintTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("strHash", (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, v_Vuna_dCompiler_dElab_dPrelude_dstrTy, v_Vuna_dCompiler_dElab_dPrelude_dintTy)))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("strAt", (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, v_Vuna_dCompiler_dElab_dPrelude_dstrTy, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, v_Vuna_dCompiler_dElab_dPrelude_dintTy, v_Vuna_dCompiler_dElab_dPrelude_dintTy)))))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("readFile", v_Vuna_dCompiler_dElab_dPrelude_dprimReadFileTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("writeFile", v_Vuna_dCompiler_dElab_dPrelude_dprimWriteFileTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("print", v_Vuna_dCompiler_dElab_dPrelude_dprimPrintTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("getArgs", v_Vuna_dCompiler_dElab_dPrelude_dprimGetArgsTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("readLine", v_Vuna_dCompiler_dElab_dPrelude_dprimReadLineTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("readDir", v_Vuna_dCompiler_dElab_dPrelude_dprimReadDirTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("isDirectory", v_Vuna_dCompiler_dElab_dPrelude_dprimIsDirectoryTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("makeDir", v_Vuna_dCompiler_dElab_dPrelude_dprimMakeDirTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("removeFile", v_Vuna_dCompiler_dElab_dPrelude_dprimRemoveFileTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("fileExists", v_Vuna_dCompiler_dElab_dPrelude_dprimFileExistsTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("fileMtime", v_Vuna_dCompiler_dElab_dPrelude_dprimFileMtimeTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("fileSize", v_Vuna_dCompiler_dElab_dPrelude_dprimFileSizeTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("exit", v_Vuna_dCompiler_dElab_dPrelude_dprimExitTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_readFile", v_Vuna_dCompiler_dElab_dPrelude_dprimReadFileTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_writeFile", v_Vuna_dCompiler_dElab_dPrelude_dprimWriteFileTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_print", v_Vuna_dCompiler_dElab_dPrelude_dprimPrintTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_getArgs", v_Vuna_dCompiler_dElab_dPrelude_dprimGetArgsTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_readLine", v_Vuna_dCompiler_dElab_dPrelude_dprimReadLineTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_readDir", v_Vuna_dCompiler_dElab_dPrelude_dprimReadDirTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_isDirectory", v_Vuna_dCompiler_dElab_dPrelude_dprimIsDirectoryTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_makeDir", v_Vuna_dCompiler_dElab_dPrelude_dprimMakeDirTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_removeFile", v_Vuna_dCompiler_dElab_dPrelude_dprimRemoveFileTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_fileExists", v_Vuna_dCompiler_dElab_dPrelude_dprimFileExistsTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_fileMtime", v_Vuna_dCompiler_dElab_dPrelude_dprimFileMtimeTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_fileSize", v_Vuna_dCompiler_dElab_dPrelude_dprimFileSizeTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_exit", v_Vuna_dCompiler_dElab_dPrelude_dprimExitTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_runIn", v_Vuna_dCompiler_dElab_dPrelude_dprimRunInTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_getenv", v_Vuna_dCompiler_dElab_dPrelude_dprimGetenvTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_getcwd", v_Vuna_dCompiler_dElab_dPrelude_dprimGetcwdTy)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_execPath", v_Vuna_dCompiler_dElab_dPrelude_dprimExecPathTy)), C_Base_dList_dList_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dElab_dPrelude_dbuiltinEqTyName = (fun v -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__3) -> (if ((bi_eq_str dtb__3) "Int") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("Int")) else (if ((bi_eq_str dtb__3) "String") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("String")) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) (v_Vuna_dCompiler_dElab_dPrelude_dbuiltinTyName v)))

let rec v_Vuna_dCompiler_dElab_dPrelude_dprependParams = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__4, false, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1, (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)), ((v_Vuna_dCompiler_dElab_dPrelude_dprependParams dtb__5) mc1)))
  | C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dPrelude_drewriteFamilyName = (fun old -> (fun newName -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__6) -> (if ((bi_eq_str dtb__6) old) then (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (newName)) else t)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__7, dtb__8, dtb__9, dtb__10, dtb__11) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__7, dtb__8, dtb__9, (((v_Vuna_dCompiler_dElab_dPrelude_drewriteFamilyName old) newName) dtb__10), (((v_Vuna_dCompiler_dElab_dPrelude_drewriteFamilyName old) newName) dtb__11)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__12, dtb__13, dtb__14) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__12, dtb__13, (((v_Vuna_dCompiler_dElab_dPrelude_drewriteFamilyName old) newName) dtb__14)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__15, dtb__16, dtb__17) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dElab_dPrelude_drewriteFamilyName old) newName) dtb__15), (((v_Vuna_dCompiler_dElab_dPrelude_drewriteFamilyName old) newName) dtb__16), dtb__17))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__18, dtb__19) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__18, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dPrelude_drewriteFamilyName old) newName) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__19)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__20, dtb__21) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dElab_dPrelude_drewriteFamilyName old) newName) dtb__20), ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dPrelude_drewriteAltFamily old) newName)) dtb__21)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__22, dtb__23, dtb__24) -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dElab_dPrelude_drewriteFamilyName old) newName) dtb__22), (((v_Vuna_dCompiler_dElab_dPrelude_drewriteFamilyName old) newName) dtb__23), (((v_Vuna_dCompiler_dElab_dPrelude_drewriteFamilyName old) newName) dtb__24)))
  | _ -> t
))))
and v_Vuna_dCompiler_dElab_dPrelude_drewriteAltFamily = (fun old -> (fun newName -> (fun alt -> (match alt with
  | C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__25, dtb__26, dtb__27) -> (C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__25, dtb__26, (((v_Vuna_dCompiler_dElab_dPrelude_drewriteFamilyName old) newName) dtb__27)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobalsFor = (fun listFam -> ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf p), (((v_Vuna_dCompiler_dElab_dPrelude_drewriteFamilyName "List") listFam) (v_Base_dPair_dsecondOf p)))))) v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals))

let v_Vuna_dCompiler_dElab_dPrelude_dbaseNameOf = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__28, dtb__29) -> dtb__29
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dPrelude_dpickListFamily = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__30, dtb__31) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dPrelude_dbaseNameOf dtb__30)) "List") then dtb__30 else (v_Vuna_dCompiler_dElab_dPrelude_dpickListFamily dtb__31))
  | C_Base_dList_dList_Nil -> "List"
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dPrelude_dcmpBuiltinTyName = (fun v -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__32) -> (if ((bi_eq_str dtb__32) "Int") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("Int")) else (if ((bi_eq_str dtb__32) "String") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("String")) else (if ((bi_eq_str dtb__32) "Bool") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("Bool")) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) (v_Vuna_dCompiler_dElab_dPrelude_dbuiltinTyName v)))

let rec v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjectionGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__33, dtb__34) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dPrelude_dbaseNameOf (v_Base_dPair_dfirstOf dtb__33))) mc0) then (v_Base_dPair_dfirstOf dtb__33) else (((v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjectionGo mc0) dtb__34) mc2))
  | C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection = (fun methods -> (fun short -> (((v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjectionGo short) methods) short)))
