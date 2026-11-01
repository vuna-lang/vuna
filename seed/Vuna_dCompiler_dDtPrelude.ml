open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dList
open Base_dIO
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
open Vuna_dCompiler_dTypecheck
open Vuna_dCompiler_dSplit
open Vuna_dCompiler_dTypedCodegen
open Vuna_dCompiler_dCore
let v_Vuna_dCompiler_dDtPrelude_dpreludeNames = ("Int") :: (("String") :: (("Bool") :: (("True") :: (("False") :: (("+") :: (("-") :: (("*") :: (("/") :: (("==") :: (("/=") :: (("<") :: (("<=") :: ((">") :: ((">=") :: (("++") :: (("strFromInt") :: (("strUnpack") :: (("strPack") :: (("strLength") :: (("&&") :: (("||") :: ([]))))))))))))))))))))))

let v_Vuna_dCompiler_dDtPrelude_dintTy = C_Vuna_dCompiler_dCore_dTGlobal ("Int")

let v_Vuna_dCompiler_dDtPrelude_dstrTy = C_Vuna_dCompiler_dCore_dTGlobal ("String")

let v_Vuna_dCompiler_dDtPrelude_dboolTy = C_Vuna_dCompiler_dCore_dTGlobal ("Bool")

let v_Vuna_dCompiler_dDtPrelude_dfun2 = fun a b c -> C_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig1, a, C_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig1, b, c))

let v_Vuna_dCompiler_dDtPrelude_deqOps = ("==") :: (("/=") :: ([]))

let v_Vuna_dCompiler_dDtPrelude_disEqOp = fun name -> v_Base_dList_dmemName name v_Vuna_dCompiler_dDtPrelude_deqOps

let v_Vuna_dCompiler_dDtPrelude_dbuiltinTyName = fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dVNeutral (n) -> (match n with
  | C_Vuna_dCompiler_dCore_dNGlobal (g, sp) -> if v_vuna_ueq_uBase_uList_uList sp [] then C_Base_dMaybe_dJust (g) else C_Base_dMaybe_dNothing
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtPrelude.vuna" 78 17 ("case pattern match failure"))
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtPrelude.vuna" 77 19 ("case pattern match failure"))

let v_Vuna_dCompiler_dDtPrelude_deqRuntimeName = fun op tyName -> (match tyName with
  | "Int" -> if v_vuna_ueq_ustr op "==" then C_Base_dResult_dOk ("bi_eq_int") else C_Base_dResult_dOk ("bi_neq_int")
  | "String" -> if v_vuna_ueq_ustr op "==" then C_Base_dResult_dOk ("bi_eq_str") else C_Base_dResult_dOk ("bi_neq_str")
  | _ -> C_Base_dResult_dErr ((let vuna_cat0' = ("DT: `") in (let vuna_cat1' = (op) in (let vuna_cat2' = ("` is only defined for Int and String (found ") in (let vuna_cat3' = (tyName) in (let vuna_cat4' = ("; M19)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtPrelude.vuna" 85 27 ("case pattern match failure"))

let v_Vuna_dCompiler_dDtPrelude_dpolyEqTy = fun () -> C_Vuna_dCompiler_dCore_dTPi ("a", true, C_Vuna_dCompiler_dCore_dRig0, C_Vuna_dCompiler_dCore_dTType (v_Vuna_dCompiler_dCore_dlevelZero), v_Vuna_dCompiler_dDtPrelude_dfun2 (C_Vuna_dCompiler_dCore_dTVar ("a", 0)) (C_Vuna_dCompiler_dCore_dTVar ("a", 0)) v_Vuna_dCompiler_dDtPrelude_dboolTy)

let v_Vuna_dCompiler_dDtPrelude_dstrFromIntTy = C_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig1, v_Vuna_dCompiler_dDtPrelude_dintTy, v_Vuna_dCompiler_dDtPrelude_dstrTy)

let v_Vuna_dCompiler_dDtPrelude_dstrUnpackTy = C_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig1, v_Vuna_dCompiler_dDtPrelude_dstrTy, C_Vuna_dCompiler_dCore_dTApp (C_Vuna_dCompiler_dCore_dTGlobal ("List"), v_Vuna_dCompiler_dDtPrelude_dintTy, C_Vuna_dCompiler_dCore_dRig1))

let v_Vuna_dCompiler_dDtPrelude_dstrPackTy = C_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig1, C_Vuna_dCompiler_dCore_dTApp (C_Vuna_dCompiler_dCore_dTGlobal ("List"), v_Vuna_dCompiler_dDtPrelude_dintTy, C_Vuna_dCompiler_dCore_dRig1), v_Vuna_dCompiler_dDtPrelude_dstrTy)

let v_Vuna_dCompiler_dDtPrelude_dstrLengthTy = C_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig1, v_Vuna_dCompiler_dDtPrelude_dstrTy, v_Vuna_dCompiler_dDtPrelude_dintTy)

let v_Vuna_dCompiler_dDtPrelude_dlistOfTy = fun t -> C_Vuna_dCompiler_dCore_dTApp (C_Vuna_dCompiler_dCore_dTGlobal ("Base.List.List"), t, C_Vuna_dCompiler_dCore_dRig1)

let v_Vuna_dCompiler_dDtPrelude_dprimReadFileTy = C_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig1, v_Vuna_dCompiler_dDtPrelude_dstrTy, v_Vuna_dCompiler_dDtPrelude_dstrTy)

let v_Vuna_dCompiler_dDtPrelude_dprimWriteFileTy = fun () -> v_Vuna_dCompiler_dDtPrelude_dfun2 v_Vuna_dCompiler_dDtPrelude_dstrTy v_Vuna_dCompiler_dDtPrelude_dstrTy v_Vuna_dCompiler_dDtPrelude_dintTy

let v_Vuna_dCompiler_dDtPrelude_dprimPrintTy = C_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig1, v_Vuna_dCompiler_dDtPrelude_dstrTy, v_Vuna_dCompiler_dDtPrelude_dintTy)

