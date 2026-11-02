open Vuna_runtime
open Vuna_builtins
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dOrd
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
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dDtMatch
open Vuna_dCompiler_dDtTerm
open Vuna_dCompiler_dDtPrelude
open Vuna_dCompiler_dDtKind
open Vuna_dCompiler_dDtQuant
open Vuna_dCompiler_dDtDerive
open Vuna_dCompiler_dDtRecords
open Vuna_dCompiler_dElab
open Vuna_dCompiler_dSplit
open Vuna_dCompiler_dCoreCodegen
open Vuna_dCompiler_dDt
open Vuna_dCompiler_dCompile
open Vuna_dCompiler_dSplitCli
open Vuna_dCompiler_dProcess
let v_Vuna_dCompiler_dCompilerCli_dcompilerUsageLines = (fun prog -> ((bi_concat "  ") ((bi_concat prog) ((bi_concat " compile [--no-print] [--root DIR]... (<entry.vuna> | <package-dir>) [out.ml]\n") ((bi_concat "  ") ((bi_concat prog) ((bi_concat " check [--root DIR]... (<entry.vuna> | <package-dir>)\n") ((bi_concat "  ") ((bi_concat prog) ((bi_concat " build [--no-compile] [DIR]    \229\140\133\231\186\167 DT \229\141\149\230\150\135\228\187\182 codegen + ocamlopt \226\134\146 .output/bin/<name>\n") ((bi_concat "  ") ((bi_concat prog) ((bi_concat " build --split OUT [DIR]        \233\128\144\230\168\161\229\157\151 DT codegen\239\188\154OUT/<Module>.ml... + build.sh\n") ((bi_concat "  ") ((bi_concat prog) ((bi_concat " seed OUT [DIR]                 \229\144\140 build --split\239\188\136seed rotation \231\148\168\239\188\137\n") ((bi_concat "  --no-print                     compile \228\184\141\230\137\147\229\141\176\231\187\147\230\158\156\233\146\169\229\173\144\239\188\136\232\176\131\232\175\149/\230\181\139\232\175\149\231\148\168\239\188\137\n") ((bi_concat "  ") ((bi_concat prog) " help, -h\n")))))))))))))))))))

let v_Vuna_dCompiler_dCompilerCli_dcompilerUsage = (fun prog -> ((bi_concat "usage:\n") (v_Vuna_dCompiler_dCompilerCli_dcompilerUsageLines prog)))

let rec v_Vuna_dCompiler_dCompilerCli_danyHelp = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (if (if ((bi_eq_str dtb__0) "-h") then true else ((bi_eq_str dtb__0) "--help")) then true else (v_Vuna_dCompiler_dCompilerCli_danyHelp dtb__1))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCompilerCli_dhelpFor = (fun prog -> ((fun _u -> 0) (dtp_print (v_Vuna_dCompiler_dCompilerCli_dcompilerUsage prog))))

let v_Vuna_dCompiler_dCompilerCli_dusageErr = (fun prog -> ((fun _u -> 2) (dtp_print (v_Vuna_dCompiler_dCompilerCli_dcompilerUsage prog))))

let v_Vuna_dCompiler_dCompilerCli_dunknownCommand = (fun prog -> (fun arg -> ((fun _u -> 2) (dtp_print ((bi_concat "error: unknown command `") ((bi_concat arg) ((bi_concat "`\n") ((bi_concat "run `") ((bi_concat prog) " help`\n")))))))))

let v_Vuna_dCompiler_dCompilerCli_dremovedHint = (fun flag -> (if ((bi_eq_str flag) "--dt") then "DT is the only path; drop the flag" else (if ((bi_eq_str flag) "--package") then "use `build`, `build --split`, or `seed`" else (if ((bi_eq_str flag) "--out") then "use the positional OUT argument" else (if ((bi_eq_str flag) "--no-typecheck") then "checking is always enabled" else (if ((bi_eq_str flag) "--typecheck") then "checking is always enabled" else (if ((bi_eq_str flag) "--typed") then "DT is the only path" else "")))))))

