open Vuna_runtime
type t_PkgSummary = { f_PkgSummary_psOrder : string B_dData_dList.t_List; f_PkgSummary_psIfaceHash : string }
and t_PkgEntry = { f_PkgEntry_peName : string; f_PkgEntry_peDir : string; f_PkgEntry_peKey : string; f_PkgEntry_peEnv : string }
and t_ClosureMod = { f_ClosureMod_cmPkg : string; f_ClosureMod_cmPkgKey : string; f_ClosureMod_cmPkgEnv : string; f_ClosureMod_cmName : string; f_ClosureMod_cmPath : string; f_ClosureMod_cmSrc : string; f_ClosureMod_cmImports : string B_dData_dList.t_List; f_ClosureMod_cmAddr : string }
and t_ToolContext = { f_ToolContext_tcDepIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List; f_ToolContext_tcDepHashes : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_ToolContext_tcNeeded : string B_dData_dList.t_List; f_ToolContext_tcOwnNames : string B_dData_dList.t_List; f_ToolContext_tcStats : Driver_dIface.t_SourceInfo B_dData_dList.t_List }
and t_SplitInputs = { f_SplitInputs_siClosure : t_ClosureMod B_dData_dList.t_List; f_SplitInputs_siDepIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List B_dData_dMaybe.t_Maybe }

# 58 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_mapEff = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (mc0 dtb__0)) (fun y -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_mapEff mc0) dtb__1)) (fun ys -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dList.C_List__x58__x58_ (y, ys)))))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_concatMapEff = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (mc0 dtb__2)) (fun xs -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_concatMapEff mc0) dtb__3)) (fun ys -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dData_dList.v_append xs) ys))))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_mapMaybeEff = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (mc0 dtb__4)) (fun y -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_mapMaybeEff mc0) dtb__5)) (fun ys -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match y with
  | B_dData_dMaybe.C_Maybe_Just (dtb__6) -> (B_dData_dList.C_List__x58__x58_ (dtb__6, ys))
  | B_dData_dMaybe.C_Maybe_Nothing -> ys
  | _ -> failwith "DT: impossible branch"
))))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 140 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_ensureDirPathFuel = (fun (nFs : string) (nProcess : string) (fuel : int) (path : string) -> (if (fuel <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0) else (if (if (if (path = "") then true else (path = ".")) then true else (path = "/")) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_ensureDirPathFuel nFs) nProcess) (fuel - 1)) (Base_dSource.v_parentOfPath path))) (fun _u -> ((B_dEffect_dFs.v_fsMakeDir nFs) path)))))))))

# 137 "Vuna/Compiler/Driver/Compile.vuna"
let v_ensureDirPath = (fun (nFs : string) (nProcess : string) (path : string) -> ((((v_ensureDirPathFuel nFs) nProcess) 256) path))

# 179 "Vuna/Compiler/Driver/Compile.vuna"
let v_modHashPair = (fun (m : t_ClosureMod) -> { B_dData_dPair.f_Pair_first = (m).f_ClosureMod_cmName; B_dData_dPair.f_Pair_second = (m).f_ClosureMod_cmAddr })

# 192 "Vuna/Compiler/Driver/Compile.vuna"
let v_summarySplitParts = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (mc0 : Frontend_dPackages_dPkg.t_PackageContext) (mc1 : Driver_dIface.t_ModuleIface B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (mc2 : string) (mc3 : bool) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((Driver_dDt.v_dtSplitProjectParts nFs) nConsole) nEnv) nProcess) mc0) mc2) mc3)
  | B_dData_dMaybe.C_Maybe_Just (dtb__7) -> ((((((((Driver_dDt.v_dtSplitProjectWithIfaces nFs) nConsole) nEnv) nProcess) mc0) mc2) mc3) dtb__7)
  | _ -> failwith "DT: impossible branch"
))

# 272 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeFileIfChanged = (fun (nFs : string) (path : string) (content : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun old -> (if (old = content) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0) else (((B_dEffect_dFs.v_fsWriteFile nFs) path) content)))) else (((B_dEffect_dFs.v_fsWriteFile nFs) path) content)))))

# 313 "Vuna/Compiler/Driver/Compile.vuna"
let v_copyFfiFiles = (fun (nFs : string) (nProcess : string) (ctxDir : string) (outDir : string) -> (let ffiDir = (ctxDir ^ "/ffi") in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) ffiDir)) (fun exists -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if exists then ((B_dEffect_dFs.v_fsIsDirectory nFs) ffiDir) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false))) (fun isDir -> (if (if exists then isDir else false) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadDir nFs) ffiDir)) (fun names -> (let cs = ((B_dData_dList.v_filter (fun (n : string) -> ((B_dData_dString.v_endsWith ".c") n))) names) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_ensureDirPath nFs) nProcess) (outDir ^ "/ffi"))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_mapEff (fun (n : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) (String.concat "" [ffiDir; "/"; ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) n)]))) (fun content -> (((B_dEffect_dFs.v_fsWriteFile nFs) (String.concat "" [outDir; "/ffi/"; ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) n)])) content))))) cs)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dData_dList.v_map (fun (n : string) -> ("ffi/" ^ ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) n)))) cs))))))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil))))))))

# 363 "Vuna/Compiler/Driver/Compile.vuna"
let v_metaSchema = 1

# 366 "Vuna/Compiler/Driver/Compile.vuna"
let v_metaFileName = "build-meta.json"

# 370 "Vuna/Compiler/Driver/Compile.vuna"
let v_textHash = (fun (s : string) -> (Base_dHash.v_contentKey s))

# 376 "Vuna/Compiler/Driver/Compile.vuna"
let v_compilerFingerprint = (fun (nFs : string) (nEnv : string) -> ((Loader_dFingerprint.v_compilerFingerprintEff nFs) nEnv))

# 381 "Vuna/Compiler/Driver/Compile.vuna"
let v_cacheBase = (fun (nFs : string) (nEnv : string) (nProcess : string) -> (((Base_dStore.v_storeRootReadyEff nFs) nEnv) nProcess))

# 386 "Vuna/Compiler/Driver/Compile.vuna"
let v_collectVunaMeta = (fun (nFs : string) (dir : string) -> ((((Base_dWalk.v_collectFilesEff nFs) Frontend_dPackages_dSource.v_skipSourceDir) (fun (name : string) -> ((B_dData_dString.v_endsWith ".vuna") name))) dir))

# 389 "Vuna/Compiler/Driver/Compile.vuna"
let v_dropPrefixMeta = (fun (prefix : string) (s : string) -> (if ((B_dData_dString.v_startsWith prefix) s) then (((B_dData_dString.v_substring (B_dData_dString.v_byteLength prefix)) (bi_natSub (B_dData_dString.v_byteLength s) (B_dData_dString.v_byteLength prefix))) s) else s))

# 399 "Vuna/Compiler/Driver/Compile.vuna"
let v_slashToDot = (fun (c : int) -> (if (c = 47) then 46 else c))

# 396 "Vuna/Compiler/Driver/Compile.vuna"
let v_slashesToDots = (fun (s : string) -> (B_dData_dList.dtp_pack ((B_dData_dList.v_map v_slashToDot) (B_dData_dList.dtp_unpack s))))

# 402 "Vuna/Compiler/Driver/Compile.vuna"
let v_moduleNameOfPath = (fun (rootPath : string) (path : string) -> (let rel0 = ((v_dropPrefixMeta (rootPath ^ "/")) path) in (let rel = (if ((B_dData_dString.v_endsWith ".vuna") rel0) then (((B_dData_dString.v_substring 0) (bi_natSub (B_dData_dString.v_byteLength rel0) 5)) rel0) else rel0) in (v_slashesToDots rel))))

# 409 "Vuna/Compiler/Driver/Compile.vuna"
let v_rootSources = (fun (nFs : string) (root : Frontend_dPackages_dPkg.t_Root) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_collectVunaMeta nFs) (Frontend_dPackages_dPkg.v_rootDir root))) (fun paths -> ((v_mapEff (fun (p : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) p)) (fun content -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = ((v_moduleNameOfPath (Frontend_dPackages_dPkg.v_rootDir root)) p); B_dData_dPair.f_Pair_second = (v_textHash content) }))))) paths))))

# 426 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_closureHashOf = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (match dtb__8 with
  | { B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = dtb__11 } -> ((v_closureHashOf dtb__9) ((mc1 * 1000003) + dtb__11))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 420 "Vuna/Compiler/Driver/Compile.vuna"
let v_rootHash = (fun (nFs : string) (root : Frontend_dPackages_dPkg.t_Root) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_rootSources nFs) root)) (fun sources -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_closureHashOf sources) 0)))))

# 431 "Vuna/Compiler/Driver/Compile.vuna"
let v_entrySource = (fun (nFs : string) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) entry)) (fun content -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = "<entry>"; B_dData_dPair.f_Pair_second = (v_textHash content) }))))

# 438 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownRootsOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> ((B_dData_dList.v_filter (fun (r : Frontend_dPackages_dPkg.t_Root) -> ((Frontend_dPackages_dPkg.v_rootName r) = (Frontend_dPackages_dPkg.v_contextPackageName ctx)))) (Frontend_dPackages_dPkg.v_contextRoots ctx)))

# 441 "Vuna/Compiler/Driver/Compile.vuna"
let v_contextSources = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_concatMapEff (v_rootSources nFs)) (v_ownRootsOf ctx))) (fun own -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_entrySource nFs) entry)) (fun es -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dData_dList.v_append own) (B_dData_dList.C_List__x58__x58_ (es, B_dData_dList.C_List_Nil)))))))))

# 449 "Vuna/Compiler/Driver/Compile.vuna"
let v_dependencyHashes = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match (Frontend_dPackages_dPkg.v_contextRoots ctx) with
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil)
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> ((v_mapEff (fun (r : Frontend_dPackages_dPkg.t_Root) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_rootHash nFs) r)) (fun h -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (Frontend_dPackages_dPkg.v_rootName r); B_dData_dPair.f_Pair_second = h }))))) dtb__13)
  | _ -> failwith "DT: impossible branch"
))

# 468 "Vuna/Compiler/Driver/Compile.vuna"
let v_compilerClosureModule = "Vuna.Compiler.Loader.Fingerprint"

# 495 "Vuna/Compiler/Driver/Compile.vuna"
let v_pkgSummaryKind = "pkg-summary"

# 498 "Vuna/Compiler/Driver/Compile.vuna"
let v_pkgSummaryCodec = "pkg-summary 1"

# 506 "Vuna/Compiler/Driver/Compile.vuna"
let v_encPkgSummary = (fun (s : t_PkgSummary) -> ((Base_dBytes.v_encTop (Base_dBytes.v_encList Base_dBytes.v_encStr)) (B_dData_dList.C_List__x58__x58_ ((s).f_PkgSummary_psIfaceHash, (s).f_PkgSummary_psOrder))))

# 509 "Vuna/Compiler/Driver/Compile.vuna"
let v_decPkgSummary = (fun (payload : string) -> (let nd_uscrut1 = (((Base_dBytes.v_decList Base_dBytes.v_decStr) (bi_strLength payload)) (Base_dBytes.v_curOf payload)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__14) -> (match dtb__14 with
  | { B_dData_dPair.f_Pair_first = dtb__15; B_dData_dPair.f_Pair_second = dtb__16 } -> (match dtb__15 with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb__17, dtb__18) -> (if (Base_dBytes.v_curAtEnd dtb__16) then (B_dData_dMaybe.C_Maybe_Just ({ f_PkgSummary_psOrder = dtb__18; f_PkgSummary_psIfaceHash = dtb__17 })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 516 "Vuna/Compiler/Driver/Compile.vuna"
let v_pkgSummaryKeyOf = (fun (pkg : string) (srcClosure : string) (tag : string) -> (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ ("pkg-summary", (B_dData_dList.C_List__x58__x58_ (pkg, (B_dData_dList.C_List__x58__x58_ (srcClosure, (B_dData_dList.C_List__x58__x58_ (tag, B_dData_dList.C_List_Nil))))))))))

# 519 "Vuna/Compiler/Driver/Compile.vuna"
let v_readPkgSummaryAt = (fun (nFs : string) (nEnv : string) (nProcess : string) (root : Frontend_dPackages_dPkg.t_Root) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_rootHash nFs) root)) (fun h -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Loader_dFingerprint.v_cacheTagEff nFs) nEnv)) (fun tag -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Base_dStore.v_storeObjectReadEff nFs) nEnv) nProcess) v_pkgSummaryKind) v_pkgSummaryCodec) (((v_pkgSummaryKeyOf (Frontend_dPackages_dPkg.v_rootName root)) (bi_strFromInt h)) tag))) (fun payload -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match payload with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__19) -> (v_decPkgSummary dtb__19)
  | _ -> failwith "DT: impossible branch"
)))))))))

# 535 "Vuna/Compiler/Driver/Compile.vuna"
let v_manifestIdentityOf = (fun (nFs : string) (root : Frontend_dPackages_dPkg.t_Root) (h : int) -> (let tomlPath = ((Frontend_dPackages_dPkg.v_rootDir root) ^ "/vuna.toml") in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) tomlPath)) (fun exists -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if exists then ((B_dEffect_dFs.v_fsReadFile nFs) tomlPath) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ""))) (fun toml -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (Frontend_dPackages_dPkg.v_rootName root); B_dData_dPair.f_Pair_second = (String.concat "" ["manifest:"; (bi_strFromInt (v_textHash toml)); ":"; (bi_strFromInt h)]) })))))))

