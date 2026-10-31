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
type   t_Vuna_dCompiler_dElab_dDtDef =
    C_Vuna_dCompiler_dElab_dDtDef of (string) * (t_Vuna_dCompiler_dCore_dTerm) * (t_Vuna_dCompiler_dCore_dTerm)
and   t_Vuna_dCompiler_dElab_dDtCtor =
    C_Vuna_dCompiler_dElab_dDtCtor of (string) * (string) * (((string, bool) t_Base_dPair_dPair) list) * (t_Vuna_dCompiler_dCore_dTerm)
and   t_Vuna_dCompiler_dElab_dDtData =
    C_Vuna_dCompiler_dElab_dDtData of (string) * (((string, bool) t_Base_dPair_dPair) list) * ((t_Vuna_dCompiler_dElab_dDtCtor) list)
and t_Vuna_dCompiler_dElab_dEc
and t_Vuna_dCompiler_dElab_dCtx
val v_Vuna_dCompiler_dElab_ddtDefName : (t_Vuna_dCompiler_dElab_dDtDef) -> (string)
val v_Vuna_dCompiler_dElab_ddtDefType : (t_Vuna_dCompiler_dElab_dDtDef) -> (t_Vuna_dCompiler_dCore_dTerm)
val v_Vuna_dCompiler_dElab_ddtDefBody : (t_Vuna_dCompiler_dElab_dDtDef) -> (t_Vuna_dCompiler_dCore_dTerm)
val v_Vuna_dCompiler_dElab_ddtCtorName : (t_Vuna_dCompiler_dElab_dDtCtor) -> (string)
val v_Vuna_dCompiler_dElab_ddtCtorFamily : (t_Vuna_dCompiler_dElab_dDtCtor) -> (string)
val v_Vuna_dCompiler_dElab_ddtCtorTelescope : (t_Vuna_dCompiler_dElab_dDtCtor) -> (((string, bool) t_Base_dPair_dPair) list)
val v_Vuna_dCompiler_dElab_ddtCtorType : (t_Vuna_dCompiler_dElab_dDtCtor) -> (t_Vuna_dCompiler_dCore_dTerm)
val v_Vuna_dCompiler_dElab_ddtDataName : (t_Vuna_dCompiler_dElab_dDtData) -> (string)
val v_Vuna_dCompiler_dElab_ddtDataParams : (t_Vuna_dCompiler_dElab_dDtData) -> (((string, bool) t_Base_dPair_dPair) list)
val v_Vuna_dCompiler_dElab_ddtDataCtors : (t_Vuna_dCompiler_dElab_dDtData) -> ((t_Vuna_dCompiler_dElab_dDtCtor) list)
val v_Vuna_dCompiler_dElab_delabProgram : ((t_Vuna_dCompiler_dAst_dDecl) list) -> ((((t_Vuna_dCompiler_dElab_dDtData) list, (t_Vuna_dCompiler_dElab_dDtDef) list) t_Base_dPair_dPair) t_Base_dResult_dResult)
val show_Vuna_dCompiler_dElab_dDtDef : t_Vuna_dCompiler_dElab_dDtDef -> string
val show_Vuna_dCompiler_dElab_dDtCtor : t_Vuna_dCompiler_dElab_dDtCtor -> string
val show_Vuna_dCompiler_dElab_dDtData : t_Vuna_dCompiler_dElab_dDtData -> string
val show_Vuna_dCompiler_dElab_dEc : t_Vuna_dCompiler_dElab_dEc -> string
val show_Vuna_dCompiler_dElab_dCtx : t_Vuna_dCompiler_dElab_dCtx -> string
