open Vuna_runtime
type t_PkgEntry = { f_PkgEntry_peName : string; f_PkgEntry_peDir : string; f_PkgEntry_peKey : string; f_PkgEntry_peEnv : string }
and t_ClosureMod = { f_ClosureMod_cmPkg : string; f_ClosureMod_cmPkgKey : string; f_ClosureMod_cmPkgEnv : string; f_ClosureMod_cmName : string; f_ClosureMod_cmPath : string; f_ClosureMod_cmSrc : string; f_ClosureMod_cmImports : string B_dData_dList.t_List; f_ClosureMod_cmAddr : string }
and t_ToolContext = { f_ToolContext_tcDepIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List; f_ToolContext_tcDepHashes : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_ToolContext_tcNeeded : string B_dData_dList.t_List; f_ToolContext_tcOwnNames : string B_dData_dList.t_List; f_ToolContext_tcStats : Driver_dIface.t_SourceInfo B_dData_dList.t_List }
and t_CheckMods = { f_CheckMods_cmPkg : string; f_CheckMods_cmKind : string; f_CheckMods_cmManifest : string; f_CheckMods_cmSources : string; f_CheckMods_cmDeps : string; f_CheckMods_cmVer : string; f_CheckMods_cmFlags : string }
and t_SplitInputs = { f_SplitInputs_siClosure : t_ClosureMod B_dData_dList.t_List; f_SplitInputs_siDepIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List B_dData_dMaybe.t_Maybe; f_SplitInputs_siMods : t_CheckMods }

# 59 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_mapEff = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (mc0 dtb__0)) (fun y -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_mapEff mc0) dtb__1)) (fun ys -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dList.C_List__x58__x58_ (y, ys)))))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_concatMapEff = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (mc0 dtb__2)) (fun xs -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_concatMapEff mc0) dtb__3)) (fun ys -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dData_dList.v_append xs) ys))))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_mapMaybeEff = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (mc0 dtb__4)) (fun y -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_mapMaybeEff mc0) dtb__5)) (fun ys -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match y with
  | B_dData_dMaybe.C_Maybe_Just (dtb__6) -> (B_dData_dList.C_List__x58__x58_ (dtb__6, ys))
  | B_dData_dMaybe.C_Maybe_Nothing -> ys
  | _ -> failwith "DT: impossible branch"
))))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 143 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_ensureDirPathFuel = (fun (nFs : string) (nProcess : string) (fuel : int) (path : string) -> (if (fuel <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0) else (if (if (if (path = "") then true else (path = ".")) then true else (path = "/")) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_ensureDirPathFuel nFs) nProcess) (fuel - 1)) (Base_dSource.v_parentOfPath path))) (fun _u -> ((B_dEffect_dFs.v_fsMakeDir nFs) path)))))))))

# 140 "Vuna/Compiler/Driver/Compile.vuna"
let v_ensureDirPath = (fun (nFs : string) (nProcess : string) (path : string) -> ((((v_ensureDirPathFuel nFs) nProcess) 256) path))

# 182 "Vuna/Compiler/Driver/Compile.vuna"
let v_modHashPair = (fun (m : t_ClosureMod) -> { B_dData_dPair.f_Pair_first = (m).f_ClosureMod_cmName; B_dData_dPair.f_Pair_second = (m).f_ClosureMod_cmAddr })

# 196 "Vuna/Compiler/Driver/Compile.vuna"
let v_summarySplitParts = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (entry : string) (printResult : bool) -> (let modIds = ((B_dData_dList.v_map v_modHashPair) mods) in (match depIfaces with
  | B_dData_dMaybe.C_Maybe_Just (dtb__7) -> (((((((((Driver_dDt.v_dtSplitProjectWithIfaces nFs) nConsole) nEnv) nProcess) ctx) entry) printResult) modIds) dtb__7)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((Driver_dDt.v_dtSplitProjectParts nFs) nConsole) nEnv) nProcess) ctx) entry) printResult) modIds)
  | _ -> failwith "DT: impossible branch"
)))

# 348 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeFileIfChanged = (fun (nFs : string) (path : string) (content : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun old -> (if (old = content) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0) else (((B_dEffect_dFs.v_fsWriteFile nFs) path) content)))) else (((B_dEffect_dFs.v_fsWriteFile nFs) path) content)))))

# 391 "Vuna/Compiler/Driver/Compile.vuna"
let v_copyFfiFiles = (fun (nFs : string) (nProcess : string) (ctxDir : string) (outDir : string) -> (let ffiDir = (ctxDir ^ "/ffi") in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) ffiDir)) (fun exists -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if exists then ((B_dEffect_dFs.v_fsIsDirectory nFs) ffiDir) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false))) (fun isDir -> (if (if exists then isDir else false) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadDir nFs) ffiDir)) (fun names -> (let cs = ((B_dData_dList.v_filter (fun (n : string) -> ((B_dData_dString.v_endsWith ".c") n))) names) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_ensureDirPath nFs) nProcess) (outDir ^ "/ffi"))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_mapEff (fun (n : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) (String.concat "" [ffiDir; "/"; ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) n)]))) (fun content -> (((B_dEffect_dFs.v_fsWriteFile nFs) (String.concat "" [outDir; "/ffi/"; ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) n)])) content))))) cs)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dData_dList.v_map (fun (n : string) -> ("ffi/" ^ ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) n)))) cs))))))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil))))))))

# 441 "Vuna/Compiler/Driver/Compile.vuna"
let v_metaSchema = 1

# 444 "Vuna/Compiler/Driver/Compile.vuna"
let v_metaFileName = "build-meta.json"

# 448 "Vuna/Compiler/Driver/Compile.vuna"
let v_textHash = (fun (s : string) -> (Base_dHash.v_contentKey s))

# 454 "Vuna/Compiler/Driver/Compile.vuna"
let v_compilerFingerprint = (fun (nFs : string) (nEnv : string) -> ((Loader_dFingerprint.v_compilerFingerprintEff nFs) nEnv))

# 459 "Vuna/Compiler/Driver/Compile.vuna"
let v_cacheBase = (fun (nFs : string) (nEnv : string) (nProcess : string) -> (((Base_dStore.v_storeRootReadyEff nFs) nEnv) nProcess))

# 464 "Vuna/Compiler/Driver/Compile.vuna"
let v_collectVunaMeta = (fun (nFs : string) (dir : string) -> ((((Base_dWalk.v_collectFilesEff nFs) Frontend_dPackages_dSource.v_skipSourceDir) (fun (name : string) -> ((B_dData_dString.v_endsWith ".vuna") name))) dir))

# 467 "Vuna/Compiler/Driver/Compile.vuna"
let v_dropPrefixMeta = (fun (prefix : string) (s : string) -> (if ((B_dData_dString.v_startsWith prefix) s) then (((B_dData_dString.v_substring (B_dData_dString.v_byteLength prefix)) (bi_natSub (B_dData_dString.v_byteLength s) (B_dData_dString.v_byteLength prefix))) s) else s))

# 477 "Vuna/Compiler/Driver/Compile.vuna"
let v_slashToDot = (fun (c : int) -> (if (c = 47) then 46 else c))

# 474 "Vuna/Compiler/Driver/Compile.vuna"
let v_slashesToDots = (fun (s : string) -> (B_dData_dList.dtp_pack ((B_dData_dList.v_map v_slashToDot) (B_dData_dList.dtp_unpack s))))

# 480 "Vuna/Compiler/Driver/Compile.vuna"
let v_moduleNameOfPath = (fun (rootPath : string) (path : string) -> (let rel0 = ((v_dropPrefixMeta (rootPath ^ "/")) path) in (let rel = (if ((B_dData_dString.v_endsWith ".vuna") rel0) then (((B_dData_dString.v_substring 0) (bi_natSub (B_dData_dString.v_byteLength rel0) 5)) rel0) else rel0) in (v_slashesToDots rel))))

# 487 "Vuna/Compiler/Driver/Compile.vuna"
let v_rootSources = (fun (nFs : string) (root : Frontend_dPackages_dPkg.t_Root) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_collectVunaMeta nFs) (Frontend_dPackages_dPkg.v_rootDir root))) (fun paths -> ((v_mapEff (fun (p : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) p)) (fun content -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = ((v_moduleNameOfPath (Frontend_dPackages_dPkg.v_rootDir root)) p); B_dData_dPair.f_Pair_second = (v_textHash content) }))))) paths))))

# 504 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_closureHashOf = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (match dtb__8 with
  | { B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = dtb__11 } -> ((v_closureHashOf dtb__9) ((mc1 * 1000003) + dtb__11))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 498 "Vuna/Compiler/Driver/Compile.vuna"
let v_rootHash = (fun (nFs : string) (root : Frontend_dPackages_dPkg.t_Root) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_rootSources nFs) root)) (fun sources -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_closureHashOf sources) 0)))))

# 509 "Vuna/Compiler/Driver/Compile.vuna"
let v_entrySource = (fun (nFs : string) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) entry)) (fun content -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = "<entry>"; B_dData_dPair.f_Pair_second = (v_textHash content) }))))

# 516 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownRootsOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> ((B_dData_dList.v_filter (fun (r : Frontend_dPackages_dPkg.t_Root) -> ((Frontend_dPackages_dPkg.v_rootName r) = (Frontend_dPackages_dPkg.v_contextPackageName ctx)))) (Frontend_dPackages_dPkg.v_contextRoots ctx)))

# 519 "Vuna/Compiler/Driver/Compile.vuna"
let v_contextSources = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_concatMapEff (v_rootSources nFs)) (v_ownRootsOf ctx))) (fun own -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_entrySource nFs) entry)) (fun es -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dData_dList.v_append own) (B_dData_dList.C_List__x58__x58_ (es, B_dData_dList.C_List_Nil)))))))))

# 527 "Vuna/Compiler/Driver/Compile.vuna"
let v_dependencyHashes = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match (Frontend_dPackages_dPkg.v_contextRoots ctx) with
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil)
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> ((v_mapEff (fun (r : Frontend_dPackages_dPkg.t_Root) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_rootHash nFs) r)) (fun h -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (Frontend_dPackages_dPkg.v_rootName r); B_dData_dPair.f_Pair_second = h }))))) dtb__13)
  | _ -> failwith "DT: impossible branch"
))

# 546 "Vuna/Compiler/Driver/Compile.vuna"
let v_compilerClosureModule = "Vuna.Compiler.Loader.Fingerprint"

# 573 "Vuna/Compiler/Driver/Compile.vuna"
let v_pkgIfaceSummaryKind = "pkg-iface"

# 576 "Vuna/Compiler/Driver/Compile.vuna"
let v_pkgIfaceSummaryCodec = "pkg-iface-summary 1"

# 579 "Vuna/Compiler/Driver/Compile.vuna"
let v_pkgIfaceSummaryKeyOf = (fun (pkg : string) (srcClosure : string) (tag : string) -> (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ ("pkg-iface", (B_dData_dList.C_List__x58__x58_ (pkg, (B_dData_dList.C_List__x58__x58_ (srcClosure, (B_dData_dList.C_List__x58__x58_ (tag, B_dData_dList.C_List_Nil))))))))))

# 583 "Vuna/Compiler/Driver/Compile.vuna"
let v_depRootIdentityEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (root : Frontend_dPackages_dPkg.t_Root) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_rootHash nFs) root)) (fun h -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Loader_dFingerprint.v_cacheTagEff nFs) nEnv)) (fun tag -> (let key = (((v_pkgIfaceSummaryKeyOf (Frontend_dPackages_dPkg.v_rootName root)) (bi_strFromInt h)) tag) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Base_dStore.v_storeObjectReadEff nFs) nEnv) nProcess) v_pkgIfaceSummaryKind) v_pkgIfaceSummaryCodec) key)) (fun saved -> (let verdict = (match saved with
  | B_dData_dMaybe.C_Maybe_Just (dtb__15) -> "iface"
  | B_dData_dMaybe.C_Maybe_Nothing -> "manifest"
  | _ -> failwith "DT: impossible branch"
) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") (String.concat "" ["dep-identity="; (Frontend_dPackages_dPkg.v_rootName root); " verdict="; verdict; " src="; (bi_strFromInt h)])) else 0) in (match saved with
  | B_dData_dMaybe.C_Maybe_Just (dtb__14) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (Frontend_dPackages_dPkg.v_rootName root); B_dData_dPair.f_Pair_second = ("iface:" ^ dtb__14) })
  | B_dData_dMaybe.C_Maybe_Nothing -> (let tomlPath = ((Frontend_dPackages_dPkg.v_rootDir root) ^ "/vuna.toml") in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) tomlPath)) (fun exists -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if exists then ((B_dEffect_dFs.v_fsReadFile nFs) tomlPath) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ""))) (fun toml -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (Frontend_dPackages_dPkg.v_rootName root); B_dData_dPair.f_Pair_second = (String.concat "" ["manifest:"; (bi_strFromInt (v_textHash toml)); ":"; (bi_strFromInt h)]) }))))))
  | _ -> failwith "DT: impossible branch"
)))))))))))

# 609 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIdentitiesEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match (Frontend_dPackages_dPkg.v_contextRoots ctx) with
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil)
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> ((v_mapEff (((v_depRootIdentityEff nFs) nEnv) nProcess)) dtb__17)
  | _ -> failwith "DT: impossible branch"
))

# 618 "Vuna/Compiler/Driver/Compile.vuna"
let v_pairText = (fun (p : (string, string) B_dData_dPair.t_Pair) -> (String.concat "" [(B_dData_dPair.v_firstOf p); "="; (B_dData_dPair.v_secondOf p)]))

# 615 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIdentitiesHash = (fun (pairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ ("dep-identities", ((B_dData_dList.v_map v_pairText) pairs)))))

# 550 "Vuna/Compiler/Driver/Compile.vuna"
let v_buildIdForEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_concatMapEff (v_rootSources nFs)) (v_ownRootsOf ctx))) (fun own -> (if ((B_dData_dList.v_memName v_compilerClosureModule) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) own)) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_depIdentitiesEff nFs) nEnv) nProcess) ctx)) (fun deps -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Loader_dFingerprint.v_compilerIdOf own) (v_depIdentitiesHash deps))))) else ((Loader_dFingerprint.v_compilerTagEff nFs) nEnv)))))

# 363 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeCompiledNormalized = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (outDir : string) (files : Driver_dSplit.t_SplitFile B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_ensureDirPath nFs) nProcess) outDir)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_buildIdForEff nFs) nEnv) nProcess) ctx)) (fun id -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_writeFileIfChanged nFs) (String.concat "" [outDir; "/"; Loader_dFingerprint.v_buildIdFileName])) (id ^ "\n"))) (fun _u -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") "write-compiled-start") else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Driver_dSplit.v_writeSplitFilesIfChanged nFs) outDir) files)) (fun written -> (match written with
  | Base_dDiag.C_Check_ErrC (dtb__18) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__18)))
  | Base_dDiag.C_Check_OkC (dtb__19) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") "write-split-files-done") else 0) in (let graph = (Driver_dSplit.v_splitGraph files) in (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") "split-graph-done") else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_copyFfiFiles nFs) nProcess) (Frontend_dPackages_dPkg.v_contextDir ctx)) outDir)) (fun cFiles -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dFs.v_fsWriteFile nFs) (outDir ^ "/build.sh")) ((Driver_dSplit.v_buildScript graph) cFiles))) (fun _u -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") "build-script-done") else 0) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dtb__19)))))))))))
  | _ -> failwith "DT: impossible branch"
)))))))))))

# 622 "Vuna/Compiler/Driver/Compile.vuna"
let v_writePkgIfaceSummaryEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (modules : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match ((B_dData_dList.v_filter (fun (r : Frontend_dPackages_dPkg.t_Root) -> ((Frontend_dPackages_dPkg.v_rootName r) = (Frontend_dPackages_dPkg.v_contextPackageName ctx)))) (Frontend_dPackages_dPkg.v_contextRoots ctx)) with
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0)
  | B_dData_dList.C_List__x58__x58_ (dtb__20, dtb__21) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_rootHash nFs) dtb__20)) (fun h -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Loader_dFingerprint.v_cacheTagEff nFs) nEnv)) (fun tag -> (let key = (((v_pkgIfaceSummaryKeyOf (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (bi_strFromInt h)) tag) in (let payload = ((Driver_dIface.v_pkgIfaceHashOfModules (Frontend_dPackages_dPkg.v_contextPackageName ctx)) modules) in (((((((Base_dStore.v_storeObjectWriteEff nFs) nEnv) nProcess) v_pkgIfaceSummaryKind) v_pkgIfaceSummaryCodec) key) payload)))))))
  | _ -> failwith "DT: impossible branch"
))

# 635 "Vuna/Compiler/Driver/Compile.vuna"
let v_metaPairText = (fun (mc0 : (string, int) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__22; B_dData_dPair.f_Pair_second = dtb__23 } -> (String.concat "" ["{\"name\":\""; dtb__22; "\",\"hash\":"; (bi_strFromInt dtb__23); "}"])
  | _ -> failwith "DT: impossible branch"
))

# 638 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_joinJsonList = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__24, dtb__25) -> (match dtb__25 with
  | B_dData_dList.C_List_Nil -> dtb__24
  | _ -> (String.concat "" [dtb__24; ","; (v_joinJsonList dtb__25)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 645 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_lastSegmentRev = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__26, dtb__27) -> (if (dtb__26 = 47) then (B_dData_dList.dtp_pack mc1) else ((v_lastSegmentRev dtb__27) (B_dData_dList.C_List__x58__x58_ (dtb__26, mc1))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.dtp_pack mc1)
  | _ -> failwith "DT: impossible branch"
))

