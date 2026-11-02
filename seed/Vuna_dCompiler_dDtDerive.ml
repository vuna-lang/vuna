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
open Vuna_dCompiler_dDtPrelude
open Vuna_dCompiler_dDtKind
open Vuna_dCompiler_dDtQuant
let v_Vuna_dCompiler_dDtDerive_dnoSpan = fun () -> (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))

let v_Vuna_dCompiler_dDtDerive_dfn1 = (fun a -> (fun b -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi ("_", false, a, b, (v_Vuna_dCompiler_dDtDerive_dnoSpan ())))))

let v_Vuna_dCompiler_dDtDerive_dshowTrait = fun () -> (C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDTrait ("Show", (C_Base_dList_dList_Cons ("a", C_Base_dList_dList_Nil)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("show", ((v_Vuna_dCompiler_dDtDerive_dfn1 (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("a", (v_Vuna_dCompiler_dDtDerive_dnoSpan ())))) (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("String", (v_Vuna_dCompiler_dDtDerive_dnoSpan ())))))), C_Base_dList_dList_Nil)), (v_Vuna_dCompiler_dDtDerive_dnoSpan ())))

let v_Vuna_dCompiler_dDtDerive_dcmpTy = fun () -> ((v_Vuna_dCompiler_dDtDerive_dfn1 (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("a", (v_Vuna_dCompiler_dDtDerive_dnoSpan ())))) ((v_Vuna_dCompiler_dDtDerive_dfn1 (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("a", (v_Vuna_dCompiler_dDtDerive_dnoSpan ())))) (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("Bool", (v_Vuna_dCompiler_dDtDerive_dnoSpan ())))))

let v_Vuna_dCompiler_dDtDerive_deqTrait = fun () -> (C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDTrait ("Eq", (C_Base_dList_dList_Cons ("a", C_Base_dList_dList_Nil)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("eq", (v_Vuna_dCompiler_dDtDerive_dcmpTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("neq", (v_Vuna_dCompiler_dDtDerive_dcmpTy ()))), C_Base_dList_dList_Nil)))), (v_Vuna_dCompiler_dDtDerive_dnoSpan ())))

let v_Vuna_dCompiler_dDtDerive_dordTrait = fun () -> (C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDTrait ("Ord", (C_Base_dList_dList_Cons ("a", C_Base_dList_dList_Nil)), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("lt", (v_Vuna_dCompiler_dDtDerive_dcmpTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("le", (v_Vuna_dCompiler_dDtDerive_dcmpTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("gt", (v_Vuna_dCompiler_dDtDerive_dcmpTy ()))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("ge", (v_Vuna_dCompiler_dDtDerive_dcmpTy ()))), C_Base_dList_dList_Nil)))))))), (v_Vuna_dCompiler_dDtDerive_dnoSpan ())))

let v_Vuna_dCompiler_dDtDerive_dbuiltinTraitDecls = fun () -> (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDtDerive_dshowTrait ()), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDtDerive_deqTrait ()), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDtDerive_dordTrait ()), C_Base_dList_dList_Nil))))))

let v_Vuna_dCompiler_dDtDerive_dboolTrue = (fun sp -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("==", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (1, sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (1, sp)), C_Base_dList_dList_Nil)))), sp)))

let v_Vuna_dCompiler_dDtDerive_dboolFalse = (fun sp -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("==", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (0, sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (1, sp)), C_Base_dList_dList_Nil)))), sp)))

let v_Vuna_dCompiler_dDtDerive_dhead = (fun tn -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("Show", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (tn, (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), C_Base_dList_dList_Nil)), (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))))

let v_Vuna_dCompiler_dDtDerive_dshowIntInstance = fun () -> (C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, false, (v_Vuna_dCompiler_dDtDerive_dhead "Int"), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun ("show", (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sx", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), C_Base_dList_dList_Nil)), (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("strFromInt", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sx", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), C_Base_dList_dList_Nil)), (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), C_Base_dList_dList_Nil)), (v_Vuna_dCompiler_dDtDerive_dnoSpan ())))

let v_Vuna_dCompiler_dDtDerive_dshowStringInstance = fun () -> (C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, false, (v_Vuna_dCompiler_dDtDerive_dhead "String"), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun ("show", (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sx", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), C_Base_dList_dList_Nil)), (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("++", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr ("\"", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("++", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sx", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr ("\"", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), C_Base_dList_dList_Nil)))), (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), C_Base_dList_dList_Nil)))), (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), C_Base_dList_dList_Nil)), (v_Vuna_dCompiler_dDtDerive_dnoSpan ())))

