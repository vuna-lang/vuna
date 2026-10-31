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
open Vuna_dTypecheck
open Vuna_dSplit
open Vuna_dTypedCodegen
open Vuna_dCore
open Vuna_dElab
open Vuna_dCoreCodegen
open Vuna_dDt
open Vuna_dCompile
open Vuna_dSplitCli
let v_Vuna_dCompilerCli_dcompilerUsageLines = fun prog -> (let vuna_cat0' = ("  ") in (let vuna_cat1' = (prog) in (let vuna_cat2' = (" compile [--dt] [--no-print] [--root DIR]... <entry.vuna> [out.ml]\n  ") in (let vuna_cat3' = (prog) in (let vuna_cat4' = (" check [--dt] [--root DIR]... (<entry.vuna> | <package-dir>)\n  ") in (let vuna_cat5' = (prog) in (let vuna_cat6' = (" build [DIR [OUT]]              \228\187\142 vuna.toml \230\158\132\229\187\186\229\140\133\239\188\136\233\187\152\232\174\164 DIR=.\239\188\140OUT=DIR/Main.ml\239\188\137
  ") in (let vuna_cat7' = (prog) in (let vuna_cat8' = (" build --split OUT [DIR]        \229\136\134\231\166\187\231\188\150\232\175\145\239\188\154\233\128\144\230\168\161\229\157\151 OCaml \230\186\144\231\160\129 + build.sh \229\134\153\229\136\176 OUT
  ") in (let vuna_cat9' = (prog) in (let vuna_cat10' = (" seed [OUT [DIR]]               \231\148\159\230\136\144\229\164\154\230\150\135\228\187\182 seed\239\188\136\233\187\152\232\174\164 OUT=seed\239\188\140DIR=.\239\188\137
  --dt                            experimental DT (core TT) single-file pipeline (M13)
  ") in (let vuna_cat11' = (prog) in (let vuna_cat12' = (" help, -h\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8'; vuna_cat9'; vuna_cat10'; vuna_cat11'; vuna_cat12'])))))))))))))

let v_Vuna_dCompilerCli_dcompilerUsage = fun prog -> (("usage:\n") ^ (v_Vuna_dCompilerCli_dcompilerUsageLines prog))

let rec v_Vuna_dCompilerCli_danyHelp = fun a0 -> match a0 with
  | ([]) -> false
  | ((arg) :: (rest)) -> if (if (v_vuna_ueq_ustr arg "-h") then true else (v_vuna_ueq_ustr arg "--help")) then true else v_Vuna_dCompilerCli_danyHelp rest
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 55 1 ("no matching clause for Vuna.CompilerCli.anyHelp")

let v_Vuna_dCompilerCli_dhelpFor = fun prog -> (let _ = bi_print (v_Vuna_dCompilerCli_dcompilerUsage prog) in 0)

let v_Vuna_dCompilerCli_dusageErr = fun prog -> (let _ = bi_print (v_Vuna_dCompilerCli_dcompilerUsage prog) in 2)

let v_Vuna_dCompilerCli_dmissingCommand = fun prog arg -> (let msg = (let vuna_cat0' = ("error: missing command before `") in (let vuna_cat1' = (arg) in (let vuna_cat2' = ("`\nrun `") in (let vuna_cat3' = (prog) in (let vuna_cat4' = (" help` (or `") in (let vuna_cat5' = (prog) in (let vuna_cat6' = (" compile ...`)\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6']))))))) in (let _ = bi_print msg in 2))

