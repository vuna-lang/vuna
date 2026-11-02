open Vuna_runtime
open Vuna_builtins
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dList
open Base_dResult
open Base_dString
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dToml
open Vuna_dCompiler_dManifest
open Vuna_dCompiler_dPkg
open Vuna_dCompiler_dAst
open Vuna_dCompiler_dLexer
open Vuna_dCompiler_dParser
open Vuna_dCompiler_dBuiltins
open Vuna_dCompiler_dLoader
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dDtMatch
open Vuna_dCompiler_dDtTerm
let v_Vuna_dCompiler_dDtPrelude_dpreludeNames = fun () -> (C_Base_dList_dList_Cons ("Int", (C_Base_dList_dList_Cons ("String", (C_Base_dList_dList_Cons ("+", (C_Base_dList_dList_Cons ("-", (C_Base_dList_dList_Cons ("*", (C_Base_dList_dList_Cons ("/", (C_Base_dList_dList_Cons ("==", (C_Base_dList_dList_Cons ("/=", (C_Base_dList_dList_Cons ("<", (C_Base_dList_dList_Cons ("<=", (C_Base_dList_dList_Cons (">", (C_Base_dList_dList_Cons (">=", (C_Base_dList_dList_Cons ("++", (C_Base_dList_dList_Cons ("strFromInt", (C_Base_dList_dList_Cons ("strUnpack", (C_Base_dList_dList_Cons ("strPack", (C_Base_dList_dList_Cons ("strLength", (C_Base_dList_dList_Cons ("&&", (C_Base_dList_dList_Cons ("||", C_Base_dList_dList_Nil))))))))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dDtPrelude_dintTy = fun () -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ("Int"))

let v_Vuna_dCompiler_dDtPrelude_dstrTy = fun () -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ("String"))

let v_Vuna_dCompiler_dDtPrelude_dboolTy = fun () -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ("Bool"))

let v_Vuna_dCompiler_dDtPrelude_dfun2 = (fun a -> (fun b -> (fun c -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1, a, (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1, (((v_Vuna_dCompiler_dCore_dshift 0) 1) b), (((v_Vuna_dCompiler_dCore_dshift 0) 2) c))))))))

let v_Vuna_dCompiler_dDtPrelude_deqOps = fun () -> (C_Base_dList_dList_Cons ("==", (C_Base_dList_dList_Cons ("/=", C_Base_dList_dList_Nil))))

let v_Vuna_dCompiler_dDtPrelude_disEqOp = (fun name -> ((v_Base_dList_dmemName name) (v_Vuna_dCompiler_dDtPrelude_deqOps ())))

let v_Vuna_dCompiler_dDtPrelude_dbuiltinTyName = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__0) -> (match dtb__0 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__1, dtb__2) -> (if ((bi_eq_generic dtb__2) C_Base_dList_dList_Nil) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dDtPrelude_deqRuntimeName = (fun op -> (fun tyName -> (if ((bi_eq_str tyName) "Int") then (if ((bi_eq_str op) "==") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_eq_int")) else (C_Base_dResult_dResult_Base_dResult_dOk ("bi_neq_int"))) else (if ((bi_eq_str tyName) "String") then (if ((bi_eq_str op) "==") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_eq_str")) else (C_Base_dResult_dResult_Base_dResult_dOk ("bi_neq_str"))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: `") ((bi_concat op) ((bi_concat "` is only defined for Int and String (found ") ((bi_concat tyName) "; M19)"))))))))))

let v_Vuna_dCompiler_dDtPrelude_dpolyEqTy = fun () -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi ("a", true, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0, (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType ((v_Vuna_dCompiler_dCore_dlevelZero ()))), (((v_Vuna_dCompiler_dDtPrelude_dfun2 (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar ("a", 0))) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar ("a", 0))) (v_Vuna_dCompiler_dDtPrelude_dboolTy ()))))

let v_Vuna_dCompiler_dDtPrelude_dstrFromIntTy = fun () -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1, (v_Vuna_dCompiler_dDtPrelude_dintTy ()), (v_Vuna_dCompiler_dDtPrelude_dstrTy ())))

let v_Vuna_dCompiler_dDtPrelude_dstrUnpackTy = fun () -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1, (v_Vuna_dCompiler_dDtPrelude_dstrTy ()), (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ("List")), (v_Vuna_dCompiler_dDtPrelude_dintTy ()), C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1))))

let v_Vuna_dCompiler_dDtPrelude_dstrPackTy = fun () -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1, (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ("List")), (v_Vuna_dCompiler_dDtPrelude_dintTy ()), C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), (v_Vuna_dCompiler_dDtPrelude_dstrTy ())))

let v_Vuna_dCompiler_dDtPrelude_dstrLengthTy = fun () -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1, (v_Vuna_dCompiler_dDtPrelude_dstrTy ()), (v_Vuna_dCompiler_dDtPrelude_dintTy ())))

let v_Vuna_dCompiler_dDtPrelude_dlistOfTy = (fun t -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ("Base.List.List")), t, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)))

let v_Vuna_dCompiler_dDtPrelude_dprimReadFileTy = fun () -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1, (v_Vuna_dCompiler_dDtPrelude_dstrTy ()), (v_Vuna_dCompiler_dDtPrelude_dstrTy ())))

let v_Vuna_dCompiler_dDtPrelude_dprimWriteFileTy = fun () -> (((v_Vuna_dCompiler_dDtPrelude_dfun2 (v_Vuna_dCompiler_dDtPrelude_dstrTy ())) (v_Vuna_dCompiler_dDtPrelude_dstrTy ())) (v_Vuna_dCompiler_dDtPrelude_dintTy ()))

let v_Vuna_dCompiler_dDtPrelude_dprimPrintTy = fun () -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1, (v_Vuna_dCompiler_dDtPrelude_dstrTy ()), (v_Vuna_dCompiler_dDtPrelude_dintTy ())))

let v_Vuna_dCompiler_dDtPrelude_dprimGetArgsTy = fun () -> (v_Vuna_dCompiler_dDtPrelude_dlistOfTy (v_Vuna_dCompiler_dDtPrelude_dstrTy ()))

let v_Vuna_dCompiler_dDtPrelude_dprimReadLineTy = fun () -> (v_Vuna_dCompiler_dDtPrelude_dstrTy ())

let v_Vuna_dCompiler_dDtPrelude_dprimReadDirTy = fun () -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1, (v_Vuna_dCompiler_dDtPrelude_dstrTy ()), (v_Vuna_dCompiler_dDtPrelude_dlistOfTy (v_Vuna_dCompiler_dDtPrelude_dstrTy ()))))

let v_Vuna_dCompiler_dDtPrelude_dprimIsDirectoryTy = fun () -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1, (v_Vuna_dCompiler_dDtPrelude_dstrTy ()), (v_Vuna_dCompiler_dDtPrelude_dboolTy ())))

let v_Vuna_dCompiler_dDtPrelude_dprimMakeDirTy = fun () -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1, (v_Vuna_dCompiler_dDtPrelude_dstrTy ()), (v_Vuna_dCompiler_dDtPrelude_dintTy ())))

