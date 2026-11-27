open Vuna_runtime
type t_PkgEntry = { f_PkgEntry_peName : string; f_PkgEntry_peDir : string; f_PkgEntry_peKey : string; f_PkgEntry_peEnv : string; f_PkgEntry_peImplicitPrelude : bool }
and t_ClosureMod = { f_ClosureMod_cmPkg : string; f_ClosureMod_cmPkgKey : string; f_ClosureMod_cmPkgEnv : string; f_ClosureMod_cmName : string; f_ClosureMod_cmPath : string; f_ClosureMod_cmSrc : string; f_ClosureMod_cmImports : string B_dData_dList.t_List; f_ClosureMod_cmAddr : string }
and t_ToolContext = { f_ToolContext_tcDepIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List; f_ToolContext_tcDepHashes : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_ToolContext_tcNeeded : string B_dData_dList.t_List; f_ToolContext_tcOwnNames : string B_dData_dList.t_List; f_ToolContext_tcStats : Driver_dIface.t_SourceInfo B_dData_dList.t_List }
and t_SplitInputs = { f_SplitInputs_siClosure : t_ClosureMod B_dData_dList.t_List; f_SplitInputs_siDepIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List B_dData_dMaybe.t_Maybe }

# 59 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_mapEff = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__2 = Obj.obj (e) in (let dtb__3 = Obj.obj ((k (dtb__2 u))) in (dtb__3 u)))))) (mc0 dtb__0)) (fun y -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__4 = Obj.obj (e) in (let dtb__5 = Obj.obj ((k (dtb__4 u))) in (dtb__5 u)))))) ((v_mapEff mc0) dtb__1)) (fun ys -> (let x = (B_dData_dList.C_List__x58__x58_ (y, ys)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))
  | B_dData_dList.C_List_Nil -> (let x = B_dData_dList.C_List_Nil in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_concatMapEff = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__8 = Obj.obj (e) in (let dtb__9 = Obj.obj ((k (dtb__8 u))) in (dtb__9 u)))))) (mc0 dtb__6)) (fun xs -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__10 = Obj.obj (e) in (let dtb__11 = Obj.obj ((k (dtb__10 u))) in (dtb__11 u)))))) ((v_concatMapEff mc0) dtb__7)) (fun ys -> (let x = ((B_dData_dList.v_append xs) ys) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))
  | B_dData_dList.C_List_Nil -> (let x = B_dData_dList.C_List_Nil in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_mapMaybeEff = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__14 = Obj.obj (e) in (let dtb__15 = Obj.obj ((k (dtb__14 u))) in (dtb__15 u)))))) (mc0 dtb__12)) (fun y -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__16 = Obj.obj (e) in (let dtb__17 = Obj.obj ((k (dtb__16 u))) in (dtb__17 u)))))) ((v_mapMaybeEff mc0) dtb__13)) (fun ys -> (let x = (match y with
  | B_dData_dMaybe.C_Maybe_Just (dtb__18) -> (B_dData_dList.C_List__x58__x58_ (dtb__18, ys))
  | B_dData_dMaybe.C_Maybe_Nothing -> ys
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))
  | B_dData_dList.C_List_Nil -> (let x = B_dData_dList.C_List_Nil in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 151 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_ensureDirPathFuel = (fun (nFs : string) (nProcess : string) (fuel : int) (path : string) -> (if (fuel <= 0) then (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (if (if (if (path = "") then true else (path = ".")) then true else (path = "/")) then (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__19 = Obj.obj (e) in (let dtb__20 = Obj.obj ((k (dtb__19 u))) in (dtb__20 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__21 = Obj.obj (e) in (let dtb__22 = Obj.obj ((k (dtb__21 u))) in (dtb__22 u)))))) ((((v_ensureDirPathFuel nFs) nProcess) (fuel - 1)) (Base_dSource.v_parentOfPath path))) (fun _u -> ((B_dEffect_dFs.v_fsMakeDir nFs) path)))))))))

# 148 "Vuna/Compiler/Driver/Compile.vuna"
let v_ensureDirPath = (fun (nFs : string) (nProcess : string) (path : string) -> ((((v_ensureDirPathFuel nFs) nProcess) 256) path))

# 190 "Vuna/Compiler/Driver/Compile.vuna"
let v_modHashPair = (fun (m : t_ClosureMod) -> { B_dData_dPair.f_Pair_first = (m).f_ClosureMod_cmName; B_dData_dPair.f_Pair_second = (m).f_ClosureMod_cmAddr })

# 203 "Vuna/Compiler/Driver/Compile.vuna"
let v_summarySplitParts = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (mc0 : Frontend_dPackages_dPkg.t_PackageContext) (mc1 : Driver_dIface.t_ModuleIface B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (mc2 : string) (mc3 : bool) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((Driver_dDt.v_dtSplitProjectParts nFs) nConsole) nEnv) nProcess) mc0) mc2) mc3)
  | B_dData_dMaybe.C_Maybe_Just (dtb__23) -> ((((((((Driver_dDt.v_dtSplitProjectWithIfaces nFs) nConsole) nEnv) nProcess) mc0) mc2) mc3) dtb__23)
  | _ -> failwith "DT: impossible branch"
))

# 283 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeFileIfChanged = (fun (nFs : string) (path : string) (content : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__24 = Obj.obj (e) in (let dtb__25 = Obj.obj ((k (dtb__24 u))) in (dtb__25 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__26 = Obj.obj (e) in (let dtb__27 = Obj.obj ((k (dtb__26 u))) in (dtb__27 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun old -> (if (old = content) then (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((B_dEffect_dFs.v_fsWriteFile nFs) path) content)))) else (((B_dEffect_dFs.v_fsWriteFile nFs) path) content)))))

# 324 "Vuna/Compiler/Driver/Compile.vuna"
let v_copyFfiFiles = (fun (nFs : string) (nProcess : string) (ctxDir : string) (outDir : string) -> (let ffiDir = (ctxDir ^ "/ffi") in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__28 = Obj.obj (e) in (let dtb__29 = Obj.obj ((k (dtb__28 u))) in (dtb__29 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) ffiDir)) (fun exists -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__30 = Obj.obj (e) in (let dtb__31 = Obj.obj ((k (dtb__30 u))) in (dtb__31 u)))))) (if exists then ((B_dEffect_dFs.v_fsIsDirectory nFs) ffiDir) else (let x = false in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) (fun isDir -> (if (if exists then isDir else false) then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__32 = Obj.obj (e) in (let dtb__33 = Obj.obj ((k (dtb__32 u))) in (dtb__33 u)))))) ((B_dEffect_dFs.v_fsReadDir nFs) ffiDir)) (fun names -> (let cs = ((B_dData_dList.v_filter (fun (n : string) -> ((B_dData_dString.v_endsWith ".c") n))) names) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__34 = Obj.obj (e) in (let dtb__35 = Obj.obj ((k (dtb__34 u))) in (dtb__35 u)))))) (((v_ensureDirPath nFs) nProcess) (outDir ^ "/ffi"))) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__36 = Obj.obj (e) in (let dtb__37 = Obj.obj ((k (dtb__36 u))) in (dtb__37 u)))))) ((v_mapEff (fun (n : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__38 = Obj.obj (e) in (let dtb__39 = Obj.obj ((k (dtb__38 u))) in (dtb__39 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) (String.concat "" [ffiDir; "/"; ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) n)]))) (fun content -> (((B_dEffect_dFs.v_fsWriteFile nFs) (String.concat "" [outDir; "/ffi/"; ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) n)])) content))))) cs)) (fun _u -> (let x = ((B_dData_dList.v_map (fun (n : string) -> ("ffi/" ^ ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) n)))) cs) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))))) else (let x = B_dData_dList.C_List_Nil in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))))

# 374 "Vuna/Compiler/Driver/Compile.vuna"
let v_metaSchema = 2

# 377 "Vuna/Compiler/Driver/Compile.vuna"
let v_metaFileName = "build-meta.json"

# 381 "Vuna/Compiler/Driver/Compile.vuna"
let v_textHash = (fun (s : string) -> (Base_dHash.v_contentKey s))

# 387 "Vuna/Compiler/Driver/Compile.vuna"
let v_compilerFingerprint = (fun (nFs : string) (nEnv : string) -> ((Loader_dFingerprint.v_compilerFingerprintEff nFs) nEnv))

# 392 "Vuna/Compiler/Driver/Compile.vuna"
let v_cacheBase = (fun (nFs : string) (nEnv : string) (nProcess : string) -> (((Base_dStore.v_storeRootReadyEff nFs) nEnv) nProcess))

# 397 "Vuna/Compiler/Driver/Compile.vuna"
let v_collectVunaMeta = (fun (nFs : string) (dir : string) -> ((((Base_dWalk.v_collectFilesEff nFs) Frontend_dPackages_dSource.v_skipSourceDir) (fun (name : string) -> ((B_dData_dString.v_endsWith ".vuna") name))) dir))

# 400 "Vuna/Compiler/Driver/Compile.vuna"
let v_dropPrefixMeta = (fun (prefix : string) (s : string) -> (if ((B_dData_dString.v_startsWith prefix) s) then (((B_dData_dString.v_substring (B_dData_dString.v_byteLength prefix)) (bi_natSub (B_dData_dString.v_byteLength s) (B_dData_dString.v_byteLength prefix))) s) else s))

# 410 "Vuna/Compiler/Driver/Compile.vuna"
let v_slashToDot = (fun (c : int) -> (if (c = 47) then 46 else c))

# 407 "Vuna/Compiler/Driver/Compile.vuna"
let v_slashesToDots = (fun (s : string) -> (B_dData_dList.dtp_pack ((B_dData_dList.v_map v_slashToDot) (B_dData_dList.dtp_unpack s))))

# 413 "Vuna/Compiler/Driver/Compile.vuna"
let v_moduleNameOfPath = (fun (rootPath : string) (path : string) -> (let rel0 = ((v_dropPrefixMeta (rootPath ^ "/")) path) in (let rel = (if ((B_dData_dString.v_endsWith ".vuna") rel0) then (((B_dData_dString.v_substring 0) (bi_natSub (B_dData_dString.v_byteLength rel0) 5)) rel0) else rel0) in (v_slashesToDots rel))))

# 421 "Vuna/Compiler/Driver/Compile.vuna"
let v_rootSources = (fun (nFs : string) (root : Frontend_dPackages_dPkg.t_Root) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__40 = Obj.obj (e) in (let dtb__41 = Obj.obj ((k (dtb__40 u))) in (dtb__41 u)))))) ((v_collectVunaMeta nFs) (Frontend_dPackages_dPkg.v_rootDir root))) (fun paths -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__42 = Obj.obj (e) in (let dtb__43 = Obj.obj ((k (dtb__42 u))) in (dtb__43 u)))))) ((v_mapEff (fun (p : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__44 = Obj.obj (e) in (let dtb__45 = Obj.obj ((k (dtb__44 u))) in (dtb__45 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) p)) (fun content -> (let x = { B_dData_dPair.f_Pair_first = ((v_moduleNameOfPath (Frontend_dPackages_dPkg.v_rootDir root)) p); B_dData_dPair.f_Pair_second = (v_textHash content) } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))) paths)) (fun pairs -> (let x = ((B_dData_dSort.v_sortBy (fun (a : (string, int) B_dData_dPair.t_Pair) (b : (string, int) B_dData_dPair.t_Pair) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_u5afb3bbeddafcb50_uString) (B_dData_dPair.v_firstOf a)) (B_dData_dPair.v_firstOf b)))) pairs) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))

# 440 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_closureHashOf = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__46, dtb__47) -> (match dtb__46 with
  | { B_dData_dPair.f_Pair_first = dtb__48; B_dData_dPair.f_Pair_second = dtb__49 } -> ((v_closureHashOf dtb__47) ((mc1 * 1000003) + dtb__49))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 434 "Vuna/Compiler/Driver/Compile.vuna"
let v_rootHash = (fun (nFs : string) (root : Frontend_dPackages_dPkg.t_Root) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__50 = Obj.obj (e) in (let dtb__51 = Obj.obj ((k (dtb__50 u))) in (dtb__51 u)))))) ((v_rootSources nFs) root)) (fun sources -> (let x = ((v_closureHashOf sources) 0) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 445 "Vuna/Compiler/Driver/Compile.vuna"
let v_entrySource = (fun (nFs : string) (entry : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__52 = Obj.obj (e) in (let dtb__53 = Obj.obj ((k (dtb__52 u))) in (dtb__53 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) entry)) (fun content -> (let x = { B_dData_dPair.f_Pair_first = "<entry>"; B_dData_dPair.f_Pair_second = (v_textHash content) } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 452 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownRootsOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> ((B_dData_dList.v_filter (fun (r : Frontend_dPackages_dPkg.t_Root) -> ((Frontend_dPackages_dPkg.v_rootName r) = (Frontend_dPackages_dPkg.v_contextPackageName ctx)))) (Frontend_dPackages_dPkg.v_contextRoots ctx)))

# 455 "Vuna/Compiler/Driver/Compile.vuna"
let v_contextSources = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__54 = Obj.obj (e) in (let dtb__55 = Obj.obj ((k (dtb__54 u))) in (dtb__55 u)))))) ((v_concatMapEff (v_rootSources nFs)) (v_ownRootsOf ctx))) (fun own -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__56 = Obj.obj (e) in (let dtb__57 = Obj.obj ((k (dtb__56 u))) in (dtb__57 u)))))) ((v_entrySource nFs) entry)) (fun es -> (let x = ((B_dData_dList.v_append own) (B_dData_dList.C_List__x58__x58_ (es, B_dData_dList.C_List_Nil))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))

# 463 "Vuna/Compiler/Driver/Compile.vuna"
let v_dependencyHashes = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match (Frontend_dPackages_dPkg.v_contextRoots ctx) with
  | B_dData_dList.C_List_Nil -> (let x = B_dData_dList.C_List_Nil in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dList.C_List__x58__x58_ (dtb__58, dtb__59) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__60 = Obj.obj (e) in (let dtb__61 = Obj.obj ((k (dtb__60 u))) in (dtb__61 u)))))) ((v_mapEff (fun (r : Frontend_dPackages_dPkg.t_Root) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__62 = Obj.obj (e) in (let dtb__63 = Obj.obj ((k (dtb__62 u))) in (dtb__63 u)))))) ((v_rootHash nFs) r)) (fun h -> (let x = { B_dData_dPair.f_Pair_first = (Frontend_dPackages_dPkg.v_rootName r); B_dData_dPair.f_Pair_second = h } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))) dtb__59)) (fun pairs -> (let x = ((B_dData_dSort.v_sortBy (fun (a : (string, int) B_dData_dPair.t_Pair) (b : (string, int) B_dData_dPair.t_Pair) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_u5afb3bbeddafcb50_uString) (B_dData_dPair.v_firstOf a)) (B_dData_dPair.v_firstOf b)))) pairs) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
))

# 485 "Vuna/Compiler/Driver/Compile.vuna"
let v_compilerClosureModule = "Vuna.Compiler.Loader.Fingerprint"

# 511 "Vuna/Compiler/Driver/Compile.vuna"
let v_manifestIdentityOf = (fun (nFs : string) (root : Frontend_dPackages_dPkg.t_Root) (h : int) -> (let tomlPath = ((Frontend_dPackages_dPkg.v_rootDir root) ^ "/vuna.toml") in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__64 = Obj.obj (e) in (let dtb__65 = Obj.obj ((k (dtb__64 u))) in (dtb__65 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) tomlPath)) (fun exists -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__66 = Obj.obj (e) in (let dtb__67 = Obj.obj ((k (dtb__66 u))) in (dtb__67 u)))))) (if exists then ((B_dEffect_dFs.v_fsReadFile nFs) tomlPath) else (let x = "" in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) (fun toml -> (let x = { B_dData_dPair.f_Pair_first = (Frontend_dPackages_dPkg.v_rootName root); B_dData_dPair.f_Pair_second = (String.concat "" ["manifest:"; (string_of_int (v_textHash toml)); ":"; (string_of_int h)]) } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))))

# 522 "Vuna/Compiler/Driver/Compile.vuna"
let v_depRootIdentityEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (root : Frontend_dPackages_dPkg.t_Root) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__68 = Obj.obj (e) in (let dtb__69 = Obj.obj ((k (dtb__68 u))) in (dtb__69 u)))))) ((v_rootHash nFs) root)) (fun h -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") (String.concat "" ["dep-identity="; (Frontend_dPackages_dPkg.v_rootName root); " verdict=manifest src="; (string_of_int h)])) else 0) in (((v_manifestIdentityOf nFs) root) h)))))

# 530 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIdentitiesEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match (Frontend_dPackages_dPkg.v_contextRoots ctx) with
  | B_dData_dList.C_List_Nil -> (let x = B_dData_dList.C_List_Nil in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dList.C_List__x58__x58_ (dtb__70, dtb__71) -> ((v_mapEff (((v_depRootIdentityEff nFs) nEnv) nProcess)) dtb__71)
  | _ -> failwith "DT: impossible branch"
))

# 539 "Vuna/Compiler/Driver/Compile.vuna"
let v_pairText = (fun (p : (string, string) B_dData_dPair.t_Pair) -> (String.concat "" [(B_dData_dPair.v_firstOf p); "="; (B_dData_dPair.v_secondOf p)]))

# 536 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIdentitiesHash = (fun (pairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ ("dep-identities", ((B_dData_dList.v_map v_pairText) pairs)))))

# 489 "Vuna/Compiler/Driver/Compile.vuna"
let v_buildIdForEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__72 = Obj.obj (e) in (let dtb__73 = Obj.obj ((k (dtb__72 u))) in (dtb__73 u)))))) ((v_concatMapEff (v_rootSources nFs)) (v_ownRootsOf ctx))) (fun own -> (if ((B_dData_dList.v_memName v_compilerClosureModule) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) own)) then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__74 = Obj.obj (e) in (let dtb__75 = Obj.obj ((k (dtb__74 u))) in (dtb__75 u)))))) ((((v_depIdentitiesEff nFs) nEnv) nProcess) ctx)) (fun deps -> (let x = ((Loader_dFingerprint.v_compilerIdOf own) (v_depIdentitiesHash deps)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) else ((Loader_dFingerprint.v_compilerTagEff nFs) nEnv)))))