let v_Vuna_dCompiler_dCompilerCli_dremovedFlag = (fun prog -> (fun flag -> (if ((bi_eq_str (v_Vuna_dCompiler_dCompilerCli_dremovedHint flag)) "") then (v_Vuna_dCompiler_dCompilerCli_dusageErr prog) else ((fun hint -> ((fun _u -> 2) (dtp_print ((bi_concat "error: ") ((bi_concat flag) ((bi_concat " has been removed; ") ((bi_concat hint) "\n"))))))) (v_Vuna_dCompiler_dCompilerCli_dremovedHint flag)))))

let v_Vuna_dCompiler_dCompilerCli_dprintErrText = (fun e -> ((fun _u -> 1) (dtp_print e)))

let v_Vuna_dCompiler_dCompilerCli_dprintErr = (fun e -> (v_Vuna_dCompiler_dCompilerCli_dprintErrText ((bi_concat "error: ") ((bi_concat e) "\n"))))

let rec v_Vuna_dCompiler_dCompilerCli_dprintWarnings = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__2, dtb__3) -> ((fun _u -> (v_Vuna_dCompiler_dCompilerCli_dprintWarnings dtb__3)) (dtp_print ((bi_concat dtb__2) "\n")))
  | C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCompilerCli_drootArg = (fun prog -> (fun roots -> (fun rest -> (fun k -> (match rest with
  | C_Base_dList_dList_Cons (dtb__4, dtb__5) -> ((k ((v_Base_dList_dappend roots) (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dPkg_drawRoot dtb__4), C_Base_dList_dList_Nil)))) dtb__5)
  | C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCompilerCli_ddefaultDir = (fun dir -> (match dir with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__6) -> dtb__6
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> "."
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCompilerCli_ddefaultOutDir = (fun dir -> ((bi_concat dir) "/.output"))

let v_Vuna_dCompiler_dCompilerCli_ddtPathErr = (fun path -> (v_Vuna_dCompiler_dCompilerCli_dprintErr ((bi_concat "no such file or package directory: ") path)))

let v_Vuna_dCompiler_dCompilerCli_dexecutablePackageAt = (fun label -> (fun dir -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dPkg_dloadPackage dir)) (fun pkg -> (if (dtp_fileExists (v_Vuna_dCompiler_dPkg_dpackageEntry pkg)) then (C_Base_dResult_dResult_Base_dResult_dOk (pkg)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": library package ") ((bi_concat (v_Vuna_dCompiler_dPkg_dpackageName pkg)) " has no app/Main.vuna (executable package required)"))))))))))

let v_Vuna_dCompiler_dCompilerCli_dexecutablePackage = (fun label -> (fun dir -> (if (dtp_fileExists dir) then (if (dtp_isDirectory dir) then ((v_Vuna_dCompiler_dCompilerCli_dexecutablePackageAt label) dir) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": expects a package directory, not a file: ") dir))))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "no such file or package directory: ") dir))))))

let v_Vuna_dCompiler_dCompilerCli_demitCode = (fun prog -> (fun code -> (fun rest -> (match rest with
  | C_Base_dList_dList_Nil -> ((fun _u -> 0) (dtp_print code))
  | C_Base_dList_dList_Cons (dtb__7, dtb__8) -> (match dtb__8 with
  | C_Base_dList_dList_Nil -> ((fun _u -> 0) ((dtp_writeFile dtb__7) code))
  | _ -> (v_Vuna_dCompiler_dCompilerCli_dusageErr prog)
)
  | _ -> (v_Vuna_dCompiler_dCompilerCli_dusageErr prog)
))))

