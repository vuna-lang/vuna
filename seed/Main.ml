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
open Vuna_dCompile
open Vuna_dSplitCli
open Vuna_dCompilerCli
let v_main = fun () -> v_vuna_uinst_ud_uVuna_uIO_uIO_ubind (v_Vuna_dIO_dgetArgs ()) (fun args -> v_vuna_uinst_ud_uVuna_uIO_uIO_ubind (v_vuna_uinst_ud_uVuna_uIO_uIO_upure (v_Vuna_dCompilerCli_drunCompilerCli args)) (fun code -> v_Vuna_dIO_dexit code))
let () = ignore (Vuna_dIO.__vuna_run_io (v_main ()))