# 296 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeCompiledNormalized = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (outDir : string) (files : Driver_dSplit.t_SplitFile B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__76 = Obj.obj (e) in (let dtb__77 = Obj.obj ((k (dtb__76 u))) in (dtb__77 u)))))) (((v_ensureDirPath nFs) nProcess) outDir)) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__78 = Obj.obj (e) in (let dtb__79 = Obj.obj ((k (dtb__78 u))) in (dtb__79 u)))))) ((((v_buildIdForEff nFs) nEnv) nProcess) ctx)) (fun id -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__80 = Obj.obj (e) in (let dtb__81 = Obj.obj ((k (dtb__80 u))) in (dtb__81 u)))))) (((v_writeFileIfChanged nFs) (String.concat "" [outDir; "/"; Loader_dFingerprint.v_buildIdFileName])) (id ^ "\n"))) (fun _u -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") "write-compiled-start") else 0) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__82 = Obj.obj (e) in (let dtb__83 = Obj.obj ((k (dtb__82 u))) in (dtb__83 u)))))) (((Driver_dSplit.v_writeSplitFilesIfChanged nFs) outDir) files)) (fun written -> (match written with
  | Base_dDiag.C_Check_ErrC (dtb__84) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__84)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__85) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") "write-split-files-done") else 0) in (let graph = (Driver_dSplit.v_splitGraph files) in (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") "split-graph-done") else 0) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__86 = Obj.obj (e) in (let dtb__87 = Obj.obj ((k (dtb__86 u))) in (dtb__87 u)))))) ((((v_copyFfiFiles nFs) nProcess) (Frontend_dPackages_dPkg.v_contextDir ctx)) outDir)) (fun cFiles -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__88 = Obj.obj (e) in (let dtb__89 = Obj.obj ((k (dtb__88 u))) in (dtb__89 u)))))) (((B_dEffect_dFs.v_fsWriteFile nFs) (outDir ^ "/build.sh")) ((Driver_dSplit.v_buildScript graph) cFiles))) (fun _u -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") "build-script-done") else 0) in (let x = (Base_dDiag.C_Check_OkC (dtb__85)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))))))
  | _ -> failwith "DT: impossible branch"
)))))))))))

# 542 "Vuna/Compiler/Driver/Compile.vuna"
let v_metaPairText = (fun (mc0 : (string, int) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__90; B_dData_dPair.f_Pair_second = dtb__91 } -> (String.concat "" ["{\"name\":\""; dtb__90; "\",\"hash\":"; (string_of_int dtb__91); "}"])
  | _ -> failwith "DT: impossible branch"
))

# 545 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_joinJsonList = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__92, dtb__93) -> (match dtb__93 with
  | B_dData_dList.C_List_Nil -> dtb__92
  | _ -> (String.concat "" [dtb__92; ","; (v_joinJsonList dtb__93)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 552 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_lastSegmentRev = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__94, dtb__95) -> (if (dtb__94 = 47) then (B_dData_dList.dtp_pack mc1) else ((v_lastSegmentRev dtb__95) (B_dData_dList.C_List__x58__x58_ (dtb__94, mc1))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.dtp_pack mc1)
  | _ -> failwith "DT: impossible branch"
))

# 556 "Vuna/Compiler/Driver/Compile.vuna"
let v_lastSegment = (fun (path : string) -> ((v_lastSegmentRev (B_dData_dList.v_reverse (B_dData_dList.dtp_unpack path))) B_dData_dList.C_List_Nil))

# 575 "Vuna/Compiler/Driver/Compile.vuna"
let v_metaPathOf = (fun (outDir : string) -> (String.concat "" [outDir; "/"; v_metaFileName]))

# 604 "Vuna/Compiler/Driver/Compile.vuna"
let v_runBuildScript = (fun (nProcess : string) (dir : string) (out : string) (name : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__96 = Obj.obj (e) in (let dtb__97 = Obj.obj ((k (dtb__96 u))) in (dtb__97 u)))))) (((B_dEffect_dProcess.v_processRunIn nProcess) dir) (B_dData_dList.C_List__x58__x58_ ("sh", (B_dData_dList.C_List__x58__x58_ ("build.sh", (B_dData_dList.C_List__x58__x58_ (out, B_dData_dList.C_List_Nil)))))))) (fun code -> (let x = (if (code = 0) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_err (String.concat "" ["build: "; name; ": sh build.sh "; out; " failed in "; dir; " (exit "; (string_of_int code); ")"]))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 612 "Vuna/Compiler/Driver/Compile.vuna"
let v_projectIdOf = (fun (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__98 = Obj.obj (e) in (let dtb__99 = Obj.obj ((k (dtb__98 u))) in (dtb__99 u)))))) ((Frontend_dPackages_dPkg.v_absolutePath nEnv) (Frontend_dPackages_dPkg.v_contextDir ctx))) (fun abs -> (let x = (Loader_dAddr.v_projectIdAddrOf abs) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 626 "Vuna/Compiler/Driver/Compile.vuna"
let v_maybeSemanticText = (fun (mc0 : string B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__100) -> dtb__100
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 630 "Vuna/Compiler/Driver/Compile.vuna"
let v_depSourceText = (fun (mc0 : Frontend_dManifest.t_DependencySource) -> (match mc0 with
  | Frontend_dManifest.C_DependencySource_DepUrl (dtb__101) -> ("url:" ^ dtb__101)
  | Frontend_dManifest.C_DependencySource_DepGit (dtb__102, dtb__103) -> (String.concat "" ["git:"; dtb__102; "@"; dtb__103])
  | Frontend_dManifest.C_DependencySource_DepPath (dtb__104) -> ("path:" ^ dtb__104)
  | _ -> failwith "DT: impossible branch"
))

# 635 "Vuna/Compiler/Driver/Compile.vuna"
let v_depSemanticText = (fun (d : Frontend_dManifest.t_Dependency) -> (String.concat "" [(d).Frontend_dManifest.f_Dependency_depAlias; "|"; (v_depSourceText (d).Frontend_dManifest.f_Dependency_depSource); "|"; (v_maybeSemanticText (d).Frontend_dManifest.f_Dependency_depHash); "|"; (v_maybeSemanticText (d).Frontend_dManifest.f_Dependency_depIdentity)]))

# 639 "Vuna/Compiler/Driver/Compile.vuna"
let v_manifestSemanticText = (fun (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__105) -> (let man = (dtb__105).Frontend_dPackages_dPkg.f_Package_packageManifest in (let exportsText = (match (man).Frontend_dManifest.f_Manifest_manifestExports with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb__106) -> ((B_dData_dString.v_join ",") dtb__106)
  | _ -> failwith "DT: impossible branch"
) in (let preludeText = (if (man).Frontend_dManifest.f_Manifest_manifestImplicitPrelude then "true" else "false") in ((B_dData_dString.v_join "\n") (B_dData_dList.C_List__x58__x58_ (("name:" ^ (v_maybeSemanticText (man).Frontend_dManifest.f_Manifest_manifestName)), (B_dData_dList.C_List__x58__x58_ (("exports:" ^ exportsText), (B_dData_dList.C_List__x58__x58_ (("implicit-prelude:" ^ preludeText), ((B_dData_dList.v_map v_depSemanticText) (man).Frontend_dManifest.f_Manifest_manifestDependencies)))))))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 562 "Vuna/Compiler/Driver/Compile.vuna"
let v_buildMetaText = (fun (nFs : string) (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (linked : bool) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__107 = Obj.obj (e) in (let dtb__108 = Obj.obj ((k (dtb__107 u))) in (dtb__108 u)))))) (((v_contextSources nFs) ctx) entry)) (fun sources -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__109 = Obj.obj (e) in (let dtb__110 = Obj.obj ((k (dtb__109 u))) in (dtb__110 u)))))) ((v_dependencyHashes nFs) ctx)) (fun deps -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__111 = Obj.obj (e) in (let dtb__112 = Obj.obj ((k (dtb__111 u))) in (dtb__112 u)))))) ((Loader_dFingerprint.v_cacheTagEff nFs) nEnv)) (fun compiler -> (let manifestHash = (v_textHash (v_manifestSemanticText (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage)) in (let entryName = (v_lastSegment entry) in (let linkedText = (if linked then "true" else "false") in (let x = (String.concat "" ["{\"schema\":"; (string_of_int v_metaSchema); ",\"compiler\":\""; compiler; "\",\"package\":\""; (Frontend_dPackages_dPkg.v_contextPackageName ctx); "\",\"entry\":\""; entryName; "\",\"linked\":"; linkedText; ",\"closure\":"; (string_of_int ((v_closureHashOf sources) 0)); ",\"manifest\":"; (string_of_int manifestHash); ",\"sources\":["; (v_joinJsonList ((B_dData_dList.v_map v_metaPairText) sources)); "],\"dependencies\":["; (v_joinJsonList ((B_dData_dList.v_map v_metaPairText) deps)); "]}\n"]) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))))))))

# 578 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeBuildMeta = (fun (nFs : string) (nEnv : string) (outDir : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (linked : bool) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__113 = Obj.obj (e) in (let dtb__114 = Obj.obj ((k (dtb__113 u))) in (dtb__114 u)))))) (((((v_buildMetaText nFs) nEnv) ctx) entry) linked)) (fun text -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__115 = Obj.obj (e) in (let dtb__116 = Obj.obj ((k (dtb__115 u))) in (dtb__116 u)))))) (((B_dEffect_dFs.v_fsWriteFile nFs) (v_metaPathOf outDir)) text)) (fun n -> (let x = n in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))

# 586 "Vuna/Compiler/Driver/Compile.vuna"
let v_metaUpToDate = (fun (nFs : string) (nEnv : string) (outDir : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (binPath : string) -> (let path = (v_metaPathOf outDir) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__117 = Obj.obj (e) in (let dtb__118 = Obj.obj ((k (dtb__117 u))) in (dtb__118 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__119 = Obj.obj (e) in (let dtb__120 = Obj.obj ((k (dtb__119 u))) in (dtb__120 u)))))) (if exists then ((B_dEffect_dFs.v_fsFileExists nFs) binPath) else (let x = false in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) (fun binExists -> (if (if exists then binExists else false) then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__121 = Obj.obj (e) in (let dtb__122 = Obj.obj ((k (dtb__121 u))) in (dtb__122 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun raw -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__123 = Obj.obj (e) in (let dtb__124 = Obj.obj ((k (dtb__123 u))) in (dtb__124 u)))))) (((((v_buildMetaText nFs) nEnv) ctx) entry) true)) (fun expected -> (let x = (raw = expected) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))) else (let x = false in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))))

# 668 "Vuna/Compiler/Driver/Compile.vuna"
let v_depPackagesOf = (fun (mc0 : Frontend_dPackages_dPkg.t_Package) -> (match mc0 with
  | { Frontend_dPackages_dPkg.f_Package_packageManifest = dtb__125; Frontend_dPackages_dPkg.f_Package_packageDependencies = dtb__126; Frontend_dPackages_dPkg.f_Package_packageDir = dtb__127 } -> dtb__126
  | _ -> failwith "DT: impossible branch"
))

# 656 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_collectDepPackages = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__128, dtb__129) -> (if ((B_dData_dList.v_memName (Frontend_dPackages_dPkg.v_packageName dtb__128)) mc0) then ((v_collectDepPackages mc0) dtb__129) else (match ((v_collectDepPackages (B_dData_dList.C_List__x58__x58_ ((Frontend_dPackages_dPkg.v_packageName dtb__128), mc0))) (v_depPackagesOf dtb__128)) with
  | { B_dData_dPair.f_Pair_first = dtb__130; B_dData_dPair.f_Pair_second = dtb__131 } -> (match ((v_collectDepPackages dtb__130) dtb__129) with
  | { B_dData_dPair.f_Pair_first = dtb__132; B_dData_dPair.f_Pair_second = dtb__133 } -> { B_dData_dPair.f_Pair_first = dtb__132; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__131) (B_dData_dList.C_List__x58__x58_ (dtb__128, dtb__133))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 674 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_allNamesIn = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__134, dtb__135) -> (if ((B_dData_dList.v_memName dtb__134) mc1) then ((v_allNamesIn dtb__135) mc1) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 671 "Vuna/Compiler/Driver/Compile.vuna"
let v_sameNameSet = (fun (a : string B_dData_dList.t_List) (b : string B_dData_dList.t_List) -> (if (if ((B_dData_dList.v_length a) = (B_dData_dList.v_length b)) then ((v_allNamesIn a) b) else false) then ((v_allNamesIn b) a) else false))

# 685 "Vuna/Compiler/Driver/Compile.vuna"
let v_depPackageList = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__136) -> (B_dData_dPair.v_secondOf ((v_collectDepPackages B_dData_dList.C_List_Nil) (dtb__136).Frontend_dPackages_dPkg.f_Package_packageDependencies))
  | _ -> failwith "DT: impossible branch"
))

# 691 "Vuna/Compiler/Driver/Compile.vuna"
let v_depPackageCount = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (B_dData_dList.v_length (v_depPackageList ctx)))

# 703 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceObjectCodec = "module-iface 6"

# 729 "Vuna/Compiler/Driver/Compile.vuna"
let v_pkgKeyOf = (fun (name : string) -> (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ ("pkg", (B_dData_dList.C_List__x58__x58_ (name, B_dData_dList.C_List_Nil))))))

# 749 "Vuna/Compiler/Driver/Compile.vuna"
let v_contextImplicitPrelude = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | B_dData_dMaybe.C_Maybe_Just (dtb__137) -> (Frontend_dPackages_dPkg.v_packageImplicitPrelude dtb__137)
  | _ -> failwith "DT: impossible branch"
))

# 755 "Vuna/Compiler/Driver/Compile.vuna"
let v_pkgPreludePair = (fun (entry : t_PkgEntry) -> { B_dData_dPair.f_Pair_first = (entry).f_PkgEntry_peName; B_dData_dPair.f_Pair_second = (entry).f_PkgEntry_peImplicitPrelude })

# 758 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_findPkgEntry = (fun (mc0 : string) (mc1 : t_PkgEntry B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__138, dtb__139) -> (if ((dtb__138).f_PkgEntry_peName = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__138)) else ((v_findPkgEntry mc0) dtb__139))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 762 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_findClosureMod = (fun (mc0 : string) (mc1 : t_ClosureMod B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__140, dtb__141) -> (if ((dtb__140).f_ClosureMod_cmName = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__140)) else ((v_findClosureMod mc0) dtb__141))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 788 "Vuna/Compiler/Driver/Compile.vuna"
let v_closureModOf = (fun (nFs : string) (nEnv : string) (nProcess : string) (pe : t_PkgEntry) (root : string) (p : string) (raw : string) -> (let name = ((v_moduleNameOfPath root) p) in (let src = (Base_dHash.v_contentAddress raw) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__142 = Obj.obj (e) in (let dtb__143 = Obj.obj ((k (dtb__142 u))) in (dtb__143 u)))))) (((Loader_dFlatten.v_parseFileWithPath nFs) p) raw)) (fun parsed -> (let imports = (match parsed with
  | Base_dDiag.C_Check_ErrC (dtb__144) -> B_dData_dList.C_List_Nil
  | Base_dDiag.C_Check_OkC (dtb__145) -> (let hdr = ((Loader_dAddr.v_headerOfSource "") (B_dData_dPair.v_firstOf dtb__145)) in (hdr).Loader_dAddr.f_ModHeader_mhImports)
  | _ -> failwith "DT: impossible branch"
) in (let x = { f_ClosureMod_cmPkg = (pe).f_PkgEntry_peName; f_ClosureMod_cmPkgKey = (pe).f_PkgEntry_peKey; f_ClosureMod_cmPkgEnv = (pe).f_PkgEntry_peEnv; f_ClosureMod_cmName = name; f_ClosureMod_cmPath = p; f_ClosureMod_cmSrc = src; f_ClosureMod_cmImports = imports; f_ClosureMod_cmAddr = "" } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))))

# 768 "Vuna/Compiler/Driver/Compile.vuna"
let v_closureModsEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (pkgs : t_PkgEntry B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__146 = Obj.obj (e) in (let dtb__147 = Obj.obj ((k (dtb__146 u))) in (dtb__147 u)))))) ((v_mapEff (fun (r : Frontend_dPackages_dPkg.t_Root) -> (match ((v_findPkgEntry (Frontend_dPackages_dPkg.v_rootName r)) pkgs) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let x = B_dData_dList.C_List_Nil in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__148) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__149 = Obj.obj (e) in (let dtb__150 = Obj.obj ((k (dtb__149 u))) in (dtb__150 u)))))) ((v_collectVunaMeta nFs) (Frontend_dPackages_dPkg.v_rootDir r))) (fun paths -> ((v_mapEff (fun (p : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__151 = Obj.obj (e) in (let dtb__152 = Obj.obj ((k (dtb__151 u))) in (dtb__152 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) p)) (fun raw -> (((((((v_closureModOf nFs) nEnv) nProcess) dtb__148) (Frontend_dPackages_dPkg.v_rootDir r)) p) raw))))) paths)))
  | _ -> failwith "DT: impossible branch"
))) (Frontend_dPackages_dPkg.v_contextRoots ctx))) (fun per -> (let x = ((B_dData_dList.v_concatMap (fun (xs : t_ClosureMod B_dData_dList.t_List) -> xs)) per) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 811 "Vuna/Compiler/Driver/Compile.vuna"
let v_appendPrelude = (fun (preludeByPkg : (string, bool) B_dContainer_dHashMap.t_HashMap) (hasPrelude : bool) (m : t_ClosureMod) -> (let enabled = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (m).f_ClosureMod_cmPkg) preludeByPkg) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__153) -> dtb__153
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
) in (if (if (if (if hasPrelude then enabled else false) then ((m).f_ClosureMod_cmName <> "Prelude") else false) then (B_dData_dBool.v_not ((B_dData_dList.v_memName "Prelude") (m).f_ClosureMod_cmImports)) else false) then { f_ClosureMod_cmPkg = (m).f_ClosureMod_cmPkg; f_ClosureMod_cmPkgKey = (m).f_ClosureMod_cmPkgKey; f_ClosureMod_cmPkgEnv = (m).f_ClosureMod_cmPkgEnv; f_ClosureMod_cmName = (m).f_ClosureMod_cmName; f_ClosureMod_cmPath = (m).f_ClosureMod_cmPath; f_ClosureMod_cmSrc = (m).f_ClosureMod_cmSrc; f_ClosureMod_cmImports = ((B_dData_dList.v_append (m).f_ClosureMod_cmImports) (B_dData_dList.C_List__x58__x58_ ("Prelude", B_dData_dList.C_List_Nil))); f_ClosureMod_cmAddr = "" } else m)))

# 831 "Vuna/Compiler/Driver/Compile.vuna"
let v_modNameOf = (fun (m : t_ClosureMod) -> (m).f_ClosureMod_cmName)

# 834 "Vuna/Compiler/Driver/Compile.vuna"
let v_isDepModOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (m : t_ClosureMod) -> ((m).f_ClosureMod_cmPkg <> (Frontend_dPackages_dPkg.v_contextPackageName ctx)))

# 837 "Vuna/Compiler/Driver/Compile.vuna"
let v_isSelfModOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (m : t_ClosureMod) -> ((m).f_ClosureMod_cmPkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx)))

# 849 "Vuna/Compiler/Driver/Compile.vuna"
let v_depSrcOf = (fun (tbl : (string, string) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__154) -> dtb__154
  | B_dData_dMaybe.C_Maybe_Nothing -> ("ext:" ^ name)
  | _ -> failwith "DT: impossible branch"
))

