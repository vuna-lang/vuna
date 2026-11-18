open Vuna_runtime
type t_Vuna_dCompiler_dDriver_dCompile_dPkgEntry = { f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peName : string; f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peDir : string; f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peKey : string; f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peEnv : string }
and t_Vuna_dCompiler_dDriver_dCompile_dClosureMod = { f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg : string; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey : string; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv : string; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName : string; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath : string; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc : string; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr : string }
and t_Vuna_dCompiler_dDriver_dCompile_dToolContext = { f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcDepIfaces : Vuna_dCompiler_dDriver_dIface.t_Vuna_dCompiler_dDriver_dIface_dModuleIface Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcDepHashes : (string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcNeeded : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcOwnNames : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcStats : Vuna_dCompiler_dDriver_dIface.t_Vuna_dCompiler_dDriver_dIface_dSourceInfo Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dDriver_dCompile_dCheckMods = { f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmPkg : string; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmKind : string; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmManifest : string; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmSources : string; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmDeps : string; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmVer : string; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmFlags : string }

# 58 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dmapEff = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (mc0 dtb__0)) (fun y -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff mc0) dtb__1)) (fun ys -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dList.C_Base_dList_dList__x58__x58_ (y, ys)))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dconcatMapEff = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__2, dtb__3) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (mc0 dtb__2)) (fun xs -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dconcatMapEff mc0) dtb__3)) (fun ys -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dList.v_Base_dList_dappend xs) ys))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dmapMaybeEff = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__4, dtb__5) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (mc0 dtb__4)) (fun y -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapMaybeEff mc0) dtb__5)) (fun ys -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match y with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__6) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__6, ys))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ys
  | _ -> failwith "DT: impossible branch"
))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 134 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_densureDirPathFuel = (fun nFs nProcess fuel path -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (if (if (if (path = "") then true else (path = ".")) then true else (path = "/")) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path)) (fun exists -> (if exists then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_densureDirPathFuel nFs) nProcess) (fuel - 1)) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dparentOfPath path))) (fun _u -> ((Base_dEffFs.v_Base_dEffFs_dfsMakeDir nFs) path)))))))))

# 131 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_densureDirPath = (fun nFs nProcess path -> ((((v_Vuna_dCompiler_dDriver_dCompile_densureDirPathFuel nFs) nProcess) 256) path))

# 300 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwriteFileIfChanged = (fun nFs path content -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) path)) (fun old -> (if (old = content) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (((Base_dEffFs.v_Base_dEffFs_dfsWriteFile nFs) path) content)))) else (((Base_dEffFs.v_Base_dEffFs_dfsWriteFile nFs) path) content)))))

# 338 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcopyFfiFiles = (fun nFs nProcess ctxDir outDir -> ((fun ffiDir -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) ffiDir)) (fun exists -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if exists then ((Base_dEffFs.v_Base_dEffFs_dfsIsDirectory nFs) ffiDir) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))) (fun isDir -> (if (if exists then isDir else false) then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadDir nFs) ffiDir)) (fun names -> ((fun cs -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_densureDirPath nFs) nProcess) (outDir ^ "/ffi"))) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun n -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) (String.concat "" [ffiDir; "/"; ((Base_dInterp.v_Base_dInterp_dinterp Base_dInterp.v_Interp_uString) n)]))) (fun content -> (((Base_dEffFs.v_Base_dEffFs_dfsWriteFile nFs) (String.concat "" [outDir; "/ffi/"; ((Base_dInterp.v_Base_dInterp_dinterp Base_dInterp.v_Interp_uString) n)])) content))))) cs)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dList.v_Base_dList_dmap (fun n -> ("ffi/" ^ ((Base_dInterp.v_Base_dInterp_dinterp Base_dInterp.v_Interp_uString) n)))) cs))))))) ((Base_dList.v_Base_dList_dfilter (fun n -> ((Base_dString.v_Base_dString_dendsWith ".c") n))) names)))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil))))))) (ctxDir ^ "/ffi")))

# 379 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmetaSchema = 1

# 382 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmetaFileName = "build-meta.json"

# 386 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtextHash = (fun s -> (Vuna_dCompiler_dBase_dHash.v_Vuna_dCompiler_dBase_dHash_dcontentKey s))

# 392 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint = (fun nFs nEnv -> ((Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dcompilerFingerprintEff nFs) nEnv))

# 397 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcacheBase = (fun nFs nEnv nProcess -> (((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreRootReadyEff nFs) nEnv) nProcess))

# 402 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dskipMetaDir = (fun name -> (Vuna_dCompiler_dFrontend_dPackages_dSource.v_Vuna_dCompiler_dFrontend_dPackages_dSource_dskipSourceDir name))

# 405 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta = (fun nFs fuel dir -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) dir)) (fun exists -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if exists then ((Base_dEffFs.v_Base_dEffFs_dfsIsDirectory nFs) dir) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))) (fun isDir -> (if (if exists then isDir else false) then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadDir nFs) dir)) (fun names -> ((v_Vuna_dCompiler_dDriver_dCompile_dconcatMapEff (((v_Vuna_dCompiler_dDriver_dCompile_dwalkVunaMeta nFs) (fuel - 1)) dir)) names))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil))))))))
# 415 "Vuna/Compiler/Driver/Compile.vuna"
and v_Vuna_dCompiler_dDriver_dCompile_dwalkVunaMeta = (fun nFs fuel dir name -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil) else (if (name = ".") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil) else (if (name = "..") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil) else (if (v_Vuna_dCompiler_dDriver_dCompile_dskipMetaDir name) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil) else ((fun path -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path)) (fun exists -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if exists then ((Base_dEffFs.v_Base_dEffFs_dfsIsDirectory nFs) path) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))) (fun isDir -> (if (if exists then isDir else false) then (((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta nFs) (fuel - 1)) path) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if ((Base_dString.v_Base_dString_dendsWith ".vuna") name) then (Base_dList.C_Base_dList_dList__x58__x58_ (path, Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil)))))))) (String.concat "" [dir; "/"; name])))))))

# 430 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddropPrefixMeta = (fun prefix s -> (if ((Base_dString.v_Base_dString_dstartsWith prefix) s) then (((Base_dString.v_Base_dString_dsubstring (Base_dString.v_Base_dString_dbyteLength prefix)) (bi_natSub (Base_dString.v_Base_dString_dbyteLength s) (Base_dString.v_Base_dString_dbyteLength prefix))) s) else s))

# 438 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dslashToDot = (fun c -> (if (c = 47) then 46 else c))

# 435 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dslashesToDots = (fun s -> (Base_dList.dtp_pack ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dslashToDot) (Base_dList.dtp_unpack s))))

# 441 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath = (fun rootPath path -> ((fun rel0 -> ((fun rel -> (v_Vuna_dCompiler_dDriver_dCompile_dslashesToDots rel)) (if ((Base_dString.v_Base_dString_dendsWith ".vuna") rel0) then (((Base_dString.v_Base_dString_dsubstring 0) (bi_natSub (Base_dString.v_Base_dString_dbyteLength rel0) 5)) rel0) else rel0))) ((v_Vuna_dCompiler_dDriver_dCompile_ddropPrefixMeta (rootPath ^ "/")) path)))

# 448 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_drootSources = (fun nFs root -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta nFs) 1048576) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootDir root))) (fun paths -> ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun p -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) p)) (fun content -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootDir root)) p); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dDriver_dCompile_dtextHash content) }))))) paths))))

# 461 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__7, dtb__8) -> (match dtb__7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__9; Base_dPair.f_Base_dPair_dPair_second = dtb__10 } -> ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf dtb__8) ((mc1 * 1000003) + dtb__10))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 456 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_drootHash = (fun nFs root -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_drootSources nFs) root)) (fun sources -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf sources) 0)))))

# 466 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dentrySource = (fun nFs entry -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) entry)) (fun content -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = "<entry>"; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dDriver_dCompile_dtextHash content) }))))

# 472 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_downRootsOf = (fun ctx -> ((Base_dList.v_Base_dList_dfilter (fun r -> ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName r) = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)))) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)))

# 475 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcontextSources = (fun nFs ctx entry -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dconcatMapEff (v_Vuna_dCompiler_dDriver_dCompile_drootSources nFs)) (v_Vuna_dCompiler_dDriver_dCompile_downRootsOf ctx))) (fun own -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dentrySource nFs) entry)) (fun es -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dList.v_Base_dList_dappend own) (Base_dList.C_Base_dList_dList__x58__x58_ (es, Base_dList.C_Base_dList_dList_Nil)))))))))

# 482 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes = (fun nFs ctx -> (match (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx) with
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__11, dtb__12) -> ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun r -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_drootHash nFs) r)) (fun h -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName r); Base_dPair.f_Base_dPair_dPair_second = h }))))) dtb__12)
  | _ -> failwith "DT: impossible branch"
))

# 497 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcompilerClosureModule = "Vuna.Compiler.Loader.Fingerprint"

# 521 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryKind = "pkg-iface"

# 524 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryCodec = "pkg-iface-summary 1"

# 527 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryKeyOf = (fun pkg srcClosure tag -> (Vuna_dCompiler_dLoader_dAddr.v_Vuna_dCompiler_dLoader_dAddr_daddrOf (Base_dList.C_Base_dList_dList__x58__x58_ ("pkg-iface", (Base_dList.C_Base_dList_dList__x58__x58_ (pkg, (Base_dList.C_Base_dList_dList__x58__x58_ (srcClosure, (Base_dList.C_Base_dList_dList__x58__x58_ (tag, Base_dList.C_Base_dList_dList_Nil))))))))))

# 531 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepRootIdentityEff = (fun nFs nEnv nProcess root -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_drootHash nFs) root)) (fun h -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dcompilerTagEff nFs) nEnv)) (fun tag -> ((fun key -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreObjectReadEff nFs) nEnv) nProcess) v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryKind) v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryCodec) key)) (fun saved -> ((fun verdict -> ((fun _u -> (match saved with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__13) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName root); Base_dPair.f_Base_dPair_dPair_second = ("iface:" ^ dtb__13) })
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun tomlPath -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) tomlPath)) (fun exists -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if exists then ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) tomlPath) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ""))) (fun toml -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName root); Base_dPair.f_Base_dPair_dPair_second = (String.concat "" ["manifest:"; (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_dtextHash toml)); ":"; (bi_strFromInt h)]) })))))) ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootDir root) ^ "/vuna.toml"))
  | _ -> failwith "DT: impossible branch"
)) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["dep-identity="; (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName root); " verdict="; verdict; " src="; (bi_strFromInt h)])) else 0))) (match saved with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__14) -> "iface"
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "manifest"
  | _ -> failwith "DT: impossible branch"
))))) (((v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryKeyOf (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName root)) (bi_strFromInt h)) tag)))))))

# 554 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesEff = (fun nFs nEnv nProcess ctx -> (match (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx) with
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__15, dtb__16) -> ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (((v_Vuna_dCompiler_dDriver_dCompile_ddepRootIdentityEff nFs) nEnv) nProcess)) dtb__16)
  | _ -> failwith "DT: impossible branch"
))

# 562 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpairText = (fun p -> (String.concat "" [(Base_dPair.v_Base_dPair_dfirstOf p); "="; (Base_dPair.v_Base_dPair_dsecondOf p)]))

# 559 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesHash = (fun pairs -> (Vuna_dCompiler_dLoader_dAddr.v_Vuna_dCompiler_dLoader_dAddr_daddrOf (Base_dList.C_Base_dList_dList__x58__x58_ ("dep-identities", ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dpairText) pairs)))))

# 501 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dbuildIdForEff = (fun nFs nEnv nProcess ctx -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dconcatMapEff (v_Vuna_dCompiler_dDriver_dCompile_drootSources nFs)) (v_Vuna_dCompiler_dDriver_dCompile_downRootsOf ctx))) (fun own -> (if ((Base_dList.v_Base_dList_dmemName v_Vuna_dCompiler_dDriver_dCompile_dcompilerClosureModule) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) own)) then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesEff nFs) nEnv) nProcess) ctx)) (fun deps -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dcompilerIdOf own) (v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesHash deps))))) else ((Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dcompilerTagEff nFs) nEnv)))))

# 312 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiledNormalized = (fun nFs nEnv nProcess ctx outDir files -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_densureDirPath nFs) nProcess) outDir)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dbuildIdForEff nFs) nEnv) nProcess) ctx)) (fun id -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dwriteFileIfChanged nFs) (String.concat "" [outDir; "/"; Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dbuildIdFileName])) (id ^ "\n"))) (fun _u -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFilesIfChanged nFs) outDir) files)) (fun written -> (match written with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__17) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__17)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__18) -> ((fun _u -> ((fun graph -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dcopyFfiFiles nFs) nProcess) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextDir ctx)) outDir)) (fun cFiles -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dEffFs.v_Base_dEffFs_dfsWriteFile nFs) (outDir ^ "/build.sh")) ((Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dbuildScript graph) cFiles))) (fun _u -> ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__18)))) (if (dtp_debug_on 0) then (dtp_debug_line "build-script-done") else 0))))))) (if (dtp_debug_on 0) then (dtp_debug_line "split-graph-done") else 0))) (Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dsplitGraph files))) (if (dtp_debug_on 0) then (dtp_debug_line "write-split-files-done") else 0))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line "write-compiled-start") else 0)))))))))

# 566 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwritePkgIfaceSummaryEff = (fun nFs nEnv nProcess ctx modules -> (match ((Base_dList.v_Base_dList_dfilter (fun r -> ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName r) = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)))) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) with
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__19, dtb__20) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_drootHash nFs) dtb__19)) (fun h -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dcompilerTagEff nFs) nEnv)) (fun tag -> ((fun key -> ((fun payload -> (((((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreObjectWriteEff nFs) nEnv) nProcess) v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryKind) v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryCodec) key) payload)) ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpkgIfaceHashOfModules (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) modules))) (((v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryKeyOf (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) (bi_strFromInt h)) tag))))))
  | _ -> failwith "DT: impossible branch"
))