# 546 "Vuna/Compiler/Driver/Compile.vuna"
let v_depRootIdentityEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (root : Frontend_dPackages_dPkg.t_Root) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_rootHash nFs) root)) (fun h -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_readPkgSummaryAt nFs) nEnv) nProcess) root)) (fun saved -> (let verdict = (match saved with
  | B_dData_dMaybe.C_Maybe_Just (dtb__21) -> "iface"
  | B_dData_dMaybe.C_Maybe_Nothing -> "manifest"
  | _ -> failwith "DT: impossible branch"
) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") (String.concat "" ["dep-identity="; (Frontend_dPackages_dPkg.v_rootName root); " verdict="; verdict; " src="; (bi_strFromInt h)])) else 0) in (match saved with
  | B_dData_dMaybe.C_Maybe_Just (dtb__20) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (Frontend_dPackages_dPkg.v_rootName root); B_dData_dPair.f_Pair_second = ("iface:" ^ (dtb__20).f_PkgSummary_psIfaceHash) })
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_manifestIdentityOf nFs) root) h)
  | _ -> failwith "DT: impossible branch"
))))))))

# 561 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIdentitiesEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match (Frontend_dPackages_dPkg.v_contextRoots ctx) with
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil)
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> ((v_mapEff (((v_depRootIdentityEff nFs) nEnv) nProcess)) dtb__23)
  | _ -> failwith "DT: impossible branch"
))

# 570 "Vuna/Compiler/Driver/Compile.vuna"
let v_pairText = (fun (p : (string, string) B_dData_dPair.t_Pair) -> (String.concat "" [(B_dData_dPair.v_firstOf p); "="; (B_dData_dPair.v_secondOf p)]))

# 567 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIdentitiesHash = (fun (pairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ ("dep-identities", ((B_dData_dList.v_map v_pairText) pairs)))))

# 472 "Vuna/Compiler/Driver/Compile.vuna"
let v_buildIdForEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_concatMapEff (v_rootSources nFs)) (v_ownRootsOf ctx))) (fun own -> (if ((B_dData_dList.v_memName v_compilerClosureModule) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) own)) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_depIdentitiesEff nFs) nEnv) nProcess) ctx)) (fun deps -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Loader_dFingerprint.v_compilerIdOf own) (v_depIdentitiesHash deps))))) else ((Loader_dFingerprint.v_compilerTagEff nFs) nEnv)))))

# 285 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeCompiledNormalized = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (outDir : string) (files : Driver_dSplit.t_SplitFile B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_ensureDirPath nFs) nProcess) outDir)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_buildIdForEff nFs) nEnv) nProcess) ctx)) (fun id -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_writeFileIfChanged nFs) (String.concat "" [outDir; "/"; Loader_dFingerprint.v_buildIdFileName])) (id ^ "\n"))) (fun _u -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") "write-compiled-start") else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Driver_dSplit.v_writeSplitFilesIfChanged nFs) outDir) files)) (fun written -> (match written with
  | Base_dDiag.C_Check_ErrC (dtb__24) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__24)))
  | Base_dDiag.C_Check_OkC (dtb__25) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") "write-split-files-done") else 0) in (let graph = (Driver_dSplit.v_splitGraph files) in (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") "split-graph-done") else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_copyFfiFiles nFs) nProcess) (Frontend_dPackages_dPkg.v_contextDir ctx)) outDir)) (fun cFiles -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dFs.v_fsWriteFile nFs) (outDir ^ "/build.sh")) ((Driver_dSplit.v_buildScript graph) cFiles))) (fun _u -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") "build-script-done") else 0) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dtb__25)))))))))))
  | _ -> failwith "DT: impossible branch"
)))))))))))

# 574 "Vuna/Compiler/Driver/Compile.vuna"
let v_writePkgSummaryEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (modules : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match ((B_dData_dList.v_filter (fun (r : Frontend_dPackages_dPkg.t_Root) -> ((Frontend_dPackages_dPkg.v_rootName r) = (Frontend_dPackages_dPkg.v_contextPackageName ctx)))) (Frontend_dPackages_dPkg.v_contextRoots ctx)) with
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0)
  | B_dData_dList.C_List__x58__x58_ (dtb__26, dtb__27) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_rootHash nFs) dtb__26)) (fun h -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Loader_dFingerprint.v_cacheTagEff nFs) nEnv)) (fun tag -> (let summary = { f_PkgSummary_psOrder = ((B_dData_dList.v_map Driver_dIface.v_miNameOf) modules); f_PkgSummary_psIfaceHash = ((Driver_dIface.v_pkgIfaceHashOfModules (Frontend_dPackages_dPkg.v_contextPackageName ctx)) modules) } in (let key = (((v_pkgSummaryKeyOf (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (bi_strFromInt h)) tag) in (((((((Base_dStore.v_storeObjectWriteEff nFs) nEnv) nProcess) v_pkgSummaryKind) v_pkgSummaryCodec) key) (v_encPkgSummary summary))))))))
  | _ -> failwith "DT: impossible branch"
))

# 587 "Vuna/Compiler/Driver/Compile.vuna"
let v_metaPairText = (fun (mc0 : (string, int) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__28; B_dData_dPair.f_Pair_second = dtb__29 } -> (String.concat "" ["{\"name\":\""; dtb__28; "\",\"hash\":"; (bi_strFromInt dtb__29); "}"])
  | _ -> failwith "DT: impossible branch"
))

# 590 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_joinJsonList = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__30, dtb__31) -> (match dtb__31 with
  | B_dData_dList.C_List_Nil -> dtb__30
  | _ -> (String.concat "" [dtb__30; ","; (v_joinJsonList dtb__31)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 597 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_lastSegmentRev = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__32, dtb__33) -> (if (dtb__32 = 47) then (B_dData_dList.dtp_pack mc1) else ((v_lastSegmentRev dtb__33) (B_dData_dList.C_List__x58__x58_ (dtb__32, mc1))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.dtp_pack mc1)
  | _ -> failwith "DT: impossible branch"
))

# 601 "Vuna/Compiler/Driver/Compile.vuna"
let v_lastSegment = (fun (path : string) -> ((v_lastSegmentRev (B_dData_dList.v_reverse (B_dData_dList.dtp_unpack path))) B_dData_dList.C_List_Nil))

# 616 "Vuna/Compiler/Driver/Compile.vuna"
let v_metaPathOf = (fun (outDir : string) -> (String.concat "" [outDir; "/"; v_metaFileName]))

# 645 "Vuna/Compiler/Driver/Compile.vuna"
let v_runBuildScript = (fun (nProcess : string) (dir : string) (out : string) (name : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dProcess.v_processRunIn nProcess) dir) (B_dData_dList.C_List__x58__x58_ ("sh", (B_dData_dList.C_List__x58__x58_ ("build.sh", (B_dData_dList.C_List__x58__x58_ (out, B_dData_dList.C_List_Nil)))))))) (fun code -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if (code = 0) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_err (String.concat "" ["build: "; name; ": sh build.sh "; out; " failed in "; dir; " (exit "; (bi_strFromInt code); ")"])))))))

# 653 "Vuna/Compiler/Driver/Compile.vuna"
let v_projectIdOf = (fun (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Frontend_dPackages_dPkg.v_absolutePath nEnv) (Frontend_dPackages_dPkg.v_contextDir ctx))) (fun abs -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Loader_dAddr.v_projectIdAddrOf abs)))))

# 667 "Vuna/Compiler/Driver/Compile.vuna"
let v_maybeSemanticText = (fun (mc0 : string B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__34) -> dtb__34
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 671 "Vuna/Compiler/Driver/Compile.vuna"
let v_depSourceText = (fun (mc0 : Frontend_dManifest.t_DependencySource) -> (match mc0 with
  | Frontend_dManifest.C_DependencySource_DepUrl (dtb__35) -> ("url:" ^ dtb__35)
  | Frontend_dManifest.C_DependencySource_DepGit (dtb__36, dtb__37) -> (String.concat "" ["git:"; dtb__36; "@"; dtb__37])
  | Frontend_dManifest.C_DependencySource_DepPath (dtb__38) -> ("path:" ^ dtb__38)
  | _ -> failwith "DT: impossible branch"
))

# 676 "Vuna/Compiler/Driver/Compile.vuna"
let v_depSemanticText = (fun (d : Frontend_dManifest.t_Dependency) -> (String.concat "" [(d).Frontend_dManifest.f_Dependency_depAlias; "|"; (v_depSourceText (d).Frontend_dManifest.f_Dependency_depSource); "|"; (v_maybeSemanticText (d).Frontend_dManifest.f_Dependency_depHash); "|"; (v_maybeSemanticText (d).Frontend_dManifest.f_Dependency_depIdentity)]))

# 680 "Vuna/Compiler/Driver/Compile.vuna"
let v_manifestSemanticText = (fun (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__39) -> (let man = (dtb__39).Frontend_dPackages_dPkg.f_Package_packageManifest in (let exportsText = (match (man).Frontend_dManifest.f_Manifest_manifestExports with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb__40) -> ((B_dData_dString.v_join ",") dtb__40)
  | _ -> failwith "DT: impossible branch"
) in ((B_dData_dString.v_join "\n") (B_dData_dList.C_List__x58__x58_ (("name:" ^ (v_maybeSemanticText (man).Frontend_dManifest.f_Manifest_manifestName)), (B_dData_dList.C_List__x58__x58_ (("exports:" ^ exportsText), ((B_dData_dList.v_map v_depSemanticText) (man).Frontend_dManifest.f_Manifest_manifestDependencies))))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 604 "Vuna/Compiler/Driver/Compile.vuna"
let v_buildMetaText = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (linked : bool) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_contextSources nFs) ctx) entry)) (fun sources -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_dependencyHashes nFs) ctx)) (fun deps -> (let manifestHash = (v_textHash (v_manifestSemanticText (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage)) in (let entryName = (v_lastSegment entry) in (let linkedText = (if linked then "true" else "false") in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (String.concat "" ["{\"schema\":"; (bi_strFromInt v_metaSchema); ",\"compiler\":\""; Base_dVersion.v_vunaVersion; "\",\"package\":\""; (Frontend_dPackages_dPkg.v_contextPackageName ctx); "\",\"entry\":\""; entryName; "\",\"linked\":"; linkedText; ",\"closure\":"; (bi_strFromInt ((v_closureHashOf sources) 0)); ",\"manifest\":"; (bi_strFromInt manifestHash); ",\"sources\":["; (v_joinJsonList ((B_dData_dList.v_map v_metaPairText) sources)); "],\"dependencies\":["; (v_joinJsonList ((B_dData_dList.v_map v_metaPairText) deps)); "]}\n"]))))))))))

# 619 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeBuildMeta = (fun (nFs : string) (outDir : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (linked : bool) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_buildMetaText nFs) ctx) entry) linked)) (fun text -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dFs.v_fsWriteFile nFs) (v_metaPathOf outDir)) text)) (fun n -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) n))))))

# 627 "Vuna/Compiler/Driver/Compile.vuna"
let v_metaUpToDate = (fun (nFs : string) (outDir : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (binPath : string) -> (let path = (v_metaPathOf outDir) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if exists then ((B_dEffect_dFs.v_fsFileExists nFs) binPath) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false))) (fun binExists -> (if (if exists then binExists else false) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun raw -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_buildMetaText nFs) ctx) entry) true)) (fun expected -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (raw = expected)))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false))))))))

# 708 "Vuna/Compiler/Driver/Compile.vuna"
let v_depPackagesOf = (fun (mc0 : Frontend_dPackages_dPkg.t_Package) -> (match mc0 with
  | { Frontend_dPackages_dPkg.f_Package_packageManifest = dtb__41; Frontend_dPackages_dPkg.f_Package_packageDependencies = dtb__42; Frontend_dPackages_dPkg.f_Package_packageDir = dtb__43 } -> dtb__42
  | _ -> failwith "DT: impossible branch"
))

# 696 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_collectDepPackages = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__44, dtb__45) -> (if ((B_dData_dList.v_memName (Frontend_dPackages_dPkg.v_packageName dtb__44)) mc0) then ((v_collectDepPackages mc0) dtb__45) else (match ((v_collectDepPackages (B_dData_dList.C_List__x58__x58_ ((Frontend_dPackages_dPkg.v_packageName dtb__44), mc0))) (v_depPackagesOf dtb__44)) with
  | { B_dData_dPair.f_Pair_first = dtb__46; B_dData_dPair.f_Pair_second = dtb__47 } -> (match ((v_collectDepPackages dtb__46) dtb__45) with
  | { B_dData_dPair.f_Pair_first = dtb__48; B_dData_dPair.f_Pair_second = dtb__49 } -> { B_dData_dPair.f_Pair_first = dtb__48; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__47) (B_dData_dList.C_List__x58__x58_ (dtb__44, dtb__49))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 714 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_allNamesIn = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__50, dtb__51) -> (if ((B_dData_dList.v_memName dtb__50) mc1) then ((v_allNamesIn dtb__51) mc1) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 711 "Vuna/Compiler/Driver/Compile.vuna"
let v_sameNameSet = (fun (a : string B_dData_dList.t_List) (b : string B_dData_dList.t_List) -> (if (if ((B_dData_dList.v_length a) = (B_dData_dList.v_length b)) then ((v_allNamesIn a) b) else false) then ((v_allNamesIn b) a) else false))

# 725 "Vuna/Compiler/Driver/Compile.vuna"
let v_depPackageList = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__52) -> (B_dData_dPair.v_secondOf ((v_collectDepPackages B_dData_dList.C_List_Nil) (dtb__52).Frontend_dPackages_dPkg.f_Package_packageDependencies))
  | _ -> failwith "DT: impossible branch"
))

# 731 "Vuna/Compiler/Driver/Compile.vuna"
let v_depPackageCount = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (B_dData_dList.v_length (v_depPackageList ctx)))

# 743 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceObjectCodec = "module-iface 6"

# 768 "Vuna/Compiler/Driver/Compile.vuna"
let v_pkgKeyOf = (fun (name : string) -> (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ ("pkg", (B_dData_dList.C_List__x58__x58_ (name, B_dData_dList.C_List_Nil))))))

