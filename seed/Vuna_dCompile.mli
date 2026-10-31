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
open Vuna_dCodegen
open Vuna_dTypecheck
open Vuna_dSplit
open Vuna_dTypedCodegen
val v_Vuna_dCompile_deffectiveRoots : ((t_Vuna_dPkg_dRoot) list) -> ((t_Vuna_dPkg_dRoot) list)
val v_Vuna_dCompile_dcompileFile : ((t_Vuna_dPkg_dRoot) list) -> ((string) -> ((bool) -> ((string) t_Vuna_dResult_dResult)))
val v_Vuna_dCompile_dcompileFileChecked : ((t_Vuna_dPkg_dRoot) list) -> ((string) -> ((bool) -> ((string) t_Vuna_dResult_dResult)))
val v_Vuna_dCompile_dcompileFileTyped : ((t_Vuna_dPkg_dRoot) list) -> ((string) -> ((bool) -> ((string) t_Vuna_dResult_dResult)))
val v_Vuna_dCompile_dcompileFileTypedExec : ((t_Vuna_dPkg_dRoot) list) -> ((string) -> ((bool) -> ((string) t_Vuna_dResult_dResult)))
val v_Vuna_dCompile_dcheckFile : ((t_Vuna_dPkg_dRoot) list) -> ((string) -> (((string) list) t_Vuna_dResult_dResult))
val v_Vuna_dCompile_dcompileFileIn : (string) -> (((t_Vuna_dPkg_dRoot) list) -> ((string) -> ((bool) -> ((string) t_Vuna_dResult_dResult))))
val v_Vuna_dCompile_dcompileFileCheckedIn : (string) -> (((t_Vuna_dPkg_dRoot) list) -> ((string) -> ((bool) -> ((string) t_Vuna_dResult_dResult))))
val v_Vuna_dCompile_dcompileFileTypedIn : (string) -> (((t_Vuna_dPkg_dRoot) list) -> ((string) -> ((bool) -> ((string) t_Vuna_dResult_dResult))))
val v_Vuna_dCompile_dcompileFileTypedExecIn : (string) -> (((t_Vuna_dPkg_dRoot) list) -> ((string) -> ((bool) -> ((string) t_Vuna_dResult_dResult))))
val v_Vuna_dCompile_dcheckFileIn : (string) -> (((t_Vuna_dPkg_dRoot) list) -> ((string) -> (((string) list) t_Vuna_dResult_dResult)))
val v_Vuna_dCompile_dprogramNeedsElab : ((t_Vuna_dAst_dDecl) list) -> (bool)
