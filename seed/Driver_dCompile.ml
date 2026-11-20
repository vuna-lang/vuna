open Vuna_runtime
type t_PkgEntry = { f_PkgEntry_peName : string; f_PkgEntry_peDir : string; f_PkgEntry_peKey : string; f_PkgEntry_peEnv : string }
and t_ClosureMod = { f_ClosureMod_cmPkg : string; f_ClosureMod_cmPkgKey : string; f_ClosureMod_cmPkgEnv : string; f_ClosureMod_cmName : string; f_ClosureMod_cmPath : string; f_ClosureMod_cmSrc : string; f_ClosureMod_cmImports : string B_dData_dList.t_List; f_ClosureMod_cmAddr : string }
and t_ToolContext = { f_ToolContext_tcDepIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List; f_ToolContext_tcDepHashes : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_ToolContext_tcNeeded : string B_dData_dList.t_List; f_ToolContext_tcOwnNames : string B_dData_dList.t_List; f_ToolContext_tcStats : Driver_dIface.t_SourceInfo B_dData_dList.t_List }
and t_CheckMods = { f_CheckMods_cmPkg : string; f_CheckMods_cmKind : string; f_CheckMods_cmManifest : string; f_CheckMods_cmSources : string; f_CheckMods_cmDeps : string; f_CheckMods_cmVer : string; f_CheckMods_cmFlags : string }

# 59 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_mapEff = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (mc0 dtb__0)) (fun y -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_mapEff mc0) dtb__1)) (fun ys -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (B_dData_dList.C_List__x58__x58_ (y, ys)))))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_concatMapEff = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (mc0 dtb__2)) (fun xs -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_concatMapEff mc0) dtb__3)) (fun ys -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((B_dData_dList.v_append xs) ys))))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_mapMaybeEff = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (mc0 dtb__4)) (fun y -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_mapMaybeEff mc0) dtb__5)) (fun ys -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match y with
  | B_dData_dMaybe.C_Maybe_Just (dtb__6) -> (B_dData_dList.C_List__x58__x58_ (dtb__6, ys))
  | B_dData_dMaybe.C_Maybe_Nothing -> ys
  | _ -> failwith "DT: impossible branch"
))))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 143 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_ensureDirPathFuel = (fun (nFs : string) (nProcess : string) (fuel : int) (path : string) -> (if (fuel <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0) else (if (if (if (path = "") then true else (path = ".")) then true else (path = "/")) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_ensureDirPathFuel nFs) nProcess) (fuel - 1)) (Base_dSource.v_parentOfPath path))) (fun _u -> ((B_dEffect_dFs.v_fsMakeDir nFs) path)))))))))

# 140 "Vuna/Compiler/Driver/Compile.vuna"
let v_ensureDirPath = (fun (nFs : string) (nProcess : string) (path : string) -> ((((v_ensureDirPathFuel nFs) nProcess) 256) path))

# 340 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeFileIfChanged = (fun (nFs : string) (path : string) (content : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun old -> (if (old = content) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0) else (((B_dEffect_dFs.v_fsWriteFile nFs) path) content)))) else (((B_dEffect_dFs.v_fsWriteFile nFs) path) content)))))

# 383 "Vuna/Compiler/Driver/Compile.vuna"
let v_copyFfiFiles = (fun (nFs : string) (nProcess : string) (ctxDir : string) (outDir : string) -> ((fun ffiDir -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) ffiDir)) (fun exists -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (if exists then ((B_dEffect_dFs.v_fsIsDirectory nFs) ffiDir) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) false))) (fun isDir -> (if (if exists then isDir else false) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadDir nFs) ffiDir)) (fun names -> ((fun cs -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_ensureDirPath nFs) nProcess) (outDir ^ "/ffi"))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_mapEff (fun (n : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) (String.concat "" [ffiDir; "/"; ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uString) n)]))) (fun content -> (((B_dEffect_dFs.v_fsWriteFile nFs) (String.concat "" [outDir; "/ffi/"; ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uString) n)])) content))))) cs)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((B_dData_dList.v_map (fun (n : string) -> ("ffi/" ^ ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uString) n)))) cs))))))) ((B_dData_dList.v_filter (fun (n : string) -> ((B_dData_dString.v_endsWith ".c") n))) names)))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dList.C_List_Nil))))))) (ctxDir ^ "/ffi")))

# 433 "Vuna/Compiler/Driver/Compile.vuna"
let v_metaSchema = 1

# 436 "Vuna/Compiler/Driver/Compile.vuna"
let v_metaFileName = "build-meta.json"

# 440 "Vuna/Compiler/Driver/Compile.vuna"
let v_textHash = (fun (s : string) -> (Base_dHash.v_contentKey s))

# 446 "Vuna/Compiler/Driver/Compile.vuna"
let v_compilerFingerprint = (fun (nFs : string) (nEnv : string) -> ((Loader_dFingerprint.v_compilerFingerprintEff nFs) nEnv))

# 451 "Vuna/Compiler/Driver/Compile.vuna"
let v_cacheBase = (fun (nFs : string) (nEnv : string) (nProcess : string) -> (((Base_dStore.v_storeRootReadyEff nFs) nEnv) nProcess))

# 456 "Vuna/Compiler/Driver/Compile.vuna"
let v_collectVunaMeta = (fun (nFs : string) (dir : string) -> ((((Base_dWalk.v_collectFilesEff nFs) Frontend_dPackages_dSource.v_skipSourceDir) (fun (name : string) -> ((B_dData_dString.v_endsWith ".vuna") name))) dir))

# 459 "Vuna/Compiler/Driver/Compile.vuna"
let v_dropPrefixMeta = (fun (prefix : string) (s : string) -> (if ((B_dData_dString.v_startsWith prefix) s) then (((B_dData_dString.v_substring (B_dData_dString.v_byteLength prefix)) (bi_natSub (B_dData_dString.v_byteLength s) (B_dData_dString.v_byteLength prefix))) s) else s))

# 469 "Vuna/Compiler/Driver/Compile.vuna"
let v_slashToDot = (fun (c : int) -> (if (c = 47) then 46 else c))

# 466 "Vuna/Compiler/Driver/Compile.vuna"
let v_slashesToDots = (fun (s : string) -> (B_dData_dList.dtp_pack ((B_dData_dList.v_map v_slashToDot) (B_dData_dList.dtp_unpack s))))

# 472 "Vuna/Compiler/Driver/Compile.vuna"
let v_moduleNameOfPath = (fun (rootPath : string) (path : string) -> ((fun rel0 -> ((fun rel -> (v_slashesToDots rel)) (if ((B_dData_dString.v_endsWith ".vuna") rel0) then (((B_dData_dString.v_substring 0) (bi_natSub (B_dData_dString.v_byteLength rel0) 5)) rel0) else rel0))) ((v_dropPrefixMeta (rootPath ^ "/")) path)))

# 479 "Vuna/Compiler/Driver/Compile.vuna"
let v_rootSources = (fun (nFs : string) (root : Frontend_dPackages_dPkg.t_Root) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_collectVunaMeta nFs) (Frontend_dPackages_dPkg.v_rootDir root))) (fun paths -> ((v_mapEff (fun (p : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) p)) (fun content -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) { B_dData_dPair.f_Pair_first = ((v_moduleNameOfPath (Frontend_dPackages_dPkg.v_rootDir root)) p); B_dData_dPair.f_Pair_second = (v_textHash content) }))))) paths))))

# 496 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_closureHashOf = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__7, dtb__8) -> (match dtb__7 with
  | { B_dData_dPair.f_Pair_first = dtb__9; B_dData_dPair.f_Pair_second = dtb__10 } -> ((v_closureHashOf dtb__8) ((mc1 * 1000003) + dtb__10))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 490 "Vuna/Compiler/Driver/Compile.vuna"
let v_rootHash = (fun (nFs : string) (root : Frontend_dPackages_dPkg.t_Root) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_rootSources nFs) root)) (fun sources -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((v_closureHashOf sources) 0)))))

# 501 "Vuna/Compiler/Driver/Compile.vuna"
let v_entrySource = (fun (nFs : string) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) entry)) (fun content -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) { B_dData_dPair.f_Pair_first = "<entry>"; B_dData_dPair.f_Pair_second = (v_textHash content) }))))

# 508 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownRootsOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> ((B_dData_dList.v_filter (fun (r : Frontend_dPackages_dPkg.t_Root) -> ((Frontend_dPackages_dPkg.v_rootName r) = (Frontend_dPackages_dPkg.v_contextPackageName ctx)))) (Frontend_dPackages_dPkg.v_contextRoots ctx)))

# 511 "Vuna/Compiler/Driver/Compile.vuna"
let v_contextSources = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_concatMapEff (v_rootSources nFs)) (v_ownRootsOf ctx))) (fun own -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_entrySource nFs) entry)) (fun es -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((B_dData_dList.v_append own) (B_dData_dList.C_List__x58__x58_ (es, B_dData_dList.C_List_Nil)))))))))

# 519 "Vuna/Compiler/Driver/Compile.vuna"
let v_dependencyHashes = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match (Frontend_dPackages_dPkg.v_contextRoots ctx) with
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dList.C_List_Nil)
  | B_dData_dList.C_List__x58__x58_ (dtb__11, dtb__12) -> ((v_mapEff (fun (r : Frontend_dPackages_dPkg.t_Root) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_rootHash nFs) r)) (fun h -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) { B_dData_dPair.f_Pair_first = (Frontend_dPackages_dPkg.v_rootName r); B_dData_dPair.f_Pair_second = h }))))) dtb__12)
  | _ -> failwith "DT: impossible branch"
))

# 538 "Vuna/Compiler/Driver/Compile.vuna"
let v_compilerClosureModule = "Vuna.Compiler.Loader.Fingerprint"

# 565 "Vuna/Compiler/Driver/Compile.vuna"
let v_pkgIfaceSummaryKind = "pkg-iface"

# 568 "Vuna/Compiler/Driver/Compile.vuna"
let v_pkgIfaceSummaryCodec = "pkg-iface-summary 1"

# 571 "Vuna/Compiler/Driver/Compile.vuna"
let v_pkgIfaceSummaryKeyOf = (fun (pkg : string) (srcClosure : string) (tag : string) -> (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ ("pkg-iface", (B_dData_dList.C_List__x58__x58_ (pkg, (B_dData_dList.C_List__x58__x58_ (srcClosure, (B_dData_dList.C_List__x58__x58_ (tag, B_dData_dList.C_List_Nil))))))))))

# 575 "Vuna/Compiler/Driver/Compile.vuna"
let v_depRootIdentityEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (root : Frontend_dPackages_dPkg.t_Root) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_rootHash nFs) root)) (fun h -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Loader_dFingerprint.v_cacheTagEff nFs) nEnv)) (fun tag -> ((fun key -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((Base_dStore.v_storeObjectReadEff nFs) nEnv) nProcess) v_pkgIfaceSummaryKind) v_pkgIfaceSummaryCodec) key)) (fun saved -> ((fun verdict -> ((fun _u -> (match saved with
  | B_dData_dMaybe.C_Maybe_Just (dtb__13) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) { B_dData_dPair.f_Pair_first = (Frontend_dPackages_dPkg.v_rootName root); B_dData_dPair.f_Pair_second = ("iface:" ^ dtb__13) })
  | B_dData_dMaybe.C_Maybe_Nothing -> ((fun tomlPath -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) tomlPath)) (fun exists -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (if exists then ((B_dEffect_dFs.v_fsReadFile nFs) tomlPath) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ""))) (fun toml -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) { B_dData_dPair.f_Pair_first = (Frontend_dPackages_dPkg.v_rootName root); B_dData_dPair.f_Pair_second = (String.concat "" ["manifest:"; (bi_strFromInt (v_textHash toml)); ":"; (bi_strFromInt h)]) })))))) ((Frontend_dPackages_dPkg.v_rootDir root) ^ "/vuna.toml"))
  | _ -> failwith "DT: impossible branch"
)) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["dep-identity="; (Frontend_dPackages_dPkg.v_rootName root); " verdict="; verdict; " src="; (bi_strFromInt h)])) else 0))) (match saved with
  | B_dData_dMaybe.C_Maybe_Just (dtb__14) -> "iface"
  | B_dData_dMaybe.C_Maybe_Nothing -> "manifest"
  | _ -> failwith "DT: impossible branch"
))))) (((v_pkgIfaceSummaryKeyOf (Frontend_dPackages_dPkg.v_rootName root)) (bi_strFromInt h)) tag)))))))

# 601 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIdentitiesEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match (Frontend_dPackages_dPkg.v_contextRoots ctx) with
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dList.C_List_Nil)
  | B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16) -> ((v_mapEff (((v_depRootIdentityEff nFs) nEnv) nProcess)) dtb__16)
  | _ -> failwith "DT: impossible branch"
))

# 610 "Vuna/Compiler/Driver/Compile.vuna"
let v_pairText = (fun (p : (string, string) B_dData_dPair.t_Pair) -> (String.concat "" [(B_dData_dPair.v_firstOf p); "="; (B_dData_dPair.v_secondOf p)]))

# 607 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIdentitiesHash = (fun (pairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ ("dep-identities", ((B_dData_dList.v_map v_pairText) pairs)))))

# 542 "Vuna/Compiler/Driver/Compile.vuna"
let v_buildIdForEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_concatMapEff (v_rootSources nFs)) (v_ownRootsOf ctx))) (fun own -> (if ((B_dData_dList.v_memName v_compilerClosureModule) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) own)) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_depIdentitiesEff nFs) nEnv) nProcess) ctx)) (fun deps -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Loader_dFingerprint.v_compilerIdOf own) (v_depIdentitiesHash deps))))) else ((Loader_dFingerprint.v_compilerTagEff nFs) nEnv)))))

# 355 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeCompiledNormalized = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (outDir : string) (files : Driver_dSplit.t_SplitFile B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_ensureDirPath nFs) nProcess) outDir)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_buildIdForEff nFs) nEnv) nProcess) ctx)) (fun id -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_writeFileIfChanged nFs) (String.concat "" [outDir; "/"; Loader_dFingerprint.v_buildIdFileName])) (id ^ "\n"))) (fun _u -> ((fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Driver_dSplit.v_writeSplitFilesIfChanged nFs) outDir) files)) (fun written -> (match written with
  | Base_dDiag.C_Check_ErrC (dtb__17) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__17)))
  | Base_dDiag.C_Check_OkC (dtb__18) -> ((fun _u -> ((fun graph -> ((fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_copyFfiFiles nFs) nProcess) (Frontend_dPackages_dPkg.v_contextDir ctx)) outDir)) (fun cFiles -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((B_dEffect_dFs.v_fsWriteFile nFs) (outDir ^ "/build.sh")) ((Driver_dSplit.v_buildScript graph) cFiles))) (fun _u -> ((fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC (dtb__18)))) (if (dtp_debug_on 0) then (dtp_debug_line "build-script-done") else 0))))))) (if (dtp_debug_on 0) then (dtp_debug_line "split-graph-done") else 0))) (Driver_dSplit.v_splitGraph files))) (if (dtp_debug_on 0) then (dtp_debug_line "write-split-files-done") else 0))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line "write-compiled-start") else 0)))))))))

# 614 "Vuna/Compiler/Driver/Compile.vuna"
let v_writePkgIfaceSummaryEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (modules : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match ((B_dData_dList.v_filter (fun (r : Frontend_dPackages_dPkg.t_Root) -> ((Frontend_dPackages_dPkg.v_rootName r) = (Frontend_dPackages_dPkg.v_contextPackageName ctx)))) (Frontend_dPackages_dPkg.v_contextRoots ctx)) with
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0)
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_rootHash nFs) dtb__19)) (fun h -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Loader_dFingerprint.v_cacheTagEff nFs) nEnv)) (fun tag -> ((fun key -> ((fun payload -> (((((((Base_dStore.v_storeObjectWriteEff nFs) nEnv) nProcess) v_pkgIfaceSummaryKind) v_pkgIfaceSummaryCodec) key) payload)) ((Driver_dIface.v_pkgIfaceHashOfModules (Frontend_dPackages_dPkg.v_contextPackageName ctx)) modules))) (((v_pkgIfaceSummaryKeyOf (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (bi_strFromInt h)) tag))))))
  | _ -> failwith "DT: impossible branch"
))