# 577 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmetaPairText = (fun mc0 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__21; Base_dPair.f_Base_dPair_dPair_second = dtb__22 } -> (String.concat "" ["{\"name\":\""; dtb__21; "\",\"hash\":"; (bi_strFromInt dtb__22); "}"])
  | _ -> failwith "DT: impossible branch"
))

# 580 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__23, dtb__24) -> (match dtb__24 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__23
  | _ -> (String.concat "" [dtb__23; ","; (v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList dtb__24)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 587 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dlastSegmentRev = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__25, dtb__26) -> (if (dtb__25 = 47) then (Base_dList.dtp_pack mc1) else ((v_Vuna_dCompiler_dDriver_dCompile_dlastSegmentRev dtb__26) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__25, mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.dtp_pack mc1)
  | _ -> failwith "DT: impossible branch"
))

# 591 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dlastSegment = (fun path -> ((v_Vuna_dCompiler_dDriver_dCompile_dlastSegmentRev (Base_dList.v_Base_dList_dreverse (Base_dList.dtp_unpack path))) Base_dList.C_Base_dList_dList_Nil))

# 606 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmetaPathOf = (fun outDir -> (String.concat "" [outDir; "/"; v_Vuna_dCompiler_dDriver_dCompile_dmetaFileName]))

# 631 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_drunBuildScript = (fun nProcess dir out name -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dEffProcess.v_Base_dEffProcess_dprocessRunIn nProcess) dir) (Base_dList.C_Base_dList_dList__x58__x58_ ("sh", (Base_dList.C_Base_dList_dList__x58__x58_ ("build.sh", (Base_dList.C_Base_dList_dList__x58__x58_ (out, Base_dList.C_Base_dList_dList_Nil)))))))) (fun code -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if (code = 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_derr (String.concat "" ["build: "; name; ": sh build.sh "; out; " failed in "; dir; " (exit "; (bi_strFromInt code); ")"])))))))

# 640 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckNodeSchema = "vuna-check-node 3"

# 643 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dhashText = (fun n -> (bi_strFromInt n))

# 654 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmaybeSemanticText = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__27) -> dtb__27
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 658 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepSourceText = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepUrl (dtb__28) -> ("url:" ^ dtb__28)
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepGit (dtb__29, dtb__30) -> (String.concat "" ["git:"; dtb__29; "@"; dtb__30])
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepPath (dtb__31) -> ("path:" ^ dtb__31)
  | _ -> failwith "DT: impossible branch"
))

# 663 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepSemanticText = (fun d -> (String.concat "" [(d).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias; "|"; (v_Vuna_dCompiler_dDriver_dCompile_ddepSourceText (d).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource); "|"; (v_Vuna_dCompiler_dDriver_dCompile_dmaybeSemanticText (d).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash); "|"; (v_Vuna_dCompiler_dDriver_dCompile_dmaybeSemanticText (d).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity)]))

# 667 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmanifestSemanticText = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__32) -> ((fun man -> ((fun exportsText -> ((Base_dString.v_Base_dString_djoin "\n") (Base_dList.C_Base_dList_dList__x58__x58_ (("name:" ^ (v_Vuna_dCompiler_dDriver_dCompile_dmaybeSemanticText (man).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName)), (Base_dList.C_Base_dList_dList__x58__x58_ (("exports:" ^ exportsText), ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_ddepSemanticText) (man).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies))))))) (match (man).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__33) -> ((Base_dString.v_Base_dString_djoin ",") dtb__33)
  | _ -> failwith "DT: impossible branch"
))) (dtb__32).Vuna_dCompiler_dFrontend_dPackages_dPkg.f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageManifest)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 594 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dbuildMetaText = (fun nFs ctx entry linked -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dcontextSources nFs) ctx) entry)) (fun sources -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes nFs) ctx)) (fun deps -> ((fun manifestHash -> ((fun entryName -> ((fun linkedText -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" ["{\"schema\":"; (bi_strFromInt v_Vuna_dCompiler_dDriver_dCompile_dmetaSchema); ",\"compiler\":\""; Vuna_dCompiler_dBase_dVersion.v_Vuna_dCompiler_dBase_dVersion_dvunaVersion; "\",\"package\":\""; (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx); "\",\"entry\":\""; entryName; "\",\"linked\":"; linkedText; ",\"closure\":"; (bi_strFromInt ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf sources) 0)); ",\"manifest\":"; (bi_strFromInt manifestHash); ",\"sources\":["; (v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmetaPairText) sources)); "],\"dependencies\":["; (v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmetaPairText) deps)); "]}\n"]))) (if linked then "true" else "false"))) (v_Vuna_dCompiler_dDriver_dCompile_dlastSegment entry))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dmanifestSemanticText (ctx).Vuna_dCompiler_dFrontend_dPackages_dPkg.f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage))))))))

# 609 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwriteBuildMeta = (fun nFs outDir ctx entry linked -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dbuildMetaText nFs) ctx) entry) linked)) (fun text -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dEffFs.v_Base_dEffFs_dfsWriteFile nFs) (v_Vuna_dCompiler_dDriver_dCompile_dmetaPathOf outDir)) text)) (fun n -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) n))))))

# 616 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmetaUpToDate = (fun nFs outDir ctx entry binPath -> ((fun path -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path)) (fun exists -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if exists then ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) binPath) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))) (fun binExists -> (if (if exists then binExists else false) then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) path)) (fun raw -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dbuildMetaText nFs) ctx) entry) true)) (fun expected -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (raw = expected)))))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))))))) (v_Vuna_dCompiler_dDriver_dCompile_dmetaPathOf outDir)))

# 679 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dreleaseFlagOf = (fun ctx -> (if (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRelease ctx) then "release" else "debug"))

# 715 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackagesFuel = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__34, dtb__35) -> (if (mc0 <= 0) then { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__34, dtb__35)) } else (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName dtb__34)) mc1) then (((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackagesFuel (mc0 - 1)) mc1) dtb__35) else (match (((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackagesFuel (mc0 - 1)) (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName dtb__34), mc1))) (dtb__34).Vuna_dCompiler_dFrontend_dPackages_dPkg.f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageDependencies) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__36; Base_dPair.f_Base_dPair_dPair_second = dtb__37 } -> (match (((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackagesFuel (mc0 - 1)) dtb__36) dtb__35) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__38; Base_dPair.f_Base_dPair_dPair_second = dtb__39 } -> { Base_dPair.f_Base_dPair_dPair_first = dtb__38; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__37) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__34, dtb__39))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 712 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackages = (fun seen ps -> (((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackagesFuel 4096) seen) ps))

# 726 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dallNamesIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__40, dtb__41) -> (if ((Base_dList.v_Base_dList_dmemName dtb__40) mc1) then ((v_Vuna_dCompiler_dDriver_dCompile_dallNamesIn dtb__41) mc1) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 723 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsameNameSet = (fun a b -> (if (if ((Base_dList.v_Base_dList_dlength a) = (Base_dList.v_Base_dList_dlength b)) then ((v_Vuna_dCompiler_dDriver_dCompile_dallNamesIn a) b) else false) then ((v_Vuna_dCompiler_dDriver_dCompile_dallNamesIn b) a) else false))

# 737 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepPackageList = (fun ctx -> (match (ctx).Vuna_dCompiler_dFrontend_dPackages_dPkg.f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__42) -> (Base_dPair.v_Base_dPair_dsecondOf ((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackages Base_dList.C_Base_dList_dList_Nil) (dtb__42).Vuna_dCompiler_dFrontend_dPackages_dPkg.f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageDependencies))
  | _ -> failwith "DT: impossible branch"
))

# 742 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount = (fun ctx -> (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageList ctx)))

# 754 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difaceObjectCodec = "module-iface 3"

# 778 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpkgKeyOf = (fun name -> (Vuna_dCompiler_dLoader_dAddr.v_Vuna_dCompiler_dLoader_dAddr_daddrOf (Base_dList.C_Base_dList_dList__x58__x58_ ("pkg", (Base_dList.C_Base_dList_dList__x58__x58_ (name, Base_dList.C_Base_dList_dList_Nil))))))

# 795 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dfindPkgEntry = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__43, dtb__44) -> (if ((dtb__43).f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peName = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__43)) else ((v_Vuna_dCompiler_dDriver_dCompile_dfindPkgEntry mc0) dtb__44))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 799 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dfindClosureMod = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__45, dtb__46) -> (if ((dtb__45).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__45)) else ((v_Vuna_dCompiler_dDriver_dCompile_dfindClosureMod mc0) dtb__46))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 803 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dclosureModsEff = (fun nFs ctx pkgs -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun r -> (match ((v_Vuna_dCompiler_dDriver_dCompile_dfindPkgEntry (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName r)) pkgs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__47) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta nFs) 1048576) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootDir r))) (fun paths -> ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun p -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) p)) (fun raw -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg = (dtb__47).f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peName; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey = (dtb__47).f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peKey; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv = (dtb__47).f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peEnv; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName = ((v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootDir r)) p); f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath = p; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc = (Vuna_dCompiler_dBase_dHash.v_Vuna_dCompiler_dBase_dHash_dcontentAddress raw); f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr = "" }))))) paths)))
  | _ -> failwith "DT: impossible branch"
))) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx))) (fun per -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dList.v_Base_dList_dconcatMap (fun xs -> xs)) per)))))

# 833 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwithPrelude = (fun hasPrelude m h -> (if (if (if hasPrelude then ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName <> "Prelude") else false) then (Base_dBool.v_Base_dBool_dnot ((Base_dList.v_Base_dList_dmemName "Prelude") (h).Vuna_dCompiler_dLoader_dAddr.f_Vuna_dCompiler_dLoader_dAddr_dModHeader_mhImports)) else false) then ((Base_dList.v_Base_dList_dappend (h).Vuna_dCompiler_dLoader_dAddr.f_Vuna_dCompiler_dLoader_dAddr_dModHeader_mhImports) (Base_dList.C_Base_dList_dList__x58__x58_ ("Prelude", Base_dList.C_Base_dList_dList_Nil))) else (h).Vuna_dCompiler_dLoader_dAddr.f_Vuna_dCompiler_dLoader_dAddr_dModHeader_mhImports))

# 821 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dloadHeaderEff = (fun nFs nEnv nProcess hasPrelude m -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath)) (fun raw -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath nFs) nEnv) nProcess) (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath) raw)) (fun parsed -> (match parsed with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__48) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) m)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__49) -> ((fun h -> ((fun imports -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports = imports; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr = "" })) (((v_Vuna_dCompiler_dDriver_dCompile_dwithPrelude hasPrelude) m) h))) ((Vuna_dCompiler_dLoader_dAddr.v_Vuna_dCompiler_dLoader_dAddr_dheaderOfSource (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName) dtb__49))
  | _ -> failwith "DT: impossible branch"
))))))

# 838 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmodGraphEntry = (fun m -> { Base_dPair.f_Base_dPair_dPair_first = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName; Base_dPair.f_Base_dPair_dPair_second = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports })

# 841 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmodNameOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName)

# 844 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_disDepModOf = (fun ctx m -> ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg <> (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)))

# 847 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_disSelfModOf = (fun ctx m -> ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)))

# 850 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmoduleGraphOf = (fun mods -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodGraphEntry) mods))

# 862 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepSrcOf = (fun tbl name -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__50) -> dtb__50
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ("ext:" ^ name)
  | _ -> failwith "DT: impossible branch"
))

# 871 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsrcPairOf = (fun m -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dCompile_dmodNameOf m); Base_dPair.f_Base_dPair_dPair_second = (String.concat "" [(m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey; "|"; (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc]) })

# 868 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsrcTblOf = (fun mods -> ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dsrcPairOf) mods)))

# 875 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difaceAddrOf = (fun srcTbl m -> (Vuna_dCompiler_dLoader_dAddr.v_Vuna_dCompiler_dLoader_dAddr_daddrOf ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList__x58__x58_ ("module-iface", (Base_dList.C_Base_dList_dList__x58__x58_ (v_Vuna_dCompiler_dDriver_dCompile_difaceObjectCodec, (Base_dList.C_Base_dList_dList__x58__x58_ ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey, (Base_dList.C_Base_dList_dList__x58__x58_ ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName, (Base_dList.C_Base_dList_dList__x58__x58_ ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc, (Base_dList.C_Base_dList_dList__x58__x58_ ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv, Base_dList.C_Base_dList_dList_Nil))))))))))))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCompile_ddepSrcOf srcTbl)) (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports))))

# 880 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwithAddr = (fun srcTbl m -> { f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr = ((v_Vuna_dCompiler_dDriver_dCompile_difaceAddrOf srcTbl) m) })

# 891 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difaceModsWithEff = (fun nFs nClock nEnv nProcess ctx pkgs -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsMarkEff "vuna.iface.compute")) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffClock.v_Base_dEffClock_dclockNow nClock)) (fun ta -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dclosureModsEff nFs) ctx) pkgs)) (fun mods0 -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffClock.v_Base_dEffClock_dclockNow nClock)) (fun tb -> ((fun hasPrelude -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff ((((v_Vuna_dCompiler_dDriver_dCompile_dloadHeaderEff nFs) nEnv) nProcess) hasPrelude)) mods0)) (fun mods -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffClock.v_Base_dEffClock_dclockNow nClock)) (fun tc -> ((fun srcTbl -> ((fun assigned -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["iface-mods-phases n="; (bi_strFromInt (Base_dList.v_Base_dList_dlength mods)); " closure="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (tb - ta) / 1000)); "ms headers="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (tc - tb) / 1000)); "ms assign=direct"])) else 0))) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsMarkEff "vuna.iface.compute")) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) assigned)))))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCompile_dwithAddr srcTbl)) mods))) (v_Vuna_dCompiler_dDriver_dCompile_dsrcTblOf mods))))))) ((Base_dList.v_Base_dList_dmemName "Prelude") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodNameOf) mods0))))))))))))

