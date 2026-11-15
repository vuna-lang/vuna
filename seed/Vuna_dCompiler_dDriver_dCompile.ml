open Vuna_runtime
type t_Vuna_dCompiler_dDriver_dCompile_dPkgEntry = { f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peName : string; f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peDir : string; f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peKey : string; f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peEnv : string }
and t_Vuna_dCompiler_dDriver_dCompile_dClosureMod = { f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg : string; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey : string; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv : string; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName : string; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath : string; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc : string; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr : string }
and t_Vuna_dCompiler_dDriver_dCompile_dToolContext = { f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcDepIfaces : Vuna_dCompiler_dDriver_dIface.t_Vuna_dCompiler_dDriver_dIface_dModuleIface Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcDepHashes : (string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcNeeded : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcOwnNames : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcStats : Vuna_dCompiler_dDriver_dIface.t_Vuna_dCompiler_dDriver_dIface_dSourceInfo Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dDriver_dCompile_dCheckMods = { f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmPkg : string; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmKind : string; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmManifest : string; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmSources : string; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmDeps : string; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmVer : string; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmFlags : string }

# 54 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dmapEff = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (mc0 dtb__0)) (fun y -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff mc0) dtb__1)) (fun ys -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dList.C_Base_dList_dList_Cons (y, ys)))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dconcatMapEff = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__2, dtb__3) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (mc0 dtb__2)) (fun xs -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dconcatMapEff mc0) dtb__3)) (fun ys -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dList.v_Base_dList_dappend xs) ys))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 68 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dmapMaybeEff = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (mc0 dtb__4)) (fun y -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapMaybeEff mc0) dtb__5)) (fun ys -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match y with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__6) -> (Base_dList.C_Base_dList_dList_Cons (dtb__6, ys))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ys
  | _ -> failwith "DT: impossible branch"
))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 131 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_densureDirPathFuel = (fun nFs nProcess fuel path -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (if (if (if (path = "") then true else (path = ".")) then true else (path = "/")) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path)) (fun exists -> (if exists then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (((Base_dEffProcess.v_Base_dEffProcess_dprocessRunIn nProcess) ".") (Base_dList.C_Base_dList_dList_Cons ("mkdir", (Base_dList.C_Base_dList_dList_Cons ("-p", (Base_dList.C_Base_dList_dList_Cons (path, Base_dList.C_Base_dList_dList_Nil)))))))))))))

# 128 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_densureDirPath = (fun nFs nProcess path -> ((((v_Vuna_dCompiler_dDriver_dCompile_densureDirPathFuel nFs) nProcess) 256) path))

# 140 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_ddropPastSlash = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__7, dtb__8) -> (if (dtb__7 = 47) then dtb__8 else (v_Vuna_dCompiler_dDriver_dCompile_ddropPastSlash dtb__8))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dparentOfPath = (fun path -> ((fun chars -> ((fun rev -> ((fun after -> (if ((Base_dList.v_Base_dList_dlength after) = (Base_dList.v_Base_dList_dlength rev)) then "." else ((fun parent -> (if (parent = "") then (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then "/" else ".") else (if (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith "/") parent)) else false) then ("/" ^ parent) else parent))) (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse after))))) (v_Vuna_dCompiler_dDriver_dCompile_ddropPastSlash rev))) (Base_dList.v_Base_dList_dreverse chars))) (Base_dList.dtp_unpack path)))

# 340 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcopyFfiFiles = (fun nFs nProcess ctxDir outDir -> ((fun ffiDir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) ffiDir)) (fun exists -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if exists then ((Base_dEffFs.v_Base_dEffFs_dfsIsDirectory nFs) ffiDir) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))) (fun isDir -> (if (if exists then isDir else false) then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadDir nFs) ffiDir)) (fun names -> ((fun cs -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_densureDirPath nFs) nProcess) (outDir ^ "/ffi"))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun n -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) (String.concat "" [ffiDir; "/"; ((Base_dInterp.v_Base_dInterp_dinterp Base_dInterp.v_Interp_uString) n)]))) (fun content -> (((Base_dEffFs.v_Base_dEffFs_dfsWriteFile nFs) (String.concat "" [outDir; "/ffi/"; ((Base_dInterp.v_Base_dInterp_dinterp Base_dInterp.v_Interp_uString) n)])) content))))) cs)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dList.v_Base_dList_dmap (fun n -> ("ffi/" ^ ((Base_dInterp.v_Base_dInterp_dinterp Base_dInterp.v_Interp_uString) n)))) cs))))))) ((Base_dList.v_Base_dList_dfilter (fun n -> ((Base_dString.v_Base_dString_dendsWith ".c") n))) names)))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil))))))) (ctxDir ^ "/ffi")))

# 316 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiledNormalized = (fun nFs nProcess ctx outDir files -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_densureDirPath nFs) nProcess) outDir)) (fun _u -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFilesIfChanged nFs) outDir) files)) (fun written -> (match written with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__9) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__9)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__10) -> ((fun _u -> ((fun graph -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dcopyFfiFiles nFs) nProcess) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx)) outDir)) (fun cFiles -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dEffFs.v_Base_dEffFs_dfsWriteFile nFs) (outDir ^ "/build.sh")) ((Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dbuildScript graph) cFiles))) (fun _u -> ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__10)))) (if (dtp_debug_on 0) then (dtp_debug_line "build-script-done") else 0))))))) (if (dtp_debug_on 0) then (dtp_debug_line "split-graph-done") else 0))) (Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dsplitGraph files))) (if (dtp_debug_on 0) then (dtp_debug_line "write-split-files-done") else 0))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line "write-compiled-start") else 0)))))

# 381 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmetaSchema = 1

# 384 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmetaFileName = "build-meta.json"

# 388 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtextHash = (fun s -> (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_dcontentKey s))

# 397 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint = (fun nFs nEnv -> ((Vuna_dCompiler_dFingerprint.v_Vuna_dCompiler_dFingerprint_dcompilerFingerprintEff nFs) nEnv))

# 402 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcacheBase = (fun nFs nEnv nProcess -> (((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreRootReadyEff nFs) nEnv) nProcess))

# 407 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dskipMetaDir = (fun name -> (Vuna_dCompiler_dPackages_dSource.v_Vuna_dCompiler_dPackages_dSource_dskipSourceDir name))

# 410 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta = (fun nFs fuel dir -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) dir)) (fun exists -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if exists then ((Base_dEffFs.v_Base_dEffFs_dfsIsDirectory nFs) dir) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))) (fun isDir -> (if (if exists then isDir else false) then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadDir nFs) dir)) (fun names -> ((v_Vuna_dCompiler_dDriver_dCompile_dconcatMapEff (((v_Vuna_dCompiler_dDriver_dCompile_dwalkVunaMeta nFs) (fuel - 1)) dir)) names))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil))))))))
# 420 "Vuna/Compiler/Driver/Compile.vuna"
and v_Vuna_dCompiler_dDriver_dCompile_dwalkVunaMeta = (fun nFs fuel dir name -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil) else (if (name = ".") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil) else (if (name = "..") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil) else (if (v_Vuna_dCompiler_dDriver_dCompile_dskipMetaDir name) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil) else ((fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path)) (fun exists -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if exists then ((Base_dEffFs.v_Base_dEffFs_dfsIsDirectory nFs) path) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))) (fun isDir -> (if (if exists then isDir else false) then (((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta nFs) (fuel - 1)) path) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if ((Base_dString.v_Base_dString_dendsWith ".vuna") name) then (Base_dList.C_Base_dList_dList_Cons (path, Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil)))))))) (String.concat "" [dir; "/"; name])))))))

# 435 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddropPrefixMeta = (fun prefix s -> (if ((Base_dString.v_Base_dString_dstartsWith prefix) s) then (((Base_dString.v_Base_dString_dsubstring (Base_dString.v_Base_dString_dbyteLength prefix)) (bi_natSub (Base_dString.v_Base_dString_dbyteLength s) (Base_dString.v_Base_dString_dbyteLength prefix))) s) else s))

# 443 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dslashToDot = (fun c -> (if (c = 47) then 46 else c))

# 440 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dslashesToDots = (fun s -> (Base_dList.dtp_pack ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dslashToDot) (Base_dList.dtp_unpack s))))

# 446 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath = (fun rootPath path -> ((fun rel0 -> ((fun rel -> (v_Vuna_dCompiler_dDriver_dCompile_dslashesToDots rel)) (if ((Base_dString.v_Base_dString_dendsWith ".vuna") rel0) then (((Base_dString.v_Base_dString_dsubstring 0) (bi_natSub (Base_dString.v_Base_dString_dbyteLength rel0) 5)) rel0) else rel0))) ((v_Vuna_dCompiler_dDriver_dCompile_ddropPrefixMeta (rootPath ^ "/")) path)))

# 453 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_drootSources = (fun nFs root -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta nFs) 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir root))) (fun paths -> ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun p -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) p)) (fun content -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir root)) p); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dDriver_dCompile_dtextHash content) }))))) paths))))

# 466 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__11, dtb__12) -> (match dtb__11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__13; Base_dPair.f_Base_dPair_dPair_second = dtb__14 } -> ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf dtb__12) ((mc1 * 1000003) + dtb__14))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 461 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_drootHash = (fun nFs root -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_drootSources nFs) root)) (fun sources -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf sources) 0)))))

# 471 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dentrySource = (fun nFs entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) entry)) (fun content -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = "<entry>"; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dDriver_dCompile_dtextHash content) }))))

# 477 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_downRootsOf = (fun ctx -> ((Base_dList.v_Base_dList_dfilter (fun r -> ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName r) = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)))

# 480 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcontextSources = (fun nFs ctx entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dconcatMapEff (v_Vuna_dCompiler_dDriver_dCompile_drootSources nFs)) (v_Vuna_dCompiler_dDriver_dCompile_downRootsOf ctx))) (fun own -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dentrySource nFs) entry)) (fun es -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dList.v_Base_dList_dappend own) (Base_dList.C_Base_dList_dList_Cons (es, Base_dList.C_Base_dList_dList_Nil)))))))))

# 487 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes = (fun nFs ctx -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx) with
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | Base_dList.C_Base_dList_dList_Cons (dtb__15, dtb__16) -> ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun r -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_drootHash nFs) r)) (fun h -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName r); Base_dPair.f_Base_dPair_dPair_second = h }))))) dtb__16)
  | _ -> failwith "DT: impossible branch"
))

# 505 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryKind = "pkgiface"

# 508 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryCodec = "pkg-iface-summary 1"

# 511 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryKeyOf = (fun pkg srcClosure tag -> (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_daddrOf (Base_dList.C_Base_dList_dList_Cons ("pkgiface", (Base_dList.C_Base_dList_dList_Cons (pkg, (Base_dList.C_Base_dList_dList_Cons (srcClosure, (Base_dList.C_Base_dList_dList_Cons (tag, Base_dList.C_Base_dList_dList_Nil))))))))))

# 515 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepRootIdentityEff = (fun nFs nEnv nProcess root -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_drootHash nFs) root)) (fun h -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dFingerprint.v_Vuna_dCompiler_dFingerprint_dcompilerTagEff nFs) nEnv)) (fun tag -> ((fun key -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectReadEff nFs) nEnv) nProcess) v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryKind) v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryCodec) key)) (fun saved -> ((fun verdict -> ((fun _u -> (match saved with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__17) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName root); Base_dPair.f_Base_dPair_dPair_second = ("iface:" ^ dtb__17) })
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun tomlPath -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) tomlPath)) (fun exists -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if exists then ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) tomlPath) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ""))) (fun toml -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName root); Base_dPair.f_Base_dPair_dPair_second = ("manifest:" ^ (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_dtextHash toml))) })))))) ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir root) ^ "/vuna.toml"))
  | _ -> failwith "DT: impossible branch"
)) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["dep-identity="; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName root); " verdict="; verdict])) else 0))) (match saved with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__18) -> "iface"
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "manifest"
  | _ -> failwith "DT: impossible branch"
))))) (((v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryKeyOf (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName root)) (bi_strFromInt h)) tag)))))))

# 538 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesEff = (fun nFs nEnv nProcess ctx -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx) with
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | Base_dList.C_Base_dList_dList_Cons (dtb__19, dtb__20) -> ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (((v_Vuna_dCompiler_dDriver_dCompile_ddepRootIdentityEff nFs) nEnv) nProcess)) dtb__20)
  | _ -> failwith "DT: impossible branch"
))

# 546 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpairText = (fun p -> (String.concat "" [(Base_dPair.v_Base_dPair_dfirstOf p); "="; (Base_dPair.v_Base_dPair_dsecondOf p)]))

# 543 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesHash = (fun pairs -> (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_daddrOf (Base_dList.C_Base_dList_dList_Cons ("dep-identities", ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dpairText) pairs)))))