# 649 "Vuna/Compiler/Driver/Compile.vuna"
let v_lastSegment = (fun (path : string) -> ((v_lastSegmentRev (B_dData_dList.v_reverse (B_dData_dList.dtp_unpack path))) B_dData_dList.C_List_Nil))

# 664 "Vuna/Compiler/Driver/Compile.vuna"
let v_metaPathOf = (fun (outDir : string) -> (String.concat "" [outDir; "/"; v_metaFileName]))

# 693 "Vuna/Compiler/Driver/Compile.vuna"
let v_runBuildScript = (fun (nProcess : string) (dir : string) (out : string) (name : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dProcess.v_processRunIn nProcess) dir) (B_dData_dList.C_List__x58__x58_ ("sh", (B_dData_dList.C_List__x58__x58_ ("build.sh", (B_dData_dList.C_List__x58__x58_ (out, B_dData_dList.C_List_Nil)))))))) (fun code -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if (code = 0) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_err (String.concat "" ["build: "; name; ": sh build.sh "; out; " failed in "; dir; " (exit "; (bi_strFromInt code); ")"])))))))

# 703 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkNodeSchema = "vuna-check-node 3"

# 706 "Vuna/Compiler/Driver/Compile.vuna"
let v_hashText = (fun (n : int) -> (bi_strFromInt n))

# 717 "Vuna/Compiler/Driver/Compile.vuna"
let v_maybeSemanticText = (fun (mc0 : string B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__28) -> dtb__28
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 721 "Vuna/Compiler/Driver/Compile.vuna"
let v_depSourceText = (fun (mc0 : Frontend_dManifest.t_DependencySource) -> (match mc0 with
  | Frontend_dManifest.C_DependencySource_DepUrl (dtb__29) -> ("url:" ^ dtb__29)
  | Frontend_dManifest.C_DependencySource_DepGit (dtb__30, dtb__31) -> (String.concat "" ["git:"; dtb__30; "@"; dtb__31])
  | Frontend_dManifest.C_DependencySource_DepPath (dtb__32) -> ("path:" ^ dtb__32)
  | _ -> failwith "DT: impossible branch"
))

# 726 "Vuna/Compiler/Driver/Compile.vuna"
let v_depSemanticText = (fun (d : Frontend_dManifest.t_Dependency) -> (String.concat "" [(d).Frontend_dManifest.f_Dependency_depAlias; "|"; (v_depSourceText (d).Frontend_dManifest.f_Dependency_depSource); "|"; (v_maybeSemanticText (d).Frontend_dManifest.f_Dependency_depHash); "|"; (v_maybeSemanticText (d).Frontend_dManifest.f_Dependency_depIdentity)]))

# 730 "Vuna/Compiler/Driver/Compile.vuna"
let v_manifestSemanticText = (fun (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__33) -> (let man = (dtb__33).Frontend_dPackages_dPkg.f_Package_packageManifest in (let exportsText = (match (man).Frontend_dManifest.f_Manifest_manifestExports with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb__34) -> ((B_dData_dString.v_join ",") dtb__34)
  | _ -> failwith "DT: impossible branch"
) in ((B_dData_dString.v_join "\n") (B_dData_dList.C_List__x58__x58_ (("name:" ^ (v_maybeSemanticText (man).Frontend_dManifest.f_Manifest_manifestName)), (B_dData_dList.C_List__x58__x58_ (("exports:" ^ exportsText), ((B_dData_dList.v_map v_depSemanticText) (man).Frontend_dManifest.f_Manifest_manifestDependencies))))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 652 "Vuna/Compiler/Driver/Compile.vuna"
let v_buildMetaText = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (linked : bool) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_contextSources nFs) ctx) entry)) (fun sources -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_dependencyHashes nFs) ctx)) (fun deps -> (let manifestHash = (v_textHash (v_manifestSemanticText (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage)) in (let entryName = (v_lastSegment entry) in (let linkedText = (if linked then "true" else "false") in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (String.concat "" ["{\"schema\":"; (bi_strFromInt v_metaSchema); ",\"compiler\":\""; Base_dVersion.v_vunaVersion; "\",\"package\":\""; (Frontend_dPackages_dPkg.v_contextPackageName ctx); "\",\"entry\":\""; entryName; "\",\"linked\":"; linkedText; ",\"closure\":"; (bi_strFromInt ((v_closureHashOf sources) 0)); ",\"manifest\":"; (bi_strFromInt manifestHash); ",\"sources\":["; (v_joinJsonList ((B_dData_dList.v_map v_metaPairText) sources)); "],\"dependencies\":["; (v_joinJsonList ((B_dData_dList.v_map v_metaPairText) deps)); "]}\n"]))))))))))

# 667 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeBuildMeta = (fun (nFs : string) (outDir : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (linked : bool) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_buildMetaText nFs) ctx) entry) linked)) (fun text -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dFs.v_fsWriteFile nFs) (v_metaPathOf outDir)) text)) (fun n -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) n))))))

# 675 "Vuna/Compiler/Driver/Compile.vuna"
let v_metaUpToDate = (fun (nFs : string) (outDir : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (binPath : string) -> (let path = (v_metaPathOf outDir) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if exists then ((B_dEffect_dFs.v_fsFileExists nFs) binPath) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false))) (fun binExists -> (if (if exists then binExists else false) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun raw -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_buildMetaText nFs) ctx) entry) true)) (fun expected -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (raw = expected)))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false))))))))

# 744 "Vuna/Compiler/Driver/Compile.vuna"
let v_releaseFlagOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (if (Frontend_dPackages_dPkg.v_contextRelease ctx) then "release" else "debug"))

# 789 "Vuna/Compiler/Driver/Compile.vuna"
let v_depPackagesOf = (fun (mc0 : Frontend_dPackages_dPkg.t_Package) -> (match mc0 with
  | { Frontend_dPackages_dPkg.f_Package_packageManifest = dtb__35; Frontend_dPackages_dPkg.f_Package_packageDependencies = dtb__36; Frontend_dPackages_dPkg.f_Package_packageDir = dtb__37 } -> dtb__36
  | _ -> failwith "DT: impossible branch"
))

# 777 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_collectDepPackages = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (if ((B_dData_dList.v_memName (Frontend_dPackages_dPkg.v_packageName dtb__38)) mc0) then ((v_collectDepPackages mc0) dtb__39) else (match ((v_collectDepPackages (B_dData_dList.C_List__x58__x58_ ((Frontend_dPackages_dPkg.v_packageName dtb__38), mc0))) (v_depPackagesOf dtb__38)) with
  | { B_dData_dPair.f_Pair_first = dtb__40; B_dData_dPair.f_Pair_second = dtb__41 } -> (match ((v_collectDepPackages dtb__40) dtb__39) with
  | { B_dData_dPair.f_Pair_first = dtb__42; B_dData_dPair.f_Pair_second = dtb__43 } -> { B_dData_dPair.f_Pair_first = dtb__42; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__41) (B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__43))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 795 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_allNamesIn = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__44, dtb__45) -> (if ((B_dData_dList.v_memName dtb__44) mc1) then ((v_allNamesIn dtb__45) mc1) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 792 "Vuna/Compiler/Driver/Compile.vuna"
let v_sameNameSet = (fun (a : string B_dData_dList.t_List) (b : string B_dData_dList.t_List) -> (if (if ((B_dData_dList.v_length a) = (B_dData_dList.v_length b)) then ((v_allNamesIn a) b) else false) then ((v_allNamesIn b) a) else false))

# 806 "Vuna/Compiler/Driver/Compile.vuna"
let v_depPackageList = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__46) -> (B_dData_dPair.v_secondOf ((v_collectDepPackages B_dData_dList.C_List_Nil) (dtb__46).Frontend_dPackages_dPkg.f_Package_packageDependencies))
  | _ -> failwith "DT: impossible branch"
))

# 812 "Vuna/Compiler/Driver/Compile.vuna"
let v_depPackageCount = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (B_dData_dList.v_length (v_depPackageList ctx)))

# 824 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceObjectCodec = "module-iface 5"

# 849 "Vuna/Compiler/Driver/Compile.vuna"
let v_pkgKeyOf = (fun (name : string) -> (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ ("pkg", (B_dData_dList.C_List__x58__x58_ (name, B_dData_dList.C_List_Nil))))))

# 868 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_findPkgEntry = (fun (mc0 : string) (mc1 : t_PkgEntry B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__47, dtb__48) -> (if ((dtb__47).f_PkgEntry_peName = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__47)) else ((v_findPkgEntry mc0) dtb__48))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 872 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_findClosureMod = (fun (mc0 : string) (mc1 : t_ClosureMod B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__49, dtb__50) -> (if ((dtb__49).f_ClosureMod_cmName = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__49)) else ((v_findClosureMod mc0) dtb__50))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 898 "Vuna/Compiler/Driver/Compile.vuna"
let v_closureModOf = (fun (nFs : string) (nEnv : string) (nProcess : string) (pe : t_PkgEntry) (root : string) (p : string) (raw : string) -> (let name = ((v_moduleNameOfPath root) p) in (let src = (Base_dHash.v_contentAddress raw) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Loader_dHeader.v_headerImportsEff nFs) nEnv) nProcess) p) src) raw)) (fun imports -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { f_ClosureMod_cmPkg = (pe).f_PkgEntry_peName; f_ClosureMod_cmPkgKey = (pe).f_PkgEntry_peKey; f_ClosureMod_cmPkgEnv = (pe).f_PkgEntry_peEnv; f_ClosureMod_cmName = name; f_ClosureMod_cmPath = p; f_ClosureMod_cmSrc = src; f_ClosureMod_cmImports = imports; f_ClosureMod_cmAddr = "" }))))))

# 878 "Vuna/Compiler/Driver/Compile.vuna"
let v_closureModsEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (pkgs : t_PkgEntry B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_mapEff (fun (r : Frontend_dPackages_dPkg.t_Root) -> (match ((v_findPkgEntry (Frontend_dPackages_dPkg.v_rootName r)) pkgs) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil)
  | B_dData_dMaybe.C_Maybe_Just (dtb__51) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_collectVunaMeta nFs) (Frontend_dPackages_dPkg.v_rootDir r))) (fun paths -> ((v_mapEff (fun (p : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) p)) (fun raw -> (((((((v_closureModOf nFs) nEnv) nProcess) dtb__51) (Frontend_dPackages_dPkg.v_rootDir r)) p) raw))))) paths)))
  | _ -> failwith "DT: impossible branch"
))) (Frontend_dPackages_dPkg.v_contextRoots ctx))) (fun per -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dData_dList.v_concatMap (fun (xs : t_ClosureMod B_dData_dList.t_List) -> xs)) per)))))

# 912 "Vuna/Compiler/Driver/Compile.vuna"
let v_appendPrelude = (fun (hasPrelude : bool) (m : t_ClosureMod) -> (if (if (if hasPrelude then ((m).f_ClosureMod_cmName <> "Prelude") else false) then (B_dData_dBool.v_not ((B_dData_dList.v_memName "Prelude") (m).f_ClosureMod_cmImports)) else false) then { f_ClosureMod_cmPkg = (m).f_ClosureMod_cmPkg; f_ClosureMod_cmPkgKey = (m).f_ClosureMod_cmPkgKey; f_ClosureMod_cmPkgEnv = (m).f_ClosureMod_cmPkgEnv; f_ClosureMod_cmName = (m).f_ClosureMod_cmName; f_ClosureMod_cmPath = (m).f_ClosureMod_cmPath; f_ClosureMod_cmSrc = (m).f_ClosureMod_cmSrc; f_ClosureMod_cmImports = ((B_dData_dList.v_append (m).f_ClosureMod_cmImports) (B_dData_dList.C_List__x58__x58_ ("Prelude", B_dData_dList.C_List_Nil))); f_ClosureMod_cmAddr = "" } else m))

# 927 "Vuna/Compiler/Driver/Compile.vuna"
let v_modGraphEntry = (fun (m : t_ClosureMod) -> { B_dData_dPair.f_Pair_first = (m).f_ClosureMod_cmName; B_dData_dPair.f_Pair_second = (m).f_ClosureMod_cmImports })

# 930 "Vuna/Compiler/Driver/Compile.vuna"
let v_modNameOf = (fun (m : t_ClosureMod) -> (m).f_ClosureMod_cmName)

# 933 "Vuna/Compiler/Driver/Compile.vuna"
let v_isDepModOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (m : t_ClosureMod) -> ((m).f_ClosureMod_cmPkg <> (Frontend_dPackages_dPkg.v_contextPackageName ctx)))

# 936 "Vuna/Compiler/Driver/Compile.vuna"
let v_isSelfModOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (m : t_ClosureMod) -> ((m).f_ClosureMod_cmPkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx)))

# 939 "Vuna/Compiler/Driver/Compile.vuna"
let v_moduleGraphOf = (fun (mods : t_ClosureMod B_dData_dList.t_List) -> ((B_dData_dList.v_map v_modGraphEntry) mods))

# 951 "Vuna/Compiler/Driver/Compile.vuna"
let v_depSrcOf = (fun (tbl : (string, string) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__52) -> dtb__52
  | B_dData_dMaybe.C_Maybe_Nothing -> ("ext:" ^ name)
  | _ -> failwith "DT: impossible branch"
))

# 961 "Vuna/Compiler/Driver/Compile.vuna"
let v_srcPairOf = (fun (m : t_ClosureMod) -> { B_dData_dPair.f_Pair_first = (v_modNameOf m); B_dData_dPair.f_Pair_second = (String.concat "" [(m).f_ClosureMod_cmPkgKey; "|"; (m).f_ClosureMod_cmSrc]) })

# 958 "Vuna/Compiler/Driver/Compile.vuna"
let v_srcTblOf = (fun (mods : t_ClosureMod B_dData_dList.t_List) -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map v_srcPairOf) mods)))

# 965 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceAddrOf = (fun (srcTbl : (string, string) B_dContainer_dHashMap.t_HashMap) (m : t_ClosureMod) -> (Loader_dAddr.v_addrOf ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ("module-iface", (B_dData_dList.C_List__x58__x58_ (v_ifaceObjectCodec, (B_dData_dList.C_List__x58__x58_ ((m).f_ClosureMod_cmPkgKey, (B_dData_dList.C_List__x58__x58_ ((m).f_ClosureMod_cmName, (B_dData_dList.C_List__x58__x58_ ((m).f_ClosureMod_cmSrc, (B_dData_dList.C_List__x58__x58_ ((m).f_ClosureMod_cmPkgEnv, B_dData_dList.C_List_Nil))))))))))))) ((B_dData_dList.v_map (v_depSrcOf srcTbl)) (m).f_ClosureMod_cmImports))))

# 970 "Vuna/Compiler/Driver/Compile.vuna"
let v_withAddr = (fun (srcTbl : (string, string) B_dContainer_dHashMap.t_HashMap) (m : t_ClosureMod) -> { f_ClosureMod_cmPkg = (m).f_ClosureMod_cmPkg; f_ClosureMod_cmPkgKey = (m).f_ClosureMod_cmPkgKey; f_ClosureMod_cmPkgEnv = (m).f_ClosureMod_cmPkgEnv; f_ClosureMod_cmName = (m).f_ClosureMod_cmName; f_ClosureMod_cmPath = (m).f_ClosureMod_cmPath; f_ClosureMod_cmSrc = (m).f_ClosureMod_cmSrc; f_ClosureMod_cmImports = (m).f_ClosureMod_cmImports; f_ClosureMod_cmAddr = ((v_ifaceAddrOf srcTbl) m) })

# 989 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceModsWithEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (pkgs : t_PkgEntry B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.iface.compute")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun ta -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_closureModsEff nFs) nEnv) nProcess) ctx) pkgs)) (fun mods0 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun tb -> (let hasPrelude = ((B_dData_dList.v_memName "Prelude") ((B_dData_dList.v_map v_modNameOf) mods0)) in (let mods = ((B_dData_dList.v_map (v_appendPrelude hasPrelude)) mods0) in (let srcTbl = (v_srcTblOf mods) in (let assigned = ((B_dData_dList.v_map (v_withAddr srcTbl)) mods) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") (String.concat "" ["iface-mods-phases n="; (bi_strFromInt (B_dData_dList.v_length mods)); " closure="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (tb - ta) / 1000)); "ms assign=direct"])) else 0))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.iface.compute")) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) assigned))))))))))))))))))

# 1064 "Vuna/Compiler/Driver/Compile.vuna"
let v_readIfaceAtEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (a : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Base_dStore.v_storeObjectReadEff nFs) nEnv) nProcess) "module-iface") v_ifaceObjectCodec) a)) (fun payload -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match payload with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__53) -> (Driver_dIface.v_decModuleIfaceComplete dtb__53)
  | _ -> failwith "DT: impossible branch"
)))))