# 787 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_findPkgEntry = (fun (mc0 : string) (mc1 : t_PkgEntry B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__53, dtb__54) -> (if ((dtb__53).f_PkgEntry_peName = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__53)) else ((v_findPkgEntry mc0) dtb__54))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 791 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_findClosureMod = (fun (mc0 : string) (mc1 : t_ClosureMod B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__55, dtb__56) -> (if ((dtb__55).f_ClosureMod_cmName = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__55)) else ((v_findClosureMod mc0) dtb__56))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 817 "Vuna/Compiler/Driver/Compile.vuna"
let v_closureModOf = (fun (nFs : string) (nEnv : string) (nProcess : string) (pe : t_PkgEntry) (root : string) (p : string) (raw : string) -> (let name = ((v_moduleNameOfPath root) p) in (let src = (Base_dHash.v_contentAddress raw) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Loader_dFlatten.v_parseFileWithPath nFs) p) raw)) (fun parsed -> (let imports = (match parsed with
  | Base_dDiag.C_Check_ErrC (dtb__57) -> B_dData_dList.C_List_Nil
  | Base_dDiag.C_Check_OkC (dtb__58) -> (let hdr = ((Loader_dAddr.v_headerOfSource "") (B_dData_dPair.v_firstOf dtb__58)) in (hdr).Loader_dAddr.f_ModHeader_mhImports)
  | _ -> failwith "DT: impossible branch"
) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { f_ClosureMod_cmPkg = (pe).f_PkgEntry_peName; f_ClosureMod_cmPkgKey = (pe).f_PkgEntry_peKey; f_ClosureMod_cmPkgEnv = (pe).f_PkgEntry_peEnv; f_ClosureMod_cmName = name; f_ClosureMod_cmPath = p; f_ClosureMod_cmSrc = src; f_ClosureMod_cmImports = imports; f_ClosureMod_cmAddr = "" })))))))

# 797 "Vuna/Compiler/Driver/Compile.vuna"
let v_closureModsEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (pkgs : t_PkgEntry B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_mapEff (fun (r : Frontend_dPackages_dPkg.t_Root) -> (match ((v_findPkgEntry (Frontend_dPackages_dPkg.v_rootName r)) pkgs) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil)
  | B_dData_dMaybe.C_Maybe_Just (dtb__59) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_collectVunaMeta nFs) (Frontend_dPackages_dPkg.v_rootDir r))) (fun paths -> ((v_mapEff (fun (p : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) p)) (fun raw -> (((((((v_closureModOf nFs) nEnv) nProcess) dtb__59) (Frontend_dPackages_dPkg.v_rootDir r)) p) raw))))) paths)))
  | _ -> failwith "DT: impossible branch"
))) (Frontend_dPackages_dPkg.v_contextRoots ctx))) (fun per -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dData_dList.v_concatMap (fun (xs : t_ClosureMod B_dData_dList.t_List) -> xs)) per)))))

# 839 "Vuna/Compiler/Driver/Compile.vuna"
let v_appendPrelude = (fun (hasPrelude : bool) (m : t_ClosureMod) -> (if (if (if hasPrelude then ((m).f_ClosureMod_cmName <> "Prelude") else false) then (B_dData_dBool.v_not ((B_dData_dList.v_memName "Prelude") (m).f_ClosureMod_cmImports)) else false) then { f_ClosureMod_cmPkg = (m).f_ClosureMod_cmPkg; f_ClosureMod_cmPkgKey = (m).f_ClosureMod_cmPkgKey; f_ClosureMod_cmPkgEnv = (m).f_ClosureMod_cmPkgEnv; f_ClosureMod_cmName = (m).f_ClosureMod_cmName; f_ClosureMod_cmPath = (m).f_ClosureMod_cmPath; f_ClosureMod_cmSrc = (m).f_ClosureMod_cmSrc; f_ClosureMod_cmImports = ((B_dData_dList.v_append (m).f_ClosureMod_cmImports) (B_dData_dList.C_List__x58__x58_ ("Prelude", B_dData_dList.C_List_Nil))); f_ClosureMod_cmAddr = "" } else m))

# 854 "Vuna/Compiler/Driver/Compile.vuna"
let v_modGraphEntry = (fun (m : t_ClosureMod) -> { B_dData_dPair.f_Pair_first = (m).f_ClosureMod_cmName; B_dData_dPair.f_Pair_second = (m).f_ClosureMod_cmImports })

# 857 "Vuna/Compiler/Driver/Compile.vuna"
let v_modNameOf = (fun (m : t_ClosureMod) -> (m).f_ClosureMod_cmName)

# 860 "Vuna/Compiler/Driver/Compile.vuna"
let v_isDepModOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (m : t_ClosureMod) -> ((m).f_ClosureMod_cmPkg <> (Frontend_dPackages_dPkg.v_contextPackageName ctx)))

# 863 "Vuna/Compiler/Driver/Compile.vuna"
let v_isSelfModOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (m : t_ClosureMod) -> ((m).f_ClosureMod_cmPkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx)))

# 866 "Vuna/Compiler/Driver/Compile.vuna"
let v_moduleGraphOf = (fun (mods : t_ClosureMod B_dData_dList.t_List) -> ((B_dData_dList.v_map v_modGraphEntry) mods))

# 878 "Vuna/Compiler/Driver/Compile.vuna"
let v_depSrcOf = (fun (tbl : (string, string) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__60) -> dtb__60
  | B_dData_dMaybe.C_Maybe_Nothing -> ("ext:" ^ name)
  | _ -> failwith "DT: impossible branch"
))

# 888 "Vuna/Compiler/Driver/Compile.vuna"
let v_srcPairOf = (fun (m : t_ClosureMod) -> { B_dData_dPair.f_Pair_first = (v_modNameOf m); B_dData_dPair.f_Pair_second = (String.concat "" [(m).f_ClosureMod_cmPkgKey; "|"; (m).f_ClosureMod_cmSrc]) })

# 885 "Vuna/Compiler/Driver/Compile.vuna"
let v_srcTblOf = (fun (mods : t_ClosureMod B_dData_dList.t_List) -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map v_srcPairOf) mods)))

# 892 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceAddrOf = (fun (srcTbl : (string, string) B_dContainer_dHashMap.t_HashMap) (m : t_ClosureMod) -> (Loader_dAddr.v_addrOf ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ("module-iface", (B_dData_dList.C_List__x58__x58_ (v_ifaceObjectCodec, (B_dData_dList.C_List__x58__x58_ ((m).f_ClosureMod_cmPkgKey, (B_dData_dList.C_List__x58__x58_ ((m).f_ClosureMod_cmName, (B_dData_dList.C_List__x58__x58_ ((m).f_ClosureMod_cmSrc, (B_dData_dList.C_List__x58__x58_ ((m).f_ClosureMod_cmPkgEnv, B_dData_dList.C_List_Nil))))))))))))) ((B_dData_dList.v_map (v_depSrcOf srcTbl)) (m).f_ClosureMod_cmImports))))

# 897 "Vuna/Compiler/Driver/Compile.vuna"
let v_withAddr = (fun (srcTbl : (string, string) B_dContainer_dHashMap.t_HashMap) (m : t_ClosureMod) -> { f_ClosureMod_cmPkg = (m).f_ClosureMod_cmPkg; f_ClosureMod_cmPkgKey = (m).f_ClosureMod_cmPkgKey; f_ClosureMod_cmPkgEnv = (m).f_ClosureMod_cmPkgEnv; f_ClosureMod_cmName = (m).f_ClosureMod_cmName; f_ClosureMod_cmPath = (m).f_ClosureMod_cmPath; f_ClosureMod_cmSrc = (m).f_ClosureMod_cmSrc; f_ClosureMod_cmImports = (m).f_ClosureMod_cmImports; f_ClosureMod_cmAddr = ((v_ifaceAddrOf srcTbl) m) })

# 916 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceModsWithEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (pkgs : t_PkgEntry B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.iface.compute")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun ta -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_closureModsEff nFs) nEnv) nProcess) ctx) pkgs)) (fun mods0 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun tb -> (let hasPrelude = ((B_dData_dList.v_memName "Prelude") ((B_dData_dList.v_map v_modNameOf) mods0)) in (let mods = ((B_dData_dList.v_map (v_appendPrelude hasPrelude)) mods0) in (let srcTbl = (v_srcTblOf mods) in (let assigned = ((B_dData_dList.v_map (v_withAddr srcTbl)) mods) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") (String.concat "" ["iface-mods-phases n="; (bi_strFromInt (B_dData_dList.v_length mods)); " closure="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (tb - ta) / 1000)); "ms assign=direct"])) else 0))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.iface.compute")) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) assigned))))))))))))))))))

# 991 "Vuna/Compiler/Driver/Compile.vuna"
let v_readIfaceAtEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (a : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Base_dStore.v_storeObjectReadEff nFs) nEnv) nProcess) "module-iface") v_ifaceObjectCodec) a)) (fun payload -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match payload with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__61) -> (Driver_dIface.v_decModuleIfaceComplete dtb__61)
  | _ -> failwith "DT: impossible branch"
)))))

# 1007 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_readIfaceListPartialEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (mc0 : t_ClosureMod B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__62, dtb__63) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_readIfaceAtEff nFs) nEnv) nProcess) (dtb__62).f_ClosureMod_cmAddr)) (fun mi -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_readIfaceListPartialEff nFs) nEnv) nProcess) dtb__63)) (fun xs -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match mi with
  | B_dData_dMaybe.C_Maybe_Nothing -> xs
  | B_dData_dMaybe.C_Maybe_Just (dtb__64) -> (B_dData_dList.C_List__x58__x58_ (dtb__64, xs))
  | _ -> failwith "DT: impossible branch"
))))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 1019 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_readIfaceListEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (mc0 : t_ClosureMod B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__65, dtb__66) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_readIfaceAtEff nFs) nEnv) nProcess) (dtb__65).f_ClosureMod_cmAddr)) (fun mi -> (match mi with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") (String.concat "" ["iface-miss "; (dtb__65).f_ClosureMod_cmName; " "; (dtb__65).f_ClosureMod_cmAddr; " pkg="; (dtb__65).f_ClosureMod_cmPkg; " src="; (dtb__65).f_ClosureMod_cmSrc])) else 0) in (let _u = (Base_dObs.v_obsMark (String.concat "" ["vuna.tool.iface.miss:"; (dtb__65).f_ClosureMod_cmName; ":"; (dtb__65).f_ClosureMod_cmAddr])) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dObs.v_obsCountEff "vuna.counter.cache.miss") 1)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing)))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__67) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dObs.v_obsCountEff "vuna.counter.cache.hit") 1)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_readIfaceListEff nFs) nEnv) nProcess) dtb__66)) (fun xs -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match xs with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__68) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__67, dtb__68))))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))

# 1043 "Vuna/Compiler/Driver/Compile.vuna"
let v_depModsOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> ((B_dData_dList.v_filter (v_isDepModOf ctx)) mods))

# 1046 "Vuna/Compiler/Driver/Compile.vuna"
let v_selfModsOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> ((B_dData_dList.v_filter (v_isSelfModOf ctx)) mods))

# 1081 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_rootOfName = (fun (mc0 : string) (mc1 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70) -> (if ((Frontend_dPackages_dPkg.v_rootName dtb__69) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__69)) else ((v_rootOfName mc0) dtb__70))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1086 "Vuna/Compiler/Driver/Compile.vuna"
let v_readOrderEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (pkg : string) -> (match ((v_rootOfName pkg) (Frontend_dPackages_dPkg.v_contextRoots ctx)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Just (dtb__71) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_readPkgSummaryAt nFs) nEnv) nProcess) dtb__71)) (fun summary -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match summary with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__72) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__72).f_PkgSummary_psOrder))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 1100 "Vuna/Compiler/Driver/Compile.vuna"
let v_orderCoversEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_readOrderEff nFs) nEnv) nProcess) ctx) (Frontend_dPackages_dPkg.v_contextPackageName ctx))) (fun ord -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match ord with
  | B_dData_dMaybe.C_Maybe_Just (dtb__73) -> ((v_allNamesIn names) dtb__73)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)))))

# 1110 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_pickByOrder = (fun (mc0 : t_ClosureMod B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (match ((v_findClosureMod dtb__74) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__76) -> (B_dData_dList.C_List__x58__x58_ (dtb__76, ((v_pickByOrder mc0) dtb__75)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_pickByOrder mc0) dtb__75)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1117 "Vuna/Compiler/Driver/Compile.vuna"
let v_pkgEq = (fun (p : string) (m : t_ClosureMod) -> ((m).f_ClosureMod_cmPkg = p))

# 1120 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_distinctPkgs = (fun (mc0 : t_ClosureMod B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__77, dtb__78) -> (if ((B_dData_dList.v_memName (dtb__77).f_ClosureMod_cmPkg) mc1) then ((v_distinctPkgs dtb__78) mc1) else ((v_distinctPkgs dtb__78) (B_dData_dList.C_List__x58__x58_ ((dtb__77).f_ClosureMod_cmPkg, mc1))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 1154 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_rootExportsOf = (fun (mc0 : string) (mc1 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__79, dtb__80) -> (if ((Frontend_dPackages_dPkg.v_rootName dtb__79) = mc0) then (dtb__79).Frontend_dPackages_dPkg.f_Root_rootExports else ((v_rootExportsOf mc0) dtb__80))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1165 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_pickDepMods = (fun (mc0 : Frontend_dPackages_dPkg.t_PackageContext) (mc1 : t_ClosureMod B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__81, dtb__82) -> (if ((B_dData_dList.v_memName dtb__81) mc3) then ((((v_pickDepMods mc0) mc1) dtb__82) mc3) else (match ((v_findClosureMod dtb__81) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__83) -> (if ((dtb__83).f_ClosureMod_cmPkg <> (Frontend_dPackages_dPkg.v_contextPackageName mc0)) then (B_dData_dList.C_List__x58__x58_ (dtb__83, ((((v_pickDepMods mc0) mc1) dtb__82) (B_dData_dList.C_List__x58__x58_ (dtb__81, mc3))))) else ((((v_pickDepMods mc0) mc1) dtb__82) (B_dData_dList.C_List__x58__x58_ (dtb__81, mc3))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_pickDepMods mc0) mc1) dtb__82) mc3)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1183 "Vuna/Compiler/Driver/Compile.vuna"
let v_importNameStr = (fun (mc0 : Frontend_dAst.t_Import) -> (match mc0 with
  | { Frontend_dAst.f_Import_importName = dtb__84; Frontend_dAst.f_Import_importIsQualified = dtb__85; Frontend_dAst.f_Import_importAlias = dtb__86; Frontend_dAst.f_Import_importRef = dtb__87 } -> dtb__84
  | _ -> failwith "DT: impossible branch"
))