let v_Vuna_dCompiler_dDtDerive_dshowBoolInstance = fun () -> (C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, false, (v_Vuna_dCompiler_dDtDerive_dhead "Bool"), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun ("show", (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sx", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), C_Base_dList_dList_Nil)), (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEIf ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sx", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr ("True", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr ("False", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), C_Base_dList_dList_Nil)), (v_Vuna_dCompiler_dDtDerive_dnoSpan ())))

let v_Vuna_dCompiler_dDtDerive_dbuiltinShowInstances = fun () -> (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDtDerive_dshowIntInstance ()), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDtDerive_dshowStringInstance ()), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDtDerive_dshowBoolInstance ()), C_Base_dList_dList_Nil))))))

let v_Vuna_dCompiler_dDtDerive_deqHead = (fun tn -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("Eq", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (tn, (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), C_Base_dList_dList_Nil)), (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))))

let v_Vuna_dCompiler_dDtDerive_deqIntInstance = fun () -> (C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, false, (v_Vuna_dCompiler_dDtDerive_deqHead "Int"), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun ("eq", (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("x", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("y", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), C_Base_dList_dList_Nil)))), (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("==", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("x", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("y", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), C_Base_dList_dList_Nil)))), (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun ("neq", (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("x", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("y", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), C_Base_dList_dList_Nil)))), (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("/=", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("x", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("y", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), C_Base_dList_dList_Nil)))), (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), C_Base_dList_dList_Nil)))), (v_Vuna_dCompiler_dDtDerive_dnoSpan ())))

let v_Vuna_dCompiler_dDtDerive_deqStringInstance = fun () -> (C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, false, (v_Vuna_dCompiler_dDtDerive_deqHead "String"), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun ("eq", (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("x", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("y", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), C_Base_dList_dList_Nil)))), (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("==", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("x", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("y", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), C_Base_dList_dList_Nil)))), (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun ("neq", (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("x", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("y", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), C_Base_dList_dList_Nil)))), (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("/=", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("x", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("y", (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), C_Base_dList_dList_Nil)))), (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))), C_Base_dList_dList_Nil)))), (v_Vuna_dCompiler_dDtDerive_dnoSpan ())))

let v_Vuna_dCompiler_dDtDerive_dbuiltinEqInstances = fun () -> (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDtDerive_deqIntInstance ()), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDtDerive_deqStringInstance ()), C_Base_dList_dList_Nil))))

let v_Vuna_dCompiler_dDtDerive_dinstHead = (fun tn -> (fun dname -> (fun params -> (fun sp -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (tn, sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dname, sp)), ((v_Base_dList_dmap (fun p -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (p, sp)))) params))), sp))))))

let v_Vuna_dCompiler_dDtDerive_dshowOne = (fun v -> (fun sp -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("show", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (v, sp)), C_Base_dList_dList_Nil)), sp))))

let rec v_Vuna_dCompiler_dDtDerive_dshowFields = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (match dtb__1 with
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("++", mc1)), (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dDtDerive_dshowOne dtb__0) mc1), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (")", mc1)), C_Base_dList_dList_Nil)))), mc1))
  | _ -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("++", mc1)), (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dDtDerive_dshowOne dtb__0) mc1), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("++", mc1)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (" ", mc1)), (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dDtDerive_dshowFields dtb__1) mc1), C_Base_dList_dList_Nil)))), mc1)), C_Base_dList_dList_Nil)))), mc1))
)
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (")", mc1))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDtDerive_dshowCtor = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (mc0, mc2))
  | _ -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("++", mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (((bi_concat "(") ((bi_concat mc0) " ")), mc2)), (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dDtDerive_dshowFields mc1) mc2), C_Base_dList_dList_Nil)))), mc2))
))))

let rec v_Vuna_dCompiler_dDtDerive_dconjFields = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__2, dtb__3) -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (match dtb__3 with
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("==", mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__2, mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__4, mc2)), C_Base_dList_dList_Nil)))), mc2))
  | _ -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("&&", mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("==", mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__2, mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__4, mc2)), C_Base_dList_dList_Nil)))), mc2)), (C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dDtDerive_dconjFields dtb__3) dtb__5) mc2), C_Base_dList_dList_Nil)))), mc2))
)
  | _ -> (v_Vuna_dCompiler_dDtDerive_dboolFalse mc2)
)
  | C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dDtDerive_dboolTrue mc2)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDtDerive_dneqBody = (fun sp -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEIf ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("eq", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sx", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sy", sp)), C_Base_dList_dList_Nil)))), sp)), (v_Vuna_dCompiler_dDtDerive_dboolFalse sp), (v_Vuna_dCompiler_dDtDerive_dboolTrue sp), sp)))