# 1080 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_readIfaceListPartialEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (mc0 : t_ClosureMod B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__54, dtb__55) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_readIfaceAtEff nFs) nEnv) nProcess) (dtb__54).f_ClosureMod_cmAddr)) (fun mi -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_readIfaceListPartialEff nFs) nEnv) nProcess) dtb__55)) (fun xs -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match mi with
  | B_dData_dMaybe.C_Maybe_Nothing -> xs
  | B_dData_dMaybe.C_Maybe_Just (dtb__56) -> (B_dData_dList.C_List__x58__x58_ (dtb__56, xs))
  | _ -> failwith "DT: impossible branch"
))))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 1092 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_readIfaceListEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (mc0 : t_ClosureMod B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_readIfaceAtEff nFs) nEnv) nProcess) (dtb__57).f_ClosureMod_cmAddr)) (fun mi -> (match mi with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") (String.concat "" ["iface-miss "; (dtb__57).f_ClosureMod_cmName; " "; (dtb__57).f_ClosureMod_cmAddr; " pkg="; (dtb__57).f_ClosureMod_cmPkg; " src="; (dtb__57).f_ClosureMod_cmSrc])) else 0) in (let _u = (Base_dObs.v_obsMark (String.concat "" ["vuna.tool.iface.miss:"; (dtb__57).f_ClosureMod_cmName; ":"; (dtb__57).f_ClosureMod_cmAddr])) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dObs.v_obsCountEff "vuna.counter.cache.miss") 1)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing)))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__59) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dObs.v_obsCountEff "vuna.counter.cache.hit") 1)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_readIfaceListEff nFs) nEnv) nProcess) dtb__58)) (fun xs -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match xs with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__60) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__60))))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))

# 1116 "Vuna/Compiler/Driver/Compile.vuna"
let v_depModsOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> ((B_dData_dList.v_filter (v_isDepModOf ctx)) mods))

# 1119 "Vuna/Compiler/Driver/Compile.vuna"
let v_selfModsOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> ((B_dData_dList.v_filter (v_isSelfModOf ctx)) mods))

# 1154 "Vuna/Compiler/Driver/Compile.vuna"
let v_orderKind = "module-order"

# 1157 "Vuna/Compiler/Driver/Compile.vuna"
let v_orderCodec = "module-order 1"

# 1160 "Vuna/Compiler/Driver/Compile.vuna"
let v_encOrderNames = (fun (names : string B_dData_dList.t_List) -> ((Base_dBytes.v_encTop (Base_dBytes.v_encList Base_dBytes.v_encStr)) names))

# 1163 "Vuna/Compiler/Driver/Compile.vuna"
let v_decOrderNamesComplete = (fun (s : string) -> (let nd_uscrut1 = (((Base_dBytes.v_decList Base_dBytes.v_decStr) (bi_strLength s)) (Base_dBytes.v_curOf s)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__61) -> (match dtb__61 with
  | { B_dData_dPair.f_Pair_first = dtb__62; B_dData_dPair.f_Pair_second = dtb__63 } -> (if (Base_dBytes.v_curAtEnd dtb__63) then (B_dData_dMaybe.C_Maybe_Just (dtb__62)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 1169 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_rootOfName = (fun (mc0 : string) (mc1 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__64, dtb__65) -> (if ((Frontend_dPackages_dPkg.v_rootName dtb__64) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__64)) else ((v_rootOfName mc0) dtb__65))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1175 "Vuna/Compiler/Driver/Compile.vuna"
let v_orderKeyOfEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (root : Frontend_dPackages_dPkg.t_Root) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_rootHash nFs) root)) (fun h -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Loader_dFingerprint.v_cacheTagEff nFs) nEnv)) (fun tag -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ ("module-order", (B_dData_dList.C_List__x58__x58_ ((Frontend_dPackages_dPkg.v_rootName root), (B_dData_dList.C_List__x58__x58_ ((bi_strFromInt h), (B_dData_dList.C_List__x58__x58_ (tag, B_dData_dList.C_List_Nil)))))))))))))))

# 1183 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeOrderEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> (match ((v_rootOfName (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (Frontend_dPackages_dPkg.v_contextRoots ctx)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0)
  | B_dData_dMaybe.C_Maybe_Just (dtb__66) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_orderKeyOfEff nFs) nEnv) nProcess) dtb__66)) (fun key -> (((((((Base_dStore.v_storeObjectWriteEff nFs) nEnv) nProcess) v_orderKind) v_orderCodec) key) (v_encOrderNames names))))
  | _ -> failwith "DT: impossible branch"
))

# 1193 "Vuna/Compiler/Driver/Compile.vuna"
let v_readOrderEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (pkg : string) -> (match ((v_rootOfName pkg) (Frontend_dPackages_dPkg.v_contextRoots ctx)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Just (dtb__67) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_orderKeyOfEff nFs) nEnv) nProcess) dtb__67)) (fun key -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Base_dStore.v_storeObjectReadEff nFs) nEnv) nProcess) v_orderKind) v_orderCodec) key)) (fun payload -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match payload with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__68) -> (v_decOrderNamesComplete dtb__68)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
))

# 1208 "Vuna/Compiler/Driver/Compile.vuna"
let v_orderCoversEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_readOrderEff nFs) nEnv) nProcess) ctx) (Frontend_dPackages_dPkg.v_contextPackageName ctx))) (fun ord -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match ord with
  | B_dData_dMaybe.C_Maybe_Just (dtb__69) -> ((v_allNamesIn names) dtb__69)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)))))

# 1218 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_pickByOrder = (fun (mc0 : t_ClosureMod B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__70, dtb__71) -> (match ((v_findClosureMod dtb__70) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__72) -> (B_dData_dList.C_List__x58__x58_ (dtb__72, ((v_pickByOrder mc0) dtb__71)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_pickByOrder mc0) dtb__71)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1225 "Vuna/Compiler/Driver/Compile.vuna"
let v_pkgEq = (fun (p : string) (m : t_ClosureMod) -> ((m).f_ClosureMod_cmPkg = p))

# 1228 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_distinctPkgs = (fun (mc0 : t_ClosureMod B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__73, dtb__74) -> (if ((B_dData_dList.v_memName (dtb__73).f_ClosureMod_cmPkg) mc1) then ((v_distinctPkgs dtb__74) mc1) else ((v_distinctPkgs dtb__74) (B_dData_dList.C_List__x58__x58_ ((dtb__73).f_ClosureMod_cmPkg, mc1))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 1262 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_rootExportsOf = (fun (mc0 : string) (mc1 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__75, dtb__76) -> (if ((Frontend_dPackages_dPkg.v_rootName dtb__75) = mc0) then (dtb__75).Frontend_dPackages_dPkg.f_Root_rootExports else ((v_rootExportsOf mc0) dtb__76))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1273 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_pickDepMods = (fun (mc0 : Frontend_dPackages_dPkg.t_PackageContext) (mc1 : t_ClosureMod B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__77, dtb__78) -> (if ((B_dData_dList.v_memName dtb__77) mc3) then ((((v_pickDepMods mc0) mc1) dtb__78) mc3) else (match ((v_findClosureMod dtb__77) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__79) -> (if ((dtb__79).f_ClosureMod_cmPkg <> (Frontend_dPackages_dPkg.v_contextPackageName mc0)) then (B_dData_dList.C_List__x58__x58_ (dtb__79, ((((v_pickDepMods mc0) mc1) dtb__78) (B_dData_dList.C_List__x58__x58_ (dtb__77, mc3))))) else ((((v_pickDepMods mc0) mc1) dtb__78) (B_dData_dList.C_List__x58__x58_ (dtb__77, mc3))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_pickDepMods mc0) mc1) dtb__78) mc3)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1291 "Vuna/Compiler/Driver/Compile.vuna"
let v_importNameStr = (fun (mc0 : Frontend_dAst.t_Import) -> (match mc0 with
  | { Frontend_dAst.f_Import_importName = dtb__80; Frontend_dAst.f_Import_importIsQualified = dtb__81; Frontend_dAst.f_Import_importAlias = dtb__82; Frontend_dAst.f_Import_importRef = dtb__83 } -> dtb__80
  | _ -> failwith "DT: impossible branch"
))

# 1309 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolImportNamesOf = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (current : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Loader_dFlatten.v_implicitPrelude nFs) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) current) imports)) (fun implicitR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__84) -> ((B_dData_dList.v_map v_importNameStr) imports)
  | Base_dDiag.C_Check_OkC (dtb__85) -> ((B_dData_dList.v_map v_importNameStr) ((B_dData_dList.v_append imports) dtb__85))
  | _ -> failwith "DT: impossible branch"
)))))

# 1294 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolImportsOfSource = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Loader_dFlatten.v_parseFileWithPath nFs) nEnv) nProcess) label) source)) (fun parsed -> (match parsed with
  | Base_dDiag.C_Check_ErrC (dtb__86) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil)
  | Base_dDiag.C_Check_OkC (dtb__87) -> (let sf = (B_dData_dPair.v_firstOf dtb__87) in (let hdr = (sf).Frontend_dAst.f_SourceFile_sourceFileModDecl in (let imports = (sf).Frontend_dAst.f_SourceFile_sourceFileImports in (let nd_uscrut16 = hdr in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_toolImportNamesOf nFs) ctx) "") imports)
  | B_dData_dMaybe.C_Maybe_Just (dtb__88) -> (match dtb__88 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__89; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__90; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__91; Frontend_dAst.f_ModDecl_modDeclExports = dtb__92; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__93; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__94; Frontend_dAst.f_ModDecl_modDeclRef = dtb__95 } -> ((((v_toolImportNamesOf nFs) ctx) dtb__89) imports)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))

# 1324 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolEnabled = (fun (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_IFACE_TOOL")) (fun v -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v <> "0")))))

# 1330 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_importClosureGo = (fun (mc0 : int) (mc1 : t_ClosureMod B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__96, dtb__97) -> (if (mc0 <= 0) then mc3 else (if ((B_dData_dList.v_memName dtb__96) mc3) then ((((v_importClosureGo (mc0 - 1)) mc1) dtb__97) mc3) else (match ((v_findClosureMod dtb__96) mc1) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_importClosureGo (mc0 - 1)) mc1) dtb__97) (B_dData_dList.C_List__x58__x58_ (dtb__96, mc3)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__98) -> ((((v_importClosureGo (mc0 - 1)) mc1) ((B_dData_dList.v_append (dtb__98).f_ClosureMod_cmImports) dtb__97)) (B_dData_dList.C_List__x58__x58_ (dtb__96, mc3)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 1351 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_closureEdges = (fun (mc0 : t_ClosureMod B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__99, dtb__100) -> ((B_dData_dList.v_length (dtb__99).f_ClosureMod_cmImports) + (v_closureEdges dtb__100))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 1348 "Vuna/Compiler/Driver/Compile.vuna"
let v_closureFuel = (fun (mods : t_ClosureMod B_dData_dList.t_List) (starts : string B_dData_dList.t_List) -> ((((B_dData_dList.v_length starts) + (B_dData_dList.v_length mods)) + (v_closureEdges mods)) + 1))

# 1345 "Vuna/Compiler/Driver/Compile.vuna"
let v_importClosureOf = (fun (mods : t_ClosureMod B_dData_dList.t_List) (starts : string B_dData_dList.t_List) -> ((((v_importClosureGo ((v_closureFuel mods) starts)) mods) starts) B_dData_dList.C_List_Nil))

# 1355 "Vuna/Compiler/Driver/Compile.vuna"
let v_isNeededMod = (fun (needed : string B_dData_dList.t_List) (m : t_ClosureMod) -> ((B_dData_dList.v_memName (m).f_ClosureMod_cmName) needed))

# 1359 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolDepModsOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (needed : string B_dData_dList.t_List) -> ((B_dData_dList.v_filter (v_isNeededMod needed)) ((v_depModsOf ctx) mods)))

# 1424 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolTextHash = Driver_dIface.v_payloadDigest

# 1427 "Vuna/Compiler/Driver/Compile.vuna"
let v_sourceInfoForPath = (fun (nFs : string) (path : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun raw -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime nFs) path))) (fun mtime -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (fun (o : int B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe 0) o))) ((B_dEffect_dFs.v_fsFileSize nFs) path))) (fun size -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { Driver_dIface.f_SourceInfo_siPath = path; Driver_dIface.f_SourceInfo_siHash = (Driver_dIface.v_payloadDigest raw); Driver_dIface.f_SourceInfo_siMtime = mtime; Driver_dIface.f_SourceInfo_siSize = size }))))))))

# 1435 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolNowSec = (fun (nClock : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun us -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if 1000000 = 0 then failwith "division by zero" else us / 1000000)))))

# 1443 "Vuna/Compiler/Driver/Compile.vuna"
let v_mtimeSafetyWindowSec = 5

# 1448 "Vuna/Compiler/Driver/Compile.vuna"
let v_sourceFresh = (fun (nFs : string) (builtSec : int) (si : Driver_dIface.t_SourceInfo) -> (let path = (Driver_dIface.v_siPathOf si) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) exists) false) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime nFs) path))) (fun m -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (fun (o : int B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe 0) o))) ((B_dEffect_dFs.v_fsFileSize nFs) path))) (fun sz -> (if (if (if (m = (Driver_dIface.v_siMtimeOf si)) then (sz = (Driver_dIface.v_siSizeOf si)) else false) then (((Driver_dIface.v_siMtimeOf si) + v_mtimeSafetyWindowSec) <= builtSec) else false) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) true) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun content -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Driver_dIface.v_payloadDigest content) = (Driver_dIface.v_siHashOf si)))))))))))))))

# 1468 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_toolSessionFresh = (fun (nFs : string) (mc0 : int) (mc1 : Driver_dIface.t_SourceInfo B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__101, dtb__102) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_sourceFresh nFs) mc0) dtb__101)) (fun fresh -> (if fresh then (((v_toolSessionFresh nFs) mc0) dtb__102) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) true)
  | _ -> failwith "DT: impossible branch"
))

# 1517 "Vuna/Compiler/Driver/Compile.vuna"
let v_statOfClosureMod = (fun (nFs : string) (m : t_ClosureMod) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime nFs) (m).f_ClosureMod_cmPath))) (fun mtime -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (fun (o : int B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe 0) o))) ((B_dEffect_dFs.v_fsFileSize nFs) (m).f_ClosureMod_cmPath))) (fun size -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { Driver_dIface.f_SourceInfo_siPath = (m).f_ClosureMod_cmPath; Driver_dIface.f_SourceInfo_siHash = (m).f_ClosureMod_cmSrc; Driver_dIface.f_SourceInfo_siMtime = mtime; Driver_dIface.f_SourceInfo_siSize = size }))))))

# 1542 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanWanted = (fun (needed : string B_dData_dList.t_List) (exclude : string B_dData_dMaybe.t_Maybe) (m : t_ClosureMod) -> (if ((B_dData_dList.v_memName (m).f_ClosureMod_cmName) needed) then (match exclude with
  | B_dData_dMaybe.C_Maybe_Just (dtb__103) -> ((m).f_ClosureMod_cmName <> dtb__103)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
) else false))

# 1652 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolCompilerFingerprint = (fun (nFs : string) (nEnv : string) -> ((v_compilerFingerprint nFs) nEnv))

# 1663 "Vuna/Compiler/Driver/Compile.vuna"
let v_canonicalDir = (fun (dir : string) -> (if ((B_dData_dString.v_endsWith "/") dir) then (((B_dData_dString.v_substring 0) (bi_natFromInt ((bi_strLength dir) - 1))) dir) else dir))

# 1667 "Vuna/Compiler/Driver/Compile.vuna"
let v_canonicalPath = (fun (dir : string) (file : string) -> (let d = (v_canonicalDir dir) in (if (if (d = ".") then true else (d = "")) then file else (if ((B_dData_dString.v_startsWith (d ^ "/")) file) then (((B_dData_dString.v_substring (bi_natFromInt ((bi_strLength d) + 1))) (bi_natFromInt (((bi_strLength file) - (bi_strLength d)) - 1))) file) else file))))

# 1678 "Vuna/Compiler/Driver/Compile.vuna"
let v_resolveStoredPath = (fun (dir : string) (file : string) -> (let d = (v_canonicalDir dir) in (if (if (file = "") then true else ((B_dData_dString.v_startsWith "/") file)) then file else (if (if (d = ".") then true else (d = "")) then file else (String.concat "" [d; "/"; file])))))

# 1686 "Vuna/Compiler/Driver/Compile.vuna"
let v_absoluteSpanLabel = (fun (l : Base_dDiag.t_Label) -> (match (l).Base_dDiag.f_Label_labelSpan with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__104) -> ((B_dData_dString.v_startsWith "/") (dtb__104).Base_dSource.f_Span_spanFile)
  | _ -> failwith "DT: impossible branch"
))

# 1692 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_hasAbsoluteLabels = (fun (mc0 : Base_dDiag.t_Label B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__105, dtb__106) -> (if (v_absoluteSpanLabel dtb__105) then true else (v_hasAbsoluteLabels dtb__106))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1696 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_anyAbsoluteChild = (fun (mc0 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__107, dtb__108) -> (if (v_diagHasAbsolutePath dtb__107) then true else (v_anyAbsoluteChild dtb__108))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1700 "Vuna/Compiler/Driver/Compile.vuna"
and v_diagHasAbsolutePath = (fun (mc0 : Base_dDiag.t_Diagnostic) -> (match mc0 with
  | { Base_dDiag.f_Diagnostic_diagId = dtb__109; Base_dDiag.f_Diagnostic_diagSeverity = dtb__110; Base_dDiag.f_Diagnostic_diagPhase = dtb__111; Base_dDiag.f_Diagnostic_diagCategory = dtb__112; Base_dDiag.f_Diagnostic_diagCode = dtb__113; Base_dDiag.f_Diagnostic_diagMessage = dtb__114; Base_dDiag.f_Diagnostic_diagLabels = dtb__115; Base_dDiag.f_Diagnostic_diagFields = dtb__116; Base_dDiag.f_Diagnostic_diagTrace = dtb__117; Base_dDiag.f_Diagnostic_diagNotes = dtb__118; Base_dDiag.f_Diagnostic_diagSuggestions = dtb__119; Base_dDiag.f_Diagnostic_diagOrigin = dtb__120; Base_dDiag.f_Diagnostic_diagChildren = dtb__121; Base_dDiag.f_Diagnostic_diagInternal = dtb__122; Base_dDiag.f_Diagnostic_diagIce = dtb__123; Base_dDiag.f_Diagnostic_diagAbsent = dtb__124; Base_dDiag.f_Diagnostic_diagStability = dtb__125 } -> (if (v_hasAbsoluteLabels dtb__115) then true else (v_anyAbsoluteChild dtb__121))
  | _ -> failwith "DT: impossible branch"
))

