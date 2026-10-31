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
type   t_Vuna_dSplitCli_dSplitInput =
    C_Vuna_dSplitCli_dSplitInput of ((t_Vuna_dLoader_dModule) list) * ((t_Vuna_dAst_dDecl) list) * ((t_Vuna_dAst_dDecl) list) * (((string, t_Vuna_dTypecheck_dScheme) t_Vuna_dPair_dPair) list) * (((string, string) t_Vuna_dPair_dPair) list)
let show_Vuna_dSplitCli_dSplitInput v =
  match v with
  | C_Vuna_dSplitCli_dSplitInput (f0, f1, f2, f3, f4) -> show_ctor "SplitInput" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dLoader_dModule) x ^ " " ^ go xs ^ ")" in go v)) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dDecl) x ^ " " ^ go xs ^ ")" in go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dDecl) x ^ " " ^ go xs ^ ")" in go v)) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dPair_dPair show_vstring show_Vuna_dTypecheck_dScheme)) x ^ " " ^ go xs ^ ")" in go v)) f3; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dPair_dPair show_vstring show_vstring)) x ^ " " ^ go xs ^ ")" in go v)) f4]
let v_Vuna_dSplitCli_dprepareSplit = fun dir -> (match v_Vuna_dPkg_dloadPackage dir with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (pkg) -> (let roots = v_Vuna_dPkg_dpackageRoots pkg in (let entry = v_Vuna_dPkg_dpackageEntry pkg in (match v_Vuna_dLoader_dloadProject roots (v_Vuna_dPkg_dpackageName pkg) entry with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (project) -> (match v_Vuna_dLoader_dresolveProject project with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (parts) -> (let entryDecls = v_Vuna_dPair_dfirstOf parts in (let modules = v_Vuna_dPair_dsecondOf parts in (let flat = v_Vuna_dList_dappend entryDecls (v_Vuna_dList_dconcatMap v_Vuna_dLoader_dmoduleDeclsOf modules) in (match v_Vuna_dTypecheck_dcheckProgramInfoElabOwners flat with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (C_Vuna_dPair_dPair (globals, elabDecls), owners)) -> C_Vuna_dResult_dOk (C_Vuna_dSplitCli_dSplitInput (modules, entryDecls, elabDecls, globals, owners))
  | _ -> vuna_fail "compiler/lib/Vuna/SplitCli.vuna" 36 30 ("case pattern match failure")))))
  | _ -> vuna_fail "compiler/lib/Vuna/SplitCli.vuna" 30 17 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/SplitCli.vuna" 27 13 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/SplitCli.vuna" 22 3 ("case pattern match failure"))

let v_Vuna_dSplitCli_dbuildSplit = fun dir outDir -> v_Vuna_dResult_dandThen (v_Vuna_dSplitCli_dprepareSplit dir) (fun input -> (match input with
  | C_Vuna_dSplitCli_dSplitInput (modules, entryDecls, elabDecls, globals, owners) -> v_Vuna_dResult_dandThen (v_Vuna_dTypedCodegen_dgenerateSplitProgram modules entryDecls elabDecls globals owners) (fun files -> v_Vuna_dResult_dandThen (v_Vuna_dSplit_dwriteSplitFiles outDir files) (fun n -> (let order = v_Vuna_dSplit_dsplitCompileOrder (v_Vuna_dSplit_dsplitInitFiles files) in (let _ = bi_write_file (((outDir) ^ ("/build.sh"))) (v_Vuna_dSplit_dbuildScript order) in C_Vuna_dResult_dOk (n)))))
  | _ -> vuna_fail "compiler/lib/Vuna/SplitCli.vuna" 45 5 ("case pattern match failure")))

let v_Vuna_dSplitCli_dseedSplit = fun dir outDir -> v_Vuna_dSplitCli_dbuildSplit dir outDir
