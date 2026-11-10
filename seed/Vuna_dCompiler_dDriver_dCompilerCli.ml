open Vuna_runtime
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsageLines = (fun prog -> (String.concat "" ["  "; prog; " compile [--no-print] [--release] (<entry.vuna> | <package-dir>) <out-dir>\n  "; prog; " check [--release] (<entry.vuna> | <package-dir>)\n  "; prog; " build [--release] [--no-compile] [--out DIR] [--package NAME] [DIR]\n  --no-print                    compile \231\148\159\230\136\144\231\154\132\231\168\139\229\186\143\228\184\141\230\137\147\229\141\176 main \231\187\147\230\158\156\239\188\136\233\187\152\232\174\164\230\137\147\229\141\176\239\188\137\n  --release                     release \230\158\132\229\187\186\239\188\154\230\139\146\231\187\157 assert / todo \231\173\137 debug \228\184\147\231\148\168\230\158\132\233\128\160\n  "; prog; " version, --version          \230\152\190\231\164\186\231\137\136\230\156\172\n  "; prog; " help, -h\n"]))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsage = (fun prog -> ("usage:\n" ^ (v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsageLines prog)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintVersion = (fun _u -> ((fun _u -> 0) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_print dtio_0) (String.concat "" ["vuna-compiler "; Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion; "\n"])))))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_danyHelp = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (if (if (dtb__0 = "-h") then true else (dtb__0 = "--help")) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_danyHelp dtb__1))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dhelpFor = (fun prog -> ((fun _u -> 0) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_print dtio_0) (v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsage prog)))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr = (fun prog -> ((fun _u -> 2) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_print dtio_0) (v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsage prog)))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dunknownCommand = (fun prog arg -> ((fun _u -> 2) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_print dtio_0) (String.concat "" ["error: unknown command `"; arg; "`\nrun `"; prog; " help` for the command list\n"])))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedCommand = (fun prog cmd hint -> ((fun _u -> 2) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_print dtio_0) (String.concat "" ["error: `"; cmd; "` has been removed; "; hint; "\n"])))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag = (fun name -> ("--" ^ name))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlagHint = (fun flag -> (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "dt")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("DT is the only path; drop the flag")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "package")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("use `build` or `compile`")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "split")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("split is the only output model; use `build --out OUT [DIR]` or `compile <pkg-dir> OUT`")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "root")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("module resolution is decided by the nearest vuna.toml; set VUNA_BASE for standalone files")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "out")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("pass OUTDIR positionally to `compile`; `build` accepts --out DIR")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "no-typecheck")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("checking is always enabled")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "typecheck")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("checking is always enabled")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "typed")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("DT is the only path")) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag = (fun prog flag -> (match (v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlagHint flag) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__2) -> ((fun _u -> 2) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_print dtio_0) (String.concat "" ["error: "; flag; " has been removed; "; dtb__2; "\n"]))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText = (fun e -> ((fun _u -> 1) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_print dtio_0) (Vuna_dCompiler_dDriver_dDiagRender.v_Vuna_dCompiler_dDriver_dDiagRender_drenderCliDiagnostic e)))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr = (fun e -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText (String.concat "" ["error: "; e; "\n"])))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dprintWarnings = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__3, dtb__4) -> ((fun _u -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintWarnings dtb__4)) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_print dtio_0) (Vuna_dCompiler_dDriver_dDiagRender.v_Vuna_dCompiler_dDriver_dDiagRender_drenderCliDiagnostic (dtb__3 ^ "\n")))))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_ddefaultDir = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "."
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__5) -> dtb__5
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr = (fun path -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr ("no such file or package directory: " ^ path)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackageAt = (fun label dir -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dloadPackage dir)) (fun pkg -> (if (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg))) then (Base_dResult.C_Base_dResult_dResult_Ok (pkg)) else (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": library package "; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); " has no app/Main.vuna (executable package required)"])))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackage = (fun label dir -> (if (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) dir)) then (if (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_isDirectory dtio_0) dir)) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackageAt label) dir) else (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": expects a package directory, not a file: "; dir])))) else (Base_dResult.C_Base_dResult_dResult_Err (("no such file or package directory: " ^ dir)))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFileEntry = (fun printResult entry outDir -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextForFile entry) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__6) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__6)
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__7) -> (match ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir dtb__7) entry) printResult) outDir) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__8) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__8)
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__9) -> 0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilePkgDir = (fun printResult dir outDir -> (match ((v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackage "compile") dir) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__10) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__10)
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__11) -> (match ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext dtb__11)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry dtb__11)) printResult) outDir) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__12) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__12)
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__13) -> 0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileRun = (fun printResult entry outDir -> (if (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) entry)) then (if (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_isDirectory dtio_0) entry)) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilePkgDir printResult) entry) outDir) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFileEntry printResult) entry) outDir)) else (v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr entry)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFinish = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__14) -> (match mc3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr mc0)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__15) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileRun mc1) dtb__14) dtb__15)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr mc0)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse = (fun prog printResult entry outDir args -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (if (dtb__16 = "--no-print") then (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) false) entry) outDir) dtb__17) else (if (dtb__16 = "--release") then (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) printResult) entry) outDir) dtb__17) else (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__16) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__16) else (match entry with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) printResult) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__16))) outDir) dtb__17)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__18) -> (match outDir with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) printResult) entry) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__16))) dtb__17)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__19) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFinish prog) printResult) entry) outDir)
  | _ -> failwith "DT: impossible branch"
)) args))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileArgs = (fun prog args -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) true) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) args))