# 550 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwritePkgIfaceSummaryEff = (fun nFs nEnv nProcess ctx modules -> (match ((Base_dList.v_Base_dList_dfilter (fun r -> ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName r) = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) with
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | Base_dList.C_Base_dList_dList_Cons (dtb__21, dtb__22) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_drootHash nFs) dtb__21)) (fun h -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dFingerprint.v_Vuna_dCompiler_dFingerprint_dcompilerTagEff nFs) nEnv)) (fun tag -> ((fun key -> ((fun payload -> (((((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectWriteEff nFs) nEnv) nProcess) v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryKind) v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryCodec) key) payload)) ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpkgIfaceHashOfModules (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) modules))) (((v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryKeyOf (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) (bi_strFromInt h)) tag))))))
  | _ -> failwith "DT: impossible branch"
))

# 561 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmetaPairText = (fun mc0 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__23; Base_dPair.f_Base_dPair_dPair_second = dtb__24 } -> (String.concat "" ["{\"name\":\""; dtb__23; "\",\"hash\":"; (bi_strFromInt dtb__24); "}"])
  | _ -> failwith "DT: impossible branch"
))

# 564 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__25, dtb__26) -> (match dtb__26 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__25
  | _ -> (String.concat "" [dtb__25; ","; (v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList dtb__26)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 571 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dlastSegmentRev = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__27, dtb__28) -> (if (dtb__27 = 47) then (Base_dList.dtp_pack mc1) else ((v_Vuna_dCompiler_dDriver_dCompile_dlastSegmentRev dtb__28) (Base_dList.C_Base_dList_dList_Cons (dtb__27, mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.dtp_pack mc1)
  | _ -> failwith "DT: impossible branch"
))

# 575 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dlastSegment = (fun path -> ((v_Vuna_dCompiler_dDriver_dCompile_dlastSegmentRev (Base_dList.v_Base_dList_dreverse (Base_dList.dtp_unpack path))) Base_dList.C_Base_dList_dList_Nil))

# 590 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmetaPathOf = (fun outDir -> (String.concat "" [outDir; "/"; v_Vuna_dCompiler_dDriver_dCompile_dmetaFileName]))

# 615 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_drunBuildScript = (fun nProcess dir out name -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dEffProcess.v_Base_dEffProcess_dprocessRunIn nProcess) dir) (Base_dList.C_Base_dList_dList_Cons ("sh", (Base_dList.C_Base_dList_dList_Cons ("build.sh", (Base_dList.C_Base_dList_dList_Cons (out, Base_dList.C_Base_dList_dList_Nil)))))))) (fun code -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if (code = 0) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr (String.concat "" ["build: "; name; ": `sh build.sh "; out; "` failed in "; dir; " (exit "; (bi_strFromInt code); ")"])))))))

# 624 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckNodeSchema = "vuna-check-node 2"

# 627 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dhashText = (fun n -> (bi_strFromInt n))

# 638 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmaybeSemanticText = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__29) -> dtb__29
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 642 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepSourceText = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepUrl (dtb__30) -> ("url:" ^ dtb__30)
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepGit (dtb__31, dtb__32) -> (String.concat "" ["git:"; dtb__31; "@"; dtb__32])
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepPath (dtb__33) -> ("path:" ^ dtb__33)
  | _ -> failwith "DT: impossible branch"
))

# 647 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepSemanticText = (fun d -> (String.concat "" [(d).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias; "|"; (v_Vuna_dCompiler_dDriver_dCompile_ddepSourceText (d).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource); "|"; (v_Vuna_dCompiler_dDriver_dCompile_dmaybeSemanticText (d).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash)]))

# 650 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmanifestSemanticText = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__34) -> ((fun man -> ((fun exportsText -> ((Base_dString.v_Base_dString_djoin "\n") (Base_dList.C_Base_dList_dList_Cons (("name:" ^ (v_Vuna_dCompiler_dDriver_dCompile_dmaybeSemanticText (man).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName)), (Base_dList.C_Base_dList_dList_Cons (("exports:" ^ exportsText), ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_ddepSemanticText) (man).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies))))))) (match (man).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__35) -> ((Base_dString.v_Base_dString_djoin ",") dtb__35)
  | _ -> failwith "DT: impossible branch"
))) (dtb__34).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 578 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dbuildMetaText = (fun nFs ctx entry linked -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dcontextSources nFs) ctx) entry)) (fun sources -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes nFs) ctx)) (fun deps -> ((fun manifestHash -> ((fun entryName -> ((fun linkedText -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" ["{\"schema\":"; (bi_strFromInt v_Vuna_dCompiler_dDriver_dCompile_dmetaSchema); ",\"compiler\":\""; Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion; "\",\"package\":\""; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx); "\",\"entry\":\""; entryName; "\",\"linked\":"; linkedText; ",\"closure\":"; (bi_strFromInt ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf sources) 0)); ",\"manifest\":"; (bi_strFromInt manifestHash); ",\"sources\":["; (v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmetaPairText) sources)); "],\"dependencies\":["; (v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmetaPairText) deps)); "]}\n"]))) (if linked then "true" else "false"))) (v_Vuna_dCompiler_dDriver_dCompile_dlastSegment entry))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dmanifestSemanticText (ctx).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage))))))))

# 593 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwriteBuildMeta = (fun nFs outDir ctx entry linked -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dbuildMetaText nFs) ctx) entry) linked)) (fun text -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dEffFs.v_Base_dEffFs_dfsWriteFile nFs) (v_Vuna_dCompiler_dDriver_dCompile_dmetaPathOf outDir)) text)) (fun n -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) n))))))

# 600 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmetaUpToDate = (fun nFs outDir ctx entry binPath -> ((fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path)) (fun exists -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if exists then ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) binPath) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))) (fun binExists -> (if (if exists then binExists else false) then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) path)) (fun raw -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dbuildMetaText nFs) ctx) entry) true)) (fun expected -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (raw = expected)))))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))))))) (v_Vuna_dCompiler_dDriver_dCompile_dmetaPathOf outDir)))

# 662 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dreleaseFlagOf = (fun ctx -> (if (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx) then "release" else "debug"))

# 698 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackagesFuel = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (if (mc0 <= 0) then { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37)) } else (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__36)) mc1) then (((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackagesFuel (mc0 - 1)) mc1) dtb__37) else (match (((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackagesFuel (mc0 - 1)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__36), mc1))) (dtb__36).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageDependencies) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__38; Base_dPair.f_Base_dPair_dPair_second = dtb__39 } -> (match (((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackagesFuel (mc0 - 1)) dtb__38) dtb__37) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__40; Base_dPair.f_Base_dPair_dPair_second = dtb__41 } -> { Base_dPair.f_Base_dPair_dPair_first = dtb__40; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__39) (Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__41))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 695 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackages = (fun seen ps -> (((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackagesFuel 4096) seen) ps))

# 709 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dallNamesIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__42, dtb__43) -> (if ((Base_dList.v_Base_dList_dmemName dtb__42) mc1) then ((v_Vuna_dCompiler_dDriver_dCompile_dallNamesIn dtb__43) mc1) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 706 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsameNameSet = (fun a b -> (if (if ((Base_dList.v_Base_dList_dlength a) = (Base_dList.v_Base_dList_dlength b)) then ((v_Vuna_dCompiler_dDriver_dCompile_dallNamesIn a) b) else false) then ((v_Vuna_dCompiler_dDriver_dCompile_dallNamesIn b) a) else false))

# 720 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepPackageList = (fun ctx -> (match (ctx).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__44) -> (Base_dPair.v_Base_dPair_dsecondOf ((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackages Base_dList.C_Base_dList_dList_Nil) (dtb__44).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageDependencies))
  | _ -> failwith "DT: impossible branch"
))

# 725 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount = (fun ctx -> (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageList ctx)))

# 737 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difaceObjectCodec = "module-iface 3"

# 761 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpkgKeyOf = (fun name -> (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_daddrOf (Base_dList.C_Base_dList_dList_Cons ("pkg", (Base_dList.C_Base_dList_dList_Cons (name, Base_dList.C_Base_dList_dList_Nil))))))

# 778 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dfindPkgEntry = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__45, dtb__46) -> (if ((dtb__45).f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peName = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__45)) else ((v_Vuna_dCompiler_dDriver_dCompile_dfindPkgEntry mc0) dtb__46))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 782 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dfindClosureMod = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__47, dtb__48) -> (if ((dtb__47).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__47)) else ((v_Vuna_dCompiler_dDriver_dCompile_dfindClosureMod mc0) dtb__48))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 786 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dclosureModsEff = (fun nFs ctx pkgs -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun r -> (match ((v_Vuna_dCompiler_dDriver_dCompile_dfindPkgEntry (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName r)) pkgs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__49) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta nFs) 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir r))) (fun paths -> ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun p -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) p)) (fun raw -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg = (dtb__49).f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peName; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey = (dtb__49).f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peKey; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv = (dtb__49).f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peEnv; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName = ((v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir r)) p); f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath = p; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc = (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_dcontentAddress raw); f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr = "" }))))) paths)))
  | _ -> failwith "DT: impossible branch"
))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx))) (fun per -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dList.v_Base_dList_dconcatMap (fun xs -> xs)) per)))))

# 801 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dheaderAddrOfMod = (fun m -> (((Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_dheaderAddrOf (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey) (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName) (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc))

# 829 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwithPrelude = (fun hasPrelude m h -> (if (if (if hasPrelude then ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName <> "Prelude") else false) then (Base_dBool.v_Base_dBool_dnot ((Base_dList.v_Base_dList_dmemName "Prelude") (h).Vuna_dCompiler_dAddr.f_Vuna_dCompiler_dAddr_dModHeader_mhImports)) else false) then ((Base_dList.v_Base_dList_dappend (h).Vuna_dCompiler_dAddr.f_Vuna_dCompiler_dAddr_dModHeader_mhImports) (Base_dList.C_Base_dList_dList_Cons ("Prelude", Base_dList.C_Base_dList_dList_Nil))) else (h).Vuna_dCompiler_dAddr.f_Vuna_dCompiler_dAddr_dModHeader_mhImports))

# 808 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dloadHeaderEff = (fun nFs nEnv nProcess hasPrelude m -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_dreadHeaderEff nFs) nEnv) nProcess) (v_Vuna_dCompiler_dDriver_dCompile_dheaderAddrOfMod m))) (fun cached -> (match cached with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__50) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports = (((v_Vuna_dCompiler_dDriver_dCompile_dwithPrelude hasPrelude) m) dtb__50); f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr = "" })
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath)) (fun raw -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath nFs) nEnv) nProcess) (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath) raw)) (fun parsed -> (match parsed with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__51) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) m)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__52) -> ((fun h -> ((fun imports -> ((fun h2 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_dwriteHeaderEff nFs) nEnv) nProcess) (v_Vuna_dCompiler_dDriver_dCompile_dheaderAddrOfMod m)) h2)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports = imports; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr = "" })))) { Vuna_dCompiler_dAddr.f_Vuna_dCompiler_dAddr_dModHeader_mhName = (h).Vuna_dCompiler_dAddr.f_Vuna_dCompiler_dAddr_dModHeader_mhName; Vuna_dCompiler_dAddr.f_Vuna_dCompiler_dAddr_dModHeader_mhImports = imports; Vuna_dCompiler_dAddr.f_Vuna_dCompiler_dAddr_dModHeader_mhFixities = (h).Vuna_dCompiler_dAddr.f_Vuna_dCompiler_dAddr_dModHeader_mhFixities })) (((v_Vuna_dCompiler_dDriver_dCompile_dwithPrelude hasPrelude) m) h))) ((Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_dheaderOfSource (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName) dtb__52))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))

# 834 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmodGraphEntry = (fun m -> { Base_dPair.f_Base_dPair_dPair_first = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName; Base_dPair.f_Base_dPair_dPair_second = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports })

# 837 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmodNameOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName)

# 840 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_disDepModOf = (fun ctx m -> ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg <> (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)))

# 843 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_disSelfModOf = (fun ctx m -> ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)))

# 846 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmoduleGraphOf = (fun mods -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodGraphEntry) mods))

# 850 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepAddrOf = (fun assign name -> (match ((Base_dList.v_Base_dList_dlookupPair name) assign) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__53) -> dtb__53
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ("ext:" ^ name)
  | _ -> failwith "DT: impossible branch"
))

# 862 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difaceAddrIn = (fun assign m -> (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_daddrOf ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ("iface", (Base_dList.C_Base_dList_dList_Cons (v_Vuna_dCompiler_dDriver_dCompile_difaceObjectCodec, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv, Base_dList.C_Base_dList_dList_Nil))))))))))))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCompile_ddepAddrOf assign)) (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports))))

# 867 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_daddrOfModIn = (fun assign m -> (match ((Base_dList.v_Base_dList_dlookupPair (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName) assign) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__54) -> dtb__54
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ("ext:" ^ (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName)
  | _ -> failwith "DT: impossible branch"
))

# 872 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwithAddr = (fun assign m -> { f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr = ((v_Vuna_dCompiler_dDriver_dCompile_daddrOfModIn assign) m) })

# 879 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsortNames = (fun _uarity0 -> ((Base_dSort.v_Base_dSort_dsortBy (fun a b -> (((Base_dOrd.v_Base_dOrd_dle Base_dString.v_Ord_uString) a) b))) _uarity0))

