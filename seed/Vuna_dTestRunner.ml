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
open Vuna_dFiles
open Vuna_dRepl
open Vuna_dDoc
let rec v_Vuna_dTestRunner_dtestFiles = fun a0 -> match a0 with
  | ([]) -> []
  | ((name) :: (rest)) -> if v_Vuna_dString_dendsWith ".vuna" name then (name) :: (v_Vuna_dTestRunner_dtestFiles rest) else v_Vuna_dTestRunner_dtestFiles rest
  | _ -> vuna_fail "./lib/Vuna/TestRunner.vuna" 23 1 ("no matching clause for Vuna.TestRunner.testFiles")

let rec v_Vuna_dTestRunner_drunTestFiles = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (roots, pkgName, dir, [], pass, fail) -> (let _ = bi_print ((let vuna_cat0' = ("\n") in (let vuna_cat1' = (bi_str_from_int pass) in (let vuna_cat2' = (" passed, ") in (let vuna_cat3' = (bi_str_from_int fail) in (let vuna_cat4' = (" failed\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))) in if v_vuna_ueq_uint fail 0 then 0 else 1)
  | (roots, pkgName, dir, (name) :: (rest), pass, fail) -> (let path = (let vuna_cat0' = (dir) in (let vuna_cat1' = ("/") in (let vuna_cat2' = (name) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in (let output = v_Vuna_dInterp_dinterpretFileIn pkgName roots path in if v_vuna_ueq_ustr output "\"\"" then (let _ = bi_print ((let vuna_cat0' = ("ok   ") in (let vuna_cat1' = (name) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in v_Vuna_dTestRunner_drunTestFiles roots pkgName dir rest (bi_add pass 1) fail) else (let _ = bi_print ((let vuna_cat0' = ("FAIL ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (": ") in (let vuna_cat3' = (output) in (let vuna_cat4' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))) in v_Vuna_dTestRunner_drunTestFiles roots pkgName dir rest pass (bi_add fail 1))))
  | _ -> vuna_fail "./lib/Vuna/TestRunner.vuna" 28 1 ("no matching clause for Vuna.TestRunner.runTestFiles")

let v_Vuna_dTestRunner_drunTests = fun pkg roots -> (let testDir = ((v_Vuna_dPkg_dpackageDir pkg) ^ ("/test")) in if bi_is_directory testDir then (let files = v_Vuna_dTestRunner_dtestFiles (bi_read_dir testDir) in v_Vuna_dTestRunner_drunTestFiles roots (v_Vuna_dPkg_dpackageName pkg) testDir files 0 0) else (let _ = bi_print ((let vuna_cat0' = ("error: test directory not found: ") in (let vuna_cat1' = (testDir) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 2))