# 859 "Vuna/Compiler/Driver/Compile.vuna"
let v_srcPairOf = (fun (m : t_ClosureMod) -> { B_dData_dPair.f_Pair_first = (v_modNameOf m); B_dData_dPair.f_Pair_second = (String.concat "" [(m).f_ClosureMod_cmPkgKey; "|"; (m).f_ClosureMod_cmSrc]) })

# 856 "Vuna/Compiler/Driver/Compile.vuna"
let v_srcTblOf = (fun (mods : t_ClosureMod B_dData_dList.t_List) -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map v_srcPairOf) mods)))

# 863 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceAddrOf = (fun (srcTbl : (string, string) B_dContainer_dHashMap.t_HashMap) (m : t_ClosureMod) -> (Loader_dAddr.v_addrOf ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ("module-iface", (B_dData_dList.C_List__x58__x58_ (v_ifaceObjectCodec, (B_dData_dList.C_List__x58__x58_ ((m).f_ClosureMod_cmPkgKey, (B_dData_dList.C_List__x58__x58_ ((m).f_ClosureMod_cmName, (B_dData_dList.C_List__x58__x58_ ((m).f_ClosureMod_cmSrc, (B_dData_dList.C_List__x58__x58_ ((m).f_ClosureMod_cmPkgEnv, B_dData_dList.C_List_Nil))))))))))))) ((B_dData_dList.v_map (v_depSrcOf srcTbl)) (m).f_ClosureMod_cmImports))))

# 868 "Vuna/Compiler/Driver/Compile.vuna"
let v_withAddr = (fun (srcTbl : (string, string) B_dContainer_dHashMap.t_HashMap) (m : t_ClosureMod) -> { f_ClosureMod_cmPkg = (m).f_ClosureMod_cmPkg; f_ClosureMod_cmPkgKey = (m).f_ClosureMod_cmPkgKey; f_ClosureMod_cmPkgEnv = (m).f_ClosureMod_cmPkgEnv; f_ClosureMod_cmName = (m).f_ClosureMod_cmName; f_ClosureMod_cmPath = (m).f_ClosureMod_cmPath; f_ClosureMod_cmSrc = (m).f_ClosureMod_cmSrc; f_ClosureMod_cmImports = (m).f_ClosureMod_cmImports; f_ClosureMod_cmAddr = ((v_ifaceAddrOf srcTbl) m) })

# 887 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceModsWithEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (pkgs : t_PkgEntry B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__155 = Obj.obj (e) in (let dtb__156 = Obj.obj ((k (dtb__155 u))) in (dtb__156 u)))))) (Base_dObs.v_obsMarkEff "vuna.iface.compute")) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__157 = Obj.obj (e) in (let dtb__158 = Obj.obj ((k (dtb__157 u))) in (dtb__158 u)))))) (B_dEffect_dClock.v_clockNow nClock)) (fun ta -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__159 = Obj.obj (e) in (let dtb__160 = Obj.obj ((k (dtb__159 u))) in (dtb__160 u)))))) (((((v_closureModsEff nFs) nEnv) nProcess) ctx) pkgs)) (fun mods0 -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__161 = Obj.obj (e) in (let dtb__162 = Obj.obj ((k (dtb__161 u))) in (dtb__162 u)))))) (B_dEffect_dClock.v_clockNow nClock)) (fun tb -> (let hasPrelude = ((B_dData_dList.v_memName "Prelude") ((B_dData_dList.v_map v_modNameOf) mods0)) in (let preludeByPkg = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map v_pkgPreludePair) pkgs)) in (let mods = ((B_dData_dList.v_map ((v_appendPrelude preludeByPkg) hasPrelude)) mods0) in (let srcTbl = (v_srcTblOf mods) in (let assigned = ((B_dData_dList.v_map (v_withAddr srcTbl)) mods) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__163 = Obj.obj (e) in (let dtb__164 = Obj.obj ((k (dtb__163 u))) in (dtb__164 u)))))) (let x = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") (String.concat "" ["iface-mods-phases n="; (string_of_int (B_dData_dList.v_length mods)); " closure="; (string_of_int (if 1000 = 0 then failwith "division by zero" else (tb - ta) / 1000)); "ms assign=direct"])) else 0) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__165 = Obj.obj (e) in (let dtb__166 = Obj.obj ((k (dtb__165 u))) in (dtb__166 u)))))) (Base_dObs.v_obsMarkEff "vuna.iface.compute")) (fun _u -> (let x = assigned in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))))))))))))))))

# 968 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_rootOfName = (fun (mc0 : string) (mc1 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__167, dtb__168) -> (if ((Frontend_dPackages_dPkg.v_rootName dtb__167) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__167)) else ((v_rootOfName mc0) dtb__168))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 973 "Vuna/Compiler/Driver/Compile.vuna"
let v_moduleStateDirEff = (fun (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (m : t_ClosureMod) -> (match ((v_rootOfName (m).f_ClosureMod_cmPkg) (Frontend_dPackages_dPkg.v_contextRoots ctx)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__169) -> ((Frontend_dPackages_dState.v_pkgStateDirEff nEnv) (Frontend_dPackages_dPkg.v_rootDir dtb__169))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Frontend_dPackages_dState.v_pkgStateDirEff nEnv) (Frontend_dPackages_dPkg.v_contextDir ctx))
  | _ -> failwith "DT: impossible branch"
))

# 980 "Vuna/Compiler/Driver/Compile.vuna"
let v_moduleIfaceDirEff = (fun (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (m : t_ClosureMod) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__170 = Obj.obj (e) in (let dtb__171 = Obj.obj ((k (dtb__170 u))) in (dtb__171 u)))))) (((v_moduleStateDirEff nEnv) ctx) m)) (fun state -> (let x = (Frontend_dPackages_dState.v_ifaceDirOf state) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 987 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownIfaceDirEff = (fun (nFs : string) (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__172 = Obj.obj (e) in (let dtb__173 = Obj.obj ((k (dtb__172 u))) in (dtb__173 u)))))) (((Frontend_dPackages_dState.v_ensurePkgStateDirEff nFs) nEnv) (Frontend_dPackages_dPkg.v_contextDir ctx))) (fun state -> (let dir = (Frontend_dPackages_dState.v_ifaceDirOf state) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__174 = Obj.obj (e) in (let dtb__175 = Obj.obj ((k (dtb__174 u))) in (dtb__175 u)))))) ((B_dEffect_dFs.v_fsMakeDir nFs) dir)) (fun _u -> (let x = dir in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))))

# 998 "Vuna/Compiler/Driver/Compile.vuna"
let v_readIfaceInEff = (fun (nFs : string) (dir : string) (a : string) -> (((Base_dObs.v_obsSpanEff "vuna.cache.lookup") "vuna.cache") (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__176 = Obj.obj (e) in (let dtb__177 = Obj.obj ((k (dtb__176 u))) in (dtb__177 u)))))) ((((Base_dStore.v_storeReadEff nFs) (Base_dStore.v_storeObjectTag "module-iface")) v_ifaceObjectCodec) (String.concat "" [dir; "/"; a]))) (fun payload -> (let x = (match payload with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__178) -> (Driver_dIface.v_decModuleIfaceComplete dtb__178)
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))

# 1010 "Vuna/Compiler/Driver/Compile.vuna"
let v_readIfaceOfModEff = (fun (nFs : string) (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (m : t_ClosureMod) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__179 = Obj.obj (e) in (let dtb__180 = Obj.obj ((k (dtb__179 u))) in (dtb__180 u)))))) (((v_moduleIfaceDirEff nEnv) ctx) m)) (fun dir -> (((v_readIfaceInEff nFs) dir) (m).f_ClosureMod_cmAddr))))

# 1019 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_readIfaceListPartialEff = (fun (nFs : string) (nEnv : string) (mc0 : Frontend_dPackages_dPkg.t_PackageContext) (mc1 : t_ClosureMod B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__181, dtb__182) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__183 = Obj.obj (e) in (let dtb__184 = Obj.obj ((k (dtb__183 u))) in (dtb__184 u)))))) ((((v_readIfaceOfModEff nFs) nEnv) mc0) dtb__181)) (fun mi -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__185 = Obj.obj (e) in (let dtb__186 = Obj.obj ((k (dtb__185 u))) in (dtb__186 u)))))) ((((v_readIfaceListPartialEff nFs) nEnv) mc0) dtb__182)) (fun xs -> (let x = (match mi with
  | B_dData_dMaybe.C_Maybe_Nothing -> xs
  | B_dData_dMaybe.C_Maybe_Just (dtb__187) -> (B_dData_dList.C_List__x58__x58_ (dtb__187, xs))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))
  | B_dData_dList.C_List_Nil -> (let x = B_dData_dList.C_List_Nil in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 1031 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_readIfaceListInEff = (fun (nFs : string) (nEnv : string) (mc0 : Frontend_dPackages_dPkg.t_PackageContext) (mc1 : t_ClosureMod B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__188, dtb__189) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__190 = Obj.obj (e) in (let dtb__191 = Obj.obj ((k (dtb__190 u))) in (dtb__191 u)))))) ((((v_readIfaceOfModEff nFs) nEnv) mc0) dtb__188)) (fun mi -> (match mi with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") (String.concat "" ["iface-miss "; (dtb__188).f_ClosureMod_cmName; " "; (dtb__188).f_ClosureMod_cmAddr; " pkg="; (dtb__188).f_ClosureMod_cmPkg; " src="; (dtb__188).f_ClosureMod_cmSrc])) else 0) in (let _u = (Base_dObs.v_obsMark (String.concat "" ["vuna.tool.iface.miss:"; (dtb__188).f_ClosureMod_cmName; ":"; (dtb__188).f_ClosureMod_cmAddr])) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__192 = Obj.obj (e) in (let dtb__193 = Obj.obj ((k (dtb__192 u))) in (dtb__193 u)))))) ((Base_dObs.v_obsCountEff "vuna.counter.cache.miss") 1)) (fun _u -> (let x = B_dData_dMaybe.C_Maybe_Nothing in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__194) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__195 = Obj.obj (e) in (let dtb__196 = Obj.obj ((k (dtb__195 u))) in (dtb__196 u)))))) ((Base_dObs.v_obsCountEff "vuna.counter.cache.hit") 1)) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__197 = Obj.obj (e) in (let dtb__198 = Obj.obj ((k (dtb__197 u))) in (dtb__198 u)))))) ((((v_readIfaceListInEff nFs) nEnv) mc0) dtb__189)) (fun xs -> (let x = (match xs with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__199) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__194, dtb__199))))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (let x = (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 1055 "Vuna/Compiler/Driver/Compile.vuna"
let v_depModsOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> ((B_dData_dList.v_filter (v_isDepModOf ctx)) mods))

# 1058 "Vuna/Compiler/Driver/Compile.vuna"
let v_selfModsOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> ((B_dData_dList.v_filter (v_isSelfModOf ctx)) mods))

# 1088 "Vuna/Compiler/Driver/Compile.vuna"
let v_closureName = (fun (m : t_ClosureMod) -> (m).f_ClosureMod_cmName)

# 1091 "Vuna/Compiler/Driver/Compile.vuna"
let v_closureOrderLess = (fun (a : t_ClosureMod) (b : t_ClosureMod) -> (let ka = (Base_dHash.v_contentKey (v_closureName a)) in (let kb = (Base_dHash.v_contentKey (v_closureName b)) in (if (ka <> kb) then (ka < kb) else ((v_closureName a) <= (v_closureName b))))))

# 1099 "Vuna/Compiler/Driver/Compile.vuna"
let v_orderClosureMods = (fun (mods : t_ClosureMod B_dData_dList.t_List) -> ((B_dData_dSort.v_sortBy v_closureOrderLess) mods))

# 1102 "Vuna/Compiler/Driver/Compile.vuna"
let v_closurePairLess = (fun (a : (t_ClosureMod, Driver_dIface.t_ModuleIface) B_dData_dPair.t_Pair) (b : (t_ClosureMod, Driver_dIface.t_ModuleIface) B_dData_dPair.t_Pair) -> ((v_closureOrderLess (B_dData_dPair.v_firstOf a)) (B_dData_dPair.v_firstOf b)))

# 1105 "Vuna/Compiler/Driver/Compile.vuna"
let v_orderClosurePairs = (fun (pairs : (t_ClosureMod, Driver_dIface.t_ModuleIface) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dSort.v_sortBy v_closurePairLess) pairs))

# 1108 "Vuna/Compiler/Driver/Compile.vuna"
let v_pkgEq = (fun (p : string) (m : t_ClosureMod) -> ((m).f_ClosureMod_cmPkg = p))

# 1111 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_distinctPkgs = (fun (mc0 : t_ClosureMod B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__200, dtb__201) -> (if ((B_dData_dList.v_memName (dtb__200).f_ClosureMod_cmPkg) mc1) then ((v_distinctPkgs dtb__201) mc1) else ((v_distinctPkgs dtb__201) (B_dData_dList.C_List__x58__x58_ ((dtb__200).f_ClosureMod_cmPkg, mc1))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 1117 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_probePairs = (fun (nFs : string) (nEnv : string) (mc0 : Frontend_dPackages_dPkg.t_PackageContext) (mc1 : t_ClosureMod B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__202, dtb__203) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__204 = Obj.obj (e) in (let dtb__205 = Obj.obj ((k (dtb__204 u))) in (dtb__205 u)))))) ((((v_readIfaceOfModEff nFs) nEnv) mc0) dtb__202)) (fun mi -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__206 = Obj.obj (e) in (let dtb__207 = Obj.obj ((k (dtb__206 u))) in (dtb__207 u)))))) ((((v_probePairs nFs) nEnv) mc0) dtb__203)) (fun xs -> (match mi with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__208 = Obj.obj (e) in (let dtb__209 = Obj.obj ((k (dtb__208 u))) in (dtb__209 u)))))) ((Base_dObs.v_obsCountEff "vuna.counter.cache.miss") 1)) (fun _u -> (let x = xs in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__210) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__211 = Obj.obj (e) in (let dtb__212 = Obj.obj ((k (dtb__211 u))) in (dtb__212 u)))))) ((Base_dObs.v_obsCountEff "vuna.counter.cache.hit") 1)) (fun _u -> (let x = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__202; B_dData_dPair.f_Pair_second = dtb__210 }, xs)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dList.C_List_Nil -> (let x = B_dData_dList.C_List_Nil in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 1134 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_findDepPackage = (fun (mc0 : string) (mc1 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__213, dtb__214) -> (if ((Frontend_dPackages_dPkg.v_packageName dtb__213) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__213)) else ((v_findDepPackage mc0) dtb__214))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1200 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_duplicateNamesOf = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__215, dtb__216) -> (if ((B_dData_dList.v_memName dtb__215) dtb__216) then true else (v_duplicateNamesOf dtb__216))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1197 "Vuna/Compiler/Driver/Compile.vuna"
let v_duplicatePairNames = (fun (pairs : (t_ClosureMod, Driver_dIface.t_ModuleIface) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (v_duplicateNamesOf ((B_dData_dList.v_map (fun (pair : (t_ClosureMod, Driver_dIface.t_ModuleIface) B_dData_dPair.t_Pair) -> (v_modNameOf (B_dData_dPair.v_firstOf pair)))) pairs)))

# 1214 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_rootExportsOf = (fun (mc0 : string) (mc1 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__217, dtb__218) -> (if ((Frontend_dPackages_dPkg.v_rootName dtb__217) = mc0) then (dtb__217).Frontend_dPackages_dPkg.f_Root_rootExports else ((v_rootExportsOf mc0) dtb__218))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1230 "Vuna/Compiler/Driver/Compile.vuna"
let v_importNameStr = (fun (mc0 : Frontend_dAst.t_Import) -> (match mc0 with
  | { Frontend_dAst.f_Import_importName = dtb__219; Frontend_dAst.f_Import_importIsQualified = dtb__220; Frontend_dAst.f_Import_importAlias = dtb__221; Frontend_dAst.f_Import_importRef = dtb__222 } -> dtb__219
  | _ -> failwith "DT: impossible branch"
))

# 1248 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolImportNamesOf = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (current : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__223 = Obj.obj (e) in (let dtb__224 = Obj.obj ((k (dtb__223 u))) in (dtb__224 u)))))) (((((Loader_dFlatten.v_implicitPrelude nFs) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) current) imports)) (fun implicitR -> (let x = (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__225) -> ((B_dData_dList.v_map v_importNameStr) imports)
  | Base_dDiag.C_Check_OkC (dtb__226) -> ((B_dData_dList.v_map v_importNameStr) ((B_dData_dList.v_append imports) dtb__226))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 1233 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolImportsOfSource = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__227 = Obj.obj (e) in (let dtb__228 = Obj.obj ((k (dtb__227 u))) in (dtb__228 u)))))) (((Loader_dFlatten.v_parseFileWithPath nFs) label) source)) (fun parsed -> (match parsed with
  | Base_dDiag.C_Check_ErrC (dtb__229) -> (let x = B_dData_dList.C_List_Nil in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__230) -> (let sf = (B_dData_dPair.v_firstOf dtb__230) in (let hdr = (sf).Frontend_dAst.f_SourceFile_sourceFileModDecl in (let imports = (sf).Frontend_dAst.f_SourceFile_sourceFileImports in (let nd_uscrut16 = hdr in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_toolImportNamesOf nFs) ctx) "") imports)
  | B_dData_dMaybe.C_Maybe_Just (dtb__231) -> (match dtb__231 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__232; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__233; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__234; Frontend_dAst.f_ModDecl_modDeclExports = dtb__235; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__236; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__237; Frontend_dAst.f_ModDecl_modDeclRef = dtb__238 } -> ((((v_toolImportNamesOf nFs) ctx) dtb__232) imports)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))

# 1263 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolEnabled = (fun (nEnv : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__239 = Obj.obj (e) in (let dtb__240 = Obj.obj ((k (dtb__239 u))) in (dtb__240 u)))))) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_IFACE_TOOL")) (fun v -> (let x = (v <> "0") in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 1269 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_importClosureGo = (fun (mc0 : int) (mc1 : t_ClosureMod B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__241, dtb__242) -> (if (mc0 <= 0) then mc3 else (if ((B_dData_dList.v_memName dtb__241) mc3) then ((((v_importClosureGo (mc0 - 1)) mc1) dtb__242) mc3) else (match ((v_findClosureMod dtb__241) mc1) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_importClosureGo (mc0 - 1)) mc1) dtb__242) (B_dData_dList.C_List__x58__x58_ (dtb__241, mc3)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__243) -> ((((v_importClosureGo (mc0 - 1)) mc1) ((B_dData_dList.v_append (dtb__243).f_ClosureMod_cmImports) dtb__242)) (B_dData_dList.C_List__x58__x58_ (dtb__241, mc3)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 1290 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_closureEdges = (fun (mc0 : t_ClosureMod B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__244, dtb__245) -> ((B_dData_dList.v_length (dtb__244).f_ClosureMod_cmImports) + (v_closureEdges dtb__245))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 1287 "Vuna/Compiler/Driver/Compile.vuna"
let v_closureFuel = (fun (mods : t_ClosureMod B_dData_dList.t_List) (starts : string B_dData_dList.t_List) -> ((((B_dData_dList.v_length starts) + (B_dData_dList.v_length mods)) + (v_closureEdges mods)) + 1))

