open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dShow
open Base_dNat
open Base_dList
open Base_dResult
open Base_dString
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Base_dArray
open Base_dHashMap
let v_Vuna_dCompiler_dDebug_dargs = (v_Base_dIO_drunIO (C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> (dtp_listOf (dtp_getArgs ())))))

let v_Vuna_dCompiler_dDebug_ddebugOn = ((v_Base_dList_dmemName "--debug-perf") v_Vuna_dCompiler_dDebug_dargs)

let v_Vuna_dCompiler_dDebug_dnote = (fun msg -> (if v_Vuna_dCompiler_dDebug_ddebugOn then ((fun _u -> 0) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_print dtio_0)) (String.concat "" ["DEBUG "; msg; "\n"])))) else 0))

let v_Vuna_dCompiler_dDebug_dnoteInt = (fun label n -> (v_Vuna_dCompiler_dDebug_dnote (String.concat "" [label; "="; (bi_strFromInt n)])))

let v_Vuna_dCompiler_dDebug_dstampNow = (fun label -> ((fun _u -> 0) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_print dtio_0)) (String.concat "" ["PERF "; label; " "; (bi_strFromInt (v_Base_dIO_drunIO (C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> (dtp_timeUs ()))))); "\n"])))))

let v_Vuna_dCompiler_dDebug_dstamp = (fun label -> (if v_Vuna_dCompiler_dDebug_ddebugOn then (v_Vuna_dCompiler_dDebug_dstampNow label) else 0))

let v_Vuna_dCompiler_dDebug_dsampleKey = (fun name -> ((fun h -> ((h - ((if 64 = 0 then failwith "division by zero" else h / 64) * 64)) = 0)) (v_Base_dHashMap_dhashStr name)))

let v_Vuna_dCompiler_dDebug_dstampSample = (fun key label -> (if (v_Vuna_dCompiler_dDebug_dsampleKey key) then (v_Vuna_dCompiler_dDebug_dstamp label) else 0))