# 627 "Vuna/Compiler/Driver/Compile.vuna"
let v_metaPairText = (fun (mc0 : (string, int) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__21; B_dData_dPair.f_Pair_second = dtb__22 } -> (String.concat "" ["{\"name\":\""; dtb__21; "\",\"hash\":"; (bi_strFromInt dtb__22); "}"])
  | _ -> failwith "DT: impossible branch"
))

# 630 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_joinJsonList = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> (match dtb__24 with
  | B_dData_dList.C_List_Nil -> dtb__23
  | _ -> (String.concat "" [dtb__23; ","; (v_joinJsonList dtb__24)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 637 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_lastSegmentRev = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26) -> (if (dtb__25 = 47) then (B_dData_dList.dtp_pack mc1) else ((v_lastSegmentRev dtb__26) (B_dData_dList.C_List__x58__x58_ (dtb__25, mc1))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.dtp_pack mc1)
  | _ -> failwith "DT: impossible branch"
))

# 641 "Vuna/Compiler/Driver/Compile.vuna"
let v_lastSegment = (fun (path : string) -> ((v_lastSegmentRev (B_dData_dList.v_reverse (B_dData_dList.dtp_unpack path))) B_dData_dList.C_List_Nil))

# 656 "Vuna/Compiler/Driver/Compile.vuna"
let v_metaPathOf = (fun (outDir : string) -> (String.concat "" [outDir; "/"; v_metaFileName]))

# 685 "Vuna/Compiler/Driver/Compile.vuna"
let v_runBuildScript = (fun (nProcess : string) (dir : string) (out : string) (name : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((B_dEffect_dProcess.v_processRunIn nProcess) dir) (B_dData_dList.C_List__x58__x58_ ("sh", (B_dData_dList.C_List__x58__x58_ ("build.sh", (B_dData_dList.C_List__x58__x58_ (out, B_dData_dList.C_List_Nil)))))))) (fun code -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (if (code = 0) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_err (String.concat "" ["build: "; name; ": sh build.sh "; out; " failed in "; dir; " (exit "; (bi_strFromInt code); ")"])))))))

# 695 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkNodeSchema = "vuna-check-node 3"

# 698 "Vuna/Compiler/Driver/Compile.vuna"
let v_hashText = (fun (n : int) -> (bi_strFromInt n))

# 709 "Vuna/Compiler/Driver/Compile.vuna"
let v_maybeSemanticText = (fun (mc0 : string B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__27) -> dtb__27
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 713 "Vuna/Compiler/Driver/Compile.vuna"
let v_depSourceText = (fun (mc0 : Frontend_dManifest.t_DependencySource) -> (match mc0 with
  | Frontend_dManifest.C_DependencySource_DepUrl (dtb__28) -> ("url:" ^ dtb__28)
  | Frontend_dManifest.C_DependencySource_DepGit (dtb__29, dtb__30) -> (String.concat "" ["git:"; dtb__29; "@"; dtb__30])
  | Frontend_dManifest.C_DependencySource_DepPath (dtb__31) -> ("path:" ^ dtb__31)
  | _ -> failwith "DT: impossible branch"
))

# 718 "Vuna/Compiler/Driver/Compile.vuna"
let v_depSemanticText = (fun (d : Frontend_dManifest.t_Dependency) -> (String.concat "" [(d).Frontend_dManifest.f_Dependency_depAlias; "|"; (v_depSourceText (d).Frontend_dManifest.f_Dependency_depSource); "|"; (v_maybeSemanticText (d).Frontend_dManifest.f_Dependency_depHash); "|"; (v_maybeSemanticText (d).Frontend_dManifest.f_Dependency_depIdentity)]))

# 722 "Vuna/Compiler/Driver/Compile.vuna"
let v_manifestSemanticText = (fun (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__32) -> ((fun man -> ((fun exportsText -> ((B_dData_dString.v_join "\n") (B_dData_dList.C_List__x58__x58_ (("name:" ^ (v_maybeSemanticText (man).Frontend_dManifest.f_Manifest_manifestName)), (B_dData_dList.C_List__x58__x58_ (("exports:" ^ exportsText), ((B_dData_dList.v_map v_depSemanticText) (man).Frontend_dManifest.f_Manifest_manifestDependencies))))))) (match (man).Frontend_dManifest.f_Manifest_manifestExports with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb__33) -> ((B_dData_dString.v_join ",") dtb__33)
  | _ -> failwith "DT: impossible branch"
))) (dtb__32).Frontend_dPackages_dPkg.f_Package_packageManifest)
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 644 "Vuna/Compiler/Driver/Compile.vuna"
let v_buildMetaText = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (linked : bool) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_contextSources nFs) ctx) entry)) (fun sources -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_dependencyHashes nFs) ctx)) (fun deps -> ((fun manifestHash -> ((fun entryName -> ((fun linkedText -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (String.concat "" ["{\"schema\":"; (bi_strFromInt v_metaSchema); ",\"compiler\":\""; Base_dVersion.v_vunaVersion; "\",\"package\":\""; (Frontend_dPackages_dPkg.v_contextPackageName ctx); "\",\"entry\":\""; entryName; "\",\"linked\":"; linkedText; ",\"closure\":"; (bi_strFromInt ((v_closureHashOf sources) 0)); ",\"manifest\":"; (bi_strFromInt manifestHash); ",\"sources\":["; (v_joinJsonList ((B_dData_dList.v_map v_metaPairText) sources)); "],\"dependencies\":["; (v_joinJsonList ((B_dData_dList.v_map v_metaPairText) deps)); "]}\n"]))) (if linked then "true" else "false"))) (v_lastSegment entry))) (v_textHash (v_manifestSemanticText (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage))))))))

# 659 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeBuildMeta = (fun (nFs : string) (outDir : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (linked : bool) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_buildMetaText nFs) ctx) entry) linked)) (fun text -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((B_dEffect_dFs.v_fsWriteFile nFs) (v_metaPathOf outDir)) text)) (fun n -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) n))))))

# 667 "Vuna/Compiler/Driver/Compile.vuna"
let v_metaUpToDate = (fun (nFs : string) (outDir : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (binPath : string) -> ((fun path -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (if exists then ((B_dEffect_dFs.v_fsFileExists nFs) binPath) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) false))) (fun binExists -> (if (if exists then binExists else false) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun raw -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_buildMetaText nFs) ctx) entry) true)) (fun expected -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (raw = expected)))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) false))))))) (v_metaPathOf outDir)))

# 736 "Vuna/Compiler/Driver/Compile.vuna"
let v_releaseFlagOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (if (Frontend_dPackages_dPkg.v_contextRelease ctx) then "release" else "debug"))

# 781 "Vuna/Compiler/Driver/Compile.vuna"
let v_depPackagesOf = (fun (mc0 : Frontend_dPackages_dPkg.t_Package) -> (match mc0 with
  | { Frontend_dPackages_dPkg.f_Package_packageManifest = dtb__34; Frontend_dPackages_dPkg.f_Package_packageDependencies = dtb__35; Frontend_dPackages_dPkg.f_Package_packageDir = dtb__36 } -> dtb__35
  | _ -> failwith "DT: impossible branch"
))

# 769 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_collectDepPackages = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__37, dtb__38) -> (if ((B_dData_dList.v_memName (Frontend_dPackages_dPkg.v_packageName dtb__37)) mc0) then ((v_collectDepPackages mc0) dtb__38) else (match ((v_collectDepPackages (B_dData_dList.C_List__x58__x58_ ((Frontend_dPackages_dPkg.v_packageName dtb__37), mc0))) (v_depPackagesOf dtb__37)) with
  | { B_dData_dPair.f_Pair_first = dtb__39; B_dData_dPair.f_Pair_second = dtb__40 } -> (match ((v_collectDepPackages dtb__39) dtb__38) with
  | { B_dData_dPair.f_Pair_first = dtb__41; B_dData_dPair.f_Pair_second = dtb__42 } -> { B_dData_dPair.f_Pair_first = dtb__41; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__40) (B_dData_dList.C_List__x58__x58_ (dtb__37, dtb__42))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 787 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_allNamesIn = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__43, dtb__44) -> (if ((B_dData_dList.v_memName dtb__43) mc1) then ((v_allNamesIn dtb__44) mc1) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 784 "Vuna/Compiler/Driver/Compile.vuna"
let v_sameNameSet = (fun (a : string B_dData_dList.t_List) (b : string B_dData_dList.t_List) -> (if (if ((B_dData_dList.v_length a) = (B_dData_dList.v_length b)) then ((v_allNamesIn a) b) else false) then ((v_allNamesIn b) a) else false))

# 798 "Vuna/Compiler/Driver/Compile.vuna"
let v_depPackageList = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__45) -> (B_dData_dPair.v_secondOf ((v_collectDepPackages B_dData_dList.C_List_Nil) (dtb__45).Frontend_dPackages_dPkg.f_Package_packageDependencies))
  | _ -> failwith "DT: impossible branch"
))

# 804 "Vuna/Compiler/Driver/Compile.vuna"
let v_depPackageCount = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (B_dData_dList.v_length (v_depPackageList ctx)))

# 816 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceObjectCodec = "module-iface 3"

# 840 "Vuna/Compiler/Driver/Compile.vuna"
let v_pkgKeyOf = (fun (name : string) -> (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ ("pkg", (B_dData_dList.C_List__x58__x58_ (name, B_dData_dList.C_List_Nil))))))

# 859 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_findPkgEntry = (fun (mc0 : string) (mc1 : t_PkgEntry B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__46, dtb__47) -> (if ((dtb__46).f_PkgEntry_peName = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__46)) else ((v_findPkgEntry mc0) dtb__47))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 863 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_findClosureMod = (fun (mc0 : string) (mc1 : t_ClosureMod B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__48, dtb__49) -> (if ((dtb__48).f_ClosureMod_cmName = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__48)) else ((v_findClosureMod mc0) dtb__49))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 867 "Vuna/Compiler/Driver/Compile.vuna"
let v_closureModsEff = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (pkgs : t_PkgEntry B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_mapEff (fun (r : Frontend_dPackages_dPkg.t_Root) -> (match ((v_findPkgEntry (Frontend_dPackages_dPkg.v_rootName r)) pkgs) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dList.C_List_Nil)
  | B_dData_dMaybe.C_Maybe_Just (dtb__50) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_collectVunaMeta nFs) (Frontend_dPackages_dPkg.v_rootDir r))) (fun paths -> ((v_mapEff (fun (p : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) p)) (fun raw -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) { f_ClosureMod_cmPkg = (dtb__50).f_PkgEntry_peName; f_ClosureMod_cmPkgKey = (dtb__50).f_PkgEntry_peKey; f_ClosureMod_cmPkgEnv = (dtb__50).f_PkgEntry_peEnv; f_ClosureMod_cmName = ((v_moduleNameOfPath (Frontend_dPackages_dPkg.v_rootDir r)) p); f_ClosureMod_cmPath = p; f_ClosureMod_cmSrc = (Base_dHash.v_contentAddress raw); f_ClosureMod_cmImports = B_dData_dList.C_List_Nil; f_ClosureMod_cmAddr = "" }))))) paths)))
  | _ -> failwith "DT: impossible branch"
))) (Frontend_dPackages_dPkg.v_contextRoots ctx))) (fun per -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((B_dData_dList.v_concatMap (fun (xs : t_ClosureMod B_dData_dList.t_List) -> xs)) per)))))

# 905 "Vuna/Compiler/Driver/Compile.vuna"
let v_withPrelude = (fun (hasPrelude : bool) (m : t_ClosureMod) (h : Loader_dAddr.t_ModHeader) -> (if (if (if hasPrelude then ((m).f_ClosureMod_cmName <> "Prelude") else false) then (B_dData_dBool.v_not ((B_dData_dList.v_memName "Prelude") (h).Loader_dAddr.f_ModHeader_mhImports)) else false) then ((B_dData_dList.v_append (h).Loader_dAddr.f_ModHeader_mhImports) (B_dData_dList.C_List__x58__x58_ ("Prelude", B_dData_dList.C_List_Nil))) else (h).Loader_dAddr.f_ModHeader_mhImports))

# 891 "Vuna/Compiler/Driver/Compile.vuna"
let v_loadHeaderEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (hasPrelude : bool) (m : t_ClosureMod) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) (m).f_ClosureMod_cmPath)) (fun raw -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((Loader_dFlatten.v_parseFileWithPath nFs) nEnv) nProcess) (m).f_ClosureMod_cmPath) raw)) (fun parsed -> (match parsed with
  | Base_dDiag.C_Check_ErrC (dtb__51) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) m)
  | Base_dDiag.C_Check_OkC (dtb__52) -> ((fun h -> ((fun imports -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) { f_ClosureMod_cmPkg = (m).f_ClosureMod_cmPkg; f_ClosureMod_cmPkgKey = (m).f_ClosureMod_cmPkgKey; f_ClosureMod_cmPkgEnv = (m).f_ClosureMod_cmPkgEnv; f_ClosureMod_cmName = (m).f_ClosureMod_cmName; f_ClosureMod_cmPath = (m).f_ClosureMod_cmPath; f_ClosureMod_cmSrc = (m).f_ClosureMod_cmSrc; f_ClosureMod_cmImports = imports; f_ClosureMod_cmAddr = "" })) (((v_withPrelude hasPrelude) m) h))) ((Loader_dAddr.v_headerOfSource (m).f_ClosureMod_cmName) dtb__52))
  | _ -> failwith "DT: impossible branch"
))))))

# 912 "Vuna/Compiler/Driver/Compile.vuna"
let v_modGraphEntry = (fun (m : t_ClosureMod) -> { B_dData_dPair.f_Pair_first = (m).f_ClosureMod_cmName; B_dData_dPair.f_Pair_second = (m).f_ClosureMod_cmImports })

# 915 "Vuna/Compiler/Driver/Compile.vuna"
let v_modNameOf = (fun (m : t_ClosureMod) -> (m).f_ClosureMod_cmName)

# 918 "Vuna/Compiler/Driver/Compile.vuna"
let v_isDepModOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (m : t_ClosureMod) -> ((m).f_ClosureMod_cmPkg <> (Frontend_dPackages_dPkg.v_contextPackageName ctx)))

# 921 "Vuna/Compiler/Driver/Compile.vuna"
let v_isSelfModOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (m : t_ClosureMod) -> ((m).f_ClosureMod_cmPkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx)))

# 924 "Vuna/Compiler/Driver/Compile.vuna"
let v_moduleGraphOf = (fun (mods : t_ClosureMod B_dData_dList.t_List) -> ((B_dData_dList.v_map v_modGraphEntry) mods))

# 936 "Vuna/Compiler/Driver/Compile.vuna"
let v_depSrcOf = (fun (tbl : (string, string) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__53) -> dtb__53
  | B_dData_dMaybe.C_Maybe_Nothing -> ("ext:" ^ name)
  | _ -> failwith "DT: impossible branch"
))

# 946 "Vuna/Compiler/Driver/Compile.vuna"
let v_srcPairOf = (fun (m : t_ClosureMod) -> { B_dData_dPair.f_Pair_first = (v_modNameOf m); B_dData_dPair.f_Pair_second = (String.concat "" [(m).f_ClosureMod_cmPkgKey; "|"; (m).f_ClosureMod_cmSrc]) })

# 943 "Vuna/Compiler/Driver/Compile.vuna"
let v_srcTblOf = (fun (mods : t_ClosureMod B_dData_dList.t_List) -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) ((B_dData_dList.v_map v_srcPairOf) mods)))

# 950 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceAddrOf = (fun (srcTbl : (string, string) B_dContainer_dHashMap.t_HashMap) (m : t_ClosureMod) -> (Loader_dAddr.v_addrOf ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ("module-iface", (B_dData_dList.C_List__x58__x58_ (v_ifaceObjectCodec, (B_dData_dList.C_List__x58__x58_ ((m).f_ClosureMod_cmPkgKey, (B_dData_dList.C_List__x58__x58_ ((m).f_ClosureMod_cmName, (B_dData_dList.C_List__x58__x58_ ((m).f_ClosureMod_cmSrc, (B_dData_dList.C_List__x58__x58_ ((m).f_ClosureMod_cmPkgEnv, B_dData_dList.C_List_Nil))))))))))))) ((B_dData_dList.v_map (v_depSrcOf srcTbl)) (m).f_ClosureMod_cmImports))))