# 1284 "Vuna/Compiler/Driver/Compile.vuna"
let v_importClosureOf = (fun (mods : t_ClosureMod B_dData_dList.t_List) (starts : string B_dData_dList.t_List) -> ((((v_importClosureGo ((v_closureFuel mods) starts)) mods) starts) B_dData_dList.C_List_Nil))

# 1294 "Vuna/Compiler/Driver/Compile.vuna"
let v_isNeededMod = (fun (needed : string B_dData_dList.t_List) (m : t_ClosureMod) -> ((B_dData_dList.v_memName (m).f_ClosureMod_cmName) needed))

# 1298 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolDepModsOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (needed : string B_dData_dList.t_List) -> ((B_dData_dList.v_filter (v_isNeededMod needed)) ((v_depModsOf ctx) mods)))

# 1363 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolTextHash = Driver_dIface.v_payloadDigest

# 1366 "Vuna/Compiler/Driver/Compile.vuna"
let v_sourceInfoForPath = (fun (nFs : string) (path : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__246 = Obj.obj (e) in (let dtb__247 = Obj.obj ((k (dtb__246 u))) in (dtb__247 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun raw -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__248 = Obj.obj (e) in (let dtb__249 = Obj.obj ((k (dtb__248 u))) in (dtb__249 u)))))) (((fun f e -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__250 = Obj.obj (e) in (f (dtb__250 u)))))) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime nFs) path))) (fun mtime -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__251 = Obj.obj (e) in (let dtb__252 = Obj.obj ((k (dtb__251 u))) in (dtb__252 u)))))) (((fun f e -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__253 = Obj.obj (e) in (f (dtb__253 u)))))) (fun (o : int B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe 0) o))) ((B_dEffect_dFs.v_fsFileSize nFs) path))) (fun size -> (let x = { Driver_dIface.f_SourceInfo_siPath = path; Driver_dIface.f_SourceInfo_siHash = (Driver_dIface.v_payloadDigest raw); Driver_dIface.f_SourceInfo_siMtime = mtime; Driver_dIface.f_SourceInfo_siSize = size } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))))

# 1374 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolNowSec = (fun (nClock : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__254 = Obj.obj (e) in (let dtb__255 = Obj.obj ((k (dtb__254 u))) in (dtb__255 u)))))) (B_dEffect_dClock.v_clockNow nClock)) (fun us -> (let x = (if 1000000 = 0 then failwith "division by zero" else us / 1000000) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 1382 "Vuna/Compiler/Driver/Compile.vuna"
let v_mtimeSafetyWindowSec = 5

# 1387 "Vuna/Compiler/Driver/Compile.vuna"
let v_sourceFresh = (fun (nFs : string) (builtSec : int) (si : Driver_dIface.t_SourceInfo) -> (let path = (Driver_dIface.v_siPathOf si) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__256 = Obj.obj (e) in (let dtb__257 = Obj.obj ((k (dtb__256 u))) in (dtb__257 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) exists) false) then (let x = false in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__258 = Obj.obj (e) in (let dtb__259 = Obj.obj ((k (dtb__258 u))) in (dtb__259 u)))))) (((fun f e -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__260 = Obj.obj (e) in (f (dtb__260 u)))))) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime nFs) path))) (fun m -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__261 = Obj.obj (e) in (let dtb__262 = Obj.obj ((k (dtb__261 u))) in (dtb__262 u)))))) (((fun f e -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__263 = Obj.obj (e) in (f (dtb__263 u)))))) (fun (o : int B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe 0) o))) ((B_dEffect_dFs.v_fsFileSize nFs) path))) (fun sz -> (if (if (if (m = (Driver_dIface.v_siMtimeOf si)) then (sz = (Driver_dIface.v_siSizeOf si)) else false) then (((Driver_dIface.v_siMtimeOf si) + v_mtimeSafetyWindowSec) <= builtSec) else false) then (let x = true in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__264 = Obj.obj (e) in (let dtb__265 = Obj.obj ((k (dtb__264 u))) in (dtb__265 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun content -> (let x = ((Driver_dIface.v_payloadDigest content) = (Driver_dIface.v_siHashOf si)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))))))))))

# 1407 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_toolSessionFresh = (fun (nFs : string) (mc0 : int) (mc1 : Driver_dIface.t_SourceInfo B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__266, dtb__267) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__268 = Obj.obj (e) in (let dtb__269 = Obj.obj ((k (dtb__268 u))) in (dtb__269 u)))))) (((v_sourceFresh nFs) mc0) dtb__266)) (fun fresh -> (if fresh then (((v_toolSessionFresh nFs) mc0) dtb__267) else (let x = false in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))
  | B_dData_dList.C_List_Nil -> (let x = true in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 1456 "Vuna/Compiler/Driver/Compile.vuna"
let v_statOfClosureMod = (fun (nFs : string) (m : t_ClosureMod) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__270 = Obj.obj (e) in (let dtb__271 = Obj.obj ((k (dtb__270 u))) in (dtb__271 u)))))) (((fun f e -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__272 = Obj.obj (e) in (f (dtb__272 u)))))) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime nFs) (m).f_ClosureMod_cmPath))) (fun mtime -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__273 = Obj.obj (e) in (let dtb__274 = Obj.obj ((k (dtb__273 u))) in (dtb__274 u)))))) (((fun f e -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__275 = Obj.obj (e) in (f (dtb__275 u)))))) (fun (o : int B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe 0) o))) ((B_dEffect_dFs.v_fsFileSize nFs) (m).f_ClosureMod_cmPath))) (fun size -> (let x = { Driver_dIface.f_SourceInfo_siPath = (m).f_ClosureMod_cmPath; Driver_dIface.f_SourceInfo_siHash = (m).f_ClosureMod_cmSrc; Driver_dIface.f_SourceInfo_siMtime = mtime; Driver_dIface.f_SourceInfo_siSize = size } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))

# 1481 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanWanted = (fun (needed : string B_dData_dList.t_List) (exclude : string B_dData_dMaybe.t_Maybe) (m : t_ClosureMod) -> (if ((B_dData_dList.v_memName (m).f_ClosureMod_cmName) needed) then (match exclude with
  | B_dData_dMaybe.C_Maybe_Just (dtb__276) -> ((m).f_ClosureMod_cmName <> dtb__276)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
) else false))

# 1550 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceLocNorm = (fun ctx -> ((Base_dSource.v_locationPathUnder ((B_dData_dList.v_map Frontend_dPackages_dPkg.v_rootDir) (Frontend_dPackages_dPkg.v_contextRoots ctx))) (Frontend_dPackages_dPkg.v_contextDir ctx)))

# 1603 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolCompilerFingerprint = (fun (nFs : string) (nEnv : string) -> ((v_compilerFingerprint nFs) nEnv))

# 1682 "Vuna/Compiler/Driver/Compile.vuna"
let v_elabFullRequested = (fun (nEnv : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__277 = Obj.obj (e) in (let dtb__278 = Obj.obj ((k (dtb__277 u))) in (dtb__278 u)))))) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_ELAB_FULL")) (fun v -> (let x = (v = "1") in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 1690 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceAuditRequested = (fun (nEnv : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__279 = Obj.obj (e) in (let dtb__280 = Obj.obj ((k (dtb__279 u))) in (dtb__280 u)))))) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_IFACE_AUDIT")) (fun v -> (let x = (v = "1") in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 1700 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkSignatureOf = (fun (mc0 : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, Driver_dDt.t_CheckedPackage) B_dData_dPair.t_Pair Base_dDiag.t_Check) -> (match mc0 with
  | Base_dDiag.C_Check_ErrC (dtb__281) -> ("err\n" ^ (Base_dDiag.v_diagText dtb__281))
  | Base_dDiag.C_Check_OkC (dtb__282) -> "ok\n"
  | _ -> failwith "DT: impossible branch"
))

# 1706 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitSignatureOf = (fun (mc0 : (Driver_dSplit.t_SplitFile B_dData_dList.t_List, Driver_dDt.t_CheckedPackage) B_dData_dPair.t_Pair Base_dDiag.t_Check) -> (match mc0 with
  | Base_dDiag.C_Check_ErrC (dtb__283) -> ("err\n" ^ (Base_dDiag.v_diagText dtb__283))
  | Base_dDiag.C_Check_OkC (dtb__284) -> ("ok\n" ^ ((Base_dBytes.v_encTop Driver_dSplit.v_encSplitFiles) (B_dData_dPair.v_firstOf dtb__284)))
  | _ -> failwith "DT: impossible branch"
))

# 1710 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_joinLines = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__285, dtb__286) -> (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) dtb__286) B_dData_dList.C_List_Nil) then dtb__285 else (String.concat "" [dtb__285; "\n"; (v_joinLines dtb__286)]))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1716 "Vuna/Compiler/Driver/Compile.vuna"
let v_auditCompare = (fun (subject : string) (at : string) (s : string) (f : string) -> (if (s = f) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_err (String.concat "" ["iface-audit-mismatch subject="; subject; " at="; at; " summary="; (string_of_int (v_textHash s)); "/"; (string_of_int (String.length s)); " full="; (string_of_int (v_textHash f)); "/"; (string_of_int (String.length f))]))))

# 1763 "Vuna/Compiler/Driver/Compile.vuna"
let v_readOneModIface = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (m : t_ClosureMod) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__287 = Obj.obj (e) in (let dtb__288 = Obj.obj ((k (dtb__287 u))) in (dtb__288 u)))))) ((((v_readIfaceOfModEff nFs) nEnv) ctx) m)) (fun mi -> (let x = { B_dData_dPair.f_Pair_first = m; B_dData_dPair.f_Pair_second = mi } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 1789 "Vuna/Compiler/Driver/Compile.vuna"
let[@tail_mod_cons] rec v_readIfaces = (fun (mc0 : (t_ClosureMod, Driver_dIface.t_ModuleIface B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__289, dtb__290) -> (match (B_dData_dPair.v_secondOf dtb__289) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_readIfaces dtb__290)
  | B_dData_dMaybe.C_Maybe_Just (dtb__291) -> (B_dData_dList.C_List__x58__x58_ (dtb__291, (v_readIfaces dtb__290)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1807 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_fromDirty = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__292, dtb__293) -> (if ((B_dData_dString.v_startsWith (dtb__292 ^ ".")) mc1) then true else ((v_fromDirty dtb__293) mc1))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1802 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_anyExportFrom = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__294, dtb__295) -> (if ((v_fromDirty mc0) (dtb__294).Loader_dModules.f_ExportEntry_target) then true else ((v_anyExportFrom mc0) dtb__295))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1799 "Vuna/Compiler/Driver/Compile.vuna"
let v_exportsFromDirty = (fun (dirty : string B_dData_dList.t_List) (mi : Driver_dIface.t_ModuleIface) -> ((v_anyExportFrom dirty) (Driver_dIface.v_miExportsOf mi)))

# 1814 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_dirtyFix = (fun (fuel : int) (dirty : string B_dData_dList.t_List) (cands : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (if (fuel <= 0) then dirty else (let added = ((B_dData_dList.v_map Driver_dIface.v_miNameOf) ((B_dData_dList.v_filter (fun (mi : Driver_dIface.t_ModuleIface) -> (if (B_dData_dBool.v_not ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf mi)) dirty)) then ((v_exportsFromDirty dirty) mi) else false))) cands)) in (if ((B_dData_dList.v_length added) = 0) then dirty else (((v_dirtyFix (fuel - 1)) ((B_dData_dList.v_append added) dirty)) cands)))))

# 1823 "Vuna/Compiler/Driver/Compile.vuna"
let v_collectClean = (fun (dirty0 : string B_dData_dList.t_List) (cands : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (let dirty = (((v_dirtyFix ((B_dData_dList.v_length cands) + 1)) dirty0) cands) in ((B_dData_dList.v_filter (fun (mi : Driver_dIface.t_ModuleIface) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf mi)) dirty)))) cands)))

# 1776 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanInfoWith = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__296 = Obj.obj (e) in (let dtb__297 = Obj.obj ((k (dtb__296 u))) in (dtb__297 u)))))) ((v_mapEff ((((v_readOneModIface nFs) nEnv) nProcess) ctx)) ((v_selfModsOf ctx) mods))) (fun reads -> (let ownNames = ((B_dData_dList.v_map v_modNameOf) ((v_selfModsOf ctx) mods)) in (let cands = (v_readIfaces reads) in (let missing = ((B_dData_dList.v_filter (fun (n : string) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName n) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) cands))))) ownNames) in (let clean = ((v_collectClean missing) cands) in (let x = (if ((B_dData_dList.v_length clean) = 0) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (clean))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))))

# 1863 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanModulesWith = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> (((((v_ownCleanInfoWith nFs) nEnv) nProcess) ctx) mods))

# 1901 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_cleanHashOf = (fun (mc0 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__298, dtb__299) -> (if ((Driver_dIface.v_miNameOf dtb__298) = mc1) then (B_dData_dMaybe.C_Maybe_Just ((Driver_dIface.v_miIfaceHashOf dtb__298))) else ((v_cleanHashOf dtb__299) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1888 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_moduleDepsOk = (fun (mc0 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mc2 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__300, dtb__301) -> (match dtb__300 with
  | { B_dData_dPair.f_Pair_first = dtb__302; B_dData_dPair.f_Pair_second = dtb__303 } -> (if (dtb__303 = Driver_dIface.v_depMissingHash) then (((v_moduleDepsOk mc0) mc1) dtb__301) else (match ((B_dData_dList.v_lookupPair dtb__302) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__304) -> (if (dtb__304 = dtb__303) then (((v_moduleDepsOk mc0) mc1) dtb__301) else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_cleanHashOf mc1) dtb__302) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__305) -> (if (dtb__305 = dtb__303) then (((v_moduleDepsOk mc0) mc1) dtb__301) else false)
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

# 1537 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_cleanPass = (fun (mc0 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mc2 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mc3 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__306, dtb__307) -> (if (((v_moduleDepsOk mc0) mc2) (Driver_dIface.v_miDepHashesOf dtb__306)) then ((((v_cleanPass mc0) dtb__307) (B_dData_dList.C_List__x58__x58_ (dtb__306, mc2))) (B_dData_dList.C_List__x58__x58_ (dtb__306, mc3))) else (let p = ((((v_cleanPass mc0) dtb__307) mc2) mc3) in { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__306, (B_dData_dPair.v_firstOf p))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) }))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse mc3) }
  | _ -> failwith "DT: impossible branch"
))

# 1522 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_cleanFixpoint = (fun (fuel : int) (depTbl : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (pending : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanRev : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (if (fuel <= 0) then ((B_dData_dList.v_append (B_dData_dList.v_reverse pending)) cleanRev) else (let nd_uscrut4 = ((((v_cleanPass depTbl) pending) cleanRev) B_dData_dList.C_List_Nil) in (match nd_uscrut4 with
  | { B_dData_dPair.f_Pair_first = dtb__308; B_dData_dPair.f_Pair_second = dtb__309 } -> (match dtb__308 with
  | B_dData_dList.C_List_Nil -> ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb__309)) cleanRev)
  | _ -> (if ((B_dData_dList.v_length dtb__309) = 0) then ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb__308)) cleanRev) else (let _u = ((Base_dObs.v_obsCounter "vuna.tool.clean.kept") (B_dData_dList.v_length dtb__309)) in ((((v_cleanFixpoint (fuel - 1)) depTbl) dtb__308) ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb__309)) cleanRev))))
)
  | _ -> failwith "DT: impossible branch"
))))

# 1910 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceCompilerTag = (fun (nFs : string) (nEnv : string) -> ((Loader_dFingerprint.v_cacheTagEff nFs) nEnv))

# 929 "Vuna/Compiler/Driver/Compile.vuna"
let v_rootEnvHashOf = (fun (nFs : string) (nEnv : string) (dir : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__310 = Obj.obj (e) in (let dtb__311 = Obj.obj ((k (dtb__310 u))) in (dtb__311 u)))))) (let x = (dir ^ "/vuna.toml") in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))) (fun tomlPath -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__312 = Obj.obj (e) in (let dtb__313 = Obj.obj ((k (dtb__312 u))) in (dtb__313 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) tomlPath)) (fun exists -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__314 = Obj.obj (e) in (let dtb__315 = Obj.obj ((k (dtb__314 u))) in (dtb__315 u)))))) (if exists then ((B_dEffect_dFs.v_fsReadFile nFs) tomlPath) else (let x = "" in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) (fun toml -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__316 = Obj.obj (e) in (let dtb__317 = Obj.obj ((k (dtb__316 u))) in (dtb__317 u)))))) ((v_ifaceCompilerTag nFs) nEnv)) (fun tag -> (let x = (v_textHash (String.concat "" [(string_of_int (v_textHash toml)); "|"; tag; "|"])) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))))))

# 938 "Vuna/Compiler/Driver/Compile.vuna"
let v_rootPkgTableEff = (fun (nFs : string) (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> ((v_mapEff (fun (r : Frontend_dPackages_dPkg.t_Root) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__318 = Obj.obj (e) in (let dtb__319 = Obj.obj ((k (dtb__318 u))) in (dtb__319 u)))))) (((v_rootEnvHashOf nFs) nEnv) (Frontend_dPackages_dPkg.v_rootDir r))) (fun env -> (let x = { f_PkgEntry_peName = (Frontend_dPackages_dPkg.v_rootName r); f_PkgEntry_peDir = (Frontend_dPackages_dPkg.v_rootDir r); f_PkgEntry_peKey = (v_pkgKeyOf (Frontend_dPackages_dPkg.v_rootName r)); f_PkgEntry_peEnv = (string_of_int env); f_PkgEntry_peImplicitPrelude = (Frontend_dPackages_dPkg.v_rootImplicitPrelude r) } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))) (Frontend_dPackages_dPkg.v_contextRoots ctx)))

# 955 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifacesForRootsEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__320 = Obj.obj (e) in (let dtb__321 = Obj.obj ((k (dtb__320 u))) in (dtb__321 u)))))) (((v_rootPkgTableEff nFs) nEnv) ctx)) (fun pkgs -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__322 = Obj.obj (e) in (let dtb__323 = Obj.obj ((k (dtb__322 u))) in (dtb__323 u)))))) ((((((v_ifaceModsWithEff nFs) nClock) nEnv) nProcess) ctx) pkgs)) (fun mods -> ((((v_readIfaceListInEff nFs) nEnv) ctx) mods))))))

# 1332 "Vuna/Compiler/Driver/Compile.vuna"
let v_baseDepIfacesOf = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Just (dtb__324) -> (let x = B_dData_dMaybe.C_Maybe_Nothing in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_ifacesForRootsEff nFs) nClock) nEnv) nProcess) ctx)
  | _ -> failwith "DT: impossible branch"
))

