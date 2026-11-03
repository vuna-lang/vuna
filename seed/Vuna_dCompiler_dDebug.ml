open Vuna_runtime
open Vuna_builtins
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dOrd
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Vuna_dCompiler_dPackages_dPkg
open Base_dNat
open Base_dVec
open Vuna_dCompiler_dLoader_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
let v_Vuna_dCompiler_dDebug_dargs = fun () -> (dtp_listOf (dtp_getArgs ()))

let v_Vuna_dCompiler_dDebug_ddebugOn = fun () -> ((v_Base_dList_dmemName "--debug-perf") (v_Vuna_dCompiler_dDebug_dargs ()))

let v_Vuna_dCompiler_dDebug_dnote = (fun msg -> (if (v_Vuna_dCompiler_dDebug_ddebugOn ()) then ((fun _u -> 0) (dtp_print ((bi_concat "DEBUG ") ((bi_concat msg) "\n")))) else 0))

let v_Vuna_dCompiler_dDebug_dnoteInt = (fun label -> (fun n -> (v_Vuna_dCompiler_dDebug_dnote ((bi_concat label) ((bi_concat "=") (bi_strFromInt n))))))

let v_Vuna_dCompiler_dDebug_dstampNow = (fun label -> ((fun _u -> 0) (dtp_print ((bi_concat "PERF ") ((bi_concat label) ((bi_concat " ") ((bi_concat (bi_strFromInt (dtp_timeUs ()))) "\n")))))))

let v_Vuna_dCompiler_dDebug_dstamp = (fun label -> (if (v_Vuna_dCompiler_dDebug_ddebugOn ()) then (v_Vuna_dCompiler_dDebug_dstampNow label) else 0))

let v_Vuna_dCompiler_dDebug_dsampleKey = (fun name -> ((fun h -> ((bi_eq_int ((bi_sub h) ((bi_mul ((bi_div h) 64)) 64))) 0)) (v_Vuna_dCompiler_dCommon_dhashStr name)))

let v_Vuna_dCompiler_dDebug_dstampSample = (fun key -> (fun label -> (if (v_Vuna_dCompiler_dDebug_dsampleKey key) then (v_Vuna_dCompiler_dDebug_dstamp label) else 0)))