let v_Vuna_dCompiler_dDtPrelude_dprimGetArgsTy = fun () -> v_Vuna_dCompiler_dDtPrelude_dlistOfTy v_Vuna_dCompiler_dDtPrelude_dstrTy

let v_Vuna_dCompiler_dDtPrelude_dprimReadLineTy = v_Vuna_dCompiler_dDtPrelude_dstrTy

let v_Vuna_dCompiler_dDtPrelude_dprimReadDirTy = fun () -> C_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig1, v_Vuna_dCompiler_dDtPrelude_dstrTy, v_Vuna_dCompiler_dDtPrelude_dlistOfTy v_Vuna_dCompiler_dDtPrelude_dstrTy)

let v_Vuna_dCompiler_dDtPrelude_dprimIsDirectoryTy = C_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig1, v_Vuna_dCompiler_dDtPrelude_dstrTy, v_Vuna_dCompiler_dDtPrelude_dboolTy)

let v_Vuna_dCompiler_dDtPrelude_dprimMakeDirTy = C_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig1, v_Vuna_dCompiler_dDtPrelude_dstrTy, v_Vuna_dCompiler_dDtPrelude_dintTy)

let v_Vuna_dCompiler_dDtPrelude_dprimRemoveFileTy = C_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig1, v_Vuna_dCompiler_dDtPrelude_dstrTy, v_Vuna_dCompiler_dDtPrelude_dintTy)

let v_Vuna_dCompiler_dDtPrelude_dprimFileExistsTy = C_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig1, v_Vuna_dCompiler_dDtPrelude_dstrTy, v_Vuna_dCompiler_dDtPrelude_dboolTy)

let v_Vuna_dCompiler_dDtPrelude_dprimFileMtimeTy = C_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig1, v_Vuna_dCompiler_dDtPrelude_dstrTy, v_Vuna_dCompiler_dDtPrelude_dintTy)

let v_Vuna_dCompiler_dDtPrelude_dprimFileSizeTy = C_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig1, v_Vuna_dCompiler_dDtPrelude_dstrTy, v_Vuna_dCompiler_dDtPrelude_dintTy)

let v_Vuna_dCompiler_dDtPrelude_dprimExitTy = C_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig1, v_Vuna_dCompiler_dDtPrelude_dintTy, v_Vuna_dCompiler_dDtPrelude_dintTy)

let v_Vuna_dCompiler_dDtPrelude_dprimRunInTy = fun () -> v_Vuna_dCompiler_dDtPrelude_dfun2 v_Vuna_dCompiler_dDtPrelude_dstrTy (v_Vuna_dCompiler_dDtPrelude_dlistOfTy v_Vuna_dCompiler_dDtPrelude_dstrTy) v_Vuna_dCompiler_dDtPrelude_dintTy