# 891 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dassignOrdered = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__55, dtb__56) -> (match ((v_Vuna_dCompiler_dDriver_dCompile_dfindClosureMod dtb__55) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dDriver_dCompile_dassignOrdered dtb__56) mc1) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__57) -> ((fun a -> (((v_Vuna_dCompiler_dDriver_dCompile_dassignOrdered dtb__56) mc1) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__55; Base_dPair.f_Base_dPair_dPair_second = a }, mc2)))) ((v_Vuna_dCompiler_dDriver_dCompile_difaceAddrIn mc2) dtb__57))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 882 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dassignGo = (fun _u mods _u _u -> ((fun assign -> ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCompile_dwithAddr assign)) mods)) (((v_Vuna_dCompiler_dDriver_dCompile_dassignOrdered (v_Vuna_dCompiler_dDriver_dCompile_dsortNames ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodNameOf) mods))) mods) Base_dList.C_Base_dList_dList_Nil)))

# 942 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmodsKind = "mods"

# 945 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmodsCodec = "mods-order 1"

# 948 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmodKeyOf = (fun m -> (String.concat "" [(m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey; "|"; (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName; "|"; (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc; "|"; (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv; "|"; ((Base_dString.v_Base_dString_djoin ",") (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports)]))

# 951 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmodsKeyOf = (fun mods -> (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_daddrOf (Base_dList.C_Base_dList_dList_Cons ("mods", (Base_dList.C_Base_dList_dList_Cons (v_Vuna_dCompiler_dDriver_dCompile_dmodsCodec, ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodKeyOf) mods)))))))

# 954 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dencMods = (fun ps -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencPair Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr) Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr))) ps))

# 957 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddecMods = (fun bytes -> (match (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecPair Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr) Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr)) 65536) (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurOf bytes)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__58) -> (if (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurAtEnd (Base_dPair.v_Base_dPair_dsecondOf dtb__58)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dfirstOf dtb__58))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 962 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_daddrsVia = (fun table mods -> ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCompile_dwithAddr table)) mods))

# 965 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dassignAndWriteMods = (fun nFs nClock nEnv nProcess key mods ta tb tc -> ((fun table -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCountEff "vuna.counter.cache.miss") 1)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectWriteEff nFs) nEnv) nProcess) v_Vuna_dCompiler_dDriver_dCompile_dmodsKind) v_Vuna_dCompiler_dDriver_dCompile_dmodsCodec) key) (v_Vuna_dCompiler_dDriver_dCompile_dencMods table))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffClock.v_Base_dEffClock_dclockNow nClock)) (fun td -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["iface-mods-phases n="; (bi_strFromInt (Base_dList.v_Base_dList_dlength mods)); " closure="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (tb - ta) / 1000)); "ms headers="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (tc - tb) / 1000)); "ms assign="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (td - tc) / 1000)); "ms"])) else 0))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsMarkEff "vuna.iface.compute")) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_daddrsVia table) mods))))))))))))) (((v_Vuna_dCompiler_dDriver_dCompile_dassignOrdered (v_Vuna_dCompiler_dDriver_dCompile_dsortNames ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodNameOf) mods))) mods) Base_dList.C_Base_dList_dList_Nil)))

# 906 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difaceModsWithEff = (fun nFs nClock nEnv nProcess ctx pkgs -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsMarkEff "vuna.iface.compute")) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffClock.v_Base_dEffClock_dclockNow nClock)) (fun ta -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dclosureModsEff nFs) ctx) pkgs)) (fun mods0 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffClock.v_Base_dEffClock_dclockNow nClock)) (fun tb -> ((fun hasPrelude -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff ((((v_Vuna_dCompiler_dDriver_dCompile_dloadHeaderEff nFs) nEnv) nProcess) hasPrelude)) mods0)) (fun mods -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffClock.v_Base_dEffClock_dclockNow nClock)) (fun tc -> ((fun key -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectReadEff nFs) nEnv) nProcess) v_Vuna_dCompiler_dDriver_dCompile_dmodsKind) v_Vuna_dCompiler_dDriver_dCompile_dmodsCodec) key)) (fun cached -> (match cached with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__59) -> (match (v_Vuna_dCompiler_dDriver_dCompile_ddecMods dtb__59) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__60) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffClock.v_Base_dEffClock_dclockNow nClock)) (fun td -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["iface-mods-phases n="; (bi_strFromInt (Base_dList.v_Base_dList_dlength mods)); " closure="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (tb - ta) / 1000)); "ms headers="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (tc - tb) / 1000)); "ms assign=cached total="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (td - ta) / 1000)); "ms"])) else 0))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCountEff "vuna.counter.cache.hit") 1)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsMarkEff "vuna.iface.compute")) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_daddrsVia dtb__60) mods))))))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((((v_Vuna_dCompiler_dDriver_dCompile_dassignAndWriteMods nFs) nClock) nEnv) nProcess) key) mods) ta) tb) tc)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((((v_Vuna_dCompiler_dDriver_dCompile_dassignAndWriteMods nFs) nClock) nEnv) nProcess) key) mods) ta) tb) tc)
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDriver_dCompile_dmodsKeyOf mods))))))) ((Base_dList.v_Base_dList_dmemName "Prelude") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodNameOf) mods0))))))))))))

# 1010 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceAtEff = (fun nFs nEnv nProcess a -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectReadEff nFs) nEnv) nProcess) "iface") v_Vuna_dCompiler_dDriver_dCompile_difaceObjectCodec) a)) (fun payload -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match payload with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__61) -> (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_ddecModuleIfaceComplete dtb__61)
  | _ -> failwith "DT: impossible branch"
)))))

# 1021 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListEff = (fun nFs nEnv nProcess mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__62, dtb__63) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceAtEff nFs) nEnv) nProcess) (dtb__62).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr)) (fun mi -> (match mi with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCountEff "vuna.counter.cache.miss") 1)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["iface-miss "; (dtb__62).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName; " "; (dtb__62).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr; " pkg="; (dtb__62).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg; " src="; (dtb__62).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc])) else 0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__64) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCountEff "vuna.counter.cache.hit") 1)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListEff nFs) nEnv) nProcess) dtb__63)) (fun xs -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match xs with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__65) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons (dtb__64, dtb__65))))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))

# 1040 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepModsOf = (fun ctx mods -> ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompile_disDepModOf ctx)) mods))

# 1043 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dselfModsOf = (fun ctx mods -> ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompile_disSelfModOf ctx)) mods))

# 1068 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dorderKind = "order"

# 1071 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dorderCodec = "module-order 1"

# 1074 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dencOrderNames = (fun names -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr)) names))

# 1077 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddecOrderNamesComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__66) -> (match dtb__66 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__67; Base_dPair.f_Base_dPair_dPair_second = dtb__68 } -> (if (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurAtEnd dtb__68) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__67)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr) (bi_strLength s)) (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurOf s))))

# 1083 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwriteOrderEff = (fun nFs nEnv nProcess pkgKey names -> (((((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectWriteEff nFs) nEnv) nProcess) v_Vuna_dCompiler_dDriver_dCompile_dorderKind) v_Vuna_dCompiler_dDriver_dCompile_dorderCodec) (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_daddrOf (Base_dList.C_Base_dList_dList_Cons ("order", (Base_dList.C_Base_dList_dList_Cons (pkgKey, Base_dList.C_Base_dList_dList_Nil)))))) (v_Vuna_dCompiler_dDriver_dCompile_dencOrderNames names)))

# 1088 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dreadOrderEff = (fun nFs nEnv nProcess pkgKey -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectReadEff nFs) nEnv) nProcess) v_Vuna_dCompiler_dDriver_dCompile_dorderKind) v_Vuna_dCompiler_dDriver_dCompile_dorderCodec) (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_daddrOf (Base_dList.C_Base_dList_dList_Cons ("order", (Base_dList.C_Base_dList_dList_Cons (pkgKey, Base_dList.C_Base_dList_dList_Nil))))))) (fun payload -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match payload with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__69) -> (v_Vuna_dCompiler_dDriver_dCompile_ddecOrderNamesComplete dtb__69)
  | _ -> failwith "DT: impossible branch"
)))))

# 1097 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dorderCoversEff = (fun nFs nEnv nProcess pkg names -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dreadOrderEff nFs) nEnv) nProcess) (v_Vuna_dCompiler_dDriver_dCompile_dpkgKeyOf pkg))) (fun ord -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match ord with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__70) -> ((v_Vuna_dCompiler_dDriver_dCompile_dallNamesIn names) dtb__70)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)))))

# 1105 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dpickByOrder = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__71, dtb__72) -> (match ((v_Vuna_dCompiler_dDriver_dCompile_dfindClosureMod dtb__71) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__73) -> (Base_dList.C_Base_dList_dList_Cons (dtb__73, ((v_Vuna_dCompiler_dDriver_dCompile_dpickByOrder mc0) dtb__72)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dDriver_dCompile_dpickByOrder mc0) dtb__72)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1111 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpkgEq = (fun p m -> ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg = p))

# 1114 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_ddistinctPkgs = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__74, dtb__75) -> (if ((Base_dList.v_Base_dList_dmemName (dtb__74).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg) mc1) then ((v_Vuna_dCompiler_dDriver_dCompile_ddistinctPkgs dtb__75) mc1) else ((v_Vuna_dCompiler_dDriver_dCompile_ddistinctPkgs dtb__75) (Base_dList.C_Base_dList_dList_Cons ((dtb__74).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg, mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 1146 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_drootExportsOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__76, dtb__77) -> (if ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName dtb__76) = mc0) then (dtb__76).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootExports else ((v_Vuna_dCompiler_dDriver_dCompile_drootExportsOf mc0) dtb__77))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1157 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dpickDepMods = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__78, dtb__79) -> (if ((Base_dList.v_Base_dList_dmemName dtb__78) mc3) then ((((v_Vuna_dCompiler_dDriver_dCompile_dpickDepMods mc0) mc1) dtb__79) mc3) else (match ((v_Vuna_dCompiler_dDriver_dCompile_dfindClosureMod dtb__78) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__80) -> (if ((dtb__80).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg <> (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName mc0)) then (Base_dList.C_Base_dList_dList_Cons (dtb__80, ((((v_Vuna_dCompiler_dDriver_dCompile_dpickDepMods mc0) mc1) dtb__79) (Base_dList.C_Base_dList_dList_Cons (dtb__78, mc3))))) else ((((v_Vuna_dCompiler_dDriver_dCompile_dpickDepMods mc0) mc1) dtb__79) (Base_dList.C_Base_dList_dList_Cons (dtb__78, mc3))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dDriver_dCompile_dpickDepMods mc0) mc1) dtb__79) mc3)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1166 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepModsOrdered = (fun ctx mods -> ((((v_Vuna_dCompiler_dDriver_dCompile_dpickDepMods ctx) mods) (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_dtopoModules (v_Vuna_dCompiler_dDriver_dCompile_dmoduleGraphOf mods))) Base_dList.C_Base_dList_dList_Nil))

# 1185 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsourcePathMapOfRoots = (fun nFs roots -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun r -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta nFs) 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir r))) (fun paths -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dList.v_Base_dList_dmap (fun path -> { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir r)) path); Base_dPair.f_Base_dPair_dPair_second = path })) paths)))))) roots)) (fun walked -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dList.v_Base_dList_dconcatMap (fun xs -> xs)) walked)))))

# 1205 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmtimeSafetyWindowSec = 5

# 1231 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmtimeFastPath = (fun nEnv -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffEnv.v_Base_dEffEnv_denvGetEnv nEnv) "VUNA_CACHE_MTIME")) (fun v -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v = "1")))))

# 1244 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dimportNameStr = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = dtb__81; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = dtb__82; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = dtb__83; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = dtb__84 } -> dtb__81
  | _ -> failwith "DT: impossible branch"
))

# 1256 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolImportNamesOf = (fun nFs ctx current imports -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude nFs) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) current) imports)) (fun implicitR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match implicitR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__85) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dimportNameStr) imports)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__86) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dimportNameStr) ((Base_dList.v_Base_dList_dappend imports) dtb__86))
  | _ -> failwith "DT: impossible branch"
)))))

# 1247 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolImportsOfSource = (fun nFs nEnv nProcess ctx label source -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath nFs) nEnv) nProcess) label) source)) (fun parsed -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__87) -> (match dtb__87 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = dtb__88; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = dtb__89; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = dtb__90; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = dtb__91; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileExports = dtb__92; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileReexports = dtb__93; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileOpacity = dtb__94 } -> ((fun nd_uscrut21 -> (match nd_uscrut21 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dDriver_dCompile_dtoolImportNamesOf nFs) ctx) "") dtb__89)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__95) -> (match dtb__95 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__96; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__97; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__98; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExports = dtb__99; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclReexports = dtb__100; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclOpacity = dtb__101; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__102 } -> ((((v_Vuna_dCompiler_dDriver_dCompile_dtoolImportNamesOf nFs) ctx) dtb__96) dtb__89)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__88)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__103) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)) parsed))))