let rec v_Vuna_dCompiler_dDtDerive_dltFields = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__6, dtb__7) -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (match dtb__7 with
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("<", mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__6, mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__8, mc2)), C_Base_dList_dList_Nil)))), mc2))
  | _ -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("||", mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("<", mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__6, mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__8, mc2)), C_Base_dList_dList_Nil)))), mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("&&", mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("==", mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__6, mc2)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__8, mc2)), C_Base_dList_dList_Nil)))), mc2)), (C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dDtDerive_dltFields dtb__7) dtb__9) mc2), C_Base_dList_dList_Nil)))), mc2)), C_Base_dList_dList_Nil)))), mc2))
)
  | _ -> (v_Vuna_dCompiler_dDtDerive_dboolFalse mc2)
)
  | C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dDtDerive_dboolFalse mc2)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDtDerive_dleBody = (fun ctors -> (fun sp -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("||", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("lt", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sx", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sy", sp)), C_Base_dList_dList_Nil)))), sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEIf ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("lt", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sy", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sx", sp)), C_Base_dList_dList_Nil)))), sp)), (v_Vuna_dCompiler_dDtDerive_dboolFalse sp), (v_Vuna_dCompiler_dDtDerive_dboolTrue sp), sp)), C_Base_dList_dList_Nil)))), sp))))

let rec v_Vuna_dCompiler_dDtDerive_dvarNamesAt = (fun prefix -> (fun i -> (fun n -> (if ((bi_ge_int i) n) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons (((bi_concat prefix) (bi_strFromInt i)), (((v_Vuna_dCompiler_dDtDerive_dvarNamesAt prefix) ((bi_add i) 1)) n)))))))

let v_Vuna_dCompiler_dDtDerive_dvarNames = (fun prefix -> (fun n -> (((v_Vuna_dCompiler_dDtDerive_dvarNamesAt prefix) 0) n)))

let rec v_Vuna_dCompiler_dDtDerive_dshowAlts = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (match dtb__10 with
  | C_Vuna_dCompiler_dAst_dCtor_Vuna_dCompiler_dAst_dCtor (dtb__12, dtb__13, dtb__14, dtb__15) -> ((fun vs -> ((fun pat -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (pat, (((v_Vuna_dCompiler_dDtDerive_dshowCtor dtb__12) vs) mc1))), ((v_Vuna_dCompiler_dDtDerive_dshowAlts dtb__11) mc1)))) (C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__12, ((v_Base_dList_dmap (fun v -> (C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (v, mc1)))) vs), mc1)))) ((v_Vuna_dCompiler_dDtDerive_dvarNames "fa") dtb__14))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDtDerive_dshowBody = (fun ctors -> (fun scrut -> (fun sp -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (scrut, sp)), ((v_Vuna_dCompiler_dDtDerive_dshowAlts ctors) sp), sp)))))

let v_Vuna_dCompiler_dDtDerive_deqInner = (fun cn -> (fun ar -> (fun sp -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (cn, ((v_Base_dList_dmap (fun v -> (C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (v, sp)))) ((v_Vuna_dCompiler_dDtDerive_dvarNames "fb") ar)), sp)), (((v_Vuna_dCompiler_dDtDerive_dconjFields ((v_Vuna_dCompiler_dDtDerive_dvarNames "fa") ar)) ((v_Vuna_dCompiler_dDtDerive_dvarNames "fb") ar)) sp))), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (sp)), (v_Vuna_dCompiler_dDtDerive_dboolFalse sp))), C_Base_dList_dList_Nil)))))))