# 1201 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolImportNamesOf = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (current : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Loader_dFlatten.v_implicitPrelude nFs) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) current) imports)) (fun implicitR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__88) -> ((B_dData_dList.v_map v_importNameStr) imports)
  | Base_dDiag.C_Check_OkC (dtb__89) -> ((B_dData_dList.v_map v_importNameStr) ((B_dData_dList.v_append imports) dtb__89))
  | _ -> failwith "DT: impossible branch"
)))))

# 1186 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolImportsOfSource = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Loader_dFlatten.v_parseFileWithPath nFs) label) source)) (fun parsed -> (match parsed with
  | Base_dDiag.C_Check_ErrC (dtb__90) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil)
  | Base_dDiag.C_Check_OkC (dtb__91) -> (let sf = (B_dData_dPair.v_firstOf dtb__91) in (let hdr = (sf).Frontend_dAst.f_SourceFile_sourceFileModDecl in (let imports = (sf).Frontend_dAst.f_SourceFile_sourceFileImports in (let nd_uscrut16 = hdr in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_toolImportNamesOf nFs) ctx) "") imports)
  | B_dData_dMaybe.C_Maybe_Just (dtb__92) -> (match dtb__92 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__93; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__94; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__95; Frontend_dAst.f_ModDecl_modDeclExports = dtb__96; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__97; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__98; Frontend_dAst.f_ModDecl_modDeclRef = dtb__99 } -> ((((v_toolImportNamesOf nFs) ctx) dtb__93) imports)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))

# 1216 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolEnabled = (fun (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_IFACE_TOOL")) (fun v -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v <> "0")))))

# 1222 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_importClosureGo = (fun (mc0 : int) (mc1 : t_ClosureMod B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101) -> (if (mc0 <= 0) then mc3 else (if ((B_dData_dList.v_memName dtb__100) mc3) then ((((v_importClosureGo (mc0 - 1)) mc1) dtb__101) mc3) else (match ((v_findClosureMod dtb__100) mc1) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_importClosureGo (mc0 - 1)) mc1) dtb__101) (B_dData_dList.C_List__x58__x58_ (dtb__100, mc3)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__102) -> ((((v_importClosureGo (mc0 - 1)) mc1) ((B_dData_dList.v_append (dtb__102).f_ClosureMod_cmImports) dtb__101)) (B_dData_dList.C_List__x58__x58_ (dtb__100, mc3)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 1243 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_closureEdges = (fun (mc0 : t_ClosureMod B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__103, dtb__104) -> ((B_dData_dList.v_length (dtb__103).f_ClosureMod_cmImports) + (v_closureEdges dtb__104))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 1240 "Vuna/Compiler/Driver/Compile.vuna"
let v_closureFuel = (fun (mods : t_ClosureMod B_dData_dList.t_List) (starts : string B_dData_dList.t_List) -> ((((B_dData_dList.v_length starts) + (B_dData_dList.v_length mods)) + (v_closureEdges mods)) + 1))

# 1237 "Vuna/Compiler/Driver/Compile.vuna"
let v_importClosureOf = (fun (mods : t_ClosureMod B_dData_dList.t_List) (starts : string B_dData_dList.t_List) -> ((((v_importClosureGo ((v_closureFuel mods) starts)) mods) starts) B_dData_dList.C_List_Nil))

# 1247 "Vuna/Compiler/Driver/Compile.vuna"
let v_isNeededMod = (fun (needed : string B_dData_dList.t_List) (m : t_ClosureMod) -> ((B_dData_dList.v_memName (m).f_ClosureMod_cmName) needed))

# 1251 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolDepModsOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (needed : string B_dData_dList.t_List) -> ((B_dData_dList.v_filter (v_isNeededMod needed)) ((v_depModsOf ctx) mods)))

# 1316 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolTextHash = Driver_dIface.v_payloadDigest

# 1319 "Vuna/Compiler/Driver/Compile.vuna"
let v_sourceInfoForPath = (fun (nFs : string) (path : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun raw -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime nFs) path))) (fun mtime -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (fun (o : int B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe 0) o))) ((B_dEffect_dFs.v_fsFileSize nFs) path))) (fun size -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { Driver_dIface.f_SourceInfo_siPath = path; Driver_dIface.f_SourceInfo_siHash = (Driver_dIface.v_payloadDigest raw); Driver_dIface.f_SourceInfo_siMtime = mtime; Driver_dIface.f_SourceInfo_siSize = size }))))))))

# 1327 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolNowSec = (fun (nClock : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun us -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if 1000000 = 0 then failwith "division by zero" else us / 1000000)))))

# 1335 "Vuna/Compiler/Driver/Compile.vuna"
let v_mtimeSafetyWindowSec = 5

# 1340 "Vuna/Compiler/Driver/Compile.vuna"
let v_sourceFresh = (fun (nFs : string) (builtSec : int) (si : Driver_dIface.t_SourceInfo) -> (let path = (Driver_dIface.v_siPathOf si) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) exists) false) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime nFs) path))) (fun m -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (fun (o : int B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe 0) o))) ((B_dEffect_dFs.v_fsFileSize nFs) path))) (fun sz -> (if (if (if (m = (Driver_dIface.v_siMtimeOf si)) then (sz = (Driver_dIface.v_siSizeOf si)) else false) then (((Driver_dIface.v_siMtimeOf si) + v_mtimeSafetyWindowSec) <= builtSec) else false) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) true) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun content -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Driver_dIface.v_payloadDigest content) = (Driver_dIface.v_siHashOf si)))))))))))))))

# 1360 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_toolSessionFresh = (fun (nFs : string) (mc0 : int) (mc1 : Driver_dIface.t_SourceInfo B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__105, dtb__106) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_sourceFresh nFs) mc0) dtb__105)) (fun fresh -> (if fresh then (((v_toolSessionFresh nFs) mc0) dtb__106) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) true)
  | _ -> failwith "DT: impossible branch"
))

# 1409 "Vuna/Compiler/Driver/Compile.vuna"
let v_statOfClosureMod = (fun (nFs : string) (m : t_ClosureMod) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime nFs) (m).f_ClosureMod_cmPath))) (fun mtime -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (fun (o : int B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe 0) o))) ((B_dEffect_dFs.v_fsFileSize nFs) (m).f_ClosureMod_cmPath))) (fun size -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { Driver_dIface.f_SourceInfo_siPath = (m).f_ClosureMod_cmPath; Driver_dIface.f_SourceInfo_siHash = (m).f_ClosureMod_cmSrc; Driver_dIface.f_SourceInfo_siMtime = mtime; Driver_dIface.f_SourceInfo_siSize = size }))))))

# 1434 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanWanted = (fun (needed : string B_dData_dList.t_List) (exclude : string B_dData_dMaybe.t_Maybe) (m : t_ClosureMod) -> (if ((B_dData_dList.v_memName (m).f_ClosureMod_cmName) needed) then (match exclude with
  | B_dData_dMaybe.C_Maybe_Just (dtb__107) -> ((m).f_ClosureMod_cmName <> dtb__107)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
) else false))

# 1503 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceLocNorm = (fun ctx -> ((Base_dSource.v_locationPathUnder ((B_dData_dList.v_map Frontend_dPackages_dPkg.v_rootDir) (Frontend_dPackages_dPkg.v_contextRoots ctx))) (Frontend_dPackages_dPkg.v_contextDir ctx)))

# 1552 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolCompilerFingerprint = (fun (nFs : string) (nEnv : string) -> ((v_compilerFingerprint nFs) nEnv))

# 1631 "Vuna/Compiler/Driver/Compile.vuna"
let v_elabFullRequested = (fun (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_ELAB_FULL")) (fun v -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v = "1")))))

# 1639 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceAuditRequested = (fun (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_IFACE_AUDIT")) (fun v -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v = "1")))))

# 1649 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkSignatureOf = (fun (mc0 : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, Driver_dDt.t_CheckedPackage) B_dData_dPair.t_Pair Base_dDiag.t_Check) -> (match mc0 with
  | Base_dDiag.C_Check_ErrC (dtb__108) -> ("err\n" ^ (Base_dDiag.v_diagText dtb__108))
  | Base_dDiag.C_Check_OkC (dtb__109) -> "ok\n"
  | _ -> failwith "DT: impossible branch"
))

# 1655 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitSignatureOf = (fun (mc0 : (Driver_dSplit.t_SplitFile B_dData_dList.t_List, Driver_dDt.t_CheckedPackage) B_dData_dPair.t_Pair Base_dDiag.t_Check) -> (match mc0 with
  | Base_dDiag.C_Check_ErrC (dtb__110) -> ("err\n" ^ (Base_dDiag.v_diagText dtb__110))
  | Base_dDiag.C_Check_OkC (dtb__111) -> ("ok\n" ^ ((Base_dBytes.v_encTop Driver_dSplit.v_encSplitFiles) (B_dData_dPair.v_firstOf dtb__111)))
  | _ -> failwith "DT: impossible branch"
))

# 1659 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_joinLines = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__112, dtb__113) -> (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) dtb__113) B_dData_dList.C_List_Nil) then dtb__112 else (String.concat "" [dtb__112; "\n"; (v_joinLines dtb__113)]))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1665 "Vuna/Compiler/Driver/Compile.vuna"
let v_auditCompare = (fun (subject : string) (at : string) (s : string) (f : string) -> (if (s = f) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_err (String.concat "" ["iface-audit-mismatch subject="; subject; " at="; at; " summary="; (bi_strFromInt (v_textHash s)); "/"; (bi_strFromInt (bi_strLength s)); " full="; (bi_strFromInt (v_textHash f)); "/"; (bi_strFromInt (bi_strLength f))]))))

# 1712 "Vuna/Compiler/Driver/Compile.vuna"
let v_readOneModIface = (fun (nFs : string) (nEnv : string) (nProcess : string) (m : t_ClosureMod) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_readIfaceAtEff nFs) nEnv) nProcess) (m).f_ClosureMod_cmAddr)) (fun mi -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = m; B_dData_dPair.f_Pair_second = mi }))))

# 1738 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_readIfaces = (fun (mc0 : (t_ClosureMod, Driver_dIface.t_ModuleIface B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__114, dtb__115) -> (match (B_dData_dPair.v_secondOf dtb__114) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_readIfaces dtb__115)
  | B_dData_dMaybe.C_Maybe_Just (dtb__116) -> (B_dData_dList.C_List__x58__x58_ (dtb__116, (v_readIfaces dtb__115)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1756 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_fromDirty = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__117, dtb__118) -> (if ((B_dData_dString.v_startsWith (dtb__117 ^ ".")) mc1) then true else ((v_fromDirty dtb__118) mc1))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1751 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_anyExportFrom = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__119, dtb__120) -> (if ((v_fromDirty mc0) (dtb__119).Loader_dModules.f_ExportEntry_target) then true else ((v_anyExportFrom mc0) dtb__120))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1748 "Vuna/Compiler/Driver/Compile.vuna"
let v_exportsFromDirty = (fun (dirty : string B_dData_dList.t_List) (mi : Driver_dIface.t_ModuleIface) -> ((v_anyExportFrom dirty) (Driver_dIface.v_miExportsOf mi)))

# 1763 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_dirtyFix = (fun (fuel : int) (dirty : string B_dData_dList.t_List) (cands : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (if (fuel <= 0) then dirty else (let added = ((B_dData_dList.v_map Driver_dIface.v_miNameOf) ((B_dData_dList.v_filter (fun (mi : Driver_dIface.t_ModuleIface) -> (if (B_dData_dBool.v_not ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf mi)) dirty)) then ((v_exportsFromDirty dirty) mi) else false))) cands)) in (if ((B_dData_dList.v_length added) = 0) then dirty else (((v_dirtyFix (fuel - 1)) ((B_dData_dList.v_append added) dirty)) cands)))))

# 1772 "Vuna/Compiler/Driver/Compile.vuna"
let v_collectClean = (fun (dirty0 : string B_dData_dList.t_List) (cands : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (let dirty = (((v_dirtyFix ((B_dData_dList.v_length cands) + 1)) dirty0) cands) in ((B_dData_dList.v_filter (fun (mi : Driver_dIface.t_ModuleIface) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf mi)) dirty)))) cands)))

# 1725 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanInfoWith = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_mapEff (((v_readOneModIface nFs) nEnv) nProcess)) ((v_selfModsOf ctx) mods))) (fun reads -> (let ownNames = ((B_dData_dList.v_map v_modNameOf) ((v_selfModsOf ctx) mods)) in (let cands = (v_readIfaces reads) in (let missing = ((B_dData_dList.v_filter (fun (n : string) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName n) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) cands))))) ownNames) in (let clean = ((v_collectClean missing) cands) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if ((B_dData_dList.v_length clean) = 0) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (clean)))))))))))

# 1785 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanModulesWith = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> (((((v_ownCleanInfoWith nFs) nEnv) nProcess) ctx) mods))