# 1269 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolEnabled = (fun nEnv -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffEnv.v_Base_dEffEnv_denvGetEnv nEnv) "VUNA_IFACE_TOOL")) (fun v -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v <> "0")))))

# 1274 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dimportClosureGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__104, dtb__105) -> (if (mc0 <= 0) then mc3 else (if ((Base_dList.v_Base_dList_dmemName dtb__104) mc3) then ((((v_Vuna_dCompiler_dDriver_dCompile_dimportClosureGo (mc0 - 1)) mc1) dtb__105) mc3) else (match ((v_Vuna_dCompiler_dDriver_dCompile_dfindClosureMod dtb__104) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dDriver_dCompile_dimportClosureGo (mc0 - 1)) mc1) dtb__105) (Base_dList.C_Base_dList_dList_Cons (dtb__104, mc3)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__106) -> ((((v_Vuna_dCompiler_dDriver_dCompile_dimportClosureGo (mc0 - 1)) mc1) ((Base_dList.v_Base_dList_dappend (dtb__106).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports) dtb__105)) (Base_dList.C_Base_dList_dList_Cons (dtb__104, mc3)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 1284 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dimportClosureOf = (fun mods starts -> ((((v_Vuna_dCompiler_dDriver_dCompile_dimportClosureGo 8192) mods) starts) Base_dList.C_Base_dList_dList_Nil))

# 1287 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_disNeededMod = (fun needed m -> ((Base_dList.v_Base_dList_dmemName (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName) needed))

# 1291 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolDepModsOf = (fun ctx mods needed -> ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompile_disNeededMod needed)) ((v_Vuna_dCompiler_dDriver_dCompile_ddepModsOf ctx) mods)))

# 1351 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolTextHash = (fun _uarity0 -> (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest _uarity0))

# 1354 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsourceInfoForPath = (fun nFs path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) path)) (fun raw -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileMtime nFs) path)) (fun mtime -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileSize nFs) path)) (fun size -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siPath = path; Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siHash = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest raw); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siMtime = mtime; Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siSize = size }))))))))

# 1361 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolNowSec = (fun nClock -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffClock.v_Base_dEffClock_dclockNow nClock)) (fun us -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if 1000000 = 0 then failwith "division by zero" else us / 1000000)))))

# 1208 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsourceInfoUnchanged = (fun nFs nClock nEnv path si -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dmtimeFastPath nEnv)) (fun fast -> (if fast then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileMtime nFs) path)) (fun m -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileSize nFs) path)) (fun sz -> (if (if (m = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiMtimeOf si)) then (sz = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiSizeOf si)) else false) then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dtoolNowSec nClock)) (fun now -> (if ((m + v_Vuna_dCompiler_dDriver_dCompile_dmtimeSafetyWindowSec) < now) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) true) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) path)) (fun content -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest content) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf si)))))))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) path)) (fun content -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest content) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf si)))))))))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) path)) (fun content -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest content) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf si)))))))))

# 1193 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dallModuleSourcesValid = (fun nFs nClock nEnv mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__107, dtb__108) -> (match ((Base_dList.v_Base_dList_dlookupPair (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__107)) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__109) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dsourceInfoUnchanged nFs) nClock) nEnv) dtb__109) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf dtb__107))) (fun unchanged -> (if unchanged then (((((v_Vuna_dCompiler_dDriver_dCompile_dallModuleSourcesValid nFs) nClock) nEnv) dtb__108) mc1) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) true)
  | _ -> failwith "DT: impossible branch"
))

# 1177 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceSourcesValid = (fun nFs nClock nEnv roots p pi -> ((fun pkgRoots -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dsourcePathMapOfRoots nFs) pkgRoots)) (fun walked -> (((((v_Vuna_dCompiler_dDriver_dCompile_dallModuleSourcesValid nFs) nClock) nEnv) (pi).Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piModules) walked)))) ((Base_dList.v_Base_dList_dfilter (fun r -> ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName r) = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName p)))) roots)))

# 1369 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsourceFresh = (fun nFs builtSec si -> ((fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path)) (fun exists -> (if (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_uBool_uBool) exists) false) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileMtime nFs) path)) (fun m -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileSize nFs) path)) (fun sz -> (if (if (if (m = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiMtimeOf si)) then (sz = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiSizeOf si)) else false) then (((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiMtimeOf si) + v_Vuna_dCompiler_dDriver_dCompile_dmtimeSafetyWindowSec) <= builtSec) else false) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) true) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) path)) (fun content -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest content) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf si)))))))))))))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiPathOf si)))

# 1384 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dtoolSessionFresh = (fun nFs mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__110, dtb__111) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dsourceFresh nFs) mc0) dtb__110)) (fun fresh -> (if fresh then (((v_Vuna_dCompiler_dDriver_dCompile_dtoolSessionFresh nFs) mc0) dtb__111) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) true)
  | _ -> failwith "DT: impossible branch"
))

# 1421 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmodHashPair = (fun m -> { Base_dPair.f_Base_dPair_dPair_first = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName; Base_dPair.f_Base_dPair_dPair_second = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr })

# 1424 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dstatOfClosureMod = (fun nFs m -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileMtime nFs) (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath)) (fun mtime -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileSize nFs) (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath)) (fun size -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siPath = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath; Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siHash = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc; Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siMtime = mtime; Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siSize = size }))))))

# 1444 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_downCleanWanted = (fun needed exclude m -> (if ((Base_dList.v_Base_dList_dmemName (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName) needed) then (match exclude with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__112) -> ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName <> dtb__112)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
) else false))

# 1502 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolCompilerFingerprint = (fun nFs nEnv -> ((v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint nFs) nEnv))

# 1513 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcanonicalDir = (fun dir -> (if ((Base_dString.v_Base_dString_dendsWith "/") dir) then (((Base_dString.v_Base_dString_dsubstring 0) (bi_natFromInt ((bi_strLength dir) - 1))) dir) else dir))

# 1517 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcanonicalPath = (fun dir file -> ((fun d -> (if (if (d = ".") then true else (d = "")) then file else (if ((Base_dString.v_Base_dString_dstartsWith (d ^ "/")) file) then (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt ((bi_strLength d) + 1))) (bi_natFromInt (((bi_strLength file) - (bi_strLength d)) - 1))) file) else file))) (v_Vuna_dCompiler_dDriver_dCompile_dcanonicalDir dir)))

# 1525 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dresolveStoredPath = (fun dir file -> ((fun d -> (if (if (file = "") then true else ((Base_dString.v_Base_dString_dstartsWith "/") file)) then file else (if (if (d = ".") then true else (d = "")) then file else (String.concat "" [d; "/"; file])))) (v_Vuna_dCompiler_dDriver_dCompile_dcanonicalDir dir)))

# 1532 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dabsoluteSpanLabel = (fun l -> (match (l).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelSpan with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__113) -> ((Base_dString.v_Base_dString_dstartsWith "/") (dtb__113).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile)
  | _ -> failwith "DT: impossible branch"
))

# 1537 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dhasAbsoluteLabels = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__114, dtb__115) -> (if (v_Vuna_dCompiler_dDriver_dCompile_dabsoluteSpanLabel dtb__114) then true else (v_Vuna_dCompiler_dDriver_dCompile_dhasAbsoluteLabels dtb__115))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1541 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_danyAbsoluteChild = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__116, dtb__117) -> (if (v_Vuna_dCompiler_dDriver_dCompile_ddiagHasAbsolutePath dtb__116) then true else (v_Vuna_dCompiler_dDriver_dCompile_danyAbsoluteChild dtb__117))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1545 "Vuna/Compiler/Driver/Compile.vuna"
and v_Vuna_dCompiler_dDriver_dCompile_ddiagHasAbsolutePath = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = dtb__118; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = dtb__119; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = dtb__120; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = dtb__121; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = dtb__122; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = dtb__123; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = dtb__124; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = dtb__125; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = dtb__126; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = dtb__127; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = dtb__128; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = dtb__129; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = dtb__130; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = dtb__131; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = dtb__132; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent = dtb__133; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability = dtb__134 } -> (if (v_Vuna_dCompiler_dDriver_dCompile_dhasAbsoluteLabels dtb__124) then true else (v_Vuna_dCompiler_dDriver_dCompile_danyAbsoluteChild dtb__130))
  | _ -> failwith "DT: impossible branch"
))

# 1549 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_disStableDiag = (fun d -> (match (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dStability_Stable -> true
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dStability_Volatile -> false
  | _ -> failwith "DT: impossible branch"
))

# 1554 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dallStableDiags = (fun ds -> ((Base_dList.v_Base_dList_dlength ((Base_dList.v_Base_dList_dfilter (fun d -> (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dDriver_dCompile_disStableDiag d)))) ds)) = 0))

# 1558 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dprepareForStore = (fun ctx d -> ((fun d2 -> (if (v_Vuna_dCompiler_dDriver_dCompile_ddiagHasAbsolutePath d2) then ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithStability Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dStability_Volatile) d2) else (if (v_Vuna_dCompiler_dDriver_dCompile_disStableDiag d2) then ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithStability Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dStability_Stable) d2) else d2))) ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dmapSpanFile (v_Vuna_dCompiler_dDriver_dCompile_dcanonicalPath (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx))) d)))

# 1565 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dresolveStoredDiag = (fun ctx d -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dmapSpanFile (v_Vuna_dCompiler_dDriver_dCompile_dresolveStoredPath (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx))) d))

# 1568 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dreplayFailure = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__135, dtb__136) -> (match dtb__136 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__135))
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithChildren dtb__136) dtb__135)))
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1593 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckModsOf = (fun pkg kind manifest sources deps ver flags -> { f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmPkg = pkg; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmKind = kind; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmManifest = manifest; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmSources = sources; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmDeps = deps; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmVer = ver; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmFlags = flags })

# 666 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckModsExe = (fun nFs nEnv nProcess ctx entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dcontextSources nFs) ctx) entry)) (fun sources -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesEff nFs) nEnv) nProcess) ctx)) (fun deps -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint nFs) nEnv)) (fun fp -> ((fun srcHash -> ((fun manHash -> ((fun verHash -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckModsOf (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) "exe") (v_Vuna_dCompiler_dDriver_dCompile_dhashText manHash)) (v_Vuna_dCompiler_dDriver_dCompile_dhashText srcHash)) (v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesHash deps)) (v_Vuna_dCompiler_dDriver_dCompile_dhashText verHash)) (v_Vuna_dCompiler_dDriver_dCompile_dreleaseFlagOf ctx)))) ((v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dcheckNodeSchema ^ Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion)) + fp))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dmanifestSemanticText (ctx).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage)))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf sources) 0)))))))))

# 679 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckModsLib = (fun nFs nEnv nProcess ctx names -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dconcatMapEff (v_Vuna_dCompiler_dDriver_dCompile_drootSources nFs)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx))) (fun rootSourcesAll -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesEff nFs) nEnv) nProcess) ctx)) (fun deps -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint nFs) nEnv)) (fun fp -> ((fun srcHash -> ((fun manHash -> ((fun namesHash -> ((fun verHash -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckModsOf (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) ("lib:" ^ (v_Vuna_dCompiler_dDriver_dCompile_dhashText namesHash))) (v_Vuna_dCompiler_dDriver_dCompile_dhashText manHash)) (v_Vuna_dCompiler_dDriver_dCompile_dhashText srcHash)) (v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesHash deps)) (v_Vuna_dCompiler_dDriver_dCompile_dhashText verHash)) (v_Vuna_dCompiler_dDriver_dCompile_dreleaseFlagOf ctx)))) ((v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dcheckNodeSchema ^ Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion)) + fp))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash ((Base_dString.v_Base_dString_djoin "\t") names)))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dmanifestSemanticText (ctx).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage)))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf rootSourcesAll) 0)))))))))

# 1600 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dprojectIdOf = (fun nEnv ctx -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath nEnv) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx))) (fun abs -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_dprojectIdAddrOf abs)))))

# 1606 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_drootKeepEff = (fun nFs nEnv nProcess ctx digests -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dprojectIdOf nEnv) ctx)) (fun pid -> (((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreRootAppendEff nFs) nEnv) nProcess) pid) digests))))

# 1573 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dstoreCheckPayload = (fun nFs nEnv nProcess ctx dig outcome -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectWriteEff nFs) nEnv) nProcess) "check") Vuna_dCompiler_dDiag_dCodec.v_Vuna_dCompiler_dDiag_dCodec_dcheckResultCodec) dig) (Vuna_dCompiler_dDiag_dCodec.v_Vuna_dCompiler_dDiag_dCodec_dencCheckOutcome outcome))) (fun _u -> (((((v_Vuna_dCompiler_dDriver_dCompile_drootKeepEff nFs) nEnv) nProcess) ctx) (Base_dList.C_Base_dList_dList_Cons (dig, Base_dList.C_Base_dList_dList_Nil))))))

