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
open Vuna_dTestRunner
open Vuna_dSplitCli
open Vuna_dLint
let v_Vuna_dCli_dusage = "usage:
  vuna compile [--no-print] [--no-typecheck] [--typecheck] [--typed] [--root DIR]... <entry.vuna> [out.ml]
  vuna check [--root DIR]... (<entry.vuna> | <package-dir>)
  vuna lint [--fix] <file.vuna>...
  vuna interp [--root DIR]... <file.vuna>
  vuna build [--no-print] [DIR] [OUT]        \228\187\142 vuna.toml \230\158\132\229\187\186\229\140\133\239\188\136\233\187\152\232\174\164 DIR=.\239\188\140OUT=DIR/Main.ml\239\188\137
  vuna build --split OUT [DIR]               \229\136\134\231\166\187\231\188\150\232\175\145\239\188\154\233\128\144\230\168\161\229\157\151 OCaml \230\186\144\231\160\129 + build.sh \229\134\153\229\136\176 OUT
  vuna seed [OUT] [DIR]                      \231\148\159\230\136\144\229\164\154\230\150\135\228\187\182 seed\239\188\136\233\187\152\232\174\164 OUT=seed\239\188\140DIR=.\239\188\137
  vuna test [DIR]                           \232\191\144\232\161\140\229\140\133\229\134\133 test/*.vuna\239\188\136main : String\239\188\140\231\169\186\228\184\178\233\128\154\232\191\135\239\188\137
  vuna fmt [--check] [PATH]...              \230\160\188\229\188\143\229\140\150\239\188\136PATH \229\143\175\228\184\186\230\150\135\228\187\182\230\136\150\231\155\174\229\189\149\239\188\155\231\156\129\231\149\165 = \229\140\133 lib/app/test\239\188\137
  vuna repl [--root DIR]...                 \228\186\164\228\186\146\229\188\143 REPL
  vuna doc [DIR] [OUT]                      \231\148\159\230\136\144 API \230\150\135\230\161\163\239\188\136\233\187\152\232\174\164 OUT=DIR/docs/api.md\239\188\137
  vuna help
"

let v_Vuna_dCli_dhelp = fun () -> (let _ = bi_print v_Vuna_dCli_dusage in 0)

let v_Vuna_dCli_dusageError = fun () -> (let _ = bi_print v_Vuna_dCli_dusage in 2)

let v_Vuna_dCli_dprintErr = fun msg -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (msg) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 0)

let v_Vuna_dCli_drootArg = fun roots rest k -> (match rest with
  | (dir) :: (rest2) -> k (v_Vuna_dList_dappend roots ((v_Vuna_dPkg_drawRoot dir) :: ([]))) rest2
  | [] -> v_Vuna_dCli_dusageError ()
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 86 3 ("case pattern match failure"))

let v_Vuna_dCli_dcompileEmit = fun printResult typeCheck typed roots entry rest -> (let actualRoots = v_Vuna_dInterp_deffectiveRoots roots in (let result = if typed then v_Vuna_dInterp_dcompileFileTyped actualRoots entry printResult else if typeCheck then v_Vuna_dInterp_dcompileFileChecked actualRoots entry printResult else v_Vuna_dInterp_dcompileFile actualRoots entry printResult in (match result with
  | C_Vuna_dResult_dOk (code) -> (match rest with
  | (out) :: ([]) -> (let _ = bi_write_file out code in 0)
  | _ -> (let _ = bi_print code in 0)
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 98 13 ("case pattern match failure"))
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 96 9 ("case pattern match failure"))))

let rec v_Vuna_dCli_dcompileParse = fun printResult typeCheck typed roots args -> (match args with
  | [] -> v_Vuna_dCli_dusageError ()
  | (arg) :: (rest) -> (match arg with
  | "--no-print" -> v_Vuna_dCli_dcompileParse false typeCheck typed roots rest
  | "--no-typecheck" -> v_Vuna_dCli_dcompileParse printResult false false roots rest
  | "--typecheck" -> v_Vuna_dCli_dcompileParse printResult true typed roots rest
  | "--typed" -> v_Vuna_dCli_dcompileParse true true true roots rest
  | "--root" -> v_Vuna_dCli_drootArg roots rest (fun roots2 rest2 -> v_Vuna_dCli_dcompileParse printResult typeCheck typed roots2 rest2)
  | _ -> v_Vuna_dCli_dcompileEmit printResult typeCheck typed roots arg rest
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 77 7 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 74 3 ("case pattern match failure"))

let v_Vuna_dCli_dcompileArgs = fun args -> v_Vuna_dCli_dcompileParse true true true [] args

let v_Vuna_dCli_dinterpEmit = fun roots path -> (let output = v_Vuna_dInterp_dinterpretFile roots path in (let _ = bi_print (((output) ^ ("\n"))) in if v_Vuna_dString_dstartsWith "error:" output then 2 else 0))

let rec v_Vuna_dCli_dinterpParse = fun roots args -> (match args with
  | ("--root") :: (rest) -> v_Vuna_dCli_drootArg roots rest (fun roots2 rest2 -> v_Vuna_dCli_dinterpParse roots2 rest2)
  | (path) :: ([]) -> v_Vuna_dCli_dinterpEmit (v_Vuna_dInterp_deffectiveRoots roots) path
  | _ -> v_Vuna_dCli_dusageError ()
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 106 3 ("case pattern match failure"))

let v_Vuna_dCli_dinterpArgs = fun args -> v_Vuna_dCli_dinterpParse [] args

let rec v_Vuna_dCli_dprintWarnings = fun a0 -> match a0 with
  | ([]) -> 0
  | ((w) :: (rest)) -> (let _ = bi_print (((w) ^ ("\n"))) in v_Vuna_dCli_dprintWarnings rest)
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 131 1 ("no matching clause for Vuna.Cli.printWarnings")

let v_Vuna_dCli_dcheckEmit = fun roots path -> (match v_Vuna_dInterp_dcheckFile roots path with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | C_Vuna_dResult_dOk (warnings) -> (let _ = v_Vuna_dCli_dprintWarnings warnings in 0)
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 127 3 ("case pattern match failure"))

let v_Vuna_dCli_dcheckPackage = fun dir -> (match v_Vuna_dPkg_dloadPackage dir with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | C_Vuna_dResult_dOk (pkg) -> (match v_Vuna_dInterp_dcompileFileCheckedIn (v_Vuna_dPkg_dpackageName pkg) (v_Vuna_dPkg_dpackageRoots pkg) (v_Vuna_dPkg_dpackageEntry pkg) false with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | C_Vuna_dResult_dOk (code) -> 0
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 138 7 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 135 3 ("case pattern match failure"))

let rec v_Vuna_dCli_dcheckParse = fun roots args -> (match args with
  | ("--root") :: (rest) -> v_Vuna_dCli_drootArg roots rest (fun roots2 rest2 -> v_Vuna_dCli_dcheckParse roots2 rest2)
  | (path) :: ([]) -> if bi_is_directory path then v_Vuna_dCli_dcheckPackage path else v_Vuna_dCli_dcheckEmit (v_Vuna_dInterp_deffectiveRoots roots) path
  | _ -> v_Vuna_dCli_dusageError ()
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 119 3 ("case pattern match failure"))

let v_Vuna_dCli_dcheckArgs = fun args -> v_Vuna_dCli_dcheckParse [] args

let v_Vuna_dCli_dsplitRun = fun outDir dir -> (let _ = bi_make_dir outDir in (match v_Vuna_dSplitCli_dbuildSplit dir outDir with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | C_Vuna_dResult_dOk (n) -> (let _ = bi_print ((let vuna_cat0' = ("wrote ") in (let vuna_cat1' = (bi_str_from_int n) in (let vuna_cat2' = (" files to ") in (let vuna_cat3' = (outDir) in (let vuna_cat4' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))) in 0)
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 159 6 ("case pattern match failure")))

let v_Vuna_dCli_dbuildSplitCmd = fun outDir args -> (match args with
  | [] -> v_Vuna_dCli_dsplitRun outDir "."
  | (dir) :: ([]) -> v_Vuna_dCli_dsplitRun outDir dir
  | _ -> v_Vuna_dCli_dusageError ()
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 152 3 ("case pattern match failure"))

let v_Vuna_dCli_dseedRun = fun out dir -> (let _ = bi_make_dir out in (match v_Vuna_dSplitCli_dseedSplit dir out with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | C_Vuna_dResult_dOk (n) -> (let _ = bi_print ((let vuna_cat0' = ("wrote ") in (let vuna_cat1' = (bi_str_from_int n) in (let vuna_cat2' = (" files to ") in (let vuna_cat3' = (out) in (let vuna_cat4' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))) in 0)
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 174 6 ("case pattern match failure")))

let v_Vuna_dCli_dseedArgs = fun args -> (match args with
  | [] -> v_Vuna_dCli_dseedRun "seed" "."
  | (out) :: ([]) -> v_Vuna_dCli_dseedRun out "."
  | (out) :: ((dir) :: ([])) -> v_Vuna_dCli_dseedRun out dir
  | _ -> v_Vuna_dCli_dusageError ()
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 166 3 ("case pattern match failure"))

let v_Vuna_dCli_ddefaultDir = fun dir -> (match dir with
  | C_Vuna_dMaybe_dJust (dir2) -> dir2
  | C_Vuna_dMaybe_dNothing -> "."
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 202 3 ("case pattern match failure"))

let v_Vuna_dCli_ddefaultOut = fun dir out -> (match out with
  | C_Vuna_dMaybe_dJust (out2) -> out2
  | C_Vuna_dMaybe_dNothing -> (let dir2 = v_Vuna_dCli_ddefaultDir dir in if v_vuna_ueq_ustr dir2 "." then "Main.ml" else ((dir2) ^ ("/Main.ml")))
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 207 3 ("case pattern match failure"))

let v_Vuna_dCli_dbuildRun = fun printResult dir out -> (match v_Vuna_dPkg_dloadPackage dir with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | C_Vuna_dResult_dOk (pkg) -> (match v_Vuna_dInterp_dcompileFileTypedIn (v_Vuna_dPkg_dpackageName pkg) (v_Vuna_dPkg_dpackageRoots pkg) (v_Vuna_dPkg_dpackageEntry pkg) printResult with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | C_Vuna_dResult_dOk (code) -> (let parent = v_Vuna_dPair_dfirstOf (v_Vuna_dFiles_dsplitPath out) in (let _ = if v_vuna_ueq_ustr parent "" then 0 else bi_make_dir parent in (let _ = bi_write_file out code in (let _ = bi_print ((let vuna_cat0' = ("wrote ") in (let vuna_cat1' = (out) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 0))))
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 217 7 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 214 3 ("case pattern match failure"))

let rec v_Vuna_dCli_dbuildParse = fun printResult dir out args -> (match args with
  | [] -> v_Vuna_dCli_dbuildRun printResult (v_Vuna_dCli_ddefaultDir dir) (v_Vuna_dCli_ddefaultOut dir out)
  | (arg) :: (rest) -> (match arg with
  | "--no-print" -> v_Vuna_dCli_dbuildParse false dir out rest
  | "--out" -> (match rest with
  | (out2) :: (rest2) -> v_Vuna_dCli_dbuildParse printResult dir (C_Vuna_dMaybe_dJust (out2)) rest2
  | [] -> v_Vuna_dCli_dusageError ()
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 187 11 ("case pattern match failure"))
  | _ -> (match dir with
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dCli_dbuildParse printResult (C_Vuna_dMaybe_dJust (arg)) out rest
  | C_Vuna_dMaybe_dJust (dir2) -> (match out with
  | C_Vuna_dMaybe_dNothing -> (match rest with
  | [] -> v_Vuna_dCli_dbuildRun printResult dir2 arg
  | _ -> v_Vuna_dCli_dusageError ()
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 196 19 ("case pattern match failure"))
  | C_Vuna_dMaybe_dJust (out2) -> v_Vuna_dCli_dusageError ()
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 194 15 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 191 11 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 184 7 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 181 3 ("case pattern match failure"))

let v_Vuna_dCli_dbuildArgs = fun args -> (match args with
  | ("--split") :: ((outDir) :: (rest)) -> v_Vuna_dCli_dbuildSplitCmd outDir rest
  | _ -> v_Vuna_dCli_dbuildParse true C_Vuna_dMaybe_dNothing C_Vuna_dMaybe_dNothing args
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 147 3 ("case pattern match failure"))

let v_Vuna_dCli_dtestRun = fun dir -> (match v_Vuna_dPkg_dloadPackage dir with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | C_Vuna_dResult_dOk (pkg) -> v_Vuna_dTestRunner_drunTests pkg (v_Vuna_dPkg_dpackageRoots pkg)
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 238 3 ("case pattern match failure"))

let v_Vuna_dCli_dtestArgs = fun args -> (match args with
  | [] -> v_Vuna_dCli_dtestRun "."
  | (dir) :: ([]) -> v_Vuna_dCli_dtestRun dir
  | ("--root") :: (rest) -> v_Vuna_dCli_dusageError ()
  | _ -> v_Vuna_dCli_dusageError ()
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 231 3 ("case pattern match failure"))

let v_Vuna_dCli_dfmtDefaultTargets = fun () -> (match v_Vuna_dPkg_dfindManifestDir "." with
  | C_Vuna_dResult_dErr (e) -> ("lib") :: (("app") :: (("test") :: ([])))
  | C_Vuna_dResult_dOk (dir) -> (((dir) ^ ("/lib"))) :: ((((dir) ^ ("/app"))) :: ((((dir) ^ ("/test"))) :: ([])))
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 261 3 ("case pattern match failure"))

let v_Vuna_dCli_dexpandPath = fun path -> if bi_is_directory path then v_Vuna_dFiles_dcollectVunaFiles path else (path) :: ([])

let rec v_Vuna_dCli_dfmtFiles = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (check, [], changed) -> if (if (check) then (v_vuna_ugt_uint changed 0) else false) then (let _ = bi_print (((bi_str_from_int changed) ^ (" file(s) need formatting\n"))) in 1) else 0
  | (check, (path) :: (rest), changed) -> (let original = bi_read_file path in (match v_Vuna_dFmt_dformatSource original with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (path) in (let vuna_cat2' = (": ") in (let vuna_cat3' = (e) in (let vuna_cat4' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))) in 2)
  | C_Vuna_dResult_dOk (formatted) -> if v_vuna_ueq_ustr formatted original then v_Vuna_dCli_dfmtFiles check rest changed else if check then (let _ = bi_print ((let vuna_cat0' = ("would reformat: ") in (let vuna_cat1' = (path) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in v_Vuna_dCli_dfmtFiles check rest (bi_add changed 1)) else (let _ = bi_write_file path formatted in (let _ = bi_print ((let vuna_cat0' = ("formatted ") in (let vuna_cat1' = (path) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in v_Vuna_dCli_dfmtFiles check rest (bi_add changed 1)))
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 275 6 ("case pattern match failure")))
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 268 1 ("no matching clause for Vuna.Cli.fmtFiles")

let v_Vuna_dCli_dfmtRun = fun a0 a1 -> match (a0, a1) with
  | (check, []) -> v_Vuna_dCli_dfmtFiles check (v_Vuna_dCli_dfmtDefaultTargets ()) 0
  | (check, paths) -> v_Vuna_dCli_dfmtFiles check (v_Vuna_dList_dconcatMap v_Vuna_dCli_dexpandPath paths) 0
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 256 1 ("no matching clause for Vuna.Cli.fmtRun")

let rec v_Vuna_dCli_dfmtParse = fun check paths args -> (match args with
  | [] -> v_Vuna_dCli_dfmtRun check paths
  | (arg) :: (rest) -> (match arg with
  | "--check" -> v_Vuna_dCli_dfmtParse true paths rest
  | _ -> v_Vuna_dCli_dfmtParse check (v_Vuna_dList_dappend paths ((arg) :: ([]))) rest
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 252 7 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 249 3 ("case pattern match failure"))

let v_Vuna_dCli_dfmtArgs = fun args -> v_Vuna_dCli_dfmtParse false [] args

let rec v_Vuna_dCli_dreplParse = fun roots args -> (match args with
  | ("--root") :: (rest) -> v_Vuna_dCli_drootArg roots rest (fun roots2 rest2 -> v_Vuna_dCli_dreplParse roots2 rest2)
  | [] -> v_Vuna_dRepl_drunRepl (v_Vuna_dInterp_deffectiveRoots roots)
  | _ -> v_Vuna_dCli_dusageError ()
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 294 3 ("case pattern match failure"))

let v_Vuna_dCli_dreplArgs = fun args -> v_Vuna_dCli_dreplParse [] args

let v_Vuna_dCli_ddocDefaultOut = fun dir -> if v_vuna_ueq_ustr dir "." then "docs/api.md" else ((dir) ^ ("/docs/api.md"))

let v_Vuna_dCli_ddocRun = fun dir out -> v_Vuna_dDoc_drunDoc dir out

let v_Vuna_dCli_ddocArgs = fun args -> (match args with
  | [] -> v_Vuna_dCli_ddocRun "." "docs/api.md"
  | (dir) :: ([]) -> v_Vuna_dCli_ddocRun dir (v_Vuna_dCli_ddocDefaultOut dir)
  | (dir) :: ((out) :: ([])) -> v_Vuna_dCli_ddocRun dir out
  | _ -> v_Vuna_dCli_dusageError ()
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 304 3 ("case pattern match failure"))

let v_Vuna_dCli_drunCli = fun args -> (match args with
  | [] -> v_Vuna_dCli_dusageError ()
  | (arg) :: (rest) -> (match arg with
  | "compile" -> v_Vuna_dCli_dcompileArgs rest
  | "check" -> v_Vuna_dCli_dcheckArgs rest
  | "lint" -> v_Vuna_dLint_drunLint rest
  | "interp" -> v_Vuna_dCli_dinterpArgs rest
  | "build" -> v_Vuna_dCli_dbuildArgs rest
  | "seed" -> v_Vuna_dCli_dseedArgs rest
  | "test" -> v_Vuna_dCli_dtestArgs rest
  | "fmt" -> v_Vuna_dCli_dfmtArgs rest
  | "repl" -> v_Vuna_dCli_dreplArgs rest
  | "doc" -> v_Vuna_dCli_ddocArgs rest
  | "help" -> v_Vuna_dCli_dhelp ()
  | "--help" -> v_Vuna_dCli_dhelp ()
  | _ -> v_Vuna_dCli_dcompileArgs args
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 46 7 ("case pattern match failure"))
  | _ -> vuna_fail "./lib/Vuna/Cli.vuna" 43 3 ("case pattern match failure"))
