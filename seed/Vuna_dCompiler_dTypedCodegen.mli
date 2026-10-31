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
type t_Vuna_dCompiler_dTypedCodegen_dSplitCtx
val v_Vuna_dCompiler_dTypedCodegen_dgenerateProgramTyped : ((t_Vuna_dCompiler_dAst_dDecl) list) -> ((((string, t_Vuna_dCompiler_dTypecheck_dScheme) t_Base_dPair_dPair) list) -> ((bool) -> ((string) t_Base_dResult_dResult)))
val v_Vuna_dCompiler_dTypedCodegen_dgenerateProgramTypedExec : ((t_Vuna_dCompiler_dAst_dDecl) list) -> ((((string, t_Vuna_dCompiler_dTypecheck_dScheme) t_Base_dPair_dPair) list) -> ((string) t_Base_dResult_dResult))
val v_Vuna_dCompiler_dTypedCodegen_dgenerateSplitProgram : ((t_Vuna_dCompiler_dLoader_dModule) list) -> (((t_Vuna_dCompiler_dAst_dDecl) list) -> (((t_Vuna_dCompiler_dAst_dDecl) list) -> ((((string, t_Vuna_dCompiler_dTypecheck_dScheme) t_Base_dPair_dPair) list) -> ((((string, string) t_Base_dPair_dPair) list) -> (((t_Vuna_dCompiler_dSplit_dSplitFile) list) t_Base_dResult_dResult)))))
val v_Vuna_dCompiler_dTypedCodegen_dgenerateSplitLibraryProgram : ((t_Vuna_dCompiler_dLoader_dModule) list) -> (((t_Vuna_dCompiler_dAst_dDecl) list) -> (((t_Vuna_dCompiler_dAst_dDecl) list) -> ((((string, t_Vuna_dCompiler_dTypecheck_dScheme) t_Base_dPair_dPair) list) -> ((((string, string) t_Base_dPair_dPair) list) -> (((t_Vuna_dCompiler_dSplit_dSplitFile) list) t_Base_dResult_dResult)))))
val show_Vuna_dCompiler_dTypedCodegen_dSplitCtx : t_Vuna_dCompiler_dTypedCodegen_dSplitCtx -> string