# 944 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceAtEff = (fun nFs nEnv nProcess a -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreObjectReadEff nFs) nEnv) nProcess) "module-iface") v_Vuna_dCompiler_dDriver_dCompile_difaceObjectCodec) a)) (fun payload -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match payload with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__51) -> (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_ddecModuleIfaceComplete dtb__51)
  | _ -> failwith "DT: impossible branch"
)))))

# 958 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListPartialEff = (fun nFs nEnv nProcess mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__52, dtb__53) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceAtEff nFs) nEnv) nProcess) (dtb__52).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr)) (fun mi -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListPartialEff nFs) nEnv) nProcess) dtb__53)) (fun xs -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match mi with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> xs
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__54) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__54, xs))
  | _ -> failwith "DT: impossible branch"
))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 968 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListEff = (fun nFs nEnv nProcess mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__55, dtb__56) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceAtEff nFs) nEnv) nProcess) (dtb__55).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr)) (fun mi -> (match mi with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun _u -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCountEff "vuna.counter.cache.miss") 1)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))) (Base_dObs.v_Base_dObs_dobsMark (String.concat "" ["vuna.tool.iface.miss:"; (dtb__55).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName; ":"; (dtb__55).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr])))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["iface-miss "; (dtb__55).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName; " "; (dtb__55).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr; " pkg="; (dtb__55).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg; " src="; (dtb__55).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc])) else 0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__57) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCountEff "vuna.counter.cache.hit") 1)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListEff nFs) nEnv) nProcess) dtb__56)) (fun xs -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match xs with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__58) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList__x58__x58_ (dtb__57, dtb__58))))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))

# 988 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepModsOf = (fun ctx mods -> ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompile_disDepModOf ctx)) mods))

# 991 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dselfModsOf = (fun ctx mods -> ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompile_disSelfModOf ctx)) mods))

# 1016 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dorderKind = "module-order"

# 1019 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dorderCodec = "module-order 1"

# 1022 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dencOrderNames = (fun names -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTop (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr)) names))

# 1025 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddecOrderNamesComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__59) -> (match dtb__59 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__60; Base_dPair.f_Base_dPair_dPair_second = dtb__61 } -> (if (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurAtEnd dtb__61) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__60)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr) (bi_strLength s)) (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurOf s))))

# 1030 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_drootOfName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__62, dtb__63) -> (if ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName dtb__62) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__62)) else ((v_Vuna_dCompiler_dDriver_dCompile_drootOfName mc0) dtb__63))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1036 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dorderKeyOfEff = (fun nFs nEnv nProcess root -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_drootHash nFs) root)) (fun h -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dcompilerTagEff nFs) nEnv)) (fun tag -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dLoader_dAddr.v_Vuna_dCompiler_dLoader_dAddr_daddrOf (Base_dList.C_Base_dList_dList__x58__x58_ ("module-order", (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName root), (Base_dList.C_Base_dList_dList__x58__x58_ ((bi_strFromInt h), (Base_dList.C_Base_dList_dList__x58__x58_ (tag, Base_dList.C_Base_dList_dList_Nil)))))))))))))))

# 1043 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwriteOrderEff = (fun nFs nEnv nProcess ctx names -> (match ((v_Vuna_dCompiler_dDriver_dCompile_drootOfName (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__64) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dorderKeyOfEff nFs) nEnv) nProcess) dtb__64)) (fun key -> (((((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreObjectWriteEff nFs) nEnv) nProcess) v_Vuna_dCompiler_dDriver_dCompile_dorderKind) v_Vuna_dCompiler_dDriver_dCompile_dorderCodec) key) (v_Vuna_dCompiler_dDriver_dCompile_dencOrderNames names))))
  | _ -> failwith "DT: impossible branch"
))

# 1051 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dreadOrderEff = (fun nFs nEnv nProcess ctx pkg -> (match ((v_Vuna_dCompiler_dDriver_dCompile_drootOfName pkg) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__65) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dorderKeyOfEff nFs) nEnv) nProcess) dtb__65)) (fun key -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreObjectReadEff nFs) nEnv) nProcess) v_Vuna_dCompiler_dDriver_dCompile_dorderKind) v_Vuna_dCompiler_dDriver_dCompile_dorderCodec) key)) (fun payload -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match payload with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__66) -> (v_Vuna_dCompiler_dDriver_dCompile_ddecOrderNamesComplete dtb__66)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
))

# 1063 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dorderCoversEff = (fun nFs nEnv nProcess ctx names -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dreadOrderEff nFs) nEnv) nProcess) ctx) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx))) (fun ord -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match ord with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__67) -> ((v_Vuna_dCompiler_dDriver_dCompile_dallNamesIn names) dtb__67)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)))))

# 1071 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dpickByOrder = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__68, dtb__69) -> (match ((v_Vuna_dCompiler_dDriver_dCompile_dfindClosureMod dtb__68) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__70) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__70, ((v_Vuna_dCompiler_dDriver_dCompile_dpickByOrder mc0) dtb__69)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dDriver_dCompile_dpickByOrder mc0) dtb__69)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1077 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpkgEq = (fun p m -> ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg = p))

# 1080 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_ddistinctPkgs = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__71, dtb__72) -> (if ((Base_dList.v_Base_dList_dmemName (dtb__71).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg) mc1) then ((v_Vuna_dCompiler_dDriver_dCompile_ddistinctPkgs dtb__72) mc1) else ((v_Vuna_dCompiler_dDriver_dCompile_ddistinctPkgs dtb__72) (Base_dList.C_Base_dList_dList__x58__x58_ ((dtb__71).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg, mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 1114 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_drootExportsOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__73, dtb__74) -> (if ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName dtb__73) = mc0) then (dtb__73).Vuna_dCompiler_dFrontend_dPackages_dPkg.f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootExports else ((v_Vuna_dCompiler_dDriver_dCompile_drootExportsOf mc0) dtb__74))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1125 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dpickDepMods = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__75, dtb__76) -> (if ((Base_dList.v_Base_dList_dmemName dtb__75) mc3) then ((((v_Vuna_dCompiler_dDriver_dCompile_dpickDepMods mc0) mc1) dtb__76) mc3) else (match ((v_Vuna_dCompiler_dDriver_dCompile_dfindClosureMod dtb__75) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__77) -> (if ((dtb__77).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg <> (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName mc0)) then (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__77, ((((v_Vuna_dCompiler_dDriver_dCompile_dpickDepMods mc0) mc1) dtb__76) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__75, mc3))))) else ((((v_Vuna_dCompiler_dDriver_dCompile_dpickDepMods mc0) mc1) dtb__76) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__75, mc3))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dDriver_dCompile_dpickDepMods mc0) mc1) dtb__76) mc3)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1134 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepModsOrdered = (fun ctx mods -> ((((v_Vuna_dCompiler_dDriver_dCompile_dpickDepMods ctx) mods) (Vuna_dCompiler_dLoader_dAddr.v_Vuna_dCompiler_dLoader_dAddr_dtopoModules (v_Vuna_dCompiler_dDriver_dCompile_dmoduleGraphOf mods))) Base_dList.C_Base_dList_dList_Nil))

# 1153 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsourcePathMapOfRoots = (fun nFs roots -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun r -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta nFs) 1048576) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootDir r))) (fun paths -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dList.v_Base_dList_dmap (fun path -> { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootDir r)) path); Base_dPair.f_Base_dPair_dPair_second = path })) paths)))))) roots)) (fun walked -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dList.v_Base_dList_dconcatMap (fun xs -> xs)) walked)))))

# 1173 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmtimeSafetyWindowSec = 5

# 1199 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmtimeFastPath = (fun nEnv -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffEnv.v_Base_dEffEnv_denvGetEnv nEnv) "VUNA_CACHE_MTIME")) (fun v -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v = "1")))))

# 1212 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dimportNameStr = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = dtb__78; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = dtb__79; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = dtb__80; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = dtb__81 } -> dtb__78
  | _ -> failwith "DT: impossible branch"
))

# 1224 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolImportNamesOf = (fun nFs ctx current imports -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude nFs) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) current) imports)) (fun implicitR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match implicitR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__82) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dimportNameStr) imports)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__83) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dimportNameStr) ((Base_dList.v_Base_dList_dappend imports) dtb__83))
  | _ -> failwith "DT: impossible branch"
)))))

# 1215 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolImportsOfSource = (fun nFs nEnv nProcess ctx label source -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath nFs) nEnv) nProcess) label) source)) (fun parsed -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__84) -> (match dtb__84 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = dtb__85; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = dtb__86; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = dtb__87; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = dtb__88; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileExports = dtb__89; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileReexports = dtb__90; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileOpacity = dtb__91 } -> ((fun nd_uscrut21 -> (match nd_uscrut21 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dDriver_dCompile_dtoolImportNamesOf nFs) ctx) "") dtb__86)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__92) -> (match dtb__92 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__93; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__94; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__95; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExports = dtb__96; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclReexports = dtb__97; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclOpacity = dtb__98; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__99 } -> ((((v_Vuna_dCompiler_dDriver_dCompile_dtoolImportNamesOf nFs) ctx) dtb__93) dtb__86)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__85)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__100) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)) parsed))))

# 1237 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolEnabled = (fun nEnv -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffEnv.v_Base_dEffEnv_denvGetEnv nEnv) "VUNA_IFACE_TOOL")) (fun v -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v <> "0")))))

# 1242 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dimportClosureGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__101, dtb__102) -> (if (mc0 <= 0) then mc3 else (if ((Base_dList.v_Base_dList_dmemName dtb__101) mc3) then ((((v_Vuna_dCompiler_dDriver_dCompile_dimportClosureGo (mc0 - 1)) mc1) dtb__102) mc3) else (match ((v_Vuna_dCompiler_dDriver_dCompile_dfindClosureMod dtb__101) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dDriver_dCompile_dimportClosureGo (mc0 - 1)) mc1) dtb__102) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__101, mc3)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__103) -> ((((v_Vuna_dCompiler_dDriver_dCompile_dimportClosureGo (mc0 - 1)) mc1) ((Base_dList.v_Base_dList_dappend (dtb__103).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports) dtb__102)) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__101, mc3)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 1252 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dimportClosureOf = (fun mods starts -> ((((v_Vuna_dCompiler_dDriver_dCompile_dimportClosureGo 8192) mods) starts) Base_dList.C_Base_dList_dList_Nil))

# 1255 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_disNeededMod = (fun needed m -> ((Base_dList.v_Base_dList_dmemName (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName) needed))

# 1259 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolDepModsOf = (fun ctx mods needed -> ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompile_disNeededMod needed)) ((v_Vuna_dCompiler_dDriver_dCompile_ddepModsOf ctx) mods)))

# 1319 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolTextHash = (fun _uarity0 -> (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest _uarity0))

# 1322 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsourceInfoForPath = (fun nFs path -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) path)) (fun raw -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dFunctor.v_Base_dFunctor_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) (Base_dMaybe.v_Base_dMaybe_dfromMaybe 0)) ((Base_dEffFs.v_Base_dEffFs_dfsFileMtime nFs) path))) (fun mtime -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dFunctor.v_Base_dFunctor_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) (fun o -> ((Base_dMaybe.v_Base_dMaybe_dfromMaybe 0) o))) ((Base_dEffFs.v_Base_dEffFs_dfsFileSize nFs) path))) (fun size -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siPath = path; Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siHash = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest raw); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siMtime = mtime; Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siSize = size }))))))))

# 1329 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolNowSec = (fun nClock -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffClock.v_Base_dEffClock_dclockNow nClock)) (fun us -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if 1000000 = 0 then failwith "division by zero" else us / 1000000)))))

# 1176 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsourceInfoUnchanged = (fun nFs nClock nEnv path si -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dmtimeFastPath nEnv)) (fun fast -> (if fast then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dFunctor.v_Base_dFunctor_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) (Base_dMaybe.v_Base_dMaybe_dfromMaybe 0)) ((Base_dEffFs.v_Base_dEffFs_dfsFileMtime nFs) path))) (fun m -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dFunctor.v_Base_dFunctor_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) (fun o -> ((Base_dMaybe.v_Base_dMaybe_dfromMaybe 0) o))) ((Base_dEffFs.v_Base_dEffFs_dfsFileSize nFs) path))) (fun sz -> (if (if (m = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiMtimeOf si)) then (sz = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiSizeOf si)) else false) then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dtoolNowSec nClock)) (fun now -> (if ((m + v_Vuna_dCompiler_dDriver_dCompile_dmtimeSafetyWindowSec) < now) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) true) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) path)) (fun content -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest content) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf si)))))))) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) path)) (fun content -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest content) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf si)))))))))) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) path)) (fun content -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest content) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf si)))))))))

# 1161 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dallModuleSourcesValid = (fun nFs nClock nEnv mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__104, dtb__105) -> (match ((Base_dList.v_Base_dList_dlookupPair (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__104)) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__106) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dsourceInfoUnchanged nFs) nClock) nEnv) dtb__106) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf dtb__104))) (fun unchanged -> (if unchanged then (((((v_Vuna_dCompiler_dDriver_dCompile_dallModuleSourcesValid nFs) nClock) nEnv) dtb__105) mc1) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) true)
  | _ -> failwith "DT: impossible branch"
))

# 1145 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceSourcesValid = (fun nFs nClock nEnv roots p pi -> ((fun pkgRoots -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dsourcePathMapOfRoots nFs) pkgRoots)) (fun walked -> (((((v_Vuna_dCompiler_dDriver_dCompile_dallModuleSourcesValid nFs) nClock) nEnv) (pi).Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piModules) walked)))) ((Base_dList.v_Base_dList_dfilter (fun r -> ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName r) = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName p)))) roots)))