# 1737 "Vuna/Compiler/Driver/Compile.vuna"
let v_packageEnvHash = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (let own = (v_textHash (v_manifestSemanticText (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage)) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__325 = Obj.obj (e) in (let dtb__326 = Obj.obj ((k (dtb__325 u))) in (dtb__326 u)))))) ((((v_depIdentitiesEff nFs) nEnv) nProcess) ctx)) (fun deps -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__327 = Obj.obj (e) in (let dtb__328 = Obj.obj ((k (dtb__327 u))) in (dtb__328 u)))))) ((v_ifaceCompilerTag nFs) nEnv)) (fun tag -> (let x = (v_textHash (String.concat "" [(string_of_int own); "|"; tag; "|"; (v_joinLines ((B_dData_dList.v_map v_pairText) deps))])) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))))

# 732 "Vuna/Compiler/Driver/Compile.vuna"
let v_pkgTableEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__329 = Obj.obj (e) in (let dtb__330 = Obj.obj ((k (dtb__329 u))) in (dtb__330 u)))))) ((((v_packageEnvHash nFs) nEnv) nProcess) ctx)) (fun ownEnv -> (let own = { f_PkgEntry_peName = (Frontend_dPackages_dPkg.v_contextPackageName ctx); f_PkgEntry_peDir = (Frontend_dPackages_dPkg.v_contextDir ctx); f_PkgEntry_peKey = (v_pkgKeyOf (Frontend_dPackages_dPkg.v_contextPackageName ctx)); f_PkgEntry_peEnv = (string_of_int ownEnv); f_PkgEntry_peImplicitPrelude = (v_contextImplicitPrelude ctx) } in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__331 = Obj.obj (e) in (let dtb__332 = Obj.obj ((k (dtb__331 u))) in (dtb__332 u)))))) ((v_mapEff (fun (p : Frontend_dPackages_dPkg.t_Package) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__333 = Obj.obj (e) in (let dtb__334 = Obj.obj ((k (dtb__333 u))) in (dtb__334 u)))))) ((((v_packageEnvHash nFs) nEnv) nProcess) (Frontend_dPackages_dPkg.v_packageContext p))) (fun e -> (let x = { f_PkgEntry_peName = (Frontend_dPackages_dPkg.v_packageName p); f_PkgEntry_peDir = (Frontend_dPackages_dPkg.v_packageDir p); f_PkgEntry_peKey = (v_pkgKeyOf (Frontend_dPackages_dPkg.v_packageName p)); f_PkgEntry_peEnv = (string_of_int e); f_PkgEntry_peImplicitPrelude = (Frontend_dPackages_dPkg.v_packageImplicitPrelude p) } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))) (v_depPackageList ctx))) (fun deps -> (let x = (B_dData_dList.C_List__x58__x58_ (own, deps)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))))

# 881 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceModsEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__335 = Obj.obj (e) in (let dtb__336 = Obj.obj ((k (dtb__335 u))) in (dtb__336 u)))))) ((((v_pkgTableEff nFs) nEnv) nProcess) ctx)) (fun pkgs -> ((((((v_ifaceModsWithEff nFs) nClock) nEnv) nProcess) ctx) pkgs))))

# 909 "Vuna/Compiler/Driver/Compile.vuna"
let v_summaryClosureMods = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let x = B_dData_dList.C_List_Nil in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__337) -> (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)
  | _ -> failwith "DT: impossible branch"
))

# 948 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifacesForContextEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__338 = Obj.obj (e) in (let dtb__339 = Obj.obj ((k (dtb__338 u))) in (dtb__339 u)))))) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> ((((v_readIfaceListInEff nFs) nEnv) ctx) mods))))

# 1301 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForToolSource = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__340 = Obj.obj (e) in (let dtb__341 = Obj.obj ((k (dtb__340 u))) in (dtb__341 u)))))) (v_toolEnabled nEnv)) (fun enabled -> (if enabled then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__342 = Obj.obj (e) in (let dtb__343 = Obj.obj ((k (dtb__342 u))) in (dtb__343 u)))))) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__344 = Obj.obj (e) in (let dtb__345 = Obj.obj ((k (dtb__344 u))) in (dtb__345 u)))))) ((((((v_toolImportsOfSource nFs) nEnv) nProcess) ctx) label) source)) (fun starts -> (let needed = ((v_importClosureOf mods) starts) in (let depMods = (((v_toolDepModsOf ctx) mods) needed) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("tool-closure modules=" ^ (string_of_int (B_dData_dList.v_length depMods)))) else 0) in ((((v_readIfaceListInEff nFs) nEnv) ctx) depMods)))))))) else (let x = B_dData_dMaybe.C_Maybe_Nothing in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))

# 1319 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForToolProgram = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) -> (((((((v_depIfacesForToolSource nFs) nClock) nEnv) nProcess) ctx) "<repl>") program))

# 1415 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolNeededOfImports = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (tool : t_ToolContext) (currentName : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__346 = Obj.obj (e) in (let dtb__347 = Obj.obj ((k (dtb__346 u))) in (dtb__347 u)))))) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__348 = Obj.obj (e) in (let dtb__349 = Obj.obj ((k (dtb__348 u))) in (dtb__349 u)))))) ((((v_toolImportNamesOf nFs) ctx) currentName) imports)) (fun importNames -> (let x = ((v_importClosureOf mods) importNames) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))

# 1424 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForToolSourceDetailed = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__350 = Obj.obj (e) in (let dtb__351 = Obj.obj ((k (dtb__350 u))) in (dtb__351 u)))))) (v_toolEnabled nEnv)) (fun enabled -> (if enabled then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__352 = Obj.obj (e) in (let dtb__353 = Obj.obj ((k (dtb__352 u))) in (dtb__353 u)))))) (Base_dObs.v_obsMarkEff "vuna.tool.ifaces.lookup")) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__354 = Obj.obj (e) in (let dtb__355 = Obj.obj ((k (dtb__354 u))) in (dtb__355 u)))))) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__356 = Obj.obj (e) in (let dtb__357 = Obj.obj ((k (dtb__356 u))) in (dtb__357 u)))))) ((((((v_toolImportsOfSource nFs) nEnv) nProcess) ctx) label) source)) (fun starts -> (let needed = ((v_importClosureOf mods) starts) in (let depMods = (((v_toolDepModsOf ctx) mods) needed) in (let depHashes = ((B_dData_dList.v_map v_modHashPair) depMods) in (let ownNames = ((B_dData_dList.v_map v_modNameOf) ((v_selfModsOf ctx) mods)) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("tool-closure modules=" ^ (string_of_int (B_dData_dList.v_length depMods)))) else 0) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__358 = Obj.obj (e) in (let dtb__359 = Obj.obj ((k (dtb__358 u))) in (dtb__359 u)))))) ((((v_readIfaceListInEff nFs) nEnv) ctx) depMods)) (fun ifaces -> (match ifaces with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__360 = Obj.obj (e) in (let dtb__361 = Obj.obj ((k (dtb__360 u))) in (dtb__361 u)))))) (Base_dObs.v_obsMarkEff "vuna.tool.ifaces.missing")) (fun _u -> (let x = B_dData_dMaybe.C_Maybe_Nothing in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__362) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__363 = Obj.obj (e) in (let dtb__364 = Obj.obj ((k (dtb__363 u))) in (dtb__364 u)))))) (Base_dObs.v_obsMarkEff "vuna.tool.ifaces.ready")) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__365 = Obj.obj (e) in (let dtb__366 = Obj.obj ((k (dtb__365 u))) in (dtb__366 u)))))) ((v_mapEff (v_statOfClosureMod nFs)) depMods)) (fun stats -> (let x = (B_dData_dMaybe.C_Maybe_Just ({ f_ToolContext_tcDepIfaces = dtb__362; f_ToolContext_tcDepHashes = depHashes; f_ToolContext_tcNeeded = needed; f_ToolContext_tcOwnNames = ownNames; f_ToolContext_tcStats = stats })) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))
  | _ -> failwith "DT: impossible branch"
)))))))))))))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__367 = Obj.obj (e) in (let dtb__368 = Obj.obj ((k (dtb__367 u))) in (dtb__368 u)))))) (Base_dObs.v_obsMarkEff "vuna.tool.ifaces.disabled")) (fun _u -> (let x = B_dData_dMaybe.C_Maybe_Nothing in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))))

# 1570 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeModuleIfaceGuarded = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mi : Driver_dIface.t_ModuleIface) -> (if ((Frontend_dPackages_dPkg.v_contextPackageName ctx) = "") then (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__369 = Obj.obj (e) in (let dtb__370 = Obj.obj ((k (dtb__369 u))) in (dtb__370 u)))))) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (match ((v_findClosureMod (Driver_dIface.v_miNameOf mi)) mods) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__371) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__372 = Obj.obj (e) in (let dtb__373 = Obj.obj ((k (dtb__372 u))) in (dtb__373 u)))))) (((v_ownIfaceDirEff nFs) nEnv) ctx)) (fun dir -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__374 = Obj.obj (e) in (let dtb__375 = Obj.obj ((k (dtb__374 u))) in (dtb__375 u)))))) (((Base_dObs.v_obsSpanEff "vuna.cache.write") "vuna.cache") (((((Base_dStore.v_storeWriteIfChangedEff nFs) (Base_dStore.v_storeObjectTag "module-iface")) v_ifaceObjectCodec) (String.concat "" [dir; "/"; (dtb__371).f_ClosureMod_cmAddr])) (Driver_dIface.v_encModuleIface mi)))) (fun _u -> (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))
  | _ -> failwith "DT: impossible branch"
)))))

# 1555 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolWriteModuleIface = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (tool : t_ToolContext) (clean : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (checked : Driver_dDt.t_CheckedPackage) (name : string) (si : Driver_dIface.t_SourceInfo) -> (let norm = (v_ifaceLocNorm ctx) in (let miResult = ((((((((((Driver_dIface.v_ifaceOfModule (Frontend_dPackages_dPkg.v_contextPackageName ctx)) si) (tool).f_ToolContext_tcDepHashes) (checked).Driver_dDt.f_CheckedPackage_checkedInherited) clean) (checked).Driver_dDt.f_CheckedPackage_checkedModules) (checked).Driver_dDt.f_CheckedPackage_checkedEntryDecls) (checked).Driver_dDt.f_CheckedPackage_checkedProgram) norm) name) in (match miResult with
  | Base_dDiag.C_Check_ErrC (dtb__376) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__376)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__377) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__378 = Obj.obj (e) in (let dtb__379 = Obj.obj ((k (dtb__378 u))) in (dtb__379 u)))))) ((((((v_writeModuleIfaceGuarded nFs) nClock) nEnv) nProcess) ctx) dtb__377)) (fun _u -> (let x = (Base_dDiag.C_Check_OkC (dtb__377)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
))))

# 1726 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfaceHashTable = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__380 = Obj.obj (e) in (let dtb__381 = Obj.obj ((k (dtb__380 u))) in (dtb__381 u)))))) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (let x = ((B_dData_dList.v_map v_modHashPair) ((v_depModsOf ctx) mods)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 1769 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanInfo = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__382 = Obj.obj (e) in (let dtb__383 = Obj.obj ((k (dtb__382 u))) in (dtb__383 u)))))) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((((v_ownCleanInfoWith nFs) nEnv) nProcess) ctx) mods))))

# 1835 "Vuna/Compiler/Driver/Compile.vuna"
let v_explainContextEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__384 = Obj.obj (e) in (let dtb__385 = Obj.obj ((k (dtb__384 u))) in (dtb__385 u)))))) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__386 = Obj.obj (e) in (let dtb__387 = Obj.obj ((k (dtb__386 u))) in (dtb__387 u)))))) ((v_mapEff ((((v_readOneModIface nFs) nEnv) nProcess) ctx)) ((v_selfModsOf ctx) mods))) (fun reads -> (let own = ((v_selfModsOf ctx) mods) in (let ownNames = ((B_dData_dList.v_map v_modNameOf) own) in (let cands = (v_readIfaces reads) in (let candNames = ((B_dData_dList.v_map Driver_dIface.v_miNameOf) cands) in (let missing = ((B_dData_dList.v_filter (fun (n : string) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName n) candNames)))) ownNames) in (let dirty = (((v_dirtyFix ((B_dData_dList.v_length cands) + 1)) B_dData_dList.C_List_Nil) cands) in (let hits = ((B_dData_dList.v_filter (fun (n : string) -> (if (B_dData_dBool.v_not ((B_dData_dList.v_memName n) missing)) then (B_dData_dBool.v_not ((B_dData_dList.v_memName n) dirty)) else false))) ownNames) in (let reexported = ((B_dData_dList.v_filter (fun (n : string) -> ((B_dData_dList.v_memName n) dirty))) ownNames) in (let pkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx) in (let lines = ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (n : string) -> (String.concat "" ["explain "; pkg; " "; ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) n); " hit"]))) hits)) ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (n : string) -> (String.concat "" ["explain "; pkg; " "; ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) n); " stale:no-iface"]))) missing)) ((B_dData_dList.v_map (fun (n : string) -> (String.concat "" ["explain "; pkg; " "; ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) n); " stale:reexport-dirty"]))) reexported))) in (let x = ((B_dData_dSort.v_sortBy (fun (a : string) (b : string) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_u5afb3bbeddafcb50_uString) a) b))) lines) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))))))))))))

# 1853 "Vuna/Compiler/Driver/Compile.vuna"
let v_explainPackageEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (pkg : Frontend_dPackages_dPkg.t_Package) -> (((((v_explainContextEff nFs) nClock) nEnv) nProcess) (Frontend_dPackages_dPkg.v_packageContext pkg)))

# 1856 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanModules = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__388 = Obj.obj (e) in (let dtb__389 = Obj.obj ((k (dtb__388 u))) in (dtb__389 u)))))) (((((v_ownCleanInfo nFs) nClock) nEnv) nProcess) ctx)) (fun info -> (let x = info in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 1869 "Vuna/Compiler/Driver/Compile.vuna"
let v_cleanIfacesOrEmpty = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__390 = Obj.obj (e) in (let dtb__391 = Obj.obj ((k (dtb__390 u))) in (dtb__391 u)))))) (((((v_ownCleanModules nFs) nClock) nEnv) nProcess) ctx)) (fun clean -> (let x = (match clean with
  | B_dData_dMaybe.C_Maybe_Just (dtb__392) -> dtb__392
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 1587 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolWriteModuleIfaceCold = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : Driver_dDt.t_CheckedPackage) (name : string) (si : Driver_dIface.t_SourceInfo) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__393 = Obj.obj (e) in (let dtb__394 = Obj.obj ((k (dtb__393 u))) in (dtb__394 u)))))) (((((v_cleanIfacesOrEmpty nFs) nClock) nEnv) nProcess) ctx)) (fun clean -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__395 = Obj.obj (e) in (let dtb__396 = Obj.obj ((k (dtb__395 u))) in (dtb__396 u)))))) (((((v_depIfaceHashTable nFs) nClock) nEnv) nProcess) ctx)) (fun depTbl -> (let norm = (v_ifaceLocNorm ctx) in (let miResult = ((((((((((Driver_dIface.v_ifaceOfModule (Frontend_dPackages_dPkg.v_contextPackageName ctx)) si) depTbl) (checked).Driver_dDt.f_CheckedPackage_checkedInherited) clean) (checked).Driver_dDt.f_CheckedPackage_checkedModules) (checked).Driver_dDt.f_CheckedPackage_checkedEntryDecls) (checked).Driver_dDt.f_CheckedPackage_checkedProgram) norm) name) in (match miResult with
  | Base_dDiag.C_Check_ErrC (dtb__397) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__397)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__398) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__399 = Obj.obj (e) in (let dtb__400 = Obj.obj ((k (dtb__399 u))) in (dtb__400 u)))))) ((((((v_writeModuleIfaceGuarded nFs) nClock) nEnv) nProcess) ctx) dtb__398)) (fun _u -> (let x = (Base_dDiag.C_Check_OkC (dtb__398)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
))))))))

# 1921 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownInfoOf = (fun (nFs : string) (nEnv : string) (m : t_ClosureMod) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__401 = Obj.obj (e) in (let dtb__402 = Obj.obj ((k (dtb__401 u))) in (dtb__402 u)))))) ((Frontend_dPackages_dPkg.v_absolutePath nEnv) (m).f_ClosureMod_cmPath)) (fun abs -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__403 = Obj.obj (e) in (let dtb__404 = Obj.obj ((k (dtb__403 u))) in (dtb__404 u)))))) (((fun f e -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__405 = Obj.obj (e) in (f (dtb__405 u)))))) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime nFs) abs))) (fun mtime -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__406 = Obj.obj (e) in (let dtb__407 = Obj.obj ((k (dtb__406 u))) in (dtb__407 u)))))) (((fun f e -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__408 = Obj.obj (e) in (f (dtb__408 u)))))) (fun (o : int B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe 0) o))) ((B_dEffect_dFs.v_fsFileSize nFs) abs))) (fun size -> (let x = { B_dData_dPair.f_Pair_first = (m).f_ClosureMod_cmName; B_dData_dPair.f_Pair_second = { Driver_dIface.f_SourceInfo_siPath = abs; Driver_dIface.f_SourceInfo_siHash = (m).f_ClosureMod_cmSrc; Driver_dIface.f_SourceInfo_siMtime = mtime; Driver_dIface.f_SourceInfo_siSize = size } } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))))

# 1918 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownSourceInfos = (fun (nFs : string) (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> ((v_mapEff ((v_ownInfoOf nFs) nEnv)) ((v_selfModsOf ctx) mods)))

# 1931 "Vuna/Compiler/Driver/Compile.vuna"
let v_resyncCleanSources = (fun (sources : (string, Driver_dIface.t_SourceInfo) B_dData_dPair.t_Pair B_dData_dList.t_List) (clean : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (m : Driver_dIface.t_ModuleIface) -> (match ((B_dData_dList.v_lookupPair (Driver_dIface.v_miNameOf m)) sources) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__409) -> { Driver_dIface.f_ModuleIface_miName = (Driver_dIface.v_miNameOf m); Driver_dIface.f_ModuleIface_miPackage = (Driver_dIface.v_miPackageOf m); Driver_dIface.f_ModuleIface_miSource = dtb__409; Driver_dIface.f_ModuleIface_miIfaceHash = (Driver_dIface.v_miIfaceHashOf m); Driver_dIface.f_ModuleIface_miDepHashes = (Driver_dIface.v_miDepHashesOf m); Driver_dIface.f_ModuleIface_miImports = (Driver_dIface.v_miImportsOf m); Driver_dIface.f_ModuleIface_miImplicitImports = (Driver_dIface.v_miImplicitImportsOf m); Driver_dIface.f_ModuleIface_miExports = (Driver_dIface.v_miExportsOf m); Driver_dIface.f_ModuleIface_miFixities = (Driver_dIface.v_miFixitiesOf m); Driver_dIface.f_ModuleIface_miDecls = (Driver_dIface.v_miDeclsOf m); Driver_dIface.f_ModuleIface_miRecords = (Driver_dIface.v_miRecordsOf m); Driver_dIface.f_ModuleIface_miPrepared = (Driver_dIface.v_miPreparedOf m); Driver_dIface.f_ModuleIface_miCached = (Driver_dIface.v_miCachedOf m); Driver_dIface.f_ModuleIface_miDefLocs = (Driver_dIface.v_miDefLocsOf m) }
  | B_dData_dMaybe.C_Maybe_Nothing -> m
  | _ -> failwith "DT: impossible branch"
))) clean))