# 955 "Vuna/Compiler/Driver/Compile.vuna"
let v_withAddr = (fun (srcTbl : (string, string) B_dContainer_dHashMap.t_HashMap) (m : t_ClosureMod) -> { f_ClosureMod_cmPkg = (m).f_ClosureMod_cmPkg; f_ClosureMod_cmPkgKey = (m).f_ClosureMod_cmPkgKey; f_ClosureMod_cmPkgEnv = (m).f_ClosureMod_cmPkgEnv; f_ClosureMod_cmName = (m).f_ClosureMod_cmName; f_ClosureMod_cmPath = (m).f_ClosureMod_cmPath; f_ClosureMod_cmSrc = (m).f_ClosureMod_cmSrc; f_ClosureMod_cmImports = (m).f_ClosureMod_cmImports; f_ClosureMod_cmAddr = ((v_ifaceAddrOf srcTbl) m) })

# 974 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceModsWithEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (pkgs : t_PkgEntry B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dObs.v_obsMarkEff "vuna.iface.compute")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun ta -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_closureModsEff nFs) ctx) pkgs)) (fun mods0 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun tb -> ((fun hasPrelude -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_mapEff ((((v_loadHeaderEff nFs) nEnv) nProcess) hasPrelude)) mods0)) (fun mods -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun tc -> ((fun srcTbl -> ((fun assigned -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["iface-mods-phases n="; (bi_strFromInt (B_dData_dList.v_length mods)); " closure="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (tb - ta) / 1000)); "ms headers="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (tc - tb) / 1000)); "ms assign=direct"])) else 0))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dObs.v_obsMarkEff "vuna.iface.compute")) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) assigned)))))) ((B_dData_dList.v_map (v_withAddr srcTbl)) mods))) (v_srcTblOf mods))))))) ((B_dData_dList.v_memName "Prelude") ((B_dData_dList.v_map v_modNameOf) mods0))))))))))))

# 1052 "Vuna/Compiler/Driver/Compile.vuna"
let v_readIfaceAtEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (a : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((Base_dStore.v_storeObjectReadEff nFs) nEnv) nProcess) "module-iface") v_ifaceObjectCodec) a)) (fun payload -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match payload with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__54) -> (Driver_dIface.v_decModuleIfaceComplete dtb__54)
  | _ -> failwith "DT: impossible branch"
)))))

# 1068 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_readIfaceListPartialEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (mc0 : t_ClosureMod B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__55, dtb__56) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_readIfaceAtEff nFs) nEnv) nProcess) (dtb__55).f_ClosureMod_cmAddr)) (fun mi -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_readIfaceListPartialEff nFs) nEnv) nProcess) dtb__56)) (fun xs -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match mi with
  | B_dData_dMaybe.C_Maybe_Nothing -> xs
  | B_dData_dMaybe.C_Maybe_Just (dtb__57) -> (B_dData_dList.C_List__x58__x58_ (dtb__57, xs))
  | _ -> failwith "DT: impossible branch"
))))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 1080 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_readIfaceListEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (mc0 : t_ClosureMod B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__58, dtb__59) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_readIfaceAtEff nFs) nEnv) nProcess) (dtb__58).f_ClosureMod_cmAddr)) (fun mi -> (match mi with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((fun _u -> ((fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dObs.v_obsCountEff "vuna.counter.cache.miss") 1)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dMaybe.C_Maybe_Nothing)))) (B_dData_dObs.v_obsMark (String.concat "" ["vuna.tool.iface.miss:"; (dtb__58).f_ClosureMod_cmName; ":"; (dtb__58).f_ClosureMod_cmAddr])))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["iface-miss "; (dtb__58).f_ClosureMod_cmName; " "; (dtb__58).f_ClosureMod_cmAddr; " pkg="; (dtb__58).f_ClosureMod_cmPkg; " src="; (dtb__58).f_ClosureMod_cmSrc])) else 0))
  | B_dData_dMaybe.C_Maybe_Just (dtb__60) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dObs.v_obsCountEff "vuna.counter.cache.hit") 1)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_readIfaceListEff nFs) nEnv) nProcess) dtb__59)) (fun xs -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match xs with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__61) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__60, dtb__61))))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))

# 1104 "Vuna/Compiler/Driver/Compile.vuna"
let v_depModsOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> ((B_dData_dList.v_filter (v_isDepModOf ctx)) mods))

# 1107 "Vuna/Compiler/Driver/Compile.vuna"
let v_selfModsOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> ((B_dData_dList.v_filter (v_isSelfModOf ctx)) mods))

# 1142 "Vuna/Compiler/Driver/Compile.vuna"
let v_orderKind = "module-order"

# 1145 "Vuna/Compiler/Driver/Compile.vuna"
let v_orderCodec = "module-order 1"

# 1148 "Vuna/Compiler/Driver/Compile.vuna"
let v_encOrderNames = (fun (names : string B_dData_dList.t_List) -> ((Base_dBytes.v_encTop (Base_dBytes.v_encList Base_dBytes.v_encStr)) names))

# 1151 "Vuna/Compiler/Driver/Compile.vuna"
let v_decOrderNamesComplete = (fun (s : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__62) -> (match dtb__62 with
  | { B_dData_dPair.f_Pair_first = dtb__63; B_dData_dPair.f_Pair_second = dtb__64 } -> (if (Base_dBytes.v_curAtEnd dtb__64) then (B_dData_dMaybe.C_Maybe_Just (dtb__63)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList Base_dBytes.v_decStr) (bi_strLength s)) (Base_dBytes.v_curOf s))))

# 1157 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_rootOfName = (fun (mc0 : string) (mc1 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__65, dtb__66) -> (if ((Frontend_dPackages_dPkg.v_rootName dtb__65) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__65)) else ((v_rootOfName mc0) dtb__66))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1163 "Vuna/Compiler/Driver/Compile.vuna"
let v_orderKeyOfEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (root : Frontend_dPackages_dPkg.t_Root) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_rootHash nFs) root)) (fun h -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Loader_dFingerprint.v_cacheTagEff nFs) nEnv)) (fun tag -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ ("module-order", (B_dData_dList.C_List__x58__x58_ ((Frontend_dPackages_dPkg.v_rootName root), (B_dData_dList.C_List__x58__x58_ ((bi_strFromInt h), (B_dData_dList.C_List__x58__x58_ (tag, B_dData_dList.C_List_Nil)))))))))))))))

# 1171 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeOrderEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> (match ((v_rootOfName (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (Frontend_dPackages_dPkg.v_contextRoots ctx)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0)
  | B_dData_dMaybe.C_Maybe_Just (dtb__67) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_orderKeyOfEff nFs) nEnv) nProcess) dtb__67)) (fun key -> (((((((Base_dStore.v_storeObjectWriteEff nFs) nEnv) nProcess) v_orderKind) v_orderCodec) key) (v_encOrderNames names))))
  | _ -> failwith "DT: impossible branch"
))

# 1181 "Vuna/Compiler/Driver/Compile.vuna"
let v_readOrderEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (pkg : string) -> (match ((v_rootOfName pkg) (Frontend_dPackages_dPkg.v_contextRoots ctx)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Just (dtb__68) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_orderKeyOfEff nFs) nEnv) nProcess) dtb__68)) (fun key -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((Base_dStore.v_storeObjectReadEff nFs) nEnv) nProcess) v_orderKind) v_orderCodec) key)) (fun payload -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match payload with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__69) -> (v_decOrderNamesComplete dtb__69)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
))

# 1196 "Vuna/Compiler/Driver/Compile.vuna"
let v_orderCoversEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_readOrderEff nFs) nEnv) nProcess) ctx) (Frontend_dPackages_dPkg.v_contextPackageName ctx))) (fun ord -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match ord with
  | B_dData_dMaybe.C_Maybe_Just (dtb__70) -> ((v_allNamesIn names) dtb__70)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)))))

# 1206 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_pickByOrder = (fun (mc0 : t_ClosureMod B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__71, dtb__72) -> (match ((v_findClosureMod dtb__71) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__73) -> (B_dData_dList.C_List__x58__x58_ (dtb__73, ((v_pickByOrder mc0) dtb__72)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_pickByOrder mc0) dtb__72)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1213 "Vuna/Compiler/Driver/Compile.vuna"
let v_pkgEq = (fun (p : string) (m : t_ClosureMod) -> ((m).f_ClosureMod_cmPkg = p))

# 1216 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_distinctPkgs = (fun (mc0 : t_ClosureMod B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (if ((B_dData_dList.v_memName (dtb__74).f_ClosureMod_cmPkg) mc1) then ((v_distinctPkgs dtb__75) mc1) else ((v_distinctPkgs dtb__75) (B_dData_dList.C_List__x58__x58_ ((dtb__74).f_ClosureMod_cmPkg, mc1))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 1250 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_rootExportsOf = (fun (mc0 : string) (mc1 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> (if ((Frontend_dPackages_dPkg.v_rootName dtb__76) = mc0) then (dtb__76).Frontend_dPackages_dPkg.f_Root_rootExports else ((v_rootExportsOf mc0) dtb__77))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1261 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_pickDepMods = (fun (mc0 : Frontend_dPackages_dPkg.t_PackageContext) (mc1 : t_ClosureMod B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__78, dtb__79) -> (if ((B_dData_dList.v_memName dtb__78) mc3) then ((((v_pickDepMods mc0) mc1) dtb__79) mc3) else (match ((v_findClosureMod dtb__78) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__80) -> (if ((dtb__80).f_ClosureMod_cmPkg <> (Frontend_dPackages_dPkg.v_contextPackageName mc0)) then (B_dData_dList.C_List__x58__x58_ (dtb__80, ((((v_pickDepMods mc0) mc1) dtb__79) (B_dData_dList.C_List__x58__x58_ (dtb__78, mc3))))) else ((((v_pickDepMods mc0) mc1) dtb__79) (B_dData_dList.C_List__x58__x58_ (dtb__78, mc3))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_pickDepMods mc0) mc1) dtb__79) mc3)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1279 "Vuna/Compiler/Driver/Compile.vuna"
let v_importNameStr = (fun (mc0 : Frontend_dAst.t_Import) -> (match mc0 with
  | { Frontend_dAst.f_Import_importName = dtb__81; Frontend_dAst.f_Import_importIsQualified = dtb__82; Frontend_dAst.f_Import_importAlias = dtb__83; Frontend_dAst.f_Import_importSpan = dtb__84 } -> dtb__81
  | _ -> failwith "DT: impossible branch"
))

# 1293 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolImportNamesOf = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (current : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((Loader_dFlatten.v_implicitPrelude nFs) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) current) imports)) (fun implicitR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__85) -> ((B_dData_dList.v_map v_importNameStr) imports)
  | Base_dDiag.C_Check_OkC (dtb__86) -> ((B_dData_dList.v_map v_importNameStr) ((B_dData_dList.v_append imports) dtb__86))
  | _ -> failwith "DT: impossible branch"
)))))

# 1282 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolImportsOfSource = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((Loader_dFlatten.v_parseFileWithPath nFs) nEnv) nProcess) label) source)) (fun parsed -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dDiag.C_Check_OkC (dtb__87) -> (match dtb__87 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb__88; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__89; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__90; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__91; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__92; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__93; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__94 } -> ((fun nd_uscrut21 -> (match nd_uscrut21 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_toolImportNamesOf nFs) ctx) "") dtb__89)
  | B_dData_dMaybe.C_Maybe_Just (dtb__95) -> (match dtb__95 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__96; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__97; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__98; Frontend_dAst.f_ModDecl_modDeclExports = dtb__99; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__100; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__101; Frontend_dAst.f_ModDecl_modDeclSpan = dtb__102 } -> ((((v_toolImportNamesOf nFs) ctx) dtb__96) dtb__89)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__88)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__103) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)) parsed))))

# 1308 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolEnabled = (fun (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_IFACE_TOOL")) (fun v -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (v <> "0")))))

# 1314 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_importClosureGo = (fun (mc0 : int) (mc1 : t_ClosureMod B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__104, dtb__105) -> (if (mc0 <= 0) then mc3 else (if ((B_dData_dList.v_memName dtb__104) mc3) then ((((v_importClosureGo (mc0 - 1)) mc1) dtb__105) mc3) else (match ((v_findClosureMod dtb__104) mc1) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_importClosureGo (mc0 - 1)) mc1) dtb__105) (B_dData_dList.C_List__x58__x58_ (dtb__104, mc3)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__106) -> ((((v_importClosureGo (mc0 - 1)) mc1) ((B_dData_dList.v_append (dtb__106).f_ClosureMod_cmImports) dtb__105)) (B_dData_dList.C_List__x58__x58_ (dtb__104, mc3)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 1335 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_closureEdges = (fun (mc0 : t_ClosureMod B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__107, dtb__108) -> ((B_dData_dList.v_length (dtb__107).f_ClosureMod_cmImports) + (v_closureEdges dtb__108))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 1332 "Vuna/Compiler/Driver/Compile.vuna"
let v_closureFuel = (fun (mods : t_ClosureMod B_dData_dList.t_List) (starts : string B_dData_dList.t_List) -> ((((B_dData_dList.v_length starts) + (B_dData_dList.v_length mods)) + (v_closureEdges mods)) + 1))

# 1329 "Vuna/Compiler/Driver/Compile.vuna"
let v_importClosureOf = (fun (mods : t_ClosureMod B_dData_dList.t_List) (starts : string B_dData_dList.t_List) -> ((((v_importClosureGo ((v_closureFuel mods) starts)) mods) starts) B_dData_dList.C_List_Nil))

# 1339 "Vuna/Compiler/Driver/Compile.vuna"
let v_isNeededMod = (fun (needed : string B_dData_dList.t_List) (m : t_ClosureMod) -> ((B_dData_dList.v_memName (m).f_ClosureMod_cmName) needed))

# 1343 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolDepModsOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (needed : string B_dData_dList.t_List) -> ((B_dData_dList.v_filter (v_isNeededMod needed)) ((v_depModsOf ctx) mods)))

# 1408 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolTextHash = (fun (_uarity0 : string) -> (Driver_dIface.v_payloadDigest _uarity0))

# 1411 "Vuna/Compiler/Driver/Compile.vuna"
let v_sourceInfoForPath = (fun (nFs : string) (path : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun raw -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_uBase_uEffect_uCore_uEff_ur) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime nFs) path))) (fun mtime -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_uBase_uEffect_uCore_uEff_ur) (fun (o : int B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe 0) o))) ((B_dEffect_dFs.v_fsFileSize nFs) path))) (fun size -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) { Driver_dIface.f_SourceInfo_siPath = path; Driver_dIface.f_SourceInfo_siHash = (Driver_dIface.v_payloadDigest raw); Driver_dIface.f_SourceInfo_siMtime = mtime; Driver_dIface.f_SourceInfo_siSize = size }))))))))

# 1419 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolNowSec = (fun (nClock : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun us -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (if 1000000 = 0 then failwith "division by zero" else us / 1000000)))))

# 1427 "Vuna/Compiler/Driver/Compile.vuna"
let v_mtimeSafetyWindowSec = 5

# 1432 "Vuna/Compiler/Driver/Compile.vuna"
let v_sourceFresh = (fun (nFs : string) (builtSec : int) (si : Driver_dIface.t_SourceInfo) -> ((fun path -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_uBase_uData_uBool_uBool) exists) false) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) false) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_uBase_uEffect_uCore_uEff_ur) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime nFs) path))) (fun m -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_uBase_uEffect_uCore_uEff_ur) (fun (o : int B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe 0) o))) ((B_dEffect_dFs.v_fsFileSize nFs) path))) (fun sz -> (if (if (if (m = (Driver_dIface.v_siMtimeOf si)) then (sz = (Driver_dIface.v_siSizeOf si)) else false) then (((Driver_dIface.v_siMtimeOf si) + v_mtimeSafetyWindowSec) <= builtSec) else false) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) true) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun content -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Driver_dIface.v_payloadDigest content) = (Driver_dIface.v_siHashOf si)))))))))))))) (Driver_dIface.v_siPathOf si)))