# 1337 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsourceFresh = (fun nFs builtSec si -> ((fun path -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path)) (fun exists -> (if (((Base_dEq.v_Base_dEq_d_x61__x61_ Base_dEq.v_Eq_uBase_uBool_uBool) exists) false) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dFunctor.v_Base_dFunctor_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) (Base_dMaybe.v_Base_dMaybe_dfromMaybe 0)) ((Base_dEffFs.v_Base_dEffFs_dfsFileMtime nFs) path))) (fun m -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dFunctor.v_Base_dFunctor_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) (fun o -> ((Base_dMaybe.v_Base_dMaybe_dfromMaybe 0) o))) ((Base_dEffFs.v_Base_dEffFs_dfsFileSize nFs) path))) (fun sz -> (if (if (if (m = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiMtimeOf si)) then (sz = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiSizeOf si)) else false) then (((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiMtimeOf si) + v_Vuna_dCompiler_dDriver_dCompile_dmtimeSafetyWindowSec) <= builtSec) else false) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) true) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) path)) (fun content -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest content) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf si)))))))))))))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiPathOf si)))

# 1352 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dtoolSessionFresh = (fun nFs mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__107, dtb__108) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dsourceFresh nFs) mc0) dtb__107)) (fun fresh -> (if fresh then (((v_Vuna_dCompiler_dDriver_dCompile_dtoolSessionFresh nFs) mc0) dtb__108) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) true)
  | _ -> failwith "DT: impossible branch"
))

# 1395 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmodHashPair = (fun m -> { Base_dPair.f_Base_dPair_dPair_first = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName; Base_dPair.f_Base_dPair_dPair_second = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr })

# 1398 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dstatOfClosureMod = (fun nFs m -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dFunctor.v_Base_dFunctor_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) (Base_dMaybe.v_Base_dMaybe_dfromMaybe 0)) ((Base_dEffFs.v_Base_dEffFs_dfsFileMtime nFs) (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath))) (fun mtime -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dFunctor.v_Base_dFunctor_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) (fun o -> ((Base_dMaybe.v_Base_dMaybe_dfromMaybe 0) o))) ((Base_dEffFs.v_Base_dEffFs_dfsFileSize nFs) (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath))) (fun size -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siPath = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath; Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siHash = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc; Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siMtime = mtime; Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siSize = size }))))))

# 1421 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_downCleanWanted = (fun needed exclude m -> (if ((Base_dList.v_Base_dList_dmemName (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName) needed) then (match exclude with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__109) -> ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName <> dtb__109)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
) else false))

# 1517 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolCompilerFingerprint = (fun nFs nEnv -> ((v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint nFs) nEnv))

# 1528 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcanonicalDir = (fun dir -> (if ((Base_dString.v_Base_dString_dendsWith "/") dir) then (((Base_dString.v_Base_dString_dsubstring 0) (bi_natFromInt ((bi_strLength dir) - 1))) dir) else dir))

# 1532 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcanonicalPath = (fun dir file -> ((fun d -> (if (if (d = ".") then true else (d = "")) then file else (if ((Base_dString.v_Base_dString_dstartsWith (d ^ "/")) file) then (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt ((bi_strLength d) + 1))) (bi_natFromInt (((bi_strLength file) - (bi_strLength d)) - 1))) file) else file))) (v_Vuna_dCompiler_dDriver_dCompile_dcanonicalDir dir)))

# 1540 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dresolveStoredPath = (fun dir file -> ((fun d -> (if (if (file = "") then true else ((Base_dString.v_Base_dString_dstartsWith "/") file)) then file else (if (if (d = ".") then true else (d = "")) then file else (String.concat "" [d; "/"; file])))) (v_Vuna_dCompiler_dDriver_dCompile_dcanonicalDir dir)))

# 1547 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dabsoluteSpanLabel = (fun l -> (match (l).Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dLabel_labelSpan with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__110) -> ((Base_dString.v_Base_dString_dstartsWith "/") (dtb__110).Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile)
  | _ -> failwith "DT: impossible branch"
))

# 1552 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dhasAbsoluteLabels = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__111, dtb__112) -> (if (v_Vuna_dCompiler_dDriver_dCompile_dabsoluteSpanLabel dtb__111) then true else (v_Vuna_dCompiler_dDriver_dCompile_dhasAbsoluteLabels dtb__112))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1556 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_danyAbsoluteChild = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__113, dtb__114) -> (if (v_Vuna_dCompiler_dDriver_dCompile_ddiagHasAbsolutePath dtb__113) then true else (v_Vuna_dCompiler_dDriver_dCompile_danyAbsoluteChild dtb__114))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1560 "Vuna/Compiler/Driver/Compile.vuna"
and v_Vuna_dCompiler_dDriver_dCompile_ddiagHasAbsolutePath = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagId = dtb__115; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagSeverity = dtb__116; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagPhase = dtb__117; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagCategory = dtb__118; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagCode = dtb__119; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagMessage = dtb__120; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagLabels = dtb__121; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagFields = dtb__122; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagTrace = dtb__123; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagNotes = dtb__124; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagSuggestions = dtb__125; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagOrigin = dtb__126; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagChildren = dtb__127; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagInternal = dtb__128; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagIce = dtb__129; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagAbsent = dtb__130; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagStability = dtb__131 } -> (if (v_Vuna_dCompiler_dDriver_dCompile_dhasAbsoluteLabels dtb__121) then true else (v_Vuna_dCompiler_dDriver_dCompile_danyAbsoluteChild dtb__127))
  | _ -> failwith "DT: impossible branch"
))

# 1564 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_disStableDiag = (fun d -> (match (d).Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagStability with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dStability_Stable -> true
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dStability_Volatile -> false
  | _ -> failwith "DT: impossible branch"
))

# 1569 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dallStableDiags = (fun ds -> ((Base_dList.v_Base_dList_dlength ((Base_dList.v_Base_dList_dfilter (fun d -> (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dDriver_dCompile_disStableDiag d)))) ds)) = 0))

# 1573 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dprepareForStore = (fun ctx d -> ((fun d2 -> (if (v_Vuna_dCompiler_dDriver_dCompile_ddiagHasAbsolutePath d2) then ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithStability Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dStability_Volatile) d2) else (if (v_Vuna_dCompiler_dDriver_dCompile_disStableDiag d2) then ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithStability Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dStability_Stable) d2) else d2))) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dmapSpanFile (v_Vuna_dCompiler_dDriver_dCompile_dcanonicalPath (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextDir ctx))) d)))

# 1580 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dresolveStoredDiag = (fun ctx d -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dmapSpanFile (v_Vuna_dCompiler_dDriver_dCompile_dresolveStoredPath (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextDir ctx))) d))

# 1583 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dreplayFailure = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__132, dtb__133) -> (match dtb__133 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__132))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithChildren dtb__133) dtb__132)))
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1608 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckModsOf = (fun pkg kind manifest sources deps ver flags -> { f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmPkg = pkg; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmKind = kind; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmManifest = manifest; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmSources = sources; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmDeps = deps; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmVer = ver; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmFlags = flags })

# 683 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckModsExe = (fun nFs nEnv nProcess ctx entry -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dcontextSources nFs) ctx) entry)) (fun sources -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesEff nFs) nEnv) nProcess) ctx)) (fun deps -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint nFs) nEnv)) (fun fp -> ((fun srcHash -> ((fun manHash -> ((fun verHash -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckModsOf (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) "exe") (v_Vuna_dCompiler_dDriver_dCompile_dhashText manHash)) (v_Vuna_dCompiler_dDriver_dCompile_dhashText srcHash)) (v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesHash deps)) (v_Vuna_dCompiler_dDriver_dCompile_dhashText verHash)) (v_Vuna_dCompiler_dDriver_dCompile_dreleaseFlagOf ctx)))) ((v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dcheckNodeSchema ^ Vuna_dCompiler_dBase_dVersion.v_Vuna_dCompiler_dBase_dVersion_dvunaVersion)) + fp))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dmanifestSemanticText (ctx).Vuna_dCompiler_dFrontend_dPackages_dPkg.f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage)))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf sources) 0)))))))))

# 696 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckModsLib = (fun nFs nEnv nProcess ctx names -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dconcatMapEff (v_Vuna_dCompiler_dDriver_dCompile_drootSources nFs)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx))) (fun rootSourcesAll -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesEff nFs) nEnv) nProcess) ctx)) (fun deps -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint nFs) nEnv)) (fun fp -> ((fun srcHash -> ((fun manHash -> ((fun namesHash -> ((fun verHash -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckModsOf (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) ("lib:" ^ (v_Vuna_dCompiler_dDriver_dCompile_dhashText namesHash))) (v_Vuna_dCompiler_dDriver_dCompile_dhashText manHash)) (v_Vuna_dCompiler_dDriver_dCompile_dhashText srcHash)) (v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesHash deps)) (v_Vuna_dCompiler_dDriver_dCompile_dhashText verHash)) (v_Vuna_dCompiler_dDriver_dCompile_dreleaseFlagOf ctx)))) ((v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dcheckNodeSchema ^ Vuna_dCompiler_dBase_dVersion.v_Vuna_dCompiler_dBase_dVersion_dvunaVersion)) + fp))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash ((Base_dString.v_Base_dString_djoin "\t") names)))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dmanifestSemanticText (ctx).Vuna_dCompiler_dFrontend_dPackages_dPkg.f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage)))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf rootSourcesAll) 0)))))))))

# 1615 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dprojectIdOf = (fun nEnv ctx -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dabsolutePath nEnv) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextDir ctx))) (fun abs -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dLoader_dAddr.v_Vuna_dCompiler_dLoader_dAddr_dprojectIdAddrOf abs)))))

# 1623 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_drootKeepEff = (fun nFs nEnv nProcess ctx digests -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dprojectIdOf nEnv) ctx)) (fun pid -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dabsolutePath nEnv) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextDir ctx))) (fun abs -> ((((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreRootAppendEff nFs) nEnv) nProcess) pid) abs) digests))))))

# 1588 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dstoreCheckPayload = (fun nFs nEnv nProcess ctx dig outcome -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreObjectWriteEff nFs) nEnv) nProcess) "check-outcome") Vuna_dCompiler_dBase_dDiag_dCodec.v_Vuna_dCompiler_dBase_dDiag_dCodec_dcheckResultCodec) dig) (Vuna_dCompiler_dBase_dDiag_dCodec.v_Vuna_dCompiler_dBase_dDiag_dCodec_dencCheckOutcome outcome))) (fun _u -> (((((v_Vuna_dCompiler_dDriver_dCompile_drootKeepEff nFs) nEnv) nProcess) ctx) (Base_dList.C_Base_dList_dList__x58__x58_ (dig, Base_dList.C_Base_dList_dList_Nil))))))

# 1663 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_drunAndStore = (fun nFs nEnv nProcess ctx dig run -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCountEff "vuna.counter.cache.miss") 1)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) run) (fun r -> (match r with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__134) -> ((fun stored -> ((fun _u -> (if (v_Vuna_dCompiler_dDriver_dCompile_dallStableDiags stored) then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_dstoreCheckPayload nFs) nEnv) nProcess) ctx) dig) (Vuna_dCompiler_dBase_dDiag_dCodec.C_Vuna_dCompiler_dBase_dDiag_dCodec_dCheckOutcome_CheckFailed (stored)))) (fun n -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCountEff "vuna.counter.cache.write") 1)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__134)))))) (if (dtp_debug_on 0) then (dtp_debug_line ("check-store write=" ^ (bi_strFromInt n))) else 0)))) else ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__134)))) (if (dtp_debug_on 0) then (dtp_debug_line "check-cache=skip volatile") else 0)))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["check-store stable="; (bi_strFromInt (Base_dList.v_Base_dList_dlength ((Base_dList.v_Base_dList_dfilter (fun d -> (v_Vuna_dCompiler_dDriver_dCompile_disStableDiag d))) stored))); "/"; (bi_strFromInt (Base_dList.v_Base_dList_dlength stored))])) else 0))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCompile_dprepareForStore ctx)) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__134, Base_dList.C_Base_dList_dList_Nil))))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__135) -> ((fun allStored -> ((fun stored -> ((fun dropped -> ((fun _u -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_dstoreCheckPayload nFs) nEnv) nProcess) ctx) dig) (Vuna_dCompiler_dBase_dDiag_dCodec.C_Vuna_dCompiler_dBase_dDiag_dCodec_dCheckOutcome_CheckPassed (stored)))) (fun n -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCountEff "vuna.counter.cache.write") 1)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__135)))))) (if (dtp_debug_on 0) then (dtp_debug_line ("check-store write=" ^ (bi_strFromInt n))) else 0))))) (if (dropped > 0) then (if (dtp_debug_on 0) then (dtp_debug_line ("check-store dropped=" ^ (bi_strFromInt dropped))) else 0) else 0))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["check-store pass stable="; (bi_strFromInt (Base_dList.v_Base_dList_dlength stored)); "/"; (bi_strFromInt (Base_dList.v_Base_dList_dlength allStored))])) else 0))) (bi_natSub (Base_dList.v_Base_dList_dlength allStored) (Base_dList.v_Base_dList_dlength stored)))) ((Base_dList.v_Base_dList_dfilter v_Vuna_dCompiler_dDriver_dCompile_disStableDiag) allStored))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCompile_dprepareForStore ctx)) dtb__135))
  | _ -> failwith "DT: impossible branch"
)))))) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=miss") else 0)))

# 1779 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_delabFullRequested = (fun nEnv -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffEnv.v_Base_dEffEnv_denvGetEnv nEnv) "VUNA_ELAB_FULL")) (fun v -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v = "1")))))

# 1786 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difaceAuditRequested = (fun nEnv -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffEnv.v_Base_dEffEnv_denvGetEnv nEnv) "VUNA_IFACE_AUDIT")) (fun v -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v = "1")))))

# 1795 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckSignatureOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__136) -> ("err\n" ^ (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_ddiagText dtb__136))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__137) -> "ok\n"
  | _ -> failwith "DT: impossible branch"
))

# 1801 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitSignatureOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__138) -> ("err\n" ^ (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_ddiagText dtb__138))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__139) -> ("ok\n" ^ ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTop Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dencSplitFiles) (Base_dPair.v_Base_dPair_dfirstOf dtb__139)))
  | _ -> failwith "DT: impossible branch"
))