# 1947 "Vuna/Compiler/Driver/Compile.vuna"
let v_shadowAllowed = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__410) -> true
  | _ -> failwith "DT: impossible branch"
))

# 916 "Vuna/Compiler/Driver/Compile.vuna"
let v_shadowClosureMods = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (if ((Frontend_dPackages_dPkg.v_contextPackageName ctx) = "") then (let x = B_dData_dMaybe.C_Maybe_Nothing in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (if (B_dData_dBool.v_not (v_shadowAllowed ctx)) then (let x = B_dData_dMaybe.C_Maybe_Nothing in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__411 = Obj.obj (e) in (let dtb__412 = Obj.obj ((k (dtb__411 u))) in (dtb__412 u)))))) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (let x = (B_dData_dMaybe.C_Maybe_Just (mods)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))

# 1954 "Vuna/Compiler/Driver/Compile.vuna"
let v_nameExportedBy = (fun (names : string B_dData_dList.t_List) (m : t_ClosureMod) -> ((B_dData_dList.v_memName (m).f_ClosureMod_cmName) names))

# 1205 "Vuna/Compiler/Driver/Compile.vuna"
let v_exportedDepModsOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (p : string) (mods : t_ClosureMod B_dData_dList.t_List) -> (let inPkg = ((B_dData_dList.v_filter (v_pkgEq p)) mods) in (match ((v_rootExportsOf p) (Frontend_dPackages_dPkg.v_contextRoots ctx)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> inPkg
  | B_dData_dMaybe.C_Maybe_Just (dtb__413) -> ((B_dData_dList.v_filter (v_nameExportedBy dtb__413)) inPkg)
  | _ -> failwith "DT: impossible branch"
)))

# 1169 "Vuna/Compiler/Driver/Compile.vuna"
let v_probeRequired = (fun (nFs : string) (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (p : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__414 = Obj.obj (e) in (let dtb__415 = Obj.obj ((k (dtb__414 u))) in (dtb__415 u)))))) ((((v_probePairs nFs) nEnv) ctx) ((B_dData_dList.v_filter (v_pkgEq p)) mods))) (fun pairs -> (let present = ((B_dData_dList.v_map (fun (pair : (t_ClosureMod, Driver_dIface.t_ModuleIface) B_dData_dPair.t_Pair) -> (v_modNameOf (B_dData_dPair.v_firstOf pair)))) pairs) in (let required = ((B_dData_dList.v_map v_modNameOf) (((v_exportedDepModsOf ctx) p) mods)) in (let x = (if ((v_allNamesIn required) present) then (B_dData_dMaybe.C_Maybe_Just ((v_orderClosurePairs pairs))) else B_dData_dMaybe.C_Maybe_Nothing) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))

# 1963 "Vuna/Compiler/Driver/Compile.vuna"
let v_exportedOwnOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (own : t_ClosureMod B_dData_dList.t_List) -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Nothing -> own
  | B_dData_dMaybe.C_Maybe_Just (dtb__416) -> (match (Frontend_dPackages_dPkg.v_packageExports dtb__416) with
  | B_dData_dMaybe.C_Maybe_Nothing -> own
  | B_dData_dMaybe.C_Maybe_Just (dtb__417) -> ((B_dData_dList.v_filter (v_nameExportedBy dtb__417)) own)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1977 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceWriteEnabled = (fun (nEnv : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__418 = Obj.obj (e) in (let dtb__419 = Obj.obj ((k (dtb__418 u))) in (dtb__419 u)))))) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_IFACE_WRITE")) (fun v -> (let x = (v <> "0") in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 2081 "Vuna/Compiler/Driver/Compile.vuna"
let[@tail_mod_cons] rec v_missingNamesOf = (fun (mc0 : t_ClosureMod B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__420, dtb__421) -> (if ((B_dData_dList.v_memName (dtb__420).f_ClosureMod_cmName) mc1) then ((v_missingNamesOf dtb__421) mc1) else (B_dData_dList.C_List__x58__x58_ ((dtb__420).f_ClosureMod_cmName, ((v_missingNamesOf dtb__421) mc1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 2098 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_ifaceSelfCheckGo = (fun (mc0 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__422, dtb__423) -> (let h = (Driver_dIface.v_miIfaceHashOf dtb__422) in (let h2 = (Driver_dIface.v_hashOfIface dtb__422) in (let _u = (if (h = h2) then 0 else (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") (String.concat "" ["iface-hash-mismatch "; (Driver_dIface.v_miNameOf dtb__422); " stored="; h; " recomputed="; h2])) else 0)) in (let _u = (if (h = h2) then 0 else ((Base_dObs.v_obsCounter "vuna.counter.iface.hash.mismatch") 1)) in (if (h = h2) then (v_ifaceSelfCheckGo dtb__423) else false)))))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 2115 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_writeIfaceObjects = (fun (nFs : string) (nEnv : string) (nProcess : string) (mc0 : Frontend_dPackages_dPkg.t_PackageContext) (mc1 : t_ClosureMod B_dData_dList.t_List) (mc2 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__424, dtb__425) -> (match ((v_findClosureMod (Driver_dIface.v_miNameOf dtb__424)) mc1) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_writeIfaceObjects nFs) nEnv) nProcess) mc0) mc1) dtb__425)
  | B_dData_dMaybe.C_Maybe_Just (dtb__426) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__427 = Obj.obj (e) in (let dtb__428 = Obj.obj ((k (dtb__427 u))) in (dtb__428 u)))))) (((v_ownIfaceDirEff nFs) nEnv) mc0)) (fun dir -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__429 = Obj.obj (e) in (let dtb__430 = Obj.obj ((k (dtb__429 u))) in (dtb__430 u)))))) (((v_readIfaceInEff nFs) dir) (dtb__426).f_ClosureMod_cmAddr)) (fun prev -> (let mi2 = ((Driver_dIface.v_mergeDefLocsFrom prev) dtb__424) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__431 = Obj.obj (e) in (let dtb__432 = Obj.obj ((k (dtb__431 u))) in (dtb__432 u)))))) (((Base_dObs.v_obsSpanEff "vuna.cache.write") "vuna.cache") (((((Base_dStore.v_storeWriteIfChangedEff nFs) (Base_dStore.v_storeObjectTag "module-iface")) v_ifaceObjectCodec) (String.concat "" [dir; "/"; (dtb__426).f_ClosureMod_cmAddr])) (Driver_dIface.v_encModuleIface mi2)))) (fun bytes -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__433 = Obj.obj (e) in (let dtb__434 = Obj.obj ((k (dtb__433 u))) in (dtb__434 u)))))) ((((((v_writeIfaceObjects nFs) nEnv) nProcess) mc0) mc1) dtb__425)) (fun n -> (let x = (if (bytes > 0) then (n + 1) else n) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 2139 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceSelfTestRequested = (fun (nEnv : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__435 = Obj.obj (e) in (let dtb__436 = Obj.obj ((k (dtb__435 u))) in (dtb__436 u)))))) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_IFACE_SELFTEST")) (fun v -> (let x = (v = "1") in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 1882 "Vuna/Compiler/Driver/Compile.vuna"
let v_payloadSelfOk = (fun (nEnv : string) (m : Driver_dIface.t_ModuleIface) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__437 = Obj.obj (e) in (let dtb__438 = Obj.obj ((k (dtb__437 u))) in (dtb__438 u)))))) (v_ifaceSelfTestRequested nEnv)) (fun self -> (let x = (if self then ((Driver_dIface.v_hashOfIface m) = (Driver_dIface.v_miIfaceHashOf m)) else true) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 1500 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_cleanSelfOk = (fun (nFs : string) (nEnv : string) (mc0 : int) (mc1 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mc2 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__439, dtb__440) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__441 = Obj.obj (e) in (let dtb__442 = Obj.obj ((k (dtb__441 u))) in (dtb__442 u)))))) ((v_payloadSelfOk nEnv) dtb__439)) (fun selfOk -> (let _u = (if selfOk then 0 else (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("iface-reject=self-hash " ^ (Driver_dIface.v_miNameOf dtb__439))) else 0)) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__443 = Obj.obj (e) in (let dtb__444 = Obj.obj ((k (dtb__443 u))) in (dtb__444 u)))))) (((v_sourceFresh nFs) mc0) (Driver_dIface.v_miSourceOf dtb__439))) (fun fresh -> (let valid = (Driver_dCache.v_cachedProgramValid (Driver_dIface.v_miCachedOf dtb__439)) in (let missingDep = (Driver_dIface.v_hasMissingDep (Driver_dIface.v_miDepHashesOf dtb__439)) in (let ok = (if (if (if fresh then valid else false) then selfOk else false) then (B_dData_dBool.v_not missingDep) else false) in (let _u = (if selfOk then 0 else ((Base_dObs.v_obsCounter "vuna.tool.clean.reject.self") 1)) in (let _u = (if fresh then 0 else ((Base_dObs.v_obsCounter "vuna.tool.clean.reject.fresh") 1)) in (let _u = (if valid then 0 else ((Base_dObs.v_obsCounter "vuna.tool.clean.reject.cached") 1)) in (let _u = (if missingDep then ((Base_dObs.v_obsCounter "vuna.tool.clean.reject.missingdep") 1) else 0) in (((((v_cleanSelfOk nFs) nEnv) mc0) dtb__440) (if ok then (B_dData_dList.C_List__x58__x58_ (dtb__439, mc2)) else mc2))))))))))))))
  | B_dData_dList.C_List_Nil -> (let x = (B_dData_dList.v_reverse mc2) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 1494 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolCleanGo = (fun (nFs : string) (nEnv : string) (builtSec : int) (depTbl : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (cands : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanRev : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__445 = Obj.obj (e) in (let dtb__446 = Obj.obj ((k (dtb__445 u))) in (dtb__446 u)))))) (((((v_cleanSelfOk nFs) nEnv) builtSec) cands) B_dData_dList.C_List_Nil)) (fun ok -> (let x = ((((v_cleanFixpoint ((B_dData_dList.v_length ok) + 1)) depTbl) ok) cleanRev) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 1466 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolCleanOwnModules = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (tool : t_ToolContext) (builtSec : int) (exclude : string B_dData_dMaybe.t_Maybe) (needed : string B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__447 = Obj.obj (e) in (let dtb__448 = Obj.obj ((k (dtb__447 u))) in (dtb__448 u)))))) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (let cands = ((B_dData_dList.v_filter ((v_ownCleanWanted needed) exclude)) ((v_selfModsOf ctx) mods)) in (let _u = ((Base_dObs.v_obsCounter "vuna.tool.clean.cands") (B_dData_dList.v_length cands)) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__449 = Obj.obj (e) in (let dtb__450 = Obj.obj ((k (dtb__449 u))) in (dtb__450 u)))))) ((((v_readIfaceListPartialEff nFs) nEnv) ctx) cands)) (fun clean -> (let _u = ((Base_dObs.v_obsCounter "vuna.tool.clean.read") (B_dData_dList.v_length clean)) in ((((((v_toolCleanGo nFs) nEnv) builtSec) (tool).f_ToolContext_tcDepHashes) clean) B_dData_dList.C_List_Nil)))))))))

# 2092 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceSelfCheckEff = (fun (nEnv : string) (mods : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__451 = Obj.obj (e) in (let dtb__452 = Obj.obj ((k (dtb__451 u))) in (dtb__452 u)))))) (v_ifaceSelfTestRequested nEnv)) (fun self -> (let x = (if self then (v_ifaceSelfCheckGo mods) else true) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 1995 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeIfaceShadowGo = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : Driver_dDt.t_CheckedPackage) (pre : t_ClosureMod B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (clean : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (if ((Frontend_dPackages_dPkg.v_contextPackageName ctx) = "") then (let x = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (if (B_dData_dBool.v_not (v_shadowAllowed ctx)) then (let x = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__453 = Obj.obj (e) in (let dtb__454 = Obj.obj ((k (dtb__453 u))) in (dtb__454 u)))))) (((Frontend_dPackages_dState.v_ensurePkgStateDirEff nFs) nEnv) (Frontend_dPackages_dPkg.v_contextDir ctx))) (fun _u -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") "iface-shadow-start") else 0) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__455 = Obj.obj (e) in (let dtb__456 = Obj.obj ((k (dtb__455 u))) in (dtb__456 u)))))) (B_dEffect_dClock.v_clockNow nClock)) (fun t0 -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__457 = Obj.obj (e) in (let dtb__458 = Obj.obj ((k (dtb__457 u))) in (dtb__458 u)))))) (match pre with
  | B_dData_dMaybe.C_Maybe_Just (dtb__459) -> (let x = dtb__459 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)
  | _ -> failwith "DT: impossible branch"
)) (fun mods -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__460 = Obj.obj (e) in (let dtb__461 = Obj.obj ((k (dtb__460 u))) in (dtb__461 u)))))) (B_dEffect_dClock.v_clockNow nClock)) (fun t1 -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__462 = Obj.obj (e) in (let dtb__463 = Obj.obj ((k (dtb__462 u))) in (dtb__463 u)))))) ((((v_ownSourceInfos nFs) nEnv) ctx) mods)) (fun sources -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__464 = Obj.obj (e) in (let dtb__465 = Obj.obj ((k (dtb__464 u))) in (dtb__465 u)))))) (B_dEffect_dClock.v_clockNow nClock)) (fun t2 -> (let depTbl = ((B_dData_dList.v_map v_modHashPair) ((v_depModsOf ctx) mods)) in (let own = ((v_selfModsOf ctx) mods) in (let cleanNames = ((B_dData_dList.v_map Driver_dIface.v_miNameOf) clean) in (let required = ((v_exportedOwnOf ctx) own) in (match (((((((((Driver_dIface.v_ifaceOfPackage (Frontend_dPackages_dPkg.v_contextPackageName ctx)) sources) depTbl) (checked).Driver_dDt.f_CheckedPackage_checkedInherited) clean) (checked).Driver_dDt.f_CheckedPackage_checkedModules) (checked).Driver_dDt.f_CheckedPackage_checkedEntryDecls) (checked).Driver_dDt.f_CheckedPackage_checkedProgram) (v_ifaceLocNorm ctx)) with
  | Base_dDiag.C_Check_ErrC (dtb__466) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("iface-reject=compute iface-skip " ^ (Base_dDiag.v_diagText dtb__466))) else 0) in (let x = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))
  | Base_dDiag.C_Check_OkC (dtb__467) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__468 = Obj.obj (e) in (let dtb__469 = Obj.obj ((k (dtb__468 u))) in (dtb__469 u)))))) (B_dEffect_dClock.v_clockNow nClock)) (fun t3 -> (let unwritten = ((v_missingNamesOf required) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) dtb__467)) in (let toWrite = ((B_dData_dList.v_filter (fun (mi : Driver_dIface.t_ModuleIface) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf mi)) cleanNames)))) dtb__467) in (if ((B_dData_dList.v_length unwritten) > 0) then (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") (String.concat "" ["iface-skip partial closure="; (string_of_int (B_dData_dList.v_length own)); " required="; (string_of_int (B_dData_dList.v_length required)); " covered="; (string_of_int (B_dData_dList.v_length dtb__467)); " missing="; ((B_dData_dString.v_join ",") unwritten)])) else 0) in (let x = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__470 = Obj.obj (e) in (let dtb__471 = Obj.obj ((k (dtb__470 u))) in (dtb__471 u)))))) ((v_ifaceSelfCheckEff nEnv) toWrite)) (fun selfOk -> (if (B_dData_dBool.v_not selfOk) then (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("iface-selftest=skip-write " ^ (string_of_int (B_dData_dList.v_length toWrite)))) else 0) in (let x = (Base_dDiag.C_Check_OkC (dtb__467)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__472 = Obj.obj (e) in (let dtb__473 = Obj.obj ((k (dtb__472 u))) in (dtb__473 u)))))) (Base_dObs.v_obsMarkEff "vuna.iface.write")) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__474 = Obj.obj (e) in (let dtb__475 = Obj.obj ((k (dtb__474 u))) in (dtb__475 u)))))) ((((((v_writeIfaceObjects nFs) nEnv) nProcess) ctx) own) toWrite)) (fun n -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__476 = Obj.obj (e) in (let dtb__477 = Obj.obj ((k (dtb__476 u))) in (dtb__477 u)))))) (B_dEffect_dClock.v_clockNow nClock)) (fun t4 -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") (String.concat "" ["iface-write="; (string_of_int n); "/"; (string_of_int (B_dData_dList.v_length dtb__467)); " closure="; (string_of_int (B_dData_dList.v_length own)); " phases mods="; (string_of_int (if 1000 = 0 then failwith "division by zero" else (t1 - t0) / 1000)); "ms sources="; (string_of_int (if 1000 = 0 then failwith "division by zero" else (t2 - t1) / 1000)); "ms compute="; (string_of_int (if 1000 = 0 then failwith "division by zero" else (t3 - t2) / 1000)); "ms write="; (string_of_int (if 1000 = 0 then failwith "division by zero" else (t4 - t3) / 1000)); "ms"])) else 0) in (let x = (Base_dDiag.C_Check_OkC (dtb__467)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))))))))))))
  | _ -> failwith "DT: impossible branch"
)))))))))))))))))))))

# 1989 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeIfaceShadowWithClean = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : Driver_dDt.t_CheckedPackage) (pre : t_ClosureMod B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (clean : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__478 = Obj.obj (e) in (let dtb__479 = Obj.obj ((k (dtb__478 u))) in (dtb__479 u)))))) (v_ifaceWriteEnabled nEnv)) (fun enabled -> (if (B_dData_dBool.v_not enabled) then (let x = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else ((((((((v_writeIfaceShadowGo nFs) nClock) nEnv) nProcess) ctx) checked) pre) clean)))))