# 1704 "Vuna/Compiler/Driver/Compile.vuna"
let v_isStableDiag = (fun (d : Base_dDiag.t_Diagnostic) -> (match (d).Base_dDiag.f_Diagnostic_diagStability with
  | Base_dDiag.C_Stability_Stable -> true
  | Base_dDiag.C_Stability_Volatile -> false
  | _ -> failwith "DT: impossible branch"
))

# 1710 "Vuna/Compiler/Driver/Compile.vuna"
let v_allStableDiags = (fun (ds : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> ((B_dData_dList.v_length ((B_dData_dList.v_filter (fun (d : Base_dDiag.t_Diagnostic) -> (B_dData_dBool.v_not (v_isStableDiag d)))) ds)) = 0))

# 1714 "Vuna/Compiler/Driver/Compile.vuna"
let v_prepareForStore = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (d : Base_dDiag.t_Diagnostic) -> (let d2 = ((Base_dDiag.v_mapSpanFile (v_canonicalPath (Frontend_dPackages_dPkg.v_contextDir ctx))) d) in (if (v_diagHasAbsolutePath d2) then ((Base_dDiag.v_withStability Base_dDiag.C_Stability_Volatile) d2) else (if (v_isStableDiag d2) then ((Base_dDiag.v_withStability Base_dDiag.C_Stability_Stable) d2) else d2))))

# 1722 "Vuna/Compiler/Driver/Compile.vuna"
let v_resolveStoredDiag = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (d : Base_dDiag.t_Diagnostic) -> ((Base_dDiag.v_mapSpanFile (v_resolveStoredPath (Frontend_dPackages_dPkg.v_contextDir ctx))) d))

# 1725 "Vuna/Compiler/Driver/Compile.vuna"
let v_replayFailure = (fun (mc0 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__126, dtb__127) -> (match dtb__127 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_ErrC (dtb__126))
  | _ -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withChildren dtb__127) dtb__126)))
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1751 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkModsOf = (fun (pkg : string) (kind : string) (manifest : string) (sources : string) (deps : string) (ver : string) (flags : string) -> { f_CheckMods_cmPkg = pkg; f_CheckMods_cmKind = kind; f_CheckMods_cmManifest = manifest; f_CheckMods_cmSources = sources; f_CheckMods_cmDeps = deps; f_CheckMods_cmVer = ver; f_CheckMods_cmFlags = flags })

# 748 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkModsExe = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_contextSources nFs) ctx) entry)) (fun sources -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_depIdentitiesEff nFs) nEnv) nProcess) ctx)) (fun deps -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_compilerFingerprint nFs) nEnv)) (fun fp -> (let srcHash = ((v_closureHashOf sources) 0) in (let manHash = (v_textHash (v_manifestSemanticText (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage)) in (let verHash = ((v_textHash (v_checkNodeSchema ^ Base_dVersion.v_vunaVersion)) + fp) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_checkModsOf (Frontend_dPackages_dPkg.v_contextPackageName ctx)) "exe") (v_hashText manHash)) (v_hashText srcHash)) (v_depIdentitiesHash deps)) (v_hashText verHash)) (v_releaseFlagOf ctx)))))))))))))

# 761 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkModsLib = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_concatMapEff (v_rootSources nFs)) (Frontend_dPackages_dPkg.v_contextRoots ctx))) (fun rootSourcesAll -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_depIdentitiesEff nFs) nEnv) nProcess) ctx)) (fun deps -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_compilerFingerprint nFs) nEnv)) (fun fp -> (let srcHash = ((v_closureHashOf rootSourcesAll) 0) in (let manHash = (v_textHash (v_manifestSemanticText (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage)) in (let namesHash = (v_textHash ((B_dData_dString.v_join "\t") names)) in (let verHash = ((v_textHash (v_checkNodeSchema ^ Base_dVersion.v_vunaVersion)) + fp) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_checkModsOf (Frontend_dPackages_dPkg.v_contextPackageName ctx)) ("lib:" ^ (v_hashText namesHash))) (v_hashText manHash)) (v_hashText srcHash)) (v_depIdentitiesHash deps)) (v_hashText verHash)) (v_releaseFlagOf ctx))))))))))))))

# 1758 "Vuna/Compiler/Driver/Compile.vuna"
let v_projectIdOf = (fun (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Frontend_dPackages_dPkg.v_absolutePath nEnv) (Frontend_dPackages_dPkg.v_contextDir ctx))) (fun abs -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Loader_dAddr.v_projectIdAddrOf abs)))))

# 1767 "Vuna/Compiler/Driver/Compile.vuna"
let v_rootKeepEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (digests : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_projectIdOf nEnv) ctx)) (fun pid -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Frontend_dPackages_dPkg.v_absolutePath nEnv) (Frontend_dPackages_dPkg.v_contextDir ctx))) (fun abs -> ((((((Base_dStore.v_storeRootAppendEff nFs) nEnv) nProcess) pid) abs) digests))))))

# 1730 "Vuna/Compiler/Driver/Compile.vuna"
let v_storeCheckPayload = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (dig : string) (outcome : Base_dDiag_dCodec.t_CheckOutcome) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((Base_dStore.v_storeObjectWriteEff nFs) nEnv) nProcess) "check-outcome") Base_dDiag_dCodec.v_checkResultCodec) dig) (Base_dDiag_dCodec.v_encCheckOutcome outcome))) (fun _u -> (((((v_rootKeepEff nFs) nEnv) nProcess) ctx) (B_dData_dList.C_List__x58__x58_ (dig, B_dData_dList.C_List_Nil))))))

# 1814 "Vuna/Compiler/Driver/Compile.vuna"
let v_runAndStore = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (dig : string) (run : Base_dDiag.t_Diagnostic B_dData_dList.t_List Base_dDiag.t_Check B_dEffect_dCore.t_Eff) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "cache-path=miss") else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dObs.v_obsCountEff "vuna.counter.cache.miss") 1)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) run) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__128) -> (let stored = ((B_dData_dList.v_map (v_prepareForStore ctx)) (B_dData_dList.C_List__x58__x58_ (dtb__128, B_dData_dList.C_List_Nil))) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") (String.concat "" ["check-store stable="; (bi_strFromInt (B_dData_dList.v_length ((B_dData_dList.v_filter (fun (d : Base_dDiag.t_Diagnostic) -> (v_isStableDiag d))) stored))); "/"; (bi_strFromInt (B_dData_dList.v_length stored))])) else 0) in (if (v_allStableDiags stored) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_storeCheckPayload nFs) nEnv) nProcess) ctx) dig) (Base_dDiag_dCodec.C_CheckOutcome_CheckFailed (stored)))) (fun n -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("check-store write=" ^ (bi_strFromInt n))) else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dObs.v_obsCountEff "vuna.counter.cache.write") 1)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__128)))))))) else (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "check-cache=skip volatile") else 0) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__128)))))))
  | Base_dDiag.C_Check_OkC (dtb__129) -> (let allStored = ((B_dData_dList.v_map (v_prepareForStore ctx)) dtb__129) in (let stored = ((B_dData_dList.v_filter v_isStableDiag) allStored) in (let dropped = (bi_natSub (B_dData_dList.v_length allStored) (B_dData_dList.v_length stored)) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") (String.concat "" ["check-store pass stable="; (bi_strFromInt (B_dData_dList.v_length stored)); "/"; (bi_strFromInt (B_dData_dList.v_length allStored))])) else 0) in (let _u = (if (dropped > 0) then (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("check-store dropped=" ^ (bi_strFromInt dropped))) else 0) else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_storeCheckPayload nFs) nEnv) nProcess) ctx) dig) (Base_dDiag_dCodec.C_CheckOutcome_CheckPassed (stored)))) (fun n -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("check-store write=" ^ (bi_strFromInt n))) else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dObs.v_obsCountEff "vuna.counter.cache.write") 1)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dtb__129)))))))))))))
  | _ -> failwith "DT: impossible branch"
)))))))

# 1945 "Vuna/Compiler/Driver/Compile.vuna"
let v_elabFullRequested = (fun (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_ELAB_FULL")) (fun v -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v = "1")))))

# 1953 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceAuditRequested = (fun (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_IFACE_AUDIT")) (fun v -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v = "1")))))

# 1963 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkSignatureOf = (fun (mc0 : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, Driver_dDt.t_CheckedPackage) B_dData_dPair.t_Pair Base_dDiag.t_Check) -> (match mc0 with
  | Base_dDiag.C_Check_ErrC (dtb__130) -> ("err\n" ^ (Base_dDiag.v_diagText dtb__130))
  | Base_dDiag.C_Check_OkC (dtb__131) -> "ok\n"
  | _ -> failwith "DT: impossible branch"
))

# 1969 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitSignatureOf = (fun (mc0 : (Driver_dSplit.t_SplitFile B_dData_dList.t_List, Driver_dDt.t_CheckedPackage) B_dData_dPair.t_Pair Base_dDiag.t_Check) -> (match mc0 with
  | Base_dDiag.C_Check_ErrC (dtb__132) -> ("err\n" ^ (Base_dDiag.v_diagText dtb__132))
  | Base_dDiag.C_Check_OkC (dtb__133) -> ("ok\n" ^ ((Base_dBytes.v_encTop Driver_dSplit.v_encSplitFiles) (B_dData_dPair.v_firstOf dtb__133)))
  | _ -> failwith "DT: impossible branch"
))

# 1973 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_joinLines = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__134, dtb__135) -> (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) dtb__135) B_dData_dList.C_List_Nil) then dtb__134 else (String.concat "" [dtb__134; "\n"; (v_joinLines dtb__135)]))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1979 "Vuna/Compiler/Driver/Compile.vuna"
let v_auditCompare = (fun (subject : string) (at : string) (s : string) (f : string) -> (if (s = f) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_err (String.concat "" ["iface-audit-mismatch subject="; subject; " at="; at; " summary="; (bi_strFromInt (v_textHash s)); "/"; (bi_strFromInt (bi_strLength s)); " full="; (bi_strFromInt (v_textHash f)); "/"; (bi_strFromInt (bi_strLength f))]))))

# 2026 "Vuna/Compiler/Driver/Compile.vuna"
let v_readOneModIface = (fun (nFs : string) (nEnv : string) (nProcess : string) (m : t_ClosureMod) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_readIfaceAtEff nFs) nEnv) nProcess) (m).f_ClosureMod_cmAddr)) (fun mi -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = m; B_dData_dPair.f_Pair_second = mi }))))

# 2052 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_readIfaces = (fun (mc0 : (t_ClosureMod, Driver_dIface.t_ModuleIface B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__136, dtb__137) -> (match (B_dData_dPair.v_secondOf dtb__136) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_readIfaces dtb__137)
  | B_dData_dMaybe.C_Maybe_Just (dtb__138) -> (B_dData_dList.C_List__x58__x58_ (dtb__138, (v_readIfaces dtb__137)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 2070 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_fromDirty = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__139, dtb__140) -> (if ((B_dData_dString.v_startsWith (dtb__139 ^ ".")) mc1) then true else ((v_fromDirty dtb__140) mc1))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 2065 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_anyExportFrom = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__141, dtb__142) -> (if ((v_fromDirty mc0) (dtb__141).Loader_dModules.f_ExportEntry_target) then true else ((v_anyExportFrom mc0) dtb__142))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 2062 "Vuna/Compiler/Driver/Compile.vuna"
let v_exportsFromDirty = (fun (dirty : string B_dData_dList.t_List) (mi : Driver_dIface.t_ModuleIface) -> ((v_anyExportFrom dirty) (Driver_dIface.v_miExportsOf mi)))

# 2077 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_dirtyFix = (fun (fuel : int) (dirty : string B_dData_dList.t_List) (cands : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (if (fuel <= 0) then dirty else (let added = ((B_dData_dList.v_map Driver_dIface.v_miNameOf) ((B_dData_dList.v_filter (fun (mi : Driver_dIface.t_ModuleIface) -> (if (B_dData_dBool.v_not ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf mi)) dirty)) then ((v_exportsFromDirty dirty) mi) else false))) cands)) in (if ((B_dData_dList.v_length added) = 0) then dirty else (((v_dirtyFix (fuel - 1)) ((B_dData_dList.v_append added) dirty)) cands)))))

# 2086 "Vuna/Compiler/Driver/Compile.vuna"
let v_collectClean = (fun (dirty0 : string B_dData_dList.t_List) (cands : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (let dirty = (((v_dirtyFix ((B_dData_dList.v_length cands) + 1)) dirty0) cands) in ((B_dData_dList.v_filter (fun (mi : Driver_dIface.t_ModuleIface) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf mi)) dirty)))) cands)))

# 2039 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanInfoWith = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_mapEff (((v_readOneModIface nFs) nEnv) nProcess)) ((v_selfModsOf ctx) mods))) (fun reads -> (let ownNames = ((B_dData_dList.v_map v_modNameOf) ((v_selfModsOf ctx) mods)) in (let cands = (v_readIfaces reads) in (let missing = ((B_dData_dList.v_filter (fun (n : string) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName n) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) cands))))) ownNames) in (let clean = ((v_collectClean missing) cands) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if ((B_dData_dList.v_length clean) = 0) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (clean)))))))))))

# 2099 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanModulesWith = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> (((((v_ownCleanInfoWith nFs) nEnv) nProcess) ctx) mods))

# 2137 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_cleanHashOf = (fun (mc0 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__143, dtb__144) -> (if ((Driver_dIface.v_miNameOf dtb__143) = mc1) then (B_dData_dMaybe.C_Maybe_Just ((Driver_dIface.v_miIfaceHashOf dtb__143))) else ((v_cleanHashOf dtb__144) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2124 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_moduleDepsOk = (fun (mc0 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mc2 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__145, dtb__146) -> (match dtb__145 with
  | { B_dData_dPair.f_Pair_first = dtb__147; B_dData_dPair.f_Pair_second = dtb__148 } -> (if (dtb__148 = Driver_dIface.v_depMissingHash) then (((v_moduleDepsOk mc0) mc1) dtb__146) else (match ((B_dData_dList.v_lookupPair dtb__147) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__149) -> (if (dtb__149 = dtb__148) then (((v_moduleDepsOk mc0) mc1) dtb__146) else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_cleanHashOf mc1) dtb__147) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__150) -> (if (dtb__150 = dtb__148) then (((v_moduleDepsOk mc0) mc1) dtb__146) else false)
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

# 1598 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_cleanPass = (fun (mc0 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mc2 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mc3 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__151, dtb__152) -> (if (((v_moduleDepsOk mc0) mc2) (Driver_dIface.v_miDepHashesOf dtb__151)) then ((((v_cleanPass mc0) dtb__152) (B_dData_dList.C_List__x58__x58_ (dtb__151, mc2))) (B_dData_dList.C_List__x58__x58_ (dtb__151, mc3))) else (let p = ((((v_cleanPass mc0) dtb__152) mc2) mc3) in { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__151, (B_dData_dPair.v_firstOf p))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) }))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse mc3) }
  | _ -> failwith "DT: impossible branch"
))

# 1583 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_cleanFixpoint = (fun (fuel : int) (depTbl : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (pending : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanRev : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (if (fuel <= 0) then ((B_dData_dList.v_append (B_dData_dList.v_reverse pending)) cleanRev) else (let nd_uscrut4 = ((((v_cleanPass depTbl) pending) cleanRev) B_dData_dList.C_List_Nil) in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__153; B_dData_dPair.f_Pair_second = dtb__154 } -> (match dtb__153 with
  | B_dData_dList.C_List_Nil -> ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb__154)) cleanRev)
  | _ -> (if ((B_dData_dList.v_length dtb__154) = 0) then ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb__153)) cleanRev) else (let _u = ((Base_dObs.v_obsCounter "vuna.tool.clean.kept") (B_dData_dList.v_length dtb__154)) in ((((v_cleanFixpoint (fuel - 1)) depTbl) dtb__153) ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb__154)) cleanRev))))
)
  | _ -> failwith "DT: impossible branch"
))))

# 2146 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceCompilerTag = (fun (nFs : string) (nEnv : string) -> ((Loader_dFingerprint.v_cacheTagEff nFs) nEnv))

# 1030 "Vuna/Compiler/Driver/Compile.vuna"
let v_rootEnvHashOf = (fun (nFs : string) (nEnv : string) (dir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (dir ^ "/vuna.toml"))) (fun tomlPath -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) tomlPath)) (fun exists -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if exists then ((B_dEffect_dFs.v_fsReadFile nFs) tomlPath) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ""))) (fun toml -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_ifaceCompilerTag nFs) nEnv)) (fun tag -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_textHash (String.concat "" [(bi_strFromInt (v_textHash toml)); "|"; tag; "|"]))))))))))))