# 1823 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_cleanHashOf = (fun (mc0 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__121, dtb__122) -> (if ((Driver_dIface.v_miNameOf dtb__121) = mc1) then (B_dData_dMaybe.C_Maybe_Just ((Driver_dIface.v_miIfaceHashOf dtb__121))) else ((v_cleanHashOf dtb__122) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1810 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_moduleDepsOk = (fun (mc0 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mc2 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__123, dtb__124) -> (match dtb__123 with
  | { B_dData_dPair.f_Pair_first = dtb__125; B_dData_dPair.f_Pair_second = dtb__126 } -> (if (dtb__126 = Driver_dIface.v_depMissingHash) then (((v_moduleDepsOk mc0) mc1) dtb__124) else (match ((B_dData_dList.v_lookupPair dtb__125) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__127) -> (if (dtb__127 = dtb__126) then (((v_moduleDepsOk mc0) mc1) dtb__124) else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_cleanHashOf mc1) dtb__125) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__128) -> (if (dtb__128 = dtb__126) then (((v_moduleDepsOk mc0) mc1) dtb__124) else false)
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

# 1490 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_cleanPass = (fun (mc0 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mc2 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mc3 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__129, dtb__130) -> (if (((v_moduleDepsOk mc0) mc2) (Driver_dIface.v_miDepHashesOf dtb__129)) then ((((v_cleanPass mc0) dtb__130) (B_dData_dList.C_List__x58__x58_ (dtb__129, mc2))) (B_dData_dList.C_List__x58__x58_ (dtb__129, mc3))) else (let p = ((((v_cleanPass mc0) dtb__130) mc2) mc3) in { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__129, (B_dData_dPair.v_firstOf p))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) }))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse mc3) }
  | _ -> failwith "DT: impossible branch"
))

# 1475 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_cleanFixpoint = (fun (fuel : int) (depTbl : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (pending : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanRev : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (if (fuel <= 0) then ((B_dData_dList.v_append (B_dData_dList.v_reverse pending)) cleanRev) else (let nd_uscrut4 = ((((v_cleanPass depTbl) pending) cleanRev) B_dData_dList.C_List_Nil) in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__131; B_dData_dPair.f_Pair_second = dtb__132 } -> (match dtb__131 with
  | B_dData_dList.C_List_Nil -> ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb__132)) cleanRev)
  | _ -> (if ((B_dData_dList.v_length dtb__132) = 0) then ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb__131)) cleanRev) else (let _u = ((Base_dObs.v_obsCounter "vuna.tool.clean.kept") (B_dData_dList.v_length dtb__132)) in ((((v_cleanFixpoint (fuel - 1)) depTbl) dtb__131) ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb__132)) cleanRev))))
)
  | _ -> failwith "DT: impossible branch"
))))

# 1832 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceCompilerTag = (fun (nFs : string) (nEnv : string) -> ((Loader_dFingerprint.v_cacheTagEff nFs) nEnv))

# 957 "Vuna/Compiler/Driver/Compile.vuna"
let v_rootEnvHashOf = (fun (nFs : string) (nEnv : string) (dir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (dir ^ "/vuna.toml"))) (fun tomlPath -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) tomlPath)) (fun exists -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if exists then ((B_dEffect_dFs.v_fsReadFile nFs) tomlPath) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ""))) (fun toml -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_ifaceCompilerTag nFs) nEnv)) (fun tag -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_textHash (String.concat "" [(bi_strFromInt (v_textHash toml)); "|"; tag; "|"]))))))))))))

# 966 "Vuna/Compiler/Driver/Compile.vuna"
let v_rootPkgTableEff = (fun (nFs : string) (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> ((v_mapEff (fun (r : Frontend_dPackages_dPkg.t_Root) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_rootEnvHashOf nFs) nEnv) (Frontend_dPackages_dPkg.v_rootDir r))) (fun env -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { f_PkgEntry_peName = (Frontend_dPackages_dPkg.v_rootName r); f_PkgEntry_peDir = (Frontend_dPackages_dPkg.v_rootDir r); f_PkgEntry_peKey = (v_pkgKeyOf (Frontend_dPackages_dPkg.v_rootName r)); f_PkgEntry_peEnv = (bi_strFromInt env) }))))) (Frontend_dPackages_dPkg.v_contextRoots ctx)))

# 983 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifacesForRootsEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_rootPkgTableEff nFs) nEnv) ctx)) (fun pkgs -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_ifaceModsWithEff nFs) nClock) nEnv) nProcess) ctx) pkgs)) (fun mods -> ((((v_readIfaceListEff nFs) nEnv) nProcess) mods))))))

# 1285 "Vuna/Compiler/Driver/Compile.vuna"
let v_baseDepIfacesOf = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Just (dtb__133) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_ifacesForRootsEff nFs) nClock) nEnv) nProcess) ctx)
  | _ -> failwith "DT: impossible branch"
))

# 1686 "Vuna/Compiler/Driver/Compile.vuna"
let v_packageEnvHash = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (let own = (v_textHash (v_manifestSemanticText (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage)) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_depIdentitiesEff nFs) nEnv) nProcess) ctx)) (fun deps -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_ifaceCompilerTag nFs) nEnv)) (fun tag -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_textHash (String.concat "" [(bi_strFromInt own); "|"; tag; "|"; (v_joinLines ((B_dData_dList.v_map v_pairText) deps))])))))))))

# 771 "Vuna/Compiler/Driver/Compile.vuna"
let v_pkgTableEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_packageEnvHash nFs) nEnv) nProcess) ctx)) (fun ownEnv -> (let own = { f_PkgEntry_peName = (Frontend_dPackages_dPkg.v_contextPackageName ctx); f_PkgEntry_peDir = (Frontend_dPackages_dPkg.v_contextDir ctx); f_PkgEntry_peKey = (v_pkgKeyOf (Frontend_dPackages_dPkg.v_contextPackageName ctx)); f_PkgEntry_peEnv = (bi_strFromInt ownEnv) } in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_mapEff (fun (p : Frontend_dPackages_dPkg.t_Package) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_packageEnvHash nFs) nEnv) nProcess) (Frontend_dPackages_dPkg.v_packageContext p))) (fun e -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { f_PkgEntry_peName = (Frontend_dPackages_dPkg.v_packageName p); f_PkgEntry_peDir = (Frontend_dPackages_dPkg.v_packageDir p); f_PkgEntry_peKey = (v_pkgKeyOf (Frontend_dPackages_dPkg.v_packageName p)); f_PkgEntry_peEnv = (bi_strFromInt e) }))))) (v_depPackageList ctx))) (fun deps -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dList.C_List__x58__x58_ (own, deps)))))))))

# 910 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceModsEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_pkgTableEff nFs) nEnv) nProcess) ctx)) (fun pkgs -> ((((((v_ifaceModsWithEff nFs) nClock) nEnv) nProcess) ctx) pkgs))))

# 937 "Vuna/Compiler/Driver/Compile.vuna"
let v_summaryClosureMods = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil)
  | B_dData_dMaybe.C_Maybe_Just (dtb__134) -> (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)
  | _ -> failwith "DT: impossible branch"
))

# 976 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifacesForContextEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> ((((v_readIfaceListEff nFs) nEnv) nProcess) mods))))

# 1254 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForToolSource = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_toolEnabled nEnv)) (fun enabled -> (if enabled then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_toolImportsOfSource nFs) nEnv) nProcess) ctx) label) source)) (fun starts -> (let needed = ((v_importClosureOf mods) starts) in (let depMods = (((v_toolDepModsOf ctx) mods) needed) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("tool-closure modules=" ^ (bi_strFromInt (B_dData_dList.v_length depMods)))) else 0) in ((((v_readIfaceListEff nFs) nEnv) nProcess) depMods)))))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing)))))

# 1272 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForToolProgram = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) -> (((((((v_depIfacesForToolSource nFs) nClock) nEnv) nProcess) ctx) "<repl>") program))

# 1368 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolNeededOfImports = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (tool : t_ToolContext) (currentName : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_toolImportNamesOf nFs) ctx) currentName) imports)) (fun importNames -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_importClosureOf mods) importNames)))))))

# 1377 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForToolSourceDetailed = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_toolEnabled nEnv)) (fun enabled -> (if enabled then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.tool.ifaces.lookup")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_toolImportsOfSource nFs) nEnv) nProcess) ctx) label) source)) (fun starts -> (let needed = ((v_importClosureOf mods) starts) in (let depMods = (((v_toolDepModsOf ctx) mods) needed) in (let depHashes = ((B_dData_dList.v_map v_modHashPair) depMods) in (let ownNames = ((B_dData_dList.v_map v_modNameOf) ((v_selfModsOf ctx) mods)) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("tool-closure modules=" ^ (bi_strFromInt (B_dData_dList.v_length depMods)))) else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_readIfaceListEff nFs) nEnv) nProcess) depMods)) (fun ifaces -> (match ifaces with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.tool.ifaces.missing")) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__135) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.tool.ifaces.ready")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_mapEff (v_statOfClosureMod nFs)) depMods)) (fun stats -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dMaybe.C_Maybe_Just ({ f_ToolContext_tcDepIfaces = dtb__135; f_ToolContext_tcDepHashes = depHashes; f_ToolContext_tcNeeded = needed; f_ToolContext_tcOwnNames = ownNames; f_ToolContext_tcStats = stats })))))))
  | _ -> failwith "DT: impossible branch"
)))))))))))))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.tool.ifaces.disabled")) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing)))))))

# 1523 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeModuleIfaceGuarded = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mi : Driver_dIface.t_ModuleIface) -> (if ((Frontend_dPackages_dPkg.v_contextPackageName ctx) = "") then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (match ((v_findClosureMod (Driver_dIface.v_miNameOf mi)) mods) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0)
  | B_dData_dMaybe.C_Maybe_Just (dtb__136) -> (((((((Base_dStore.v_storeObjectWriteEff nFs) nEnv) nProcess) "module-iface") v_ifaceObjectCodec) (dtb__136).f_ClosureMod_cmAddr) (Driver_dIface.v_encModuleIface mi))
  | _ -> failwith "DT: impossible branch"
)))))

# 1508 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolWriteModuleIface = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (tool : t_ToolContext) (clean : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (checked : Driver_dDt.t_CheckedPackage) (name : string) (si : Driver_dIface.t_SourceInfo) -> (let norm = (v_ifaceLocNorm ctx) in (let miResult = ((((((((((Driver_dIface.v_ifaceOfModule (Frontend_dPackages_dPkg.v_contextPackageName ctx)) si) (tool).f_ToolContext_tcDepHashes) (checked).Driver_dDt.f_CheckedPackage_checkedInherited) clean) (checked).Driver_dDt.f_CheckedPackage_checkedModules) (checked).Driver_dDt.f_CheckedPackage_checkedEntryDecls) (checked).Driver_dDt.f_CheckedPackage_checkedProgram) norm) name) in (match miResult with
  | Base_dDiag.C_Check_ErrC (dtb__137) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__137)))
  | Base_dDiag.C_Check_OkC (dtb__138) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_writeModuleIfaceGuarded nFs) nClock) nEnv) nProcess) ctx) dtb__138)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dtb__138)))))
  | _ -> failwith "DT: impossible branch"
))))

# 1675 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfaceHashTable = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dData_dList.v_map v_modHashPair) ((v_depModsOf ctx) mods))))))

# 1718 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanInfo = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((((v_ownCleanInfoWith nFs) nEnv) nProcess) ctx) mods))))

# 1778 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanModules = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ownCleanInfo nFs) nClock) nEnv) nProcess) ctx)) (fun info -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) info))))

# 1791 "Vuna/Compiler/Driver/Compile.vuna"
let v_cleanIfacesOrEmpty = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ownCleanModules nFs) nClock) nEnv) nProcess) ctx)) (fun clean -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match clean with
  | B_dData_dMaybe.C_Maybe_Just (dtb__139) -> dtb__139
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)))))

# 1536 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolWriteModuleIfaceCold = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : Driver_dDt.t_CheckedPackage) (name : string) (si : Driver_dIface.t_SourceInfo) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_cleanIfacesOrEmpty nFs) nClock) nEnv) nProcess) ctx)) (fun clean -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_depIfaceHashTable nFs) nClock) nEnv) nProcess) ctx)) (fun depTbl -> (let norm = (v_ifaceLocNorm ctx) in (let miResult = ((((((((((Driver_dIface.v_ifaceOfModule (Frontend_dPackages_dPkg.v_contextPackageName ctx)) si) depTbl) (checked).Driver_dDt.f_CheckedPackage_checkedInherited) clean) (checked).Driver_dDt.f_CheckedPackage_checkedModules) (checked).Driver_dDt.f_CheckedPackage_checkedEntryDecls) (checked).Driver_dDt.f_CheckedPackage_checkedProgram) norm) name) in (match miResult with
  | Base_dDiag.C_Check_ErrC (dtb__140) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__140)))
  | Base_dDiag.C_Check_OkC (dtb__141) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_writeModuleIfaceGuarded nFs) nClock) nEnv) nProcess) ctx) dtb__141)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dtb__141)))))
  | _ -> failwith "DT: impossible branch"
))))))))

# 1843 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownInfoOf = (fun (nFs : string) (nEnv : string) (m : t_ClosureMod) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Frontend_dPackages_dPkg.v_absolutePath nEnv) (m).f_ClosureMod_cmPath)) (fun abs -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime nFs) abs))) (fun mtime -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (fun (o : int B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe 0) o))) ((B_dEffect_dFs.v_fsFileSize nFs) abs))) (fun size -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (m).f_ClosureMod_cmName; B_dData_dPair.f_Pair_second = { Driver_dIface.f_SourceInfo_siPath = abs; Driver_dIface.f_SourceInfo_siHash = (m).f_ClosureMod_cmSrc; Driver_dIface.f_SourceInfo_siMtime = mtime; Driver_dIface.f_SourceInfo_siSize = size } }))))))))

