open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dList
open Base_dIO
open Base_dResult
open Base_dString
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dToml
open Vuna_dCompiler_dManifest
open Vuna_dCompiler_dPkg
open Vuna_dCompiler_dAst
open Vuna_dCompiler_dLexer
open Vuna_dCompiler_dParser
open Vuna_dCompiler_dBuiltins
open Vuna_dCompiler_dLoader
open Vuna_dCompiler_dTypecheck
open Vuna_dCompiler_dSplit
open Vuna_dCompiler_dTypedCodegen
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dElab
open Vuna_dCompiler_dCoreCodegen
open Vuna_dCompiler_dDt
open Vuna_dCompiler_dCompile
type   t_Vuna_dCompiler_dSplitCli_dSplitInput =
    C_Vuna_dCompiler_dSplitCli_dSplitInput of ((t_Vuna_dCompiler_dLoader_dModule) list) * ((t_Vuna_dCompiler_dAst_dDecl) list) * ((t_Vuna_dCompiler_dAst_dDecl) list) * (((string, t_Vuna_dCompiler_dTypecheck_dScheme) t_Base_dPair_dPair) list) * (((string, string) t_Base_dPair_dPair) list)
let show_Vuna_dCompiler_dSplitCli_dSplitInput v =
  match v with
  | C_Vuna_dCompiler_dSplitCli_dSplitInput (f0, f1, f2, f3, f4) -> show_ctor "SplitInput" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dLoader_dModule) x ^ " " ^ go xs ^ ")" in go v)) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dAst_dDecl) x ^ " " ^ go xs ^ ")" in go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dAst_dDecl) x ^ " " ^ go xs ^ ")" in go v)) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_Vuna_dCompiler_dTypecheck_dScheme)) x ^ " " ^ go xs ^ ")" in go v)) f3; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_vstring)) x ^ " " ^ go xs ^ ")" in go v)) f4]