# 1039 "Vuna/Compiler/Driver/Compile.vuna"
let v_rootPkgTableEff = (fun (nFs : string) (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> ((v_mapEff (fun (r : Frontend_dPackages_dPkg.t_Root) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_rootEnvHashOf nFs) nEnv) (Frontend_dPackages_dPkg.v_rootDir r))) (fun env -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { f_PkgEntry_peName = (Frontend_dPackages_dPkg.v_rootName r); f_PkgEntry_peDir = (Frontend_dPackages_dPkg.v_rootDir r); f_PkgEntry_peKey = (v_pkgKeyOf (Frontend_dPackages_dPkg.v_rootName r)); f_PkgEntry_peEnv = (bi_strFromInt env) }))))) (Frontend_dPackages_dPkg.v_contextRoots ctx)))

# 1056 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifacesForRootsEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_rootPkgTableEff nFs) nEnv) ctx)) (fun pkgs -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_ifaceModsWithEff nFs) nClock) nEnv) nProcess) ctx) pkgs)) (fun mods -> ((((v_readIfaceListEff nFs) nEnv) nProcess) mods))))))

# 1393 "Vuna/Compiler/Driver/Compile.vuna"
let v_baseDepIfacesOf = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Just (dtb__155) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_ifacesForRootsEff nFs) nClock) nEnv) nProcess) ctx)
  | _ -> failwith "DT: impossible branch"
))

# 2000 "Vuna/Compiler/Driver/Compile.vuna"
let v_packageEnvHash = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (let own = (v_textHash (v_manifestSemanticText (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage)) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_depIdentitiesEff nFs) nEnv) nProcess) ctx)) (fun deps -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_ifaceCompilerTag nFs) nEnv)) (fun tag -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_textHash (String.concat "" [(bi_strFromInt own); "|"; tag; "|"; (v_joinLines ((B_dData_dList.v_map v_pairText) deps))])))))))))

# 852 "Vuna/Compiler/Driver/Compile.vuna"
let v_pkgTableEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_packageEnvHash nFs) nEnv) nProcess) ctx)) (fun ownEnv -> (let own = { f_PkgEntry_peName = (Frontend_dPackages_dPkg.v_contextPackageName ctx); f_PkgEntry_peDir = (Frontend_dPackages_dPkg.v_contextDir ctx); f_PkgEntry_peKey = (v_pkgKeyOf (Frontend_dPackages_dPkg.v_contextPackageName ctx)); f_PkgEntry_peEnv = (bi_strFromInt ownEnv) } in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_mapEff (fun (p : Frontend_dPackages_dPkg.t_Package) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_packageEnvHash nFs) nEnv) nProcess) (Frontend_dPackages_dPkg.v_packageContext p))) (fun e -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { f_PkgEntry_peName = (Frontend_dPackages_dPkg.v_packageName p); f_PkgEntry_peDir = (Frontend_dPackages_dPkg.v_packageDir p); f_PkgEntry_peKey = (v_pkgKeyOf (Frontend_dPackages_dPkg.v_packageName p)); f_PkgEntry_peEnv = (bi_strFromInt e) }))))) (v_depPackageList ctx))) (fun deps -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dList.C_List__x58__x58_ (own, deps)))))))))

# 983 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceModsEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_pkgTableEff nFs) nEnv) nProcess) ctx)) (fun pkgs -> ((((((v_ifaceModsWithEff nFs) nClock) nEnv) nProcess) ctx) pkgs))))

# 1010 "Vuna/Compiler/Driver/Compile.vuna"
let v_summaryClosureMods = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil)
  | B_dData_dMaybe.C_Maybe_Just (dtb__156) -> (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)
  | _ -> failwith "DT: impossible branch"
))

# 1049 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifacesForContextEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> ((((v_readIfaceListEff nFs) nEnv) nProcess) mods))))

# 1362 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForToolSource = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_toolEnabled nEnv)) (fun enabled -> (if enabled then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_toolImportsOfSource nFs) nEnv) nProcess) ctx) label) source)) (fun starts -> (let needed = ((v_importClosureOf mods) starts) in (let depMods = (((v_toolDepModsOf ctx) mods) needed) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("tool-closure modules=" ^ (bi_strFromInt (B_dData_dList.v_length depMods)))) else 0) in ((((v_readIfaceListEff nFs) nEnv) nProcess) depMods)))))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing)))))

# 1380 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForToolProgram = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) -> (((((((v_depIfacesForToolSource nFs) nClock) nEnv) nProcess) ctx) "<repl>") program))

# 1476 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolNeededOfImports = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (tool : t_ToolContext) (currentName : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_toolImportNamesOf nFs) ctx) currentName) imports)) (fun importNames -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_importClosureOf mods) importNames)))))))

# 1485 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForToolSourceDetailed = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_toolEnabled nEnv)) (fun enabled -> (if enabled then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.tool.ifaces.lookup")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_toolImportsOfSource nFs) nEnv) nProcess) ctx) label) source)) (fun starts -> (let needed = ((v_importClosureOf mods) starts) in (let depMods = (((v_toolDepModsOf ctx) mods) needed) in (let depHashes = ((B_dData_dList.v_map v_modHashPair) depMods) in (let ownNames = ((B_dData_dList.v_map v_modNameOf) ((v_selfModsOf ctx) mods)) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("tool-closure modules=" ^ (bi_strFromInt (B_dData_dList.v_length depMods)))) else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_readIfaceListEff nFs) nEnv) nProcess) depMods)) (fun ifaces -> (match ifaces with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.tool.ifaces.missing")) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__157) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.tool.ifaces.ready")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_mapEff (v_statOfClosureMod nFs)) depMods)) (fun stats -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dMaybe.C_Maybe_Just ({ f_ToolContext_tcDepIfaces = dtb__157; f_ToolContext_tcDepHashes = depHashes; f_ToolContext_tcNeeded = needed; f_ToolContext_tcOwnNames = ownNames; f_ToolContext_tcStats = stats })))))))
  | _ -> failwith "DT: impossible branch"
)))))))))))))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.tool.ifaces.disabled")) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing)))))))

# 1624 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeModuleIfaceGuarded = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mi : Driver_dIface.t_ModuleIface) -> (if ((Frontend_dPackages_dPkg.v_contextPackageName ctx) = "") then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (match ((v_findClosureMod (Driver_dIface.v_miNameOf mi)) mods) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0)
  | B_dData_dMaybe.C_Maybe_Just (dtb__158) -> (((((((Base_dStore.v_storeObjectWriteEff nFs) nEnv) nProcess) "module-iface") v_ifaceObjectCodec) (dtb__158).f_ClosureMod_cmAddr) (Driver_dIface.v_encModuleIface mi))
  | _ -> failwith "DT: impossible branch"
)))))

# 1610 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolWriteModuleIface = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (tool : t_ToolContext) (clean : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (checked : Driver_dDt.t_CheckedPackage) (name : string) (si : Driver_dIface.t_SourceInfo) -> (let miResult = (((((((((Driver_dIface.v_ifaceOfModule (Frontend_dPackages_dPkg.v_contextPackageName ctx)) si) (tool).f_ToolContext_tcDepHashes) (checked).Driver_dDt.f_CheckedPackage_checkedInherited) clean) (checked).Driver_dDt.f_CheckedPackage_checkedModules) (checked).Driver_dDt.f_CheckedPackage_checkedEntryDecls) (checked).Driver_dDt.f_CheckedPackage_checkedProgram) name) in (match miResult with
  | Base_dDiag.C_Check_ErrC (dtb__159) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__159)))
  | Base_dDiag.C_Check_OkC (dtb__160) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_writeModuleIfaceGuarded nFs) nClock) nEnv) nProcess) ctx) dtb__160)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dtb__160)))))
  | _ -> failwith "DT: impossible branch"
)))

# 1989 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfaceHashTable = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dData_dList.v_map v_modHashPair) ((v_depModsOf ctx) mods))))))

# 2032 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanInfo = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((((v_ownCleanInfoWith nFs) nEnv) nProcess) ctx) mods))))

# 2092 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanModules = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ownCleanInfo nFs) nClock) nEnv) nProcess) ctx)) (fun info -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) info))))

# 2105 "Vuna/Compiler/Driver/Compile.vuna"
let v_cleanIfacesOrEmpty = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ownCleanModules nFs) nClock) nEnv) nProcess) ctx)) (fun clean -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match clean with
  | B_dData_dMaybe.C_Maybe_Just (dtb__161) -> dtb__161
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)))))

# 1637 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolWriteModuleIfaceCold = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : Driver_dDt.t_CheckedPackage) (name : string) (si : Driver_dIface.t_SourceInfo) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_cleanIfacesOrEmpty nFs) nClock) nEnv) nProcess) ctx)) (fun clean -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_depIfaceHashTable nFs) nClock) nEnv) nProcess) ctx)) (fun depTbl -> (let miResult = (((((((((Driver_dIface.v_ifaceOfModule (Frontend_dPackages_dPkg.v_contextPackageName ctx)) si) depTbl) (checked).Driver_dDt.f_CheckedPackage_checkedInherited) clean) (checked).Driver_dDt.f_CheckedPackage_checkedModules) (checked).Driver_dDt.f_CheckedPackage_checkedEntryDecls) (checked).Driver_dDt.f_CheckedPackage_checkedProgram) name) in (match miResult with
  | Base_dDiag.C_Check_ErrC (dtb__162) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__162)))
  | Base_dDiag.C_Check_OkC (dtb__163) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_writeModuleIfaceGuarded nFs) nClock) nEnv) nProcess) ctx) dtb__163)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dtb__163)))))
  | _ -> failwith "DT: impossible branch"
)))))))

# 2157 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownInfoOf = (fun (nFs : string) (nEnv : string) (m : t_ClosureMod) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Frontend_dPackages_dPkg.v_absolutePath nEnv) (m).f_ClosureMod_cmPath)) (fun abs -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime nFs) abs))) (fun mtime -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (fun (o : int B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe 0) o))) ((B_dEffect_dFs.v_fsFileSize nFs) abs))) (fun size -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (m).f_ClosureMod_cmName; B_dData_dPair.f_Pair_second = { Driver_dIface.f_SourceInfo_siPath = abs; Driver_dIface.f_SourceInfo_siHash = (m).f_ClosureMod_cmSrc; Driver_dIface.f_SourceInfo_siMtime = mtime; Driver_dIface.f_SourceInfo_siSize = size } }))))))))

# 2154 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownSourceInfos = (fun (nFs : string) (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> ((v_mapEff ((v_ownInfoOf nFs) nEnv)) ((v_selfModsOf ctx) mods)))

# 2167 "Vuna/Compiler/Driver/Compile.vuna"
let v_resyncCleanSources = (fun (sources : (string, Driver_dIface.t_SourceInfo) B_dData_dPair.t_Pair B_dData_dList.t_List) (clean : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (m : Driver_dIface.t_ModuleIface) -> (match ((B_dData_dList.v_lookupPair (Driver_dIface.v_miNameOf m)) sources) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__164) -> { Driver_dIface.f_ModuleIface_miName = (Driver_dIface.v_miNameOf m); Driver_dIface.f_ModuleIface_miPackage = (Driver_dIface.v_miPackageOf m); Driver_dIface.f_ModuleIface_miSource = dtb__164; Driver_dIface.f_ModuleIface_miIfaceHash = (Driver_dIface.v_miIfaceHashOf m); Driver_dIface.f_ModuleIface_miImplHash = (Driver_dIface.v_miImplHashOf m); Driver_dIface.f_ModuleIface_miDepHashes = (Driver_dIface.v_miDepHashesOf m); Driver_dIface.f_ModuleIface_miImports = (Driver_dIface.v_miImportsOf m); Driver_dIface.f_ModuleIface_miImplicitImports = (Driver_dIface.v_miImplicitImportsOf m); Driver_dIface.f_ModuleIface_miExports = (Driver_dIface.v_miExportsOf m); Driver_dIface.f_ModuleIface_miFixities = (Driver_dIface.v_miFixitiesOf m); Driver_dIface.f_ModuleIface_miDecls = (Driver_dIface.v_miDeclsOf m); Driver_dIface.f_ModuleIface_miRecords = (Driver_dIface.v_miRecordsOf m); Driver_dIface.f_ModuleIface_miPrepared = (Driver_dIface.v_miPreparedOf m); Driver_dIface.f_ModuleIface_miCached = (Driver_dIface.v_miCachedOf m); Driver_dIface.f_ModuleIface_miDefLocs = (Driver_dIface.v_miDefLocsOf m) }
  | B_dData_dMaybe.C_Maybe_Nothing -> m
  | _ -> failwith "DT: impossible branch"
))) clean))

# 2183 "Vuna/Compiler/Driver/Compile.vuna"
let v_shadowAllowed = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__165) -> true
  | _ -> failwith "DT: impossible branch"
))

# 1017 "Vuna/Compiler/Driver/Compile.vuna"
let v_shadowClosureMods = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (if ((Frontend_dPackages_dPkg.v_contextPackageName ctx) = "") then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing) else (if (B_dData_dBool.v_not (v_shadowAllowed ctx)) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dMaybe.C_Maybe_Just (mods))))))))

# 2190 "Vuna/Compiler/Driver/Compile.vuna"
let v_nameExportedBy = (fun (names : string B_dData_dList.t_List) (m : t_ClosureMod) -> ((B_dData_dList.v_memName (m).f_ClosureMod_cmName) names))

# 1253 "Vuna/Compiler/Driver/Compile.vuna"
let v_exportedDepModsOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (p : string) (mods : t_ClosureMod B_dData_dList.t_List) -> (let inPkg = ((B_dData_dList.v_filter (v_pkgEq p)) mods) in (match ((v_rootExportsOf p) (Frontend_dPackages_dPkg.v_contextRoots ctx)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> inPkg
  | B_dData_dMaybe.C_Maybe_Just (dtb__166) -> ((B_dData_dList.v_filter (v_nameExportedBy dtb__166)) inPkg)
  | _ -> failwith "DT: impossible branch"
)))

# 1233 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_goPkgs = (fun (nFs : string) (nEnv : string) (nProcess : string) (mc0 : Frontend_dPackages_dPkg.t_PackageContext) (mc1 : t_ClosureMod B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : t_ClosureMod B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__167, dtb__168) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_readOrderEff nFs) nEnv) nProcess) mc0) dtb__167)) (fun ord -> (match ord with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Just (dtb__169) -> (let current = ((B_dData_dList.v_map v_modNameOf) ((B_dData_dList.v_filter (v_pkgEq dtb__167)) mc1)) in (let namesCurrent = ((v_allNamesIn dtb__169) current) in (let picked = ((v_pickByOrder mc1) dtb__169) in (let required = (((v_exportedDepModsOf mc0) dtb__167) mc1) in (if (if namesCurrent then ((v_allNamesIn ((B_dData_dList.v_map v_modNameOf) required)) ((B_dData_dList.v_map v_modNameOf) picked)) else false) then (((((((v_goPkgs nFs) nEnv) nProcess) mc0) mc1) dtb__168) ((B_dData_dList.v_append mc3) picked)) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing))))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dMaybe.C_Maybe_Just (mc3)))
  | _ -> failwith "DT: impossible branch"
))

# 1267 "Vuna/Compiler/Driver/Compile.vuna"
let v_depModsByOrderEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> (((((((v_goPkgs nFs) nEnv) nProcess) ctx) mods) ((v_distinctPkgs ((v_depModsOf ctx) mods)) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil))

# 1130 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesOfWith = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Just (dtb__170) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_depModsByOrderEff nFs) nEnv) nProcess) ctx) mods)) (fun ordered -> (match ordered with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "iface-reject=module-order") else 0) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb__171) -> ((((v_readIfaceListEff nFs) nEnv) nProcess) dtb__171)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

# 1122 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesOf = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> ((((((v_depIfacesOfWith nFs) nClock) nEnv) nProcess) ctx) mods))))

# 1285 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForCheck = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((((v_depIfacesOf nFs) nClock) nEnv) nProcess) ctx))

# 1383 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForTool = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_toolEnabled nEnv)) (fun enabled -> (if enabled then (((((v_depIfacesOf nFs) nClock) nEnv) nProcess) ctx) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing)))))

# 1889 "Vuna/Compiler/Driver/Compile.vuna"
let v_summaryCheckExeParts = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_depIfacesOfWith nFs) nClock) nEnv) nProcess) ctx) mods)) (fun depIfaces -> (match depIfaces with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "cache-path=full") else 0) in (((((Driver_dDt.v_dtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry))
  | B_dData_dMaybe.C_Maybe_Just (dtb__172) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ownCleanModulesWith nFs) nEnv) nProcess) ctx) mods)) (fun clean -> (match clean with
  | B_dData_dMaybe.C_Maybe_Just (dtb__173) -> (let cleanReal = (if wantWarnings then B_dData_dList.C_List_Nil else dtb__173) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-path=summary deps=" ^ (bi_strFromInt (v_depPackageCount ctx)))) else 0) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-own-clean=" ^ (bi_strFromInt (B_dData_dList.v_length cleanReal)))) else 0) in (((((((((Driver_dDt.v_dtCheckPackageIncrementalParts nFs) nEnv) nProcess) nExit) nArgs) ctx) entry) dtb__172) cleanReal))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-path=summary deps=" ^ (bi_strFromInt (v_depPackageCount ctx)))) else 0) in ((((((Driver_dDt.v_dtCheckPackageWithIfacesParts nFs) nEnv) nProcess) ctx) entry) dtb__172))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

