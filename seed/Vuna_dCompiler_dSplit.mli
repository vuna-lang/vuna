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
type   t_Vuna_dCompiler_dSplit_dSplitFile =
    C_Vuna_dCompiler_dSplit_dSplitFile of (string) * (string)
val v_Vuna_dCompiler_dSplit_dsplitName : (t_Vuna_dCompiler_dSplit_dSplitFile) -> (string)
val v_Vuna_dCompiler_dSplit_dsplitText : (t_Vuna_dCompiler_dSplit_dSplitFile) -> (string)
val v_Vuna_dCompiler_dSplit_dsplitInitFiles : ((t_Vuna_dCompiler_dSplit_dSplitFile) list) -> ((string) list)
val v_Vuna_dCompiler_dSplit_dwriteSplitFiles : (string) -> (((t_Vuna_dCompiler_dSplit_dSplitFile) list) -> ((int) t_Base_dResult_dResult))
val v_Vuna_dCompiler_dSplit_dwriteSplitFilesChanged : (string) -> (((t_Vuna_dCompiler_dSplit_dSplitFile) list) -> ((int) t_Base_dResult_dResult))
val v_Vuna_dCompiler_dSplit_dsplitCompileOrder : ((string) list) -> ((string) list)
val v_Vuna_dCompiler_dSplit_dbuildScript : ((string) list) -> (string)
val v_Vuna_dCompiler_dSplit_dbuildScriptPackage : ((string) list) -> ((bool) -> (string))
val v_vuna_ushow_uVuna_uCompiler_uSplit_uSplitFile : (t_Vuna_dCompiler_dSplit_dSplitFile) -> (string)
val v_vuna_ueq_uVuna_uCompiler_uSplit_uSplitFile : (t_Vuna_dCompiler_dSplit_dSplitFile) -> ((t_Vuna_dCompiler_dSplit_dSplitFile) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uSplit_uSplitFile : (t_Vuna_dCompiler_dSplit_dSplitFile) -> ((t_Vuna_dCompiler_dSplit_dSplitFile) -> (bool))
val show_Vuna_dCompiler_dSplit_dSplitFile : t_Vuna_dCompiler_dSplit_dSplitFile -> string