# 1840 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownSourceInfos = (fun (nFs : string) (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> ((v_mapEff ((v_ownInfoOf nFs) nEnv)) ((v_selfModsOf ctx) mods)))

# 1853 "Vuna/Compiler/Driver/Compile.vuna"
let v_resyncCleanSources = (fun (sources : (string, Driver_dIface.t_SourceInfo) B_dData_dPair.t_Pair B_dData_dList.t_List) (clean : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (m : Driver_dIface.t_ModuleIface) -> (match ((B_dData_dList.v_lookupPair (Driver_dIface.v_miNameOf m)) sources) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__142) -> { Driver_dIface.f_ModuleIface_miName = (Driver_dIface.v_miNameOf m); Driver_dIface.f_ModuleIface_miPackage = (Driver_dIface.v_miPackageOf m); Driver_dIface.f_ModuleIface_miSource = dtb__142; Driver_dIface.f_ModuleIface_miIfaceHash = (Driver_dIface.v_miIfaceHashOf m); Driver_dIface.f_ModuleIface_miDepHashes = (Driver_dIface.v_miDepHashesOf m); Driver_dIface.f_ModuleIface_miImports = (Driver_dIface.v_miImportsOf m); Driver_dIface.f_ModuleIface_miImplicitImports = (Driver_dIface.v_miImplicitImportsOf m); Driver_dIface.f_ModuleIface_miExports = (Driver_dIface.v_miExportsOf m); Driver_dIface.f_ModuleIface_miFixities = (Driver_dIface.v_miFixitiesOf m); Driver_dIface.f_ModuleIface_miDecls = (Driver_dIface.v_miDeclsOf m); Driver_dIface.f_ModuleIface_miRecords = (Driver_dIface.v_miRecordsOf m); Driver_dIface.f_ModuleIface_miPrepared = (Driver_dIface.v_miPreparedOf m); Driver_dIface.f_ModuleIface_miCached = (Driver_dIface.v_miCachedOf m); Driver_dIface.f_ModuleIface_miDefLocs = (Driver_dIface.v_miDefLocsOf m) }
  | B_dData_dMaybe.C_Maybe_Nothing -> m
  | _ -> failwith "DT: impossible branch"
))) clean))

# 1869 "Vuna/Compiler/Driver/Compile.vuna"
let v_shadowAllowed = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__143) -> true
  | _ -> failwith "DT: impossible branch"
))

# 944 "Vuna/Compiler/Driver/Compile.vuna"
let v_shadowClosureMods = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (if ((Frontend_dPackages_dPkg.v_contextPackageName ctx) = "") then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing) else (if (B_dData_dBool.v_not (v_shadowAllowed ctx)) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dMaybe.C_Maybe_Just (mods))))))))

# 1876 "Vuna/Compiler/Driver/Compile.vuna"
let v_nameExportedBy = (fun (names : string B_dData_dList.t_List) (m : t_ClosureMod) -> ((B_dData_dList.v_memName (m).f_ClosureMod_cmName) names))

# 1145 "Vuna/Compiler/Driver/Compile.vuna"
let v_exportedDepModsOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (p : string) (mods : t_ClosureMod B_dData_dList.t_List) -> (let inPkg = ((B_dData_dList.v_filter (v_pkgEq p)) mods) in (match ((v_rootExportsOf p) (Frontend_dPackages_dPkg.v_contextRoots ctx)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> inPkg
  | B_dData_dMaybe.C_Maybe_Just (dtb__144) -> ((B_dData_dList.v_filter (v_nameExportedBy dtb__144)) inPkg)
  | _ -> failwith "DT: impossible branch"
)))

# 1125 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_goPkgs = (fun (nFs : string) (nEnv : string) (nProcess : string) (mc0 : Frontend_dPackages_dPkg.t_PackageContext) (mc1 : t_ClosureMod B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : t_ClosureMod B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__145, dtb__146) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_readOrderEff nFs) nEnv) nProcess) mc0) dtb__145)) (fun ord -> (match ord with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Just (dtb__147) -> (let current = ((B_dData_dList.v_map v_modNameOf) ((B_dData_dList.v_filter (v_pkgEq dtb__145)) mc1)) in (let namesCurrent = ((v_allNamesIn dtb__147) current) in (let picked = ((v_pickByOrder mc1) dtb__147) in (let required = (((v_exportedDepModsOf mc0) dtb__145) mc1) in (if (if namesCurrent then ((v_allNamesIn ((B_dData_dList.v_map v_modNameOf) required)) ((B_dData_dList.v_map v_modNameOf) picked)) else false) then (((((((v_goPkgs nFs) nEnv) nProcess) mc0) mc1) dtb__146) ((B_dData_dList.v_append mc3) picked)) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing))))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dMaybe.C_Maybe_Just (mc3)))
  | _ -> failwith "DT: impossible branch"
))

# 1159 "Vuna/Compiler/Driver/Compile.vuna"
let v_depModsByOrderEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> (((((((v_goPkgs nFs) nEnv) nProcess) ctx) mods) ((v_distinctPkgs ((v_depModsOf ctx) mods)) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil))

# 1057 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesOfWith = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Just (dtb__148) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_depModsByOrderEff nFs) nEnv) nProcess) ctx) mods)) (fun ordered -> (match ordered with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "iface-reject=pkg-summary") else 0) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dMaybe.C_Maybe_Just (dtb__149) -> ((((v_readIfaceListEff nFs) nEnv) nProcess) dtb__149)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

# 1049 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesOf = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> ((((((v_depIfacesOfWith nFs) nClock) nEnv) nProcess) ctx) mods))))

# 1177 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForCheck = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((((v_depIfacesOf nFs) nClock) nEnv) nProcess) ctx))

# 1275 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForTool = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_toolEnabled nEnv)) (fun enabled -> (if enabled then (((((v_depIfacesOf nFs) nClock) nEnv) nProcess) ctx) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing)))))

# 1575 "Vuna/Compiler/Driver/Compile.vuna"
let v_summaryCheckExeParts = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_depIfacesOfWith nFs) nClock) nEnv) nProcess) ctx) mods)) (fun depIfaces -> (match depIfaces with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "cache-path=full") else 0) in (((((Driver_dDt.v_dtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry))
  | B_dData_dMaybe.C_Maybe_Just (dtb__150) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ownCleanModulesWith nFs) nEnv) nProcess) ctx) mods)) (fun clean -> (match clean with
  | B_dData_dMaybe.C_Maybe_Just (dtb__151) -> (let cleanReal = (if wantWarnings then B_dData_dList.C_List_Nil else dtb__151) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-path=summary deps=" ^ (bi_strFromInt (v_depPackageCount ctx)))) else 0) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-own-clean=" ^ (bi_strFromInt (B_dData_dList.v_length cleanReal)))) else 0) in (((((((((Driver_dDt.v_dtCheckPackageIncrementalParts nFs) nEnv) nProcess) nExit) nArgs) ctx) entry) dtb__150) cleanReal))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-path=summary deps=" ^ (bi_strFromInt (v_depPackageCount ctx)))) else 0) in ((((((Driver_dDt.v_dtCheckPackageWithIfacesParts nFs) nEnv) nProcess) ctx) entry) dtb__150))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

# 1885 "Vuna/Compiler/Driver/Compile.vuna"
let v_exportedOwnOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (own : t_ClosureMod B_dData_dList.t_List) -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Nothing -> own
  | B_dData_dMaybe.C_Maybe_Just (dtb__152) -> (match (Frontend_dPackages_dPkg.v_packageExports dtb__152) with
  | B_dData_dMaybe.C_Maybe_Nothing -> own
  | B_dData_dMaybe.C_Maybe_Just (dtb__153) -> ((B_dData_dList.v_filter (v_nameExportedBy dtb__153)) own)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1899 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceWriteEnabled = (fun (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_IFACE_WRITE")) (fun v -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v <> "0")))))

# 2003 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_missingNamesOf = (fun (mc0 : t_ClosureMod B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__154, dtb__155) -> (if ((B_dData_dList.v_memName (dtb__154).f_ClosureMod_cmName) mc1) then ((v_missingNamesOf dtb__155) mc1) else (B_dData_dList.C_List__x58__x58_ ((dtb__154).f_ClosureMod_cmName, ((v_missingNamesOf dtb__155) mc1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 2020 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_ifaceSelfCheckGo = (fun (mc0 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__156, dtb__157) -> (let h = (Driver_dIface.v_miIfaceHashOf dtb__156) in (let h2 = (Driver_dIface.v_hashOfIface dtb__156) in (let _u = (if (h = h2) then 0 else (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") (String.concat "" ["iface-hash-mismatch "; (Driver_dIface.v_miNameOf dtb__156); " stored="; h; " recomputed="; h2])) else 0)) in (let _u = (if (h = h2) then 0 else ((Base_dObs.v_obsCounter "vuna.counter.iface.hash.mismatch") 1)) in (if (h = h2) then (v_ifaceSelfCheckGo dtb__157) else false)))))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 2037 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_writeIfaceObjects = (fun (nFs : string) (nEnv : string) (nProcess : string) (mc0 : t_ClosureMod B_dData_dList.t_List) (mc1 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__158, dtb__159) -> (match ((v_findClosureMod (Driver_dIface.v_miNameOf dtb__158)) mc0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_writeIfaceObjects nFs) nEnv) nProcess) mc0) dtb__159)
  | B_dData_dMaybe.C_Maybe_Just (dtb__160) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((Base_dStore.v_storeObjectWriteEff nFs) nEnv) nProcess) "module-iface") v_ifaceObjectCodec) (dtb__160).f_ClosureMod_cmAddr) (Driver_dIface.v_encModuleIface dtb__158))) (fun bytes -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_writeIfaceObjects nFs) nEnv) nProcess) mc0) dtb__159)) (fun n -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if (bytes > 0) then (n + 1) else n))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 2054 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceSelfTestRequested = (fun (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_IFACE_SELFTEST")) (fun v -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v = "1")))))

# 1804 "Vuna/Compiler/Driver/Compile.vuna"
let v_payloadSelfOk = (fun (nEnv : string) (m : Driver_dIface.t_ModuleIface) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_ifaceSelfTestRequested nEnv)) (fun self -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if self then ((Driver_dIface.v_hashOfIface m) = (Driver_dIface.v_miIfaceHashOf m)) else true)))))

# 1453 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_cleanSelfOk = (fun (nFs : string) (nEnv : string) (mc0 : int) (mc1 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mc2 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__161, dtb__162) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_payloadSelfOk nEnv) dtb__161)) (fun selfOk -> (let _u = (if selfOk then 0 else (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("iface-reject=self-hash " ^ (Driver_dIface.v_miNameOf dtb__161))) else 0)) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_sourceFresh nFs) mc0) (Driver_dIface.v_miSourceOf dtb__161))) (fun fresh -> (let valid = (Driver_dCache.v_cachedProgramValid (Driver_dIface.v_miCachedOf dtb__161)) in (let missingDep = (Driver_dIface.v_hasMissingDep (Driver_dIface.v_miDepHashesOf dtb__161)) in (let ok = (if (if (if fresh then valid else false) then selfOk else false) then (B_dData_dBool.v_not missingDep) else false) in (let _u = (if selfOk then 0 else ((Base_dObs.v_obsCounter "vuna.tool.clean.reject.self") 1)) in (let _u = (if fresh then 0 else ((Base_dObs.v_obsCounter "vuna.tool.clean.reject.fresh") 1)) in (let _u = (if valid then 0 else ((Base_dObs.v_obsCounter "vuna.tool.clean.reject.cached") 1)) in (let _u = (if missingDep then ((Base_dObs.v_obsCounter "vuna.tool.clean.reject.missingdep") 1) else 0) in (((((v_cleanSelfOk nFs) nEnv) mc0) dtb__162) (if ok then (B_dData_dList.C_List__x58__x58_ (dtb__161, mc2)) else mc2))))))))))))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dList.v_reverse mc2))
  | _ -> failwith "DT: impossible branch"
))

# 1447 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolCleanGo = (fun (nFs : string) (nEnv : string) (builtSec : int) (depTbl : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (cands : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanRev : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_cleanSelfOk nFs) nEnv) builtSec) cands) B_dData_dList.C_List_Nil)) (fun ok -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_cleanFixpoint ((B_dData_dList.v_length ok) + 1)) depTbl) ok) cleanRev)))))

# 1419 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolCleanOwnModules = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (tool : t_ToolContext) (builtSec : int) (exclude : string B_dData_dMaybe.t_Maybe) (needed : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (let cands = ((B_dData_dList.v_filter ((v_ownCleanWanted needed) exclude)) ((v_selfModsOf ctx) mods)) in (let _u = ((Base_dObs.v_obsCounter "vuna.tool.clean.cands") (B_dData_dList.v_length cands)) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_readIfaceListPartialEff nFs) nEnv) nProcess) cands)) (fun clean -> (let _u = ((Base_dObs.v_obsCounter "vuna.tool.clean.read") (B_dData_dList.v_length clean)) in ((((((v_toolCleanGo nFs) nEnv) builtSec) (tool).f_ToolContext_tcDepHashes) clean) B_dData_dList.C_List_Nil)))))))))

# 2014 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceSelfCheckEff = (fun (nEnv : string) (mods : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_ifaceSelfTestRequested nEnv)) (fun self -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if self then (v_ifaceSelfCheckGo mods) else true)))))

