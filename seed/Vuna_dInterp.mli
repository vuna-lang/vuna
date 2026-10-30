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
open Vuna_dEval
open Vuna_dCodegen
open Vuna_dTypecheck
open Vuna_dSplit
open Vuna_dTypedCodegen
val v_Vuna_dInterp_deffectiveRoots : ((t_Vuna_dPkg_dRoot) list) -> ((t_Vuna_dPkg_dRoot) list)
val v_Vuna_dInterp_dinterpretFile : ((t_Vuna_dPkg_dRoot) list) -> ((string) -> (string))
val v_Vuna_dInterp_dcompileFile : ((t_Vuna_dPkg_dRoot) list) -> ((string) -> ((bool) -> ((string) t_Vuna_dResult_dResult)))
val v_Vuna_dInterp_dcompileFileChecked : ((t_Vuna_dPkg_dRoot) list) -> ((string) -> ((bool) -> ((string) t_Vuna_dResult_dResult)))
val v_Vuna_dInterp_dcompileFileTyped : ((t_Vuna_dPkg_dRoot) list) -> ((string) -> ((bool) -> ((string) t_Vuna_dResult_dResult)))
val v_Vuna_dInterp_dcheckFile : ((t_Vuna_dPkg_dRoot) list) -> ((string) -> (((string) list) t_Vuna_dResult_dResult))
val v_Vuna_dInterp_dinterpretFileIn : (string) -> (((t_Vuna_dPkg_dRoot) list) -> ((string) -> (string)))
val v_Vuna_dInterp_dcompileFileIn : (string) -> (((t_Vuna_dPkg_dRoot) list) -> ((string) -> ((bool) -> ((string) t_Vuna_dResult_dResult))))
val v_Vuna_dInterp_dcompileFileCheckedIn : (string) -> (((t_Vuna_dPkg_dRoot) list) -> ((string) -> ((bool) -> ((string) t_Vuna_dResult_dResult))))
val v_Vuna_dInterp_dcompileFileTypedIn : (string) -> (((t_Vuna_dPkg_dRoot) list) -> ((string) -> ((bool) -> ((string) t_Vuna_dResult_dResult))))
val v_Vuna_dInterp_dcheckFileIn : (string) -> (((t_Vuna_dPkg_dRoot) list) -> ((string) -> (((string) list) t_Vuna_dResult_dResult)))