# 215 "Vuna/Compiler/Driver/Compile.vuna"
let v_rebuildSplit = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (inputs : t_SplitInputs) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__480 = Obj.obj (e) in (let dtb__481 = Obj.obj ((k (dtb__480 u))) in (dtb__481 u)))))) (((((v_ownCleanInfoWith nFs) nEnv) nProcess) ctx) (inputs).f_SplitInputs_siClosure)) (fun cleanR -> (let clean = (match cleanR with
  | B_dData_dMaybe.C_Maybe_Just (dtb__494) -> dtb__494
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__482 = Obj.obj (e) in (let dtb__483 = Obj.obj ((k (dtb__482 u))) in (dtb__483 u)))))) (((((((((v_summarySplitParts nFs) nConsole) nClock) nEnv) nProcess) ctx) (inputs).f_SplitInputs_siDepIfaces) entry) printResult)) (fun summary -> (match summary with
  | Base_dDiag.C_Check_ErrC (dtb__484) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__484)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__485) -> (let canon = (Driver_dSplit.v_canonicalTopo (B_dData_dPair.v_firstOf dtb__485)) in (let checked = (B_dData_dPair.v_secondOf dtb__485) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__486 = Obj.obj (e) in (let dtb__487 = Obj.obj ((k (dtb__486 u))) in (dtb__487 u)))))) ((((((((v_writeIfaceShadowWithClean nFs) nClock) nEnv) nProcess) ctx) checked) (B_dData_dMaybe.C_Maybe_Just ((inputs).f_SplitInputs_siClosure))) clean)) (fun shadow -> (match shadow with
  | Base_dDiag.C_Check_ErrC (dtb__488) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__488)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__489) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__490 = Obj.obj (e) in (let dtb__491 = Obj.obj ((k (dtb__490 u))) in (dtb__491 u)))))) ((((((v_writeCompiledNormalized nFs) nEnv) nProcess) ctx) outDir) canon)) (fun n -> (let x = (match n with
  | Base_dDiag.C_Check_ErrC (dtb__492) -> (Base_dDiag.C_Check_ErrC (dtb__492))
  | Base_dDiag.C_Check_OkC (dtb__493) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__493; B_dData_dPair.f_Pair_second = (checked).Driver_dDt.f_CheckedPackage_checkedWarnings }))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))))))

# 211 "Vuna/Compiler/Driver/Compile.vuna"
let v_compileToDirNormal = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (inputs : t_SplitInputs) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) -> ((((((((((v_rebuildSplit nFs) nConsole) nClock) nEnv) nProcess) inputs) ctx) entry) printResult) outDir))

# 1985 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeIfaceShadowWith = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : Driver_dDt.t_CheckedPackage) (pre : t_ClosureMod B_dData_dList.t_List B_dData_dMaybe.t_Maybe) -> ((((((((v_writeIfaceShadowWithClean nFs) nClock) nEnv) nProcess) ctx) checked) pre) B_dData_dList.C_List_Nil))

# 249 "Vuna/Compiler/Driver/Compile.vuna"
let v_auditCompile = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (inputs : t_SplitInputs) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__495 = Obj.obj (e) in (let dtb__496 = Obj.obj ((k (dtb__495 u))) in (dtb__496 u)))))) (((((((((v_summarySplitParts nFs) nConsole) nClock) nEnv) nProcess) ctx) (inputs).f_SplitInputs_siDepIfaces) entry) printResult)) (fun summary -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__497 = Obj.obj (e) in (let dtb__498 = Obj.obj ((k (dtb__497 u))) in (dtb__498 u)))))) (((((((Driver_dDt.v_dtSplitProjectParts nFs) nConsole) nEnv) nProcess) ctx) entry) printResult)) (fun full -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") ("iface-audit subject=compile entry=" ^ entry)) else 0) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__499 = Obj.obj (e) in (let dtb__500 = Obj.obj ((k (dtb__499 u))) in (dtb__500 u)))))) (let x = ((((v_auditCompare "compile") entry) (v_splitSignatureOf summary)) (v_splitSignatureOf full)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))) (fun compared -> (match compared with
  | Base_dDiag.C_Check_ErrC (dtb__501) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__501)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__502) -> (match summary with
  | Base_dDiag.C_Check_ErrC (dtb__503) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__503)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__504) -> (let files = (B_dData_dPair.v_firstOf dtb__504) in (let checked = (B_dData_dPair.v_secondOf dtb__504) in (let canon = (Driver_dSplit.v_canonicalTopo files) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__505 = Obj.obj (e) in (let dtb__506 = Obj.obj ((k (dtb__505 u))) in (dtb__506 u)))))) (((((((v_writeIfaceShadowWith nFs) nClock) nEnv) nProcess) ctx) checked) (B_dData_dMaybe.C_Maybe_Just ((inputs).f_SplitInputs_siClosure)))) (fun shadow -> (match shadow with
  | Base_dDiag.C_Check_ErrC (dtb__507) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__507)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__508) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__509 = Obj.obj (e) in (let dtb__510 = Obj.obj ((k (dtb__509 u))) in (dtb__510 u)))))) ((((((v_writeCompiledNormalized nFs) nEnv) nProcess) ctx) outDir) canon)) (fun n -> (let x = (match n with
  | Base_dDiag.C_Check_ErrC (dtb__511) -> (Base_dDiag.C_Check_ErrC (dtb__511))
  | Base_dDiag.C_Check_OkC (dtb__512) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__512; B_dData_dPair.f_Pair_second = (checked).Driver_dDt.f_CheckedPackage_checkedWarnings }))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

# 180 "Vuna/Compiler/Driver/Compile.vuna"
let v_compileToDirGiven = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (inputs : t_SplitInputs) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__513 = Obj.obj (e) in (let dtb__514 = Obj.obj ((k (dtb__513 u))) in (dtb__514 u)))))) (v_ifaceAuditRequested nEnv)) (fun audit -> (if audit then ((((((((((v_auditCompile nFs) nConsole) nClock) nEnv) nProcess) inputs) ctx) entry) printResult) outDir) else ((((((((((v_compileToDirNormal nFs) nConsole) nClock) nEnv) nProcess) inputs) ctx) entry) printResult) outDir)))))

# 1972 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeIfaceShadow = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : Driver_dDt.t_CheckedPackage) -> (((((((v_writeIfaceShadowWith nFs) nClock) nEnv) nProcess) ctx) checked) B_dData_dMaybe.C_Maybe_Nothing))

# 2149 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkAndShadowWith = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (pre : t_ClosureMod B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (checked : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, Driver_dDt.t_CheckedPackage) B_dData_dPair.t_Pair Base_dDiag.t_Check B_dEffect_dCore.t_Eff) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__515 = Obj.obj (e) in (let dtb__516 = Obj.obj ((k (dtb__515 u))) in (dtb__516 u)))))) checked) (fun checkedR -> (match checkedR with
  | Base_dDiag.C_Check_ErrC (dtb__517) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__517)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__518) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__519 = Obj.obj (e) in (let dtb__520 = Obj.obj ((k (dtb__519 u))) in (dtb__520 u)))))) (((((((v_writeIfaceShadowWith nFs) nClock) nEnv) nProcess) ctx) (B_dData_dPair.v_secondOf dtb__518)) pre)) (fun shadow -> (match shadow with
  | Base_dDiag.C_Check_ErrC (dtb__521) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__521)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__522) -> (let x = (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__518); B_dData_dPair.f_Pair_second = dtb__522 })) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

# 1658 "Vuna/Compiler/Driver/Compile.vuna"
let v_fullCheckExe = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "cache-path=full") else 0) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__523 = Obj.obj (e) in (let dtb__524 = Obj.obj ((k (dtb__523 u))) in (dtb__524 u)))))) (((((v_shadowClosureMods nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) mods) (((((Driver_dDt.v_dtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry))))))

# 2146 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkAndShadow = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, Driver_dDt.t_CheckedPackage) B_dData_dPair.t_Pair Base_dDiag.t_Check B_dEffect_dCore.t_Eff) -> (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) B_dData_dMaybe.C_Maybe_Nothing) checked))

# 2210 "Vuna/Compiler/Driver/Compile.vuna"
let v_fullCheckLib = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "cache-path=full") else 0) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__525 = Obj.obj (e) in (let dtb__526 = Obj.obj ((k (dtb__525 u))) in (dtb__526 u)))))) (((((v_shadowClosureMods nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) mods) (((((Driver_dDt.v_dtCheckLibraryWithProgramParts nFs) nEnv) nProcess) ctx) names))))))

# 94 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_checkPackageAt = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (fuel : int) (release : bool) (wantWarnings : bool) (pkg : Frontend_dPackages_dPkg.t_Package) -> (let ctx = ((Frontend_dPackages_dPkg.v_contextWithRelease release) (Frontend_dPackages_dPkg.v_packageContext pkg)) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__527 = Obj.obj (e) in (let dtb__528 = Obj.obj ((k (dtb__527 u))) in (dtb__528 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) (Frontend_dPackages_dPkg.v_packageEntry pkg))) (fun exists -> (if exists then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__529 = Obj.obj (e) in (let dtb__530 = Obj.obj ((k (dtb__529 u))) in (dtb__530 u)))))) ((((((((v_checkUncachedExeAt nFs) nClock) nEnv) nProcess) fuel) wantWarnings) ctx) (Frontend_dPackages_dPkg.v_packageEntry pkg))) (fun exeR -> (let nd_uscrut16 = exeR in (match nd_uscrut16 with
  | Base_dDiag.C_Check_OkC (dtb__531) -> (match dtb__531 with
  | { B_dData_dPair.f_Pair_first = dtb__532; B_dData_dPair.f_Pair_second = dtb__533 } -> (match (Frontend_dPackages_dPkg.v_packageExports pkg) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let x = (Base_dDiag.C_Check_OkC (dtb__532)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__534) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__535 = Obj.obj (e) in (let dtb__536 = Obj.obj ((k (dtb__535 u))) in (dtb__536 u)))))) (v_elabFullRequested nEnv)) (fun full -> (let covered = ((v_allNamesIn dtb__534) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) dtb__533)) in (if (if (B_dData_dBool.v_not full) then covered else false) then (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("check-lib-skip covered=" ^ (string_of_int (B_dData_dList.v_length dtb__534)))) else 0) in (let x = (Base_dDiag.C_Check_OkC (dtb__532)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__537 = Obj.obj (e) in (let dtb__538 = Obj.obj ((k (dtb__537 u))) in (dtb__538 u)))))) ((((((((v_checkUncachedLibAt nFs) nClock) nEnv) nProcess) fuel) false) ctx) dtb__534)) (fun libR -> (let nd_uscrut28 = libR in (match nd_uscrut28 with
  | Base_dDiag.C_Check_OkC (dtb__539) -> (match dtb__539 with
  | { B_dData_dPair.f_Pair_first = dtb__540; B_dData_dPair.f_Pair_second = dtb__541 } -> (let x = (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append dtb__532) dtb__540))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__542) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__542)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__543) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__543)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
)))) else (match (Frontend_dPackages_dPkg.v_packageExports pkg) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let x = ((((Base_dDiagnostics_dPkg.v_pkgAt1 ((Frontend_dPackages_dPkg.v_packageDir pkg) ^ "/vuna.toml")) 1) (Base_dDiagnostics_dPkg.C_PkgErr_LibraryWithoutEntry ((Frontend_dPackages_dPkg.v_packageName pkg)))) (Frontend_dPackages_dPkg.v_packageName pkg)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__544) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__545 = Obj.obj (e) in (let dtb__546 = Obj.obj ((k (dtb__545 u))) in (dtb__546 u)))))) ((((((((v_checkUncachedLibAt nFs) nClock) nEnv) nProcess) fuel) wantWarnings) ctx) dtb__544)) (fun libR -> (let nd_uscrut18 = libR in (match nd_uscrut18 with
  | Base_dDiag.C_Check_OkC (dtb__547) -> (match dtb__547 with
  | { B_dData_dPair.f_Pair_first = dtb__548; B_dData_dPair.f_Pair_second = dtb__549 } -> (let x = (Base_dDiag.C_Check_OkC (dtb__548)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__550) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__550)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))))
# 1072 "Vuna/Compiler/Driver/Compile.vuna"
and v_depIfacesOfWithAt = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (fuel : int) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let x = B_dData_dMaybe.C_Maybe_Nothing in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__551) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__552 = Obj.obj (e) in (let dtb__553 = Obj.obj ((k (dtb__552 u))) in (dtb__553 u)))))) (((((((v_depIfacePairsEffAt nFs) nClock) nEnv) nProcess) fuel) ctx) mods)) (fun pairs -> (match pairs with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "iface-reject=dep-iface-missing") else 0) in (let x = B_dData_dMaybe.C_Maybe_Nothing in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__554) -> (let x = (B_dData_dMaybe.C_Maybe_Just (((B_dData_dList.v_map B_dData_dPair.v_secondOf) dtb__554))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))
# 1140 "Vuna/Compiler/Driver/Compile.vuna"
and v_buildDepEffAt = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (fuel : int) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (p : string) -> (if (fuel <= 0) then (let x = false in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (match ((v_findDepPackage p) (v_depPackageList ctx)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let x = false in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__555) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("dep-build=" ^ p)) else 0) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__556 = Obj.obj (e) in (let dtb__557 = Obj.obj ((k (dtb__556 u))) in (dtb__557 u)))))) (Base_dObs.v_obsMarkEff "vuna.iface.dep-build")) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__558 = Obj.obj (e) in (let dtb__559 = Obj.obj ((k (dtb__558 u))) in (dtb__559 u)))))) ((((((((v_checkPackageAt nFs) nClock) nEnv) nProcess) (fuel - 1)) false) false) dtb__555)) (fun r -> (let x = (match r with
  | Base_dDiag.C_Check_OkC (dtb__560) -> true
  | Base_dDiag.C_Check_ErrC (dtb__561) -> false
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 1158 "Vuna/Compiler/Driver/Compile.vuna"
and v_depPairsOfPkgAt = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (fuel : int) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (p : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__562 = Obj.obj (e) in (let dtb__563 = Obj.obj ((k (dtb__562 u))) in (dtb__563 u)))))) (((((v_probeRequired nFs) nEnv) ctx) mods) p)) (fun attempt -> (match attempt with
  | B_dData_dMaybe.C_Maybe_Just (dtb__564) -> (let x = (B_dData_dMaybe.C_Maybe_Just (dtb__564)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__565 = Obj.obj (e) in (let dtb__566 = Obj.obj ((k (dtb__565 u))) in (dtb__566 u)))))) (((((((v_buildDepEffAt nFs) nClock) nEnv) nProcess) fuel) ctx) p)) (fun built -> (if built then (((((v_probeRequired nFs) nEnv) ctx) mods) p) else (let x = B_dData_dMaybe.C_Maybe_Nothing in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))
  | _ -> failwith "DT: impossible branch"
))))
# 1178 "Vuna/Compiler/Driver/Compile.vuna"
and v_goPkgsAt = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (mc0 : int) (mc1 : Frontend_dPackages_dPkg.t_PackageContext) (mc2 : t_ClosureMod B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) (mc4 : (t_ClosureMod, Driver_dIface.t_ModuleIface) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__567, dtb__568) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__569 = Obj.obj (e) in (let dtb__570 = Obj.obj ((k (dtb__569 u))) in (dtb__570 u)))))) ((((((((v_depPairsOfPkgAt nFs) nClock) nEnv) nProcess) mc0) mc1) mc2) dtb__567)) (fun pairs -> (match pairs with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let x = B_dData_dMaybe.C_Maybe_Nothing in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__571) -> (((((((((v_goPkgsAt nFs) nClock) nEnv) nProcess) mc0) mc1) mc2) dtb__568) ((B_dData_dList.v_append mc4) dtb__571))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (if (v_duplicatePairNames mc4) then (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "iface-reject=dep-module-duplicate") else 0) in (let x = B_dData_dMaybe.C_Maybe_Nothing in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))) else (let x = (B_dData_dMaybe.C_Maybe_Just (mc4)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))
  | _ -> failwith "DT: impossible branch"
))
# 1219 "Vuna/Compiler/Driver/Compile.vuna"
and v_depIfacePairsEffAt = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (fuel : int) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> (((((((((v_goPkgsAt nFs) nClock) nEnv) nProcess) fuel) ctx) mods) ((v_distinctPkgs ((v_depModsOf ctx) mods)) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil))
# 1607 "Vuna/Compiler/Driver/Compile.vuna"
and v_checkUncachedExeAt = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (fuel : int) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__572 = Obj.obj (e) in (let dtb__573 = Obj.obj ((k (dtb__572 u))) in (dtb__573 u)))))) (v_elabFullRequested nEnv)) (fun full -> (if full then ((((((v_fullCheckExe nFs) nClock) nEnv) nProcess) ctx) entry) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__574 = Obj.obj (e) in (let dtb__575 = Obj.obj ((k (dtb__574 u))) in (dtb__575 u)))))) (((((v_summaryClosureMods nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__576 = Obj.obj (e) in (let dtb__577 = Obj.obj ((k (dtb__576 u))) in (dtb__577 u)))))) (v_ifaceAuditRequested nEnv)) (fun audit -> (if audit then (((((((((v_auditCheckExeAt nFs) nClock) nEnv) nProcess) fuel) wantWarnings) ctx) mods) entry) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__578 = Obj.obj (e) in (let dtb__579 = Obj.obj ((k (dtb__578 u))) in (dtb__579 u)))))) (((((((((v_summaryCheckExePartsAt nFs) nClock) nEnv) nProcess) fuel) wantWarnings) ctx) mods) entry)) (fun summary -> (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) (B_dData_dMaybe.C_Maybe_Just (mods))) (let x = summary in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))))))))))
# 1626 "Vuna/Compiler/Driver/Compile.vuna"
and v_summaryCheckExePartsAt = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (fuel : int) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (entry : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__580 = Obj.obj (e) in (let dtb__581 = Obj.obj ((k (dtb__580 u))) in (dtb__581 u)))))) (((((((v_depIfacesOfWithAt nFs) nClock) nEnv) nProcess) fuel) ctx) mods)) (fun depIfaces -> (match depIfaces with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "cache-path=full") else 0) in (((((Driver_dDt.v_dtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry))
  | B_dData_dMaybe.C_Maybe_Just (dtb__582) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__583 = Obj.obj (e) in (let dtb__584 = Obj.obj ((k (dtb__583 u))) in (dtb__584 u)))))) (((((v_ownCleanModulesWith nFs) nEnv) nProcess) ctx) mods)) (fun clean -> (match clean with
  | B_dData_dMaybe.C_Maybe_Just (dtb__585) -> (let cleanReal = (if wantWarnings then B_dData_dList.C_List_Nil else dtb__585) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-path=summary deps=" ^ (string_of_int (v_depPackageCount ctx)))) else 0) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-own-clean=" ^ (string_of_int (B_dData_dList.v_length cleanReal)))) else 0) in (((((((Driver_dDt.v_dtCheckPackageIncrementalParts nFs) nEnv) nProcess) ctx) entry) dtb__582) cleanReal))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-path=summary deps=" ^ (string_of_int (v_depPackageCount ctx)))) else 0) in ((((((Driver_dDt.v_dtCheckPackageWithIfacesParts nFs) nEnv) nProcess) ctx) entry) dtb__582))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