let v_Vuna_dCompiler_dDtPrelude_dprimRemoveFileTy = fun () -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1, (v_Vuna_dCompiler_dDtPrelude_dstrTy ()), (v_Vuna_dCompiler_dDtPrelude_dintTy ())))

let v_Vuna_dCompiler_dDtPrelude_dprimFileExistsTy = fun () -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1, (v_Vuna_dCompiler_dDtPrelude_dstrTy ()), (v_Vuna_dCompiler_dDtPrelude_dboolTy ())))

let v_Vuna_dCompiler_dDtPrelude_dprimFileMtimeTy = fun () -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1, (v_Vuna_dCompiler_dDtPrelude_dstrTy ()), (v_Vuna_dCompiler_dDtPrelude_dintTy ())))

let v_Vuna_dCompiler_dDtPrelude_dprimFileSizeTy = fun () -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1, (v_Vuna_dCompiler_dDtPrelude_dstrTy ()), (v_Vuna_dCompiler_dDtPrelude_dintTy ())))

let v_Vuna_dCompiler_dDtPrelude_dprimExitTy = fun () -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1, (v_Vuna_dCompiler_dDtPrelude_dintTy ()), (v_Vuna_dCompiler_dDtPrelude_dintTy ())))

let v_Vuna_dCompiler_dDtPrelude_dprimRunInTy = fun () -> (((v_Vuna_dCompiler_dDtPrelude_dfun2 (v_Vuna_dCompiler_dDtPrelude_dstrTy ())) (v_Vuna_dCompiler_dDtPrelude_dlistOfTy (v_Vuna_dCompiler_dDtPrelude_dstrTy ()))) (v_Vuna_dCompiler_dDtPrelude_dintTy ()))