# 2199 "Vuna/Compiler/Driver/Compile.vuna"
let v_exportedOwnOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (own : t_ClosureMod B_dData_dList.t_List) -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Nothing -> own
  | B_dData_dMaybe.C_Maybe_Just (dtb__174) -> (match (Frontend_dPackages_dPkg.v_packageExports dtb__174) with
  | B_dData_dMaybe.C_Maybe_Nothing -> own
  | B_dData_dMaybe.C_Maybe_Just (dtb__175) -> ((B_dData_dList.v_filter (v_nameExportedBy dtb__175)) own)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 2213 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceWriteEnabled = (fun (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_IFACE_WRITE")) (fun v -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v <> "0")))))

# 2319 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_missingNamesOf = (fun (mc0 : t_ClosureMod B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__176, dtb__177) -> (if ((B_dData_dList.v_memName (dtb__176).f_ClosureMod_cmName) mc1) then ((v_missingNamesOf dtb__177) mc1) else (B_dData_dList.C_List__x58__x58_ ((dtb__176).f_ClosureMod_cmName, ((v_missingNamesOf dtb__177) mc1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 2336 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_ifaceSelfCheckGo = (fun (mc0 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__178, dtb__179) -> (let h = (Driver_dIface.v_miIfaceHashOf dtb__178) in (let h2 = (Driver_dIface.v_hashOfIface dtb__178) in (let _u = (if (h = h2) then 0 else (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") (String.concat "" ["iface-hash-mismatch "; (Driver_dIface.v_miNameOf dtb__178); " stored="; h; " recomputed="; h2])) else 0)) in (let _u = (if (h = h2) then 0 else ((Base_dObs.v_obsCounter "vuna.counter.iface.hash.mismatch") 1)) in (if (h = h2) then (v_ifaceSelfCheckGo dtb__179) else false)))))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 2353 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_writeIfaceObjects = (fun (nFs : string) (nEnv : string) (nProcess : string) (mc0 : t_ClosureMod B_dData_dList.t_List) (mc1 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__180, dtb__181) -> (match ((v_findClosureMod (Driver_dIface.v_miNameOf dtb__180)) mc0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_writeIfaceObjects nFs) nEnv) nProcess) mc0) dtb__181)
  | B_dData_dMaybe.C_Maybe_Just (dtb__182) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((Base_dStore.v_storeObjectWriteEff nFs) nEnv) nProcess) "module-iface") v_ifaceObjectCodec) (dtb__182).f_ClosureMod_cmAddr) (Driver_dIface.v_encModuleIface dtb__180))) (fun bytes -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_writeIfaceObjects nFs) nEnv) nProcess) mc0) dtb__181)) (fun n -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if (bytes > 0) then (n + 1) else n))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 2370 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceSelfTestRequested = (fun (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_IFACE_SELFTEST")) (fun v -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v = "1")))))

# 2118 "Vuna/Compiler/Driver/Compile.vuna"
let v_payloadSelfOk = (fun (nEnv : string) (m : Driver_dIface.t_ModuleIface) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_ifaceSelfTestRequested nEnv)) (fun self -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if self then ((Driver_dIface.v_hashOfIface m) = (Driver_dIface.v_miIfaceHashOf m)) else true)))))

# 1561 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_cleanSelfOk = (fun (nFs : string) (nEnv : string) (mc0 : int) (mc1 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mc2 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__183, dtb__184) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_payloadSelfOk nEnv) dtb__183)) (fun selfOk -> (let _u = (if selfOk then 0 else (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("iface-reject=self-hash " ^ (Driver_dIface.v_miNameOf dtb__183))) else 0)) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_sourceFresh nFs) mc0) (Driver_dIface.v_miSourceOf dtb__183))) (fun fresh -> (let valid = (Driver_dCache.v_cachedProgramValid (Driver_dIface.v_miCachedOf dtb__183)) in (let missingDep = (Driver_dIface.v_hasMissingDep (Driver_dIface.v_miDepHashesOf dtb__183)) in (let ok = (if (if (if fresh then valid else false) then selfOk else false) then (B_dData_dBool.v_not missingDep) else false) in (let _u = (if selfOk then 0 else ((Base_dObs.v_obsCounter "vuna.tool.clean.reject.self") 1)) in (let _u = (if fresh then 0 else ((Base_dObs.v_obsCounter "vuna.tool.clean.reject.fresh") 1)) in (let _u = (if valid then 0 else ((Base_dObs.v_obsCounter "vuna.tool.clean.reject.cached") 1)) in (let _u = (if missingDep then ((Base_dObs.v_obsCounter "vuna.tool.clean.reject.missingdep") 1) else 0) in (((((v_cleanSelfOk nFs) nEnv) mc0) dtb__184) (if ok then (B_dData_dList.C_List__x58__x58_ (dtb__183, mc2)) else mc2))))))))))))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dList.v_reverse mc2))
  | _ -> failwith "DT: impossible branch"
))

# 1555 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolCleanGo = (fun (nFs : string) (nEnv : string) (builtSec : int) (depTbl : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (cands : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanRev : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_cleanSelfOk nFs) nEnv) builtSec) cands) B_dData_dList.C_List_Nil)) (fun ok -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_cleanFixpoint ((B_dData_dList.v_length ok) + 1)) depTbl) ok) cleanRev)))))

# 1527 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolCleanOwnModules = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (tool : t_ToolContext) (builtSec : int) (exclude : string B_dData_dMaybe.t_Maybe) (needed : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (let cands = ((B_dData_dList.v_filter ((v_ownCleanWanted needed) exclude)) ((v_selfModsOf ctx) mods)) in (let _u = ((Base_dObs.v_obsCounter "vuna.tool.clean.cands") (B_dData_dList.v_length cands)) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_readIfaceListPartialEff nFs) nEnv) nProcess) cands)) (fun clean -> (let _u = ((Base_dObs.v_obsCounter "vuna.tool.clean.read") (B_dData_dList.v_length clean)) in ((((((v_toolCleanGo nFs) nEnv) builtSec) (tool).f_ToolContext_tcDepHashes) clean) B_dData_dList.C_List_Nil)))))))))

# 2330 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceSelfCheckEff = (fun (nEnv : string) (mods : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_ifaceSelfTestRequested nEnv)) (fun self -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if self then (v_ifaceSelfCheckGo mods) else true)))))

# 2231 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeIfaceShadowGo = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : Driver_dDt.t_CheckedPackage) (pre : t_ClosureMod B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (clean : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (if ((Frontend_dPackages_dPkg.v_contextPackageName ctx) = "") then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else (if (B_dData_dBool.v_not (v_shadowAllowed ctx)) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") "iface-shadow-start") else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun t0 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match pre with
  | B_dData_dMaybe.C_Maybe_Just (dtb__185) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) dtb__185)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)
  | _ -> failwith "DT: impossible branch"
)) (fun mods -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun t1 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_ownSourceInfos nFs) nEnv) ctx) mods)) (fun sources -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun t2 -> (let depTbl = ((B_dData_dList.v_map v_modHashPair) ((v_depModsOf ctx) mods)) in (let own = ((v_selfModsOf ctx) mods) in (let cleanNames = ((B_dData_dList.v_map Driver_dIface.v_miNameOf) clean) in (let required = ((v_exportedOwnOf ctx) own) in (match ((((((((Driver_dIface.v_ifaceOfPackage (Frontend_dPackages_dPkg.v_contextPackageName ctx)) sources) depTbl) (checked).Driver_dDt.f_CheckedPackage_checkedInherited) clean) (checked).Driver_dDt.f_CheckedPackage_checkedModules) (checked).Driver_dDt.f_CheckedPackage_checkedEntryDecls) (checked).Driver_dDt.f_CheckedPackage_checkedProgram) with
  | Base_dDiag.C_Check_ErrC (dtb__186) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("iface-reject=compute iface-skip " ^ (Base_dDiag.v_diagText dtb__186))) else 0) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))))
  | Base_dDiag.C_Check_OkC (dtb__187) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun t3 -> (let unwritten = ((v_missingNamesOf required) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) dtb__187)) in (let toWrite = ((B_dData_dList.v_filter (fun (mi : Driver_dIface.t_ModuleIface) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf mi)) cleanNames)))) dtb__187) in (if ((B_dData_dList.v_length unwritten) > 0) then (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") (String.concat "" ["iface-skip partial closure="; (bi_strFromInt (B_dData_dList.v_length own)); " required="; (bi_strFromInt (B_dData_dList.v_length required)); " covered="; (bi_strFromInt (B_dData_dList.v_length dtb__187)); " missing="; ((B_dData_dString.v_join ",") unwritten)])) else 0) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_ifaceSelfCheckEff nEnv) toWrite)) (fun selfOk -> (if (B_dData_dBool.v_not selfOk) then (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("iface-selftest=skip-write " ^ (bi_strFromInt (B_dData_dList.v_length toWrite)))) else 0) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dtb__187)))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_writeOrderEff nFs) nEnv) nProcess) ctx) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) dtb__187))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.iface.write")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_writeIfaceObjects nFs) nEnv) nProcess) own) toWrite)) (fun n -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_writePkgIfaceSummaryEff nFs) nEnv) nProcess) ctx) dtb__187)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun t4 -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") (String.concat "" ["iface-write="; (bi_strFromInt n); "/"; (bi_strFromInt (B_dData_dList.v_length dtb__187)); " closure="; (bi_strFromInt (B_dData_dList.v_length own)); " phases mods="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (t1 - t0) / 1000)); "ms sources="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (t2 - t1) / 1000)); "ms compute="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (t3 - t2) / 1000)); "ms write="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (t4 - t3) / 1000)); "ms"])) else 0) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dtb__187))))))))))))))))))))))
  | _ -> failwith "DT: impossible branch"
)))))))))))))))))))

# 2225 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeIfaceShadowWithClean = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : Driver_dDt.t_CheckedPackage) (pre : t_ClosureMod B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (clean : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_ifaceWriteEnabled nEnv)) (fun enabled -> (if (B_dData_dBool.v_not enabled) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else ((((((((v_writeIfaceShadowGo nFs) nClock) nEnv) nProcess) ctx) checked) pre) clean)))))

# 2221 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeIfaceShadowWith = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : Driver_dDt.t_CheckedPackage) (pre : t_ClosureMod B_dData_dList.t_List B_dData_dMaybe.t_Maybe) -> ((((((((v_writeIfaceShadowWithClean nFs) nClock) nEnv) nProcess) ctx) checked) pre) B_dData_dList.C_List_Nil))

# 2208 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeIfaceShadow = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : Driver_dDt.t_CheckedPackage) -> (((((((v_writeIfaceShadowWith nFs) nClock) nEnv) nProcess) ctx) checked) B_dData_dMaybe.C_Maybe_Nothing))

# 2380 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkAndShadowWith = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (pre : t_ClosureMod B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (checked : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, Driver_dDt.t_CheckedPackage) B_dData_dPair.t_Pair Base_dDiag.t_Check B_dEffect_dCore.t_Eff) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) checked) (fun checkedR -> (match checkedR with
  | Base_dDiag.C_Check_ErrC (dtb__188) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__188)))
  | Base_dDiag.C_Check_OkC (dtb__189) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_writeIfaceShadowWith nFs) nClock) nEnv) nProcess) ctx) (B_dData_dPair.v_secondOf dtb__189)) pre)) (fun shadow -> (match shadow with
  | Base_dDiag.C_Check_ErrC (dtb__190) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__190)))
  | Base_dDiag.C_Check_OkC (dtb__191) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb__189))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

# 1921 "Vuna/Compiler/Driver/Compile.vuna"
let v_fullCheckExe = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "cache-path=full") else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_shadowClosureMods nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) mods) (((((Driver_dDt.v_dtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry))))))

# 1931 "Vuna/Compiler/Driver/Compile.vuna"
let v_auditCheckExe = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((v_summaryCheckExeParts nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) mods) entry)) (fun summary -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Driver_dDt.v_dtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry)) (fun full -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") ("iface-audit subject=check entry=" ^ entry)) else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_auditCompare "check") entry) (v_checkSignatureOf summary)) (v_checkSignatureOf full)))) (fun compared -> (match compared with
  | Base_dDiag.C_Check_ErrC (dtb__192) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__192)))
  | Base_dDiag.C_Check_OkC (dtb__193) -> (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) (B_dData_dMaybe.C_Maybe_Just (mods))) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) summary))
  | _ -> failwith "DT: impossible branch"
)))))))))

# 1870 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkUncachedExe = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_elabFullRequested nEnv)) (fun full -> (if full then ((((((v_fullCheckExe nFs) nClock) nEnv) nProcess) ctx) entry) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_summaryClosureMods nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_ifaceAuditRequested nEnv)) (fun audit -> (if audit then ((((((((((v_auditCheckExe nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) mods) entry) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((v_summaryCheckExeParts nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) mods) entry)) (fun summary -> (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) (B_dData_dMaybe.C_Maybe_Just (mods))) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) summary)))))))))))))

# 2377 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkAndShadow = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, Driver_dDt.t_CheckedPackage) B_dData_dPair.t_Pair Base_dDiag.t_Check B_dEffect_dCore.t_Eff) -> (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) B_dData_dMaybe.C_Maybe_Nothing) checked))

# 2419 "Vuna/Compiler/Driver/Compile.vuna"
let v_summaryCheckLibParts = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (names : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_depIfacesOfWith nFs) nClock) nEnv) nProcess) ctx) mods)) (fun depIfaces -> (match depIfaces with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "cache-path=full") else 0) in (((((Driver_dDt.v_dtCheckLibraryWithProgramParts nFs) nEnv) nProcess) ctx) names))
  | B_dData_dMaybe.C_Maybe_Just (dtb__194) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ownCleanModulesWith nFs) nEnv) nProcess) ctx) mods)) (fun clean -> (match clean with
  | B_dData_dMaybe.C_Maybe_Just (dtb__195) -> (let cleanReal = (if wantWarnings then B_dData_dList.C_List_Nil else dtb__195) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-path=summary deps=" ^ (bi_strFromInt (v_depPackageCount ctx)))) else 0) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-own-clean=" ^ (bi_strFromInt (B_dData_dList.v_length cleanReal)))) else 0) in (((((((((Driver_dDt.v_dtCheckLibraryPackageIncrementalParts nFs) nEnv) nProcess) nExit) nArgs) ctx) names) dtb__194) cleanReal))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-path=summary deps=" ^ (bi_strFromInt (v_depPackageCount ctx)))) else 0) in ((((((Driver_dDt.v_dtCheckLibraryPackageWithIfacesParts nFs) nEnv) nProcess) ctx) names) dtb__194))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

# 2450 "Vuna/Compiler/Driver/Compile.vuna"
let v_fullCheckLib = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "cache-path=full") else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_shadowClosureMods nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) mods) (((((Driver_dDt.v_dtCheckLibraryWithProgramParts nFs) nEnv) nProcess) ctx) names))))))

# 2458 "Vuna/Compiler/Driver/Compile.vuna"
let v_auditCheckLib = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (names : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((v_summaryCheckLibParts nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) mods) names)) (fun summary -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Driver_dDt.v_dtCheckLibraryWithProgramParts nFs) nEnv) nProcess) ctx) names)) (fun full -> (let subject = (v_joinLines names) in (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") ("iface-audit subject=check-lib entry=" ^ subject)) else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_auditCompare "check-lib") subject) (v_checkSignatureOf summary)) (v_checkSignatureOf full)))) (fun compared -> (match compared with
  | Base_dDiag.C_Check_ErrC (dtb__196) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__196)))
  | Base_dDiag.C_Check_OkC (dtb__197) -> ((((((v_checkAndShadow nFs) nClock) nEnv) nProcess) ctx) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) summary))
  | _ -> failwith "DT: impossible branch"
))))))))))

# 2402 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkUncachedLib = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_elabFullRequested nEnv)) (fun full -> (if full then ((((((v_fullCheckLib nFs) nClock) nEnv) nProcess) ctx) names) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_summaryClosureMods nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_ifaceAuditRequested nEnv)) (fun audit -> (if audit then ((((((((((v_auditCheckLib nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) mods) names) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((v_summaryCheckLibParts nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) mods) names)) (fun summary -> (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) (B_dData_dMaybe.C_Maybe_Just (mods))) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) summary)))))))))))))

# 2479 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitNodeSchema = "vuna-split-node 2"

# 2485 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitCacheCodec = "split-files 2"

# 2489 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitBlobTag = (fun (nFs : string) (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Loader_dFingerprint.v_cacheTagEff nFs) nEnv)) (fun tag -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (String.concat "" [v_splitNodeSchema; "/"; tag])))))