# 1805 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_djoinLines = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__140, dtb__141) -> (if (((Base_dEq.v_Base_dEq_d_x61__x61_ (Base_dList.v_Eq_uBase_uList_uList_ua Base_dString.v_Eq_uString)) dtb__141) Base_dList.C_Base_dList_dList_Nil) then dtb__140 else (String.concat "" [dtb__140; "\n"; (v_Vuna_dCompiler_dDriver_dCompile_djoinLines dtb__141)]))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1811 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dauditCompare = (fun subject at s f -> (if (s = f) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_derr (String.concat "" ["iface-audit-mismatch subject="; subject; " at="; at; " summary="; (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_dtextHash s)); "/"; (bi_strFromInt (bi_strLength s)); " full="; (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_dtextHash f)); "/"; (bi_strFromInt (bi_strLength f))]))))

# 1854 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dreadOneModIface = (fun nFs nEnv nProcess m -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceAtEff nFs) nEnv) nProcess) (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr)) (fun mi -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = m; Base_dPair.f_Base_dPair_dPair_second = mi }))))

# 1872 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dreadIfaces = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__142, dtb__143) -> (match (Base_dPair.v_Base_dPair_dsecondOf dtb__142) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dDriver_dCompile_dreadIfaces dtb__143)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__144) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__144, (v_Vuna_dCompiler_dDriver_dCompile_dreadIfaces dtb__143)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1889 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dfromDirty = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__145, dtb__146) -> (if ((Base_dString.v_Base_dString_dstartsWith (dtb__145 ^ ".")) mc1) then true else ((v_Vuna_dCompiler_dDriver_dCompile_dfromDirty dtb__146) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1884 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_danyExportFrom = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__147, dtb__148) -> (if ((v_Vuna_dCompiler_dDriver_dCompile_dfromDirty mc0) (dtb__147).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target) then true else ((v_Vuna_dCompiler_dDriver_dCompile_danyExportFrom mc0) dtb__148))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1881 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dexportsFromDirty = (fun dirty mi -> ((v_Vuna_dCompiler_dDriver_dCompile_danyExportFrom dirty) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiExportsOf mi)))

# 1896 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_ddirtyFix = (fun fuel dirty cands -> (if (fuel <= 0) then dirty else ((fun added -> (if ((Base_dList.v_Base_dList_dlength added) = 0) then dirty else (((v_Vuna_dCompiler_dDriver_dCompile_ddirtyFix (fuel - 1)) ((Base_dList.v_Base_dList_dappend added) dirty)) cands))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf) ((Base_dList.v_Base_dList_dfilter (fun mi -> (if (Base_dBool.v_Base_dBool_dnot ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf mi)) dirty)) then ((v_Vuna_dCompiler_dDriver_dCompile_dexportsFromDirty dirty) mi) else false))) cands)))))

# 1905 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcollectClean = (fun dirty0 cands -> ((fun dirty -> ((Base_dList.v_Base_dList_dfilter (fun mi -> (Base_dBool.v_Base_dBool_dnot ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf mi)) dirty)))) cands)) (((v_Vuna_dCompiler_dDriver_dCompile_ddirtyFix ((Base_dList.v_Base_dList_dlength cands) + 1)) dirty0) cands)))

# 1944 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dcleanHashOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__149, dtb__150) -> (if ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__149) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf dtb__149))) else ((v_Vuna_dCompiler_dDriver_dCompile_dcleanHashOf dtb__150) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1935 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__151, dtb__152) -> (match dtb__151 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__153; Base_dPair.f_Base_dPair_dPair_second = dtb__154 } -> (if (dtb__154 = Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_ddepMissingHash) then (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk mc0) mc1) dtb__152) else (match ((Base_dList.v_Base_dList_dlookupPair dtb__153) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__155) -> (if (dtb__155 = dtb__154) then (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk mc0) mc1) dtb__152) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((v_Vuna_dCompiler_dDriver_dCompile_dcleanHashOf mc1) dtb__153) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__156) -> (if (dtb__156 = dtb__154) then (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk mc0) mc1) dtb__152) else false)
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

# 1468 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dcleanPass = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__157, dtb__158) -> (if (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk mc0) mc2) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf dtb__157)) then ((((v_Vuna_dCompiler_dDriver_dCompile_dcleanPass mc0) dtb__158) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__157, mc2))) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__157, mc3))) else ((fun p -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__157, (Base_dPair.v_Base_dPair_dfirstOf p))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) }) ((((v_Vuna_dCompiler_dDriver_dCompile_dcleanPass mc0) dtb__158) mc2) mc3)))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.v_Base_dList_dreverse mc3) }
  | _ -> failwith "DT: impossible branch"
))

# 1458 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dcleanFixpoint = (fun fuel depTbl pending cleanRev -> (if (fuel <= 0) then ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse pending)) cleanRev) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__159; Base_dPair.f_Base_dPair_dPair_second = dtb__160 } -> (match dtb__159 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse dtb__160)) cleanRev)
  | _ -> (if ((Base_dList.v_Base_dList_dlength dtb__160) = 0) then ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse dtb__159)) cleanRev) else ((fun _u -> ((((v_Vuna_dCompiler_dDriver_dCompile_dcleanFixpoint (fuel - 1)) depTbl) dtb__159) ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse dtb__160)) cleanRev))) ((Base_dObs.v_Base_dObs_dobsCounter "vuna.tool.clean.kept") (Base_dList.v_Base_dList_dlength dtb__160))))
)
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dDriver_dCompile_dcleanPass depTbl) pending) cleanRev) Base_dList.C_Base_dList_dList_Nil))))

# 1953 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difaceSchemaTag = Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_difaceSchema

# 1956 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag = (fun nFs nEnv -> ((Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dcompilerTagEff nFs) nEnv))

# 916 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_drootEnvHashOf = (fun nFs nEnv dir -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (dir ^ "/vuna.toml"))) (fun tomlPath -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) tomlPath)) (fun exists -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if exists then ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) tomlPath) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ""))) (fun toml -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag nFs) nEnv)) (fun tag -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (String.concat "" [(bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_dtextHash toml)); "|"; tag; "|"]))))))))))))

# 924 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_drootPkgTableEff = (fun nFs nEnv ctx -> ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun r -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_drootEnvHashOf nFs) nEnv) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootDir r))) (fun env -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peName = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName r); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peDir = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootDir r); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peKey = (v_Vuna_dCompiler_dDriver_dCompile_dpkgKeyOf (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName r)); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peEnv = (bi_strFromInt env) }))))) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)))

# 937 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difacesForRootsEff = (fun nFs nClock nEnv nProcess ctx -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_drootPkgTableEff nFs) nEnv) ctx)) (fun pkgs -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_difaceModsWithEff nFs) nClock) nEnv) nProcess) ctx) pkgs)) (fun mods -> ((((v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListEff nFs) nEnv) nProcess) mods))))))

# 1289 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dbaseDepIfacesOf = (fun nFs nClock nEnv nProcess ctx -> (match (ctx).Vuna_dCompiler_dFrontend_dPackages_dPkg.f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__161) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dDriver_dCompile_difacesForRootsEff nFs) nClock) nEnv) nProcess) ctx)
  | _ -> failwith "DT: impossible branch"
))

# 1829 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpackageEnvHash = (fun nFs nEnv nProcess ctx -> ((fun own -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesEff nFs) nEnv) nProcess) ctx)) (fun deps -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag nFs) nEnv)) (fun tag -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (String.concat "" [(bi_strFromInt own); "|"; tag; "|"; (v_Vuna_dCompiler_dDriver_dCompile_djoinLines ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dpairText) deps))])))))))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dmanifestSemanticText (ctx).Vuna_dCompiler_dFrontend_dPackages_dPkg.f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage))))

# 781 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpkgTableEff = (fun nFs nEnv nProcess ctx -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dpackageEnvHash nFs) nEnv) nProcess) ctx)) (fun ownEnv -> ((fun own -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun p -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dpackageEnvHash nFs) nEnv) nProcess) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageContext p))) (fun e -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peName = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName p); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peDir = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDir p); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peKey = (v_Vuna_dCompiler_dDriver_dCompile_dpkgKeyOf (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName p)); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peEnv = (bi_strFromInt e) }))))) (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageList ctx))) (fun deps -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dList.C_Base_dList_dList__x58__x58_ (own, deps)))))) { f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peName = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peDir = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextDir ctx); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peKey = (v_Vuna_dCompiler_dDriver_dCompile_dpkgKeyOf (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peEnv = (bi_strFromInt ownEnv) }))))

# 886 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff = (fun nFs nClock nEnv nProcess ctx -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dpkgTableEff nFs) nEnv) nProcess) ctx)) (fun pkgs -> ((((((v_Vuna_dCompiler_dDriver_dCompile_difaceModsWithEff nFs) nClock) nEnv) nProcess) ctx) pkgs))))

# 931 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difacesForContextEff = (fun nFs nClock nEnv nProcess ctx -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> ((((v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListEff nFs) nEnv) nProcess) mods))))

# 1262 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForToolSource = (fun nFs nClock nEnv nProcess ctx label source -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dtoolEnabled nEnv)) (fun enabled -> (if enabled then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_dtoolImportsOfSource nFs) nEnv) nProcess) ctx) label) source)) (fun starts -> ((fun needed -> ((fun depMods -> ((fun _u -> ((((v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListEff nFs) nEnv) nProcess) depMods)) (if (dtp_debug_on 0) then (dtp_debug_line ("tool-closure modules=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength depMods)))) else 0))) (((v_Vuna_dCompiler_dDriver_dCompile_dtoolDepModsOf ctx) mods) needed))) ((v_Vuna_dCompiler_dDriver_dCompile_dimportClosureOf mods) starts)))))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))

# 1277 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForToolProgram = (fun nFs nClock nEnv nProcess ctx program -> (((((((v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForToolSource nFs) nClock) nEnv) nProcess) ctx) "<repl>") program))

# 1359 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolNeededOfImports = (fun nFs nClock nEnv nProcess ctx tool currentName imports -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dtoolImportNamesOf nFs) ctx) currentName) imports)) (fun importNames -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dimportClosureOf mods) importNames)))))))

# 1367 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForToolSourceDetailed = (fun nFs nClock nEnv nProcess ctx label source -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dtoolEnabled nEnv)) (fun enabled -> (if enabled then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsMarkEff "vuna.tool.ifaces.lookup")) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_dtoolImportsOfSource nFs) nEnv) nProcess) ctx) label) source)) (fun starts -> ((fun needed -> ((fun depMods -> ((fun depHashes -> ((fun ownNames -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListEff nFs) nEnv) nProcess) depMods)) (fun ifaces -> (match ifaces with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsMarkEff "vuna.tool.ifaces.missing")) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__162) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsMarkEff "vuna.tool.ifaces.ready")) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (v_Vuna_dCompiler_dDriver_dCompile_dstatOfClosureMod nFs)) depMods)) (fun stats -> ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcDepIfaces = dtb__162; f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcDepHashes = depHashes; f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcNeeded = needed; f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcOwnNames = ownNames; f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcStats = stats })))) (if (dtp_debug_on 0) then (dtp_debug_line ("tool-closure modules=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__162)))) else 0))))))
  | _ -> failwith "DT: impossible branch"
)))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodNameOf) ((v_Vuna_dCompiler_dDriver_dCompile_dselfModsOf ctx) mods)))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodHashPair) depMods))) (((v_Vuna_dCompiler_dDriver_dCompile_dtoolDepModsOf ctx) mods) needed))) ((v_Vuna_dCompiler_dDriver_dCompile_dimportClosureOf mods) starts)))))))) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsMarkEff "vuna.tool.ifaces.disabled")) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))))

# 1492 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwriteModuleIfaceGuarded = (fun nFs nClock nEnv nProcess ctx mi -> (if ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx) = "") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (match ((v_Vuna_dCompiler_dDriver_dCompile_dfindClosureMod (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf mi)) mods) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__163) -> (((((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreObjectWriteEff nFs) nEnv) nProcess) "module-iface") v_Vuna_dCompiler_dDriver_dCompile_difaceObjectCodec) (dtb__163).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dencModuleIface mi))
  | _ -> failwith "DT: impossible branch"
)))))

# 1478 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolWriteModuleIface = (fun nFs nClock nEnv nProcess nExit nArgs ctx tool clean checked name si -> ((fun miResult -> (match miResult with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__164) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__164)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__165) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_dwriteModuleIfaceGuarded nFs) nClock) nEnv) nProcess) ctx) dtb__165)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__165)))))
  | _ -> failwith "DT: impossible branch"
)) (((((((((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_difaceOfModule (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) si) (tool).f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcDepHashes) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedInherited) clean) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedModules) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedEntryDecls) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram) name)))

# 1819 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceHashTable = (fun nFs nClock nEnv nProcess ctx -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodHashPair) ((v_Vuna_dCompiler_dDriver_dCompile_ddepModsOf ctx) mods))))))

# 1859 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_downCleanInfo = (fun nFs nClock nEnv nProcess ctx -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (((v_Vuna_dCompiler_dDriver_dCompile_dreadOneModIface nFs) nEnv) nProcess)) ((v_Vuna_dCompiler_dDriver_dCompile_dselfModsOf ctx) mods))) (fun reads -> ((fun ownNames -> ((fun cands -> ((fun missing -> ((fun clean -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = (if ((Base_dList.v_Base_dList_dlength clean) = 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (clean))) })) ((v_Vuna_dCompiler_dDriver_dCompile_dcollectClean missing) cands))) ((Base_dList.v_Base_dList_dfilter (fun n -> (Base_dBool.v_Base_dBool_dnot ((Base_dList.v_Base_dList_dmemName n) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf) cands))))) ownNames))) (v_Vuna_dCompiler_dDriver_dCompile_dreadIfaces reads))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodNameOf) ((v_Vuna_dCompiler_dDriver_dCompile_dselfModsOf ctx) mods))))))))

# 1911 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_downCleanModules = (fun nFs nClock nEnv nProcess ctx -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_downCleanInfo nFs) nClock) nEnv) nProcess) ctx)) (fun info -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dPair.v_Base_dPair_dsecondOf info)))))

