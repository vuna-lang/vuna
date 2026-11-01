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
open Vuna_dCompiler_dDtQuant
open Vuna_dCompiler_dDtDerive
open Vuna_dCompiler_dDtRecords
open Vuna_dCompiler_dElab
open Vuna_dCompiler_dCoreCodegen
open Vuna_dCompiler_dDt
val v_Vuna_dCompiler_dCompile_deffectiveRoots : ((t_Vuna_dCompiler_dPkg_dRoot) list) -> ((t_Vuna_dCompiler_dPkg_dRoot) list)
val v_Vuna_dCompiler_dCompile_dcompileFileTyped : ((t_Vuna_dCompiler_dPkg_dRoot) list) -> ((string) -> ((bool) -> ((string) t_Base_dResult_dResult)))
val v_Vuna_dCompiler_dCompile_dcompileFileTypedExec : ((t_Vuna_dCompiler_dPkg_dRoot) list) -> ((string) -> ((string) t_Base_dResult_dResult))
val v_Vuna_dCompiler_dCompile_dcheckFile : ((t_Vuna_dCompiler_dPkg_dRoot) list) -> ((string) -> (((string) list) t_Base_dResult_dResult))
val v_Vuna_dCompiler_dCompile_dcompileFileTypedIn : (string) -> (((t_Vuna_dCompiler_dPkg_dRoot) list) -> ((string) -> ((bool) -> ((string) t_Base_dResult_dResult))))
val v_Vuna_dCompiler_dCompile_dcompileFileTypedExecIn : (string) -> (((t_Vuna_dCompiler_dPkg_dRoot) list) -> ((string) -> ((string) t_Base_dResult_dResult)))
val v_Vuna_dCompiler_dCompile_dcheckFileIn : (string) -> (((t_Vuna_dCompiler_dPkg_dRoot) list) -> ((string) -> (((string) list) t_Base_dResult_dResult)))
val v_Vuna_dCompiler_dCompile_dcheckPackageIn : (string) -> (((t_Vuna_dCompiler_dPkg_dRoot) list) -> (((string) list) -> (((string) list) t_Base_dResult_dResult)))
val v_Vuna_dCompiler_dCompile_dcompileFileDt : ((string) list) -> ((string) -> ((bool) -> ((string) t_Base_dResult_dResult)))
val v_Vuna_dCompiler_dCompile_dcheckFileDt : ((string) list) -> ((string) -> (((string) list) t_Base_dResult_dResult))