# 1647 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_drunAndStore = (fun nFs nEnv nProcess ctx dig run -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCountEff "vuna.counter.cache.miss") 1)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) run) (fun r -> (match r with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__137) -> ((fun stored -> ((fun _u -> (if (v_Vuna_dCompiler_dDriver_dCompile_dallStableDiags stored) then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_dstoreCheckPayload nFs) nEnv) nProcess) ctx) dig) (Vuna_dCompiler_dDiag_dCodec.C_Vuna_dCompiler_dDiag_dCodec_dCheckOutcome_CheckFailed (stored)))) (fun n -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCountEff "vuna.counter.cache.write") 1)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__137)))))) (if (dtp_debug_on 0) then (dtp_debug_line ("check-store write=" ^ (bi_strFromInt n))) else 0)))) else ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__137)))) (if (dtp_debug_on 0) then (dtp_debug_line "check-cache=skip volatile") else 0)))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["check-store stable="; (bi_strFromInt (Base_dList.v_Base_dList_dlength ((Base_dList.v_Base_dList_dfilter (fun d -> (v_Vuna_dCompiler_dDriver_dCompile_disStableDiag d))) stored))); "/"; (bi_strFromInt (Base_dList.v_Base_dList_dlength stored))])) else 0))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCompile_dprepareForStore ctx)) (Base_dList.C_Base_dList_dList_Cons (dtb__137, Base_dList.C_Base_dList_dList_Nil))))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__138) -> ((fun allStored -> ((fun stored -> ((fun dropped -> ((fun _u -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_dstoreCheckPayload nFs) nEnv) nProcess) ctx) dig) (Vuna_dCompiler_dDiag_dCodec.C_Vuna_dCompiler_dDiag_dCodec_dCheckOutcome_CheckPassed (stored)))) (fun n -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCountEff "vuna.counter.cache.write") 1)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__138)))))) (if (dtp_debug_on 0) then (dtp_debug_line ("check-store write=" ^ (bi_strFromInt n))) else 0))))) (if (dropped > 0) then (if (dtp_debug_on 0) then (dtp_debug_line ("check-store dropped=" ^ (bi_strFromInt dropped))) else 0) else 0))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["check-store pass stable="; (bi_strFromInt (Base_dList.v_Base_dList_dlength stored)); "/"; (bi_strFromInt (Base_dList.v_Base_dList_dlength allStored))])) else 0))) (bi_natSub (Base_dList.v_Base_dList_dlength allStored) (Base_dList.v_Base_dList_dlength stored)))) ((Base_dList.v_Base_dList_dfilter v_Vuna_dCompiler_dDriver_dCompile_disStableDiag) allStored))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCompile_dprepareForStore ctx)) dtb__138))
  | _ -> failwith "DT: impossible branch"
)))))) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=miss") else 0)))

# 1763 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_delabFullRequested = (fun nEnv -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffEnv.v_Base_dEffEnv_denvGetEnv nEnv) "VUNA_ELAB_FULL")) (fun v -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v = "1")))))

# 1770 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difaceAuditRequested = (fun nEnv -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffEnv.v_Base_dEffEnv_denvGetEnv nEnv) "VUNA_IFACE_AUDIT")) (fun v -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v = "1")))))

# 1779 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckSignatureOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__139) -> ("err\n" ^ (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagText dtb__139))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__140) -> "ok\n"
  | _ -> failwith "DT: impossible branch"
))

# 1785 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitSignatureOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__141) -> ("err\n" ^ (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagText dtb__141))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__142) -> ("ok\n" ^ ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dencSplitFiles) (Base_dPair.v_Base_dPair_dfirstOf dtb__142)))
  | _ -> failwith "DT: impossible branch"
))

# 1789 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_djoinLines = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__143, dtb__144) -> (if (((Base_dEq.v_Base_dEq_deq (Base_dList.v_Eq_uBase_uList_uList_ua Base_dString.v_Eq_uString)) dtb__144) Base_dList.C_Base_dList_dList_Nil) then dtb__143 else (String.concat "" [dtb__143; "\n"; (v_Vuna_dCompiler_dDriver_dCompile_djoinLines dtb__144)]))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1795 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dauditCompare = (fun subject at s f -> (if (s = f) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr (String.concat "" ["iface-audit-mismatch subject="; subject; " at="; at; " summary="; (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_dtextHash s)); "/"; (bi_strFromInt (bi_strLength s)); " full="; (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_dtextHash f)); "/"; (bi_strFromInt (bi_strLength f))]))))

# 1834 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dreadOneModIface = (fun nFs nEnv nProcess m -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceAtEff nFs) nEnv) nProcess) (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr)) (fun mi -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = m; Base_dPair.f_Base_dPair_dPair_second = mi }))))

# 1847 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dcollectClean = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__145, dtb__146) -> (match (Base_dPair.v_Base_dPair_dsecondOf dtb__145) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dDriver_dCompile_dcollectClean dtb__146)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__147) -> (Base_dList.C_Base_dList_dList_Cons (dtb__147, (v_Vuna_dCompiler_dDriver_dCompile_dcollectClean dtb__146)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1914 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dcleanHashOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__148, dtb__149) -> (if ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__148) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf dtb__148))) else ((v_Vuna_dCompiler_dDriver_dCompile_dcleanHashOf dtb__149) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1905 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__150, dtb__151) -> (match dtb__150 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__152; Base_dPair.f_Base_dPair_dPair_second = dtb__153 } -> (if (dtb__153 = Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_ddepMissingHash) then (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk mc0) mc1) dtb__151) else (match ((Base_dList.v_Base_dList_dlookupPair dtb__152) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__154) -> (if (dtb__154 = dtb__153) then (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk mc0) mc1) dtb__151) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((v_Vuna_dCompiler_dDriver_dCompile_dcleanHashOf mc1) dtb__152) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__155) -> (if (dtb__155 = dtb__153) then (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk mc0) mc1) dtb__151) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 1923 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difaceSchemaTag = Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_difaceSchema

# 1926 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag = (fun nFs nEnv -> ((Vuna_dCompiler_dFingerprint.v_Vuna_dCompiler_dFingerprint_dcompilerTagEff nFs) nEnv))

# 982 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_drootEnvHashOf = (fun nFs nEnv dir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (dir ^ "/vuna.toml"))) (fun tomlPath -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) tomlPath)) (fun exists -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if exists then ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) tomlPath) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ""))) (fun toml -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag nFs) nEnv)) (fun tag -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (String.concat "" [(bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_dtextHash toml)); "|"; tag; "|"]))))))))))))

# 990 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_drootPkgTableEff = (fun nFs nEnv ctx -> ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun r -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_drootEnvHashOf nFs) nEnv) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir r))) (fun env -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peName = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName r); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peDir = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir r); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peKey = (v_Vuna_dCompiler_dDriver_dCompile_dpkgKeyOf (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName r)); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peEnv = (bi_strFromInt env) }))))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)))

# 1003 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difacesForRootsEff = (fun nFs nClock nEnv nProcess ctx -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_drootPkgTableEff nFs) nEnv) ctx)) (fun pkgs -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_difaceModsWithEff nFs) nClock) nEnv) nProcess) ctx) pkgs)) (fun mods -> ((((v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListEff nFs) nEnv) nProcess) mods))))))

# 1321 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dbaseDepIfacesOf = (fun nFs nClock nEnv nProcess ctx -> (match (ctx).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__156) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dDriver_dCompile_difacesForRootsEff nFs) nClock) nEnv) nProcess) ctx)
  | _ -> failwith "DT: impossible branch"
))

# 1813 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpackageEnvHash = (fun nFs nEnv nProcess ctx -> ((fun own -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesEff nFs) nEnv) nProcess) ctx)) (fun deps -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag nFs) nEnv)) (fun tag -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (String.concat "" [(bi_strFromInt own); "|"; tag; "|"; (v_Vuna_dCompiler_dDriver_dCompile_djoinLines ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dpairText) deps))])))))))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dmanifestSemanticText (ctx).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage))))

# 764 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpkgTableEff = (fun nFs nEnv nProcess ctx -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dpackageEnvHash nFs) nEnv) nProcess) ctx)) (fun ownEnv -> ((fun own -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun p -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dpackageEnvHash nFs) nEnv) nProcess) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext p))) (fun e -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peName = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName p); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peDir = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageDir p); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peKey = (v_Vuna_dCompiler_dDriver_dCompile_dpkgKeyOf (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName p)); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peEnv = (bi_strFromInt e) }))))) (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageList ctx))) (fun deps -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dList.C_Base_dList_dList_Cons (own, deps)))))) { f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peName = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peDir = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peKey = (v_Vuna_dCompiler_dDriver_dCompile_dpkgKeyOf (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peEnv = (bi_strFromInt ownEnv) }))))

# 901 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff = (fun nFs nClock nEnv nProcess ctx -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dpkgTableEff nFs) nEnv) nProcess) ctx)) (fun pkgs -> ((((((v_Vuna_dCompiler_dDriver_dCompile_difaceModsWithEff nFs) nClock) nEnv) nProcess) ctx) pkgs))))

# 997 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difacesForContextEff = (fun nFs nClock nEnv nProcess ctx -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> ((((v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListEff nFs) nEnv) nProcess) mods))))

# 1294 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForToolSource = (fun nFs nClock nEnv nProcess ctx label source -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dtoolEnabled nEnv)) (fun enabled -> (if enabled then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_dtoolImportsOfSource nFs) nEnv) nProcess) ctx) label) source)) (fun starts -> ((fun needed -> ((fun depMods -> ((fun _u -> ((((v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListEff nFs) nEnv) nProcess) depMods)) (if (dtp_debug_on 0) then (dtp_debug_line ("tool-closure modules=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength depMods)))) else 0))) (((v_Vuna_dCompiler_dDriver_dCompile_dtoolDepModsOf ctx) mods) needed))) ((v_Vuna_dCompiler_dDriver_dCompile_dimportClosureOf mods) starts)))))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))

# 1309 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForToolProgram = (fun nFs nClock nEnv nProcess ctx program -> (((((((v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForToolSource nFs) nClock) nEnv) nProcess) ctx) "<repl>") program))

# 1391 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolNeededOfImports = (fun nFs nClock nEnv nProcess ctx tool currentName imports -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dtoolImportNamesOf nFs) ctx) currentName) imports)) (fun importNames -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dimportClosureOf mods) importNames)))))))

# 1399 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForToolSourceDetailed = (fun nFs nClock nEnv nProcess ctx label source -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dtoolEnabled nEnv)) (fun enabled -> (if enabled then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_dtoolImportsOfSource nFs) nEnv) nProcess) ctx) label) source)) (fun starts -> ((fun needed -> ((fun depMods -> ((fun depHashes -> ((fun ownNames -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListEff nFs) nEnv) nProcess) depMods)) (fun ifaces -> (match ifaces with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__157) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (v_Vuna_dCompiler_dDriver_dCompile_dstatOfClosureMod nFs)) depMods)) (fun stats -> ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcDepIfaces = dtb__157; f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcDepHashes = depHashes; f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcNeeded = needed; f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcOwnNames = ownNames; f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcStats = stats })))) (if (dtp_debug_on 0) then (dtp_debug_line ("tool-closure modules=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__157)))) else 0))))
  | _ -> failwith "DT: impossible branch"
)))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodNameOf) ((v_Vuna_dCompiler_dDriver_dCompile_dselfModsOf ctx) mods)))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodHashPair) depMods))) (((v_Vuna_dCompiler_dDriver_dCompile_dtoolDepModsOf ctx) mods) needed))) ((v_Vuna_dCompiler_dDriver_dCompile_dimportClosureOf mods) starts)))))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))

# 1477 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwriteModuleIfaceGuarded = (fun nFs nClock nEnv nProcess ctx mi -> (if ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx) = "") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (match ((v_Vuna_dCompiler_dDriver_dCompile_dfindClosureMod (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf mi)) mods) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__158) -> (((((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectWriteEff nFs) nEnv) nProcess) "iface") v_Vuna_dCompiler_dDriver_dCompile_difaceObjectCodec) (dtb__158).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dencModuleIface mi))
  | _ -> failwith "DT: impossible branch"
)))))

# 1463 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolWriteModuleIface = (fun nFs nClock nEnv nProcess nExit nArgs ctx tool clean checked name si -> ((fun miResult -> (match miResult with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__159) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__159)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__160) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_dwriteModuleIfaceGuarded nFs) nClock) nEnv) nProcess) ctx) dtb__160)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__160)))))
  | _ -> failwith "DT: impossible branch"
)) (((((((((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_difaceOfModule (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) si) (tool).f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcDepHashes) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedInherited) clean) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedModules) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedEntryDecls) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram) name)))

# 1803 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceHashTable = (fun nFs nClock nEnv nProcess ctx -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodHashPair) ((v_Vuna_dCompiler_dDriver_dCompile_ddepModsOf ctx) mods))))))

# 1839 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_downCleanInfo = (fun nFs nClock nEnv nProcess ctx _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (((v_Vuna_dCompiler_dDriver_dCompile_dreadOneModIface nFs) nEnv) nProcess)) ((v_Vuna_dCompiler_dDriver_dCompile_dselfModsOf ctx) mods))) (fun reads -> ((fun clean -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = (if ((Base_dList.v_Base_dList_dlength clean) = 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (clean))) })) (v_Vuna_dCompiler_dDriver_dCompile_dcollectClean reads)))))))