let v_Vuna_dCompiler_dSplitCli_dprepareSplit = fun dir -> (match v_Vuna_dCompiler_dPkg_dloadPackage dir with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (pkg) -> (let roots = v_Vuna_dCompiler_dPkg_dpackageRoots pkg in (let entry = v_Vuna_dCompiler_dPkg_dpackageEntry pkg in (match v_Vuna_dCompiler_dLoader_dloadProject roots (v_Vuna_dCompiler_dPkg_dpackageName pkg) entry with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (project) -> (match v_Vuna_dCompiler_dLoader_dresolveProject project with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (parts) -> (let entryDecls = v_Base_dPair_dfirstOf parts in (let modules = v_Base_dPair_dsecondOf parts in (let flat = v_Base_dList_dappend entryDecls (v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dmoduleDeclsOf modules) in (match v_Vuna_dCompiler_dTypecheck_dcheckProgramInfoElabOwners flat with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (globals, elabDecls), owners)) -> C_Base_dResult_dOk (C_Vuna_dCompiler_dSplitCli_dSplitInput (modules, entryDecls, elabDecls, globals, owners))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/SplitCli.vuna" 36 30 ("case pattern match failure")))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/SplitCli.vuna" 30 17 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/SplitCli.vuna" 27 13 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/SplitCli.vuna" 22 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dSplitCli_dbuildSplit = fun dir outDir -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dSplitCli_dprepareSplit dir) (fun input -> (match input with
  | C_Vuna_dCompiler_dSplitCli_dSplitInput (modules, entryDecls, elabDecls, globals, owners) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypedCodegen_dgenerateSplitProgram modules entryDecls elabDecls globals owners) (fun files -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dSplit_dwriteSplitFiles outDir files) (fun n -> (let order = v_Vuna_dCompiler_dSplit_dsplitCompileOrder (v_Vuna_dCompiler_dSplit_dsplitInitFiles files) in (let _ = bi_write_file (((outDir) ^ ("/build.sh"))) (v_Vuna_dCompiler_dSplit_dbuildScript order) in C_Base_dResult_dOk (n)))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/SplitCli.vuna" 45 5 ("case pattern match failure")))

let v_Vuna_dCompiler_dSplitCli_dseedSplit = fun dir outDir -> v_Vuna_dCompiler_dSplitCli_dbuildSplit dir outDir

let v_Vuna_dCompiler_dSplitCli_dfinishPrepare = fun project -> (match v_Vuna_dCompiler_dLoader_dresolveProject project with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (parts) -> (let entryDecls = v_Base_dPair_dfirstOf parts in (let modules = v_Base_dPair_dsecondOf parts in (let flat = v_Base_dList_dappend entryDecls (v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dmoduleDeclsOf modules) in (match v_Vuna_dCompiler_dTypecheck_dcheckProgramInfoElabOwners flat with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (globals, elabDecls), owners)) -> C_Base_dResult_dOk (C_Vuna_dCompiler_dSplitCli_dSplitInput (modules, entryDecls, elabDecls, globals, owners))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/SplitCli.vuna" 82 16 ("case pattern match failure")))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/SplitCli.vuna" 76 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dSplitCli_dprepareProject = fun a0 a1 -> match (a0, a1) with
  | (pkg, true) -> (match v_Vuna_dCompiler_dLoader_dloadProject (v_Vuna_dCompiler_dPkg_dpackageRoots pkg) (v_Vuna_dCompiler_dPkg_dpackageName pkg) (v_Vuna_dCompiler_dPkg_dpackageEntry pkg) with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (project) -> v_Vuna_dCompiler_dSplitCli_dfinishPrepare project
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/SplitCli.vuna" 61 3 ("case pattern match failure"))
  | (pkg, false) -> (match v_Vuna_dCompiler_dPkg_dpackageExports pkg with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = ("compile --package: library package ") in (let vuna_cat1' = (v_Vuna_dCompiler_dPkg_dpackageName pkg) in (let vuna_cat2' = (" has no app/Main.vuna and no [export].modules") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Base_dMaybe_dJust (names) -> (match v_Vuna_dCompiler_dLoader_dloadProjectModules (v_Vuna_dCompiler_dPkg_dpackageRoots pkg) (v_Vuna_dCompiler_dPkg_dpackageName pkg) names with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (project) -> v_Vuna_dCompiler_dSplitCli_dfinishPrepare project
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/SplitCli.vuna" 71 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/SplitCli.vuna" 66 3 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/SplitCli.vuna" 60 1 ("no matching clause for Vuna.Compiler.SplitCli.prepareProject")

let rec v_Vuna_dCompiler_dSplitCli_dwriteMainFiles = fun a0 a1 -> match (a0, a1) with
  | (dir, []) -> C_Base_dResult_dOk (0)
  | (dir, (f) :: (rest)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dSplitCli_dwriteMainFiles dir rest) (fun n -> (let _ = bi_write_file ((let vuna_cat0' = (dir) in (let vuna_cat1' = ("/") in (let vuna_cat2' = (v_Vuna_dCompiler_dSplit_dsplitName f) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) (v_Vuna_dCompiler_dSplit_dsplitText f) in C_Base_dResult_dOk (bi_add n 1)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/SplitCli.vuna" 94 1 ("no matching clause for Vuna.Compiler.SplitCli.writeMainFiles")

let v_Vuna_dCompiler_dSplitCli_dwritePackageFiles = fun outDir files -> (let libFiles = v_Base_dList_dfilter (fun f -> v_vuna_uneq_ustr (v_Vuna_dCompiler_dSplit_dsplitName f) "Main.ml") files in (let mainFiles = v_Base_dList_dfilter (fun f -> v_vuna_ueq_ustr (v_Vuna_dCompiler_dSplit_dsplitName f) "Main.ml") files in v_Base_dResult_dandThen (v_Vuna_dCompiler_dSplit_dwriteSplitFilesChanged (((outDir) ^ ("/lib"))) libFiles) (fun n -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dSplitCli_dwriteMainFiles (((outDir) ^ ("/app"))) mainFiles) (fun m -> C_Base_dResult_dOk (bi_add n m)))))

let v_Vuna_dCompiler_dSplitCli_dwriteCompiled = fun outDir hasMain files -> (let _ = bi_make_dir outDir in (let _ = bi_make_dir (((outDir) ^ ("/lib"))) in (let _ = if hasMain then bi_make_dir (((outDir) ^ ("/app"))) else 0 in v_Base_dResult_dandThen (v_Vuna_dCompiler_dSplitCli_dwritePackageFiles outDir files) (fun n -> (let libFiles = v_Base_dList_dfilter (fun f -> v_vuna_uneq_ustr (v_Vuna_dCompiler_dSplit_dsplitName f) "Main.ml") files in (let order = v_Vuna_dCompiler_dSplit_dsplitCompileOrder (v_Vuna_dCompiler_dSplit_dsplitInitFiles libFiles) in (let _ = bi_write_file (((outDir) ^ ("/build.sh"))) (v_Vuna_dCompiler_dSplit_dbuildScriptPackage order hasMain) in C_Base_dResult_dOk (n))))))))

let v_Vuna_dCompiler_dSplitCli_dgenerateFiles = fun hasMain modules entryDecls elabDecls globals owners -> if hasMain then v_Vuna_dCompiler_dTypedCodegen_dgenerateSplitProgram modules entryDecls elabDecls globals owners else v_Vuna_dCompiler_dTypedCodegen_dgenerateSplitLibraryProgram modules entryDecls elabDecls globals owners

let v_Vuna_dCompiler_dSplitCli_dcompilePrepared = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (outDir, hasMain, C_Vuna_dCompiler_dSplitCli_dSplitInput (modules, entryDecls, elabDecls, globals, owners)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dSplitCli_dgenerateFiles hasMain modules entryDecls elabDecls globals owners) (fun files -> v_Vuna_dCompiler_dSplitCli_dwriteCompiled outDir hasMain files)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/SplitCli.vuna" 111 1 ("no matching clause for Vuna.Compiler.SplitCli.compilePrepared")

let v_Vuna_dCompiler_dSplitCli_dcompilePkg = fun outDir pkg hasMain -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dSplitCli_dprepareProject pkg hasMain) (fun input -> v_Vuna_dCompiler_dSplitCli_dcompilePrepared outDir hasMain input)

let v_Vuna_dCompiler_dSplitCli_dcompilePackage = fun dir outDir -> (match v_Vuna_dCompiler_dPkg_dloadPackage dir with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (pkg) -> v_Vuna_dCompiler_dSplitCli_dcompilePkg outDir pkg (bi_file_exists (v_Vuna_dCompiler_dPkg_dpackageEntry pkg))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/SplitCli.vuna" 104 3 ("case pattern match failure"))