let v_Vuna_dCompiler_dCompilerCli_dcompileFile = (fun prog -> (fun printResult -> (fun roots -> (fun entry -> (fun rest -> (match (((v_Vuna_dCompiler_dCompile_dcompileFileDt ((v_Base_dList_dmap v_Vuna_dCompiler_dPkg_drootDir) (v_Vuna_dCompiler_dCompile_deffectiveRoots roots))) entry) printResult) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__9) -> (((v_Vuna_dCompiler_dCompilerCli_demitCode prog) dtb__9) rest)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__10) -> (v_Vuna_dCompiler_dCompilerCli_dprintErr dtb__10)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dCompilerCli_dcompilePkg = (fun prog -> (fun printResult -> (fun dir -> (fun rest -> (match ((v_Vuna_dCompiler_dCompilerCli_dexecutablePackage "compile") dir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__11) -> (v_Vuna_dCompiler_dCompilerCli_dprintErr dtb__11)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__12) -> (match ((((v_Vuna_dCompiler_dCompile_dcompileProjectDt (v_Vuna_dCompiler_dPkg_dpackageRoots dtb__12)) (v_Vuna_dCompiler_dPkg_dpackageName dtb__12)) (v_Vuna_dCompiler_dPkg_dpackageEntry dtb__12)) printResult) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__13) -> (((v_Vuna_dCompiler_dCompilerCli_demitCode prog) dtb__13) rest)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__14) -> (v_Vuna_dCompiler_dCompilerCli_dprintErr dtb__14)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCompilerCli_dcompileEmit = (fun prog -> (fun printResult -> (fun roots -> (fun entry -> (fun rest -> (if (dtp_fileExists entry) then (if (dtp_isDirectory entry) then ((((v_Vuna_dCompiler_dCompilerCli_dcompilePkg prog) printResult) entry) rest) else (((((v_Vuna_dCompiler_dCompilerCli_dcompileFile prog) printResult) roots) entry) rest)) else (v_Vuna_dCompiler_dCompilerCli_ddtPathErr entry)))))))

let rec v_Vuna_dCompiler_dCompilerCli_dcompileParse = (fun prog -> (fun printResult -> (fun roots -> (fun args -> (match args with
  | C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dCompilerCli_dusageErr prog)
  | C_Base_dList_dList_Cons (dtb__15, dtb__16) -> (if ((bi_eq_str dtb__15) "--no-print") then ((((v_Vuna_dCompiler_dCompilerCli_dcompileParse prog) false) roots) dtb__16) else (if ((bi_eq_str dtb__15) "--root") then ((((v_Vuna_dCompiler_dCompilerCli_drootArg prog) roots) dtb__16) (fun roots2 -> (fun rest2 -> ((((v_Vuna_dCompiler_dCompilerCli_dcompileParse prog) printResult) roots2) rest2)))) else (if ((v_Base_dString_dstartsWith "-") dtb__15) then ((v_Vuna_dCompiler_dCompilerCli_dremovedFlag prog) dtb__15) else (((((v_Vuna_dCompiler_dCompilerCli_dcompileEmit prog) printResult) roots) dtb__15) dtb__16))))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCompilerCli_dcompileArgs = (fun prog -> (fun args -> ((((v_Vuna_dCompiler_dCompilerCli_dcompileParse prog) true) C_Base_dList_dList_Nil) args)))

let v_Vuna_dCompiler_dCompilerCli_dcheckFile = (fun roots -> (fun path -> (match ((v_Vuna_dCompiler_dCompile_dcheckFileDt ((v_Base_dList_dmap v_Vuna_dCompiler_dPkg_drootDir) roots)) path) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__17) -> (v_Vuna_dCompiler_dCompilerCli_dprintErr dtb__17)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__18) -> ((fun _u -> 0) (v_Vuna_dCompiler_dCompilerCli_dprintWarnings dtb__18))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCompilerCli_dcheckPkgEntry = (fun pkg -> (match (((v_Vuna_dCompiler_dCompile_dcheckProjectDt (v_Vuna_dCompiler_dPkg_dpackageRoots pkg)) (v_Vuna_dCompiler_dPkg_dpackageName pkg)) (v_Vuna_dCompiler_dPkg_dpackageEntry pkg)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__19) -> (v_Vuna_dCompiler_dCompilerCli_dprintErr dtb__19)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__20) -> ((fun _u -> 0) (v_Vuna_dCompiler_dCompilerCli_dprintWarnings dtb__20))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCompilerCli_dcheckPkgLibrary = (fun pkg -> (match (v_Vuna_dCompiler_dPkg_dpackageExports pkg) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dCompilerCli_dprintErr ((bi_concat "check: library package ") ((bi_concat (v_Vuna_dCompiler_dPkg_dpackageName pkg)) " has no [export].modules")))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__21) -> (match (((v_Vuna_dCompiler_dCompile_dcheckLibraryDt (v_Vuna_dCompiler_dPkg_dpackageRoots pkg)) (v_Vuna_dCompiler_dPkg_dpackageName pkg)) dtb__21) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__22) -> (v_Vuna_dCompiler_dCompilerCli_dprintErr dtb__22)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__23) -> ((fun _u -> 0) (v_Vuna_dCompiler_dCompilerCli_dprintWarnings dtb__23))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCompilerCli_dcheckPkg = (fun dir -> (match (v_Vuna_dCompiler_dPkg_dloadPackage dir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__24) -> (v_Vuna_dCompiler_dCompilerCli_dprintErr dtb__24)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__25) -> (if (dtp_fileExists (v_Vuna_dCompiler_dPkg_dpackageEntry dtb__25)) then (v_Vuna_dCompiler_dCompilerCli_dcheckPkgEntry dtb__25) else (v_Vuna_dCompiler_dCompilerCli_dcheckPkgLibrary dtb__25))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCompilerCli_dcheckParse = (fun prog -> (fun roots -> (fun args -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dList_dList_Cons (dtb__26, dtb__27) -> (if ((bi_eq_str dtb__26) "--root") then (match dtb__27 with
  | C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dCompilerCli_drootArg prog) roots) dtb__27) (fun roots2 -> (fun rest2 -> (((v_Vuna_dCompiler_dCompilerCli_dcheckParse prog) roots2) rest2))))
  | _ -> ((((v_Vuna_dCompiler_dCompilerCli_drootArg prog) roots) dtb__27) (fun roots2 -> (fun rest2 -> (((v_Vuna_dCompiler_dCompilerCli_dcheckParse prog) roots2) rest2))))
) else (match dtb__27 with
  | C_Base_dList_dList_Nil -> (if ((v_Base_dString_dstartsWith "-") dtb__26) then ((v_Vuna_dCompiler_dCompilerCli_dremovedFlag prog) dtb__26) else (if (dtp_fileExists dtb__26) then (if (dtp_isDirectory dtb__26) then (v_Vuna_dCompiler_dCompilerCli_dcheckPkg dtb__26) else ((v_Vuna_dCompiler_dCompilerCli_dcheckFile (v_Vuna_dCompiler_dCompile_deffectiveRoots roots)) dtb__26)) else (v_Vuna_dCompiler_dCompilerCli_ddtPathErr dtb__26)))
  | _ -> (v_Vuna_dCompiler_dCompilerCli_dusageErr prog)
))
  | C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
)) args))))

let v_Vuna_dCompiler_dCompilerCli_dcheckArgs = (fun prog -> (fun args -> (((v_Vuna_dCompiler_dCompilerCli_dcheckParse prog) C_Base_dList_dList_Nil) args)))

let rec v_Vuna_dCompiler_dCompilerCli_dwriteFiles = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__28, dtb__29) -> ((fun _u -> ((bi_add 1) ((v_Vuna_dCompiler_dCompilerCli_dwriteFiles mc0) dtb__29))) ((dtp_writeFile ((bi_concat mc0) ((bi_concat "/") (v_Base_dPair_dfirstOf dtb__28)))) (v_Base_dPair_dsecondOf dtb__28)))
  | C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCompilerCli_dwriteDtOutput = (fun outDir -> (fun pkg -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCompile_ddtProjectFiles (v_Vuna_dCompiler_dPkg_dpackageRoots pkg)) (v_Vuna_dCompiler_dPkg_dpackageName pkg)) (v_Vuna_dCompiler_dPkg_dpackageEntry pkg)) true)) (fun files -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dCompilerCli_dwriteFiles outDir) files)))) (dtp_makeDir outDir))))))