let v_Vuna_dCompiler_dDtDerive_deqAlt = (fun c -> (fun sp -> (match c with
  | C_Vuna_dCompiler_dAst_dCtor_Vuna_dCompiler_dAst_dCtor (dtb__16, dtb__17, dtb__18, dtb__19) -> ((fun vs -> ((fun pat -> ((fun body -> (C_Base_dPair_dPair_Base_dPair_dPair (pat, body))) (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sy", sp)), (((v_Vuna_dCompiler_dDtDerive_deqInner dtb__16) dtb__18) sp), sp)))) (C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__16, ((v_Base_dList_dmap (fun v -> (C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (v, sp)))) vs), sp)))) ((v_Vuna_dCompiler_dDtDerive_dvarNames "fa") dtb__18))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDtDerive_deqBody = (fun ctors -> (fun sp -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sx", sp)), ((v_Base_dList_dmap (fun c -> ((v_Vuna_dCompiler_dDtDerive_deqAlt c) sp))) ctors), sp))))

let rec v_Vuna_dCompiler_dDtDerive_dordInnerGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__20, dtb__21) -> (match dtb__20 with
  | C_Vuna_dCompiler_dAst_dCtor_Vuna_dCompiler_dAst_dCtor (dtb__22, dtb__23, dtb__24, dtb__25) -> ((fun gs -> ((fun pat -> ((fun body -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (pat, body)), (((((v_Vuna_dCompiler_dDtDerive_dordInnerGo mc0) mc1) dtb__21) ((bi_add mc3) 1)) mc4)))) (if ((bi_eq_int mc3) mc0) then (((v_Vuna_dCompiler_dDtDerive_dltFields ((v_Vuna_dCompiler_dDtDerive_dvarNames "fa") mc1)) gs) mc4) else (if ((bi_lt_int mc3) mc0) then (v_Vuna_dCompiler_dDtDerive_dboolFalse mc4) else (v_Vuna_dCompiler_dDtDerive_dboolTrue mc4))))) (C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__22, ((v_Base_dList_dmap (fun v -> (C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (v, mc4)))) gs), mc4)))) ((v_Vuna_dCompiler_dDtDerive_dvarNames "fb") dtb__24))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dDtDerive_dordInner = (fun i -> (fun ar -> (fun all -> (fun sp -> (((((v_Vuna_dCompiler_dDtDerive_dordInnerGo i) ar) all) 0) sp)))))

let rec v_Vuna_dCompiler_dDtDerive_dordAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__26, dtb__27) -> (match dtb__26 with
  | C_Vuna_dCompiler_dAst_dCtor_Vuna_dCompiler_dAst_dCtor (dtb__28, dtb__29, dtb__30, dtb__31) -> ((fun vs -> ((fun pat -> ((fun body -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (pat, body)), ((((v_Vuna_dCompiler_dDtDerive_dordAlts mc0) dtb__27) ((bi_add mc2) 1)) mc3)))) (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sy", mc3)), ((((v_Vuna_dCompiler_dDtDerive_dordInner mc2) dtb__30) mc0) mc3), mc3)))) (C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__28, ((v_Base_dList_dmap (fun v -> (C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (v, mc3)))) vs), mc3)))) ((v_Vuna_dCompiler_dDtDerive_dvarNames "fa") dtb__30))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDtDerive_dordBody = (fun ctors -> (fun sp -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sx", sp)), ((((v_Vuna_dCompiler_dDtDerive_dordAlts ctors) ctors) 0) sp), sp))))

let v_Vuna_dCompiler_dDtDerive_dgtBody = (fun ctors -> (fun sp -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("lt", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sy", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sx", sp)), C_Base_dList_dList_Nil)))), sp))))

let v_Vuna_dCompiler_dDtDerive_dgeBody = (fun ctors -> (fun sp -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("le", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sy", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("sx", sp)), C_Base_dList_dList_Nil)))), sp))))

let v_Vuna_dCompiler_dDtDerive_dderiveInstance = (fun dname -> (fun params -> (fun ctors -> (fun tn -> (fun sp -> ((fun hd -> (if ((bi_eq_str tn) "Show") then ((fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, false, hd, ms, sp))))) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun ("show", (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sx", sp)), C_Base_dList_dList_Nil)), (((v_Vuna_dCompiler_dDtDerive_dshowBody ctors) "sx") sp), sp)), C_Base_dList_dList_Nil))) else (if ((bi_eq_str tn) "Eq") then ((fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, false, hd, ms, sp))))) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun ("eq", (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sx", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sy", sp)), C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dDtDerive_deqBody ctors) sp), sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun ("neq", (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sx", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sy", sp)), C_Base_dList_dList_Nil)))), (v_Vuna_dCompiler_dDtDerive_dneqBody sp), sp)), C_Base_dList_dList_Nil))))) else (if ((bi_eq_str tn) "Ord") then ((fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, false, hd, ms, sp))))) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun ("lt", (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sx", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sy", sp)), C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dDtDerive_dordBody ctors) sp), sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun ("le", (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sx", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sy", sp)), C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dDtDerive_dleBody ctors) sp), sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun ("gt", (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sx", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sy", sp)), C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dDtDerive_dgtBody ctors) sp), sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun ("ge", (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sx", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("sy", sp)), C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dDtDerive_dgeBody ctors) sp), sp)), C_Base_dList_dList_Nil))))))))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": cannot derive `") ((bi_concat tn) "` (supported: Show, Eq, Ord)"))))))))) ((((v_Vuna_dCompiler_dDtDerive_dinstHead tn) dname) params) sp)))))))