# 1452 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_toolSessionFresh = (fun (nFs : string) (mc0 : int) (mc1 : Driver_dIface.t_SourceInfo B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_sourceFresh nFs) mc0) dtb__109)) (fun fresh -> (if fresh then (((v_toolSessionFresh nFs) mc0) dtb__110) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) false))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) true)
  | _ -> failwith "DT: impossible branch"
))

# 1501 "Vuna/Compiler/Driver/Compile.vuna"
let v_modHashPair = (fun (m : t_ClosureMod) -> { B_dData_dPair.f_Pair_first = (m).f_ClosureMod_cmName; B_dData_dPair.f_Pair_second = (m).f_ClosureMod_cmAddr })

# 1504 "Vuna/Compiler/Driver/Compile.vuna"
let v_statOfClosureMod = (fun (nFs : string) (m : t_ClosureMod) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_uBase_uEffect_uCore_uEff_ur) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime nFs) (m).f_ClosureMod_cmPath))) (fun mtime -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_uBase_uEffect_uCore_uEff_ur) (fun (o : int B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe 0) o))) ((B_dEffect_dFs.v_fsFileSize nFs) (m).f_ClosureMod_cmPath))) (fun size -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) { Driver_dIface.f_SourceInfo_siPath = (m).f_ClosureMod_cmPath; Driver_dIface.f_SourceInfo_siHash = (m).f_ClosureMod_cmSrc; Driver_dIface.f_SourceInfo_siMtime = mtime; Driver_dIface.f_SourceInfo_siSize = size }))))))

# 1529 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanWanted = (fun (needed : string B_dData_dList.t_List) (exclude : string B_dData_dMaybe.t_Maybe) (m : t_ClosureMod) -> (if ((B_dData_dList.v_memName (m).f_ClosureMod_cmName) needed) then (match exclude with
  | B_dData_dMaybe.C_Maybe_Just (dtb__111) -> ((m).f_ClosureMod_cmName <> dtb__111)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
) else false))

# 1639 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolCompilerFingerprint = (fun (nFs : string) (nEnv : string) -> ((v_compilerFingerprint nFs) nEnv))

# 1650 "Vuna/Compiler/Driver/Compile.vuna"
let v_canonicalDir = (fun (dir : string) -> (if ((B_dData_dString.v_endsWith "/") dir) then (((B_dData_dString.v_substring 0) (bi_natFromInt ((bi_strLength dir) - 1))) dir) else dir))

# 1654 "Vuna/Compiler/Driver/Compile.vuna"
let v_canonicalPath = (fun (dir : string) (file : string) -> ((fun d -> (if (if (d = ".") then true else (d = "")) then file else (if ((B_dData_dString.v_startsWith (d ^ "/")) file) then (((B_dData_dString.v_substring (bi_natFromInt ((bi_strLength d) + 1))) (bi_natFromInt (((bi_strLength file) - (bi_strLength d)) - 1))) file) else file))) (v_canonicalDir dir)))

# 1665 "Vuna/Compiler/Driver/Compile.vuna"
let v_resolveStoredPath = (fun (dir : string) (file : string) -> ((fun d -> (if (if (file = "") then true else ((B_dData_dString.v_startsWith "/") file)) then file else (if (if (d = ".") then true else (d = "")) then file else (String.concat "" [d; "/"; file])))) (v_canonicalDir dir)))

# 1673 "Vuna/Compiler/Driver/Compile.vuna"
let v_absoluteSpanLabel = (fun (l : Base_dDiag.t_Label) -> (match (l).Base_dDiag.f_Label_labelSpan with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__112) -> ((B_dData_dString.v_startsWith "/") (dtb__112).Base_dSource.f_Span_spanFile)
  | _ -> failwith "DT: impossible branch"
))

# 1679 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_hasAbsoluteLabels = (fun (mc0 : Base_dDiag.t_Label B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__113, dtb__114) -> (if (v_absoluteSpanLabel dtb__113) then true else (v_hasAbsoluteLabels dtb__114))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1683 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_anyAbsoluteChild = (fun (mc0 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__115, dtb__116) -> (if (v_diagHasAbsolutePath dtb__115) then true else (v_anyAbsoluteChild dtb__116))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1687 "Vuna/Compiler/Driver/Compile.vuna"
and v_diagHasAbsolutePath = (fun (mc0 : Base_dDiag.t_Diagnostic) -> (match mc0 with
  | { Base_dDiag.f_Diagnostic_diagId = dtb__117; Base_dDiag.f_Diagnostic_diagSeverity = dtb__118; Base_dDiag.f_Diagnostic_diagPhase = dtb__119; Base_dDiag.f_Diagnostic_diagCategory = dtb__120; Base_dDiag.f_Diagnostic_diagCode = dtb__121; Base_dDiag.f_Diagnostic_diagMessage = dtb__122; Base_dDiag.f_Diagnostic_diagLabels = dtb__123; Base_dDiag.f_Diagnostic_diagFields = dtb__124; Base_dDiag.f_Diagnostic_diagTrace = dtb__125; Base_dDiag.f_Diagnostic_diagNotes = dtb__126; Base_dDiag.f_Diagnostic_diagSuggestions = dtb__127; Base_dDiag.f_Diagnostic_diagOrigin = dtb__128; Base_dDiag.f_Diagnostic_diagChildren = dtb__129; Base_dDiag.f_Diagnostic_diagInternal = dtb__130; Base_dDiag.f_Diagnostic_diagIce = dtb__131; Base_dDiag.f_Diagnostic_diagAbsent = dtb__132; Base_dDiag.f_Diagnostic_diagStability = dtb__133 } -> (if (v_hasAbsoluteLabels dtb__123) then true else (v_anyAbsoluteChild dtb__129))
  | _ -> failwith "DT: impossible branch"
))

# 1691 "Vuna/Compiler/Driver/Compile.vuna"
let v_isStableDiag = (fun (d : Base_dDiag.t_Diagnostic) -> (match (d).Base_dDiag.f_Diagnostic_diagStability with
  | Base_dDiag.C_Stability_Stable -> true
  | Base_dDiag.C_Stability_Volatile -> false
  | _ -> failwith "DT: impossible branch"
))

# 1697 "Vuna/Compiler/Driver/Compile.vuna"
let v_allStableDiags = (fun (ds : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> ((B_dData_dList.v_length ((B_dData_dList.v_filter (fun (d : Base_dDiag.t_Diagnostic) -> (B_dData_dBool.v_not (v_isStableDiag d)))) ds)) = 0))

# 1701 "Vuna/Compiler/Driver/Compile.vuna"
let v_prepareForStore = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (d : Base_dDiag.t_Diagnostic) -> ((fun d2 -> (if (v_diagHasAbsolutePath d2) then ((Base_dDiag.v_withStability Base_dDiag.C_Stability_Volatile) d2) else (if (v_isStableDiag d2) then ((Base_dDiag.v_withStability Base_dDiag.C_Stability_Stable) d2) else d2))) ((Base_dDiag.v_mapSpanFile (v_canonicalPath (Frontend_dPackages_dPkg.v_contextDir ctx))) d)))

# 1709 "Vuna/Compiler/Driver/Compile.vuna"
let v_resolveStoredDiag = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (d : Base_dDiag.t_Diagnostic) -> ((Base_dDiag.v_mapSpanFile (v_resolveStoredPath (Frontend_dPackages_dPkg.v_contextDir ctx))) d))

# 1712 "Vuna/Compiler/Driver/Compile.vuna"
let v_replayFailure = (fun (mc0 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__134, dtb__135) -> (match dtb__135 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_ErrC (dtb__134))
  | _ -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withChildren dtb__135) dtb__134)))
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1738 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkModsOf = (fun (pkg : string) (kind : string) (manifest : string) (sources : string) (deps : string) (ver : string) (flags : string) -> { f_CheckMods_cmPkg = pkg; f_CheckMods_cmKind = kind; f_CheckMods_cmManifest = manifest; f_CheckMods_cmSources = sources; f_CheckMods_cmDeps = deps; f_CheckMods_cmVer = ver; f_CheckMods_cmFlags = flags })

# 740 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkModsExe = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_contextSources nFs) ctx) entry)) (fun sources -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_depIdentitiesEff nFs) nEnv) nProcess) ctx)) (fun deps -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_compilerFingerprint nFs) nEnv)) (fun fp -> ((fun srcHash -> ((fun manHash -> ((fun verHash -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (((((((v_checkModsOf (Frontend_dPackages_dPkg.v_contextPackageName ctx)) "exe") (v_hashText manHash)) (v_hashText srcHash)) (v_depIdentitiesHash deps)) (v_hashText verHash)) (v_releaseFlagOf ctx)))) ((v_textHash (v_checkNodeSchema ^ Base_dVersion.v_vunaVersion)) + fp))) (v_textHash (v_manifestSemanticText (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage)))) ((v_closureHashOf sources) 0)))))))))

# 753 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkModsLib = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_concatMapEff (v_rootSources nFs)) (Frontend_dPackages_dPkg.v_contextRoots ctx))) (fun rootSourcesAll -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_depIdentitiesEff nFs) nEnv) nProcess) ctx)) (fun deps -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_compilerFingerprint nFs) nEnv)) (fun fp -> ((fun srcHash -> ((fun manHash -> ((fun namesHash -> ((fun verHash -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (((((((v_checkModsOf (Frontend_dPackages_dPkg.v_contextPackageName ctx)) ("lib:" ^ (v_hashText namesHash))) (v_hashText manHash)) (v_hashText srcHash)) (v_depIdentitiesHash deps)) (v_hashText verHash)) (v_releaseFlagOf ctx)))) ((v_textHash (v_checkNodeSchema ^ Base_dVersion.v_vunaVersion)) + fp))) (v_textHash ((B_dData_dString.v_join "\t") names)))) (v_textHash (v_manifestSemanticText (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage)))) ((v_closureHashOf rootSourcesAll) 0)))))))))

# 1745 "Vuna/Compiler/Driver/Compile.vuna"
let v_projectIdOf = (fun (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Frontend_dPackages_dPkg.v_absolutePath nEnv) (Frontend_dPackages_dPkg.v_contextDir ctx))) (fun abs -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Loader_dAddr.v_projectIdAddrOf abs)))))

# 1754 "Vuna/Compiler/Driver/Compile.vuna"
let v_rootKeepEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (digests : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_projectIdOf nEnv) ctx)) (fun pid -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Frontend_dPackages_dPkg.v_absolutePath nEnv) (Frontend_dPackages_dPkg.v_contextDir ctx))) (fun abs -> ((((((Base_dStore.v_storeRootAppendEff nFs) nEnv) nProcess) pid) abs) digests))))))

# 1717 "Vuna/Compiler/Driver/Compile.vuna"
let v_storeCheckPayload = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (dig : string) (outcome : Base_dDiag_dCodec.t_CheckOutcome) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((Base_dStore.v_storeObjectWriteEff nFs) nEnv) nProcess) "check-outcome") Base_dDiag_dCodec.v_checkResultCodec) dig) (Base_dDiag_dCodec.v_encCheckOutcome outcome))) (fun _u -> (((((v_rootKeepEff nFs) nEnv) nProcess) ctx) (B_dData_dList.C_List__x58__x58_ (dig, B_dData_dList.C_List_Nil))))))

# 1801 "Vuna/Compiler/Driver/Compile.vuna"
let v_runAndStore = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (dig : string) (run : Base_dDiag.t_Diagnostic B_dData_dList.t_List Base_dDiag.t_Check B_dEffect_dCore.t_Eff) -> ((fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dObs.v_obsCountEff "vuna.counter.cache.miss") 1)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) run) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__136) -> ((fun stored -> ((fun _u -> (if (v_allStableDiags stored) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_storeCheckPayload nFs) nEnv) nProcess) ctx) dig) (Base_dDiag_dCodec.C_CheckOutcome_CheckFailed (stored)))) (fun n -> ((fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dObs.v_obsCountEff "vuna.counter.cache.write") 1)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__136)))))) (if (dtp_debug_on 0) then (dtp_debug_line ("check-store write=" ^ (bi_strFromInt n))) else 0)))) else ((fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__136)))) (if (dtp_debug_on 0) then (dtp_debug_line "check-cache=skip volatile") else 0)))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["check-store stable="; (bi_strFromInt (B_dData_dList.v_length ((B_dData_dList.v_filter (fun (d : Base_dDiag.t_Diagnostic) -> (v_isStableDiag d))) stored))); "/"; (bi_strFromInt (B_dData_dList.v_length stored))])) else 0))) ((B_dData_dList.v_map (v_prepareForStore ctx)) (B_dData_dList.C_List__x58__x58_ (dtb__136, B_dData_dList.C_List_Nil))))
  | Base_dDiag.C_Check_OkC (dtb__137) -> ((fun allStored -> ((fun stored -> ((fun dropped -> ((fun _u -> ((fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_storeCheckPayload nFs) nEnv) nProcess) ctx) dig) (Base_dDiag_dCodec.C_CheckOutcome_CheckPassed (stored)))) (fun n -> ((fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dObs.v_obsCountEff "vuna.counter.cache.write") 1)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC (dtb__137)))))) (if (dtp_debug_on 0) then (dtp_debug_line ("check-store write=" ^ (bi_strFromInt n))) else 0))))) (if (dropped > 0) then (if (dtp_debug_on 0) then (dtp_debug_line ("check-store dropped=" ^ (bi_strFromInt dropped))) else 0) else 0))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["check-store pass stable="; (bi_strFromInt (B_dData_dList.v_length stored)); "/"; (bi_strFromInt (B_dData_dList.v_length allStored))])) else 0))) (bi_natSub (B_dData_dList.v_length allStored) (B_dData_dList.v_length stored)))) ((B_dData_dList.v_filter v_isStableDiag) allStored))) ((B_dData_dList.v_map (v_prepareForStore ctx)) dtb__137))
  | _ -> failwith "DT: impossible branch"
)))))) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=miss") else 0)))

# 1932 "Vuna/Compiler/Driver/Compile.vuna"
let v_elabFullRequested = (fun (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_ELAB_FULL")) (fun v -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (v = "1")))))

# 1940 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceAuditRequested = (fun (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_IFACE_AUDIT")) (fun v -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (v = "1")))))

# 1950 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkSignatureOf = (fun (mc0 : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, Driver_dDt.t_CheckedPackage) B_dData_dPair.t_Pair Base_dDiag.t_Check) -> (match mc0 with
  | Base_dDiag.C_Check_ErrC (dtb__138) -> ("err\n" ^ (Base_dDiag.v_diagText dtb__138))
  | Base_dDiag.C_Check_OkC (dtb__139) -> "ok\n"
  | _ -> failwith "DT: impossible branch"
))

# 1956 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitSignatureOf = (fun (mc0 : (Driver_dSplit.t_SplitFile B_dData_dList.t_List, Driver_dDt.t_CheckedPackage) B_dData_dPair.t_Pair Base_dDiag.t_Check) -> (match mc0 with
  | Base_dDiag.C_Check_ErrC (dtb__140) -> ("err\n" ^ (Base_dDiag.v_diagText dtb__140))
  | Base_dDiag.C_Check_OkC (dtb__141) -> ("ok\n" ^ ((Base_dBytes.v_encTop Driver_dSplit.v_encSplitFiles) (B_dData_dPair.v_firstOf dtb__141)))
  | _ -> failwith "DT: impossible branch"
))

# 1960 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_joinLines = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__142, dtb__143) -> (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_uBase_uData_uList_uList_ua B_dData_dString.v_Eq_uString)) dtb__143) B_dData_dList.C_List_Nil) then dtb__142 else (String.concat "" [dtb__142; "\n"; (v_joinLines dtb__143)]))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1966 "Vuna/Compiler/Driver/Compile.vuna"
let v_auditCompare = (fun (subject : string) (at : string) (s : string) (f : string) -> (if (s = f) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_err (String.concat "" ["iface-audit-mismatch subject="; subject; " at="; at; " summary="; (bi_strFromInt (v_textHash s)); "/"; (bi_strFromInt (bi_strLength s)); " full="; (bi_strFromInt (v_textHash f)); "/"; (bi_strFromInt (bi_strLength f))]))))

