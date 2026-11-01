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
let rec v_Vuna_dCompiler_dDtKind_dmaxIntList = fun a0 -> match a0 with
  | ([]) -> 0
  | ((x) :: (rest)) -> if v_vuna_uge_uint x (v_Vuna_dCompiler_dDtKind_dmaxIntList rest) then x else v_Vuna_dCompiler_dDtKind_dmaxIntList rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtKind.vuna" 26 1 ("no matching clause for Vuna.Compiler.DtKind.maxIntList")

let rec v_Vuna_dCompiler_dDtKind_dexprMaxAppArity = fun pname e -> (match e with
  | C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar (f, fsp), args, sp) -> if v_vuna_ueq_ustr f pname then v_Vuna_dCompiler_dDtKind_dmaxIntList ((v_Base_dList_dlength args) :: (v_Base_dList_dmap (v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname) args)) else v_Vuna_dCompiler_dDtKind_dmaxIntList (v_Base_dList_dmap (v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname) args)
  | C_Vuna_dCompiler_dAst_dEApp (fn, args, sp) -> v_Vuna_dCompiler_dDtKind_dmaxIntList ((v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname fn) :: (v_Base_dList_dmap (v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname) args))
  | C_Vuna_dCompiler_dAst_dELam (names, body, sp) -> v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname body
  | C_Vuna_dCompiler_dAst_dEPi (n, implicit, dom, cod, sp) -> v_Vuna_dCompiler_dDtKind_dmaxIntList ((v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname dom) :: ((v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname cod) :: ([])))
  | C_Vuna_dCompiler_dAst_dELet (binds, body, rec_u, sp) -> v_Vuna_dCompiler_dDtKind_dmaxIntList ((v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname body) :: (v_Base_dList_dmap (fun b -> v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname (v_Base_dPair_dsecondOf b)) binds))
  | C_Vuna_dCompiler_dAst_dECase (scrut, alts, sp) -> v_Vuna_dCompiler_dDtKind_dmaxIntList ((v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname scrut) :: (v_Base_dList_dmap (fun a -> v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname (v_Base_dPair_dsecondOf a)) alts))
  | C_Vuna_dCompiler_dAst_dEIf (c, t, f, sp) -> v_Vuna_dCompiler_dDtKind_dmaxIntList ((v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname c) :: ((v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname t) :: ((v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname f) :: ([]))))
  | C_Vuna_dCompiler_dAst_dEField (b, fname, sp) -> v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname b
  | C_Vuna_dCompiler_dAst_dERecord (rn, fields, sp) -> v_Vuna_dCompiler_dDtKind_dmaxIntList (v_Base_dList_dmap (fun p -> v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname (v_Base_dPair_dsecondOf p)) fields)
  | C_Vuna_dCompiler_dAst_dERecUpdate (b, fields, sp) -> v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname b
  | C_Vuna_dCompiler_dAst_dEInstSel (b, m, sp) -> v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname b
  | _ -> 0
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtKind.vuna" 30 27 ("case pattern match failure"))

let v_Vuna_dCompiler_dDtKind_dmethodMaxAppArity = fun pname methods -> v_Vuna_dCompiler_dDtKind_dmaxIntList (v_Base_dList_dmap (fun m -> v_Vuna_dCompiler_dDtKind_dexprMaxAppArity pname (v_Base_dPair_dsecondOf m)) methods)

let rec v_Vuna_dCompiler_dDtKind_darityFun = fun a0 a1 -> match (a0, a1) with
  | (n, res) -> if v_vuna_ule_uint n 0 then res else C_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig1, C_Vuna_dCompiler_dCore_dTType (v_Vuna_dCompiler_dCore_dlevelZero), v_Vuna_dCompiler_dDtKind_darityFun (bi_sub n 1) res)
  | (n, res) -> if v_vuna_ule_uint n 0 then res else C_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig1, C_Vuna_dCompiler_dCore_dTType (v_Vuna_dCompiler_dCore_dlevelZero), v_Vuna_dCompiler_dDtKind_darityFun (bi_sub n 1) res)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtKind.vuna" 19 1 ("no matching clause for Vuna.Compiler.DtKind.arityFun")

let v_Vuna_dCompiler_dDtKind_dclassParamKind = fun pname methods -> v_Vuna_dCompiler_dDtKind_darityFun (v_Vuna_dCompiler_dDtKind_dmethodMaxAppArity pname methods) (C_Vuna_dCompiler_dCore_dTType (v_Vuna_dCompiler_dCore_dlevelZero))

let rec v_Vuna_dCompiler_dDtKind_dmethodArgRigsOfGo = fun rigOf ty env -> (match ty with
  | C_Vuna_dCompiler_dCore_dTPi (name, implicit, rigB, dom, cod) -> (let domVal = v_Vuna_dCompiler_dCore_deval env dom in let v = C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNVar (name, v_Base_dList_dlength env, [])) in (rigOf implicit domVal) :: (v_Vuna_dCompiler_dDtKind_dmethodArgRigsOfGo rigOf cod ((v) :: (env))))
  | _ -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtKind.vuna" 59 34 ("case pattern match failure"))

let v_Vuna_dCompiler_dDtKind_dmethodArgRigsOf = fun rigOf ty -> v_Vuna_dCompiler_dDtKind_dmethodArgRigsOfGo rigOf ty []
