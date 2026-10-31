open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
open Vuna_dIO
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
open Vuna_dTypecheck
open Vuna_dSplit
open Vuna_dTypedCodegen
open Vuna_dCore
open Vuna_dElab
open Vuna_dCoreCodegen
val v_Vuna_dDt_ddtCheckFile : (string) -> (((string) list) t_Vuna_dResult_dResult)
val v_Vuna_dDt_ddtCompileFile : (string) -> ((bool) -> ((string) t_Vuna_dResult_dResult))
val v_Vuna_dDt_ddtEvalFile : (string) -> ((string) t_Vuna_dResult_dResult)