# 2013 "Vuna/Compiler/Driver/Compile.vuna"
let v_readOneModIface = (fun (nFs : string) (nEnv : string) (nProcess : string) (m : t_ClosureMod) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_readIfaceAtEff nFs) nEnv) nProcess) (m).f_ClosureMod_cmAddr)) (fun mi -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) { B_dData_dPair.f_Pair_first = m; B_dData_dPair.f_Pair_second = mi }))))

# 2039 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_readIfaces = (fun (mc0 : (t_ClosureMod, Driver_dIface.t_ModuleIface B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__144, dtb__145) -> (match (B_dData_dPair.v_secondOf dtb__144) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_readIfaces dtb__145)
  | B_dData_dMaybe.C_Maybe_Just (dtb__146) -> (B_dData_dList.C_List__x58__x58_ (dtb__146, (v_readIfaces dtb__145)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 2057 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_fromDirty = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__147, dtb__148) -> (if ((B_dData_dString.v_startsWith (dtb__147 ^ ".")) mc1) then true else ((v_fromDirty dtb__148) mc1))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 2052 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_anyExportFrom = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__149, dtb__150) -> (if ((v_fromDirty mc0) (dtb__149).Loader_dModules.f_ExportEntry_target) then true else ((v_anyExportFrom mc0) dtb__150))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 2049 "Vuna/Compiler/Driver/Compile.vuna"
let v_exportsFromDirty = (fun (dirty : string B_dData_dList.t_List) (mi : Driver_dIface.t_ModuleIface) -> ((v_anyExportFrom dirty) (Driver_dIface.v_miExportsOf mi)))

# 2064 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_dirtyFix = (fun (fuel : int) (dirty : string B_dData_dList.t_List) (cands : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (if (fuel <= 0) then dirty else ((fun added -> (if ((B_dData_dList.v_length added) = 0) then dirty else (((v_dirtyFix (fuel - 1)) ((B_dData_dList.v_append added) dirty)) cands))) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) ((B_dData_dList.v_filter (fun (mi : Driver_dIface.t_ModuleIface) -> (if (B_dData_dBool.v_not ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf mi)) dirty)) then ((v_exportsFromDirty dirty) mi) else false))) cands)))))

# 2073 "Vuna/Compiler/Driver/Compile.vuna"
let v_collectClean = (fun (dirty0 : string B_dData_dList.t_List) (cands : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> ((fun dirty -> ((B_dData_dList.v_filter (fun (mi : Driver_dIface.t_ModuleIface) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf mi)) dirty)))) cands)) (((v_dirtyFix ((B_dData_dList.v_length cands) + 1)) dirty0) cands)))

# 2026 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanInfoWith = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_mapEff (((v_readOneModIface nFs) nEnv) nProcess)) ((v_selfModsOf ctx) mods))) (fun reads -> ((fun ownNames -> ((fun cands -> ((fun missing -> ((fun clean -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (if ((B_dData_dList.v_length clean) = 0) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (clean))))) ((v_collectClean missing) cands))) ((B_dData_dList.v_filter (fun (n : string) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName n) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) cands))))) ownNames))) (v_readIfaces reads))) ((B_dData_dList.v_map v_modNameOf) ((v_selfModsOf ctx) mods))))))

# 2086 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanModulesWith = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> (((((v_ownCleanInfoWith nFs) nEnv) nProcess) ctx) mods))

# 2124 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_cleanHashOf = (fun (mc0 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__151, dtb__152) -> (if ((Driver_dIface.v_miNameOf dtb__151) = mc1) then (B_dData_dMaybe.C_Maybe_Just ((Driver_dIface.v_miIfaceHashOf dtb__151))) else ((v_cleanHashOf dtb__152) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2111 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_moduleDepsOk = (fun (mc0 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mc2 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__153, dtb__154) -> (match dtb__153 with
  | { B_dData_dPair.f_Pair_first = dtb__155; B_dData_dPair.f_Pair_second = dtb__156 } -> (if (dtb__156 = Driver_dIface.v_depMissingHash) then (((v_moduleDepsOk mc0) mc1) dtb__154) else (match ((B_dData_dList.v_lookupPair dtb__155) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__157) -> (if (dtb__157 = dtb__156) then (((v_moduleDepsOk mc0) mc1) dtb__154) else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_cleanHashOf mc1) dtb__155) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__158) -> (if (dtb__158 = dtb__156) then (((v_moduleDepsOk mc0) mc1) dtb__154) else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 1585 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_cleanPass = (fun (mc0 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mc2 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mc3 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__159, dtb__160) -> (if (((v_moduleDepsOk mc0) mc2) (Driver_dIface.v_miDepHashesOf dtb__159)) then ((((v_cleanPass mc0) dtb__160) (B_dData_dList.C_List__x58__x58_ (dtb__159, mc2))) (B_dData_dList.C_List__x58__x58_ (dtb__159, mc3))) else ((fun p -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__159, (B_dData_dPair.v_firstOf p))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) }) ((((v_cleanPass mc0) dtb__160) mc2) mc3)))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse mc3) }
  | _ -> failwith "DT: impossible branch"
))

# 1570 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_cleanFixpoint = (fun (fuel : int) (depTbl : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (pending : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanRev : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (if (fuel <= 0) then ((B_dData_dList.v_append (B_dData_dList.v_reverse pending)) cleanRev) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__161; B_dData_dPair.f_Pair_second = dtb__162 } -> (match dtb__161 with
  | B_dData_dList.C_List_Nil -> ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb__162)) cleanRev)
  | _ -> (if ((B_dData_dList.v_length dtb__162) = 0) then ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb__161)) cleanRev) else ((fun _u -> ((((v_cleanFixpoint (fuel - 1)) depTbl) dtb__161) ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb__162)) cleanRev))) ((B_dData_dObs.v_obsCounter "vuna.tool.clean.kept") (B_dData_dList.v_length dtb__162))))
)
  | _ -> failwith "DT: impossible branch"
)) ((((v_cleanPass depTbl) pending) cleanRev) B_dData_dList.C_List_Nil))))

# 2133 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceCompilerTag = (fun (nFs : string) (nEnv : string) -> ((Loader_dFingerprint.v_cacheTagEff nFs) nEnv))

# 1018 "Vuna/Compiler/Driver/Compile.vuna"
let v_rootEnvHashOf = (fun (nFs : string) (nEnv : string) (dir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (dir ^ "/vuna.toml"))) (fun tomlPath -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) tomlPath)) (fun exists -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (if exists then ((B_dEffect_dFs.v_fsReadFile nFs) tomlPath) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ""))) (fun toml -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_ifaceCompilerTag nFs) nEnv)) (fun tag -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (v_textHash (String.concat "" [(bi_strFromInt (v_textHash toml)); "|"; tag; "|"]))))))))))))

# 1027 "Vuna/Compiler/Driver/Compile.vuna"
let v_rootPkgTableEff = (fun (nFs : string) (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> ((v_mapEff (fun (r : Frontend_dPackages_dPkg.t_Root) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_rootEnvHashOf nFs) nEnv) (Frontend_dPackages_dPkg.v_rootDir r))) (fun env -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) { f_PkgEntry_peName = (Frontend_dPackages_dPkg.v_rootName r); f_PkgEntry_peDir = (Frontend_dPackages_dPkg.v_rootDir r); f_PkgEntry_peKey = (v_pkgKeyOf (Frontend_dPackages_dPkg.v_rootName r)); f_PkgEntry_peEnv = (bi_strFromInt env) }))))) (Frontend_dPackages_dPkg.v_contextRoots ctx)))

# 1044 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifacesForRootsEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_rootPkgTableEff nFs) nEnv) ctx)) (fun pkgs -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_ifaceModsWithEff nFs) nClock) nEnv) nProcess) ctx) pkgs)) (fun mods -> ((((v_readIfaceListEff nFs) nEnv) nProcess) mods))))))

# 1377 "Vuna/Compiler/Driver/Compile.vuna"
let v_baseDepIfacesOf = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Just (dtb__163) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_ifacesForRootsEff nFs) nClock) nEnv) nProcess) ctx)
  | _ -> failwith "DT: impossible branch"
))

# 1987 "Vuna/Compiler/Driver/Compile.vuna"
let v_packageEnvHash = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> ((fun own -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_depIdentitiesEff nFs) nEnv) nProcess) ctx)) (fun deps -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_ifaceCompilerTag nFs) nEnv)) (fun tag -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (v_textHash (String.concat "" [(bi_strFromInt own); "|"; tag; "|"; (v_joinLines ((B_dData_dList.v_map v_pairText) deps))])))))))) (v_textHash (v_manifestSemanticText (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage))))

# 843 "Vuna/Compiler/Driver/Compile.vuna"
let v_pkgTableEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_packageEnvHash nFs) nEnv) nProcess) ctx)) (fun ownEnv -> ((fun own -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_mapEff (fun (p : Frontend_dPackages_dPkg.t_Package) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_packageEnvHash nFs) nEnv) nProcess) (Frontend_dPackages_dPkg.v_packageContext p))) (fun e -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) { f_PkgEntry_peName = (Frontend_dPackages_dPkg.v_packageName p); f_PkgEntry_peDir = (Frontend_dPackages_dPkg.v_packageDir p); f_PkgEntry_peKey = (v_pkgKeyOf (Frontend_dPackages_dPkg.v_packageName p)); f_PkgEntry_peEnv = (bi_strFromInt e) }))))) (v_depPackageList ctx))) (fun deps -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (B_dData_dList.C_List__x58__x58_ (own, deps)))))) { f_PkgEntry_peName = (Frontend_dPackages_dPkg.v_contextPackageName ctx); f_PkgEntry_peDir = (Frontend_dPackages_dPkg.v_contextDir ctx); f_PkgEntry_peKey = (v_pkgKeyOf (Frontend_dPackages_dPkg.v_contextPackageName ctx)); f_PkgEntry_peEnv = (bi_strFromInt ownEnv) }))))

# 968 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceModsEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_pkgTableEff nFs) nEnv) nProcess) ctx)) (fun pkgs -> ((((((v_ifaceModsWithEff nFs) nClock) nEnv) nProcess) ctx) pkgs))))

# 998 "Vuna/Compiler/Driver/Compile.vuna"
let v_summaryClosureMods = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dList.C_List_Nil)
  | B_dData_dMaybe.C_Maybe_Just (dtb__164) -> (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)
  | _ -> failwith "DT: impossible branch"
))

# 1037 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifacesForContextEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> ((((v_readIfaceListEff nFs) nEnv) nProcess) mods))))

# 1346 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForToolSource = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (v_toolEnabled nEnv)) (fun enabled -> (if enabled then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_toolImportsOfSource nFs) nEnv) nProcess) ctx) label) source)) (fun starts -> ((fun needed -> ((fun depMods -> ((fun _u -> ((((v_readIfaceListEff nFs) nEnv) nProcess) depMods)) (if (dtp_debug_on 0) then (dtp_debug_line ("tool-closure modules=" ^ (bi_strFromInt (B_dData_dList.v_length depMods)))) else 0))) (((v_toolDepModsOf ctx) mods) needed))) ((v_importClosureOf mods) starts)))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dMaybe.C_Maybe_Nothing)))))

# 1364 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForToolProgram = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) -> (((((((v_depIfacesForToolSource nFs) nClock) nEnv) nProcess) ctx) "<repl>") program))

# 1460 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolNeededOfImports = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (tool : t_ToolContext) (currentName : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_toolImportNamesOf nFs) ctx) currentName) imports)) (fun importNames -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((v_importClosureOf mods) importNames)))))))

# 1469 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForToolSourceDetailed = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (v_toolEnabled nEnv)) (fun enabled -> (if enabled then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dObs.v_obsMarkEff "vuna.tool.ifaces.lookup")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_toolImportsOfSource nFs) nEnv) nProcess) ctx) label) source)) (fun starts -> ((fun needed -> ((fun depMods -> ((fun depHashes -> ((fun ownNames -> ((fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_readIfaceListEff nFs) nEnv) nProcess) depMods)) (fun ifaces -> (match ifaces with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dObs.v_obsMarkEff "vuna.tool.ifaces.missing")) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dMaybe.C_Maybe_Nothing)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__165) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dObs.v_obsMarkEff "vuna.tool.ifaces.ready")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_mapEff (v_statOfClosureMod nFs)) depMods)) (fun stats -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (B_dData_dMaybe.C_Maybe_Just ({ f_ToolContext_tcDepIfaces = dtb__165; f_ToolContext_tcDepHashes = depHashes; f_ToolContext_tcNeeded = needed; f_ToolContext_tcOwnNames = ownNames; f_ToolContext_tcStats = stats })))))))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line ("tool-closure modules=" ^ (bi_strFromInt (B_dData_dList.v_length depMods)))) else 0))) ((B_dData_dList.v_map v_modNameOf) ((v_selfModsOf ctx) mods)))) ((B_dData_dList.v_map v_modHashPair) depMods))) (((v_toolDepModsOf ctx) mods) needed))) ((v_importClosureOf mods) starts)))))))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dObs.v_obsMarkEff "vuna.tool.ifaces.disabled")) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dMaybe.C_Maybe_Nothing)))))))

# 1611 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeModuleIfaceGuarded = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mi : Driver_dIface.t_ModuleIface) -> (if ((Frontend_dPackages_dPkg.v_contextPackageName ctx) = "") then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (match ((v_findClosureMod (Driver_dIface.v_miNameOf mi)) mods) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0)
  | B_dData_dMaybe.C_Maybe_Just (dtb__166) -> (((((((Base_dStore.v_storeObjectWriteEff nFs) nEnv) nProcess) "module-iface") v_ifaceObjectCodec) (dtb__166).f_ClosureMod_cmAddr) (Driver_dIface.v_encModuleIface mi))
  | _ -> failwith "DT: impossible branch"
)))))

# 1597 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolWriteModuleIface = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (tool : t_ToolContext) (clean : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (checked : Driver_dDt.t_CheckedPackage) (name : string) (si : Driver_dIface.t_SourceInfo) -> ((fun miResult -> (match miResult with
  | Base_dDiag.C_Check_ErrC (dtb__167) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__167)))
  | Base_dDiag.C_Check_OkC (dtb__168) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_writeModuleIfaceGuarded nFs) nClock) nEnv) nProcess) ctx) dtb__168)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC (dtb__168)))))
  | _ -> failwith "DT: impossible branch"
)) (((((((((Driver_dIface.v_ifaceOfModule (Frontend_dPackages_dPkg.v_contextPackageName ctx)) si) (tool).f_ToolContext_tcDepHashes) (checked).Driver_dDt.f_CheckedPackage_checkedInherited) clean) (checked).Driver_dDt.f_CheckedPackage_checkedModules) (checked).Driver_dDt.f_CheckedPackage_checkedEntryDecls) (checked).Driver_dDt.f_CheckedPackage_checkedProgram) name)))

# 1976 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfaceHashTable = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((B_dData_dList.v_map v_modHashPair) ((v_depModsOf ctx) mods))))))

# 2019 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanInfo = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((((v_ownCleanInfoWith nFs) nEnv) nProcess) ctx) mods))))

# 2079 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanModules = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_ownCleanInfo nFs) nClock) nEnv) nProcess) ctx)) (fun info -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) info))))

# 2092 "Vuna/Compiler/Driver/Compile.vuna"
let v_cleanIfacesOrEmpty = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_ownCleanModules nFs) nClock) nEnv) nProcess) ctx)) (fun clean -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match clean with
  | B_dData_dMaybe.C_Maybe_Just (dtb__169) -> dtb__169
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)))))

# 1624 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolWriteModuleIfaceCold = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : Driver_dDt.t_CheckedPackage) (name : string) (si : Driver_dIface.t_SourceInfo) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_cleanIfacesOrEmpty nFs) nClock) nEnv) nProcess) ctx)) (fun clean -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_depIfaceHashTable nFs) nClock) nEnv) nProcess) ctx)) (fun depTbl -> ((fun miResult -> (match miResult with
  | Base_dDiag.C_Check_ErrC (dtb__170) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__170)))
  | Base_dDiag.C_Check_OkC (dtb__171) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_writeModuleIfaceGuarded nFs) nClock) nEnv) nProcess) ctx) dtb__171)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC (dtb__171)))))
  | _ -> failwith "DT: impossible branch"
)) (((((((((Driver_dIface.v_ifaceOfModule (Frontend_dPackages_dPkg.v_contextPackageName ctx)) si) depTbl) (checked).Driver_dDt.f_CheckedPackage_checkedInherited) clean) (checked).Driver_dDt.f_CheckedPackage_checkedModules) (checked).Driver_dDt.f_CheckedPackage_checkedEntryDecls) (checked).Driver_dDt.f_CheckedPackage_checkedProgram) name)))))))