let v_Vuna_dCompiler_dCompilerCli_dbuildBinary = (fun dir -> (fun pkg -> ((fun outDir -> ((fun name -> ((fun binRel -> ((fun binPath -> ((fun _u -> ((fun _u -> ((fun code -> (if ((bi_eq_int code) 0) then ((fun _u -> 0) (dtp_print ((bi_concat "built ") ((bi_concat dir) ((bi_concat "/") ((bi_concat binRel) "\n")))))) else ((fun _u -> ((fun _u -> 1) (dtp_print ((bi_concat "error: build: ocamlopt failed (exit ") ((bi_concat (bi_strFromInt code)) ")\n"))))) (dtp_removeFile binPath)))) ((v_Vuna_dCompiler_dProcess_drunIn dir) (C_Base_dList_dList_Cons ("ocamlopt", (C_Base_dList_dList_Cons ("-w", (C_Base_dList_dList_Cons ("-a", (C_Base_dList_dList_Cons ("-I", (C_Base_dList_dList_Cons ("+unix", (C_Base_dList_dList_Cons ("-o", (C_Base_dList_dList_Cons (binRel, (C_Base_dList_dList_Cons ("unix.cmxa", (C_Base_dList_dList_Cons (".output/main.ml", C_Base_dList_dList_Nil))))))))))))))))))))) (dtp_removeFile binPath))) (dtp_makeDir ((bi_concat outDir) "/bin")))) ((bi_concat outDir) ((bi_concat "/bin/") name)))) ((bi_concat ".output/bin/") name))) (v_Vuna_dCompiler_dPkg_dpackageName pkg))) (v_Vuna_dCompiler_dCompilerCli_ddefaultOutDir dir))))