# 1853 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_downCleanModules = (fun nFs nClock nEnv nProcess ctx depTbl -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_downCleanInfo nFs) nClock) nEnv) nProcess) ctx) depTbl)) (fun info -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dPair.v_Base_dPair_dsecondOf info)))))

# 1861 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcleanIfacesOrEmpty = (fun nFs nClock nEnv nProcess ctx -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_downCleanModules nFs) nClock) nEnv) nProcess) ctx) Base_dList.C_Base_dList_dList_Nil)) (fun clean -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match clean with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__161) -> dtb__161
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))))

# 1487 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolWriteModuleIfaceCold = (fun nFs nClock nEnv nProcess nExit nArgs ctx checked name si -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dcleanIfacesOrEmpty nFs) nClock) nEnv) nProcess) ctx)) (fun clean -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceHashTable nFs) nClock) nEnv) nProcess) ctx)) (fun depTbl -> ((fun miResult -> (match miResult with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__162) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__162)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__163) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_dwriteModuleIfaceGuarded nFs) nClock) nEnv) nProcess) ctx) dtb__163)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__163)))))
  | _ -> failwith "DT: impossible branch"
)) (((((((((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_difaceOfModule (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) si) depTbl) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedInherited) clean) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedModules) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedEntryDecls) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram) name)))))))

# 1932 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_downSourceInfos = (fun nFs nEnv ctx -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun root -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta nFs) 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir root))) (fun paths -> ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun p -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath nEnv) p)) (fun abs -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) abs)) (fun raw -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileMtime nFs) abs)) (fun mtime -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileSize nFs) abs)) (fun size -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir root)) p); Base_dPair.f_Base_dPair_dPair_second = { Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siPath = abs; Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siHash = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest raw); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siMtime = mtime; Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siSize = size } }))))))))))) paths))))) ((Base_dList.v_Base_dList_dfilter (fun r -> ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName r) = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)))) (fun walked -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dList.v_Base_dList_dconcatMap (fun xs -> xs)) walked)))))

# 1949 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dresyncCleanSources = (fun sources clean -> ((Base_dList.v_Base_dList_dmap (fun m -> (match ((Base_dList.v_Base_dList_dlookupPair (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m)) sources) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__164) -> { Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miName = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPackage = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiPackageOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miSource = dtb__164; Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miIfaceHash = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplHash = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiImplHashOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDepHashes = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImports = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiImportsOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplicitImports = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiImplicitImportsOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miExports = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiExportsOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miFixities = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiFixitiesOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDecls = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDeclsOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miRecords = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiRecordsOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPrepared = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiPreparedOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miCached = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDefLocs = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDefLocsOf m) }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> m
  | _ -> failwith "DT: impossible branch"
))) clean))

# 1963 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dshadowAllowed = (fun ctx -> (match (ctx).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__165) -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageExports dtb__165) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__166) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1971 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dnameExportedBy = (fun names m -> ((Base_dList.v_Base_dList_dmemName (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName) names))

# 1137 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dexportedDepModsOf = (fun ctx p mods -> ((fun inPkg -> (match ((v_Vuna_dCompiler_dDriver_dCompile_drootExportsOf p) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> inPkg
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__167) -> ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompile_dnameExportedBy dtb__167)) inPkg)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompile_dpkgEq p)) mods)))

# 1119 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dgoPkgs = (fun nFs nEnv nProcess mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__168, dtb__169) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dreadOrderEff nFs) nEnv) nProcess) (v_Vuna_dCompiler_dDriver_dCompile_dpkgKeyOf dtb__168))) (fun ord -> (match ord with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__170) -> ((fun picked -> ((fun required -> (if ((v_Vuna_dCompiler_dDriver_dCompile_dallNamesIn ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodNameOf) required)) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodNameOf) picked)) then (((((((v_Vuna_dCompiler_dDriver_dCompile_dgoPkgs nFs) nEnv) nProcess) mc0) mc1) dtb__169) ((Base_dList.v_Base_dList_dappend mc3) picked)) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))) (((v_Vuna_dCompiler_dDriver_dCompile_dexportedDepModsOf mc0) dtb__168) mc1))) ((v_Vuna_dCompiler_dDriver_dCompile_dpickByOrder mc1) dtb__170))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc3)))
  | _ -> failwith "DT: impossible branch"
))

# 1151 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepModsByOrderEff = (fun nFs nEnv nProcess ctx mods -> (((((((v_Vuna_dCompiler_dDriver_dCompile_dgoPkgs nFs) nEnv) nProcess) ctx) mods) ((v_Vuna_dCompiler_dDriver_dCompile_ddistinctPkgs ((v_Vuna_dCompiler_dDriver_dCompile_ddepModsOf ctx) mods)) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil))

# 1046 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf = (fun nFs nClock nEnv nProcess ctx -> (match (ctx).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__171) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_ddepModsByOrderEff nFs) nEnv) nProcess) ctx) mods)) (fun ordered -> (match ordered with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (if (dtp_debug_on 0) then (dtp_debug_line "iface-reject=module-order") else 0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__172) -> ((((v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListEff nFs) nEnv) nProcess) dtb__172)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))

# 177 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsummarySplitParts = (fun nFs nConsole nClock nEnv nProcess ctx entry printResult -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf nFs) nClock) nEnv) nProcess) ctx)) (fun depIfaces -> (match depIfaces with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__173) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_downCleanModules nFs) nClock) nEnv) nProcess) ctx) Base_dList.C_Base_dList_dList_Nil)) (fun clean -> ((fun _u -> ((((((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectWithIfaces nFs) nConsole) nEnv) nProcess) ctx) entry) printResult) dtb__173)) (match clean with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__174) -> (if (dtp_debug_on 0) then (dtp_debug_line ("cache-own-clean=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__174)))) else 0)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectParts nFs) nConsole) nEnv) nProcess) ctx) entry) printResult)
  | _ -> failwith "DT: impossible branch"
))))

# 1238 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForCheck = (fun nFs nClock nEnv nProcess ctx -> (((((v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf nFs) nClock) nEnv) nProcess) ctx))

# 1312 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForTool = (fun nFs nClock nEnv nProcess ctx -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dtoolEnabled nEnv)) (fun enabled -> (if enabled then (((((v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf nFs) nClock) nEnv) nProcess) ctx) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))

# 1714 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsummaryCheckExeParts = (fun nFs nClock nEnv nProcess nExit nArgs wantWarnings ctx entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf nFs) nClock) nEnv) nProcess) ctx)) (fun depIfaces -> (match depIfaces with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun _u -> (((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry)) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=full") else 0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__175) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_downCleanModules nFs) nClock) nEnv) nProcess) ctx) Base_dList.C_Base_dList_dList_Nil)) (fun clean -> (match clean with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__176) -> ((fun cleanReal -> ((fun _u -> ((fun _u -> (((((((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckPackageIncrementalParts nFs) nEnv) nProcess) nExit) nArgs) ctx) entry) dtb__175) cleanReal)) (if (dtp_debug_on 0) then (dtp_debug_line ("cache-own-clean=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength cleanReal)))) else 0))) (if (dtp_debug_on 0) then (dtp_debug_line ("cache-path=summary deps=" ^ (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount ctx)))) else 0))) (if wantWarnings then Base_dList.C_Base_dList_dList_Nil else dtb__176))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun _u -> ((((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckPackageWithIfacesParts nFs) nEnv) nProcess) ctx) entry) dtb__175)) (if (dtp_debug_on 0) then (dtp_debug_line ("cache-path=summary deps=" ^ (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount ctx)))) else 0))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

# 1980 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dexportedOwnOf = (fun ctx own -> (match (ctx).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> own
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__177) -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageExports dtb__177) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> own
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__178) -> ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompile_dnameExportedBy dtb__178)) own)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 2053 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dmissingNamesOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__179, dtb__180) -> (if ((Base_dList.v_Base_dList_dmemName (dtb__179).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName) mc1) then ((v_Vuna_dCompiler_dDriver_dCompile_dmissingNamesOf dtb__180) mc1) else (Base_dList.C_Base_dList_dList_Cons ((dtb__179).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName, ((v_Vuna_dCompiler_dDriver_dCompile_dmissingNamesOf dtb__180) mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 2062 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceObjects = (fun nFs nEnv nProcess mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__181, dtb__182) -> (match ((v_Vuna_dCompiler_dDriver_dCompile_dfindClosureMod (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__181)) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceObjects nFs) nEnv) nProcess) mc0) dtb__182)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__183) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectWriteEff nFs) nEnv) nProcess) "iface") v_Vuna_dCompiler_dDriver_dCompile_difaceObjectCodec) (dtb__183).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dencModuleIface dtb__181))) (fun bytes -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceObjects nFs) nEnv) nProcess) mc0) dtb__182)) (fun n -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if (bytes > 0) then (n + 1) else n))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 1987 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceShadow = (fun nFs nClock nEnv nProcess ctx checked -> (if ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx) = "") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))) else (if (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dDriver_dCompile_dshadowAllowed ctx)) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))) else ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffClock.v_Base_dEffClock_dclockNow nClock)) (fun t0 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffClock.v_Base_dEffClock_dclockNow nClock)) (fun t1 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_downSourceInfos nFs) nEnv) ctx)) (fun sources -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffClock.v_Base_dEffClock_dclockNow nClock)) (fun t2 -> ((fun depTbl -> ((fun own -> ((fun required -> (match ((((((((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_difaceOfPackage (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) sources) depTbl) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedInherited) Base_dList.C_Base_dList_dList_Nil) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedModules) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedEntryDecls) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__184) -> ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil)))) (if (dtp_debug_on 0) then (dtp_debug_line ("iface-reject=compute iface-skip " ^ (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagText dtb__184))) else 0))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__185) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffClock.v_Base_dEffClock_dclockNow nClock)) (fun t3 -> ((fun unwritten -> (if ((Base_dList.v_Base_dList_dlength unwritten) > 0) then ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil)))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["iface-skip partial closure="; (bi_strFromInt (Base_dList.v_Base_dList_dlength own)); " required="; (bi_strFromInt (Base_dList.v_Base_dList_dlength required)); " covered="; (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__185)); " missing="; ((Base_dString.v_Base_dString_djoin ",") unwritten)])) else 0)) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dwriteOrderEff nFs) nEnv) nProcess) (v_Vuna_dCompiler_dDriver_dCompile_dpkgKeyOf (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf) dtb__185))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsMarkEff "vuna.iface.write")) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceObjects nFs) nEnv) nProcess) own) dtb__185)) (fun n -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dwritePkgIfaceSummaryEff nFs) nEnv) nProcess) ctx) dtb__185)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffClock.v_Base_dEffClock_dclockNow nClock)) (fun t4 -> ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__185)))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["iface-write="; (bi_strFromInt n); "/"; (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__185)); " closure="; (bi_strFromInt (Base_dList.v_Base_dList_dlength own)); " phases mods="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (t1 - t0) / 1000)); "ms sources="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (t2 - t1) / 1000)); "ms compute="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (t3 - t2) / 1000)); "ms write="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (t4 - t3) / 1000)); "ms"])) else 0)))))))))))))) ((v_Vuna_dCompiler_dDriver_dCompile_dmissingNamesOf required) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf) dtb__185)))))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDriver_dCompile_dexportedOwnOf ctx) own))) ((v_Vuna_dCompiler_dDriver_dCompile_dselfModsOf ctx) mods))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodHashPair) ((v_Vuna_dCompiler_dDriver_dCompile_ddepModsOf ctx) mods)))))))))))))) (if (dtp_debug_on 0) then (dtp_debug_line "iface-shadow-start") else 0)))))

# 2076 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difaceSelfTestRequested = (fun nEnv -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffEnv.v_Base_dEffEnv_denvGetEnv nEnv) "VUNA_IFACE_SELFTEST")) (fun v -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v = "1")))))

# 1900 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpayloadSelfOk = (fun nEnv m -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_difaceSelfTestRequested nEnv)) (fun self -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if self then ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dhashOfIface m) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf m)) else true)))))

# 1450 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dtoolCleanGo = (fun nFs nEnv mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__186, dtb__187) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dpayloadSelfOk nEnv) dtb__186)) (fun selfOk -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dsourceFresh nFs) mc0) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf dtb__186))) (fun fresh -> (if (if (if (if (if fresh then (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedProgramValid (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf dtb__186)) else false) then selfOk else false) then (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dhasMissingDep (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf dtb__186))) else false) then (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk mc1) mc3) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf dtb__186)) else false) then ((((((v_Vuna_dCompiler_dDriver_dCompile_dtoolCleanGo nFs) nEnv) mc0) mc1) dtb__187) (Base_dList.C_Base_dList_dList_Cons (dtb__186, mc3))) else ((((((v_Vuna_dCompiler_dDriver_dCompile_dtoolCleanGo nFs) nEnv) mc0) mc1) dtb__187) mc3))))) (if selfOk then 0 else (if (dtp_debug_on 0) then (dtp_debug_line ("iface-reject=self-hash " ^ (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__186))) else 0)))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dList.v_Base_dList_dreverse mc3))
  | _ -> failwith "DT: impossible branch"
))