# 2139 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownSourceInfos = (fun (nFs : string) (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_mapEff (fun (root : Frontend_dPackages_dPkg.t_Root) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_collectVunaMeta nFs) (Frontend_dPackages_dPkg.v_rootDir root))) (fun paths -> ((v_mapEff (fun (p : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Frontend_dPackages_dPkg.v_absolutePath nEnv) p)) (fun abs -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) abs)) (fun raw -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_uBase_uEffect_uCore_uEff_ur) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime nFs) abs))) (fun mtime -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_uBase_uEffect_uCore_uEff_ur) (fun (o : int B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe 0) o))) ((B_dEffect_dFs.v_fsFileSize nFs) abs))) (fun size -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) { B_dData_dPair.f_Pair_first = ((v_moduleNameOfPath (Frontend_dPackages_dPkg.v_rootDir root)) p); B_dData_dPair.f_Pair_second = { Driver_dIface.f_SourceInfo_siPath = abs; Driver_dIface.f_SourceInfo_siHash = (Driver_dIface.v_payloadDigest raw); Driver_dIface.f_SourceInfo_siMtime = mtime; Driver_dIface.f_SourceInfo_siSize = size } }))))))))))) paths))))) ((B_dData_dList.v_filter (fun (r : Frontend_dPackages_dPkg.t_Root) -> ((Frontend_dPackages_dPkg.v_rootName r) = (Frontend_dPackages_dPkg.v_contextPackageName ctx)))) (Frontend_dPackages_dPkg.v_contextRoots ctx)))) (fun walked -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((B_dData_dList.v_concatMap (fun (xs : (string, Driver_dIface.t_SourceInfo) B_dData_dPair.t_Pair B_dData_dList.t_List) -> xs)) walked)))))

# 2161 "Vuna/Compiler/Driver/Compile.vuna"
let v_resyncCleanSources = (fun (sources : (string, Driver_dIface.t_SourceInfo) B_dData_dPair.t_Pair B_dData_dList.t_List) (clean : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (m : Driver_dIface.t_ModuleIface) -> (match ((B_dData_dList.v_lookupPair (Driver_dIface.v_miNameOf m)) sources) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__172) -> { Driver_dIface.f_ModuleIface_miName = (Driver_dIface.v_miNameOf m); Driver_dIface.f_ModuleIface_miPackage = (Driver_dIface.v_miPackageOf m); Driver_dIface.f_ModuleIface_miSource = dtb__172; Driver_dIface.f_ModuleIface_miIfaceHash = (Driver_dIface.v_miIfaceHashOf m); Driver_dIface.f_ModuleIface_miImplHash = (Driver_dIface.v_miImplHashOf m); Driver_dIface.f_ModuleIface_miDepHashes = (Driver_dIface.v_miDepHashesOf m); Driver_dIface.f_ModuleIface_miImports = (Driver_dIface.v_miImportsOf m); Driver_dIface.f_ModuleIface_miImplicitImports = (Driver_dIface.v_miImplicitImportsOf m); Driver_dIface.f_ModuleIface_miExports = (Driver_dIface.v_miExportsOf m); Driver_dIface.f_ModuleIface_miFixities = (Driver_dIface.v_miFixitiesOf m); Driver_dIface.f_ModuleIface_miDecls = (Driver_dIface.v_miDeclsOf m); Driver_dIface.f_ModuleIface_miRecords = (Driver_dIface.v_miRecordsOf m); Driver_dIface.f_ModuleIface_miPrepared = (Driver_dIface.v_miPreparedOf m); Driver_dIface.f_ModuleIface_miCached = (Driver_dIface.v_miCachedOf m); Driver_dIface.f_ModuleIface_miDefLocs = (Driver_dIface.v_miDefLocsOf m) }
  | B_dData_dMaybe.C_Maybe_Nothing -> m
  | _ -> failwith "DT: impossible branch"
))) clean))

# 2177 "Vuna/Compiler/Driver/Compile.vuna"
let v_shadowAllowed = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__173) -> true
  | _ -> failwith "DT: impossible branch"
))

# 1005 "Vuna/Compiler/Driver/Compile.vuna"
let v_shadowClosureMods = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (if ((Frontend_dPackages_dPkg.v_contextPackageName ctx) = "") then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dMaybe.C_Maybe_Nothing) else (if (B_dData_dBool.v_not (v_shadowAllowed ctx)) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dMaybe.C_Maybe_Nothing) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (B_dData_dMaybe.C_Maybe_Just (mods))))))))

# 2184 "Vuna/Compiler/Driver/Compile.vuna"
let v_nameExportedBy = (fun (names : string B_dData_dList.t_List) (m : t_ClosureMod) -> ((B_dData_dList.v_memName (m).f_ClosureMod_cmName) names))

# 1241 "Vuna/Compiler/Driver/Compile.vuna"
let v_exportedDepModsOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (p : string) (mods : t_ClosureMod B_dData_dList.t_List) -> ((fun inPkg -> (match ((v_rootExportsOf p) (Frontend_dPackages_dPkg.v_contextRoots ctx)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> inPkg
  | B_dData_dMaybe.C_Maybe_Just (dtb__174) -> ((B_dData_dList.v_filter (v_nameExportedBy dtb__174)) inPkg)
  | _ -> failwith "DT: impossible branch"
)) ((B_dData_dList.v_filter (v_pkgEq p)) mods)))

# 1221 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_goPkgs = (fun (nFs : string) (nEnv : string) (nProcess : string) (mc0 : Frontend_dPackages_dPkg.t_PackageContext) (mc1 : t_ClosureMod B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : t_ClosureMod B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__175, dtb__176) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_readOrderEff nFs) nEnv) nProcess) mc0) dtb__175)) (fun ord -> (match ord with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Just (dtb__177) -> ((fun current -> ((fun namesCurrent -> ((fun picked -> ((fun required -> (if (if namesCurrent then ((v_allNamesIn ((B_dData_dList.v_map v_modNameOf) required)) ((B_dData_dList.v_map v_modNameOf) picked)) else false) then (((((((v_goPkgs nFs) nEnv) nProcess) mc0) mc1) dtb__176) ((B_dData_dList.v_append mc3) picked)) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dMaybe.C_Maybe_Nothing))) (((v_exportedDepModsOf mc0) dtb__175) mc1))) ((v_pickByOrder mc1) dtb__177))) ((v_allNamesIn dtb__177) current))) ((B_dData_dList.v_map v_modNameOf) ((B_dData_dList.v_filter (v_pkgEq dtb__175)) mc1)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (B_dData_dMaybe.C_Maybe_Just (mc3)))
  | _ -> failwith "DT: impossible branch"
))

# 1255 "Vuna/Compiler/Driver/Compile.vuna"
let v_depModsByOrderEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> (((((((v_goPkgs nFs) nEnv) nProcess) ctx) mods) ((v_distinctPkgs ((v_depModsOf ctx) mods)) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil))

# 1118 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesOfWith = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Just (dtb__178) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_depModsByOrderEff nFs) nEnv) nProcess) ctx) mods)) (fun ordered -> (match ordered with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dMaybe.C_Maybe_Nothing)) (if (dtp_debug_on 0) then (dtp_debug_line "iface-reject=module-order") else 0))
  | B_dData_dMaybe.C_Maybe_Just (dtb__179) -> ((((v_readIfaceListEff nFs) nEnv) nProcess) dtb__179)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

# 184 "Vuna/Compiler/Driver/Compile.vuna"
let v_summarySplitParts = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (entry : string) (printResult : bool) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_depIfacesOfWith nFs) nClock) nEnv) nProcess) ctx) mods)) (fun depIfaces -> (match depIfaces with
  | B_dData_dMaybe.C_Maybe_Just (dtb__180) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_ownCleanModulesWith nFs) nEnv) nProcess) ctx) mods)) (fun clean -> ((fun _u -> ((((((((Driver_dDt.v_dtSplitProjectWithIfaces nFs) nConsole) nEnv) nProcess) ctx) entry) printResult) dtb__180)) (match clean with
  | B_dData_dMaybe.C_Maybe_Just (dtb__181) -> (if (dtp_debug_on 0) then (dtp_debug_line ("cache-own-clean=" ^ (bi_strFromInt (B_dData_dList.v_length dtb__181)))) else 0)
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((Driver_dDt.v_dtSplitProjectParts nFs) nConsole) nEnv) nProcess) ctx) entry) printResult)
  | _ -> failwith "DT: impossible branch"
))))

# 1110 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesOf = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> ((((((v_depIfacesOfWith nFs) nClock) nEnv) nProcess) ctx) mods))))

# 1273 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForCheck = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((((v_depIfacesOf nFs) nClock) nEnv) nProcess) ctx))

# 1367 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForTool = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (v_toolEnabled nEnv)) (fun enabled -> (if enabled then (((((v_depIfacesOf nFs) nClock) nEnv) nProcess) ctx) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dMaybe.C_Maybe_Nothing)))))

# 1876 "Vuna/Compiler/Driver/Compile.vuna"
let v_summaryCheckExeParts = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_depIfacesOfWith nFs) nClock) nEnv) nProcess) ctx) mods)) (fun depIfaces -> (match depIfaces with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((fun _u -> (((((Driver_dDt.v_dtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry)) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=full") else 0))
  | B_dData_dMaybe.C_Maybe_Just (dtb__182) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_ownCleanModulesWith nFs) nEnv) nProcess) ctx) mods)) (fun clean -> (match clean with
  | B_dData_dMaybe.C_Maybe_Just (dtb__183) -> ((fun cleanReal -> ((fun _u -> ((fun _u -> (((((((((Driver_dDt.v_dtCheckPackageIncrementalParts nFs) nEnv) nProcess) nExit) nArgs) ctx) entry) dtb__182) cleanReal)) (if (dtp_debug_on 0) then (dtp_debug_line ("cache-own-clean=" ^ (bi_strFromInt (B_dData_dList.v_length cleanReal)))) else 0))) (if (dtp_debug_on 0) then (dtp_debug_line ("cache-path=summary deps=" ^ (bi_strFromInt (v_depPackageCount ctx)))) else 0))) (if wantWarnings then B_dData_dList.C_List_Nil else dtb__183))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((fun _u -> ((((((Driver_dDt.v_dtCheckPackageWithIfacesParts nFs) nEnv) nProcess) ctx) entry) dtb__182)) (if (dtp_debug_on 0) then (dtp_debug_line ("cache-path=summary deps=" ^ (bi_strFromInt (v_depPackageCount ctx)))) else 0))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

# 2193 "Vuna/Compiler/Driver/Compile.vuna"
let v_exportedOwnOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (own : t_ClosureMod B_dData_dList.t_List) -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Nothing -> own
  | B_dData_dMaybe.C_Maybe_Just (dtb__184) -> (match (Frontend_dPackages_dPkg.v_packageExports dtb__184) with
  | B_dData_dMaybe.C_Maybe_Nothing -> own
  | B_dData_dMaybe.C_Maybe_Just (dtb__185) -> ((B_dData_dList.v_filter (v_nameExportedBy dtb__185)) own)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 2279 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_missingNamesOf = (fun (mc0 : t_ClosureMod B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__186, dtb__187) -> (if ((B_dData_dList.v_memName (dtb__186).f_ClosureMod_cmName) mc1) then ((v_missingNamesOf dtb__187) mc1) else (B_dData_dList.C_List__x58__x58_ ((dtb__186).f_ClosureMod_cmName, ((v_missingNamesOf dtb__187) mc1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 2290 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_writeIfaceObjects = (fun (nFs : string) (nEnv : string) (nProcess : string) (mc0 : t_ClosureMod B_dData_dList.t_List) (mc1 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__188, dtb__189) -> (match ((v_findClosureMod (Driver_dIface.v_miNameOf dtb__188)) mc0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_writeIfaceObjects nFs) nEnv) nProcess) mc0) dtb__189)
  | B_dData_dMaybe.C_Maybe_Just (dtb__190) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((Base_dStore.v_storeObjectWriteEff nFs) nEnv) nProcess) "module-iface") v_ifaceObjectCodec) (dtb__190).f_ClosureMod_cmAddr) (Driver_dIface.v_encModuleIface dtb__188))) (fun bytes -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_writeIfaceObjects nFs) nEnv) nProcess) mc0) dtb__189)) (fun n -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (if (bytes > 0) then (n + 1) else n))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 2206 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeIfaceShadowWith = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : Driver_dDt.t_CheckedPackage) (pre : t_ClosureMod B_dData_dList.t_List B_dData_dMaybe.t_Maybe) -> (if ((Frontend_dPackages_dPkg.v_contextPackageName ctx) = "") then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else (if (B_dData_dBool.v_not (v_shadowAllowed ctx)) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else ((fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun t0 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (match pre with
  | B_dData_dMaybe.C_Maybe_Just (dtb__191) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) dtb__191)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)
  | _ -> failwith "DT: impossible branch"
)) (fun mods -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun t1 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_ownSourceInfos nFs) nEnv) ctx)) (fun sources -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun t2 -> ((fun depTbl -> ((fun own -> ((fun required -> (match ((((((((Driver_dIface.v_ifaceOfPackage (Frontend_dPackages_dPkg.v_contextPackageName ctx)) sources) depTbl) (checked).Driver_dDt.f_CheckedPackage_checkedInherited) B_dData_dList.C_List_Nil) (checked).Driver_dDt.f_CheckedPackage_checkedModules) (checked).Driver_dDt.f_CheckedPackage_checkedEntryDecls) (checked).Driver_dDt.f_CheckedPackage_checkedProgram) with
  | Base_dDiag.C_Check_ErrC (dtb__192) -> ((fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))) (if (dtp_debug_on 0) then (dtp_debug_line ("iface-reject=compute iface-skip " ^ (Base_dDiag.v_diagText dtb__192))) else 0))
  | Base_dDiag.C_Check_OkC (dtb__193) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun t3 -> ((fun unwritten -> (if ((B_dData_dList.v_length unwritten) > 0) then ((fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["iface-skip partial closure="; (bi_strFromInt (B_dData_dList.v_length own)); " required="; (bi_strFromInt (B_dData_dList.v_length required)); " covered="; (bi_strFromInt (B_dData_dList.v_length dtb__193)); " missing="; ((B_dData_dString.v_join ",") unwritten)])) else 0)) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_writeOrderEff nFs) nEnv) nProcess) ctx) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) dtb__193))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dObs.v_obsMarkEff "vuna.iface.write")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_writeIfaceObjects nFs) nEnv) nProcess) own) dtb__193)) (fun n -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_writePkgIfaceSummaryEff nFs) nEnv) nProcess) ctx) dtb__193)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun t4 -> ((fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC (dtb__193)))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["iface-write="; (bi_strFromInt n); "/"; (bi_strFromInt (B_dData_dList.v_length dtb__193)); " closure="; (bi_strFromInt (B_dData_dList.v_length own)); " phases mods="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (t1 - t0) / 1000)); "ms sources="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (t2 - t1) / 1000)); "ms compute="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (t3 - t2) / 1000)); "ms write="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (t4 - t3) / 1000)); "ms"])) else 0)))))))))))))) ((v_missingNamesOf required) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) dtb__193)))))
  | _ -> failwith "DT: impossible branch"
)) ((v_exportedOwnOf ctx) own))) ((v_selfModsOf ctx) mods))) ((B_dData_dList.v_map v_modHashPair) ((v_depModsOf ctx) mods)))))))))))))) (if (dtp_debug_on 0) then (dtp_debug_line "iface-shadow-start") else 0)))))

# 2202 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeIfaceShadow = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : Driver_dDt.t_CheckedPackage) -> (((((((v_writeIfaceShadowWith nFs) nClock) nEnv) nProcess) ctx) checked) B_dData_dMaybe.C_Maybe_Nothing))

