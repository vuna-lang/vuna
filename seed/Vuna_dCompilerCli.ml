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
let v_Vuna_dCompilerCli_dcompilerUsageLines = fun prog -> (let vuna_cat0' = ("  ") in (let vuna_cat1' = (prog) in (let vuna_cat2' = (" compile [--no-print] [--no-typecheck] [--typecheck] [--typed] [--root DIR]... <entry.vuna> [out.ml]
  ") in (let vuna_cat3' = (prog) in (let vuna_cat4' = (" check [--root DIR]... (<entry.vuna> | <package-dir>)\n  ") in (let vuna_cat5' = (prog) in (let vuna_cat6' = (" build [--no-print] [DIR] [OUT]        \228\187\142 vuna.toml \230\158\132\229\187\186\229\140\133\239\188\136\233\187\152\232\174\164 DIR=.\239\188\140OUT=DIR/Main.ml\239\188\137
  ") in (let vuna_cat7' = (prog) in (let vuna_cat8' = (" build --split OUT [DIR]               \229\136\134\231\166\187\231\188\150\232\175\145\239\188\154\233\128\144\230\168\161\229\157\151 OCaml \230\186\144\231\160\129 + build.sh \229\134\153\229\136\176 OUT
  ") in (let vuna_cat9' = (prog) in (let vuna_cat10' = (" seed [OUT] [DIR]                      \231\148\159\230\136\144\229\164\154\230\150\135\228\187\182 seed\239\188\136\233\187\152\232\174\164 OUT=seed\239\188\140DIR=.\239\188\137
  ") in (let vuna_cat11' = (prog) in (let vuna_cat12' = (" help\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8'; vuna_cat9'; vuna_cat10'; vuna_cat11'; vuna_cat12'])))))))))))))

let v_Vuna_dCompilerCli_dcompilerUsage = fun prog -> (("usage:\n") ^ (v_Vuna_dCompilerCli_dcompilerUsageLines prog))

let v_Vuna_dCompilerCli_dhelpFor = fun prog -> (let _ = bi_print (v_Vuna_dCompilerCli_dcompilerUsage prog) in 0)

let v_Vuna_dCompilerCli_dusageErr = fun prog -> (let _ = bi_print (v_Vuna_dCompilerCli_dcompilerUsage prog) in 2)

let v_Vuna_dCompilerCli_drootArg = fun prog roots rest k -> (match rest with
  | (dir) :: (rest2) -> k (v_Vuna_dList_dappend roots ((v_Vuna_dPkg_drawRoot dir) :: ([]))) rest2
  | [] -> v_Vuna_dCompilerCli_dusageErr prog
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 65 3 ("case pattern match failure"))

let v_Vuna_dCompilerCli_dcompileEmit = fun printResult typeCheck typed roots entry rest -> (let actualRoots = v_Vuna_dCompile_deffectiveRoots roots in (let result = if typed then v_Vuna_dCompile_dcompileFileTyped actualRoots entry printResult else if typeCheck then v_Vuna_dCompile_dcompileFileChecked actualRoots entry printResult else v_Vuna_dCompile_dcompileFile actualRoots entry printResult in (match result with
  | C_Vuna_dResult_dOk (code) -> (match rest with
  | (out) :: ([]) -> (let _ = bi_write_file out code in 0)
  | _ -> (let _ = bi_print code in 0)
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 77 13 ("case pattern match failure"))
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 75 9 ("case pattern match failure"))))

let rec v_Vuna_dCompilerCli_dcompileParse = fun prog printResult typeCheck typed roots args -> (match args with
  | [] -> v_Vuna_dCompilerCli_dusageErr prog
  | (arg) :: (rest) -> (match arg with
  | "--no-print" -> v_Vuna_dCompilerCli_dcompileParse prog false typeCheck typed roots rest
  | "--no-typecheck" -> v_Vuna_dCompilerCli_dcompileParse prog printResult false false roots rest
  | "--typecheck" -> v_Vuna_dCompilerCli_dcompileParse prog printResult true typed roots rest
  | "--typed" -> v_Vuna_dCompilerCli_dcompileParse prog true true true roots rest
  | "--root" -> v_Vuna_dCompilerCli_drootArg prog roots rest (fun roots2 rest2 -> v_Vuna_dCompilerCli_dcompileParse prog printResult typeCheck typed roots2 rest2)
  | _ -> v_Vuna_dCompilerCli_dcompileEmit printResult typeCheck typed roots arg rest
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 56 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 53 3 ("case pattern match failure"))

let v_Vuna_dCompilerCli_dcompileArgs = fun prog args -> v_Vuna_dCompilerCli_dcompileParse prog true true true [] args

let rec v_Vuna_dCompilerCli_dprintWarnings = fun a0 -> match a0 with
  | ([]) -> 0
  | ((w) :: (rest)) -> (let _ = bi_print (((w) ^ ("\n"))) in v_Vuna_dCompilerCli_dprintWarnings rest)
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 97 1 ("no matching clause for Vuna.CompilerCli.printWarnings")

let v_Vuna_dCompilerCli_dcheckEmit = fun roots path -> (match v_Vuna_dCompile_dcheckFile roots path with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | C_Vuna_dResult_dOk (warnings) -> (let _ = v_Vuna_dCompilerCli_dprintWarnings warnings in 0)
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 93 3 ("case pattern match failure"))

let v_Vuna_dCompilerCli_dcheckPackage = fun dir -> (match v_Vuna_dPkg_dloadPackage dir with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | C_Vuna_dResult_dOk (pkg) -> (match v_Vuna_dCompile_dcompileFileCheckedIn (v_Vuna_dPkg_dpackageName pkg) (v_Vuna_dPkg_dpackageRoots pkg) (v_Vuna_dPkg_dpackageEntry pkg) false with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | C_Vuna_dResult_dOk (code) -> 0
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 104 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 101 3 ("case pattern match failure"))

let rec v_Vuna_dCompilerCli_dcheckParse = fun prog roots args -> (match args with
  | ("--root") :: (rest) -> v_Vuna_dCompilerCli_drootArg prog roots rest (fun roots2 rest2 -> v_Vuna_dCompilerCli_dcheckParse prog roots2 rest2)
  | (path) :: ([]) -> if bi_is_directory path then v_Vuna_dCompilerCli_dcheckPackage path else v_Vuna_dCompilerCli_dcheckEmit (v_Vuna_dCompile_deffectiveRoots roots) path
  | _ -> v_Vuna_dCompilerCli_dusageErr prog
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 85 3 ("case pattern match failure"))

let v_Vuna_dCompilerCli_dcheckArgs = fun prog args -> v_Vuna_dCompilerCli_dcheckParse prog [] args

let v_Vuna_dCompilerCli_dsplitRun = fun outDir dir -> (let _ = bi_make_dir outDir in (match v_Vuna_dSplitCli_dbuildSplit dir outDir with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | C_Vuna_dResult_dOk (n) -> (let _ = bi_print ((let vuna_cat0' = ("wrote ") in (let vuna_cat1' = (bi_str_from_int n) in (let vuna_cat2' = (" files to ") in (let vuna_cat3' = (outDir) in (let vuna_cat4' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))) in 0)
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 125 6 ("case pattern match failure")))

let v_Vuna_dCompilerCli_dbuildSplitCmd = fun prog outDir args -> (match args with
  | [] -> v_Vuna_dCompilerCli_dsplitRun outDir "."
  | (dir) :: ([]) -> v_Vuna_dCompilerCli_dsplitRun outDir dir
  | _ -> v_Vuna_dCompilerCli_dusageErr prog
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 118 3 ("case pattern match failure"))

let v_Vuna_dCompilerCli_dseedRun = fun out dir -> (let _ = bi_make_dir out in (match v_Vuna_dSplitCli_dseedSplit dir out with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | C_Vuna_dResult_dOk (n) -> (let _ = bi_print ((let vuna_cat0' = ("wrote ") in (let vuna_cat1' = (bi_str_from_int n) in (let vuna_cat2' = (" files to ") in (let vuna_cat3' = (out) in (let vuna_cat4' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))) in 0)
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 140 6 ("case pattern match failure")))

let v_Vuna_dCompilerCli_dseedArgs = fun prog args -> (match args with
  | [] -> v_Vuna_dCompilerCli_dseedRun "seed" "."
  | (out) :: ([]) -> v_Vuna_dCompilerCli_dseedRun out "."
  | (out) :: ((dir) :: ([])) -> v_Vuna_dCompilerCli_dseedRun out dir
  | _ -> v_Vuna_dCompilerCli_dusageErr prog
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 132 3 ("case pattern match failure"))

let v_Vuna_dCompilerCli_ddefaultDir = fun dir -> (match dir with
  | C_Vuna_dMaybe_dJust (dir2) -> dir2
  | C_Vuna_dMaybe_dNothing -> "."
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 168 3 ("case pattern match failure"))

let v_Vuna_dCompilerCli_ddefaultOut = fun dir out -> (match out with
  | C_Vuna_dMaybe_dJust (out2) -> out2
  | C_Vuna_dMaybe_dNothing -> (let dir2 = v_Vuna_dCompilerCli_ddefaultDir dir in if v_vuna_ueq_ustr dir2 "." then "Main.ml" else ((dir2) ^ ("/Main.ml")))
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 173 3 ("case pattern match failure"))

let v_Vuna_dCompilerCli_dbuildRun = fun printResult dir out -> (match v_Vuna_dPkg_dloadPackage dir with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | C_Vuna_dResult_dOk (pkg) -> (match v_Vuna_dCompile_dcompileFileTypedIn (v_Vuna_dPkg_dpackageName pkg) (v_Vuna_dPkg_dpackageRoots pkg) (v_Vuna_dPkg_dpackageEntry pkg) printResult with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | C_Vuna_dResult_dOk (code) -> (let parent = v_Vuna_dPair_dfirstOf (v_Vuna_dBase_dsplitPath out) in (let _ = if v_vuna_ueq_ustr parent "" then 0 else bi_make_dir parent in (let _ = bi_write_file out code in (let _ = bi_print ((let vuna_cat0' = ("wrote ") in (let vuna_cat1' = (out) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 0))))
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 183 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 180 3 ("case pattern match failure"))

let rec v_Vuna_dCompilerCli_dbuildParse = fun prog printResult dir out args -> (match args with
  | [] -> v_Vuna_dCompilerCli_dbuildRun printResult (v_Vuna_dCompilerCli_ddefaultDir dir) (v_Vuna_dCompilerCli_ddefaultOut dir out)
  | (arg) :: (rest) -> (match arg with
  | "--no-print" -> v_Vuna_dCompilerCli_dbuildParse prog false dir out rest
  | "--out" -> (match rest with
  | (out2) :: (rest2) -> v_Vuna_dCompilerCli_dbuildParse prog printResult dir (C_Vuna_dMaybe_dJust (out2)) rest2
  | [] -> v_Vuna_dCompilerCli_dusageErr prog
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 153 11 ("case pattern match failure"))
  | _ -> (match dir with
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dCompilerCli_dbuildParse prog printResult (C_Vuna_dMaybe_dJust (arg)) out rest
  | C_Vuna_dMaybe_dJust (dir2) -> (match out with
  | C_Vuna_dMaybe_dNothing -> (match rest with
  | [] -> v_Vuna_dCompilerCli_dbuildRun printResult dir2 arg
  | _ -> v_Vuna_dCompilerCli_dusageErr prog
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 162 19 ("case pattern match failure"))
  | C_Vuna_dMaybe_dJust (out2) -> v_Vuna_dCompilerCli_dusageErr prog
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 160 15 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 157 11 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 150 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 147 3 ("case pattern match failure"))

let v_Vuna_dCompilerCli_dbuildArgs = fun prog args -> (match args with
  | ("--split") :: ((outDir) :: (rest)) -> v_Vuna_dCompilerCli_dbuildSplitCmd prog outDir rest
  | _ -> v_Vuna_dCompilerCli_dbuildParse prog true C_Vuna_dMaybe_dNothing C_Vuna_dMaybe_dNothing args
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 113 3 ("case pattern match failure"))

let v_Vuna_dCompilerCli_drunCompilerCliFor = fun prog args -> (match args with
  | [] -> v_Vuna_dCompilerCli_dusageErr prog
  | (arg) :: (rest) -> (match arg with
  | "compile" -> v_Vuna_dCompilerCli_dcompileArgs prog rest
  | "check" -> v_Vuna_dCompilerCli_dcheckArgs prog rest
  | "build" -> v_Vuna_dCompilerCli_dbuildArgs prog rest
  | "seed" -> v_Vuna_dCompilerCli_dseedArgs prog rest
  | "help" -> v_Vuna_dCompilerCli_dhelpFor prog
  | "--help" -> v_Vuna_dCompilerCli_dhelpFor prog
  | _ -> v_Vuna_dCompilerCli_dcompileArgs prog args
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 33 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 30 3 ("case pattern match failure"))

let v_Vuna_dCompilerCli_drunCompilerCli = fun args -> v_Vuna_dCompilerCli_drunCompilerCliFor "vuna-compiler" args
