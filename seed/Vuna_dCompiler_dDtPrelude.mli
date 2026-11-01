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
val v_Vuna_dCompiler_dDtPrelude_dpreludeNames : (string) list
val v_Vuna_dCompiler_dDtPrelude_dpreludeGlobals : unit -> ((string, t_Vuna_dCompiler_dCore_dTerm) t_Base_dPair_dPair) list
val v_Vuna_dCompiler_dDtPrelude_dintTy : t_Vuna_dCompiler_dCore_dTerm
val v_Vuna_dCompiler_dDtPrelude_dstrTy : t_Vuna_dCompiler_dCore_dTerm
val v_Vuna_dCompiler_dDtPrelude_dboolTy : t_Vuna_dCompiler_dCore_dTerm
val v_Vuna_dCompiler_dDtPrelude_dfun2 : (t_Vuna_dCompiler_dCore_dTerm) -> ((t_Vuna_dCompiler_dCore_dTerm) -> ((t_Vuna_dCompiler_dCore_dTerm) -> (t_Vuna_dCompiler_dCore_dTerm)))
val v_Vuna_dCompiler_dDtPrelude_disEqOp : (string) -> (bool)
val v_Vuna_dCompiler_dDtPrelude_dbuiltinTyName : (t_Vuna_dCompiler_dCore_dValue) -> ((string) t_Base_dMaybe_dMaybe)
val v_Vuna_dCompiler_dDtPrelude_dbuiltinEqTyName : (t_Vuna_dCompiler_dCore_dValue) -> ((string) t_Base_dMaybe_dMaybe)
val v_Vuna_dCompiler_dDtPrelude_deqRuntimeName : (string) -> ((string) -> ((string) t_Base_dResult_dResult))
val v_Vuna_dCompiler_dDtPrelude_dpolyEqTy : unit -> t_Vuna_dCompiler_dCore_dTerm
val v_Vuna_dCompiler_dDtPrelude_dinstanceDefName : ((string) t_Base_dMaybe_dMaybe) -> ((string) -> ((string) -> (string)))
val v_Vuna_dCompiler_dDtPrelude_dprependParams : ((string) list) -> ((t_Vuna_dCompiler_dCore_dTerm) -> (t_Vuna_dCompiler_dCore_dTerm))