# 2306 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceSelfTestRequested = (fun (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_IFACE_SELFTEST")) (fun v -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (v = "1")))))

# 2105 "Vuna/Compiler/Driver/Compile.vuna"
let v_payloadSelfOk = (fun (nEnv : string) (m : Driver_dIface.t_ModuleIface) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (v_ifaceSelfTestRequested nEnv)) (fun self -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (if self then ((Driver_dIface.v_hashOfIface m) = (Driver_dIface.v_miIfaceHashOf m)) else true)))))

# 1548 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_cleanSelfOk = (fun (nFs : string) (nEnv : string) (mc0 : int) (mc1 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mc2 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__194, dtb__195) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_payloadSelfOk nEnv) dtb__194)) (fun selfOk -> ((fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_sourceFresh nFs) mc0) (Driver_dIface.v_miSourceOf dtb__194))) (fun fresh -> ((fun valid -> ((fun missingDep -> ((fun ok -> ((fun _u -> ((fun _u -> ((fun _u -> ((fun _u -> (((((v_cleanSelfOk nFs) nEnv) mc0) dtb__195) (if ok then (B_dData_dList.C_List__x58__x58_ (dtb__194, mc2)) else mc2))) (if missingDep then ((B_dData_dObs.v_obsCounter "vuna.tool.clean.reject.missingdep") 1) else 0))) (if valid then 0 else ((B_dData_dObs.v_obsCounter "vuna.tool.clean.reject.cached") 1)))) (if fresh then 0 else ((B_dData_dObs.v_obsCounter "vuna.tool.clean.reject.fresh") 1)))) (if selfOk then 0 else ((B_dData_dObs.v_obsCounter "vuna.tool.clean.reject.self") 1)))) (if (if (if fresh then valid else false) then selfOk else false) then (B_dData_dBool.v_not missingDep) else false))) (Driver_dIface.v_hasMissingDep (Driver_dIface.v_miDepHashesOf dtb__194)))) (Driver_dCache.v_cachedProgramValid (Driver_dIface.v_miCachedOf dtb__194)))))) (if selfOk then 0 else (if (dtp_debug_on 0) then (dtp_debug_line ("iface-reject=self-hash " ^ (Driver_dIface.v_miNameOf dtb__194))) else 0)))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (B_dData_dList.v_reverse mc2))
  | _ -> failwith "DT: impossible branch"
))

# 1542 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolCleanGo = (fun (nFs : string) (nEnv : string) (builtSec : int) (depTbl : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (cands : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanRev : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_cleanSelfOk nFs) nEnv) builtSec) cands) B_dData_dList.C_List_Nil)) (fun ok -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((((v_cleanFixpoint ((B_dData_dList.v_length ok) + 1)) depTbl) ok) cleanRev)))))

# 1514 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolCleanOwnModules = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (tool : t_ToolContext) (builtSec : int) (exclude : string B_dData_dMaybe.t_Maybe) (needed : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> ((fun cands -> ((fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_readIfaceListPartialEff nFs) nEnv) nProcess) cands)) (fun clean -> ((fun _u -> ((((((v_toolCleanGo nFs) nEnv) builtSec) (tool).f_ToolContext_tcDepHashes) clean) B_dData_dList.C_List_Nil)) ((B_dData_dObs.v_obsCounter "vuna.tool.clean.read") (B_dData_dList.v_length clean)))))) ((B_dData_dObs.v_obsCounter "vuna.tool.clean.cands") (B_dData_dList.v_length cands)))) ((B_dData_dList.v_filter ((v_ownCleanWanted needed) exclude)) ((v_selfModsOf ctx) mods))))))

# 2312 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_ifaceHashOfName = (fun (mc0 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__196, dtb__197) -> (if ((Driver_dIface.v_miNameOf dtb__196) = mc1) then (B_dData_dMaybe.C_Maybe_Just ((Driver_dIface.v_miIfaceHashOf dtb__196))) else ((v_ifaceHashOfName dtb__197) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2317 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_allSelfHashesOk = (fun (mc0 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__198, dtb__199) -> (if ((Driver_dIface.v_hashOfIface dtb__198) = (Driver_dIface.v_miIfaceHashOf dtb__198)) then (v_allSelfHashesOk dtb__199) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 2321 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_sameIfaceHashes = (fun (mc0 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mc1 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__200, dtb__201) -> (match ((v_ifaceHashOfName mc1) (Driver_dIface.v_miNameOf dtb__200)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__202) -> (if (dtb__202 = (Driver_dIface.v_miIfaceHashOf dtb__200)) then ((v_sameIfaceHashes dtb__201) mc1) else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 2332 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkAndShadowWith = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (pre : t_ClosureMod B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (checked : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, Driver_dDt.t_CheckedPackage) B_dData_dPair.t_Pair Base_dDiag.t_Check B_dEffect_dCore.t_Eff) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) checked) (fun checkedR -> (match checkedR with
  | Base_dDiag.C_Check_ErrC (dtb__203) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__203)))
  | Base_dDiag.C_Check_OkC (dtb__204) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((v_writeIfaceShadowWith nFs) nClock) nEnv) nProcess) ctx) (B_dData_dPair.v_secondOf dtb__204)) pre)) (fun shadow -> (match shadow with
  | Base_dDiag.C_Check_ErrC (dtb__205) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__205)))
  | Base_dDiag.C_Check_OkC (dtb__206) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb__204))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

# 1908 "Vuna/Compiler/Driver/Compile.vuna"
let v_fullCheckExe = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> ((fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_shadowClosureMods nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) mods) (((((Driver_dDt.v_dtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry))))) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=full") else 0)))

# 1918 "Vuna/Compiler/Driver/Compile.vuna"
let v_auditCheckExe = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((((((v_summaryCheckExeParts nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) mods) entry)) (fun summary -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((Driver_dDt.v_dtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry)) (fun full -> ((fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((((v_auditCompare "check") entry) (v_checkSignatureOf summary)) (v_checkSignatureOf full)))) (fun compared -> (match compared with
  | Base_dDiag.C_Check_ErrC (dtb__207) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__207)))
  | Base_dDiag.C_Check_OkC (dtb__208) -> (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) (B_dData_dMaybe.C_Maybe_Just (mods))) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) summary))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line ("iface-audit subject=check entry=" ^ entry)) else 0)))))))

# 1857 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkUncachedExe = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (v_elabFullRequested nEnv)) (fun full -> (if full then ((((((v_fullCheckExe nFs) nClock) nEnv) nProcess) ctx) entry) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_summaryClosureMods nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (v_ifaceAuditRequested nEnv)) (fun audit -> (if audit then ((((((((((v_auditCheckExe nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) mods) entry) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((((((v_summaryCheckExeParts nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) mods) entry)) (fun summary -> (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) (B_dData_dMaybe.C_Maybe_Just (mods))) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) summary)))))))))))))

# 2329 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkAndShadow = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, Driver_dDt.t_CheckedPackage) B_dData_dPair.t_Pair Base_dDiag.t_Check B_dEffect_dCore.t_Eff) -> (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) B_dData_dMaybe.C_Maybe_Nothing) checked))

# 2371 "Vuna/Compiler/Driver/Compile.vuna"
let v_summaryCheckLibParts = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (names : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_depIfacesOfWith nFs) nClock) nEnv) nProcess) ctx) mods)) (fun depIfaces -> (match depIfaces with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((fun _u -> (((((Driver_dDt.v_dtCheckLibraryWithProgramParts nFs) nEnv) nProcess) ctx) names)) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=full") else 0))
  | B_dData_dMaybe.C_Maybe_Just (dtb__209) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_ownCleanModulesWith nFs) nEnv) nProcess) ctx) mods)) (fun clean -> (match clean with
  | B_dData_dMaybe.C_Maybe_Just (dtb__210) -> ((fun cleanReal -> ((fun _u -> ((fun _u -> (((((((((Driver_dDt.v_dtCheckLibraryPackageIncrementalParts nFs) nEnv) nProcess) nExit) nArgs) ctx) names) dtb__209) cleanReal)) (if (dtp_debug_on 0) then (dtp_debug_line ("cache-own-clean=" ^ (bi_strFromInt (B_dData_dList.v_length cleanReal)))) else 0))) (if (dtp_debug_on 0) then (dtp_debug_line ("cache-path=summary deps=" ^ (bi_strFromInt (v_depPackageCount ctx)))) else 0))) (if wantWarnings then B_dData_dList.C_List_Nil else dtb__210))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((fun _u -> ((((((Driver_dDt.v_dtCheckLibraryPackageWithIfacesParts nFs) nEnv) nProcess) ctx) names) dtb__209)) (if (dtp_debug_on 0) then (dtp_debug_line ("cache-path=summary deps=" ^ (bi_strFromInt (v_depPackageCount ctx)))) else 0))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

# 2402 "Vuna/Compiler/Driver/Compile.vuna"
let v_fullCheckLib = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> ((fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_shadowClosureMods nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) mods) (((((Driver_dDt.v_dtCheckLibraryWithProgramParts nFs) nEnv) nProcess) ctx) names))))) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=full") else 0)))

# 2410 "Vuna/Compiler/Driver/Compile.vuna"
let v_auditCheckLib = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (names : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((((((v_summaryCheckLibParts nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) mods) names)) (fun summary -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((Driver_dDt.v_dtCheckLibraryWithProgramParts nFs) nEnv) nProcess) ctx) names)) (fun full -> ((fun subject -> ((fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((((v_auditCompare "check-lib") subject) (v_checkSignatureOf summary)) (v_checkSignatureOf full)))) (fun compared -> (match compared with
  | Base_dDiag.C_Check_ErrC (dtb__211) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__211)))
  | Base_dDiag.C_Check_OkC (dtb__212) -> ((((((v_checkAndShadow nFs) nClock) nEnv) nProcess) ctx) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) summary))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line ("iface-audit subject=check-lib entry=" ^ subject)) else 0))) (v_joinLines names)))))))

# 2354 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkUncachedLib = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (v_elabFullRequested nEnv)) (fun full -> (if full then ((((((v_fullCheckLib nFs) nClock) nEnv) nProcess) ctx) names) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_summaryClosureMods nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (v_ifaceAuditRequested nEnv)) (fun audit -> (if audit then ((((((((((v_auditCheckLib nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) mods) names) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((((((v_summaryCheckLibParts nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) mods) names)) (fun summary -> (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) (B_dData_dMaybe.C_Maybe_Just (mods))) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) summary)))))))))))))

# 2431 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitNodeSchema = "vuna-split-node 2"

# 2437 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitCacheCodec = "split-files 2"

# 2441 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitBlobTag = (fun (nFs : string) (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Loader_dFingerprint.v_cacheTagEff nFs) nEnv)) (fun tag -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (String.concat "" [v_splitNodeSchema; "/"; tag])))))

# 2448 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitModsOf = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_contextSources nFs) ctx) entry)) (fun sources -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_depIdentitiesEff nFs) nEnv) nProcess) ctx)) (fun deps -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_compilerFingerprint nFs) nEnv)) (fun fp -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_depIfacesOf nFs) nClock) nEnv) nProcess) ctx)) (fun ifaces -> ((fun srcHash -> ((fun verHash -> ((fun prHash -> ((fun mode -> ((fun kind -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (((((((v_checkModsOf (Frontend_dPackages_dPkg.v_contextPackageName ctx)) kind) "") (v_hashText srcHash)) (v_depIdentitiesHash deps)) (v_hashText (verHash + prHash))) (v_releaseFlagOf ctx)))) (String.concat "" [mode; ":"; (if printResult then "pr1" else "pr0")]))) (match ifaces with
  | B_dData_dMaybe.C_Maybe_Just (dtb__213) -> "s"
  | B_dData_dMaybe.C_Maybe_Nothing -> "f"
  | _ -> failwith "DT: impossible branch"
))) (if printResult then 1 else 0))) ((v_textHash (v_splitNodeSchema ^ Base_dVersion.v_vunaVersion)) + fp))) ((v_closureHashOf sources) 0)))))))))))

# 2470 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitBlobPath = (fun (nFs : string) (nEnv : string) (nProcess : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_cacheBase nFs) nEnv) nProcess)) (fun base -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (String.concat "" [base; "/blobs/"; digest])))))

# 2478 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeSplitBlobAt = (fun (nFs : string) (nEnv : string) (nProcess : string) (digest : string) (files : Driver_dSplit.t_SplitFile B_dData_dList.t_List) -> ((fun payload -> ((fun contentDigest -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_splitBlobTag nFs) nEnv)) (fun tag -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_splitBlobPath nFs) nEnv) nProcess) digest)) (fun path -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_cacheBase nFs) nEnv) nProcess)) (fun base -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Base_dStore.v_storeEnsureDirEff nFs) nProcess) (base ^ "/blobs"))) (fun _u -> ((((((Base_dStore.v_storeWriteIfChangedAsEff nFs) tag) v_splitCacheCodec) contentDigest) path) payload)))))))))) (Driver_dIface.v_payloadDigest payload))) ((Base_dBytes.v_encTop Driver_dSplit.v_encSplitFiles) files)))

# 2493 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitInOf = (fun (m : t_CheckMods) -> (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ ("split", (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmPkg, (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmKind, (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmManifest, (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmSources, (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmDeps, (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmVer, (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmFlags, B_dData_dList.C_List_Nil))))))))))))))))))

# 2504 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitPtrKind = "splitptr"

# 2507 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitPtrCodec = "split-pointer 1"

# 2510 "Vuna/Compiler/Driver/Compile.vuna"
let v_readSplitPointer = (fun (nFs : string) (nEnv : string) (nProcess : string) (fast : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((Base_dStore.v_storeObjectReadEff nFs) nEnv) nProcess) v_splitPtrKind) v_splitPtrCodec) fast)) (fun saved -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match saved with
  | B_dData_dMaybe.C_Maybe_Just (dtb__214) -> (if (dtb__214 = "") then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb__214)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))

# 2520 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeSplitPointer = (fun (nFs : string) (nEnv : string) (nProcess : string) (fast : string) (sem : string) -> (((((((Base_dStore.v_storeObjectWriteEff nFs) nEnv) nProcess) v_splitPtrKind) v_splitPtrCodec) fast) sem))

# 2523 "Vuna/Compiler/Driver/Compile.vuna"
let v_defLocLine = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (p : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (String.concat "" [(B_dData_dPair.v_firstOf p); "|"; ((v_dropPrefixMeta ((Frontend_dPackages_dPkg.v_contextDir ctx) ^ "/")) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf p))); "|"; (bi_strFromInt (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf p)))]))

# 2529 "Vuna/Compiler/Driver/Compile.vuna"
let v_layoutDigestOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (modules : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ ("split-layout", ((B_dData_dList.v_concatMap (fun (m : Driver_dIface.t_ModuleIface) -> ((B_dData_dList.v_map (fun (p : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (String.concat "" [(Driver_dIface.v_miNameOf m); "|"; ((v_defLocLine ctx) p)]))) (Driver_dIface.v_miDefLocsOf m)))) (Driver_dIface.v_sortModuleIfaces modules))))))

# 2534 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitIdentityOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (printResult : bool) (tag : string) (modules : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> ((fun pkg -> ((fun pr -> (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ ("split-identity", (B_dData_dList.C_List__x58__x58_ (v_splitNodeSchema, (B_dData_dList.C_List__x58__x58_ (pkg, (B_dData_dList.C_List__x58__x58_ (pr, (B_dData_dList.C_List__x58__x58_ (((Driver_dIface.v_pkgIfaceHashOfModules pkg) modules), (B_dData_dList.C_List__x58__x58_ (((Driver_dIface.v_pkgImplHashOfModules pkg) modules), (B_dData_dList.C_List__x58__x58_ (((v_layoutDigestOf ctx) modules), (B_dData_dList.C_List__x58__x58_ (tag, B_dData_dList.C_List_Nil)))))))))))))))))) (if printResult then "1" else "0"))) (Frontend_dPackages_dPkg.v_contextPackageName ctx)))

