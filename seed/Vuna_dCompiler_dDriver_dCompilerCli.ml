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
open Vuna_dCompiler_dDiagnostics_dCommon
open Vuna_dCompiler_dDiagnostics_dCg
open Vuna_dCompiler_dDiagnostics_dTc
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
open Vuna_dCompiler_dElab_dInstName
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
open Vuna_dCompiler_dVersion
open Vuna_dCompiler_dDriver_dCompile
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsageLines = (fun prog -> ((bi_concat "  ") ((bi_concat prog) ((bi_concat " compile [--no-print] (<entry.vuna> | <package-dir>) <out-dir>\n") ((bi_concat "  ") ((bi_concat prog) ((bi_concat " check (<entry.vuna> | <package-dir>)\n") ((bi_concat "  ") ((bi_concat prog) ((bi_concat " build [--no-compile] [--out DIR] [--package NAME] [DIR]\n") ((bi_concat "  --no-print                    compile \231\148\159\230\136\144\231\154\132\231\168\139\229\186\143\228\184\141\230\137\147\229\141\176 main \231\187\147\230\158\156\239\188\136\233\187\152\232\174\164\230\137\147\229\141\176\239\188\137\n") ((bi_concat "  ") ((bi_concat prog) ((bi_concat " version, --version          \230\152\190\231\164\186\231\137\136\230\156\172\n") ((bi_concat "  ") ((bi_concat prog) " help, -h\n"))))))))))))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsage = (fun prog -> ((bi_concat "usage:\n") (v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsageLines prog)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintVersion = (fun _u -> ((fun _u -> 0) (dtp_print ((bi_concat "vuna-compiler ") ((bi_concat v_Vuna_dCompiler_dVersion_dvunaVersion) "\n")))))

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

let v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr = (fun path -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr ((bi_concat "no such file or package directory: ") path)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackageAt = (fun label -> (fun dir -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage dir)) (fun pkg -> (if (dtp_fileExists (v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg)) then (C_Base_dResult_dResult_Base_dResult_dOk (pkg)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": library package ") ((bi_concat (v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg)) " has no app/Main.vuna (executable package required)"))))))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackage = (fun label -> (fun dir -> (if (dtp_fileExists dir) then (if (dtp_isDirectory dir) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackageAt label) dir) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": expects a package directory, not a file: ") dir))))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "no such file or package directory: ") dir))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFileEntry = (fun printResult -> (fun entry -> (fun outDir -> (match (v_Vuna_dCompiler_dPackages_dPkg_dcontextForFile entry) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__6) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__6)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__7) -> (match ((((v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir dtb__7) entry) printResult) outDir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__8) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__8)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__9) -> 0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilePkgDir = (fun printResult -> (fun dir -> (fun outDir -> (match ((v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackage "compile") dir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__10) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__10)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__11) -> (match ((((v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir (v_Vuna_dCompiler_dPackages_dPkg_dpackageContext dtb__11)) (v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry dtb__11)) printResult) outDir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__12) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__12)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__13) -> 0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileRun = (fun printResult -> (fun entry -> (fun outDir -> (if (dtp_fileExists entry) then (if (dtp_isDirectory entry) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilePkgDir printResult) entry) outDir) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFileEntry printResult) entry) outDir)) else (v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr entry)))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFinish = (fun prog -> (fun printResult -> (fun entry -> (fun outDir -> (match entry with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__14) -> (match outDir with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__15) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileRun printResult) dtb__14) dtb__15)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse = (fun prog -> (fun printResult -> (fun entry -> (fun outDir -> (fun args -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__16, dtb__17) -> (if ((bi_eq_str dtb__16) "--no-print") then (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) false) entry) outDir) dtb__17) else (if ((v_Base_dString_dstartsWith "-") dtb__16) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__16) else (match entry with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) printResult) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__16))) outDir) dtb__17)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__18) -> (match outDir with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) printResult) entry) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__16))) dtb__17)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__19) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Base_dList_dNil -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFinish prog) printResult) entry) outDir)
  | _ -> failwith "DT: impossible branch"
)) args))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileArgs = (fun prog -> (fun args -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) true) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) args)))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackages = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__20, dtb__21) -> ((fun c -> ((fun next -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackages dtb__21) next)) (if ((bi_gt_int c) mc1) then c else mc1))) (match (v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage dtb__20) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__22) -> ((fun _u -> 1) (dtp_print ((bi_concat "error: [") ((bi_concat (v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__20)) ((bi_concat "] ") ((bi_concat dtb__22) "\n"))))))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__23) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintWarnings dtb__23)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPkgDir = (fun dir -> (match (v_Vuna_dCompiler_dPackages_dPkg_dworkspacePackages dir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__24) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__24)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__25) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackages dtb__25) 0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckFileEntry = (fun path -> (match (v_Vuna_dCompiler_dPackages_dPkg_dcontextForFile path) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__26) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__26)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__27) -> (match ((v_Vuna_dCompiler_dDriver_dDt_ddtCheck dtb__27) path) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__28) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__28)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__29) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintWarnings dtb__29)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEmit = (fun path -> (if (dtp_fileExists path) then (if (dtp_isDirectory path) then (v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPkgDir path) else (v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckFileEntry path)) else (v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr path)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckArgs = (fun prog -> (fun args -> (match args with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | C_Base_dList_dList_Base_dList_dCons (dtb__30, dtb__31) -> (if ((v_Base_dString_dstartsWith "-") dtb__30) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__30) else (match dtb__31 with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEmit dtb__30)
  | _ -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_disSingleLibraryPackage = (fun pkgs -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__32, dtb__33) -> (match dtb__33 with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dBool_dnot (dtp_fileExists (v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry dtb__32)))
  | _ -> false
)
  | _ -> false
)) pkgs))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dlibraryOnlyMessage = (fun pkgs -> (match pkgs with
  | C_Base_dList_dList_Base_dList_dCons (dtb__34, dtb__35) -> ((bi_concat "library package ") ((bi_concat (v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__34)) " has no app/Main.vuna (executable package required; use `check` for libraries)"))
  | C_Base_dList_dList_Base_dList_dNil -> "no package to build"
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPackageByName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__36, dtb__37) -> (if ((bi_eq_str (v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__36)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__36)) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPackageByName mc0) dtb__37))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dselectBuildTargets = (fun pkgM -> (fun pkgs -> (match pkgM with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (pkgs))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__38) -> (match ((v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPackageByName dtb__38) pkgs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "no such package in workspace: ") dtb__38)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__39) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons (dtb__39, C_Base_dList_dList_Base_dList_dNil))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileCodegen = (fun ctx -> (fun entry -> (fun outDir -> (match ((((v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir ctx) entry) true) outDir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__40) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__40)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__41) -> 0
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildLinked = (fun ctx -> (fun entry -> (fun outDir -> (fun name -> ((fun _u -> (match (((v_Vuna_dCompiler_dDriver_dCompile_drunBuildScript outDir) ((bi_concat "bin/") name)) name) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__42) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__42)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__43) -> ((fun _u -> ((fun _u -> 0) (dtp_print ((bi_concat "built ") ((bi_concat outDir) ((bi_concat "/bin/") ((bi_concat name) "\n"))))))) ((((v_Vuna_dCompiler_dDriver_dCompile_dwriteBuildMeta outDir) ctx) entry) true))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath ((bi_concat outDir) "/bin")))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildOne = (fun noCompile -> (fun multiOut -> (fun outM -> (fun pkg -> ((fun name -> ((fun outDir -> ((fun entry -> (if (dtp_fileExists entry) then ((fun ctx -> ((fun binPath -> (if noCompile then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileCodegen ctx) entry) outDir) else (if ((((v_Vuna_dCompiler_dDriver_dCompile_dmetaUpToDate outDir) ctx) entry) binPath) then ((fun _u -> 0) (dtp_print ((bi_concat "up to date: ") ((bi_concat binPath) "\n")))) else (match ((((v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir ctx) entry) true) outDir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__44) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__44)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__45) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildLinked ctx) entry) outDir) name)
  | _ -> failwith "DT: impossible branch"
)))) ((bi_concat outDir) ((bi_concat "/bin/") name)))) (v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg)) else (match (v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage pkg) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__46) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__46)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__47) -> ((fun _u -> ((fun _u -> 0) (dtp_print ((bi_concat "skipped (library): ") ((bi_concat name) ((bi_concat " -> ") ((bi_concat outDir) "\n"))))))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintWarnings dtb__47))
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg))) (match outM with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__48) -> (if multiOut then ((bi_concat dtb__48) ((bi_concat "/") name)) else dtb__48)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((bi_concat (v_Vuna_dCompiler_dPackages_dPkg_dpackageDir pkg)) "/.output")
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg))))))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildTargets = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__49, dtb__50) -> ((fun c -> ((fun next -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildTargets mc0) mc1) mc2) dtb__50) next)) (if ((bi_gt_int c) mc4) then c else mc4))) ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildOne mc0) mc1) mc2) dtb__49))
  | C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildRun = (fun noCompile -> (fun dir -> (fun outM -> (fun pkgM -> (match (v_Vuna_dCompiler_dPackages_dPkg_dworkspacePackages dir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__51) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__51)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__52) -> (if (v_Vuna_dCompiler_dDriver_dCompilerCli_disSingleLibraryPackage dtb__52) then (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr (v_Vuna_dCompiler_dDriver_dCompilerCli_dlibraryOnlyMessage dtb__52)) else (match ((v_Vuna_dCompiler_dDriver_dCompilerCli_dselectBuildTargets pkgM) dtb__52) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__53) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__53)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__54) -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildTargets noCompile) ((bi_gt_int (v_Base_dList_dlength dtb__52)) 1)) outM) dtb__54) 0)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse = (fun prog -> (fun noCompile -> (fun out -> (fun dir -> (fun pkg -> (fun args -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__55, dtb__56) -> (if ((bi_eq_str dtb__55) "--no-compile") then ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) true) out) dir) pkg) dtb__56) else (if ((bi_eq_str dtb__55) "--out") then (match dtb__56 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__57, dtb__58) -> (if ((v_Base_dString_dstartsWith "-") dtb__57) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__57) else (match out with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) noCompile) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__57))) dir) pkg) dtb__58)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__59) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
) else (if ((bi_eq_str dtb__55) "--package") then (match dtb__56 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__60, dtb__61) -> (if ((v_Base_dString_dstartsWith "-") dtb__60) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__60) else (match pkg with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) noCompile) out) dir) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__60))) dtb__61)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__62) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
) else (if ((v_Base_dString_dstartsWith "-") dtb__55) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__55) else (match dir with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) noCompile) out) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__55))) pkg) dtb__56)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__63) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
)))))
  | C_Base_dList_dList_Base_dList_dNil -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildRun noCompile) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddefaultDir dir)) out) pkg)
  | _ -> failwith "DT: impossible branch"
)) args)))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildArgs = (fun prog -> (fun args -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) false) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) args)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor1 = (fun prog -> (fun args -> (match args with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | C_Base_dList_dList_Base_dList_dCons (dtb__64, dtb__65) -> (if ((bi_eq_str dtb__64) "compile") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileArgs prog) dtb__65) else (if ((bi_eq_str dtb__64) "check") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckArgs prog) dtb__65) else (if ((bi_eq_str dtb__64) "build") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildArgs prog) dtb__65) else (if ((bi_eq_str dtb__64) "version") then (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintVersion 0) else (if ((bi_eq_str dtb__64) "--version") then (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintVersion 0) else (if ((bi_eq_str dtb__64) "seed") then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedCommand prog) "seed") "use `build --out OUT [DIR]` or `compile DIR OUT`") else (if ((bi_eq_str dtb__64) "help") then (v_Vuna_dCompiler_dDriver_dCompilerCli_dhelpFor prog) else (if ((v_Base_dString_dstartsWith "-") dtb__64) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__64) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dunknownCommand prog) dtb__64)))))))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor = (fun prog -> (fun args -> (if (v_Vuna_dCompiler_dDriver_dCompilerCli_danyHelp args) then (v_Vuna_dCompiler_dDriver_dCompilerCli_dhelpFor prog) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor1 prog) args))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCli = (fun args -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor "vuna-compiler") args))
