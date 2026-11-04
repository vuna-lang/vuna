open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Base_dHashMap
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
open Vuna_dCompiler_dLoader_dFixity
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dIntrinsics
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Base_dIntMap
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
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsageLines = (fun prog -> (String.concat "" ["  "; prog; " compile [--no-print] (<entry.vuna> | <package-dir>) <out-dir>\n"; "  "; prog; " check (<entry.vuna> | <package-dir>)\n"; "  "; prog; " build [--no-compile] [--out DIR] [--package NAME] [DIR]\n"; "  --no-print                    compile \231\148\159\230\136\144\231\154\132\231\168\139\229\186\143\228\184\141\230\137\147\229\141\176 main \231\187\147\230\158\156\239\188\136\233\187\152\232\174\164\230\137\147\229\141\176\239\188\137\n"; "  "; prog; " version, --version          \230\152\190\231\164\186\231\137\136\230\156\172\n"; "  "; prog; " help, -h\n"]))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsage = (fun prog -> ("usage:\n" ^ (v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsageLines prog)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintVersion = (fun _u -> ((fun _u -> 0) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_print dtio_0)) (String.concat "" ["vuna-compiler "; v_Vuna_dCompiler_dVersion_dvunaVersion; "\n"])))))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_danyHelp = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (if (if (dtb__0 = "-h") then true else (dtb__0 = "--help")) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_danyHelp dtb__1))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dhelpFor = (fun prog -> ((fun _u -> 0) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_print dtio_0)) (v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsage prog)))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr = (fun prog -> ((fun _u -> 2) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_print dtio_0)) (v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsage prog)))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dunknownCommand = (fun prog arg -> ((fun _u -> 2) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_print dtio_0)) (String.concat "" ["error: unknown command `"; arg; "`\n"; "run `"; prog; " help` for the command list\n"])))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedCommand = (fun prog cmd hint -> ((fun _u -> 2) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_print dtio_0)) (String.concat "" ["error: `"; cmd; "` has been removed; "; hint; "\n"])))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag = (fun name -> (String.concat "" ["-"; "-"; name]))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlagHint = (fun flag -> (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "dt")) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("DT is the only path; drop the flag")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "package")) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("use `build` or `compile`")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "split")) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("split is the only output model; use `build --out OUT [DIR]` or `compile <pkg-dir> OUT`")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "root")) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("module resolution is decided by the nearest vuna.toml; set VUNA_BASE for standalone files")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "out")) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("pass OUTDIR positionally to `compile`; `build` accepts --out DIR")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "no-typecheck")) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("checking is always enabled")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "typecheck")) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("checking is always enabled")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "typed")) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("DT is the only path")) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag = (fun prog flag -> (match (v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlagHint flag) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__2) -> ((fun _u -> 2) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_print dtio_0)) (String.concat "" ["error: "; flag; " has been removed; "; dtb__2; "\n"]))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText = (fun e -> ((fun _u -> 1) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_print dtio_0)) e))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr = (fun e -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText (String.concat "" ["error: "; e; "\n"])))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dprintWarnings = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__3, dtb__4) -> ((fun _u -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintWarnings dtb__4)) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_print dtio_0)) (dtb__3 ^ "\n"))))
  | C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_ddefaultDir = (fun mc0 -> (match mc0 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> "."
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__5) -> dtb__5
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr = (fun path -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr ("no such file or package directory: " ^ path)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackageAt = (fun label dir -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage dir)) (fun pkg -> (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) (v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg))) then (C_Base_dResult_dResult_Base_dResult_dOk (pkg)) else (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": library package "; (v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); " has no app/Main.vuna (executable package required)"])))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackage = (fun label dir -> (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) dir)) then (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_isDirectory dtio_0)) dir)) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackageAt label) dir) else (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": expects a package directory, not a file: "; dir])))) else (C_Base_dResult_dResult_Base_dResult_dErr (("no such file or package directory: " ^ dir)))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFileEntry = (fun printResult entry outDir -> (match (v_Vuna_dCompiler_dPackages_dPkg_dcontextForFile entry) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__6) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__6)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__7) -> (match ((((v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir dtb__7) entry) printResult) outDir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__8) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__8)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__9) -> 0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilePkgDir = (fun printResult dir outDir -> (match ((v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackage "compile") dir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__10) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__10)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__11) -> (match ((((v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir (v_Vuna_dCompiler_dPackages_dPkg_dpackageContext dtb__11)) (v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry dtb__11)) printResult) outDir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__12) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__12)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__13) -> 0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileRun = (fun printResult entry outDir -> (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) entry)) then (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_isDirectory dtio_0)) entry)) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilePkgDir printResult) entry) outDir) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFileEntry printResult) entry) outDir)) else (v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr entry)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFinish = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__14) -> (match mc3 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr mc0)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__15) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileRun mc1) dtb__14) dtb__15)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr mc0)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse = (fun prog printResult entry outDir args -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__16, dtb__17) -> (if (dtb__16 = "--no-print") then (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) false) entry) outDir) dtb__17) else (if ((v_Base_dString_dstartsWith "-") dtb__16) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__16) else (match entry with
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
)) args))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileArgs = (fun prog args -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) true) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) args))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackages = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__20, dtb__21) -> ((fun c -> ((fun next -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackages dtb__21) next)) (if (c > mc1) then c else mc1))) (match (v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage dtb__20) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__22) -> ((fun _u -> 1) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_print dtio_0)) (String.concat "" ["error: ["; (v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__20); "] "; dtb__22; "\n"]))))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__23) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintWarnings dtb__23)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

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

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEmit = (fun path -> (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) path)) then (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_isDirectory dtio_0)) path)) then (v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPkgDir path) else (v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckFileEntry path)) else (v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr path)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckArgs = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__30, dtb__31) -> (if ((v_Base_dString_dstartsWith "-") dtb__30) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag mc0) dtb__30) else (match dtb__31 with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEmit dtb__30)
  | _ -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr mc0)
))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr mc0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_disSingleLibraryPackage = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__32, dtb__33) -> (match dtb__33 with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dBool_dnot (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) (v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry dtb__32))))
  | _ -> false
)
  | _ -> false
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dlibraryOnlyMessage = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dNil -> "no package to build"
  | C_Base_dList_dList_Base_dList_dCons (dtb__34, dtb__35) -> (String.concat "" ["library package "; (v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__34); " has no app/Main.vuna (executable package required; use `check` for libraries)"])
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPackageByName = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__36, dtb__37) -> (if ((v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__36) = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__36)) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPackageByName mc0) dtb__37))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dselectBuildTargets = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__38) -> (match ((v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPackageByName dtb__38) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (("no such package in workspace: " ^ dtb__38)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__39) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons (dtb__39, C_Base_dList_dList_Base_dList_dNil))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileCodegen = (fun ctx entry outDir -> (match ((((v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir ctx) entry) true) outDir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__40) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__40)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__41) -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildLinked = (fun ctx entry outDir name -> ((fun _u -> (match (((v_Vuna_dCompiler_dDriver_dCompile_drunBuildScript outDir) ("bin/" ^ name)) name) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__42) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__42)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__43) -> ((fun _u -> ((fun _u -> 0) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_print dtio_0)) (String.concat "" ["built "; outDir; "/bin/"; name; "\n"]))))) ((((v_Vuna_dCompiler_dDriver_dCompile_dwriteBuildMeta outDir) ctx) entry) true))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath (outDir ^ "/bin"))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildOne = (fun noCompile multiOut outM pkg -> ((fun name -> ((fun outDir -> ((fun entry -> (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) entry)) then ((fun ctx -> ((fun binPath -> (if noCompile then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileCodegen ctx) entry) outDir) else (if ((((v_Vuna_dCompiler_dDriver_dCompile_dmetaUpToDate outDir) ctx) entry) binPath) then ((fun _u -> 0) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_print dtio_0)) (String.concat "" ["up to date: "; binPath; "\n"])))) else (match ((((v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir ctx) entry) true) outDir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__44) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__44)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__45) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildLinked ctx) entry) outDir) name)
  | _ -> failwith "DT: impossible branch"
)))) (String.concat "" [outDir; "/bin/"; name]))) (v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg)) else (match (v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage pkg) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__46) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__46)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__47) -> ((fun _u -> ((fun _u -> 0) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_print dtio_0)) (String.concat "" ["skipped (library): "; name; " -> "; outDir; "\n"]))))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintWarnings dtb__47))
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg))) (match outM with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__48) -> (if multiOut then (String.concat "" [dtb__48; "/"; name]) else dtb__48)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dPackages_dPkg_dpackageDir pkg) ^ "/.output")
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg)))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildTargets = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__49, dtb__50) -> ((fun c -> ((fun next -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildTargets mc0) mc1) mc2) dtb__50) next)) (if (c > mc4) then c else mc4))) ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildOne mc0) mc1) mc2) dtb__49))
  | C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildRun = (fun noCompile dir outM pkgM -> (match (v_Vuna_dCompiler_dPackages_dPkg_dworkspacePackages dir) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__51) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__51)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__52) -> (if (v_Vuna_dCompiler_dDriver_dCompilerCli_disSingleLibraryPackage dtb__52) then (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr (v_Vuna_dCompiler_dDriver_dCompilerCli_dlibraryOnlyMessage dtb__52)) else (match ((v_Vuna_dCompiler_dDriver_dCompilerCli_dselectBuildTargets pkgM) dtb__52) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__53) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__53)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__54) -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildTargets noCompile) ((v_Base_dList_dlength dtb__52) > 1)) outM) dtb__54) 0)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse = (fun prog noCompile out dir pkg args -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__55, dtb__56) -> (if (dtb__55 = "--no-compile") then ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) true) out) dir) pkg) dtb__56) else (if (dtb__55 = "--out") then (match dtb__56 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__57, dtb__58) -> (if ((v_Base_dString_dstartsWith "-") dtb__57) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__57) else (match out with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) noCompile) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__57))) dir) pkg) dtb__58)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__59) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__55 = "--package") then (match dtb__56 with
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
)) args))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildArgs = (fun prog args -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) false) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) args))

let v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor1 = (fun prog args -> (match args with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | C_Base_dList_dList_Base_dList_dCons (dtb__64, dtb__65) -> (if (dtb__64 = "compile") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileArgs prog) dtb__65) else (if (dtb__64 = "check") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckArgs prog) dtb__65) else (if (dtb__64 = "build") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildArgs prog) dtb__65) else (if (dtb__64 = "version") then (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintVersion 0) else (if (dtb__64 = "--version") then (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintVersion 0) else (if (dtb__64 = "seed") then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedCommand prog) "seed") "use `build --out OUT [DIR]` or `compile DIR OUT`") else (if (dtb__64 = "help") then (v_Vuna_dCompiler_dDriver_dCompilerCli_dhelpFor prog) else (if ((v_Base_dString_dstartsWith "-") dtb__64) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__64) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dunknownCommand prog) dtb__64)))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor = (fun prog args -> (if (v_Vuna_dCompiler_dDriver_dCompilerCli_danyHelp args) then (v_Vuna_dCompiler_dDriver_dCompilerCli_dhelpFor prog) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor1 prog) args)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCli = (fun args -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor "vuna-compiler") args))