# 1917 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeIfaceShadowGo = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : Driver_dDt.t_CheckedPackage) (pre : t_ClosureMod B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (clean : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (if ((Frontend_dPackages_dPkg.v_contextPackageName ctx) = "") then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else (if (B_dData_dBool.v_not (v_shadowAllowed ctx)) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") "iface-shadow-start") else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun t0 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match pre with
  | B_dData_dMaybe.C_Maybe_Just (dtb__163) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) dtb__163)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)
  | _ -> failwith "DT: impossible branch"
)) (fun mods -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun t1 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_ownSourceInfos nFs) nEnv) ctx) mods)) (fun sources -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun t2 -> (let depTbl = ((B_dData_dList.v_map v_modHashPair) ((v_depModsOf ctx) mods)) in (let own = ((v_selfModsOf ctx) mods) in (let cleanNames = ((B_dData_dList.v_map Driver_dIface.v_miNameOf) clean) in (let required = ((v_exportedOwnOf ctx) own) in (match (((((((((Driver_dIface.v_ifaceOfPackage (Frontend_dPackages_dPkg.v_contextPackageName ctx)) sources) depTbl) (checked).Driver_dDt.f_CheckedPackage_checkedInherited) clean) (checked).Driver_dDt.f_CheckedPackage_checkedModules) (checked).Driver_dDt.f_CheckedPackage_checkedEntryDecls) (checked).Driver_dDt.f_CheckedPackage_checkedProgram) (v_ifaceLocNorm ctx)) with
  | Base_dDiag.C_Check_ErrC (dtb__164) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("iface-reject=compute iface-skip " ^ (Base_dDiag.v_diagText dtb__164))) else 0) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))))
  | Base_dDiag.C_Check_OkC (dtb__165) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun t3 -> (let unwritten = ((v_missingNamesOf required) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) dtb__165)) in (let toWrite = ((B_dData_dList.v_filter (fun (mi : Driver_dIface.t_ModuleIface) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf mi)) cleanNames)))) dtb__165) in (if ((B_dData_dList.v_length unwritten) > 0) then (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") (String.concat "" ["iface-skip partial closure="; (bi_strFromInt (B_dData_dList.v_length own)); " required="; (bi_strFromInt (B_dData_dList.v_length required)); " covered="; (bi_strFromInt (B_dData_dList.v_length dtb__165)); " missing="; ((B_dData_dString.v_join ",") unwritten)])) else 0) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_ifaceSelfCheckEff nEnv) toWrite)) (fun selfOk -> (if (B_dData_dBool.v_not selfOk) then (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("iface-selftest=skip-write " ^ (bi_strFromInt (B_dData_dList.v_length toWrite)))) else 0) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dtb__165)))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.iface.write")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_writeIfaceObjects nFs) nEnv) nProcess) own) toWrite)) (fun n -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_writePkgSummaryEff nFs) nEnv) nProcess) ctx) dtb__165)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun t4 -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") (String.concat "" ["iface-write="; (bi_strFromInt n); "/"; (bi_strFromInt (B_dData_dList.v_length dtb__165)); " closure="; (bi_strFromInt (B_dData_dList.v_length own)); " phases mods="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (t1 - t0) / 1000)); "ms sources="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (t2 - t1) / 1000)); "ms compute="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (t3 - t2) / 1000)); "ms write="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (t4 - t3) / 1000)); "ms"])) else 0) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dtb__165))))))))))))))))))))
  | _ -> failwith "DT: impossible branch"
)))))))))))))))))))

# 1911 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeIfaceShadowWithClean = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : Driver_dDt.t_CheckedPackage) (pre : t_ClosureMod B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (clean : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_ifaceWriteEnabled nEnv)) (fun enabled -> (if (B_dData_dBool.v_not enabled) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else ((((((((v_writeIfaceShadowGo nFs) nClock) nEnv) nProcess) ctx) checked) pre) clean)))))

# 204 "Vuna/Compiler/Driver/Compile.vuna"
let v_rebuildSplit = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (inputs : t_SplitInputs) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ownCleanInfoWith nFs) nEnv) nProcess) ctx) (inputs).f_SplitInputs_siClosure)) (fun cleanR -> (let clean = (match cleanR with
  | B_dData_dMaybe.C_Maybe_Just (dtb__172) -> dtb__172
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((v_summarySplitParts nFs) nConsole) nClock) nEnv) nProcess) ctx) (inputs).f_SplitInputs_siDepIfaces) entry) printResult)) (fun summary -> (match summary with
  | Base_dDiag.C_Check_ErrC (dtb__166) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__166)))
  | Base_dDiag.C_Check_OkC (dtb__167) -> (let canon = (Driver_dSplit.v_canonicalTopo (B_dData_dPair.v_firstOf dtb__167)) in (let checked = (B_dData_dPair.v_secondOf dtb__167) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((v_writeIfaceShadowWithClean nFs) nClock) nEnv) nProcess) ctx) checked) (B_dData_dMaybe.C_Maybe_Just ((inputs).f_SplitInputs_siClosure))) clean)) (fun shadow -> (match shadow with
  | Base_dDiag.C_Check_ErrC (dtb__168) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__168)))
  | Base_dDiag.C_Check_OkC (dtb__169) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_writeCompiledNormalized nFs) nEnv) nProcess) ctx) outDir) canon)) (fun n -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match n with
  | Base_dDiag.C_Check_ErrC (dtb__170) -> (Base_dDiag.C_Check_ErrC (dtb__170))
  | Base_dDiag.C_Check_OkC (dtb__171) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__171; B_dData_dPair.f_Pair_second = (checked).Driver_dDt.f_CheckedPackage_checkedWarnings }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))))))

# 200 "Vuna/Compiler/Driver/Compile.vuna"
let v_compileToDirNormal = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (inputs : t_SplitInputs) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) -> ((((((((((v_rebuildSplit nFs) nConsole) nClock) nEnv) nProcess) inputs) ctx) entry) printResult) outDir))

# 1907 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeIfaceShadowWith = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : Driver_dDt.t_CheckedPackage) (pre : t_ClosureMod B_dData_dList.t_List B_dData_dMaybe.t_Maybe) -> ((((((((v_writeIfaceShadowWithClean nFs) nClock) nEnv) nProcess) ctx) checked) pre) B_dData_dList.C_List_Nil))

# 238 "Vuna/Compiler/Driver/Compile.vuna"
let v_auditCompile = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (inputs : t_SplitInputs) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((v_summarySplitParts nFs) nConsole) nClock) nEnv) nProcess) ctx) (inputs).f_SplitInputs_siDepIfaces) entry) printResult)) (fun summary -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((Driver_dDt.v_dtSplitProjectParts nFs) nConsole) nEnv) nProcess) ctx) entry) printResult)) (fun full -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") ("iface-audit subject=compile entry=" ^ entry)) else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_auditCompare "compile") entry) (v_splitSignatureOf summary)) (v_splitSignatureOf full)))) (fun compared -> (match compared with
  | Base_dDiag.C_Check_ErrC (dtb__173) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__173)))
  | Base_dDiag.C_Check_OkC (dtb__174) -> (match summary with
  | Base_dDiag.C_Check_ErrC (dtb__175) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__175)))
  | Base_dDiag.C_Check_OkC (dtb__176) -> (let files = (B_dData_dPair.v_firstOf dtb__176) in (let checked = (B_dData_dPair.v_secondOf dtb__176) in (let canon = (Driver_dSplit.v_canonicalTopo files) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_writeIfaceShadowWith nFs) nClock) nEnv) nProcess) ctx) checked) (B_dData_dMaybe.C_Maybe_Just ((inputs).f_SplitInputs_siClosure)))) (fun shadow -> (match shadow with
  | Base_dDiag.C_Check_ErrC (dtb__177) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__177)))
  | Base_dDiag.C_Check_OkC (dtb__178) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_writeCompiledNormalized nFs) nEnv) nProcess) ctx) outDir) canon)) (fun n -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match n with
  | Base_dDiag.C_Check_ErrC (dtb__179) -> (Base_dDiag.C_Check_ErrC (dtb__179))
  | Base_dDiag.C_Check_OkC (dtb__180) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__180; B_dData_dPair.f_Pair_second = (checked).Driver_dDt.f_CheckedPackage_checkedWarnings }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

# 169 "Vuna/Compiler/Driver/Compile.vuna"
let v_compileToDirGiven = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (inputs : t_SplitInputs) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_ifaceAuditRequested nEnv)) (fun audit -> (if audit then ((((((((((v_auditCompile nFs) nConsole) nClock) nEnv) nProcess) inputs) ctx) entry) printResult) outDir) else ((((((((((v_compileToDirNormal nFs) nConsole) nClock) nEnv) nProcess) inputs) ctx) entry) printResult) outDir)))))

# 1894 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeIfaceShadow = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : Driver_dDt.t_CheckedPackage) -> (((((((v_writeIfaceShadowWith nFs) nClock) nEnv) nProcess) ctx) checked) B_dData_dMaybe.C_Maybe_Nothing))

# 2064 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkAndShadowWith = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (pre : t_ClosureMod B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (checked : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, Driver_dDt.t_CheckedPackage) B_dData_dPair.t_Pair Base_dDiag.t_Check B_dEffect_dCore.t_Eff) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) checked) (fun checkedR -> (match checkedR with
  | Base_dDiag.C_Check_ErrC (dtb__181) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__181)))
  | Base_dDiag.C_Check_OkC (dtb__182) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_writeIfaceShadowWith nFs) nClock) nEnv) nProcess) ctx) (B_dData_dPair.v_secondOf dtb__182)) pre)) (fun shadow -> (match shadow with
  | Base_dDiag.C_Check_ErrC (dtb__183) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__183)))
  | Base_dDiag.C_Check_OkC (dtb__184) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb__182))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

# 1607 "Vuna/Compiler/Driver/Compile.vuna"
let v_fullCheckExe = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "cache-path=full") else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_shadowClosureMods nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) mods) (((((Driver_dDt.v_dtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry))))))

# 1617 "Vuna/Compiler/Driver/Compile.vuna"
let v_auditCheckExe = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((v_summaryCheckExeParts nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) mods) entry)) (fun summary -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Driver_dDt.v_dtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry)) (fun full -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") ("iface-audit subject=check entry=" ^ entry)) else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_auditCompare "check") entry) (v_checkSignatureOf summary)) (v_checkSignatureOf full)))) (fun compared -> (match compared with
  | Base_dDiag.C_Check_ErrC (dtb__185) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__185)))
  | Base_dDiag.C_Check_OkC (dtb__186) -> (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) (B_dData_dMaybe.C_Maybe_Just (mods))) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) summary))
  | _ -> failwith "DT: impossible branch"
)))))))))

# 1556 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkUncachedExe = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_elabFullRequested nEnv)) (fun full -> (if full then ((((((v_fullCheckExe nFs) nClock) nEnv) nProcess) ctx) entry) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_summaryClosureMods nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_ifaceAuditRequested nEnv)) (fun audit -> (if audit then ((((((((((v_auditCheckExe nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) mods) entry) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((v_summaryCheckExeParts nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) mods) entry)) (fun summary -> (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) (B_dData_dMaybe.C_Maybe_Just (mods))) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) summary)))))))))))))

# 2061 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkAndShadow = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, Driver_dDt.t_CheckedPackage) B_dData_dPair.t_Pair Base_dDiag.t_Check B_dEffect_dCore.t_Eff) -> (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) B_dData_dMaybe.C_Maybe_Nothing) checked))

# 2094 "Vuna/Compiler/Driver/Compile.vuna"
let v_summaryCheckLibParts = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (names : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_depIfacesOfWith nFs) nClock) nEnv) nProcess) ctx) mods)) (fun depIfaces -> (match depIfaces with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "cache-path=full") else 0) in (((((Driver_dDt.v_dtCheckLibraryWithProgramParts nFs) nEnv) nProcess) ctx) names))
  | B_dData_dMaybe.C_Maybe_Just (dtb__187) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ownCleanModulesWith nFs) nEnv) nProcess) ctx) mods)) (fun clean -> (match clean with
  | B_dData_dMaybe.C_Maybe_Just (dtb__188) -> (let cleanReal = (if wantWarnings then B_dData_dList.C_List_Nil else dtb__188) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-path=summary deps=" ^ (bi_strFromInt (v_depPackageCount ctx)))) else 0) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-own-clean=" ^ (bi_strFromInt (B_dData_dList.v_length cleanReal)))) else 0) in (((((((((Driver_dDt.v_dtCheckLibraryPackageIncrementalParts nFs) nEnv) nProcess) nExit) nArgs) ctx) names) dtb__187) cleanReal))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-path=summary deps=" ^ (bi_strFromInt (v_depPackageCount ctx)))) else 0) in ((((((Driver_dDt.v_dtCheckLibraryPackageWithIfacesParts nFs) nEnv) nProcess) ctx) names) dtb__187))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

# 2125 "Vuna/Compiler/Driver/Compile.vuna"
let v_fullCheckLib = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "cache-path=full") else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_shadowClosureMods nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) mods) (((((Driver_dDt.v_dtCheckLibraryWithProgramParts nFs) nEnv) nProcess) ctx) names))))))

# 2133 "Vuna/Compiler/Driver/Compile.vuna"
let v_auditCheckLib = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (names : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((v_summaryCheckLibParts nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) mods) names)) (fun summary -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Driver_dDt.v_dtCheckLibraryWithProgramParts nFs) nEnv) nProcess) ctx) names)) (fun full -> (let subject = (v_joinLines names) in (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") ("iface-audit subject=check-lib entry=" ^ subject)) else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_auditCompare "check-lib") subject) (v_checkSignatureOf summary)) (v_checkSignatureOf full)))) (fun compared -> (match compared with
  | Base_dDiag.C_Check_ErrC (dtb__189) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__189)))
  | Base_dDiag.C_Check_OkC (dtb__190) -> ((((((v_checkAndShadow nFs) nClock) nEnv) nProcess) ctx) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) summary))
  | _ -> failwith "DT: impossible branch"
))))))))))

# 2077 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkUncachedLib = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_elabFullRequested nEnv)) (fun full -> (if full then ((((((v_fullCheckLib nFs) nClock) nEnv) nProcess) ctx) names) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_summaryClosureMods nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_ifaceAuditRequested nEnv)) (fun audit -> (if audit then ((((((((((v_auditCheckLib nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) mods) names) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((v_summaryCheckLibParts nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) mods) names)) (fun summary -> (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) (B_dData_dMaybe.C_Maybe_Just (mods))) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) summary)))))))))))))