let rec v_Vuna_dCompiler_dDtDerive_dderivingsForGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__32, dtb__33) -> (match mc1 with
  | C_Base_dList_dList_Nil -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dDtDerive_dderiveInstance mc0) mc1) mc2) dtb__32) mc4)) (fun decl -> ((((((v_Vuna_dCompiler_dDtDerive_dderivingsForGo mc0) mc1) mc2) dtb__33) mc4) (C_Base_dList_dList_Cons (decl, mc5)))))
  | _ -> (if ((bi_eq_str dtb__32) "Eq") then ((((((v_Vuna_dCompiler_dDtDerive_dderivingsForGo mc0) mc1) mc2) dtb__33) mc4) mc5) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc mc4)) ((bi_concat ": DT: deriving ") ((bi_concat dtb__32) " is only supported for non-parameterized data types (M23)"))))))
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Base_dList_dreverse mc5)))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dDtDerive_dderivingsFor = (fun dname -> (fun params -> (fun ctors -> (fun derivings -> (fun sp -> ((((((v_Vuna_dCompiler_dDtDerive_dderivingsForGo dname) params) ctors) derivings) sp) C_Base_dList_dList_Nil))))))

let rec v_Vuna_dCompiler_dDtDerive_dcollectDerivings = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__34, dtb__35) -> (match dtb__34 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dtb__36, dtb__37, dtb__38, dtb__39, dtb__40, dtb__41) -> (if ((bi_eq_generic dtb__40) C_Base_dList_dList_Nil) then (v_Vuna_dCompiler_dDtDerive_dcollectDerivings dtb__35) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dDtDerive_dderivingsFor dtb__36) dtb__37) dtb__39) dtb__40) dtb__41)) (fun insts -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtDerive_dcollectDerivings dtb__35)) (fun more -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend insts) more))))))))
  | _ -> (v_Vuna_dCompiler_dDtDerive_dcollectDerivings dtb__35)
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDtDerive_dexpandDerivings = (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtDerive_dcollectDerivings decls)) (fun insts -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend decls) insts))))))

let v_Vuna_dCompiler_dDtDerive_dordInstanceOf = (fun tn -> (fun sp -> (C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, false, (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("Ord", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (tn, sp)), C_Base_dList_dList_Nil)), sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun ("lt", (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("x", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("y", sp)), C_Base_dList_dList_Nil)))), (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("<", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("x", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("y", sp)), C_Base_dList_dList_Nil)))), sp)), sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun ("le", (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("x", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("y", sp)), C_Base_dList_dList_Nil)))), (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("<=", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("x", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("y", sp)), C_Base_dList_dList_Nil)))), sp)), sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun ("gt", (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("x", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("y", sp)), C_Base_dList_dList_Nil)))), (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (">", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("x", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("y", sp)), C_Base_dList_dList_Nil)))), sp)), sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun ("ge", (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("x", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar ("y", sp)), C_Base_dList_dList_Nil)))), (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (">=", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("x", sp)), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("y", sp)), C_Base_dList_dList_Nil)))), sp)), sp)), C_Base_dList_dList_Nil)))))))), sp))))

let v_Vuna_dCompiler_dDtDerive_dordIntInstance = fun () -> ((v_Vuna_dCompiler_dDtDerive_dordInstanceOf "Int") (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))

let v_Vuna_dCompiler_dDtDerive_dordStringInstance = fun () -> ((v_Vuna_dCompiler_dDtDerive_dordInstanceOf "String") (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))

let v_Vuna_dCompiler_dDtDerive_dordBoolInstance = fun () -> ((v_Vuna_dCompiler_dDtDerive_dordInstanceOf "Bool") (v_Vuna_dCompiler_dDtDerive_dnoSpan ()))

let v_Vuna_dCompiler_dDtDerive_dbuiltinOrdInstances = fun () -> (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDtDerive_dordIntInstance ()), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDtDerive_dordStringInstance ()), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDtDerive_dordBoolInstance ()), C_Base_dList_dList_Nil))))))
