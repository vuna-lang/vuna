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
val v_Vuna_dCompiler_dDtQuant_dquantifyTraitSig : ((string) -> (bool)) -> ((t_Vuna_dCompiler_dAst_dExpr) -> ((t_Vuna_dCompiler_dCommon_dSpan) -> (t_Vuna_dCompiler_dAst_dExpr)))
val v_Vuna_dCompiler_dDtQuant_dquantifyTopSig : ((string) list) -> ((t_Vuna_dCompiler_dAst_dExpr) -> ((t_Vuna_dCompiler_dCommon_dSpan) -> (t_Vuna_dCompiler_dAst_dExpr)))
val v_Vuna_dCompiler_dDtQuant_ddefinedNames : ((t_Vuna_dCompiler_dAst_dDecl) list) -> ((string) list)