# 89 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkPackage = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (release : bool) (wantWarnings : bool) (pkg : Frontend_dPackages_dPkg.t_Package) -> (let ctx = ((Frontend_dPackages_dPkg.v_contextWithRelease release) (Frontend_dPackages_dPkg.v_packageContext pkg)) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) (Frontend_dPackages_dPkg.v_packageEntry pkg))) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((v_checkUncachedExe nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) (Frontend_dPackages_dPkg.v_packageEntry pkg))) (fun exeR -> (match exeR with
  | Base_dDiag.C_Check_ErrC (dtb__191) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__191)))
  | Base_dDiag.C_Check_OkC (dtb__192) -> (match (Frontend_dPackages_dPkg.v_packageExports pkg) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dtb__192)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__193) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_elabFullRequested nEnv)) (fun full -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if full then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false) else (((((v_orderCoversEff nFs) nEnv) nProcess) ctx) dtb__193))) (fun covered -> (if covered then (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("check-lib-skip covered=" ^ (bi_strFromInt (B_dData_dList.v_length dtb__193)))) else 0) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dtb__192)))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((v_checkUncachedLib nFs) nClock) nEnv) nProcess) nExit) nArgs) false) ctx) dtb__193)) (fun libR -> (match libR with
  | Base_dDiag.C_Check_ErrC (dtb__194) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__194)))
  | Base_dDiag.C_Check_OkC (dtb__195) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append dtb__192) dtb__195))))
  | _ -> failwith "DT: impossible branch"
))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) else (match (Frontend_dPackages_dPkg.v_packageExports pkg) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((Base_dDiagnostics_dPkg.v_pkgAt1 ((Frontend_dPackages_dPkg.v_packageDir pkg) ^ "/vuna.toml")) 1) (Base_dDiagnostics_dPkg.C_PkgErr_LibraryWithoutEntry ((Frontend_dPackages_dPkg.v_packageName pkg)))) (Frontend_dPackages_dPkg.v_packageName pkg)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__196) -> (((((((((v_checkUncachedLib nFs) nClock) nEnv) nProcess) nExit) nArgs) wantWarnings) ctx) dtb__196)
  | _ -> failwith "DT: impossible branch"
))))))

# 2152 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitInputsOf = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun closure -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_depIfacesOfWith nFs) nClock) nEnv) nProcess) ctx) closure)) (fun depIfaces -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { f_SplitInputs_siClosure = closure; f_SplitInputs_siDepIfaces = depIfaces }))))))

# 161 "Vuna/Compiler/Driver/Compile.vuna"
let v_compileToDir = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_splitInputsOf nFs) nClock) nEnv) nProcess) ctx)) (fun inputs -> ((((((((((v_compileToDirGiven nFs) nConsole) nClock) nEnv) nProcess) inputs) ctx) entry) printResult) outDir))))

# 340 "Vuna/Compiler/Driver/Compile.vuna"
let v_buildSplit = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (dir : string) (outDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Frontend_dPackages_dPkg.v_loadPackage nFs) nEnv) dir)) (fun pkgR -> (match pkgR with
  | Base_dDiag.C_Check_ErrC (dtb__197) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__197)))
  | Base_dDiag.C_Check_OkC (dtb__198) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((v_compileToDir nFs) nConsole) nClock) nEnv) nProcess) (Frontend_dPackages_dPkg.v_packageContext dtb__198)) (Frontend_dPackages_dPkg.v_packageEntry dtb__198)) true) outDir)) (fun r -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match r with
  | Base_dDiag.C_Check_ErrC (dtb__199) -> (Base_dDiag.C_Check_ErrC (dtb__199))
  | Base_dDiag.C_Check_OkC (dtb__200) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb__200)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))

# 502 "Vuna/Compiler/Driver/Compile.vuna"
let v_psOrder = (fun (p : t_PkgSummary) -> (match p with
  | { f_PkgSummary_psOrder = dtb__201; f_PkgSummary_psIfaceHash = dtb__202 } -> dtb__201
  | _ -> failwith "DT: impossible branch"
))

# 503 "Vuna/Compiler/Driver/Compile.vuna"
let v_psIfaceHash = (fun (p : t_PkgSummary) -> (match p with
  | { f_PkgSummary_psOrder = dtb__203; f_PkgSummary_psIfaceHash = dtb__204 } -> dtb__204
  | _ -> failwith "DT: impossible branch"
))

# 746 "Vuna/Compiler/Driver/Compile.vuna"
let v_peName = (fun (p : t_PkgEntry) -> (match p with
  | { f_PkgEntry_peName = dtb__205; f_PkgEntry_peDir = dtb__206; f_PkgEntry_peKey = dtb__207; f_PkgEntry_peEnv = dtb__208 } -> dtb__205
  | _ -> failwith "DT: impossible branch"
))

# 747 "Vuna/Compiler/Driver/Compile.vuna"
let v_peDir = (fun (p : t_PkgEntry) -> (match p with
  | { f_PkgEntry_peName = dtb__209; f_PkgEntry_peDir = dtb__210; f_PkgEntry_peKey = dtb__211; f_PkgEntry_peEnv = dtb__212 } -> dtb__210
  | _ -> failwith "DT: impossible branch"
))

# 748 "Vuna/Compiler/Driver/Compile.vuna"
let v_peKey = (fun (p : t_PkgEntry) -> (match p with
  | { f_PkgEntry_peName = dtb__213; f_PkgEntry_peDir = dtb__214; f_PkgEntry_peKey = dtb__215; f_PkgEntry_peEnv = dtb__216 } -> dtb__215
  | _ -> failwith "DT: impossible branch"
))

# 749 "Vuna/Compiler/Driver/Compile.vuna"
let v_peEnv = (fun (p : t_PkgEntry) -> (match p with
  | { f_PkgEntry_peName = dtb__217; f_PkgEntry_peDir = dtb__218; f_PkgEntry_peKey = dtb__219; f_PkgEntry_peEnv = dtb__220 } -> dtb__220
  | _ -> failwith "DT: impossible branch"
))

# 752 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmPkg = (fun (p : t_ClosureMod) -> (match p with
  | { f_ClosureMod_cmPkg = dtb__221; f_ClosureMod_cmPkgKey = dtb__222; f_ClosureMod_cmPkgEnv = dtb__223; f_ClosureMod_cmName = dtb__224; f_ClosureMod_cmPath = dtb__225; f_ClosureMod_cmSrc = dtb__226; f_ClosureMod_cmImports = dtb__227; f_ClosureMod_cmAddr = dtb__228 } -> dtb__221
  | _ -> failwith "DT: impossible branch"
))

# 753 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmPkgKey = (fun (p : t_ClosureMod) -> (match p with
  | { f_ClosureMod_cmPkg = dtb__229; f_ClosureMod_cmPkgKey = dtb__230; f_ClosureMod_cmPkgEnv = dtb__231; f_ClosureMod_cmName = dtb__232; f_ClosureMod_cmPath = dtb__233; f_ClosureMod_cmSrc = dtb__234; f_ClosureMod_cmImports = dtb__235; f_ClosureMod_cmAddr = dtb__236 } -> dtb__230
  | _ -> failwith "DT: impossible branch"
))

# 754 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmPkgEnv = (fun (p : t_ClosureMod) -> (match p with
  | { f_ClosureMod_cmPkg = dtb__237; f_ClosureMod_cmPkgKey = dtb__238; f_ClosureMod_cmPkgEnv = dtb__239; f_ClosureMod_cmName = dtb__240; f_ClosureMod_cmPath = dtb__241; f_ClosureMod_cmSrc = dtb__242; f_ClosureMod_cmImports = dtb__243; f_ClosureMod_cmAddr = dtb__244 } -> dtb__239
  | _ -> failwith "DT: impossible branch"
))

# 755 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmName = (fun (p : t_ClosureMod) -> (match p with
  | { f_ClosureMod_cmPkg = dtb__245; f_ClosureMod_cmPkgKey = dtb__246; f_ClosureMod_cmPkgEnv = dtb__247; f_ClosureMod_cmName = dtb__248; f_ClosureMod_cmPath = dtb__249; f_ClosureMod_cmSrc = dtb__250; f_ClosureMod_cmImports = dtb__251; f_ClosureMod_cmAddr = dtb__252 } -> dtb__248
  | _ -> failwith "DT: impossible branch"
))

# 756 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmPath = (fun (p : t_ClosureMod) -> (match p with
  | { f_ClosureMod_cmPkg = dtb__253; f_ClosureMod_cmPkgKey = dtb__254; f_ClosureMod_cmPkgEnv = dtb__255; f_ClosureMod_cmName = dtb__256; f_ClosureMod_cmPath = dtb__257; f_ClosureMod_cmSrc = dtb__258; f_ClosureMod_cmImports = dtb__259; f_ClosureMod_cmAddr = dtb__260 } -> dtb__257
  | _ -> failwith "DT: impossible branch"
))

# 757 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmSrc = (fun (p : t_ClosureMod) -> (match p with
  | { f_ClosureMod_cmPkg = dtb__261; f_ClosureMod_cmPkgKey = dtb__262; f_ClosureMod_cmPkgEnv = dtb__263; f_ClosureMod_cmName = dtb__264; f_ClosureMod_cmPath = dtb__265; f_ClosureMod_cmSrc = dtb__266; f_ClosureMod_cmImports = dtb__267; f_ClosureMod_cmAddr = dtb__268 } -> dtb__266
  | _ -> failwith "DT: impossible branch"
))

# 758 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmImports = (fun (p : t_ClosureMod) -> (match p with
  | { f_ClosureMod_cmPkg = dtb__269; f_ClosureMod_cmPkgKey = dtb__270; f_ClosureMod_cmPkgEnv = dtb__271; f_ClosureMod_cmName = dtb__272; f_ClosureMod_cmPath = dtb__273; f_ClosureMod_cmSrc = dtb__274; f_ClosureMod_cmImports = dtb__275; f_ClosureMod_cmAddr = dtb__276 } -> dtb__275
  | _ -> failwith "DT: impossible branch"
))

# 759 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmAddr = (fun (p : t_ClosureMod) -> (match p with
  | { f_ClosureMod_cmPkg = dtb__277; f_ClosureMod_cmPkgKey = dtb__278; f_ClosureMod_cmPkgEnv = dtb__279; f_ClosureMod_cmName = dtb__280; f_ClosureMod_cmPath = dtb__281; f_ClosureMod_cmSrc = dtb__282; f_ClosureMod_cmImports = dtb__283; f_ClosureMod_cmAddr = dtb__284 } -> dtb__284
  | _ -> failwith "DT: impossible branch"
))

# 1306 "Vuna/Compiler/Driver/Compile.vuna"
let v_tcDepIfaces = (fun (p : t_ToolContext) -> (match p with
  | { f_ToolContext_tcDepIfaces = dtb__285; f_ToolContext_tcDepHashes = dtb__286; f_ToolContext_tcNeeded = dtb__287; f_ToolContext_tcOwnNames = dtb__288; f_ToolContext_tcStats = dtb__289 } -> dtb__285
  | _ -> failwith "DT: impossible branch"
))

# 1307 "Vuna/Compiler/Driver/Compile.vuna"
let v_tcDepHashes = (fun (p : t_ToolContext) -> (match p with
  | { f_ToolContext_tcDepIfaces = dtb__290; f_ToolContext_tcDepHashes = dtb__291; f_ToolContext_tcNeeded = dtb__292; f_ToolContext_tcOwnNames = dtb__293; f_ToolContext_tcStats = dtb__294 } -> dtb__291
  | _ -> failwith "DT: impossible branch"
))

# 1308 "Vuna/Compiler/Driver/Compile.vuna"
let v_tcNeeded = (fun (p : t_ToolContext) -> (match p with
  | { f_ToolContext_tcDepIfaces = dtb__295; f_ToolContext_tcDepHashes = dtb__296; f_ToolContext_tcNeeded = dtb__297; f_ToolContext_tcOwnNames = dtb__298; f_ToolContext_tcStats = dtb__299 } -> dtb__297
  | _ -> failwith "DT: impossible branch"
))

# 1311 "Vuna/Compiler/Driver/Compile.vuna"
let v_tcOwnNames = (fun (p : t_ToolContext) -> (match p with
  | { f_ToolContext_tcDepIfaces = dtb__300; f_ToolContext_tcDepHashes = dtb__301; f_ToolContext_tcNeeded = dtb__302; f_ToolContext_tcOwnNames = dtb__303; f_ToolContext_tcStats = dtb__304 } -> dtb__303
  | _ -> failwith "DT: impossible branch"
))

# 1312 "Vuna/Compiler/Driver/Compile.vuna"
let v_tcStats = (fun (p : t_ToolContext) -> (match p with
  | { f_ToolContext_tcDepIfaces = dtb__305; f_ToolContext_tcDepHashes = dtb__306; f_ToolContext_tcNeeded = dtb__307; f_ToolContext_tcOwnNames = dtb__308; f_ToolContext_tcStats = dtb__309 } -> dtb__309
  | _ -> failwith "DT: impossible branch"
))

# 2148 "Vuna/Compiler/Driver/Compile.vuna"
let v_siClosure = (fun (p : t_SplitInputs) -> (match p with
  | { f_SplitInputs_siClosure = dtb__310; f_SplitInputs_siDepIfaces = dtb__311 } -> dtb__310
  | _ -> failwith "DT: impossible branch"
))

# 2149 "Vuna/Compiler/Driver/Compile.vuna"
let v_siDepIfaces = (fun (p : t_SplitInputs) -> (match p with
  | { f_SplitInputs_siClosure = dtb__312; f_SplitInputs_siDepIfaces = dtb__313 } -> dtb__313
  | _ -> failwith "DT: impossible branch"
))