# 1919 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcleanIfacesOrEmpty = (fun nFs nClock nEnv nProcess ctx -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_downCleanModules nFs) nClock) nEnv) nProcess) ctx)) (fun clean -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match clean with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__166) -> dtb__166
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))))

# 1502 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolWriteModuleIfaceCold = (fun nFs nClock nEnv nProcess nExit nArgs ctx checked name si -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dcleanIfacesOrEmpty nFs) nClock) nEnv) nProcess) ctx)) (fun clean -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceHashTable nFs) nClock) nEnv) nProcess) ctx)) (fun depTbl -> ((fun miResult -> (match miResult with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__167) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__167)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__168) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_dwriteModuleIfaceGuarded nFs) nClock) nEnv) nProcess) ctx) dtb__168)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__168)))))
  | _ -> failwith "DT: impossible branch"
)) (((((((((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_difaceOfModule (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) si) depTbl) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedInherited) clean) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedModules) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedEntryDecls) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram) name)))))))

# 1962 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_downSourceInfos = (fun nFs nEnv ctx -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun root -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta nFs) 1048576) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootDir root))) (fun paths -> ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun p -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dabsolutePath nEnv) p)) (fun abs -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) abs)) (fun raw -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dFunctor.v_Base_dFunctor_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) (Base_dMaybe.v_Base_dMaybe_dfromMaybe 0)) ((Base_dEffFs.v_Base_dEffFs_dfsFileMtime nFs) abs))) (fun mtime -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dFunctor.v_Base_dFunctor_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) (fun o -> ((Base_dMaybe.v_Base_dMaybe_dfromMaybe 0) o))) ((Base_dEffFs.v_Base_dEffFs_dfsFileSize nFs) abs))) (fun size -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootDir root)) p); Base_dPair.f_Base_dPair_dPair_second = { Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siPath = abs; Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siHash = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest raw); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siMtime = mtime; Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siSize = size } }))))))))))) paths))))) ((Base_dList.v_Base_dList_dfilter (fun r -> ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName r) = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)))) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)))) (fun walked -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dList.v_Base_dList_dconcatMap (fun xs -> xs)) walked)))))

# 1979 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dresyncCleanSources = (fun sources clean -> ((Base_dList.v_Base_dList_dmap (fun m -> (match ((Base_dList.v_Base_dList_dlookupPair (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m)) sources) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__169) -> { Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miName = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPackage = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiPackageOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miSource = dtb__169; Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miIfaceHash = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplHash = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiImplHashOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDepHashes = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImports = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiImportsOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplicitImports = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiImplicitImportsOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miExports = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiExportsOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miFixities = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiFixitiesOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDecls = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDeclsOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miRecords = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiRecordsOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPrepared = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiPreparedOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miCached = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDefLocs = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDefLocsOf m) }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> m
  | _ -> failwith "DT: impossible branch"
))) clean))

# 1995 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dshadowAllowed = (fun ctx -> (match (ctx).Vuna_dCompiler_dFrontend_dPackages_dPkg.f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__170) -> true
  | _ -> failwith "DT: impossible branch"
))

# 2001 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dnameExportedBy = (fun names m -> ((Base_dList.v_Base_dList_dmemName (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName) names))

# 1105 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dexportedDepModsOf = (fun ctx p mods -> ((fun inPkg -> (match ((v_Vuna_dCompiler_dDriver_dCompile_drootExportsOf p) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> inPkg
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__171) -> ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompile_dnameExportedBy dtb__171)) inPkg)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompile_dpkgEq p)) mods)))

# 1085 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dgoPkgs = (fun nFs nEnv nProcess mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__172, dtb__173) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dreadOrderEff nFs) nEnv) nProcess) mc0) dtb__172)) (fun ord -> (match ord with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__174) -> ((fun current -> ((fun namesCurrent -> ((fun picked -> ((fun required -> (if (if namesCurrent then ((v_Vuna_dCompiler_dDriver_dCompile_dallNamesIn ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodNameOf) required)) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodNameOf) picked)) else false) then (((((((v_Vuna_dCompiler_dDriver_dCompile_dgoPkgs nFs) nEnv) nProcess) mc0) mc1) dtb__173) ((Base_dList.v_Base_dList_dappend mc3) picked)) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))) (((v_Vuna_dCompiler_dDriver_dCompile_dexportedDepModsOf mc0) dtb__172) mc1))) ((v_Vuna_dCompiler_dDriver_dCompile_dpickByOrder mc1) dtb__174))) ((v_Vuna_dCompiler_dDriver_dCompile_dallNamesIn dtb__174) current))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodNameOf) ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompile_dpkgEq dtb__172)) mc1)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc3)))
  | _ -> failwith "DT: impossible branch"
))

# 1119 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepModsByOrderEff = (fun nFs nEnv nProcess ctx mods -> (((((((v_Vuna_dCompiler_dDriver_dCompile_dgoPkgs nFs) nEnv) nProcess) ctx) mods) ((v_Vuna_dCompiler_dDriver_dCompile_ddistinctPkgs ((v_Vuna_dCompiler_dDriver_dCompile_ddepModsOf ctx) mods)) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil))

# 994 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf = (fun nFs nClock nEnv nProcess ctx -> (match (ctx).Vuna_dCompiler_dFrontend_dPackages_dPkg.f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__175) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_ddepModsByOrderEff nFs) nEnv) nProcess) ctx) mods)) (fun ordered -> (match ordered with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (if (dtp_debug_on 0) then (dtp_debug_line "iface-reject=module-order") else 0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__176) -> ((((v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListEff nFs) nEnv) nProcess) dtb__176)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))

# 166 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsummarySplitParts = (fun nFs nConsole nClock nEnv nProcess ctx entry printResult -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf nFs) nClock) nEnv) nProcess) ctx)) (fun depIfaces -> (match depIfaces with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__177) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_downCleanModules nFs) nClock) nEnv) nProcess) ctx)) (fun clean -> ((fun _u -> ((((((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectWithIfaces nFs) nConsole) nEnv) nProcess) ctx) entry) printResult) dtb__177)) (match clean with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__178) -> (if (dtp_debug_on 0) then (dtp_debug_line ("cache-own-clean=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__178)))) else 0)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectParts nFs) nConsole) nEnv) nProcess) ctx) entry) printResult)
  | _ -> failwith "DT: impossible branch"
))))

# 1206 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForCheck = (fun nFs nClock nEnv nProcess ctx -> (((((v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf nFs) nClock) nEnv) nProcess) ctx))

# 1280 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForTool = (fun nFs nClock nEnv nProcess ctx -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dtoolEnabled nEnv)) (fun enabled -> (if enabled then (((((v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf nFs) nClock) nEnv) nProcess) ctx) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))

# 1730 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsummaryCheckExeParts = (fun nFs nClock nEnv nProcess nExit nArgs wantWarnings ctx entry -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf nFs) nClock) nEnv) nProcess) ctx)) (fun depIfaces -> (match depIfaces with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun _u -> (((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry)) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=full") else 0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__179) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_downCleanModules nFs) nClock) nEnv) nProcess) ctx)) (fun clean -> (match clean with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__180) -> ((fun cleanReal -> ((fun _u -> ((fun _u -> (((((((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckPackageIncrementalParts nFs) nEnv) nProcess) nExit) nArgs) ctx) entry) dtb__179) cleanReal)) (if (dtp_debug_on 0) then (dtp_debug_line ("cache-own-clean=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength cleanReal)))) else 0))) (if (dtp_debug_on 0) then (dtp_debug_line ("cache-path=summary deps=" ^ (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount ctx)))) else 0))) (if wantWarnings then Base_dList.C_Base_dList_dList_Nil else dtb__180))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun _u -> ((((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckPackageWithIfacesParts nFs) nEnv) nProcess) ctx) entry) dtb__179)) (if (dtp_debug_on 0) then (dtp_debug_line ("cache-path=summary deps=" ^ (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount ctx)))) else 0))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

# 2010 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dexportedOwnOf = (fun ctx own -> (match (ctx).Vuna_dCompiler_dFrontend_dPackages_dPkg.f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> own
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__181) -> (match (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageExports dtb__181) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> own
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__182) -> ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompile_dnameExportedBy dtb__182)) own)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 2083 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dmissingNamesOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__183, dtb__184) -> (if ((Base_dList.v_Base_dList_dmemName (dtb__183).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName) mc1) then ((v_Vuna_dCompiler_dDriver_dCompile_dmissingNamesOf dtb__184) mc1) else (Base_dList.C_Base_dList_dList__x58__x58_ ((dtb__183).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName, ((v_Vuna_dCompiler_dDriver_dCompile_dmissingNamesOf dtb__184) mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 2092 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceObjects = (fun nFs nEnv nProcess mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__185, dtb__186) -> (match ((v_Vuna_dCompiler_dDriver_dCompile_dfindClosureMod (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__185)) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceObjects nFs) nEnv) nProcess) mc0) dtb__186)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__187) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreObjectWriteEff nFs) nEnv) nProcess) "module-iface") v_Vuna_dCompiler_dDriver_dCompile_difaceObjectCodec) (dtb__187).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dencModuleIface dtb__185))) (fun bytes -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceObjects nFs) nEnv) nProcess) mc0) dtb__186)) (fun n -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if (bytes > 0) then (n + 1) else n))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 2017 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceShadow = (fun nFs nClock nEnv nProcess ctx checked -> (if ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx) = "") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))) else (if (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dDriver_dCompile_dshadowAllowed ctx)) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))) else ((fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffClock.v_Base_dEffClock_dclockNow nClock)) (fun t0 -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffClock.v_Base_dEffClock_dclockNow nClock)) (fun t1 -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_downSourceInfos nFs) nEnv) ctx)) (fun sources -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffClock.v_Base_dEffClock_dclockNow nClock)) (fun t2 -> ((fun depTbl -> ((fun own -> ((fun required -> (match ((((((((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_difaceOfPackage (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) sources) depTbl) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedInherited) Base_dList.C_Base_dList_dList_Nil) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedModules) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedEntryDecls) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__188) -> ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil)))) (if (dtp_debug_on 0) then (dtp_debug_line ("iface-reject=compute iface-skip " ^ (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_ddiagText dtb__188))) else 0))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__189) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffClock.v_Base_dEffClock_dclockNow nClock)) (fun t3 -> ((fun unwritten -> (if ((Base_dList.v_Base_dList_dlength unwritten) > 0) then ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil)))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["iface-skip partial closure="; (bi_strFromInt (Base_dList.v_Base_dList_dlength own)); " required="; (bi_strFromInt (Base_dList.v_Base_dList_dlength required)); " covered="; (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__189)); " missing="; ((Base_dString.v_Base_dString_djoin ",") unwritten)])) else 0)) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dwriteOrderEff nFs) nEnv) nProcess) ctx) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf) dtb__189))) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsMarkEff "vuna.iface.write")) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceObjects nFs) nEnv) nProcess) own) dtb__189)) (fun n -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dwritePkgIfaceSummaryEff nFs) nEnv) nProcess) ctx) dtb__189)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffClock.v_Base_dEffClock_dclockNow nClock)) (fun t4 -> ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__189)))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["iface-write="; (bi_strFromInt n); "/"; (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__189)); " closure="; (bi_strFromInt (Base_dList.v_Base_dList_dlength own)); " phases mods="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (t1 - t0) / 1000)); "ms sources="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (t2 - t1) / 1000)); "ms compute="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (t3 - t2) / 1000)); "ms write="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (t4 - t3) / 1000)); "ms"])) else 0)))))))))))))) ((v_Vuna_dCompiler_dDriver_dCompile_dmissingNamesOf required) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf) dtb__189)))))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDriver_dCompile_dexportedOwnOf ctx) own))) ((v_Vuna_dCompiler_dDriver_dCompile_dselfModsOf ctx) mods))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodHashPair) ((v_Vuna_dCompiler_dDriver_dCompile_ddepModsOf ctx) mods)))))))))))))) (if (dtp_debug_on 0) then (dtp_debug_line "iface-shadow-start") else 0)))))

# 2106 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difaceSelfTestRequested = (fun nEnv -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffEnv.v_Base_dEffEnv_denvGetEnv nEnv) "VUNA_IFACE_SELFTEST")) (fun v -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v = "1")))))

# 1930 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpayloadSelfOk = (fun nEnv m -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_difaceSelfTestRequested nEnv)) (fun self -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if self then ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dhashOfIface m) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf m)) else true)))))

# 1437 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dcleanSelfOk = (fun nFs nEnv mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__190, dtb__191) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dpayloadSelfOk nEnv) dtb__190)) (fun selfOk -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dsourceFresh nFs) mc0) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf dtb__190))) (fun fresh -> ((fun valid -> ((fun missingDep -> ((fun ok -> ((fun _u -> ((fun _u -> ((fun _u -> ((fun _u -> (((((v_Vuna_dCompiler_dDriver_dCompile_dcleanSelfOk nFs) nEnv) mc0) dtb__191) (if ok then (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__190, mc2)) else mc2))) (if missingDep then ((Base_dObs.v_Base_dObs_dobsCounter "vuna.tool.clean.reject.missingdep") 1) else 0))) (if valid then 0 else ((Base_dObs.v_Base_dObs_dobsCounter "vuna.tool.clean.reject.cached") 1)))) (if fresh then 0 else ((Base_dObs.v_Base_dObs_dobsCounter "vuna.tool.clean.reject.fresh") 1)))) (if selfOk then 0 else ((Base_dObs.v_Base_dObs_dobsCounter "vuna.tool.clean.reject.self") 1)))) (if (if (if fresh then valid else false) then selfOk else false) then (Base_dBool.v_Base_dBool_dnot missingDep) else false))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dhasMissingDep (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf dtb__190)))) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedProgramValid (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf dtb__190)))))) (if selfOk then 0 else (if (dtp_debug_on 0) then (dtp_debug_line ("iface-reject=self-hash " ^ (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__190))) else 0)))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dList.v_Base_dList_dreverse mc2))
  | _ -> failwith "DT: impossible branch"
))

