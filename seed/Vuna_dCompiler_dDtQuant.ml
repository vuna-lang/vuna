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
open Vuna_dCompiler_dDtPrelude
open Vuna_dCompiler_dDtKind
let rec v_Vuna_dCompiler_dDtQuant_dkeepOut = fun a0 a1 -> match (a0, a1) with
  | (inScope, []) -> []
  | (inScope, (n) :: (rest)) -> if inScope n then v_Vuna_dCompiler_dDtQuant_dkeepOut inScope rest else (n) :: (v_Vuna_dCompiler_dDtQuant_dkeepOut inScope rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtQuant.vuna" 23 1 ("no matching clause for Vuna.Compiler.DtQuant.keepOut")

let rec v_Vuna_dCompiler_dDtQuant_dquantify = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], e, sp) -> e
  | ((n) :: (rest), e, sp) -> C_Vuna_dCompiler_dAst_dEPi (n, true, C_Vuna_dCompiler_dAst_dEVar ("Type", sp), v_Vuna_dCompiler_dDtQuant_dquantify rest e sp, sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtQuant.vuna" 27 1 ("no matching clause for Vuna.Compiler.DtQuant.quantify")

let rec v_Vuna_dCompiler_dDtQuant_dpiBoundNames = fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dEPi (n, implicit, dom, cod, sp) -> (n) :: (v_Vuna_dCompiler_dDtQuant_dpiBoundNames cod)
  | _ -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtQuant.vuna" 31 18 ("case pattern match failure"))

let v_Vuna_dCompiler_dDtQuant_disLowerIdent = fun n -> (match bi_str_unpack n with
  | [] -> false
  | (c) :: (rest) -> (if (v_vuna_uge_uint c 97) then (v_vuna_ule_uint c 122) else false)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtQuant.vuna" 56 18 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dDtQuant_dexprLowerVars = fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dEVar (n, sp) -> if v_Vuna_dCompiler_dDtQuant_disLowerIdent n then (n) :: ([]) else []
  | C_Vuna_dCompiler_dAst_dEApp (fn, args, sp) -> v_Base_dList_dappend (v_Vuna_dCompiler_dDtQuant_dexprLowerVars fn) (v_Base_dList_dconcatMap v_Vuna_dCompiler_dDtQuant_dexprLowerVars args)
  | C_Vuna_dCompiler_dAst_dELam (names, body, sp) -> v_Vuna_dCompiler_dDtQuant_dexprLowerVars body
  | C_Vuna_dCompiler_dAst_dEPi (n, implicit, dom, cod, sp) -> v_Base_dList_dappend (v_Vuna_dCompiler_dDtQuant_dexprLowerVars dom) (v_Vuna_dCompiler_dDtQuant_dexprLowerVars cod)
  | C_Vuna_dCompiler_dAst_dEIf (c, t, f, sp) -> v_Base_dList_dappend (v_Vuna_dCompiler_dDtQuant_dexprLowerVars c) (v_Base_dList_dappend (v_Vuna_dCompiler_dDtQuant_dexprLowerVars t) (v_Vuna_dCompiler_dDtQuant_dexprLowerVars f))
  | C_Vuna_dCompiler_dAst_dELet (binds, body, rec_u, sp) -> v_Base_dList_dappend (v_Base_dList_dconcatMap (fun b -> v_Vuna_dCompiler_dDtQuant_dexprLowerVars (v_Base_dPair_dsecondOf b)) binds) (v_Vuna_dCompiler_dDtQuant_dexprLowerVars body)
  | C_Vuna_dCompiler_dAst_dECase (scrut, alts, sp) -> v_Base_dList_dappend (v_Vuna_dCompiler_dDtQuant_dexprLowerVars scrut) (v_Base_dList_dconcatMap (fun a -> v_Vuna_dCompiler_dDtQuant_dexprLowerVars (v_Base_dPair_dsecondOf a)) alts)
  | C_Vuna_dCompiler_dAst_dEField (b, f, sp) -> v_Vuna_dCompiler_dDtQuant_dexprLowerVars b
  | C_Vuna_dCompiler_dAst_dERecord (rn, fields, sp) -> v_Base_dList_dconcatMap (fun p -> v_Vuna_dCompiler_dDtQuant_dexprLowerVars (v_Base_dPair_dsecondOf p)) fields
  | C_Vuna_dCompiler_dAst_dERecUpdate (b, fields, sp) -> v_Vuna_dCompiler_dDtQuant_dexprLowerVars b
  | C_Vuna_dCompiler_dAst_dEInstSel (b, m, sp) -> v_Vuna_dCompiler_dDtQuant_dexprLowerVars b
  | _ -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtQuant.vuna" 39 19 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dDtQuant_ddedupNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((x) :: (rest)) -> if v_Base_dList_dmemName x rest then v_Vuna_dCompiler_dDtQuant_ddedupNames rest else (x) :: (v_Vuna_dCompiler_dDtQuant_ddedupNames rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtQuant.vuna" 61 1 ("no matching clause for Vuna.Compiler.DtQuant.dedupNames")

let v_Vuna_dCompiler_dDtQuant_dlowerVarNames = fun e -> v_Vuna_dCompiler_dDtQuant_ddedupNames (v_Vuna_dCompiler_dDtQuant_dexprLowerVars e)

let rec v_Vuna_dCompiler_dDtQuant_ddropName = fun a0 a1 -> match (a0, a1) with
  | (b, []) -> []
  | (b, (n) :: (rest)) -> if v_vuna_ueq_ustr n b then v_Vuna_dCompiler_dDtQuant_ddropName b rest else (n) :: (v_Vuna_dCompiler_dDtQuant_ddropName b rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtQuant.vuna" 69 1 ("no matching clause for Vuna.Compiler.DtQuant.dropName")

let rec v_Vuna_dCompiler_dDtQuant_ddropPiBound = fun a0 a1 -> match (a0, a1) with
  | (names, []) -> names
  | (names, (b) :: (rest)) -> v_Vuna_dCompiler_dDtQuant_ddropPiBound (v_Vuna_dCompiler_dDtQuant_ddropName b names) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtQuant.vuna" 65 1 ("no matching clause for Vuna.Compiler.DtQuant.dropPiBound")

let v_Vuna_dCompiler_dDtQuant_dfreeNames = fun inScope ty -> v_Vuna_dCompiler_dDtQuant_dkeepOut inScope (v_Vuna_dCompiler_dDtQuant_ddropPiBound (v_Vuna_dCompiler_dDtQuant_dlowerVarNames ty) (v_Vuna_dCompiler_dDtQuant_dpiBoundNames ty))

let v_Vuna_dCompiler_dDtQuant_dquantifyTraitSig = fun inScope ty sp -> v_Vuna_dCompiler_dDtQuant_dquantify (v_Vuna_dCompiler_dDtQuant_dfreeNames inScope ty) ty sp

let rec v_Vuna_dCompiler_dDtQuant_dkeepOutList = fun a0 a1 -> match (a0, a1) with
  | (banned, []) -> []
  | (banned, (n) :: (rest)) -> if v_Base_dList_dmemName n banned then v_Vuna_dCompiler_dDtQuant_dkeepOutList banned rest else (n) :: (v_Vuna_dCompiler_dDtQuant_dkeepOutList banned rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtQuant.vuna" 79 1 ("no matching clause for Vuna.Compiler.DtQuant.keepOutList")

let v_Vuna_dCompiler_dDtQuant_dtopPreludeNames = ("Int") :: (("String") :: (("Bool") :: (("True") :: (("False") :: (("+") :: (("-") :: (("*") :: (("/") :: (("==") :: (("/=") :: (("<") :: (("<=") :: ((">") :: ((">=") :: (("++") :: (("&&") :: (("||") :: (("strFromInt") :: (("strUnpack") :: (("strPack") :: (("strLength") :: (("show") :: (("eq") :: (("neq") :: (("lt") :: (("le") :: (("gt") :: (("ge") :: (("Type") :: (("->") :: (("_") :: ([]))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dDtQuant_dquantifyTopSig = fun defined ty sp -> v_Vuna_dCompiler_dDtQuant_dquantify (v_Vuna_dCompiler_dDtQuant_dkeepOutList (v_Base_dList_dappend defined v_Vuna_dCompiler_dDtQuant_dtopPreludeNames) (v_Vuna_dCompiler_dDtQuant_dfreeNames (fun n -> false) ty)) ty sp

let rec v_Vuna_dCompiler_dDtQuant_ddefinedNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (match d with
  | C_Vuna_dCompiler_dAst_dDFun (n, pats, body, sp) -> (n) :: (v_Vuna_dCompiler_dDtQuant_ddefinedNames rest)
  | _ -> v_Vuna_dCompiler_dDtQuant_ddefinedNames rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtQuant.vuna" 122 28 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtQuant.vuna" 121 1 ("no matching clause for Vuna.Compiler.DtQuant.definedNames")
