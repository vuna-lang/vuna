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
open Vuna_dCompiler_dElab
type t_Vuna_dCompiler_dCoreCodegen_dGenSt
and t_Vuna_dCompiler_dCoreCodegen_dAltEnv
val v_Vuna_dCompiler_dCoreCodegen_dcheckDtProgram : (((t_Vuna_dCompiler_dElab_dDtData) list, (t_Vuna_dCompiler_dElab_dDtDef) list) t_Base_dPair_dPair) -> ((int) t_Base_dResult_dResult)
val v_Vuna_dCompiler_dCoreCodegen_dgenerateDtProgram : (((t_Vuna_dCompiler_dElab_dDtData) list, (t_Vuna_dCompiler_dElab_dDtDef) list) t_Base_dPair_dPair) -> ((bool) -> ((string) t_Base_dResult_dResult))
val v_vuna_ueq_uVuna_uCompiler_uCoreCodegen_uGenSt : (t_Vuna_dCompiler_dCoreCodegen_dGenSt) -> ((t_Vuna_dCompiler_dCoreCodegen_dGenSt) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uCoreCodegen_uGenSt : (t_Vuna_dCompiler_dCoreCodegen_dGenSt) -> ((t_Vuna_dCompiler_dCoreCodegen_dGenSt) -> (bool))
val v_vuna_ueq_uVuna_uCompiler_uCoreCodegen_uAltEnv : (t_Vuna_dCompiler_dCoreCodegen_dAltEnv) -> ((t_Vuna_dCompiler_dCoreCodegen_dAltEnv) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uCoreCodegen_uAltEnv : (t_Vuna_dCompiler_dCoreCodegen_dAltEnv) -> ((t_Vuna_dCompiler_dCoreCodegen_dAltEnv) -> (bool))
val show_Vuna_dCompiler_dCoreCodegen_dGenSt : t_Vuna_dCompiler_dCoreCodegen_dGenSt -> string
val show_Vuna_dCompiler_dCoreCodegen_dAltEnv : t_Vuna_dCompiler_dCoreCodegen_dAltEnv -> string