# 1432 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolCleanGo = (fun nFs nEnv builtSec depTbl cands cleanRev -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dcleanSelfOk nFs) nEnv) builtSec) cands) Base_dList.C_Base_dList_dList_Nil)) (fun ok -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dcleanFixpoint ((Base_dList.v_Base_dList_dlength ok) + 1)) depTbl) ok) cleanRev)))))

# 1407 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolCleanOwnModules = (fun nFs nClock nEnv nProcess ctx tool builtSec exclude needed -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> ((fun cands -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListPartialEff nFs) nEnv) nProcess) cands)) (fun clean -> ((fun _u -> ((((((v_Vuna_dCompiler_dDriver_dCompile_dtoolCleanGo nFs) nEnv) builtSec) (tool).f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcDepHashes) clean) Base_dList.C_Base_dList_dList_Nil)) ((Base_dObs.v_Base_dObs_dobsCounter "vuna.tool.clean.read") (Base_dList.v_Base_dList_dlength clean)))))) ((Base_dObs.v_Base_dObs_dobsCounter "vuna.tool.clean.cands") (Base_dList.v_Base_dList_dlength cands)))) ((Base_dList.v_Base_dList_dfilter ((v_Vuna_dCompiler_dDriver_dCompile_downCleanWanted needed) exclude)) ((v_Vuna_dCompiler_dDriver_dCompile_dselfModsOf ctx) mods))))))

# 2111 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_difaceHashOfName = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__192, dtb__193) -> (if ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__192) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf dtb__192))) else ((v_Vuna_dCompiler_dDriver_dCompile_difaceHashOfName dtb__193) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2116 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dallSelfHashesOk = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__194, dtb__195) -> (if ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dhashOfIface dtb__194) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf dtb__194)) then (v_Vuna_dCompiler_dDriver_dCompile_dallSelfHashesOk dtb__195) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 2120 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dsameIfaceHashes = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__196, dtb__197) -> (match ((v_Vuna_dCompiler_dDriver_dCompile_difaceHashOfName mc1) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__196)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__198) -> (if (dtb__198 = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf dtb__196)) then ((v_Vuna_dCompiler_dDriver_dCompile_dsameIfaceHashes dtb__197) mc1) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 2127 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckAndShadow = (fun nFs nClock nEnv nProcess ctx checked -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) checked) (fun checkedR -> (match checkedR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__199) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__199)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__200) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceShadow nFs) nClock) nEnv) nProcess) ctx) (Base_dPair.v_Base_dPair_dsecondOf dtb__200))) (fun shadow -> (match shadow with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__201) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__201)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__202) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dPair.v_Base_dPair_dfirstOf dtb__200))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

# 1758 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dfullCheckExe = (fun nFs nClock nEnv nProcess ctx entry -> ((fun _u -> ((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndShadow nFs) nClock) nEnv) nProcess) ctx) (((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry))) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=full") else 0)))

# 1766 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dauditCheckExe = (fun nFs nClock nEnv nProcess nExit nArgs wantWarnings ctx entry -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dDriver_dCompile_dsummaryCheckExeParts nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) entry)) (fun summary -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry)) (fun full -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dauditCompare "check") entry) (v_Vuna_dCompiler_dDriver_dCompile_dcheckSignatureOf summary)) (v_Vuna_dCompiler_dDriver_dCompile_dcheckSignatureOf full)))) (fun compared -> (match compared with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__203) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__203)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__204) -> ((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndShadow nFs) nClock) nEnv) nProcess) ctx) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) summary))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line ("iface-audit subject=check entry=" ^ entry)) else 0)))))))

# 1717 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedExe = (fun nFs nClock nEnv nProcess nExit nArgs wantWarnings ctx entry -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_delabFullRequested nEnv)) (fun full -> (if full then ((((((v_Vuna_dCompiler_dDriver_dCompile_dfullCheckExe nFs) nClock) nEnv) nProcess) ctx) entry) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_difaceAuditRequested nEnv)) (fun audit -> (if audit then (((((((((v_Vuna_dCompiler_dDriver_dCompile_dauditCheckExe nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) entry) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dDriver_dCompile_dsummaryCheckExeParts nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) entry)) (fun summary -> ((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndShadow nFs) nClock) nEnv) nProcess) ctx) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) summary)))))))))))

# 2155 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsummaryCheckLibParts = (fun nFs nClock nEnv nProcess nExit nArgs wantWarnings ctx names -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf nFs) nClock) nEnv) nProcess) ctx)) (fun depIfaces -> (match depIfaces with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun _u -> (((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryWithProgramParts nFs) nEnv) nProcess) ctx) names)) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=full") else 0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__205) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_downCleanModules nFs) nClock) nEnv) nProcess) ctx)) (fun clean -> (match clean with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__206) -> ((fun cleanReal -> ((fun _u -> ((fun _u -> (((((((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryPackageIncrementalParts nFs) nEnv) nProcess) nExit) nArgs) ctx) names) dtb__205) cleanReal)) (if (dtp_debug_on 0) then (dtp_debug_line ("cache-own-clean=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength cleanReal)))) else 0))) (if (dtp_debug_on 0) then (dtp_debug_line ("cache-path=summary deps=" ^ (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount ctx)))) else 0))) (if wantWarnings then Base_dList.C_Base_dList_dList_Nil else dtb__206))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun _u -> ((((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryPackageWithIfacesParts nFs) nEnv) nProcess) ctx) names) dtb__205)) (if (dtp_debug_on 0) then (dtp_debug_line ("cache-path=summary deps=" ^ (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount ctx)))) else 0))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

# 2181 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dfullCheckLib = (fun nFs nClock nEnv nProcess ctx names -> ((fun _u -> ((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndShadow nFs) nClock) nEnv) nProcess) ctx) (((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryWithProgramParts nFs) nEnv) nProcess) ctx) names))) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=full") else 0)))

# 2187 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dauditCheckLib = (fun nFs nClock nEnv nProcess nExit nArgs wantWarnings ctx names -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dDriver_dCompile_dsummaryCheckLibParts nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) names)) (fun summary -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryWithProgramParts nFs) nEnv) nProcess) ctx) names)) (fun full -> ((fun subject -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dauditCompare "check-lib") subject) (v_Vuna_dCompiler_dDriver_dCompile_dcheckSignatureOf summary)) (v_Vuna_dCompiler_dDriver_dCompile_dcheckSignatureOf full)))) (fun compared -> (match compared with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__207) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__207)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__208) -> ((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndShadow nFs) nClock) nEnv) nProcess) ctx) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) summary))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line ("iface-audit subject=check-lib entry=" ^ subject)) else 0))) (v_Vuna_dCompiler_dDriver_dCompile_djoinLines names)))))))

# 2144 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedLib = (fun nFs nClock nEnv nProcess nExit nArgs wantWarnings ctx names -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_delabFullRequested nEnv)) (fun full -> (if full then ((((((v_Vuna_dCompiler_dDriver_dCompile_dfullCheckLib nFs) nClock) nEnv) nProcess) ctx) names) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_difaceAuditRequested nEnv)) (fun audit -> (if audit then (((((((((v_Vuna_dCompiler_dDriver_dCompile_dauditCheckLib nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) names) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dDriver_dCompile_dsummaryCheckLibParts nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) names)) (fun summary -> ((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndShadow nFs) nClock) nEnv) nProcess) ctx) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) summary)))))))))))

# 2208 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitNodeSchema = "vuna-split-node 2"

# 2214 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheCodec = "split-files 2"

# 2218 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobTag = (fun nFs nEnv -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dcompilerTagEff nFs) nEnv)) (fun tag -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" [v_Vuna_dCompiler_dDriver_dCompile_dsplitNodeSchema; "/"; tag])))))

# 2224 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitModsOf = (fun nFs nClock nEnv nProcess ctx entry printResult -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dcontextSources nFs) ctx) entry)) (fun sources -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesEff nFs) nEnv) nProcess) ctx)) (fun deps -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint nFs) nEnv)) (fun fp -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf nFs) nClock) nEnv) nProcess) ctx)) (fun ifaces -> ((fun srcHash -> ((fun verHash -> ((fun prHash -> ((fun mode -> ((fun kind -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckModsOf (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) kind) "") (v_Vuna_dCompiler_dDriver_dCompile_dhashText srcHash)) (v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesHash deps)) (v_Vuna_dCompiler_dDriver_dCompile_dhashText (verHash + prHash))) (v_Vuna_dCompiler_dDriver_dCompile_dreleaseFlagOf ctx)))) (String.concat "" [mode; ":"; (if printResult then "pr1" else "pr0")]))) (match ifaces with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__209) -> "s"
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "f"
  | _ -> failwith "DT: impossible branch"
))) (if printResult then 1 else 0))) ((v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dsplitNodeSchema ^ Vuna_dCompiler_dBase_dVersion.v_Vuna_dCompiler_dBase_dVersion_dvunaVersion)) + fp))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf sources) 0)))))))))))

# 2245 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobPath = (fun nFs nEnv nProcess digest -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dcacheBase nFs) nEnv) nProcess)) (fun base -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" [base; "/blobs/"; digest])))))

# 2252 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitBlobAt = (fun nFs nEnv nProcess digest files -> ((fun payload -> ((fun contentDigest -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobTag nFs) nEnv)) (fun tag -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobPath nFs) nEnv) nProcess) digest)) (fun path -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dcacheBase nFs) nEnv) nProcess)) (fun base -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirEff nFs) nProcess) (base ^ "/blobs"))) (fun _u -> ((((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreWriteIfChangedAsEff nFs) tag) v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheCodec) contentDigest) path) payload)))))))))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest payload))) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTop Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dencSplitFiles) files)))

# 2266 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitInOf = (fun m -> (Vuna_dCompiler_dLoader_dAddr.v_Vuna_dCompiler_dLoader_dAddr_daddrOf (Base_dList.C_Base_dList_dList__x58__x58_ ("split", (Base_dList.C_Base_dList_dList__x58__x58_ ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmPkg, (Base_dList.C_Base_dList_dList__x58__x58_ ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmKind, (Base_dList.C_Base_dList_dList__x58__x58_ ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmManifest, (Base_dList.C_Base_dList_dList__x58__x58_ ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmSources, (Base_dList.C_Base_dList_dList__x58__x58_ ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmDeps, (Base_dList.C_Base_dList_dList__x58__x58_ ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmVer, (Base_dList.C_Base_dList_dList__x58__x58_ ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmFlags, Base_dList.C_Base_dList_dList_Nil))))))))))))))))))

# 2277 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitPtrKind = "splitptr"

# 2280 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitPtrCodec = "split-pointer 1"

# 2283 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dreadSplitPointer = (fun nFs nEnv nProcess fast -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreObjectReadEff nFs) nEnv) nProcess) v_Vuna_dCompiler_dDriver_dCompile_dsplitPtrKind) v_Vuna_dCompiler_dDriver_dCompile_dsplitPtrCodec) fast)) (fun saved -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match saved with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__210) -> (if (dtb__210 = "") then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__210)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))

# 2291 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitPointer = (fun nFs nEnv nProcess fast sem -> (((((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreObjectWriteEff nFs) nEnv) nProcess) v_Vuna_dCompiler_dDriver_dCompile_dsplitPtrKind) v_Vuna_dCompiler_dDriver_dCompile_dsplitPtrCodec) fast) sem))

# 2294 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddefLocLine = (fun ctx p -> (String.concat "" [(Base_dPair.v_Base_dPair_dfirstOf p); "|"; ((v_Vuna_dCompiler_dDriver_dCompile_ddropPrefixMeta ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextDir ctx) ^ "/")) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf p))); "|"; (bi_strFromInt (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf p)))]))

# 2300 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dlayoutDigestOf = (fun ctx modules -> (Vuna_dCompiler_dLoader_dAddr.v_Vuna_dCompiler_dLoader_dAddr_daddrOf (Base_dList.C_Base_dList_dList__x58__x58_ ("split-layout", ((Base_dList.v_Base_dList_dconcatMap (fun m -> ((Base_dList.v_Base_dList_dmap (fun p -> (String.concat "" [(Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m); "|"; ((v_Vuna_dCompiler_dDriver_dCompile_ddefLocLine ctx) p)]))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDefLocsOf m)))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsortModuleIfaces modules))))))

# 2305 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitIdentityOf = (fun ctx printResult tag modules -> ((fun pkg -> ((fun pr -> (Vuna_dCompiler_dLoader_dAddr.v_Vuna_dCompiler_dLoader_dAddr_daddrOf (Base_dList.C_Base_dList_dList__x58__x58_ ("split-identity", (Base_dList.C_Base_dList_dList__x58__x58_ (v_Vuna_dCompiler_dDriver_dCompile_dsplitNodeSchema, (Base_dList.C_Base_dList_dList__x58__x58_ (pkg, (Base_dList.C_Base_dList_dList__x58__x58_ (pr, (Base_dList.C_Base_dList_dList__x58__x58_ (((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpkgIfaceHashOfModules pkg) modules), (Base_dList.C_Base_dList_dList__x58__x58_ (((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpkgImplHashOfModules pkg) modules), (Base_dList.C_Base_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dDriver_dCompile_dlayoutDigestOf ctx) modules), (Base_dList.C_Base_dList_dList__x58__x58_ (tag, Base_dList.C_Base_dList_dList_Nil)))))))))))))))))) (if printResult then "1" else "0"))) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)))

