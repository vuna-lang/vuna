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
open Vuna_dInterp
open Vuna_dFmt
let rec v_Vuna_dFiles_dcollectVunaFiles = fun dir -> v_Vuna_dList_dconcatMap (v_Vuna_dFiles_dwalkVuna dir) (bi_read_dir dir)
and v_Vuna_dFiles_dwalkVuna = fun dir name -> (match name with
  | "." -> []
  | ".." -> []
  | _ -> (let path = (let vuna_cat0' = (dir) in (let vuna_cat1' = ("/") in (let vuna_cat2' = (name) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in if bi_is_directory path then v_Vuna_dFiles_dcollectVunaFiles path else if v_Vuna_dString_dendsWith ".vuna" name then (path) :: ([]) else [])
  | _ -> vuna_fail "./lib/Vuna/Files.vuna" 13 3 ("case pattern match failure"))

let rec v_Vuna_dFiles_dcollectSourceFiles = fun dir -> v_Vuna_dList_dconcatMap (v_Vuna_dFiles_dwalkAny dir) (bi_read_dir dir)
and v_Vuna_dFiles_dwalkAny = fun dir name -> (match name with
  | "." -> []
  | ".." -> []
  | _ -> (let path = (let vuna_cat0' = (dir) in (let vuna_cat1' = ("/") in (let vuna_cat2' = (name) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in if bi_is_directory path then v_Vuna_dFiles_dcollectSourceFiles path else (path) :: ([]))
  | _ -> vuna_fail "./lib/Vuna/Files.vuna" 27 3 ("case pattern match failure"))

let v_Vuna_dFiles_dpathExistsDir = fun path -> bi_is_directory path

let rec v_Vuna_dFiles_dsplitPathChars = fun a0 a1 -> match (a0, a1) with
  | ([], acc) -> (let chars = v_Vuna_dList_dreverse acc in C_Vuna_dPair_dPair ("", bi_str_pack chars))
  | ((c) :: (rest), acc) -> if v_vuna_ueq_uint c 47 then C_Vuna_dPair_dPair (bi_str_pack (v_Vuna_dList_dreverse acc), bi_str_pack rest) else v_Vuna_dFiles_dsplitPathChars rest ((c) :: (acc))
  | _ -> vuna_fail "./lib/Vuna/Files.vuna" 40 1 ("no matching clause for Vuna.Files.splitPathChars")

let v_Vuna_dFiles_dsplitPath = fun path -> v_Vuna_dFiles_dsplitPathChars (bi_str_unpack path) []

let v_Vuna_dFiles_dbaseName = fun path -> v_Vuna_dPair_dsecondOf (v_Vuna_dFiles_dsplitPath path)
