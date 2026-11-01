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
val v_Vuna_dCompiler_dDtKind_dclassParamKind : (string) -> ((((string, t_Vuna_dCompiler_dAst_dExpr) t_Base_dPair_dPair) list) -> (t_Vuna_dCompiler_dCore_dTerm))
val v_Vuna_dCompiler_dDtKind_darityFun : (int) -> ((t_Vuna_dCompiler_dCore_dTerm) -> (t_Vuna_dCompiler_dCore_dTerm))
val v_Vuna_dCompiler_dDtKind_dmethodArgRigsOf : ((bool) -> ((t_Vuna_dCompiler_dCore_dValue) -> (t_Vuna_dCompiler_dCore_dRig))) -> ((t_Vuna_dCompiler_dCore_dTerm) -> ((t_Vuna_dCompiler_dCore_dRig) list))