let v_Vuna_dCompiler_dCompilerCli_dbuildDefault = (fun dir -> (fun noCompile -> (match ((v_Vuna_dCompiler_dCompilerCli_dexecutablePackage "build") dir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__30) -> (v_Vuna_dCompiler_dCompilerCli_dprintErr dtb__30)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__31) -> (match ((v_Vuna_dCompiler_dCompilerCli_dwriteDtOutput (v_Vuna_dCompiler_dCompilerCli_ddefaultOutDir dir)) dtb__31) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__32) -> (v_Vuna_dCompiler_dCompilerCli_dprintErr dtb__32)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__33) -> ((fun _u -> (if noCompile then 0 else ((v_Vuna_dCompiler_dCompilerCli_dbuildBinary dir) dtb__31))) (dtp_print ((bi_concat "wrote ") ((bi_concat (bi_strFromInt dtb__33)) ((bi_concat " files to ") ((bi_concat (v_Vuna_dCompiler_dCompilerCli_ddefaultOutDir dir)) "\n"))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCompilerCli_dbuildSplitRun = (fun outDir -> (fun dir -> (match ((v_Vuna_dCompiler_dCompilerCli_dexecutablePackage "build --split") dir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__34) -> (v_Vuna_dCompiler_dCompilerCli_dprintErr dtb__34)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__35) -> ((fun _u -> (match ((v_Vuna_dCompiler_dSplitCli_dbuildSplit dir) outDir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__36) -> (v_Vuna_dCompiler_dCompilerCli_dprintErr dtb__36)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__37) -> ((fun _u -> 0) (dtp_print ((bi_concat "wrote ") ((bi_concat (bi_strFromInt dtb__37)) ((bi_concat " files to ") ((bi_concat outDir) "\n"))))))
  | _ -> failwith "DT: impossible branch"
)) (dtp_makeDir outDir))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCompilerCli_dbuildRun = (fun prog -> (fun dir -> (fun noCompile -> (fun splitOut -> (match splitOut with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__38) -> ((v_Vuna_dCompiler_dCompilerCli_dbuildSplitRun dtb__38) dir)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dCompilerCli_dbuildDefault dir) noCompile)
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCompilerCli_dbuildParse = (fun prog -> (fun noCompile -> (fun splitOut -> (fun dir -> (fun args -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dList_dList_Cons (dtb__39, dtb__40) -> (if ((bi_eq_str dtb__39) "--no-compile") then (((((v_Vuna_dCompiler_dCompilerCli_dbuildParse prog) true) splitOut) dir) dtb__40) else (if ((bi_eq_str dtb__39) "--split") then (match dtb__40 with
  | C_Base_dList_dList_Cons (dtb__41, dtb__42) -> (if ((v_Base_dString_dstartsWith "-") dtb__41) then ((v_Vuna_dCompiler_dCompilerCli_dremovedFlag prog) dtb__41) else (match splitOut with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dCompilerCli_dbuildParse prog) noCompile) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__41))) dir) dtb__42)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__43) -> (v_Vuna_dCompiler_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
) else (if ((v_Base_dString_dstartsWith "-") dtb__39) then ((v_Vuna_dCompiler_dCompilerCli_dremovedFlag prog) dtb__39) else (match dir with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dCompilerCli_dbuildParse prog) noCompile) splitOut) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__39))) dtb__40)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__44) -> (v_Vuna_dCompiler_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
))))
  | C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dCompilerCli_dbuildRun prog) (v_Vuna_dCompiler_dCompilerCli_ddefaultDir dir)) noCompile) splitOut)
  | _ -> failwith "DT: impossible branch"
)) args))))))