# 1668 "Vuna/Compiler/Driver/Compile.vuna"
and v_auditCheckExeAt = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (fuel : int) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (entry : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__586 = Obj.obj (e) in (let dtb__587 = Obj.obj ((k (dtb__586 u))) in (dtb__587 u)))))) (((((((((v_summaryCheckExePartsAt nFs) nClock) nEnv) nProcess) fuel) wantWarnings) ctx) mods) entry)) (fun summary -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__588 = Obj.obj (e) in (let dtb__589 = Obj.obj ((k (dtb__588 u))) in (dtb__589 u)))))) (((((Driver_dDt.v_dtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry)) (fun full -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") ("iface-audit subject=check entry=" ^ entry)) else 0) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__590 = Obj.obj (e) in (let dtb__591 = Obj.obj ((k (dtb__590 u))) in (dtb__591 u)))))) (let x = ((((v_auditCompare "check") entry) (v_checkSignatureOf summary)) (v_checkSignatureOf full)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))) (fun compared -> (match compared with
  | Base_dDiag.C_Check_ErrC (dtb__592) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__592)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__593) -> (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) (B_dData_dMaybe.C_Maybe_Just (mods))) (let x = summary in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))
  | _ -> failwith "DT: impossible branch"
)))))))))
# 2162 "Vuna/Compiler/Driver/Compile.vuna"
and v_checkUncachedLibAt = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (fuel : int) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__594 = Obj.obj (e) in (let dtb__595 = Obj.obj ((k (dtb__594 u))) in (dtb__595 u)))))) (v_elabFullRequested nEnv)) (fun full -> (if full then ((((((v_fullCheckLib nFs) nClock) nEnv) nProcess) ctx) names) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__596 = Obj.obj (e) in (let dtb__597 = Obj.obj ((k (dtb__596 u))) in (dtb__597 u)))))) (((((v_summaryClosureMods nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__598 = Obj.obj (e) in (let dtb__599 = Obj.obj ((k (dtb__598 u))) in (dtb__599 u)))))) (v_ifaceAuditRequested nEnv)) (fun audit -> (if audit then (((((((((v_auditCheckLibAt nFs) nClock) nEnv) nProcess) fuel) wantWarnings) ctx) mods) names) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__600 = Obj.obj (e) in (let dtb__601 = Obj.obj ((k (dtb__600 u))) in (dtb__601 u)))))) (((((((((v_summaryCheckLibPartsAt nFs) nClock) nEnv) nProcess) fuel) wantWarnings) ctx) mods) names)) (fun summary -> (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) (B_dData_dMaybe.C_Maybe_Just (mods))) (let x = summary in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))))))))))
# 2179 "Vuna/Compiler/Driver/Compile.vuna"
and v_summaryCheckLibPartsAt = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (fuel : int) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (names : string B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__602 = Obj.obj (e) in (let dtb__603 = Obj.obj ((k (dtb__602 u))) in (dtb__603 u)))))) (((((((v_depIfacesOfWithAt nFs) nClock) nEnv) nProcess) fuel) ctx) mods)) (fun depIfaces -> (match depIfaces with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "cache-path=full") else 0) in (((((Driver_dDt.v_dtCheckLibraryWithProgramParts nFs) nEnv) nProcess) ctx) names))
  | B_dData_dMaybe.C_Maybe_Just (dtb__604) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__605 = Obj.obj (e) in (let dtb__606 = Obj.obj ((k (dtb__605 u))) in (dtb__606 u)))))) (((((v_ownCleanModulesWith nFs) nEnv) nProcess) ctx) mods)) (fun clean -> (match clean with
  | B_dData_dMaybe.C_Maybe_Just (dtb__607) -> (let cleanReal = (if wantWarnings then B_dData_dList.C_List_Nil else dtb__607) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-path=summary deps=" ^ (string_of_int (v_depPackageCount ctx)))) else 0) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-own-clean=" ^ (string_of_int (B_dData_dList.v_length cleanReal)))) else 0) in (((((((Driver_dDt.v_dtCheckLibraryPackageIncrementalParts nFs) nEnv) nProcess) ctx) names) dtb__604) cleanReal))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-path=summary deps=" ^ (string_of_int (v_depPackageCount ctx)))) else 0) in ((((((Driver_dDt.v_dtCheckLibraryPackageWithIfacesParts nFs) nEnv) nProcess) ctx) names) dtb__604))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
# 2218 "Vuna/Compiler/Driver/Compile.vuna"
and v_auditCheckLibAt = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (fuel : int) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (names : string B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__608 = Obj.obj (e) in (let dtb__609 = Obj.obj ((k (dtb__608 u))) in (dtb__609 u)))))) (((((((((v_summaryCheckLibPartsAt nFs) nClock) nEnv) nProcess) fuel) wantWarnings) ctx) mods) names)) (fun summary -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__610 = Obj.obj (e) in (let dtb__611 = Obj.obj ((k (dtb__610 u))) in (dtb__611 u)))))) (((((Driver_dDt.v_dtCheckLibraryWithProgramParts nFs) nEnv) nProcess) ctx) names)) (fun full -> (let subject = (v_joinLines names) in (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") ("iface-audit subject=check-lib entry=" ^ subject)) else 0) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__612 = Obj.obj (e) in (let dtb__613 = Obj.obj ((k (dtb__612 u))) in (dtb__613 u)))))) (let x = ((((v_auditCompare "check-lib") subject) (v_checkSignatureOf summary)) (v_checkSignatureOf full)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))) (fun compared -> (match compared with
  | Base_dDiag.C_Check_ErrC (dtb__614) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__614)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__615) -> ((((((v_checkAndShadow nFs) nClock) nEnv) nProcess) ctx) (let x = summary in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))
  | _ -> failwith "DT: impossible branch"
))))))))))

# 90 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkPackage = (fun nFs nClock nEnv nProcess -> (((((v_checkPackageAt nFs) nClock) nEnv) nProcess) 64))

# 1069 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesOfWith = (fun nFs nClock nEnv nProcess -> (((((v_depIfacesOfWithAt nFs) nClock) nEnv) nProcess) 64))

# 1061 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesOf = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__616 = Obj.obj (e) in (let dtb__617 = Obj.obj ((k (dtb__616 u))) in (dtb__617 u)))))) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun mods -> ((((((v_depIfacesOfWith nFs) nClock) nEnv) nProcess) ctx) mods))))

# 1224 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForCheck = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((((v_depIfacesOf nFs) nClock) nEnv) nProcess) ctx))

# 1322 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForTool = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__618 = Obj.obj (e) in (let dtb__619 = Obj.obj ((k (dtb__618 u))) in (dtb__619 u)))))) (v_toolEnabled nEnv)) (fun enabled -> (if enabled then (((((v_depIfacesOf nFs) nClock) nEnv) nProcess) ctx) else (let x = B_dData_dMaybe.C_Maybe_Nothing in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))

# 2237 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitInputsOf = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__620 = Obj.obj (e) in (let dtb__621 = Obj.obj ((k (dtb__620 u))) in (dtb__621 u)))))) (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) (fun closure -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__622 = Obj.obj (e) in (let dtb__623 = Obj.obj ((k (dtb__622 u))) in (dtb__623 u)))))) ((((((v_depIfacesOfWith nFs) nClock) nEnv) nProcess) ctx) closure)) (fun depIfaces -> (let x = { f_SplitInputs_siClosure = closure; f_SplitInputs_siDepIfaces = depIfaces } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))

# 172 "Vuna/Compiler/Driver/Compile.vuna"
let v_compileToDir = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__624 = Obj.obj (e) in (let dtb__625 = Obj.obj ((k (dtb__624 u))) in (dtb__625 u)))))) (((((v_splitInputsOf nFs) nClock) nEnv) nProcess) ctx)) (fun inputs -> ((((((((((v_compileToDirGiven nFs) nConsole) nClock) nEnv) nProcess) inputs) ctx) entry) printResult) outDir))))

# 351 "Vuna/Compiler/Driver/Compile.vuna"
let v_buildSplit = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (dir : string) (outDir : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__626 = Obj.obj (e) in (let dtb__627 = Obj.obj ((k (dtb__626 u))) in (dtb__627 u)))))) (((Frontend_dPackages_dPkg.v_loadPackage nFs) nEnv) dir)) (fun pkgR -> (match pkgR with
  | Base_dDiag.C_Check_ErrC (dtb__628) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__628)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__629) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__630 = Obj.obj (e) in (let dtb__631 = Obj.obj ((k (dtb__630 u))) in (dtb__631 u)))))) (((((((((v_compileToDir nFs) nConsole) nClock) nEnv) nProcess) (Frontend_dPackages_dPkg.v_packageContext dtb__629)) (Frontend_dPackages_dPkg.v_packageEntry dtb__629)) true) outDir)) (fun r -> (let x = (match r with
  | Base_dDiag.C_Check_ErrC (dtb__632) -> (Base_dDiag.C_Check_ErrC (dtb__632))
  | Base_dDiag.C_Check_OkC (dtb__633) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb__633)))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
))))

# 706 "Vuna/Compiler/Driver/Compile.vuna"
let v_peName = (fun (p : t_PkgEntry) -> (match p with
  | { f_PkgEntry_peName = dtb__634; f_PkgEntry_peDir = dtb__635; f_PkgEntry_peKey = dtb__636; f_PkgEntry_peEnv = dtb__637; f_PkgEntry_peImplicitPrelude = dtb__638 } -> dtb__634
  | _ -> failwith "DT: impossible branch"
))

# 707 "Vuna/Compiler/Driver/Compile.vuna"
let v_peDir = (fun (p : t_PkgEntry) -> (match p with
  | { f_PkgEntry_peName = dtb__639; f_PkgEntry_peDir = dtb__640; f_PkgEntry_peKey = dtb__641; f_PkgEntry_peEnv = dtb__642; f_PkgEntry_peImplicitPrelude = dtb__643 } -> dtb__640
  | _ -> failwith "DT: impossible branch"
))

# 708 "Vuna/Compiler/Driver/Compile.vuna"
let v_peKey = (fun (p : t_PkgEntry) -> (match p with
  | { f_PkgEntry_peName = dtb__644; f_PkgEntry_peDir = dtb__645; f_PkgEntry_peKey = dtb__646; f_PkgEntry_peEnv = dtb__647; f_PkgEntry_peImplicitPrelude = dtb__648 } -> dtb__646
  | _ -> failwith "DT: impossible branch"
))

# 709 "Vuna/Compiler/Driver/Compile.vuna"
let v_peEnv = (fun (p : t_PkgEntry) -> (match p with
  | { f_PkgEntry_peName = dtb__649; f_PkgEntry_peDir = dtb__650; f_PkgEntry_peKey = dtb__651; f_PkgEntry_peEnv = dtb__652; f_PkgEntry_peImplicitPrelude = dtb__653 } -> dtb__652
  | _ -> failwith "DT: impossible branch"
))

# 710 "Vuna/Compiler/Driver/Compile.vuna"
let v_peImplicitPrelude = (fun (p : t_PkgEntry) -> (match p with
  | { f_PkgEntry_peName = dtb__654; f_PkgEntry_peDir = dtb__655; f_PkgEntry_peKey = dtb__656; f_PkgEntry_peEnv = dtb__657; f_PkgEntry_peImplicitPrelude = dtb__658 } -> dtb__658
  | _ -> failwith "DT: impossible branch"
))

# 713 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmPkg = (fun (p : t_ClosureMod) -> (match p with
  | { f_ClosureMod_cmPkg = dtb__659; f_ClosureMod_cmPkgKey = dtb__660; f_ClosureMod_cmPkgEnv = dtb__661; f_ClosureMod_cmName = dtb__662; f_ClosureMod_cmPath = dtb__663; f_ClosureMod_cmSrc = dtb__664; f_ClosureMod_cmImports = dtb__665; f_ClosureMod_cmAddr = dtb__666 } -> dtb__659
  | _ -> failwith "DT: impossible branch"
))

# 714 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmPkgKey = (fun (p : t_ClosureMod) -> (match p with
  | { f_ClosureMod_cmPkg = dtb__667; f_ClosureMod_cmPkgKey = dtb__668; f_ClosureMod_cmPkgEnv = dtb__669; f_ClosureMod_cmName = dtb__670; f_ClosureMod_cmPath = dtb__671; f_ClosureMod_cmSrc = dtb__672; f_ClosureMod_cmImports = dtb__673; f_ClosureMod_cmAddr = dtb__674 } -> dtb__668
  | _ -> failwith "DT: impossible branch"
))

# 715 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmPkgEnv = (fun (p : t_ClosureMod) -> (match p with
  | { f_ClosureMod_cmPkg = dtb__675; f_ClosureMod_cmPkgKey = dtb__676; f_ClosureMod_cmPkgEnv = dtb__677; f_ClosureMod_cmName = dtb__678; f_ClosureMod_cmPath = dtb__679; f_ClosureMod_cmSrc = dtb__680; f_ClosureMod_cmImports = dtb__681; f_ClosureMod_cmAddr = dtb__682 } -> dtb__677
  | _ -> failwith "DT: impossible branch"
))

# 716 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmName = (fun (p : t_ClosureMod) -> (match p with
  | { f_ClosureMod_cmPkg = dtb__683; f_ClosureMod_cmPkgKey = dtb__684; f_ClosureMod_cmPkgEnv = dtb__685; f_ClosureMod_cmName = dtb__686; f_ClosureMod_cmPath = dtb__687; f_ClosureMod_cmSrc = dtb__688; f_ClosureMod_cmImports = dtb__689; f_ClosureMod_cmAddr = dtb__690 } -> dtb__686
  | _ -> failwith "DT: impossible branch"
))

# 717 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmPath = (fun (p : t_ClosureMod) -> (match p with
  | { f_ClosureMod_cmPkg = dtb__691; f_ClosureMod_cmPkgKey = dtb__692; f_ClosureMod_cmPkgEnv = dtb__693; f_ClosureMod_cmName = dtb__694; f_ClosureMod_cmPath = dtb__695; f_ClosureMod_cmSrc = dtb__696; f_ClosureMod_cmImports = dtb__697; f_ClosureMod_cmAddr = dtb__698 } -> dtb__695
  | _ -> failwith "DT: impossible branch"
))

# 718 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmSrc = (fun (p : t_ClosureMod) -> (match p with
  | { f_ClosureMod_cmPkg = dtb__699; f_ClosureMod_cmPkgKey = dtb__700; f_ClosureMod_cmPkgEnv = dtb__701; f_ClosureMod_cmName = dtb__702; f_ClosureMod_cmPath = dtb__703; f_ClosureMod_cmSrc = dtb__704; f_ClosureMod_cmImports = dtb__705; f_ClosureMod_cmAddr = dtb__706 } -> dtb__704
  | _ -> failwith "DT: impossible branch"
))

# 719 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmImports = (fun (p : t_ClosureMod) -> (match p with
  | { f_ClosureMod_cmPkg = dtb__707; f_ClosureMod_cmPkgKey = dtb__708; f_ClosureMod_cmPkgEnv = dtb__709; f_ClosureMod_cmName = dtb__710; f_ClosureMod_cmPath = dtb__711; f_ClosureMod_cmSrc = dtb__712; f_ClosureMod_cmImports = dtb__713; f_ClosureMod_cmAddr = dtb__714 } -> dtb__713
  | _ -> failwith "DT: impossible branch"
))

# 720 "Vuna/Compiler/Driver/Compile.vuna"
let v_cmAddr = (fun (p : t_ClosureMod) -> (match p with
  | { f_ClosureMod_cmPkg = dtb__715; f_ClosureMod_cmPkgKey = dtb__716; f_ClosureMod_cmPkgEnv = dtb__717; f_ClosureMod_cmName = dtb__718; f_ClosureMod_cmPath = dtb__719; f_ClosureMod_cmSrc = dtb__720; f_ClosureMod_cmImports = dtb__721; f_ClosureMod_cmAddr = dtb__722 } -> dtb__722
  | _ -> failwith "DT: impossible branch"
))

# 1353 "Vuna/Compiler/Driver/Compile.vuna"
let v_tcDepIfaces = (fun (p : t_ToolContext) -> (match p with
  | { f_ToolContext_tcDepIfaces = dtb__723; f_ToolContext_tcDepHashes = dtb__724; f_ToolContext_tcNeeded = dtb__725; f_ToolContext_tcOwnNames = dtb__726; f_ToolContext_tcStats = dtb__727 } -> dtb__723
  | _ -> failwith "DT: impossible branch"
))

# 1354 "Vuna/Compiler/Driver/Compile.vuna"
let v_tcDepHashes = (fun (p : t_ToolContext) -> (match p with
  | { f_ToolContext_tcDepIfaces = dtb__728; f_ToolContext_tcDepHashes = dtb__729; f_ToolContext_tcNeeded = dtb__730; f_ToolContext_tcOwnNames = dtb__731; f_ToolContext_tcStats = dtb__732 } -> dtb__729
  | _ -> failwith "DT: impossible branch"
))

# 1355 "Vuna/Compiler/Driver/Compile.vuna"
let v_tcNeeded = (fun (p : t_ToolContext) -> (match p with
  | { f_ToolContext_tcDepIfaces = dtb__733; f_ToolContext_tcDepHashes = dtb__734; f_ToolContext_tcNeeded = dtb__735; f_ToolContext_tcOwnNames = dtb__736; f_ToolContext_tcStats = dtb__737 } -> dtb__735
  | _ -> failwith "DT: impossible branch"
))

# 1358 "Vuna/Compiler/Driver/Compile.vuna"
let v_tcOwnNames = (fun (p : t_ToolContext) -> (match p with
  | { f_ToolContext_tcDepIfaces = dtb__738; f_ToolContext_tcDepHashes = dtb__739; f_ToolContext_tcNeeded = dtb__740; f_ToolContext_tcOwnNames = dtb__741; f_ToolContext_tcStats = dtb__742 } -> dtb__741
  | _ -> failwith "DT: impossible branch"
))

# 1359 "Vuna/Compiler/Driver/Compile.vuna"
let v_tcStats = (fun (p : t_ToolContext) -> (match p with
  | { f_ToolContext_tcDepIfaces = dtb__743; f_ToolContext_tcDepHashes = dtb__744; f_ToolContext_tcNeeded = dtb__745; f_ToolContext_tcOwnNames = dtb__746; f_ToolContext_tcStats = dtb__747 } -> dtb__747
  | _ -> failwith "DT: impossible branch"
))

# 2233 "Vuna/Compiler/Driver/Compile.vuna"
let v_siClosure = (fun (p : t_SplitInputs) -> (match p with
  | { f_SplitInputs_siClosure = dtb__748; f_SplitInputs_siDepIfaces = dtb__749 } -> dtb__748
  | _ -> failwith "DT: impossible branch"
))

# 2234 "Vuna/Compiler/Driver/Compile.vuna"
let v_siDepIfaces = (fun (p : t_SplitInputs) -> (match p with
  | { f_SplitInputs_siClosure = dtb__750; f_SplitInputs_siDepIfaces = dtb__751 } -> dtb__751
  | _ -> failwith "DT: impossible branch"
))