# 1433 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolCleanOwnModules = (fun nFs nClock nEnv nProcess ctx tool builtSec exclude needed -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> ((fun cands -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListEff nFs) nEnv) nProcess) cands)) (fun ifs -> (match ifs with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__188) -> ((((((v_Vuna_dCompiler_dDriver_dCompile_dtoolCleanGo nFs) nEnv) builtSec) (tool).f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcDepHashes) dtb__188) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)))) ((Base_dList.v_Base_dList_dfilter ((v_Vuna_dCompiler_dDriver_dCompile_downCleanWanted needed) exclude)) ((v_Vuna_dCompiler_dDriver_dCompile_dselfModsOf ctx) mods))))))

# 1871 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dcleanModulesGo = (fun nEnv mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__189, dtb__190) -> ((fun pkgOrigin -> ((fun _u -> ((fun sameSource -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dpayloadSelfOk nEnv) dtb__189)) (fun selfOk -> ((fun _u -> ((fun keep -> (if keep then ((((((v_Vuna_dCompiler_dDriver_dCompile_dcleanModulesGo nEnv) mc0) mc1) mc2) dtb__190) (Base_dList.C_Base_dList_dList_Cons (dtb__189, mc4))) else ((((((v_Vuna_dCompiler_dDriver_dCompile_dcleanModulesGo nEnv) mc0) mc1) mc2) dtb__190) mc4))) (if (if (if (if (if pkgOrigin then sameSource else false) then (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedProgramValid (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf dtb__189)) else false) then selfOk else false) then (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dhasMissingDep (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf dtb__189))) else false) then (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk mc2) mc4) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf dtb__189)) else false))) (if selfOk then 0 else (if (dtp_debug_on 0) then (dtp_debug_line ("iface-reject=self-hash " ^ (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__189))) else 0)))))) (match ((Base_dList.v_Base_dList_dlookupPair (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__189)) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__191) -> ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf dtb__191) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf dtb__189)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))) (if pkgOrigin then 0 else (if (dtp_debug_on 0) then (dtp_debug_line ("iface-reject=tool-origin " ^ (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__189))) else 0)))) (match ((Base_dList.v_Base_dList_dlookupPair (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__189)) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__192) -> (dtb__192 = "pkg")
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc4); Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil })
  | _ -> failwith "DT: impossible branch"
))

# 2081 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_difaceHashOfName = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__193, dtb__194) -> (if ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__193) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf dtb__193))) else ((v_Vuna_dCompiler_dDriver_dCompile_difaceHashOfName dtb__194) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2086 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dallSelfHashesOk = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__195, dtb__196) -> (if ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dhashOfIface dtb__195) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf dtb__195)) then (v_Vuna_dCompiler_dDriver_dCompile_dallSelfHashesOk dtb__196) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 2090 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dsameIfaceHashes = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__197, dtb__198) -> (match ((v_Vuna_dCompiler_dDriver_dCompile_difaceHashOfName mc1) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__197)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__199) -> (if (dtb__199 = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf dtb__197)) then ((v_Vuna_dCompiler_dDriver_dCompile_dsameIfaceHashes dtb__198) mc1) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 2097 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckAndShadow = (fun nFs nClock nEnv nProcess ctx checked -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) checked) (fun checkedR -> (match checkedR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__200) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__200)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__201) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceShadow nFs) nClock) nEnv) nProcess) ctx) (Base_dPair.v_Base_dPair_dsecondOf dtb__201))) (fun shadow -> (match shadow with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__202) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__202)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__203) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dPair.v_Base_dPair_dfirstOf dtb__201))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

# 1742 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dfullCheckExe = (fun nFs nClock nEnv nProcess ctx entry -> ((fun _u -> ((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndShadow nFs) nClock) nEnv) nProcess) ctx) (((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry))) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=full") else 0)))

# 1750 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dauditCheckExe = (fun nFs nClock nEnv nProcess nExit nArgs wantWarnings ctx entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dDriver_dCompile_dsummaryCheckExeParts nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) entry)) (fun summary -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry)) (fun full -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dauditCompare "check") entry) (v_Vuna_dCompiler_dDriver_dCompile_dcheckSignatureOf summary)) (v_Vuna_dCompiler_dDriver_dCompile_dcheckSignatureOf full)))) (fun compared -> (match compared with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__204) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__204)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__205) -> ((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndShadow nFs) nClock) nEnv) nProcess) ctx) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) summary))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line ("iface-audit subject=check entry=" ^ entry)) else 0)))))))

# 1701 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedExe = (fun nFs nClock nEnv nProcess nExit nArgs wantWarnings ctx entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_delabFullRequested nEnv)) (fun full -> (if full then ((((((v_Vuna_dCompiler_dDriver_dCompile_dfullCheckExe nFs) nClock) nEnv) nProcess) ctx) entry) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_difaceAuditRequested nEnv)) (fun audit -> (if audit then (((((((((v_Vuna_dCompiler_dDriver_dCompile_dauditCheckExe nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) entry) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dDriver_dCompile_dsummaryCheckExeParts nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) entry)) (fun summary -> ((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndShadow nFs) nClock) nEnv) nProcess) ctx) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) summary)))))))))))

# 2125 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsummaryCheckLibParts = (fun nFs nClock nEnv nProcess nExit nArgs wantWarnings ctx names -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf nFs) nClock) nEnv) nProcess) ctx)) (fun depIfaces -> (match depIfaces with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun _u -> (((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryWithProgramParts nFs) nEnv) nProcess) ctx) names)) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=full") else 0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__206) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_downCleanModules nFs) nClock) nEnv) nProcess) ctx) Base_dList.C_Base_dList_dList_Nil)) (fun clean -> (match clean with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__207) -> ((fun cleanReal -> ((fun _u -> ((fun _u -> (((((((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryPackageIncrementalParts nFs) nEnv) nProcess) nExit) nArgs) ctx) names) dtb__206) cleanReal)) (if (dtp_debug_on 0) then (dtp_debug_line ("cache-own-clean=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength cleanReal)))) else 0))) (if (dtp_debug_on 0) then (dtp_debug_line ("cache-path=summary deps=" ^ (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount ctx)))) else 0))) (if wantWarnings then Base_dList.C_Base_dList_dList_Nil else dtb__207))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun _u -> ((((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryPackageWithIfacesParts nFs) nEnv) nProcess) ctx) names) dtb__206)) (if (dtp_debug_on 0) then (dtp_debug_line ("cache-path=summary deps=" ^ (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount ctx)))) else 0))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

# 2151 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dfullCheckLib = (fun nFs nClock nEnv nProcess ctx names -> ((fun _u -> ((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndShadow nFs) nClock) nEnv) nProcess) ctx) (((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryWithProgramParts nFs) nEnv) nProcess) ctx) names))) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=full") else 0)))

# 2157 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dauditCheckLib = (fun nFs nClock nEnv nProcess nExit nArgs wantWarnings ctx names -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dDriver_dCompile_dsummaryCheckLibParts nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) names)) (fun summary -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryWithProgramParts nFs) nEnv) nProcess) ctx) names)) (fun full -> ((fun subject -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dauditCompare "check-lib") subject) (v_Vuna_dCompiler_dDriver_dCompile_dcheckSignatureOf summary)) (v_Vuna_dCompiler_dDriver_dCompile_dcheckSignatureOf full)))) (fun compared -> (match compared with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__208) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__208)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__209) -> ((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndShadow nFs) nClock) nEnv) nProcess) ctx) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) summary))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line ("iface-audit subject=check-lib entry=" ^ subject)) else 0))) (v_Vuna_dCompiler_dDriver_dCompile_djoinLines names)))))))

# 2114 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedLib = (fun nFs nClock nEnv nProcess nExit nArgs wantWarnings ctx names -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_delabFullRequested nEnv)) (fun full -> (if full then ((((((v_Vuna_dCompiler_dDriver_dCompile_dfullCheckLib nFs) nClock) nEnv) nProcess) ctx) names) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_difaceAuditRequested nEnv)) (fun audit -> (if audit then (((((((((v_Vuna_dCompiler_dDriver_dCompile_dauditCheckLib nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) names) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dDriver_dCompile_dsummaryCheckLibParts nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) names)) (fun summary -> ((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndShadow nFs) nClock) nEnv) nProcess) ctx) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) summary)))))))))))

# 2178 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitNodeSchema = "vuna-split-node 2"

# 2184 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheCodec = "split-files 2"

# 2188 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobTag = (fun nFs nEnv -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dFingerprint.v_Vuna_dCompiler_dFingerprint_dcompilerTagEff nFs) nEnv)) (fun tag -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" [v_Vuna_dCompiler_dDriver_dCompile_dsplitNodeSchema; "/"; tag])))))

# 2194 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitModsOf = (fun nFs nClock nEnv nProcess ctx entry printResult -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dcontextSources nFs) ctx) entry)) (fun sources -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesEff nFs) nEnv) nProcess) ctx)) (fun deps -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint nFs) nEnv)) (fun fp -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf nFs) nClock) nEnv) nProcess) ctx)) (fun ifaces -> ((fun srcHash -> ((fun verHash -> ((fun prHash -> ((fun mode -> ((fun kind -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckModsOf (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) kind) "") (v_Vuna_dCompiler_dDriver_dCompile_dhashText srcHash)) (v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesHash deps)) (v_Vuna_dCompiler_dDriver_dCompile_dhashText (verHash + prHash))) (v_Vuna_dCompiler_dDriver_dCompile_dreleaseFlagOf ctx)))) (String.concat "" [mode; ":"; (if printResult then "pr1" else "pr0")]))) (match ifaces with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__210) -> "s"
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "f"
  | _ -> failwith "DT: impossible branch"
))) (if printResult then 1 else 0))) ((v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dsplitNodeSchema ^ Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion)) + fp))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf sources) 0)))))))))))

# 2215 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobPath = (fun nFs nEnv nProcess digest -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dcacheBase nFs) nEnv) nProcess)) (fun base -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" [base; "/blobs/"; digest])))))

# 2222 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitBlobAt = (fun nFs nEnv nProcess digest files -> ((fun payload -> ((fun contentDigest -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobTag nFs) nEnv)) (fun tag -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobPath nFs) nEnv) nProcess) digest)) (fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dcacheBase nFs) nEnv) nProcess)) (fun base -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreEnsureDirEff nFs) nProcess) (base ^ "/blobs"))) (fun _u -> ((((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreWriteIfChangedAsEff nFs) tag) v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheCodec) contentDigest) path) payload)))))))))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest payload))) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dencSplitFiles) files)))

# 2236 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitInOf = (fun m -> (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_daddrOf (Base_dList.C_Base_dList_dList_Cons ("split", (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmPkg, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmKind, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmManifest, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmSources, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmDeps, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmVer, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmFlags, Base_dList.C_Base_dList_dList_Nil))))))))))))))))))

# 2247 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitPtrKind = "splitptr"

# 2250 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitPtrCodec = "split-pointer 1"

# 2253 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dreadSplitPointer = (fun nFs nEnv nProcess fast -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectReadEff nFs) nEnv) nProcess) v_Vuna_dCompiler_dDriver_dCompile_dsplitPtrKind) v_Vuna_dCompiler_dDriver_dCompile_dsplitPtrCodec) fast)) (fun saved -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match saved with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__211) -> (if (dtb__211 = "") then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__211)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))

# 2261 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitPointer = (fun nFs nEnv nProcess fast sem -> (((((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectWriteEff nFs) nEnv) nProcess) v_Vuna_dCompiler_dDriver_dCompile_dsplitPtrKind) v_Vuna_dCompiler_dDriver_dCompile_dsplitPtrCodec) fast) sem))

# 2264 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddefLocLine = (fun ctx p -> (String.concat "" [(Base_dPair.v_Base_dPair_dfirstOf p); "|"; ((v_Vuna_dCompiler_dDriver_dCompile_ddropPrefixMeta ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx) ^ "/")) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf p))); "|"; (bi_strFromInt (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf p)))]))

# 2270 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dlayoutDigestOf = (fun ctx modules -> (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_daddrOf (Base_dList.C_Base_dList_dList_Cons ("split-layout", ((Base_dList.v_Base_dList_dconcatMap (fun m -> ((Base_dList.v_Base_dList_dmap (fun p -> (String.concat "" [(Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m); "|"; ((v_Vuna_dCompiler_dDriver_dCompile_ddefLocLine ctx) p)]))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDefLocsOf m)))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsortModuleIfaces modules))))))