let v_Vuna_dCompiler_dDtPrelude_dpreludeGlobals = fun () -> (C_Base_dPair_dPair ("Int", C_Vuna_dCompiler_dCore_dTType (v_Vuna_dCompiler_dCore_dlevelZero))) :: ((C_Base_dPair_dPair ("String", C_Vuna_dCompiler_dCore_dTType (v_Vuna_dCompiler_dCore_dlevelZero))) :: ((C_Base_dPair_dPair ("Bool", C_Vuna_dCompiler_dCore_dTType (v_Vuna_dCompiler_dCore_dlevelZero))) :: ((C_Base_dPair_dPair ("True", v_Vuna_dCompiler_dDtPrelude_dboolTy)) :: ((C_Base_dPair_dPair ("False", v_Vuna_dCompiler_dDtPrelude_dboolTy)) :: ((C_Base_dPair_dPair ("+", v_Vuna_dCompiler_dDtPrelude_dfun2 v_Vuna_dCompiler_dDtPrelude_dintTy v_Vuna_dCompiler_dDtPrelude_dintTy v_Vuna_dCompiler_dDtPrelude_dintTy)) :: ((C_Base_dPair_dPair ("-", v_Vuna_dCompiler_dDtPrelude_dfun2 v_Vuna_dCompiler_dDtPrelude_dintTy v_Vuna_dCompiler_dDtPrelude_dintTy v_Vuna_dCompiler_dDtPrelude_dintTy)) :: ((C_Base_dPair_dPair ("*", v_Vuna_dCompiler_dDtPrelude_dfun2 v_Vuna_dCompiler_dDtPrelude_dintTy v_Vuna_dCompiler_dDtPrelude_dintTy v_Vuna_dCompiler_dDtPrelude_dintTy)) :: ((C_Base_dPair_dPair ("/", v_Vuna_dCompiler_dDtPrelude_dfun2 v_Vuna_dCompiler_dDtPrelude_dintTy v_Vuna_dCompiler_dDtPrelude_dintTy v_Vuna_dCompiler_dDtPrelude_dintTy)) :: ((C_Base_dPair_dPair ("==", v_Vuna_dCompiler_dDtPrelude_dpolyEqTy ())) :: ((C_Base_dPair_dPair ("/=", v_Vuna_dCompiler_dDtPrelude_dpolyEqTy ())) :: ((C_Base_dPair_dPair ("<", v_Vuna_dCompiler_dDtPrelude_dfun2 v_Vuna_dCompiler_dDtPrelude_dintTy v_Vuna_dCompiler_dDtPrelude_dintTy v_Vuna_dCompiler_dDtPrelude_dboolTy)) :: ((C_Base_dPair_dPair ("<=", v_Vuna_dCompiler_dDtPrelude_dfun2 v_Vuna_dCompiler_dDtPrelude_dintTy v_Vuna_dCompiler_dDtPrelude_dintTy v_Vuna_dCompiler_dDtPrelude_dboolTy)) :: ((C_Base_dPair_dPair (">", v_Vuna_dCompiler_dDtPrelude_dfun2 v_Vuna_dCompiler_dDtPrelude_dintTy v_Vuna_dCompiler_dDtPrelude_dintTy v_Vuna_dCompiler_dDtPrelude_dboolTy)) :: ((C_Base_dPair_dPair (">=", v_Vuna_dCompiler_dDtPrelude_dfun2 v_Vuna_dCompiler_dDtPrelude_dintTy v_Vuna_dCompiler_dDtPrelude_dintTy v_Vuna_dCompiler_dDtPrelude_dboolTy)) :: ((C_Base_dPair_dPair ("++", v_Vuna_dCompiler_dDtPrelude_dfun2 v_Vuna_dCompiler_dDtPrelude_dstrTy v_Vuna_dCompiler_dDtPrelude_dstrTy v_Vuna_dCompiler_dDtPrelude_dstrTy)) :: ((C_Base_dPair_dPair ("&&", v_Vuna_dCompiler_dDtPrelude_dfun2 v_Vuna_dCompiler_dDtPrelude_dboolTy v_Vuna_dCompiler_dDtPrelude_dboolTy v_Vuna_dCompiler_dDtPrelude_dboolTy)) :: ((C_Base_dPair_dPair ("||", v_Vuna_dCompiler_dDtPrelude_dfun2 v_Vuna_dCompiler_dDtPrelude_dboolTy v_Vuna_dCompiler_dDtPrelude_dboolTy v_Vuna_dCompiler_dDtPrelude_dboolTy)) :: ((C_Base_dPair_dPair ("strFromInt", v_Vuna_dCompiler_dDtPrelude_dstrFromIntTy)) :: ((C_Base_dPair_dPair ("strUnpack", v_Vuna_dCompiler_dDtPrelude_dstrUnpackTy)) :: ((C_Base_dPair_dPair ("strPack", v_Vuna_dCompiler_dDtPrelude_dstrPackTy)) :: ((C_Base_dPair_dPair ("strLength", v_Vuna_dCompiler_dDtPrelude_dstrLengthTy)) :: ((C_Base_dPair_dPair ("prim_readFile", v_Vuna_dCompiler_dDtPrelude_dprimReadFileTy)) :: ((C_Base_dPair_dPair ("prim_writeFile", v_Vuna_dCompiler_dDtPrelude_dprimWriteFileTy ())) :: ((C_Base_dPair_dPair ("prim_print", v_Vuna_dCompiler_dDtPrelude_dprimPrintTy)) :: ((C_Base_dPair_dPair ("prim_getArgs", v_Vuna_dCompiler_dDtPrelude_dprimGetArgsTy ())) :: ((C_Base_dPair_dPair ("prim_readLine", v_Vuna_dCompiler_dDtPrelude_dprimReadLineTy)) :: ((C_Base_dPair_dPair ("prim_readDir", v_Vuna_dCompiler_dDtPrelude_dprimReadDirTy ())) :: ((C_Base_dPair_dPair ("prim_isDirectory", v_Vuna_dCompiler_dDtPrelude_dprimIsDirectoryTy)) :: ((C_Base_dPair_dPair ("prim_makeDir", v_Vuna_dCompiler_dDtPrelude_dprimMakeDirTy)) :: ((C_Base_dPair_dPair ("prim_removeFile", v_Vuna_dCompiler_dDtPrelude_dprimRemoveFileTy)) :: ((C_Base_dPair_dPair ("prim_fileExists", v_Vuna_dCompiler_dDtPrelude_dprimFileExistsTy)) :: ((C_Base_dPair_dPair ("prim_fileMtime", v_Vuna_dCompiler_dDtPrelude_dprimFileMtimeTy)) :: ((C_Base_dPair_dPair ("prim_fileSize", v_Vuna_dCompiler_dDtPrelude_dprimFileSizeTy)) :: ((C_Base_dPair_dPair ("prim_exit", v_Vuna_dCompiler_dDtPrelude_dprimExitTy)) :: ((C_Base_dPair_dPair ("prim_runIn", v_Vuna_dCompiler_dDtPrelude_dprimRunInTy ())) :: ([]))))))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dDtPrelude_dbuiltinEqTyName = fun v -> (match v_Vuna_dCompiler_dDtPrelude_dbuiltinTyName v with
  | C_Base_dMaybe_dJust ("Int") -> C_Base_dMaybe_dJust ("Int")
  | C_Base_dMaybe_dJust ("String") -> C_Base_dMaybe_dJust ("String")
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtPrelude.vuna" 184 21 ("case pattern match failure"))

let v_Vuna_dCompiler_dDtPrelude_dhashToUnderscore = fun c -> if v_vuna_ueq_uint c 35 then 95 else c

let v_Vuna_dCompiler_dDtPrelude_dinstanceDefName = fun mname derived fallback -> (match mname with
  | C_Base_dMaybe_dJust (n) -> if v_Base_dString_dstartsWith "#" n then (let vuna_cat0' = (derived) in (let vuna_cat1' = ("_") in (let vuna_cat2' = (bi_str_pack (v_Base_dList_dmap v_Vuna_dCompiler_dDtPrelude_dhashToUnderscore (bi_str_unpack n))) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) else n
  | C_Base_dMaybe_dNothing -> fallback
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtPrelude.vuna" 194 42 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dDtPrelude_dprependParams = fun a0 a1 -> match (a0, a1) with
  | ([], kindTerm) -> kindTerm
  | ((p) :: (rest), kindTerm) -> C_Vuna_dCompiler_dCore_dTPi (p, false, C_Vuna_dCompiler_dCore_dRig1, C_Vuna_dCompiler_dCore_dTType (v_Vuna_dCompiler_dCore_dlevelZero), v_Vuna_dCompiler_dDtPrelude_dprependParams rest kindTerm)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtPrelude.vuna" 206 1 ("no matching clause for Vuna.Compiler.DtPrelude.prependParams")
