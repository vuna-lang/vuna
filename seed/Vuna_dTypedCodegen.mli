open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
open Vuna_dResult
open Vuna_dString
open Vuna_dBase
open Vuna_dToml
open Vuna_dManifest
open Vuna_dPkg
open Vuna_dAst
open Vuna_dLexer
open Vuna_dParser
open Vuna_dBuiltins
open Vuna_dLoader
open Vuna_dCodegen
open Vuna_dTypecheck
open Vuna_dSplit
type t_Vuna_dTypedCodegen_dSplitCtx
val v_Vuna_dTypedCodegen_dgenerateProgramTyped : ((t_Vuna_dAst_dDecl) list) -> ((((string, t_Vuna_dTypecheck_dScheme) t_Vuna_dPair_dPair) list) -> ((bool) -> ((string) t_Vuna_dResult_dResult)))
val v_Vuna_dTypedCodegen_dgenerateSplitProgram : ((t_Vuna_dLoader_dModule) list) -> (((t_Vuna_dAst_dDecl) list) -> (((t_Vuna_dAst_dDecl) list) -> ((((string, t_Vuna_dTypecheck_dScheme) t_Vuna_dPair_dPair) list) -> ((((string, string) t_Vuna_dPair_dPair) list) -> (((t_Vuna_dSplit_dSplitFile) list) t_Vuna_dResult_dResult)))))
val show_Vuna_dTypedCodegen_dSplitCtx : t_Vuna_dTypedCodegen_dSplitCtx -> string