# 2275 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitIdentityOf = (fun ctx printResult tag modules -> ((fun pkg -> ((fun pr -> (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_daddrOf (Base_dList.C_Base_dList_dList_Cons ("split-identity", (Base_dList.C_Base_dList_dList_Cons (v_Vuna_dCompiler_dDriver_dCompile_dsplitNodeSchema, (Base_dList.C_Base_dList_dList_Cons (pkg, (Base_dList.C_Base_dList_dList_Cons (pr, (Base_dList.C_Base_dList_dList_Cons (((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpkgIfaceHashOfModules pkg) modules), (Base_dList.C_Base_dList_dList_Cons (((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpkgImplHashOfModules pkg) modules), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dDriver_dCompile_dlayoutDigestOf ctx) modules), (Base_dList.C_Base_dList_dList_Cons (tag, Base_dList.C_Base_dList_dList_Nil)))))))))))))))))) (if printResult then "1" else "0"))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)))

# 272 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dauditCompile = (fun nFs nConsole nClock nEnv nProcess ctx entry printResult outDir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dDriver_dCompile_dsplitModsOf nFs) nClock) nEnv) nProcess) ctx) entry) printResult)) (fun mods -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((((v_Vuna_dCompiler_dDriver_dCompile_dsummarySplitParts nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) printResult)) (fun summary -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectParts nFs) nConsole) nEnv) nProcess) ctx) entry) printResult)) (fun full -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dauditCompare "compile") entry) (v_Vuna_dCompiler_dDriver_dCompile_dsplitSignatureOf summary)) (v_Vuna_dCompiler_dDriver_dCompile_dsplitSignatureOf full)))) (fun compared -> (match compared with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__212) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__212)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__213) -> (match summary with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__214) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__214)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__215) -> ((fun files -> ((fun checked -> ((fun canon -> ((fun fast -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceShadow nFs) nClock) nEnv) nProcess) ctx) checked)) (fun shadow -> (match shadow with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__216) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__216)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__217) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dFingerprint.v_Vuna_dCompiler_dFingerprint_dcompilerTagEff nFs) nEnv)) (fun tag -> ((fun sem -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitBlobAt nFs) nEnv) nProcess) sem) canon)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitPointer nFs) nEnv) nProcess) fast) sem)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_drootKeepEff nFs) nEnv) nProcess) ctx) (Base_dList.C_Base_dList_dList_Cons (fast, (Base_dList.C_Base_dList_dList_Cons (sem, Base_dList.C_Base_dList_dList_Nil)))))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiledNormalized nFs) nProcess) ctx) outDir) canon)) (fun n -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match n with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__218) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__218))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__219) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__219; Base_dPair.f_Base_dPair_dPair_second = (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings }))
  | _ -> failwith "DT: impossible branch"
))))))))))) (match dtb__217 with
  | Base_dList.C_Base_dList_dList_Nil -> fast
  | _ -> ((((v_Vuna_dCompiler_dDriver_dCompile_dsplitIdentityOf ctx) printResult) tag) dtb__217)
))))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDriver_dCompile_dsplitInOf mods))) (Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dcanonicalTopo files))) (Base_dPair.v_Base_dPair_dsecondOf dtb__215))) (Base_dPair.v_Base_dPair_dfirstOf dtb__215))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line ("iface-audit subject=compile entry=" ^ entry)) else 0)))))))))

# 2285 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dbuildViewAddrOf = (fun nFs nClock nEnv nProcess ctx entry printResult -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dDriver_dCompile_dsplitModsOf nFs) nClock) nEnv) nProcess) ctx) entry) printResult)) (fun mods -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dsplitInOf mods)))))

# 2291 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckInOf = (fun m -> (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_daddrOf (Base_dList.C_Base_dList_dList_Cons ("check", (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmPkg, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmKind, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmManifest, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmSources, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmDeps, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmVer, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmFlags, Base_dList.C_Base_dList_dList_Nil))))))))))))))))))

# 1616 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckViaGraph = (fun nFs nEnv nProcess ctx mods run -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_delabFullRequested nEnv)) (fun full -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_difaceAuditRequested nEnv)) (fun audit -> (if (if full then true else audit) then run else ((fun dig -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsMarkEff "vuna.cache.lookup")) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectReadEff nFs) nEnv) nProcess) "check") Vuna_dCompiler_dDiag_dCodec.v_Vuna_dCompiler_dDiag_dCodec_dcheckResultCodec) dig)) (fun payload -> (match payload with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__220) -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dDriver_dCompile_drunAndStore nFs) nEnv) nProcess) ctx) dig) run)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__221) -> (match dtb__221 with
  | Vuna_dCompiler_dDiag_dCodec.C_Vuna_dCompiler_dDiag_dCodec_dCheckOutcome_CheckFailed (dtb__222) -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCountEff "vuna.counter.cache.hit") 1)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dreplayFailure ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCompile_dresolveStoredDiag ctx)) dtb__222)))))) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=hit") else 0))
  | Vuna_dCompiler_dDiag_dCodec.C_Vuna_dCompiler_dDiag_dCodec_dCheckOutcome_CheckPassed (dtb__223) -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCountEff "vuna.counter.cache.hit") 1)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCompile_dresolveStoredDiag ctx)) dtb__223))))))) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=hit") else 0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dDiag_dCodec.v_Vuna_dCompiler_dDiag_dCodec_ddecCheckOutcome dtb__220))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dDriver_dCompile_drunAndStore nFs) nEnv) nProcess) ctx) dig) run)
  | _ -> failwith "DT: impossible branch"
)))))) (v_Vuna_dCompiler_dDriver_dCompile_dcheckInOf mods))))))))

# 1692 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedExe = (fun nFs nClock nEnv nProcess nExit nArgs wantWarnings ctx entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dcheckModsExe nFs) nEnv) nProcess) ctx) entry)) (fun mods -> (if wantWarnings then (((((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedExe nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) entry) else ((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckViaGraph nFs) nEnv) nProcess) ctx) mods) (((((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedExe nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) entry))))))

# 2108 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedLib = (fun nFs nClock nEnv nProcess nExit nArgs wantWarnings ctx names -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dcheckModsLib nFs) nEnv) nProcess) ctx) names)) (fun mods -> (if wantWarnings then (((((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedLib nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) names) else ((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckViaGraph nFs) nEnv) nProcess) ctx) mods) (((((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedLib nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) names))))))

# 83 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage = (fun nFs nClock nEnv nProcess nExit nArgs release wantWarnings pkg -> ((fun ctx -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg))) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedExe nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg))) (fun exeR -> (match exeR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__224) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__224)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__225) -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageExports pkg) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__225)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__226) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_delabFullRequested nEnv)) (fun full -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if full then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false) else (((((v_Vuna_dCompiler_dDriver_dCompile_dorderCoversEff nFs) nEnv) nProcess) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg)) dtb__226))) (fun covered -> (if covered then ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__225)))) (if (dtp_debug_on 0) then (dtp_debug_line ("check-lib-skip covered=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__226)))) else 0)) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedLib nFs) nClock) nEnv) nProcess) nExit) nArgs) false) ctx) dtb__226)) (fun libR -> (match libR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__227) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__227)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__228) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend dtb__225) dtb__228))))
  | _ -> failwith "DT: impossible branch"
))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) else (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageExports pkg) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt1 ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageDir pkg) ^ "/vuna.toml")) 1) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_LibraryWithoutEntry ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg)))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__229) -> (((((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedLib nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) dtb__229)
  | _ -> failwith "DT: impossible branch"
))))) ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextWithRelease release) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg))))

# 2297 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitBlob = (fun nFs nEnv nProcess files -> ((fun payload -> ((fun digest -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobTag nFs) nEnv)) (fun tag -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobPath nFs) nEnv) nProcess) digest)) (fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dcacheBase nFs) nEnv) nProcess)) (fun base -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreEnsureDirEff nFs) nProcess) (base ^ "/blobs"))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreWriteIfChangedAsEff nFs) tag) v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheCodec) digest) path) payload)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) digest)))))))))))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest payload))) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dencSplitFiles) files)))

# 2317 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dreadSplitBlob = (fun nFs nEnv nProcess digest -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobTag nFs) nEnv)) (fun tag -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobPath nFs) nEnv) nProcess) digest)) (fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreReadEff nFs) tag) v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheCodec) path)) (fun payload -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match payload with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__230) -> (Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_ddecSplitFilesComplete dtb__230)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))))))

# 225 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_drebuildSplit = (fun nFs nConsole nClock nEnv nProcess ctx entry printResult outDir fast -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((((v_Vuna_dCompiler_dDriver_dCompile_dsummarySplitParts nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) printResult)) (fun summary -> (match summary with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__231) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__231)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__232) -> ((fun canon -> ((fun checked -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceShadow nFs) nClock) nEnv) nProcess) ctx) checked)) (fun shadow -> (match shadow with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__233) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__233)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__234) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dFingerprint.v_Vuna_dCompiler_dFingerprint_dcompilerTagEff nFs) nEnv)) (fun tag -> ((fun sem -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dreadSplitBlob nFs) nEnv) nProcess) sem)) (fun cached -> (match cached with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__235) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitPointer nFs) nEnv) nProcess) fast) sem)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_drootKeepEff nFs) nEnv) nProcess) ctx) (Base_dList.C_Base_dList_dList_Cons (fast, (Base_dList.C_Base_dList_dList_Cons (sem, Base_dList.C_Base_dList_dList_Nil)))))) (fun _u -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiledNormalized nFs) nProcess) ctx) outDir) dtb__235)) (fun n -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match n with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__236) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__236))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__237) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__237; Base_dPair.f_Base_dPair_dPair_second = (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings }))
  | _ -> failwith "DT: impossible branch"
))))) (if (dtp_debug_on 0) then (dtp_debug_line "split-identity-hit cache-path=hit") else 0))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitBlobAt nFs) nEnv) nProcess) sem) canon)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitPointer nFs) nEnv) nProcess) fast) sem)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_drootKeepEff nFs) nEnv) nProcess) ctx) (Base_dList.C_Base_dList_dList_Cons (fast, (Base_dList.C_Base_dList_dList_Cons (sem, Base_dList.C_Base_dList_dList_Nil)))))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiledNormalized nFs) nProcess) ctx) outDir) canon)) (fun n -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match n with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__238) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__238))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__239) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__239; Base_dPair.f_Base_dPair_dPair_second = (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings }))
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> failwith "DT: impossible branch"
)))) (match dtb__234 with
  | Base_dList.C_Base_dList_dList_Nil -> fast
  | _ -> ((((v_Vuna_dCompiler_dDriver_dCompile_dsplitIdentityOf ctx) printResult) tag) dtb__234)
))))
  | _ -> failwith "DT: impossible branch"
)))) (Base_dPair.v_Base_dPair_dsecondOf dtb__232))) (Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dcanonicalTopo (Base_dPair.v_Base_dPair_dfirstOf dtb__232)))
  | _ -> failwith "DT: impossible branch"
))))

# 200 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcompileToDirNormal = (fun nFs nConsole nClock nEnv nProcess ctx entry printResult outDir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dDriver_dCompile_dsplitModsOf nFs) nClock) nEnv) nProcess) ctx) entry) printResult)) (fun mods -> ((fun fast -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dreadSplitPointer nFs) nEnv) nProcess) fast)) (fun ptr -> (match ptr with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__240) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dreadSplitBlob nFs) nEnv) nProcess) dtb__240)) (fun cached -> (match cached with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__241) -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiledNormalized nFs) nProcess) ctx) outDir) dtb__241)) (fun n -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match n with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__242) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__242))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__243) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__243; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | _ -> failwith "DT: impossible branch"
))))) (if (dtp_debug_on 0) then (dtp_debug_line "split-pointer-hit cache-path=hit") else 0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((((v_Vuna_dCompiler_dDriver_dCompile_drebuildSplit nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) printResult) outDir) fast)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((((v_Vuna_dCompiler_dDriver_dCompile_drebuildSplit nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) printResult) outDir) fast)
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDriver_dCompile_dsplitInOf mods)))))

# 160 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir = (fun nFs nConsole nClock nEnv nProcess ctx entry printResult outDir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_difaceAuditRequested nEnv)) (fun audit -> (if audit then (((((((((v_Vuna_dCompiler_dDriver_dCompile_dauditCompile nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) printResult) outDir) else (((((((((v_Vuna_dCompiler_dDriver_dCompile_dcompileToDirNormal nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) printResult) outDir)))))

# 361 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dbuildSplit = (fun nFs nConsole nClock nEnv nProcess dir outDir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dloadPackage nFs) nEnv) dir)) (fun pkgR -> (match pkgR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__244) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__244)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__245) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir nFs) nConsole) nClock) nEnv) nProcess) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext dtb__245)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry dtb__245)) true) outDir)) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match r with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__246) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__246))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__247) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dPair.v_Base_dPair_dfirstOf dtb__247)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))

# 2333 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpmModulesOfIface = (fun p -> (p).Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piModules)

# 2336 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dfirstInvalidGo = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__248, dtb__249) -> (if (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedProgramValid (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf dtb__248)) then (v_Vuna_dCompiler_dDriver_dCompile_dfirstInvalidGo dtb__249) else (String.concat "" [(Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__248); ":"; (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedProgramIssue (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf dtb__248))]))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 2330 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dfirstInvalidModule = (fun p -> (v_Vuna_dCompiler_dDriver_dCompile_dfirstInvalidGo (v_Vuna_dCompiler_dDriver_dCompile_dpmModulesOfIface p)))
