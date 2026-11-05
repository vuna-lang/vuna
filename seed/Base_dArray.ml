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
let v_Base_dArray_dfromList = (fun xs -> ((fun xs -> Array.of_list (dtp_ocamlOf xs)) xs))

let v_Base_dArray_dtoList = (fun a -> ((fun a -> dtp_listOf (Array.to_list a)) a))

let v_Base_dArray_dlength = (fun a -> (bi_natFromInt (Array.length a)))

let v_Base_dArray_dget = (fun a i -> ((Array.get a) i))

let v_Base_dArray_dset = (fun a i v -> (((dtp_arraySet a) i) v))

let v_Base_dArray_dmake = (fun n v -> ((Array.make n) v))
