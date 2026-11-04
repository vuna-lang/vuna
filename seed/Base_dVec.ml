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
type 'a0 t_Base_dVec_dVec = C_Base_dVec_dVec_Base_dVec_dVNil | C_Base_dVec_dVec_Base_dVec_dVCons of ('a0) * ('a0 t_Base_dVec_dVec)

let v_Base_dVec_dvhead = (fun xs -> (match xs with
  | C_Base_dVec_dVec_Base_dVec_dVCons (dtb__0, dtb__1) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dVec_dvtail = (fun xs -> (match xs with
  | C_Base_dVec_dVec_Base_dVec_dVCons (dtb__2, dtb__3) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dVec_dvlen = (fun xs -> (match xs with
  | C_Base_dVec_dVec_Base_dVec_dVNil -> 0
  | C_Base_dVec_dVec_Base_dVec_dVCons (dtb__4, dtb__5) -> (1 + (v_Base_dVec_dvlen dtb__5))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dVec_dvecToList = (fun mc0 -> (match mc0 with
  | C_Base_dVec_dVec_Base_dVec_dVCons (dtb__6, dtb__7) -> (C_Base_dList_dList_Base_dList_dCons (dtb__6, (v_Base_dVec_dvecToList dtb__7)))
  | C_Base_dVec_dVec_Base_dVec_dVNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dVec_dsubstTemplate = (fun template args -> ((dtp_substTemplate template) (v_Base_dVec_dvecToList args)))