let v_Vuna_dCompilerCli_dunknownCommand = fun prog arg -> (let _ = bi_print ((let vuna_cat0' = ("error: unknown command `") in (let vuna_cat1' = (arg) in (let vuna_cat2' = ("`\nrun `") in (let vuna_cat3' = (prog) in (let vuna_cat4' = (" help`\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))) in 2)

let v_Vuna_dCompilerCli_dremovedHint = fun flag -> (match flag with
  | "--no-typecheck" -> "use `vuna interp` for unchecked execution"
  | "--typecheck" -> "typed codegen is always enabled"
  | "--typed" -> "typed codegen is always enabled"
  | "--out" -> "use the positional OUT argument"
  | _ -> ""
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 71 3 ("case pattern match failure"))

let v_Vuna_dCompilerCli_dremovedFlag = fun prog flag -> (match v_Vuna_dCompilerCli_dremovedHint flag with
  | "" -> v_Vuna_dCompilerCli_dusageErr prog
  | hint -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (flag) in (let vuna_cat2' = (" has been removed; ") in (let vuna_cat3' = (hint) in (let vuna_cat4' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))) in 2)
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 79 3 ("case pattern match failure"))

let v_Vuna_dCompilerCli_dinvalidFlag = fun prog flag -> (match flag with
  | "--no-print" -> (let _ = bi_print "error: --no-print is only valid for `compile`; `build` never prints main's result
" in 2)
  | _ -> v_Vuna_dCompilerCli_dremovedFlag prog flag
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 84 3 ("case pattern match failure"))

let rec v_Vuna_dCompilerCli_danyDt = fun a0 -> match a0 with
  | ([]) -> false
  | ((arg) :: (rest)) -> if v_vuna_ueq_ustr arg "--dt" then true else v_Vuna_dCompilerCli_danyDt rest
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 90 1 ("no matching clause for Vuna.CompilerCli.anyDt")

let v_Vuna_dCompilerCli_ddtCmdErr = fun prog -> (let _ = bi_print "error: --dt is only supported by compile/check/interp (M13 single-file mode)\n" in 2)

let v_Vuna_dCompilerCli_ddtRootErr = fun prog -> (let _ = bi_print "error: --dt does not support --root yet (DT single-file mode)\n" in 2)

let v_Vuna_dCompilerCli_ddtDirErr = fun prog -> (let _ = bi_print "error: --dt only supports a single file (DT packages come later)\n" in 2)

let v_Vuna_dCompilerCli_drootArg = fun prog roots rest k -> (match rest with
  | (dir) :: (rest2) -> k (v_Vuna_dList_dappend roots ((v_Vuna_dPkg_drawRoot dir) :: ([]))) rest2
  | [] -> v_Vuna_dCompilerCli_dusageErr prog
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 121 3 ("case pattern match failure"))

let v_Vuna_dCompilerCli_dcompileEmit = fun prog printResult dt hasRoot roots entry rest -> if dt then if hasRoot then v_Vuna_dCompilerCli_ddtRootErr prog else (match v_Vuna_dCompile_dcompileFileDt entry printResult with
  | C_Vuna_dResult_dOk (code) -> (match rest with
  | [] -> (let _ = bi_print code in 0)
  | (out) :: ([]) -> (let _ = bi_write_file out code in 0)
  | _ -> v_Vuna_dCompilerCli_dusageErr prog
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 131 11 ("case pattern match failure"))
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 129 7 ("case pattern match failure")) else (let actualRoots = v_Vuna_dCompile_deffectiveRoots roots in (match v_Vuna_dCompile_dcompileFileTyped actualRoots entry printResult with
  | C_Vuna_dResult_dOk (code) -> (match rest with
  | [] -> (let _ = bi_print code in 0)
  | (out) :: ([]) -> (let _ = bi_write_file out code in 0)
  | _ -> v_Vuna_dCompilerCli_dusageErr prog
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 140 12 ("case pattern match failure"))
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 138 8 ("case pattern match failure")))

let rec v_Vuna_dCompilerCli_dcompileParse = fun prog printResult dt hasRoot roots args -> (match args with
  | [] -> v_Vuna_dCompilerCli_dusageErr prog
  | (arg) :: (rest) -> (match arg with
  | "--dt" -> v_Vuna_dCompilerCli_dcompileParse prog printResult true hasRoot roots rest
  | "--no-print" -> v_Vuna_dCompilerCli_dcompileParse prog false dt hasRoot roots rest
  | "--root" -> v_Vuna_dCompilerCli_drootArg prog roots rest (fun roots2 rest2 -> v_Vuna_dCompilerCli_dcompileParse prog printResult dt true roots2 rest2)
  | _ -> if v_Vuna_dString_dstartsWith "-" arg then v_Vuna_dCompilerCli_dremovedFlag prog arg else v_Vuna_dCompilerCli_dcompileEmit prog printResult dt hasRoot roots arg rest
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 112 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 109 3 ("case pattern match failure"))

let v_Vuna_dCompilerCli_dcompileArgs = fun prog args -> v_Vuna_dCompilerCli_dcompileParse prog true false false [] args

let rec v_Vuna_dCompilerCli_dprintWarnings = fun a0 -> match a0 with
  | ([]) -> 0
  | ((w) :: (rest)) -> (let _ = bi_print (((w) ^ ("\n"))) in v_Vuna_dCompilerCli_dprintWarnings rest)
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 172 1 ("no matching clause for Vuna.CompilerCli.printWarnings")

let v_Vuna_dCompilerCli_dcheckEmitDt = fun path -> (match v_Vuna_dCompile_dcheckFileDt path with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | C_Vuna_dResult_dOk (warnings) -> (let _ = v_Vuna_dCompilerCli_dprintWarnings warnings in 0)
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 163 3 ("case pattern match failure"))

let v_Vuna_dCompilerCli_dcheckEmit = fun roots path -> (match v_Vuna_dCompile_dcheckFile roots path with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | C_Vuna_dResult_dOk (warnings) -> (let _ = v_Vuna_dCompilerCli_dprintWarnings warnings in 0)
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 168 3 ("case pattern match failure"))

let v_Vuna_dCompilerCli_dcheckPackage = fun dir -> (match v_Vuna_dPkg_dloadPackage dir with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | C_Vuna_dResult_dOk (pkg) -> (match v_Vuna_dCompile_dcheckFileIn (v_Vuna_dPkg_dpackageName pkg) (v_Vuna_dPkg_dpackageRoots pkg) (v_Vuna_dPkg_dpackageEntry pkg) with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | C_Vuna_dResult_dOk (warnings) -> (let _ = v_Vuna_dCompilerCli_dprintWarnings warnings in 0)
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 179 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 176 3 ("case pattern match failure"))

let rec v_Vuna_dCompilerCli_dcheckParse = fun prog dt hasRoot roots args -> (match args with
  | ("--dt") :: (rest) -> v_Vuna_dCompilerCli_dcheckParse prog true hasRoot roots rest
  | ("--root") :: (rest) -> v_Vuna_dCompilerCli_drootArg prog roots rest (fun roots2 rest2 -> v_Vuna_dCompilerCli_dcheckParse prog dt true roots2 rest2)
  | (arg) :: ([]) -> if v_Vuna_dString_dstartsWith "-" arg then v_Vuna_dCompilerCli_dremovedFlag prog arg else if dt then if hasRoot then v_Vuna_dCompilerCli_ddtRootErr prog else if bi_is_directory arg then v_Vuna_dCompilerCli_ddtDirErr prog else v_Vuna_dCompilerCli_dcheckEmitDt arg else if bi_is_directory arg then v_Vuna_dCompilerCli_dcheckPackage arg else v_Vuna_dCompilerCli_dcheckEmit (v_Vuna_dCompile_deffectiveRoots roots) arg
  | _ -> v_Vuna_dCompilerCli_dusageErr prog
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 149 3 ("case pattern match failure"))

let v_Vuna_dCompilerCli_dcheckArgs = fun prog args -> v_Vuna_dCompilerCli_dcheckParse prog false false [] args

let v_Vuna_dCompilerCli_dsplitRun = fun outDir dir -> (let _ = bi_make_dir outDir in (match v_Vuna_dSplitCli_dbuildSplit dir outDir with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | C_Vuna_dResult_dOk (n) -> (let _ = bi_print ((let vuna_cat0' = ("wrote ") in (let vuna_cat1' = (bi_str_from_int n) in (let vuna_cat2' = (" files to ") in (let vuna_cat3' = (outDir) in (let vuna_cat4' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))) in 0)
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 202 6 ("case pattern match failure")))

let v_Vuna_dCompilerCli_dbuildSplitCmd = fun prog outDir args -> (match args with
  | [] -> v_Vuna_dCompilerCli_dsplitRun outDir "."
  | (dir) :: ([]) -> if v_Vuna_dString_dstartsWith "-" dir then v_Vuna_dCompilerCli_dinvalidFlag prog dir else v_Vuna_dCompilerCli_dsplitRun outDir dir
  | _ -> v_Vuna_dCompilerCli_dusageErr prog
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 194 3 ("case pattern match failure"))

let v_Vuna_dCompilerCli_dseedRun = fun out dir -> (let _ = bi_make_dir out in (match v_Vuna_dSplitCli_dseedSplit dir out with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | C_Vuna_dResult_dOk (n) -> (let _ = bi_print ((let vuna_cat0' = ("wrote ") in (let vuna_cat1' = (bi_str_from_int n) in (let vuna_cat2' = (" files to ") in (let vuna_cat3' = (out) in (let vuna_cat4' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))) in 0)
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 221 6 ("case pattern match failure")))

let v_Vuna_dCompilerCli_dseedArgs = fun prog args -> (match args with
  | [] -> v_Vuna_dCompilerCli_dseedRun "seed" "."
  | (out) :: (rest) -> if v_Vuna_dString_dstartsWith "-" out then v_Vuna_dCompilerCli_dinvalidFlag prog out else (match rest with
  | [] -> v_Vuna_dCompilerCli_dseedRun out "."
  | (dir) :: ([]) -> if v_Vuna_dString_dstartsWith "-" dir then v_Vuna_dCompilerCli_dinvalidFlag prog dir else v_Vuna_dCompilerCli_dseedRun out dir
  | _ -> v_Vuna_dCompilerCli_dusageErr prog
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 213 12 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 209 3 ("case pattern match failure"))

let v_Vuna_dCompilerCli_ddefaultDir = fun dir -> (match dir with
  | C_Vuna_dMaybe_dJust (dir2) -> dir2
  | C_Vuna_dMaybe_dNothing -> "."
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 240 3 ("case pattern match failure"))

let v_Vuna_dCompilerCli_ddefaultOut = fun dir out -> (match out with
  | C_Vuna_dMaybe_dJust (out2) -> out2
  | C_Vuna_dMaybe_dNothing -> (let dir2 = v_Vuna_dCompilerCli_ddefaultDir dir in if v_vuna_ueq_ustr dir2 "." then "Main.ml" else ((dir2) ^ ("/Main.ml")))
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 245 3 ("case pattern match failure"))

let v_Vuna_dCompilerCli_dbuildRun = fun dir out -> (match v_Vuna_dPkg_dloadPackage dir with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | C_Vuna_dResult_dOk (pkg) -> (match v_Vuna_dCompile_dcompileFileTypedExecIn (v_Vuna_dPkg_dpackageName pkg) (v_Vuna_dPkg_dpackageRoots pkg) (v_Vuna_dPkg_dpackageEntry pkg) with
  | C_Vuna_dResult_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in (let vuna_cat1' = (e) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 1)
  | C_Vuna_dResult_dOk (code) -> (let parent = v_Vuna_dPair_dfirstOf (v_Vuna_dBase_dsplitPath out) in (let _ = if v_vuna_ueq_ustr parent "" then 0 else bi_make_dir parent in (let _ = bi_write_file out code in (let _ = bi_print ((let vuna_cat0' = ("wrote ") in (let vuna_cat1' = (out) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in 0))))
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 255 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 252 3 ("case pattern match failure"))

let rec v_Vuna_dCompilerCli_dbuildParse = fun prog dir out args -> (match args with
  | [] -> v_Vuna_dCompilerCli_dbuildRun (v_Vuna_dCompilerCli_ddefaultDir dir) (v_Vuna_dCompilerCli_ddefaultOut dir out)
  | (arg) :: (rest) -> if v_Vuna_dString_dstartsWith "-" arg then v_Vuna_dCompilerCli_dinvalidFlag prog arg else (match dir with
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dCompilerCli_dbuildParse prog (C_Vuna_dMaybe_dJust (arg)) out rest
  | C_Vuna_dMaybe_dJust (_) -> (match out with
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dCompilerCli_dbuildParse prog dir (C_Vuna_dMaybe_dJust (arg)) rest
  | C_Vuna_dMaybe_dJust (_) -> v_Vuna_dCompilerCli_dusageErr prog
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 235 11 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 232 12 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 228 3 ("case pattern match failure"))

let v_Vuna_dCompilerCli_dbuildArgs = fun prog args -> (match args with
  | ("--split") :: ([]) -> v_Vuna_dCompilerCli_dusageErr prog
  | ("--split") :: ((outDir) :: (rest)) -> v_Vuna_dCompilerCli_dbuildSplitCmd prog outDir rest
  | _ -> v_Vuna_dCompilerCli_dbuildParse prog C_Vuna_dMaybe_dNothing C_Vuna_dMaybe_dNothing args
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 188 3 ("case pattern match failure"))

let v_Vuna_dCompilerCli_drunCompilerCliFor1 = fun prog args -> (match args with
  | [] -> v_Vuna_dCompilerCli_dusageErr prog
  | (arg) :: (rest) -> (match arg with
  | "compile" -> v_Vuna_dCompilerCli_dcompileArgs prog rest
  | "check" -> v_Vuna_dCompilerCli_dcheckArgs prog rest
  | "build" -> if v_Vuna_dCompilerCli_danyDt rest then v_Vuna_dCompilerCli_ddtCmdErr prog else v_Vuna_dCompilerCli_dbuildArgs prog rest
  | "seed" -> if v_Vuna_dCompilerCli_danyDt rest then v_Vuna_dCompilerCli_ddtCmdErr prog else v_Vuna_dCompilerCli_dseedArgs prog rest
  | "help" -> v_Vuna_dCompilerCli_dhelpFor prog
  | "--no-typecheck" -> v_Vuna_dCompilerCli_dremovedFlag prog arg
  | "--typecheck" -> v_Vuna_dCompilerCli_dremovedFlag prog arg
  | "--typed" -> v_Vuna_dCompilerCli_dremovedFlag prog arg
  | "--out" -> v_Vuna_dCompilerCli_dremovedFlag prog arg
  | _ -> if v_Vuna_dString_dstartsWith "-" arg then v_Vuna_dCompilerCli_dmissingCommand prog arg else v_Vuna_dCompilerCli_dunknownCommand prog arg
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 40 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/CompilerCli.vuna" 37 3 ("case pattern match failure"))

let v_Vuna_dCompilerCli_drunCompilerCliFor = fun prog args -> if v_Vuna_dCompilerCli_danyHelp args then v_Vuna_dCompilerCli_dhelpFor prog else v_Vuna_dCompilerCli_drunCompilerCliFor1 prog args

let v_Vuna_dCompilerCli_drunCompilerCli = fun args -> v_Vuna_dCompilerCli_drunCompilerCliFor "vuna-compiler" args