# 2505 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitInputsOf = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun closure -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_depIfacesOfWith nFs) nClock) nEnv) nProcess) ctx) closure)) (fun depIfaces -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_contextSources nFs) ctx) entry)) (fun sources -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_depIdentitiesEff nFs) nEnv) nProcess) ctx)) (fun deps -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_compilerFingerprint nFs) nEnv)) (fun fp -> (let srcHash = ((v_closureHashOf sources) 0) in (let verHash = ((v_textHash (v_splitNodeSchema ^ Base_dVersion.v_vunaVersion)) + fp) in (let prHash = (if printResult then 1 else 0) in (let mode = (match depIfaces with
  | B_dData_dMaybe.C_Maybe_Just (dtb__198) -> "s"
  | B_dData_dMaybe.C_Maybe_Nothing -> "f"
  | _ -> failwith "DT: impossible branch"
) in (let kind = (String.concat "" [mode; ":"; (if printResult then "pr1" else "pr0")]) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { f_SplitInputs_siClosure = closure; f_SplitInputs_siDepIfaces = depIfaces; f_SplitInputs_siMods = (((((((v_checkModsOf (Frontend_dPackages_dPkg.v_contextPackageName ctx)) kind) "") (v_hashText srcHash)) (v_depIdentitiesHash deps)) (v_hashText (verHash + prHash))) (v_releaseFlagOf ctx)) })))))))))))))))))

# 2528 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitBlobPath = (fun (nFs : string) (nEnv : string) (nProcess : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_cacheBase nFs) nEnv) nProcess)) (fun base -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (String.concat "" [base; "/blobs/"; digest])))))

# 2536 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeSplitBlobAt = (fun (nFs : string) (nEnv : string) (nProcess : string) (digest : string) (files : Driver_dSplit.t_SplitFile B_dData_dList.t_List) -> (let payload = ((Base_dBytes.v_encTop Driver_dSplit.v_encSplitFiles) files) in (let contentDigest = (Driver_dIface.v_payloadDigest payload) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_splitBlobTag nFs) nEnv)) (fun tag -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_splitBlobPath nFs) nEnv) nProcess) digest)) (fun path -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_cacheBase nFs) nEnv) nProcess)) (fun base -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Base_dStore.v_storeEnsureDirEff nFs) nProcess) (base ^ "/blobs"))) (fun _u -> ((((((Base_dStore.v_storeWriteIfChangedAsEff nFs) tag) v_splitCacheCodec) contentDigest) path) payload))))))))))))

# 2551 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitInOf = (fun (m : t_CheckMods) -> (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ ("split", (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmPkg, (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmKind, (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmManifest, (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmSources, (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmDeps, (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmVer, (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmFlags, B_dData_dList.C_List_Nil))))))))))))))))))

# 2563 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitPtrKind = "splitptr"

# 2566 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitPtrCodec = "split-pointer 1"

# 2569 "Vuna/Compiler/Driver/Compile.vuna"
let v_readSplitPointer = (fun (nFs : string) (nEnv : string) (nProcess : string) (fast : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Base_dStore.v_storeObjectReadEff nFs) nEnv) nProcess) v_splitPtrKind) v_splitPtrCodec) fast)) (fun saved -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match saved with
  | B_dData_dMaybe.C_Maybe_Just (dtb__199) -> (if (dtb__199 = "") then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb__199)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))

# 2579 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeSplitPointer = (fun (nFs : string) (nEnv : string) (nProcess : string) (fast : string) (sem : string) -> (((((((Base_dStore.v_storeObjectWriteEff nFs) nEnv) nProcess) v_splitPtrKind) v_splitPtrCodec) fast) sem))

# 2582 "Vuna/Compiler/Driver/Compile.vuna"
let v_defLocLine = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (p : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (String.concat "" [(B_dData_dPair.v_firstOf p); "|"; ((v_dropPrefixMeta ((Frontend_dPackages_dPkg.v_contextDir ctx) ^ "/")) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf p))); "|"; (bi_strFromInt (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf p)))]))

# 2588 "Vuna/Compiler/Driver/Compile.vuna"
let v_layoutDigestOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (modules : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ ("split-layout", ((B_dData_dList.v_concatMap (fun (m : Driver_dIface.t_ModuleIface) -> ((B_dData_dList.v_map (fun (p : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (String.concat "" [(Driver_dIface.v_miNameOf m); "|"; ((v_defLocLine ctx) p)]))) (Driver_dIface.v_miDefLocsOf m)))) (Driver_dIface.v_sortModuleIfaces modules))))))

# 2599 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitIdentityOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (printResult : bool) (tag : string) (modules : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (kind : string) (deps : string) -> (let pkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx) in (let pr = (if printResult then "1" else "0") in (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ ("split-identity", (B_dData_dList.C_List__x58__x58_ (v_splitNodeSchema, (B_dData_dList.C_List__x58__x58_ (pkg, (B_dData_dList.C_List__x58__x58_ (pr, (B_dData_dList.C_List__x58__x58_ (kind, (B_dData_dList.C_List__x58__x58_ (deps, (B_dData_dList.C_List__x58__x58_ (((Driver_dIface.v_pkgIfaceHashOfModules pkg) modules), (B_dData_dList.C_List__x58__x58_ (((Driver_dIface.v_pkgImplHashOfModules pkg) modules), (B_dData_dList.C_List__x58__x58_ (((v_layoutDigestOf ctx) modules), (B_dData_dList.C_List__x58__x58_ (tag, B_dData_dList.C_List_Nil))))))))))))))))))))))))

# 303 "Vuna/Compiler/Driver/Compile.vuna"
let v_auditCompile = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (inputs : t_SplitInputs) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((v_summarySplitParts nFs) nConsole) nClock) nEnv) nProcess) ctx) (inputs).f_SplitInputs_siClosure) (inputs).f_SplitInputs_siDepIfaces) entry) printResult)) (fun summary -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((Driver_dDt.v_dtSplitProjectParts nFs) nConsole) nEnv) nProcess) ctx) entry) printResult) ((B_dData_dList.v_map v_modHashPair) (inputs).f_SplitInputs_siClosure))) (fun full -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") ("iface-audit subject=compile entry=" ^ entry)) else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_auditCompare "compile") entry) (v_splitSignatureOf summary)) (v_splitSignatureOf full)))) (fun compared -> (match compared with
  | Base_dDiag.C_Check_ErrC (dtb__200) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__200)))
  | Base_dDiag.C_Check_OkC (dtb__201) -> (match summary with
  | Base_dDiag.C_Check_ErrC (dtb__202) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__202)))
  | Base_dDiag.C_Check_OkC (dtb__203) -> (let files = (B_dData_dPair.v_firstOf dtb__203) in (let checked = (B_dData_dPair.v_secondOf dtb__203) in (let canon = (Driver_dSplit.v_canonicalTopo files) in (let fast = (v_splitInOf (inputs).f_SplitInputs_siMods) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_writeIfaceShadowWith nFs) nClock) nEnv) nProcess) ctx) checked) (B_dData_dMaybe.C_Maybe_Just ((inputs).f_SplitInputs_siClosure)))) (fun shadow -> (match shadow with
  | Base_dDiag.C_Check_ErrC (dtb__204) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__204)))
  | Base_dDiag.C_Check_OkC (dtb__205) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Loader_dFingerprint.v_cacheTagEff nFs) nEnv)) (fun tag -> (let sem = (match dtb__205 with
  | B_dData_dList.C_List_Nil -> fast
  | _ -> ((((((v_splitIdentityOf ctx) printResult) tag) dtb__205) ((inputs).f_SplitInputs_siMods).f_CheckMods_cmKind) ((inputs).f_SplitInputs_siMods).f_CheckMods_cmDeps)
) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_writeSplitBlobAt nFs) nEnv) nProcess) sem) canon)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_writeSplitPointer nFs) nEnv) nProcess) fast) sem)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_rootKeepEff nFs) nEnv) nProcess) ctx) (B_dData_dList.C_List__x58__x58_ (fast, (B_dData_dList.C_List__x58__x58_ (sem, B_dData_dList.C_List_Nil)))))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_writeCompiledNormalized nFs) nEnv) nProcess) ctx) outDir) canon)) (fun n -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match n with
  | Base_dDiag.C_Check_ErrC (dtb__206) -> (Base_dDiag.C_Check_ErrC (dtb__206))
  | Base_dDiag.C_Check_OkC (dtb__207) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__207; B_dData_dPair.f_Pair_second = (checked).Driver_dDt.f_CheckedPackage_checkedWarnings }))
  | _ -> failwith "DT: impossible branch"
)))))))))))))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

# 2612 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolchainIdEff = (fun (nFs : string) (nEnv : string) (nProcess : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_OCAML_ID")) (fun override -> (if (override <> "") then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) override) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_cacheBase nFs) nEnv) nProcess)) (fun base -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Base_dStore.v_storeEnsureDirEff nFs) nProcess) (base ^ "/.tmp"))) (fun _u -> (let path = (base ^ "/.tmp/ocamlopt-version") in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dProcess.v_processRunIn nProcess) ".") (B_dData_dList.C_List__x58__x58_ ("sh", (B_dData_dList.C_List__x58__x58_ ("-c", (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["ocamlopt -version > \""; path; "\" 2>/dev/null || true"]), B_dData_dList.C_List_Nil)))))))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun text -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if ((B_dData_dString.v_trim text) = "") then "none" else (B_dData_dString.v_trim text))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) "none")))))))))))))))

# 2636 "Vuna/Compiler/Driver/Compile.vuna"
let v_buildViewAddrOf = (fun (nFs : string) (nEnv : string) (nProcess : string) (inputs : t_SplitInputs) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_toolchainIdEff nFs) nEnv) nProcess)) (fun tool -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ ("view-bin", (B_dData_dList.C_List__x58__x58_ ((v_splitInOf (inputs).f_SplitInputs_siMods), (B_dData_dList.C_List__x58__x58_ (tool, B_dData_dList.C_List_Nil)))))))))))

# 2643 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkInOf = (fun (m : t_CheckMods) -> (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ ("check-outcome", (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmPkg, (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmKind, (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmManifest, (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmSources, (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmDeps, (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmVer, (B_dData_dList.C_List__x58__x58_ ((m).f_CheckMods_cmFlags, B_dData_dList.C_List_Nil))))))))))))))))))

# 1779 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkViaGraph = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_CheckMods) (run : Base_dDiag.t_Diagnostic B_dData_dList.t_List Base_dDiag.t_Check B_dEffect_dCore.t_Eff) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_elabFullRequested nEnv)) (fun full -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_ifaceAuditRequested nEnv)) (fun audit -> (if (if full then true else audit) then run else (let dig = (v_checkInOf mods) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Base_dStore.v_storeObjectReadEff nFs) nEnv) nProcess) "check-outcome") Base_dDiag_dCodec.v_checkResultCodec) dig)) (fun payload -> (match payload with
  | B_dData_dMaybe.C_Maybe_Just (dtb__208) -> (let nd_uscrut16 = (Base_dDiag_dCodec.v_decCheckOutcome dtb__208) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_runAndStore nFs) nEnv) nProcess) ctx) dig) run)
  | B_dData_dMaybe.C_Maybe_Just (dtb__209) -> (match dtb__209 with
  | Base_dDiag_dCodec.C_CheckOutcome_CheckFailed (dtb__210) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "cache-path=hit") else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dObs.v_obsCountEff "vuna.counter.cache.hit") 1)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_replayFailure ((B_dData_dList.v_map (v_resolveStoredDiag ctx)) dtb__210))))))
  | Base_dDiag_dCodec.C_CheckOutcome_CheckPassed (dtb__211) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "cache-path=hit") else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dObs.v_obsCountEff "vuna.counter.cache.hit") 1)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (((B_dData_dList.v_map (v_resolveStoredDiag ctx)) dtb__211)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_runAndStore nFs) nEnv) nProcess) ctx) dig) run)
  | _ -> failwith "DT: impossible branch"
))))))))))

# 1858 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkCachedExe = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_checkModsExe nFs) nEnv) nProcess) ctx) entry)) (fun mods -> (if wantWarnings then (((((((((v_checkUncachedExe nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) entry) else ((((((v_checkViaGraph nFs) nEnv) nProcess) ctx) mods) (((((((((v_checkUncachedExe nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) entry))))))

# 2393 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkCachedLib = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_checkModsLib nFs) nEnv) nProcess) ctx) names)) (fun mods -> (if wantWarnings then (((((((((v_checkUncachedLib nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) names) else ((((((v_checkViaGraph nFs) nEnv) nProcess) ctx) mods) (((((((((v_checkUncachedLib nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) names))))))

# 92 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkPackage = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (release : bool) (wantWarnings : bool) (pkg : Frontend_dPackages_dPkg.t_Package) -> (let ctx = ((Frontend_dPackages_dPkg.v_contextWithRelease release) (Frontend_dPackages_dPkg.v_packageContext pkg)) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) (Frontend_dPackages_dPkg.v_packageEntry pkg))) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((v_checkCachedExe nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) (Frontend_dPackages_dPkg.v_packageEntry pkg))) (fun exeR -> (match exeR with
  | Base_dDiag.C_Check_ErrC (dtb__212) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__212)))
  | Base_dDiag.C_Check_OkC (dtb__213) -> (match (Frontend_dPackages_dPkg.v_packageExports pkg) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dtb__213)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__214) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_elabFullRequested nEnv)) (fun full -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if full then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false) else (((((v_orderCoversEff nFs) nEnv) nProcess) ctx) dtb__214))) (fun covered -> (if covered then (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("check-lib-skip covered=" ^ (bi_strFromInt (B_dData_dList.v_length dtb__214)))) else 0) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dtb__213)))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((v_checkCachedLib nFs) nClock) nEnv) nProcess) nExit) nArgs) false) ctx) dtb__214)) (fun libR -> (match libR with
  | Base_dDiag.C_Check_ErrC (dtb__215) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__215)))
  | Base_dDiag.C_Check_OkC (dtb__216) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append dtb__213) dtb__216))))
  | _ -> failwith "DT: impossible branch"
))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) else (match (Frontend_dPackages_dPkg.v_packageExports pkg) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((Base_dDiagnostics_dPkg.v_pkgAt1 ((Frontend_dPackages_dPkg.v_packageDir pkg) ^ "/vuna.toml")) 1) (Base_dDiagnostics_dPkg.C_PkgErr_LibraryWithoutEntry ((Frontend_dPackages_dPkg.v_packageName pkg)))) (Frontend_dPackages_dPkg.v_packageName pkg)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__217) -> (((((((((v_checkCachedLib nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) dtb__217)
  | _ -> failwith "DT: impossible branch"
))))))

# 2650 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeSplitBlob = (fun (nFs : string) (nEnv : string) (nProcess : string) (files : Driver_dSplit.t_SplitFile B_dData_dList.t_List) -> (let payload = ((Base_dBytes.v_encTop Driver_dSplit.v_encSplitFiles) files) in (let digest = (Driver_dIface.v_payloadDigest payload) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_splitBlobTag nFs) nEnv)) (fun tag -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_splitBlobPath nFs) nEnv) nProcess) digest)) (fun path -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_cacheBase nFs) nEnv) nProcess)) (fun base -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Base_dStore.v_storeEnsureDirEff nFs) nProcess) (base ^ "/blobs"))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Base_dStore.v_storeWriteIfChangedAsEff nFs) tag) v_splitCacheCodec) digest) path) payload)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) digest))))))))))))))

# 2671 "Vuna/Compiler/Driver/Compile.vuna"
let v_readSplitBlob = (fun (nFs : string) (nEnv : string) (nProcess : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_splitBlobTag nFs) nEnv)) (fun tag -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_splitBlobPath nFs) nEnv) nProcess) digest)) (fun path -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((Base_dStore.v_storeReadEff nFs) tag) v_splitCacheCodec) path)) (fun payload -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match payload with
  | B_dData_dMaybe.C_Maybe_Just (dtb__218) -> (Driver_dSplit.v_decSplitFilesComplete dtb__218)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))))))

# 240 "Vuna/Compiler/Driver/Compile.vuna"
let v_rebuildSplit = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (inputs : t_SplitInputs) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) (fast : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ownCleanInfoWith nFs) nEnv) nProcess) ctx) (inputs).f_SplitInputs_siClosure)) (fun cleanR -> (let clean = (match cleanR with
  | B_dData_dMaybe.C_Maybe_Just (dtb__228) -> dtb__228
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((v_summarySplitParts nFs) nConsole) nClock) nEnv) nProcess) ctx) (inputs).f_SplitInputs_siClosure) (inputs).f_SplitInputs_siDepIfaces) entry) printResult)) (fun summary -> (match summary with
  | Base_dDiag.C_Check_ErrC (dtb__219) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__219)))
  | Base_dDiag.C_Check_OkC (dtb__220) -> (let canon = (Driver_dSplit.v_canonicalTopo (B_dData_dPair.v_firstOf dtb__220)) in (let checked = (B_dData_dPair.v_secondOf dtb__220) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((v_writeIfaceShadowWithClean nFs) nClock) nEnv) nProcess) ctx) checked) (B_dData_dMaybe.C_Maybe_Just ((inputs).f_SplitInputs_siClosure))) clean)) (fun shadow -> (match shadow with
  | Base_dDiag.C_Check_ErrC (dtb__221) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__221)))
  | Base_dDiag.C_Check_OkC (dtb__222) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Loader_dFingerprint.v_cacheTagEff nFs) nEnv)) (fun tag -> (let sem = (match dtb__222 with
  | B_dData_dList.C_List_Nil -> fast
  | _ -> ((((((v_splitIdentityOf ctx) printResult) tag) dtb__222) ((inputs).f_SplitInputs_siMods).f_CheckMods_cmKind) ((inputs).f_SplitInputs_siMods).f_CheckMods_cmDeps)
) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_readSplitBlob nFs) nEnv) nProcess) sem)) (fun cached -> (match cached with
  | B_dData_dMaybe.C_Maybe_Just (dtb__223) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_writeSplitPointer nFs) nEnv) nProcess) fast) sem)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_rootKeepEff nFs) nEnv) nProcess) ctx) (B_dData_dList.C_List__x58__x58_ (fast, (B_dData_dList.C_List__x58__x58_ (sem, B_dData_dList.C_List_Nil)))))) (fun _u -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "split-identity-hit cache-path=hit") else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_writeCompiledNormalized nFs) nEnv) nProcess) ctx) outDir) dtb__223)) (fun n -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match n with
  | Base_dDiag.C_Check_ErrC (dtb__224) -> (Base_dDiag.C_Check_ErrC (dtb__224))
  | Base_dDiag.C_Check_OkC (dtb__225) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__225; B_dData_dPair.f_Pair_second = (checked).Driver_dDt.f_CheckedPackage_checkedWarnings }))
  | _ -> failwith "DT: impossible branch"
)))))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_writeSplitBlobAt nFs) nEnv) nProcess) sem) canon)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_writeSplitPointer nFs) nEnv) nProcess) fast) sem)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_rootKeepEff nFs) nEnv) nProcess) ctx) (B_dData_dList.C_List__x58__x58_ (fast, (B_dData_dList.C_List__x58__x58_ (sem, B_dData_dList.C_List_Nil)))))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_writeCompiledNormalized nFs) nEnv) nProcess) ctx) outDir) canon)) (fun n -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match n with
  | Base_dDiag.C_Check_ErrC (dtb__226) -> (Base_dDiag.C_Check_ErrC (dtb__226))
  | Base_dDiag.C_Check_OkC (dtb__227) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__227; B_dData_dPair.f_Pair_second = (checked).Driver_dDt.f_CheckedPackage_checkedWarnings }))
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))))))

