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
open Vuna_dTypedCodegen
open Vuna_dCompile
open Vuna_dSplitCli
open Vuna_dCompilerCli
let v_main = fun () -> bi_exit (v_Vuna_dCompilerCli_drunCompilerCli (bi_get_args ()))
let () = print_endline (string_of_int (v_main ()))