# 293 "Vuna/Compiler/Driver/Compile.vuna"
let v_auditCompile = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((v_splitModsOf nFs) nClock) nEnv) nProcess) ctx) entry) printResult)) (fun mods -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_summaryClosureMods nFs) nClock) nEnv) nProcess) ctx)) (fun closureMods -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((((v_summarySplitParts nFs) nConsole) nClock) nEnv) nProcess) ctx) closureMods) entry) printResult)) (fun summary -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((Driver_dDt.v_dtSplitProjectParts nFs) nConsole) nEnv) nProcess) ctx) entry) printResult)) (fun full -> ((fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((((v_auditCompare "compile") entry) (v_splitSignatureOf summary)) (v_splitSignatureOf full)))) (fun compared -> (match compared with
  | Base_dDiag.C_Check_ErrC (dtb__215) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__215)))
  | Base_dDiag.C_Check_OkC (dtb__216) -> (match summary with
  | Base_dDiag.C_Check_ErrC (dtb__217) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__217)))
  | Base_dDiag.C_Check_OkC (dtb__218) -> ((fun files -> ((fun checked -> ((fun canon -> ((fun fast -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((v_writeIfaceShadowWith nFs) nClock) nEnv) nProcess) ctx) checked) (B_dData_dMaybe.C_Maybe_Just (closureMods)))) (fun shadow -> (match shadow with
  | Base_dDiag.C_Check_ErrC (dtb__219) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__219)))
  | Base_dDiag.C_Check_OkC (dtb__220) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Loader_dFingerprint.v_cacheTagEff nFs) nEnv)) (fun tag -> ((fun sem -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_writeSplitBlobAt nFs) nEnv) nProcess) sem) canon)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_writeSplitPointer nFs) nEnv) nProcess) fast) sem)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_rootKeepEff nFs) nEnv) nProcess) ctx) (B_dData_dList.C_List__x58__x58_ (fast, (B_dData_dList.C_List__x58__x58_ (sem, B_dData_dList.C_List_Nil)))))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_writeCompiledNormalized nFs) nEnv) nProcess) ctx) outDir) canon)) (fun n -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match n with
  | Base_dDiag.C_Check_ErrC (dtb__221) -> (Base_dDiag.C_Check_ErrC (dtb__221))
  | Base_dDiag.C_Check_OkC (dtb__222) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__222; B_dData_dPair.f_Pair_second = (checked).Driver_dDt.f_CheckedPackage_checkedWarnings }))
  | _ -> failwith "DT: impossible branch"
))))))))))) (match dtb__220 with
  | B_dData_dList.C_List_Nil -> fast
  | _ -> ((((v_splitIdentityOf ctx) printResult) tag) dtb__220)
))))
  | _ -> failwith "DT: impossible branch"
)))) (v_splitInOf mods))) (Driver_dSplit.v_canonicalTopo files))) (B_dData_dPair.v_secondOf dtb__218))) (B_dData_dPair.v_firstOf dtb__218))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line ("iface-audit subject=compile entry=" ^ entry)) else 0)))))))))))

# 2547 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolchainIdEff = (fun (nFs : string) (nEnv : string) (nProcess : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_OCAML_ID")) (fun override -> (if (override <> "") then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) override) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_cacheBase nFs) nEnv) nProcess)) (fun base -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Base_dStore.v_storeEnsureDirEff nFs) nProcess) (base ^ "/.tmp"))) (fun _u -> ((fun path -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((B_dEffect_dProcess.v_processRunIn nProcess) ".") (B_dData_dList.C_List__x58__x58_ ("sh", (B_dData_dList.C_List__x58__x58_ ("-c", (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["ocamlopt -version > \""; path; "\" 2>/dev/null || true"]), B_dData_dList.C_List_Nil)))))))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun text -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (if ((B_dData_dString.v_trim text) = "") then "none" else (B_dData_dString.v_trim text))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) "none"))))))) (base ^ "/.tmp/ocamlopt-version"))))))))))

# 2571 "Vuna/Compiler/Driver/Compile.vuna"
let v_buildViewAddrOf = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((v_splitModsOf nFs) nClock) nEnv) nProcess) ctx) entry) printResult)) (fun mods -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_toolchainIdEff nFs) nEnv) nProcess)) (fun tool -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ ("view-bin", (B_dData_dList.C_List__x58__x58_ ((v_splitInOf mods), (B_dData_dList.C_List__x58__x58_ (tool, B_dData_dList.C_List_Nil)))))))))))))

# 2579 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkInOf = (fun (m : t_CheckMods) -> (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ ("check-outcome", (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmPkg, (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmKind, (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmManifest, (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmSources, (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmDeps, (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmVer, (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmFlags, B_dData_dList.C_List_Nil))))))))))))))))))

# 1766 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkViaGraph = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_CheckMods) (run : Base_dDiag.t_Diagnostic B_dData_dList.t_List Base_dDiag.t_Check B_dEffect_dCore.t_Eff) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (v_elabFullRequested nEnv)) (fun full -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (v_ifaceAuditRequested nEnv)) (fun audit -> (if (if full then true else audit) then run else ((fun dig -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((Base_dStore.v_storeObjectReadEff nFs) nEnv) nProcess) "check-outcome") Base_dDiag_dCodec.v_checkResultCodec) dig)) (fun payload -> (match payload with
  | B_dData_dMaybe.C_Maybe_Just (dtb__223) -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_runAndStore nFs) nEnv) nProcess) ctx) dig) run)
  | B_dData_dMaybe.C_Maybe_Just (dtb__224) -> (match dtb__224 with
  | Base_dDiag_dCodec.C_CheckOutcome_CheckFailed (dtb__225) -> ((fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dObs.v_obsCountEff "vuna.counter.cache.hit") 1)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (v_replayFailure ((B_dData_dList.v_map (v_resolveStoredDiag ctx)) dtb__225)))))) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=hit") else 0))
  | Base_dDiag_dCodec.C_CheckOutcome_CheckPassed (dtb__226) -> ((fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dObs.v_obsCountEff "vuna.counter.cache.hit") 1)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC (((B_dData_dList.v_map (v_resolveStoredDiag ctx)) dtb__226))))))) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=hit") else 0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Base_dDiag_dCodec.v_decCheckOutcome dtb__223))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_runAndStore nFs) nEnv) nProcess) ctx) dig) run)
  | _ -> failwith "DT: impossible branch"
)))) (v_checkInOf mods))))))))

# 1845 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkCachedExe = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_checkModsExe nFs) nEnv) nProcess) ctx) entry)) (fun mods -> (if wantWarnings then (((((((((v_checkUncachedExe nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) entry) else ((((((v_checkViaGraph nFs) nEnv) nProcess) ctx) mods) (((((((((v_checkUncachedExe nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) entry))))))

# 2345 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkCachedLib = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_checkModsLib nFs) nEnv) nProcess) ctx) names)) (fun mods -> (if wantWarnings then (((((((((v_checkUncachedLib nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) names) else ((((((v_checkViaGraph nFs) nEnv) nProcess) ctx) mods) (((((((((v_checkUncachedLib nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) names))))))

# 92 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkPackage = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (release : bool) (wantWarnings : bool) (pkg : Frontend_dPackages_dPkg.t_Package) -> ((fun ctx -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) (Frontend_dPackages_dPkg.v_packageEntry pkg))) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((((v_checkCachedExe nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) (Frontend_dPackages_dPkg.v_packageEntry pkg))) (fun exeR -> (match exeR with
  | Base_dDiag.C_Check_ErrC (dtb__227) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__227)))
  | Base_dDiag.C_Check_OkC (dtb__228) -> (match (Frontend_dPackages_dPkg.v_packageExports pkg) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC (dtb__228)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__229) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (v_elabFullRequested nEnv)) (fun full -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (if full then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) false) else (((((v_orderCoversEff nFs) nEnv) nProcess) ctx) dtb__229))) (fun covered -> (if covered then ((fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC (dtb__228)))) (if (dtp_debug_on 0) then (dtp_debug_line ("check-lib-skip covered=" ^ (bi_strFromInt (B_dData_dList.v_length dtb__229)))) else 0)) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((((v_checkCachedLib nFs) nClock) nEnv) nProcess) nExit) nArgs) false) ctx) dtb__229)) (fun libR -> (match libR with
  | Base_dDiag.C_Check_ErrC (dtb__230) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__230)))
  | Base_dDiag.C_Check_OkC (dtb__231) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append dtb__228) dtb__231))))
  | _ -> failwith "DT: impossible branch"
))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) else (match (Frontend_dPackages_dPkg.v_packageExports pkg) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((((Base_dDiagnostics_dPkg.v_pkgAt1 ((Frontend_dPackages_dPkg.v_packageDir pkg) ^ "/vuna.toml")) 1) (Base_dDiagnostics_dPkg.C_PkgErr_LibraryWithoutEntry ((Frontend_dPackages_dPkg.v_packageName pkg)))) (Frontend_dPackages_dPkg.v_packageName pkg)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__232) -> (((((((((v_checkCachedLib nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) dtb__232)
  | _ -> failwith "DT: impossible branch"
))))) ((Frontend_dPackages_dPkg.v_contextWithRelease release) (Frontend_dPackages_dPkg.v_packageContext pkg))))

# 2586 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeSplitBlob = (fun (nFs : string) (nEnv : string) (nProcess : string) (files : Driver_dSplit.t_SplitFile B_dData_dList.t_List) -> ((fun payload -> ((fun digest -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_splitBlobTag nFs) nEnv)) (fun tag -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_splitBlobPath nFs) nEnv) nProcess) digest)) (fun path -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_cacheBase nFs) nEnv) nProcess)) (fun base -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Base_dStore.v_storeEnsureDirEff nFs) nProcess) (base ^ "/blobs"))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((Base_dStore.v_storeWriteIfChangedAsEff nFs) tag) v_splitCacheCodec) digest) path) payload)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) digest)))))))))))) (Driver_dIface.v_payloadDigest payload))) ((Base_dBytes.v_encTop Driver_dSplit.v_encSplitFiles) files)))

# 2607 "Vuna/Compiler/Driver/Compile.vuna"
let v_readSplitBlob = (fun (nFs : string) (nEnv : string) (nProcess : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_splitBlobTag nFs) nEnv)) (fun tag -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_splitBlobPath nFs) nEnv) nProcess) digest)) (fun path -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((Base_dStore.v_storeReadEff nFs) tag) v_splitCacheCodec) path)) (fun payload -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match payload with
  | B_dData_dMaybe.C_Maybe_Just (dtb__233) -> (Driver_dSplit.v_decSplitFilesComplete dtb__233)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))))))

# 237 "Vuna/Compiler/Driver/Compile.vuna"
let v_rebuildSplit = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) (fast : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_summaryClosureMods nFs) nClock) nEnv) nProcess) ctx)) (fun closureMods -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((((v_summarySplitParts nFs) nConsole) nClock) nEnv) nProcess) ctx) closureMods) entry) printResult)) (fun summary -> (match summary with
  | Base_dDiag.C_Check_ErrC (dtb__234) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__234)))
  | Base_dDiag.C_Check_OkC (dtb__235) -> ((fun canon -> ((fun checked -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((v_writeIfaceShadowWith nFs) nClock) nEnv) nProcess) ctx) checked) (B_dData_dMaybe.C_Maybe_Just (closureMods)))) (fun shadow -> (match shadow with
  | Base_dDiag.C_Check_ErrC (dtb__236) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__236)))
  | Base_dDiag.C_Check_OkC (dtb__237) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Loader_dFingerprint.v_cacheTagEff nFs) nEnv)) (fun tag -> ((fun sem -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_readSplitBlob nFs) nEnv) nProcess) sem)) (fun cached -> (match cached with
  | B_dData_dMaybe.C_Maybe_Just (dtb__238) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_writeSplitPointer nFs) nEnv) nProcess) fast) sem)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_rootKeepEff nFs) nEnv) nProcess) ctx) (B_dData_dList.C_List__x58__x58_ (fast, (B_dData_dList.C_List__x58__x58_ (sem, B_dData_dList.C_List_Nil)))))) (fun _u -> ((fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_writeCompiledNormalized nFs) nEnv) nProcess) ctx) outDir) dtb__238)) (fun n -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match n with
  | Base_dDiag.C_Check_ErrC (dtb__239) -> (Base_dDiag.C_Check_ErrC (dtb__239))
  | Base_dDiag.C_Check_OkC (dtb__240) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__240; B_dData_dPair.f_Pair_second = (checked).Driver_dDt.f_CheckedPackage_checkedWarnings }))
  | _ -> failwith "DT: impossible branch"
))))) (if (dtp_debug_on 0) then (dtp_debug_line "split-identity-hit cache-path=hit") else 0))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_writeSplitBlobAt nFs) nEnv) nProcess) sem) canon)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_writeSplitPointer nFs) nEnv) nProcess) fast) sem)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_rootKeepEff nFs) nEnv) nProcess) ctx) (B_dData_dList.C_List__x58__x58_ (fast, (B_dData_dList.C_List__x58__x58_ (sem, B_dData_dList.C_List_Nil)))))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_writeCompiledNormalized nFs) nEnv) nProcess) ctx) outDir) canon)) (fun n -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match n with
  | Base_dDiag.C_Check_ErrC (dtb__241) -> (Base_dDiag.C_Check_ErrC (dtb__241))
  | Base_dDiag.C_Check_OkC (dtb__242) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__242; B_dData_dPair.f_Pair_second = (checked).Driver_dDt.f_CheckedPackage_checkedWarnings }))
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> failwith "DT: impossible branch"
)))) (match dtb__237 with
  | B_dData_dList.C_List_Nil -> fast
  | _ -> ((((v_splitIdentityOf ctx) printResult) tag) dtb__237)
))))
  | _ -> failwith "DT: impossible branch"
)))) (B_dData_dPair.v_secondOf dtb__235))) (Driver_dSplit.v_canonicalTopo (B_dData_dPair.v_firstOf dtb__235)))
  | _ -> failwith "DT: impossible branch"
))))))

# 208 "Vuna/Compiler/Driver/Compile.vuna"
let v_compileToDirNormal = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((v_splitModsOf nFs) nClock) nEnv) nProcess) ctx) entry) printResult)) (fun mods -> ((fun fast -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_readSplitPointer nFs) nEnv) nProcess) fast)) (fun ptr -> (match ptr with
  | B_dData_dMaybe.C_Maybe_Just (dtb__243) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_readSplitBlob nFs) nEnv) nProcess) dtb__243)) (fun cached -> (match cached with
  | B_dData_dMaybe.C_Maybe_Just (dtb__244) -> ((fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_writeCompiledNormalized nFs) nEnv) nProcess) ctx) outDir) dtb__244)) (fun n -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match n with
  | Base_dDiag.C_Check_ErrC (dtb__245) -> (Base_dDiag.C_Check_ErrC (dtb__245))
  | Base_dDiag.C_Check_OkC (dtb__246) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__246; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | _ -> failwith "DT: impossible branch"
))))) (if (dtp_debug_on 0) then (dtp_debug_line "split-pointer-hit cache-path=hit") else 0))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((v_rebuildSplit nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) printResult) outDir) fast)
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((v_rebuildSplit nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) printResult) outDir) fast)
  | _ -> failwith "DT: impossible branch"
)))) (v_splitInOf mods)))))

# 164 "Vuna/Compiler/Driver/Compile.vuna"
let v_compileToDir = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (v_ifaceAuditRequested nEnv)) (fun audit -> (if audit then (((((((((v_auditCompile nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) printResult) outDir) else (((((((((v_compileToDirNormal nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) printResult) outDir)))))

# 410 "Vuna/Compiler/Driver/Compile.vuna"
let v_buildSplit = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (dir : string) (outDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Frontend_dPackages_dPkg.v_loadPackage nFs) nEnv) dir)) (fun pkgR -> (match pkgR with
  | Base_dDiag.C_Check_ErrC (dtb__247) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__247)))
  | Base_dDiag.C_Check_OkC (dtb__248) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((((v_compileToDir nFs) nConsole) nClock) nEnv) nProcess) (Frontend_dPackages_dPkg.v_packageContext dtb__248)) (Frontend_dPackages_dPkg.v_packageEntry dtb__248)) true) outDir)) (fun r -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match r with
  | Base_dDiag.C_Check_ErrC (dtb__249) -> (Base_dDiag.C_Check_ErrC (dtb__249))
  | Base_dDiag.C_Check_OkC (dtb__250) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb__250)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