# 212 "Vuna/Compiler/Driver/Compile.vuna"
let v_compileToDirNormal = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (inputs : t_SplitInputs) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) -> (let fast = (v_splitInOf (inputs).f_SplitInputs_siMods) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_readSplitPointer nFs) nEnv) nProcess) fast)) (fun ptr -> (match ptr with
  | B_dData_dMaybe.C_Maybe_Just (dtb__229) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_readSplitBlob nFs) nEnv) nProcess) dtb__229)) (fun cached -> (match cached with
  | B_dData_dMaybe.C_Maybe_Just (dtb__230) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "split-pointer-hit cache-path=hit") else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_writeCompiledNormalized nFs) nEnv) nProcess) ctx) outDir) dtb__230)) (fun n -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match n with
  | Base_dDiag.C_Check_ErrC (dtb__231) -> (Base_dDiag.C_Check_ErrC (dtb__231))
  | Base_dDiag.C_Check_OkC (dtb__232) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__232; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((((v_rebuildSplit nFs) nConsole) nClock) nEnv) nProcess) inputs) ctx) entry) printResult) outDir) fast)
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((((v_rebuildSplit nFs) nConsole) nClock) nEnv) nProcess) inputs) ctx) entry) printResult) outDir) fast)
  | _ -> failwith "DT: impossible branch"
)))))

# 172 "Vuna/Compiler/Driver/Compile.vuna"
let v_compileToDirGiven = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (inputs : t_SplitInputs) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_ifaceAuditRequested nEnv)) (fun audit -> (if audit then ((((((((((v_auditCompile nFs) nConsole) nClock) nEnv) nProcess) inputs) ctx) entry) printResult) outDir) else ((((((((((v_compileToDirNormal nFs) nConsole) nClock) nEnv) nProcess) inputs) ctx) entry) printResult) outDir)))))

# 164 "Vuna/Compiler/Driver/Compile.vuna"
let v_compileToDir = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_splitInputsOf nFs) nClock) nEnv) nProcess) ctx) entry) printResult)) (fun inputs -> ((((((((((v_compileToDirGiven nFs) nConsole) nClock) nEnv) nProcess) inputs) ctx) entry) printResult) outDir))))

# 418 "Vuna/Compiler/Driver/Compile.vuna"
let v_buildSplit = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (dir : string) (outDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Frontend_dPackages_dPkg.v_loadPackage nFs) nEnv) dir)) (fun pkgR -> (match pkgR with
  | Base_dDiag.C_Check_ErrC (dtb__233) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__233)))
  | Base_dDiag.C_Check_OkC (dtb__234) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((v_compileToDir nFs) nConsole) nClock) nEnv) nProcess) (Frontend_dPackages_dPkg.v_packageContext dtb__234)) (Frontend_dPackages_dPkg.v_packageEntry dtb__234)) true) outDir)) (fun r -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match r with
  | Base_dDiag.C_Check_ErrC (dtb__235) -> (Base_dDiag.C_Check_ErrC (dtb__235))
  | Base_dDiag.C_Check_OkC (dtb__236) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb__236)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))

# 827 "Vuna/Compiler/Driver/Compile.vuna"
let v_peName = (fun (p : t_PkgEntry) -> (match p with
  | { f_PkgEntry_peName = dtb__237; f_PkgEntry_peDir = dtb__238; f_PkgEntry_peKey = dtb__239; f_PkgEntry_peEnv = dtb__240 } -> dtb__237
  | _ -> failwith "DT: impossible branch"
))

# 828 "Vuna/Compiler/Driver/Compile.vuna"
let v_peDir = (fun (p : t_PkgEntry) -> (match p with
  | { f_PkgEntry_peName = dtb__241; f_PkgEntry_peDir = dtb__242; f_PkgEntry_peKey = dtb__243; f_PkgEntry_peEnv = dtb__244 } -> dtb__242
  | _ -> failwith "DT: impossible branch"
))

# 829 "Vuna/Compiler/Driver/Compile.vuna"
let v_peKey = (fun (p : t_PkgEntry) -> (match p with
  | { f_PkgEntry_peName = dtb__245; f_PkgEntry_peDir = dtb__246; f_PkgEntry_peKey = dtb__247; f_PkgEntry_peEnv = dtb__248 } -> dtb__247
  | _ -> failwith "DT: impossible branch"
))

# 830 "Vuna/Compiler/Driver/Compile.vuna"
let v_peEnv = (fun (p : t_PkgEntry) -> (match p with
  | { f_PkgEntry_peName = dtb__249; f_PkgEntry_peDir = dtb__250; f_PkgEntry_peKey = dtb__251; f_PkgEntry_peEnv = dtb__252 } -> dtb__252
  | _ -> failwith "DT: impossible branch"
))

# 833 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmPkg = (fun (p : t_ClosureMod) -> (match p with
  | { f_ClosureMod_cmPkg = dtb__253; f_ClosureMod_cmPkgKey = dtb__254; f_ClosureMod_cmPkgEnv = dtb__255; f_ClosureMod_cmName = dtb__256; f_ClosureMod_cmPath = dtb__257; f_ClosureMod_cmSrc = dtb__258; f_ClosureMod_cmImports = dtb__259; f_ClosureMod_cmAddr = dtb__260 } -> dtb__253
  | _ -> failwith "DT: impossible branch"
))

# 834 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmPkgKey = (fun (p : t_ClosureMod) -> (match p with
  | { f_ClosureMod_cmPkg = dtb__261; f_ClosureMod_cmPkgKey = dtb__262; f_ClosureMod_cmPkgEnv = dtb__263; f_ClosureMod_cmName = dtb__264; f_ClosureMod_cmPath = dtb__265; f_ClosureMod_cmSrc = dtb__266; f_ClosureMod_cmImports = dtb__267; f_ClosureMod_cmAddr = dtb__268 } -> dtb__262
  | _ -> failwith "DT: impossible branch"
))

# 835 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmPkgEnv = (fun (p : t_ClosureMod) -> (match p with
  | { f_ClosureMod_cmPkg = dtb__269; f_ClosureMod_cmPkgKey = dtb__270; f_ClosureMod_cmPkgEnv = dtb__271; f_ClosureMod_cmName = dtb__272; f_ClosureMod_cmPath = dtb__273; f_ClosureMod_cmSrc = dtb__274; f_ClosureMod_cmImports = dtb__275; f_ClosureMod_cmAddr = dtb__276 } -> dtb__271
  | _ -> failwith "DT: impossible branch"
))

# 836 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmName = (fun (p : t_ClosureMod) -> (match p with
  | { f_ClosureMod_cmPkg = dtb__277; f_ClosureMod_cmPkgKey = dtb__278; f_ClosureMod_cmPkgEnv = dtb__279; f_ClosureMod_cmName = dtb__280; f_ClosureMod_cmPath = dtb__281; f_ClosureMod_cmSrc = dtb__282; f_ClosureMod_cmImports = dtb__283; f_ClosureMod_cmAddr = dtb__284 } -> dtb__280
  | _ -> failwith "DT: impossible branch"
))

# 837 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmPath = (fun (p : t_ClosureMod) -> (match p with
  | { f_ClosureMod_cmPkg = dtb__285; f_ClosureMod_cmPkgKey = dtb__286; f_ClosureMod_cmPkgEnv = dtb__287; f_ClosureMod_cmName = dtb__288; f_ClosureMod_cmPath = dtb__289; f_ClosureMod_cmSrc = dtb__290; f_ClosureMod_cmImports = dtb__291; f_ClosureMod_cmAddr = dtb__292 } -> dtb__289
  | _ -> failwith "DT: impossible branch"
))

# 838 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmSrc = (fun (p : t_ClosureMod) -> (match p with
  | { f_ClosureMod_cmPkg = dtb__293; f_ClosureMod_cmPkgKey = dtb__294; f_ClosureMod_cmPkgEnv = dtb__295; f_ClosureMod_cmName = dtb__296; f_ClosureMod_cmPath = dtb__297; f_ClosureMod_cmSrc = dtb__298; f_ClosureMod_cmImports = dtb__299; f_ClosureMod_cmAddr = dtb__300 } -> dtb__298
  | _ -> failwith "DT: impossible branch"
))

# 839 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmImports = (fun (p : t_ClosureMod) -> (match p with
  | { f_ClosureMod_cmPkg = dtb__301; f_ClosureMod_cmPkgKey = dtb__302; f_ClosureMod_cmPkgEnv = dtb__303; f_ClosureMod_cmName = dtb__304; f_ClosureMod_cmPath = dtb__305; f_ClosureMod_cmSrc = dtb__306; f_ClosureMod_cmImports = dtb__307; f_ClosureMod_cmAddr = dtb__308 } -> dtb__307
  | _ -> failwith "DT: impossible branch"
))

# 840 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmAddr = (fun (p : t_ClosureMod) -> (match p with
  | { f_ClosureMod_cmPkg = dtb__309; f_ClosureMod_cmPkgKey = dtb__310; f_ClosureMod_cmPkgEnv = dtb__311; f_ClosureMod_cmName = dtb__312; f_ClosureMod_cmPath = dtb__313; f_ClosureMod_cmSrc = dtb__314; f_ClosureMod_cmImports = dtb__315; f_ClosureMod_cmAddr = dtb__316 } -> dtb__316
  | _ -> failwith "DT: impossible branch"
))

# 1414 "Vuna/Compiler/Driver/Compile.vuna"
let v_tcDepIfaces = (fun (p : t_ToolContext) -> (match p with
  | { f_ToolContext_tcDepIfaces = dtb__317; f_ToolContext_tcDepHashes = dtb__318; f_ToolContext_tcNeeded = dtb__319; f_ToolContext_tcOwnNames = dtb__320; f_ToolContext_tcStats = dtb__321 } -> dtb__317
  | _ -> failwith "DT: impossible branch"
))

# 1415 "Vuna/Compiler/Driver/Compile.vuna"
let v_tcDepHashes = (fun (p : t_ToolContext) -> (match p with
  | { f_ToolContext_tcDepIfaces = dtb__322; f_ToolContext_tcDepHashes = dtb__323; f_ToolContext_tcNeeded = dtb__324; f_ToolContext_tcOwnNames = dtb__325; f_ToolContext_tcStats = dtb__326 } -> dtb__323
  | _ -> failwith "DT: impossible branch"
))

# 1416 "Vuna/Compiler/Driver/Compile.vuna"
let v_tcNeeded = (fun (p : t_ToolContext) -> (match p with
  | { f_ToolContext_tcDepIfaces = dtb__327; f_ToolContext_tcDepHashes = dtb__328; f_ToolContext_tcNeeded = dtb__329; f_ToolContext_tcOwnNames = dtb__330; f_ToolContext_tcStats = dtb__331 } -> dtb__329
  | _ -> failwith "DT: impossible branch"
))

# 1419 "Vuna/Compiler/Driver/Compile.vuna"
let v_tcOwnNames = (fun (p : t_ToolContext) -> (match p with
  | { f_ToolContext_tcDepIfaces = dtb__332; f_ToolContext_tcDepHashes = dtb__333; f_ToolContext_tcNeeded = dtb__334; f_ToolContext_tcOwnNames = dtb__335; f_ToolContext_tcStats = dtb__336 } -> dtb__335
  | _ -> failwith "DT: impossible branch"
))

# 1420 "Vuna/Compiler/Driver/Compile.vuna"
let v_tcStats = (fun (p : t_ToolContext) -> (match p with
  | { f_ToolContext_tcDepIfaces = dtb__337; f_ToolContext_tcDepHashes = dtb__338; f_ToolContext_tcNeeded = dtb__339; f_ToolContext_tcOwnNames = dtb__340; f_ToolContext_tcStats = dtb__341 } -> dtb__341
  | _ -> failwith "DT: impossible branch"
))

# 1741 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmKind = (fun (p : t_CheckMods) -> (match p with
  | { f_CheckMods_cmPkg = dtb__342; f_CheckMods_cmKind = dtb__343; f_CheckMods_cmManifest = dtb__344; f_CheckMods_cmSources = dtb__345; f_CheckMods_cmDeps = dtb__346; f_CheckMods_cmVer = dtb__347; f_CheckMods_cmFlags = dtb__348 } -> dtb__343
  | _ -> failwith "DT: impossible branch"
))

# 1742 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmManifest = (fun (p : t_CheckMods) -> (match p with
  | { f_CheckMods_cmPkg = dtb__349; f_CheckMods_cmKind = dtb__350; f_CheckMods_cmManifest = dtb__351; f_CheckMods_cmSources = dtb__352; f_CheckMods_cmDeps = dtb__353; f_CheckMods_cmVer = dtb__354; f_CheckMods_cmFlags = dtb__355 } -> dtb__351
  | _ -> failwith "DT: impossible branch"
))

# 1743 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmSources = (fun (p : t_CheckMods) -> (match p with
  | { f_CheckMods_cmPkg = dtb__356; f_CheckMods_cmKind = dtb__357; f_CheckMods_cmManifest = dtb__358; f_CheckMods_cmSources = dtb__359; f_CheckMods_cmDeps = dtb__360; f_CheckMods_cmVer = dtb__361; f_CheckMods_cmFlags = dtb__362 } -> dtb__359
  | _ -> failwith "DT: impossible branch"
))

# 1744 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmDeps = (fun (p : t_CheckMods) -> (match p with
  | { f_CheckMods_cmPkg = dtb__363; f_CheckMods_cmKind = dtb__364; f_CheckMods_cmManifest = dtb__365; f_CheckMods_cmSources = dtb__366; f_CheckMods_cmDeps = dtb__367; f_CheckMods_cmVer = dtb__368; f_CheckMods_cmFlags = dtb__369 } -> dtb__367
  | _ -> failwith "DT: impossible branch"
))

# 1745 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmVer = (fun (p : t_CheckMods) -> (match p with
  | { f_CheckMods_cmPkg = dtb__370; f_CheckMods_cmKind = dtb__371; f_CheckMods_cmManifest = dtb__372; f_CheckMods_cmSources = dtb__373; f_CheckMods_cmDeps = dtb__374; f_CheckMods_cmVer = dtb__375; f_CheckMods_cmFlags = dtb__376 } -> dtb__375
  | _ -> failwith "DT: impossible branch"
))

# 1747 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmFlags = (fun (p : t_CheckMods) -> (match p with
  | { f_CheckMods_cmPkg = dtb__377; f_CheckMods_cmKind = dtb__378; f_CheckMods_cmManifest = dtb__379; f_CheckMods_cmSources = dtb__380; f_CheckMods_cmDeps = dtb__381; f_CheckMods_cmVer = dtb__382; f_CheckMods_cmFlags = dtb__383 } -> dtb__383
  | _ -> failwith "DT: impossible branch"
))

# 2500 "Vuna/Compiler/Driver/Compile.vuna"
let v_siClosure = (fun (p : t_SplitInputs) -> (match p with
  | { f_SplitInputs_siClosure = dtb__384; f_SplitInputs_siDepIfaces = dtb__385; f_SplitInputs_siMods = dtb__386 } -> dtb__384
  | _ -> failwith "DT: impossible branch"
))

# 2501 "Vuna/Compiler/Driver/Compile.vuna"
let v_siDepIfaces = (fun (p : t_SplitInputs) -> (match p with
  | { f_SplitInputs_siClosure = dtb__387; f_SplitInputs_siDepIfaces = dtb__388; f_SplitInputs_siMods = dtb__389 } -> dtb__388
  | _ -> failwith "DT: impossible branch"
))

# 2502 "Vuna/Compiler/Driver/Compile.vuna"
let v_siMods = (fun (p : t_SplitInputs) -> (match p with
  | { f_SplitInputs_siClosure = dtb__390; f_SplitInputs_siDepIfaces = dtb__391; f_SplitInputs_siMods = dtb__392 } -> dtb__392
  | _ -> failwith "DT: impossible branch"
))