# 259 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dauditCompile = (fun nFs nConsole nClock nEnv nProcess ctx entry printResult outDir -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dDriver_dCompile_dsplitModsOf nFs) nClock) nEnv) nProcess) ctx) entry) printResult)) (fun mods -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((((v_Vuna_dCompiler_dDriver_dCompile_dsummarySplitParts nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) printResult)) (fun summary -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectParts nFs) nConsole) nEnv) nProcess) ctx) entry) printResult)) (fun full -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dauditCompare "compile") entry) (v_Vuna_dCompiler_dDriver_dCompile_dsplitSignatureOf summary)) (v_Vuna_dCompiler_dDriver_dCompile_dsplitSignatureOf full)))) (fun compared -> (match compared with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__211) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__211)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__212) -> (match summary with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__213) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__213)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__214) -> ((fun files -> ((fun checked -> ((fun canon -> ((fun fast -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceShadow nFs) nClock) nEnv) nProcess) ctx) checked)) (fun shadow -> (match shadow with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__215) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__215)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__216) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dcompilerTagEff nFs) nEnv)) (fun tag -> ((fun sem -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitBlobAt nFs) nEnv) nProcess) sem) canon)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitPointer nFs) nEnv) nProcess) fast) sem)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_drootKeepEff nFs) nEnv) nProcess) ctx) (Base_dList.C_Base_dList_dList__x58__x58_ (fast, (Base_dList.C_Base_dList_dList__x58__x58_ (sem, Base_dList.C_Base_dList_dList_Nil)))))) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiledNormalized nFs) nEnv) nProcess) ctx) outDir) canon)) (fun n -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match n with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__217) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__217))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__218) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__218; Base_dPair.f_Base_dPair_dPair_second = (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings }))
  | _ -> failwith "DT: impossible branch"
))))))))))) (match dtb__216 with
  | Base_dList.C_Base_dList_dList_Nil -> fast
  | _ -> ((((v_Vuna_dCompiler_dDriver_dCompile_dsplitIdentityOf ctx) printResult) tag) dtb__216)
))))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDriver_dCompile_dsplitInOf mods))) (Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dcanonicalTopo files))) (Base_dPair.v_Base_dPair_dsecondOf dtb__214))) (Base_dPair.v_Base_dPair_dfirstOf dtb__214))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line ("iface-audit subject=compile entry=" ^ entry)) else 0)))))))))

# 2318 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolchainIdEff = (fun nFs nEnv nProcess -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffEnv.v_Base_dEffEnv_denvGetEnv nEnv) "VUNA_OCAML_ID")) (fun override -> (if (override <> "") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) override) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dcacheBase nFs) nEnv) nProcess)) (fun base -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirEff nFs) nProcess) (base ^ "/.tmp"))) (fun _u -> ((fun path -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dEffProcess.v_Base_dEffProcess_dprocessRunIn nProcess) ".") (Base_dList.C_Base_dList_dList__x58__x58_ ("sh", (Base_dList.C_Base_dList_dList__x58__x58_ ("-c", (Base_dList.C_Base_dList_dList__x58__x58_ ((String.concat "" ["ocamlopt -version > \""; path; "\" 2>/dev/null || true"]), Base_dList.C_Base_dList_dList_Nil)))))))) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) path)) (fun text -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if ((Base_dString.v_Base_dString_dtrim text) = "") then "none" else (Base_dString.v_Base_dString_dtrim text))))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) "none"))))))) (base ^ "/.tmp/ocamlopt-version"))))))))))

# 2337 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dbuildViewAddrOf = (fun nFs nClock nEnv nProcess ctx entry printResult -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dDriver_dCompile_dsplitModsOf nFs) nClock) nEnv) nProcess) ctx) entry) printResult)) (fun mods -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dtoolchainIdEff nFs) nEnv) nProcess)) (fun tool -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dLoader_dAddr.v_Vuna_dCompiler_dLoader_dAddr_daddrOf (Base_dList.C_Base_dList_dList__x58__x58_ ("view-bin", (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dDriver_dCompile_dsplitInOf mods), (Base_dList.C_Base_dList_dList__x58__x58_ (tool, Base_dList.C_Base_dList_dList_Nil)))))))))))))

# 2344 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckInOf = (fun m -> (Vuna_dCompiler_dLoader_dAddr.v_Vuna_dCompiler_dLoader_dAddr_daddrOf (Base_dList.C_Base_dList_dList__x58__x58_ ("check-outcome", (Base_dList.C_Base_dList_dList__x58__x58_ ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmPkg, (Base_dList.C_Base_dList_dList__x58__x58_ ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmKind, (Base_dList.C_Base_dList_dList__x58__x58_ ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmManifest, (Base_dList.C_Base_dList_dList__x58__x58_ ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmSources, (Base_dList.C_Base_dList_dList__x58__x58_ ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmDeps, (Base_dList.C_Base_dList_dList__x58__x58_ ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmVer, (Base_dList.C_Base_dList_dList__x58__x58_ ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmFlags, Base_dList.C_Base_dList_dList_Nil))))))))))))))))))

# 1634 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckViaGraph = (fun nFs nEnv nProcess ctx mods run -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_delabFullRequested nEnv)) (fun full -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_difaceAuditRequested nEnv)) (fun audit -> (if (if full then true else audit) then run else ((fun dig -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreObjectReadEff nFs) nEnv) nProcess) "check-outcome") Vuna_dCompiler_dBase_dDiag_dCodec.v_Vuna_dCompiler_dBase_dDiag_dCodec_dcheckResultCodec) dig)) (fun payload -> (match payload with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__219) -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dDriver_dCompile_drunAndStore nFs) nEnv) nProcess) ctx) dig) run)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__220) -> (match dtb__220 with
  | Vuna_dCompiler_dBase_dDiag_dCodec.C_Vuna_dCompiler_dBase_dDiag_dCodec_dCheckOutcome_CheckFailed (dtb__221) -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCountEff "vuna.counter.cache.hit") 1)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dreplayFailure ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCompile_dresolveStoredDiag ctx)) dtb__221)))))) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=hit") else 0))
  | Vuna_dCompiler_dBase_dDiag_dCodec.C_Vuna_dCompiler_dBase_dDiag_dCodec_dCheckOutcome_CheckPassed (dtb__222) -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCountEff "vuna.counter.cache.hit") 1)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCompile_dresolveStoredDiag ctx)) dtb__222))))))) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=hit") else 0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dBase_dDiag_dCodec.v_Vuna_dCompiler_dBase_dDiag_dCodec_ddecCheckOutcome dtb__219))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dDriver_dCompile_drunAndStore nFs) nEnv) nProcess) ctx) dig) run)
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDriver_dCompile_dcheckInOf mods))))))))

# 1708 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedExe = (fun nFs nClock nEnv nProcess nExit nArgs wantWarnings ctx entry -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dcheckModsExe nFs) nEnv) nProcess) ctx) entry)) (fun mods -> (if wantWarnings then (((((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedExe nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) entry) else ((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckViaGraph nFs) nEnv) nProcess) ctx) mods) (((((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedExe nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) entry))))))

# 2138 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedLib = (fun nFs nClock nEnv nProcess nExit nArgs wantWarnings ctx names -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dcheckModsLib nFs) nEnv) nProcess) ctx) names)) (fun mods -> (if wantWarnings then (((((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedLib nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) names) else ((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckViaGraph nFs) nEnv) nProcess) ctx) mods) (((((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedLib nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) names))))))

# 87 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage = (fun nFs nClock nEnv nProcess nExit nArgs release wantWarnings pkg -> ((fun ctx -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageEntry pkg))) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedExe nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageEntry pkg))) (fun exeR -> (match exeR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__223) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__223)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__224) -> (match (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageExports pkg) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__224)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__225) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_delabFullRequested nEnv)) (fun full -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if full then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false) else (((((v_Vuna_dCompiler_dDriver_dCompile_dorderCoversEff nFs) nEnv) nProcess) ctx) dtb__225))) (fun covered -> (if covered then ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__224)))) (if (dtp_debug_on 0) then (dtp_debug_line ("check-lib-skip covered=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__225)))) else 0)) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedLib nFs) nClock) nEnv) nProcess) nExit) nArgs) false) ctx) dtb__225)) (fun libR -> (match libR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__226) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__226)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__227) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend dtb__224) dtb__227))))
  | _ -> failwith "DT: impossible branch"
))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) else (match (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageExports pkg) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDir pkg) ^ "/vuna.toml")) 1) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_LibraryWithoutEntry ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName pkg)))) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName pkg)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__228) -> (((((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedLib nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) dtb__228)
  | _ -> failwith "DT: impossible branch"
))))) ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextWithRelease release) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageContext pkg))))

# 2351 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitBlob = (fun nFs nEnv nProcess files -> ((fun payload -> ((fun digest -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobTag nFs) nEnv)) (fun tag -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobPath nFs) nEnv) nProcess) digest)) (fun path -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dcacheBase nFs) nEnv) nProcess)) (fun base -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirEff nFs) nProcess) (base ^ "/blobs"))) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreWriteIfChangedAsEff nFs) tag) v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheCodec) digest) path) payload)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) digest)))))))))))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest payload))) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTop Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dencSplitFiles) files)))

# 2371 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dreadSplitBlob = (fun nFs nEnv nProcess digest -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobTag nFs) nEnv)) (fun tag -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobPath nFs) nEnv) nProcess) digest)) (fun path -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreReadEff nFs) tag) v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheCodec) path)) (fun payload -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match payload with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__229) -> (Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_ddecSplitFilesComplete dtb__229)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))))))

# 212 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_drebuildSplit = (fun nFs nConsole nClock nEnv nProcess ctx entry printResult outDir fast -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((((v_Vuna_dCompiler_dDriver_dCompile_dsummarySplitParts nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) printResult)) (fun summary -> (match summary with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__230) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__230)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__231) -> ((fun canon -> ((fun checked -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceShadow nFs) nClock) nEnv) nProcess) ctx) checked)) (fun shadow -> (match shadow with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__232) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__232)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__233) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dcompilerTagEff nFs) nEnv)) (fun tag -> ((fun sem -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dreadSplitBlob nFs) nEnv) nProcess) sem)) (fun cached -> (match cached with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__234) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitPointer nFs) nEnv) nProcess) fast) sem)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_drootKeepEff nFs) nEnv) nProcess) ctx) (Base_dList.C_Base_dList_dList__x58__x58_ (fast, (Base_dList.C_Base_dList_dList__x58__x58_ (sem, Base_dList.C_Base_dList_dList_Nil)))))) (fun _u -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiledNormalized nFs) nEnv) nProcess) ctx) outDir) dtb__234)) (fun n -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match n with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__235) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__235))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__236) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__236; Base_dPair.f_Base_dPair_dPair_second = (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings }))
  | _ -> failwith "DT: impossible branch"
))))) (if (dtp_debug_on 0) then (dtp_debug_line "split-identity-hit cache-path=hit") else 0))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitBlobAt nFs) nEnv) nProcess) sem) canon)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitPointer nFs) nEnv) nProcess) fast) sem)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompile_drootKeepEff nFs) nEnv) nProcess) ctx) (Base_dList.C_Base_dList_dList__x58__x58_ (fast, (Base_dList.C_Base_dList_dList__x58__x58_ (sem, Base_dList.C_Base_dList_dList_Nil)))))) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiledNormalized nFs) nEnv) nProcess) ctx) outDir) canon)) (fun n -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match n with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__237) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__237))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__238) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__238; Base_dPair.f_Base_dPair_dPair_second = (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings }))
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> failwith "DT: impossible branch"
)))) (match dtb__233 with
  | Base_dList.C_Base_dList_dList_Nil -> fast
  | _ -> ((((v_Vuna_dCompiler_dDriver_dCompile_dsplitIdentityOf ctx) printResult) tag) dtb__233)
))))
  | _ -> failwith "DT: impossible branch"
)))) (Base_dPair.v_Base_dPair_dsecondOf dtb__231))) (Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dcanonicalTopo (Base_dPair.v_Base_dPair_dfirstOf dtb__231)))
  | _ -> failwith "DT: impossible branch"
))))

# 187 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcompileToDirNormal = (fun nFs nConsole nClock nEnv nProcess ctx entry printResult outDir -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dDriver_dCompile_dsplitModsOf nFs) nClock) nEnv) nProcess) ctx) entry) printResult)) (fun mods -> ((fun fast -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dreadSplitPointer nFs) nEnv) nProcess) fast)) (fun ptr -> (match ptr with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__239) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dreadSplitBlob nFs) nEnv) nProcess) dtb__239)) (fun cached -> (match cached with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__240) -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiledNormalized nFs) nEnv) nProcess) ctx) outDir) dtb__240)) (fun n -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match n with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__241) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__241))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__242) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__242; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | _ -> failwith "DT: impossible branch"
))))) (if (dtp_debug_on 0) then (dtp_debug_line "split-pointer-hit cache-path=hit") else 0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((((v_Vuna_dCompiler_dDriver_dCompile_drebuildSplit nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) printResult) outDir) fast)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((((v_Vuna_dCompiler_dDriver_dCompile_drebuildSplit nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) printResult) outDir) fast)
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDriver_dCompile_dsplitInOf mods)))))

# 149 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir = (fun nFs nConsole nClock nEnv nProcess ctx entry printResult outDir -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_difaceAuditRequested nEnv)) (fun audit -> (if audit then (((((((((v_Vuna_dCompiler_dDriver_dCompile_dauditCompile nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) printResult) outDir) else (((((((((v_Vuna_dCompiler_dDriver_dCompile_dcompileToDirNormal nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) printResult) outDir)))))

# 359 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dbuildSplit = (fun nFs nConsole nClock nEnv nProcess dir outDir -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadPackage nFs) nEnv) dir)) (fun pkgR -> (match pkgR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__243) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__243)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__244) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir nFs) nConsole) nClock) nEnv) nProcess) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageContext dtb__244)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageEntry dtb__244)) true) outDir)) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match r with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__245) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__245))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__246) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dPair.v_Base_dPair_dfirstOf dtb__246)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))

# 2387 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpmModulesOfIface = (fun p -> (p).Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piModules)

# 2390 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dfirstInvalidGo = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__247, dtb__248) -> (if (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedProgramValid (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf dtb__247)) then (v_Vuna_dCompiler_dDriver_dCompile_dfirstInvalidGo dtb__248) else (String.concat "" [(Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__247); ":"; (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedProgramIssue (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf dtb__247))]))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 2384 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dfirstInvalidModule = (fun p -> (v_Vuna_dCompiler_dDriver_dCompile_dfirstInvalidGo (v_Vuna_dCompiler_dDriver_dCompile_dpmModulesOfIface p)))
