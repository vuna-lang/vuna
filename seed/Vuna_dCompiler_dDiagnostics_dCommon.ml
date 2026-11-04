open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Base_dArray
open Base_dHashMap
open Vuna_dCompiler_dDebug
open Base_dNat
open Base_dVec
let v_Vuna_dCompiler_dDiagnostics_dCommon_ddiagMsg = (fun code template args -> (String.concat "" ["["; code; "] "; ((v_Base_dVec_dsubstTemplate template) args)]))

let v_Vuna_dCompiler_dDiagnostics_dCommon_ddiagErr = (fun msg -> (C_Base_dResult_dResult_Base_dResult_dErr (msg)))

let v_Vuna_dCompiler_dDiagnostics_dCommon_ddiagErrAt = (fun sp msg -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [(v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": "; msg]))))

let v_Vuna_dCompiler_dDiagnostics_dCommon_ddiagDefLoc = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (String.concat "" ["in `"; mc1; "`: "])
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__0) -> (String.concat "" [(v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__0); ": in `"; mc1; "`: "])
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDiagnostics_dCommon_dconcatLists = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__1, dtb__2) -> ((v_Base_dList_dappend dtb__1) (v_Vuna_dCompiler_dDiagnostics_dCommon_dconcatLists dtb__2))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))