let v_Vuna_dCompiler_dCompilerCli_dbuildArgs = (fun prog -> (fun args -> (((((v_Vuna_dCompiler_dCompilerCli_dbuildParse prog) false) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) args)))

let v_Vuna_dCompiler_dCompilerCli_dseedOutErr = fun () -> ((fun _u -> 2) (dtp_print "error: seed requires an explicit OUT directory\n"))

let v_Vuna_dCompiler_dCompilerCli_dseedRun = (fun outDir -> (fun dir -> (match ((v_Vuna_dCompiler_dCompilerCli_dexecutablePackage "seed") dir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__45) -> (v_Vuna_dCompiler_dCompilerCli_dprintErr dtb__45)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__46) -> ((fun _u -> (match ((v_Vuna_dCompiler_dSplitCli_dseedSplit dir) outDir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__47) -> (v_Vuna_dCompiler_dCompilerCli_dprintErr dtb__47)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__48) -> ((fun _u -> 0) (dtp_print ((bi_concat "wrote ") ((bi_concat (bi_strFromInt dtb__48)) ((bi_concat " files to ") ((bi_concat outDir) "\n"))))))
  | _ -> failwith "DT: impossible branch"
)) (dtp_makeDir outDir))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCompilerCli_dseedParse = (fun prog -> (fun out -> (fun dir -> (fun args -> (match args with
  | C_Base_dList_dList_Nil -> (match out with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dCompilerCli_dseedOutErr ())
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__49) -> ((v_Vuna_dCompiler_dCompilerCli_dseedRun dtb__49) (v_Vuna_dCompiler_dCompilerCli_ddefaultDir dir))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (if ((v_Base_dString_dstartsWith "-") dtb__50) then ((v_Vuna_dCompiler_dCompilerCli_dremovedFlag prog) dtb__50) else (match out with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dCompilerCli_dseedParse prog) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__50))) dir) dtb__51)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__52) -> (match dir with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dCompilerCli_dseedParse prog) out) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__50))) dtb__51)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__53) -> (v_Vuna_dCompiler_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCompilerCli_dseedArgs = (fun prog -> (fun args -> ((((v_Vuna_dCompiler_dCompilerCli_dseedParse prog) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) args)))

let v_Vuna_dCompiler_dCompilerCli_drunCompilerCliFor1 = (fun prog -> (fun args -> (match args with
  | C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dCompilerCli_dusageErr prog)
  | C_Base_dList_dList_Cons (dtb__54, dtb__55) -> (if ((bi_eq_str dtb__54) "compile") then ((v_Vuna_dCompiler_dCompilerCli_dcompileArgs prog) dtb__55) else (if ((bi_eq_str dtb__54) "check") then ((v_Vuna_dCompiler_dCompilerCli_dcheckArgs prog) dtb__55) else (if ((bi_eq_str dtb__54) "build") then ((v_Vuna_dCompiler_dCompilerCli_dbuildArgs prog) dtb__55) else (if ((bi_eq_str dtb__54) "seed") then ((v_Vuna_dCompiler_dCompilerCli_dseedArgs prog) dtb__55) else (if ((bi_eq_str dtb__54) "help") then (v_Vuna_dCompiler_dCompilerCli_dhelpFor prog) else (if ((v_Base_dString_dstartsWith "-") dtb__54) then ((v_Vuna_dCompiler_dCompilerCli_dremovedFlag prog) dtb__54) else ((v_Vuna_dCompiler_dCompilerCli_dunknownCommand prog) dtb__54)))))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCompilerCli_drunCompilerCliFor = (fun prog -> (fun args -> (if (v_Vuna_dCompiler_dCompilerCli_danyHelp args) then (v_Vuna_dCompiler_dCompilerCli_dhelpFor prog) else ((v_Vuna_dCompiler_dCompilerCli_drunCompilerCliFor1 prog) args))))

let v_Vuna_dCompiler_dCompilerCli_drunCompilerCli = (fun args -> ((v_Vuna_dCompiler_dCompilerCli_drunCompilerCliFor "vuna-compiler") args))