let v_Vuna_dCompiler_dDtPrelude_dpreludeGlobals = fun () -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("Int", (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType ((v_Vuna_dCompiler_dCore_dlevelZero ()))))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("String", (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType ((v_Vuna_dCompiler_dCore_dlevelZero ()))))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("Bool", (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType ((v_Vuna_dCompiler_dCore_dlevelZero ()))))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("+", (((v_Vuna_dCompiler_dDtPrelude_dfun2 (v_Vuna_dCompiler_dDtPrelude_dintTy ())) (v_Vuna_dCompiler_dDtPrelude_dintTy ())) (v_Vuna_dCompiler_dDtPrelude_dintTy ())))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("-", (((v_Vuna_dCompiler_dDtPrelude_dfun2 (v_Vuna_dCompiler_dDtPrelude_dintTy ())) (v_Vuna_dCompiler_dDtPrelude_dintTy ())) (v_Vuna_dCompiler_dDtPrelude_dintTy ())))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("*", (((v_Vuna_dCompiler_dDtPrelude_dfun2 (v_Vuna_dCompiler_dDtPrelude_dintTy ())) (v_Vuna_dCompiler_dDtPrelude_dintTy ())) (v_Vuna_dCompiler_dDtPrelude_dintTy ())))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("/", (((v_Vuna_dCompiler_dDtPrelude_dfun2 (v_Vuna_dCompiler_dDtPrelude_dintTy ())) (v_Vuna_dCompiler_dDtPrelude_dintTy ())) (v_Vuna_dCompiler_dDtPrelude_dintTy ())))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("==", (v_Vuna_dCompiler_dDtPrelude_dpolyEqTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("bi_eq_generic", (v_Vuna_dCompiler_dDtPrelude_dpolyEqTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("bi_neq_generic", (v_Vuna_dCompiler_dDtPrelude_dpolyEqTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("/=", (v_Vuna_dCompiler_dDtPrelude_dpolyEqTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("<", (((v_Vuna_dCompiler_dDtPrelude_dfun2 (v_Vuna_dCompiler_dDtPrelude_dintTy ())) (v_Vuna_dCompiler_dDtPrelude_dintTy ())) (v_Vuna_dCompiler_dDtPrelude_dboolTy ())))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("<=", (((v_Vuna_dCompiler_dDtPrelude_dfun2 (v_Vuna_dCompiler_dDtPrelude_dintTy ())) (v_Vuna_dCompiler_dDtPrelude_dintTy ())) (v_Vuna_dCompiler_dDtPrelude_dboolTy ())))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (">", (((v_Vuna_dCompiler_dDtPrelude_dfun2 (v_Vuna_dCompiler_dDtPrelude_dintTy ())) (v_Vuna_dCompiler_dDtPrelude_dintTy ())) (v_Vuna_dCompiler_dDtPrelude_dboolTy ())))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (">=", (((v_Vuna_dCompiler_dDtPrelude_dfun2 (v_Vuna_dCompiler_dDtPrelude_dintTy ())) (v_Vuna_dCompiler_dDtPrelude_dintTy ())) (v_Vuna_dCompiler_dDtPrelude_dboolTy ())))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("++", (((v_Vuna_dCompiler_dDtPrelude_dfun2 (v_Vuna_dCompiler_dDtPrelude_dstrTy ())) (v_Vuna_dCompiler_dDtPrelude_dstrTy ())) (v_Vuna_dCompiler_dDtPrelude_dstrTy ())))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("&&", (((v_Vuna_dCompiler_dDtPrelude_dfun2 (v_Vuna_dCompiler_dDtPrelude_dboolTy ())) (v_Vuna_dCompiler_dDtPrelude_dboolTy ())) (v_Vuna_dCompiler_dDtPrelude_dboolTy ())))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("||", (((v_Vuna_dCompiler_dDtPrelude_dfun2 (v_Vuna_dCompiler_dDtPrelude_dboolTy ())) (v_Vuna_dCompiler_dDtPrelude_dboolTy ())) (v_Vuna_dCompiler_dDtPrelude_dboolTy ())))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("strFromInt", (v_Vuna_dCompiler_dDtPrelude_dstrFromIntTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("strUnpack", (v_Vuna_dCompiler_dDtPrelude_dstrUnpackTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("strPack", (v_Vuna_dCompiler_dDtPrelude_dstrPackTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("strLength", (v_Vuna_dCompiler_dDtPrelude_dstrLengthTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("readFile", (v_Vuna_dCompiler_dDtPrelude_dprimReadFileTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("writeFile", (v_Vuna_dCompiler_dDtPrelude_dprimWriteFileTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("print", (v_Vuna_dCompiler_dDtPrelude_dprimPrintTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("getArgs", (v_Vuna_dCompiler_dDtPrelude_dprimGetArgsTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("readLine", (v_Vuna_dCompiler_dDtPrelude_dprimReadLineTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("readDir", (v_Vuna_dCompiler_dDtPrelude_dprimReadDirTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("isDirectory", (v_Vuna_dCompiler_dDtPrelude_dprimIsDirectoryTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("makeDir", (v_Vuna_dCompiler_dDtPrelude_dprimMakeDirTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("removeFile", (v_Vuna_dCompiler_dDtPrelude_dprimRemoveFileTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("fileExists", (v_Vuna_dCompiler_dDtPrelude_dprimFileExistsTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("fileMtime", (v_Vuna_dCompiler_dDtPrelude_dprimFileMtimeTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("fileSize", (v_Vuna_dCompiler_dDtPrelude_dprimFileSizeTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("exit", (v_Vuna_dCompiler_dDtPrelude_dprimExitTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_readFile", (v_Vuna_dCompiler_dDtPrelude_dprimReadFileTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_writeFile", (v_Vuna_dCompiler_dDtPrelude_dprimWriteFileTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_print", (v_Vuna_dCompiler_dDtPrelude_dprimPrintTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_getArgs", (v_Vuna_dCompiler_dDtPrelude_dprimGetArgsTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_readLine", (v_Vuna_dCompiler_dDtPrelude_dprimReadLineTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_readDir", (v_Vuna_dCompiler_dDtPrelude_dprimReadDirTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_isDirectory", (v_Vuna_dCompiler_dDtPrelude_dprimIsDirectoryTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_makeDir", (v_Vuna_dCompiler_dDtPrelude_dprimMakeDirTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_removeFile", (v_Vuna_dCompiler_dDtPrelude_dprimRemoveFileTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_fileExists", (v_Vuna_dCompiler_dDtPrelude_dprimFileExistsTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_fileMtime", (v_Vuna_dCompiler_dDtPrelude_dprimFileMtimeTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_fileSize", (v_Vuna_dCompiler_dDtPrelude_dprimFileSizeTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_exit", (v_Vuna_dCompiler_dDtPrelude_dprimExitTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("prim_runIn", (v_Vuna_dCompiler_dDtPrelude_dprimRunInTy ()))), C_Base_dList_dList_Nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dDtPrelude_dbuiltinEqTyName = (fun v -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__3) -> (if ((bi_eq_str dtb__3) "Int") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("Int")) else (if ((bi_eq_str dtb__3) "String") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("String")) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) (v_Vuna_dCompiler_dDtPrelude_dbuiltinTyName v)))

let rec v_Vuna_dCompiler_dDtPrelude_dprependParams = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__4, false, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1, (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType ((v_Vuna_dCompiler_dCore_dlevelZero ()))), ((v_Vuna_dCompiler_dDtPrelude_dprependParams dtb__5) mc1)))
  | C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dDtPrelude_drewriteFamilyName = (fun old -> (fun newName -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__6) -> (if ((bi_eq_str dtb__6) old) then (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (newName)) else t)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__7, dtb__8, dtb__9, dtb__10, dtb__11) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__7, dtb__8, dtb__9, (((v_Vuna_dCompiler_dDtPrelude_drewriteFamilyName old) newName) dtb__10), (((v_Vuna_dCompiler_dDtPrelude_drewriteFamilyName old) newName) dtb__11)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__12, dtb__13, dtb__14) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__12, dtb__13, (((v_Vuna_dCompiler_dDtPrelude_drewriteFamilyName old) newName) dtb__14)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__15, dtb__16, dtb__17) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((((v_Vuna_dCompiler_dDtPrelude_drewriteFamilyName old) newName) dtb__15), (((v_Vuna_dCompiler_dDtPrelude_drewriteFamilyName old) newName) dtb__16), dtb__17))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__18, dtb__19) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__18, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dDtPrelude_drewriteFamilyName old) newName) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__19)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__20, dtb__21) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase ((((v_Vuna_dCompiler_dDtPrelude_drewriteFamilyName old) newName) dtb__20), ((v_Base_dList_dmap ((v_Vuna_dCompiler_dDtPrelude_drewriteAltFamily old) newName)) dtb__21)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__22, dtb__23, dtb__24) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf ((((v_Vuna_dCompiler_dDtPrelude_drewriteFamilyName old) newName) dtb__22), (((v_Vuna_dCompiler_dDtPrelude_drewriteFamilyName old) newName) dtb__23), (((v_Vuna_dCompiler_dDtPrelude_drewriteFamilyName old) newName) dtb__24)))
  | _ -> t
))))
and v_Vuna_dCompiler_dDtPrelude_drewriteAltFamily = (fun old -> (fun newName -> (fun alt -> (match alt with
  | C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (dtb__25, dtb__26, dtb__27) -> (C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (dtb__25, dtb__26, (((v_Vuna_dCompiler_dDtPrelude_drewriteFamilyName old) newName) dtb__27)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDtPrelude_dpreludeGlobalsFor = (fun listFam -> ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf p), (((v_Vuna_dCompiler_dDtPrelude_drewriteFamilyName "List") listFam) (v_Base_dPair_dsecondOf p)))))) (v_Vuna_dCompiler_dDtPrelude_dpreludeGlobals ())))

let v_Vuna_dCompiler_dDtPrelude_dbaseNameOf = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__28, dtb__29) -> dtb__29
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDtPrelude_dpickListFamily = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__30, dtb__31) -> (if ((bi_eq_str (v_Vuna_dCompiler_dDtPrelude_dbaseNameOf dtb__30)) "List") then dtb__30 else (v_Vuna_dCompiler_dDtPrelude_dpickListFamily dtb__31))
  | C_Base_dList_dList_Nil -> "List"
  | _ -> failwith "DT: impossible branch"
))
