open Vuna_runtime
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
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Vuna_dCompiler_dPackages_dPkg
open Vuna_dCompiler_dDebug
open Base_dNat
open Base_dVec
open Vuna_dCompiler_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dDiagnostics
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dIntrinsics
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Vuna_dCompiler_dCore_dTerm
open Vuna_dCompiler_dCore_dEval
open Vuna_dCompiler_dCore_dConv
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dElab_dTypes
open Vuna_dCompiler_dElab_dPrelude
open Vuna_dCompiler_dElab_dSig
open Vuna_dCompiler_dElab_dMeta
open Vuna_dCompiler_dElab_dCase
open Vuna_dCompiler_dElab_dDict
open Vuna_dCompiler_dElab_dMatch
open Vuna_dCompiler_dElab_dTerm_dSupport
open Vuna_dCompiler_dElab_dTerm_dImpl
open Vuna_dCompiler_dElab_dTerm
open Vuna_dCompiler_dElab_dData
open Vuna_dCompiler_dElab_dTrait
open Vuna_dCompiler_dElab_dDerive
open Vuna_dCompiler_dElab_dRecords
open Vuna_dCompiler_dElab_dTermination_dMeasure
open Vuna_dCompiler_dElab_dTermination_dScc
open Vuna_dCompiler_dElab_dTermination
open Vuna_dCompiler_dElab_dDriver
open Vuna_dCompiler_dElab
open Vuna_dCompiler_dCodegen_dDecl
open Vuna_dCompiler_dCodegen_dErase
open Vuna_dCompiler_dCodegen_dTerm
open Vuna_dCompiler_dCodegen_dAssembly
open Vuna_dCompiler_dDriver_dSplit
open Vuna_dCompiler_dCodegen_dSplit
open Vuna_dCompiler_dCodegen
open Vuna_dCompiler_dDriver_dDt
open Vuna_dCompiler_dDriver_dCompile
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsageLines = (fun prog -> ((bi_concat "  ") ((bi_concat prog) ((bi_concat " compile [--no-print] (<entry.vuna> | <package-dir>) <out-dir>\n") ((bi_concat "  ") ((bi_concat prog) ((bi_concat " check (<entry.vuna> | <package-dir>)\n") ((bi_concat "  ") ((bi_concat prog) ((bi_concat " build [--no-compile] [--out DIR] [DIR]\n") ((bi_concat "  --no-print                    compile \231\148\159\230\136\144\231\154\132\231\168\139\229\186\143\228\184\141\230\137\147\229\141\176 main \231\187\147\230\158\156\239\188\136\233\187\152\232\174\164\230\137\147\229\141\176\239\188\137\n") ((bi_concat "  ") ((bi_concat prog) " help, -h\n")))))))))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsage = (fun prog -> ((bi_concat "usage:\n") (v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsageLines prog)))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_danyHelp = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (if (if ((bi_eq_str dtb__0) "-h") then true else ((bi_eq_str dtb__0) "--help")) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_danyHelp dtb__1))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dhelpFor = (fun prog -> ((fun _u -> 0) (dtp_print (v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsage prog))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr = (fun prog -> ((fun _u -> 2) (dtp_print (v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsage prog))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dunknownCommand = (fun prog -> (fun arg -> ((fun _u -> 2) (dtp_print ((bi_concat "error: unknown command `") ((bi_concat arg) ((bi_concat "`\n") ((bi_concat "run `") ((bi_concat prog) " help` for the command list\n")))))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedCommand = (fun prog -> (fun cmd -> (fun hint -> ((fun _u -> 2) (dtp_print ((bi_concat "error: `") ((bi_concat cmd) ((bi_concat "` has been removed; ") ((bi_concat hint) "\n")))))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag = (fun name -> ((bi_concat "-") ((bi_concat "-") name)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlagHint = (fun flag -> (if ((bi_eq_str flag) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "dt")) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("DT is the only path; drop the flag")) else (if ((bi_eq_str flag) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "package")) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("use `build` or `compile`")) else (if ((bi_eq_str flag) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "split")) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("split is the only output model; use `build --out OUT [DIR]` or `compile <pkg-dir> OUT`")) else (if ((bi_eq_str flag) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "root")) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("module resolution is decided by the nearest vuna.toml; set VUNA_BASE for standalone files")) else (if ((bi_eq_str flag) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "out")) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("pass OUTDIR positionally to `compile`; `build` accepts --out DIR")) else (if ((bi_eq_str flag) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "no-typecheck")) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("checking is always enabled")) else (if ((bi_eq_str flag) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "typecheck")) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("checking is always enabled")) else (if ((bi_eq_str flag) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "typed")) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("DT is the only path")) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag = (fun prog -> (fun flag -> (match (v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlagHint flag) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__2) -> ((fun _u -> 2) (dtp_print ((bi_concat "error: ") ((bi_concat flag) ((bi_concat " has been removed; ") ((bi_concat dtb__2) "\n"))))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText = (fun e -> ((fun _u -> 1) (dtp_print e)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr = (fun e -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText ((bi_concat "error: ") ((bi_concat e) "\n"))))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dprintWarnings = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__3, dtb__4) -> ((fun _u -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintWarnings dtb__4)) (dtp_print ((bi_concat dtb__3) "\n")))
  | C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_ddefaultDir = (fun dir -> (match dir with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__5) -> dtb__5
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> "."
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_ddefaultOutDir = (fun out -> (fun dir -> (match out with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__6) -> dtb__6
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((bi_concat dir) "/.output")
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr = (fun path -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr ((bi_concat "no such file or package directory: ") path)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackageAt = (fun label -> (fun dir -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage dir)) (fun pkg -> (if (dtp_fileExists (v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg)) then (C_Base_dResult_dResult_Base_dResult_dOk (pkg)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": library package ") ((bi_concat (v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg)) " has no app/Main.vuna (executable package required)"))))))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackage = (fun label -> (fun dir -> (if (dtp_fileExists dir) then (if (dtp_isDirectory dir) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackageAt label) dir) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": expects a package directory, not a file: ") dir))))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "no such file or package directory: ") dir))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFileEntry = (fun printResult -> (fun entry -> (fun outDir -> (match (v_Vuna_dCompiler_dPackages_dPkg_dcontextForFile entry) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__7) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__7)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__8) -> (match ((((v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir dtb__8) entry) printResult) outDir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__9) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__9)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__10) -> 0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilePkgDir = (fun printResult -> (fun dir -> (fun outDir -> (match ((v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackage "compile") dir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__11) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__11)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__12) -> (match ((((v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir (v_Vuna_dCompiler_dPackages_dPkg_dpackageContext dtb__12)) (v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry dtb__12)) printResult) outDir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__13) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__13)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__14) -> 0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileRun = (fun printResult -> (fun entry -> (fun outDir -> (if (dtp_fileExists entry) then (if (dtp_isDirectory entry) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilePkgDir printResult) entry) outDir) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFileEntry printResult) entry) outDir)) else (v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr entry)))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFinish = (fun prog -> (fun printResult -> (fun entry -> (fun outDir -> (match entry with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__15) -> (match outDir with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__16) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileRun printResult) dtb__15) dtb__16)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse = (fun prog -> (fun printResult -> (fun entry -> (fun outDir -> (fun args -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__17, dtb__18) -> (if ((bi_eq_str dtb__17) "--no-print") then (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) false) entry) outDir) dtb__18) else (if ((v_Base_dString_dstartsWith "-") dtb__17) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__17) else (match entry with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) printResult) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__17))) outDir) dtb__18)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__19) -> (match outDir with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) printResult) entry) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__17))) dtb__18)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__20) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Base_dList_dNil -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFinish prog) printResult) entry) outDir)
  | _ -> failwith "DT: impossible branch"
)) args))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileArgs = (fun prog -> (fun args -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) true) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) args)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPkgDir = (fun dir -> (match (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage dir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__21) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__21)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__22) -> (match (v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage dtb__22) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__23) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__23)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__24) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintWarnings dtb__24)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckFileEntry = (fun path -> (match (v_Vuna_dCompiler_dPackages_dPkg_dcontextForFile path) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__25) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__25)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__26) -> (match ((v_Vuna_dCompiler_dDriver_dDt_ddtCheck dtb__26) path) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__27) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__27)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__28) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintWarnings dtb__28)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEmit = (fun path -> (if (dtp_fileExists path) then (if (dtp_isDirectory path) then (v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPkgDir path) else (v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckFileEntry path)) else (v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr path)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckArgs = (fun prog -> (fun args -> (match args with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | C_Base_dList_dList_Base_dList_dCons (dtb__29, dtb__30) -> (if ((v_Base_dString_dstartsWith "-") dtb__29) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__29) else (match dtb__30 with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEmit dtb__29)
  | _ -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildLinked = (fun outDir -> (fun name -> ((fun _u -> (match (((v_Vuna_dCompiler_dDriver_dCompile_drunBuildScript outDir) ((bi_concat "bin/") name)) name) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__31) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__31)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__32) -> ((fun _u -> 0) (dtp_print ((bi_concat "built ") ((bi_concat outDir) ((bi_concat "/bin/") ((bi_concat name) "\n"))))))
  | _ -> failwith "DT: impossible branch"
)) (dtp_makeDir ((bi_concat outDir) "/bin")))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildRun = (fun noCompile -> (fun dir -> (fun outDir -> (match ((v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackage "build") dir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__33) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__33)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__34) -> ((fun name -> (match ((((v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir (v_Vuna_dCompiler_dPackages_dPkg_dpackageContext dtb__34)) (v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry dtb__34)) true) outDir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__35) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__35)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__36) -> (if noCompile then 0 else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildLinked outDir) name))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__34))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse = (fun prog -> (fun noCompile -> (fun out -> (fun dir -> (fun args -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__37, dtb__38) -> (if ((bi_eq_str dtb__37) "--no-compile") then (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) true) out) dir) dtb__38) else (if ((bi_eq_str dtb__37) "--out") then (match dtb__38 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__39, dtb__40) -> (if ((v_Base_dString_dstartsWith "-") dtb__39) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__39) else (match out with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) noCompile) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__39))) dir) dtb__40)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__41) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
) else (if ((v_Base_dString_dstartsWith "-") dtb__37) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__37) else (match dir with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) noCompile) out) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__37))) dtb__38)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__42) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
))))
  | C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildRun noCompile) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddefaultDir dir)) ((v_Vuna_dCompiler_dDriver_dCompilerCli_ddefaultOutDir out) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddefaultDir dir)))
  | _ -> failwith "DT: impossible branch"
)) args))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildArgs = (fun prog -> (fun args -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) false) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) args)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor1 = (fun prog -> (fun args -> (match args with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | C_Base_dList_dList_Base_dList_dCons (dtb__43, dtb__44) -> (if ((bi_eq_str dtb__43) "compile") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileArgs prog) dtb__44) else (if ((bi_eq_str dtb__43) "check") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckArgs prog) dtb__44) else (if ((bi_eq_str dtb__43) "build") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildArgs prog) dtb__44) else (if ((bi_eq_str dtb__43) "seed") then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedCommand prog) "seed") "use `build --out OUT [DIR]` or `compile DIR OUT`") else (if ((bi_eq_str dtb__43) "help") then (v_Vuna_dCompiler_dDriver_dCompilerCli_dhelpFor prog) else (if ((v_Base_dString_dstartsWith "-") dtb__43) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__43) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dunknownCommand prog) dtb__43)))))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor = (fun prog -> (fun args -> (if (v_Vuna_dCompiler_dDriver_dCompilerCli_danyHelp args) then (v_Vuna_dCompiler_dDriver_dCompilerCli_dhelpFor prog) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor1 prog) args))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCli = (fun args -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor "vuna-compiler") args))