let v_Vuna_dCompiler_dDriver_dCompilerCli_disWorkspaceRoot = (fun pkg -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dworkspacePackages (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageDir pkg)) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__20) -> ((Base_dList.v_Base_dList_dlength dtb__20) > 1)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__21) -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageSeq = (fun pkg code -> ((fun c -> (if (c > code) then c else code)) (match (Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage pkg) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__22) -> ((fun _u -> 1) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_print dtio_0) (((Vuna_dCompiler_dDriver_dDiagRender.v_Vuna_dCompiler_dDriver_dDiagRender_drenderWithPrefix (String.concat "" ["error: ["; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); "] "])) dtb__22) ^ "\n"))))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__23) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintWarnings dtb__23)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckRootsSeq = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__24, dtb__25) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckRootsSeq dtb__25) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageSeq dtb__24) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcountFailures = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__26, dtb__27) -> (if (dtb__26 = 0) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcountFailures mc0) dtb__27) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcountFailures 1) dtb__27))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackages = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__28, dtb__29) -> (match dtb__29 with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageSeq dtb__28) mc1)
  | _ -> ((fun members -> ((fun roots -> ((fun started -> ((fun code1 -> ((fun codes -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcountFailures code1) codes)) ((Base_dList.v_Base_dList_dmap (fun pr -> (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_wait dtio_0) (Base_dPair.v_Base_dPair_dsecondOf pr))))) started))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckRootsSeq roots) mc1))) ((Base_dList.v_Base_dList_dmap (fun pkg -> { Base_dPair.f_Base_dPair_dPair_first = pkg; Base_dPair.f_Base_dPair_dPair_second = (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> (fun args -> dtp_spawn (Base_dList.dtp_ocamlOf args)) dtio_0) (Base_dList.C_Base_dList_dList_Cons ("check", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageDir pkg), Base_dList.C_Base_dList_dList_Nil)))))) })) members))) ((Base_dList.v_Base_dList_dfilter (fun pkg -> (v_Vuna_dCompiler_dDriver_dCompilerCli_disWorkspaceRoot pkg))) mc0))) ((Base_dList.v_Base_dList_dfilter (fun pkg -> (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dDriver_dCompilerCli_disWorkspaceRoot pkg)))) mc0))
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPkgDir = (fun dir -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dworkspacePackages dir) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__30) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__30)
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__31) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackages dtb__31) 0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckFileEntry = (fun path -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextForFile path) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__32) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__32)
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__33) -> (match ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheck dtb__33) path) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__34) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__34)
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__35) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintWarnings dtb__35)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEmit = (fun path -> (if (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then (if (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_isDirectory dtio_0) path)) then (v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPkgDir path) else (v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckFileEntry path)) else (v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr path)))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (if (dtb__36 = "--release") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckArgs mc0) dtb__37) else (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__36) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag mc0) dtb__36) else (match dtb__37 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEmit dtb__36)
  | _ -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr mc0)
)))
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr mc0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_disSingleLibraryPackage = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__38, dtb__39) -> (match dtb__39 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dBool.v_Base_dBool_dnot (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry dtb__38))))
  | _ -> false
)
  | _ -> false
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dlibraryOnlyMessage = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> "no package to build"
  | Base_dList.C_Base_dList_dList_Cons (dtb__40, dtb__41) -> (String.concat "" ["library package "; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__40); " has no app/Main.vuna (executable package required; use `check` for libraries)"])
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPackageByName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__42, dtb__43) -> (if ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__42) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__42)) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPackageByName mc0) dtb__43))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dselectBuildTargets = (fun mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__44) -> (match ((v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPackageByName dtb__44) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err (("no such package in workspace: " ^ dtb__44)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__45) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons (dtb__45, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileCodegen = (fun ctx entry outDir -> (match ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir ctx) entry) true) outDir) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__46) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__46)
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__47) -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildLinked = (fun ctx entry outDir name -> ((fun _u -> (match (((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_drunBuildScript outDir) ("bin/" ^ name)) name) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__48) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__48)
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__49) -> ((fun _u -> ((fun _u -> 0) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_print dtio_0) (String.concat "" ["built "; outDir; "/bin/"; name; "\n"]))))) ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dwriteBuildMeta outDir) ctx) entry) true))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_densureDirPath (outDir ^ "/bin"))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildOne = (fun noCompile multiOut outM pkg -> ((fun name -> ((fun outDir -> ((fun entry -> (if (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) entry)) then ((fun ctx -> ((fun binPath -> (if noCompile then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileCodegen ctx) entry) outDir) else (if ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dmetaUpToDate outDir) ctx) entry) binPath) then ((fun _u -> 0) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_print dtio_0) (String.concat "" ["up to date: "; binPath; "\n"])))) else (match ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir ctx) entry) true) outDir) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__50) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__50)
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__51) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildLinked ctx) entry) outDir) name)
  | _ -> failwith "DT: impossible branch"
)))) (String.concat "" [outDir; "/bin/"; name]))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg)) else (match (Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage pkg) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__52) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__52)
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__53) -> ((fun _u -> ((fun _u -> 0) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_print dtio_0) (String.concat "" ["skipped (library): "; name; " -> "; outDir; "\n"]))))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintWarnings dtb__53))
  | _ -> failwith "DT: impossible branch"
))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg))) (match outM with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__54) -> (if multiOut then (String.concat "" [dtb__54; "/"; name]) else dtb__54)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageDir pkg) ^ "/.output")
  | _ -> failwith "DT: impossible branch"
))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg)))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildTargets = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__55, dtb__56) -> ((fun c -> ((fun next -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildTargets mc0) mc1) mc2) dtb__56) next)) (if (c > mc4) then c else mc4))) ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildOne mc0) mc1) mc2) dtb__55))
  | Base_dList.C_Base_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildRun = (fun noCompile dir outM pkgM -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dworkspacePackages dir) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__57) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__57)
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__58) -> (if (v_Vuna_dCompiler_dDriver_dCompilerCli_disSingleLibraryPackage dtb__58) then (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr (v_Vuna_dCompiler_dDriver_dCompilerCli_dlibraryOnlyMessage dtb__58)) else (match ((v_Vuna_dCompiler_dDriver_dCompilerCli_dselectBuildTargets pkgM) dtb__58) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__59) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr dtb__59)
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__60) -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildTargets noCompile) ((Base_dList.v_Base_dList_dlength dtb__58) > 1)) outM) dtb__60) 0)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse = (fun prog noCompile out dir pkg args -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__61, dtb__62) -> (if (dtb__61 = "--no-compile") then ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) true) out) dir) pkg) dtb__62) else (if (dtb__61 = "--release") then ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) noCompile) out) dir) pkg) dtb__62) else (if (dtb__61 = "--out") then (match dtb__62 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__63, dtb__64) -> (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__63) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__63) else (match out with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) noCompile) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__63))) dir) pkg) dtb__64)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__65) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__61 = "--package") then (match dtb__62 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__66, dtb__67) -> (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__66) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__66) else (match pkg with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) noCompile) out) dir) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__66))) dtb__67)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__68) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
) else (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__61) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__61) else (match dir with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) noCompile) out) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__61))) pkg) dtb__62)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__69) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildRun noCompile) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddefaultDir dir)) out) pkg)
  | _ -> failwith "DT: impossible branch"
)) args))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildArgs = (fun prog args -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) false) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) args))

let v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor1 = (fun prog args -> (match args with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | Base_dList.C_Base_dList_dList_Cons (dtb__70, dtb__71) -> (if (dtb__70 = "compile") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileArgs prog) dtb__71) else (if (dtb__70 = "check") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckArgs prog) dtb__71) else (if (dtb__70 = "build") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildArgs prog) dtb__71) else (if (dtb__70 = "version") then (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintVersion 0) else (if (dtb__70 = "--version") then (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintVersion 0) else (if (dtb__70 = "seed") then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedCommand prog) "seed") "use `build --out OUT [DIR]` or `compile DIR OUT`") else (if (dtb__70 = "help") then (v_Vuna_dCompiler_dDriver_dCompilerCli_dhelpFor prog) else (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__70) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__70) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dunknownCommand prog) dtb__70)))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor = (fun prog args -> (if (v_Vuna_dCompiler_dDriver_dCompilerCli_danyHelp args) then (v_Vuna_dCompiler_dDriver_dCompilerCli_dhelpFor prog) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor1 prog) args)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCli = (fun args -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor "vuna-compiler") args))
