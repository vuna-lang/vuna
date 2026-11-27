open Vuna_runtime
type t_PkgEntry = { f_PkgEntry_peName : string; f_PkgEntry_peDir : string; f_PkgEntry_peKey : string; f_PkgEntry_peEnv : string; f_PkgEntry_peImplicitPrelude : bool }
and t_ClosureMod = { f_ClosureMod_cmPkg : string; f_ClosureMod_cmPkgKey : string; f_ClosureMod_cmPkgEnv : string; f_ClosureMod_cmName : string; f_ClosureMod_cmPath : string; f_ClosureMod_cmSrc : string; f_ClosureMod_cmImports : string B_dData_dList.t_List; f_ClosureMod_cmAddr : string }
and t_ToolContext = { f_ToolContext_tcDepIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List; f_ToolContext_tcDepHashes : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_ToolContext_tcNeeded : string B_dData_dList.t_List; f_ToolContext_tcOwnNames : string B_dData_dList.t_List; f_ToolContext_tcStats : Driver_dIface.t_SourceInfo B_dData_dList.t_List }
and t_SplitInputs = { f_SplitInputs_siClosure : t_ClosureMod B_dData_dList.t_List; f_SplitInputs_siDepIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List B_dData_dMaybe.t_Maybe }

# 59 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_mapEff = (fun dtb_u_u4 dtb_u_u5 -> (match dtb_u_u5 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u6, dtb_u_u7) -> (Obj.repr ((fun (dtb_u_u12 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u13 = Obj.obj ((dtb_u_u4 dtb_u_u6)) in (let dtb_u_u15 = (dtb_u_u13 dtb_u_u12) in (let dtb_u_u23 = (((v_mapEff_u_udirect dtb_u_u4) dtb_u_u7) dtb_u_u12) in (let dtb_u_u25 = (B_dData_dList.C_List__x58__x58_ (dtb_u_u15, dtb_u_u23)) in dtb_u_u25)))))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u28 = B_dData_dList.C_List_Nil in (Obj.repr ((fun (dtb_u_u29 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u28))))
  | _ -> failwith "DT: impossible branch"
))
# 59 "Vuna/Compiler/Driver/Compile.vuna"
and v_mapEff_u_udirect = (fun mc0 mc1 _u_ueffTok -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u6, dtb_u_u7) -> (let dtb_u_u13 = Obj.obj ((mc0 dtb_u_u6)) in (let dtb_u_u15 = (dtb_u_u13 _u_ueffTok) in (let dtb_u_u23 = (((v_mapEff_u_udirect mc0) dtb_u_u7) _u_ueffTok) in (let dtb_u_u25 = (B_dData_dList.C_List__x58__x58_ (dtb_u_u15, dtb_u_u23)) in dtb_u_u25))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u28 = B_dData_dList.C_List_Nil in dtb_u_u28)
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_concatMapEff = (fun dtb_u_u33 dtb_u_u34 -> (match dtb_u_u34 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u35, dtb_u_u36) -> (Obj.repr ((fun (dtb_u_u41 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u42 = Obj.obj ((dtb_u_u33 dtb_u_u35)) in (let dtb_u_u44 = (dtb_u_u42 dtb_u_u41) in (let dtb_u_u52 = (((v_concatMapEff_u_udirect dtb_u_u33) dtb_u_u36) dtb_u_u41) in (let dtb_u_u54 = ((B_dData_dList.v_append dtb_u_u44) dtb_u_u52) in dtb_u_u54)))))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u57 = B_dData_dList.C_List_Nil in (Obj.repr ((fun (dtb_u_u58 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u57))))
  | _ -> failwith "DT: impossible branch"
))
# 67 "Vuna/Compiler/Driver/Compile.vuna"
and v_concatMapEff_u_udirect = (fun mc0 mc1 _u_ueffTok -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u35, dtb_u_u36) -> (let dtb_u_u42 = Obj.obj ((mc0 dtb_u_u35)) in (let dtb_u_u44 = (dtb_u_u42 _u_ueffTok) in (let dtb_u_u52 = (((v_concatMapEff_u_udirect mc0) dtb_u_u36) _u_ueffTok) in (let dtb_u_u54 = ((B_dData_dList.v_append dtb_u_u44) dtb_u_u52) in dtb_u_u54))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u57 = B_dData_dList.C_List_Nil in dtb_u_u57)
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_mapMaybeEff = (fun dtb_u_u62 dtb_u_u63 -> (match dtb_u_u63 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u64, dtb_u_u65) -> (Obj.repr ((fun (dtb_u_u70 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u71 = Obj.obj ((dtb_u_u62 dtb_u_u64)) in (let dtb_u_u73 = (dtb_u_u71 dtb_u_u70) in (let dtb_u_u81 = (((v_mapMaybeEff_u_udirect dtb_u_u62) dtb_u_u65) dtb_u_u70) in (let dtb_u_u83 = (match dtb_u_u73 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u85) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u85, dtb_u_u81))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u81
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u83)))))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u87 = B_dData_dList.C_List_Nil in (Obj.repr ((fun (dtb_u_u88 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u87))))
  | _ -> failwith "DT: impossible branch"
))
# 75 "Vuna/Compiler/Driver/Compile.vuna"
and v_mapMaybeEff_u_udirect = (fun mc0 mc1 _u_ueffTok -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u64, dtb_u_u65) -> (let dtb_u_u71 = Obj.obj ((mc0 dtb_u_u64)) in (let dtb_u_u73 = (dtb_u_u71 _u_ueffTok) in (let dtb_u_u81 = (((v_mapMaybeEff_u_udirect mc0) dtb_u_u65) _u_ueffTok) in (let dtb_u_u83 = (match dtb_u_u73 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u85) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u85, dtb_u_u81))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u81
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u83))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u87 = B_dData_dList.C_List_Nil in dtb_u_u87)
  | _ -> failwith "DT: impossible branch"
))

# 151 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_ensureDirPathFuel = (fun (dtb_u_u89 : string) (dtb_u_u90 : string) (dtb_u_u94 : int) (dtb_u_u95 : string) -> (if (dtb_u_u94 <= 0) then (let dtb_u_u97 = 0 in (Obj.repr ((fun (dtb_u_u98 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u97)))) else (if (if (if (dtb_u_u95 = "") then true else (dtb_u_u95 = ".")) then true else (dtb_u_u95 = "/")) then (let dtb_u_u100 = 0 in (Obj.repr ((fun (dtb_u_u101 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u100)))) else (Obj.repr ((fun (dtb_u_u106 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u109 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u89) dtb_u_u95) dtb_u_u106) in (if dtb_u_u109 then (let dtb_u_u111 = 0 in dtb_u_u111) else (let dtb_u_u120 = (((((v_ensureDirPathFuel_u_udirect dtb_u_u89) dtb_u_u90) (dtb_u_u94 - 1)) (Base_dSource.v_parentOfPath dtb_u_u95)) dtb_u_u106) in ((Obj.magic ((B_dEffect_dFs.v_fsMakeDir dtb_u_u89) dtb_u_u95)) dtb_u_u106))))))))))
# 151 "Vuna/Compiler/Driver/Compile.vuna"
and v_ensureDirPathFuel_u_udirect = (fun (nFs : string) (nProcess : string) (fuel : int) (path : string) _u_ueffTok -> (if (fuel <= 0) then (let dtb_u_u97 = 0 in dtb_u_u97) else (if (if (if (path = "") then true else (path = ".")) then true else (path = "/")) then (let dtb_u_u100 = 0 in dtb_u_u100) else (let dtb_u_u109 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) path) _u_ueffTok) in (if dtb_u_u109 then (let dtb_u_u111 = 0 in dtb_u_u111) else (let dtb_u_u120 = (((((v_ensureDirPathFuel_u_udirect nFs) nProcess) (fuel - 1)) (Base_dSource.v_parentOfPath path)) _u_ueffTok) in ((Obj.magic ((B_dEffect_dFs.v_fsMakeDir nFs) path)) _u_ueffTok)))))))

# 148 "Vuna/Compiler/Driver/Compile.vuna"
let v_ensureDirPath = (fun (nFs : string) (nProcess : string) (path : string) -> ((((v_ensureDirPathFuel nFs) nProcess) 256) path))

# 148 "Vuna/Compiler/Driver/Compile.vuna"
let v_ensureDirPath_u_udirect = (fun (nFs : string) (nProcess : string) (path : string) _u_ueffTok -> ((Obj.magic ((((v_ensureDirPathFuel nFs) nProcess) 256) path)) _u_ueffTok))

# 190 "Vuna/Compiler/Driver/Compile.vuna"
let v_modHashPair = (fun (m : t_ClosureMod) -> { B_dData_dPair.f_Pair_first = (m).f_ClosureMod_cmName; B_dData_dPair.f_Pair_second = (m).f_ClosureMod_cmAddr })

# 203 "Vuna/Compiler/Driver/Compile.vuna"
let v_summarySplitParts = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (mc0 : Frontend_dPackages_dPkg.t_PackageContext) (mc1 : Driver_dIface.t_ModuleIface B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (mc2 : string) (mc3 : bool) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((Driver_dDt.v_dtSplitProjectParts nFs) nConsole) nEnv) nProcess) mc0) mc2) mc3)
  | B_dData_dMaybe.C_Maybe_Just (dtb__23) -> ((((((((Driver_dDt.v_dtSplitProjectWithIfaces nFs) nConsole) nEnv) nProcess) mc0) mc2) mc3) dtb__23)
  | _ -> failwith "DT: impossible branch"
))

# 203 "Vuna/Compiler/Driver/Compile.vuna"
let v_summarySplitParts_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (mc0 : Frontend_dPackages_dPkg.t_PackageContext) (mc1 : Driver_dIface.t_ModuleIface B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (mc2 : string) (mc3 : bool) _u_ueffTok -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic (((((((Driver_dDt.v_dtSplitProjectParts nFs) nConsole) nEnv) nProcess) mc0) mc2) mc3)) _u_ueffTok)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u143) -> ((Obj.magic ((((((((Driver_dDt.v_dtSplitProjectWithIfaces nFs) nConsole) nEnv) nProcess) mc0) mc2) mc3) dtb_u_u143)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))

# 283 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeFileIfChanged = (fun (dtb_u_u144 : string) (dtb_u_u147 : string) (dtb_u_u148 : string) -> (Obj.repr ((fun (dtb_u_u153 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u156 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u144) dtb_u_u147) dtb_u_u153) in (if dtb_u_u156 then (let dtb_u_u164 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u144) dtb_u_u147) dtb_u_u153) in (if (dtb_u_u164 = dtb_u_u148) then (let dtb_u_u166 = 0 in dtb_u_u166) else ((Obj.magic (((B_dEffect_dFs.v_fsWriteFile dtb_u_u144) dtb_u_u147) dtb_u_u148)) dtb_u_u153))) else ((Obj.magic (((B_dEffect_dFs.v_fsWriteFile dtb_u_u144) dtb_u_u147) dtb_u_u148)) dtb_u_u153)))))))

# 283 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeFileIfChanged_u_udirect = (fun (nFs : string) (path : string) (content : string) _u_ueffTok -> (let dtb_u_u156 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) path) _u_ueffTok) in (if dtb_u_u156 then (let dtb_u_u164 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) path) _u_ueffTok) in (if (dtb_u_u164 = content) then (let dtb_u_u166 = 0 in dtb_u_u166) else ((Obj.magic (((B_dEffect_dFs.v_fsWriteFile nFs) path) content)) _u_ueffTok))) else ((Obj.magic (((B_dEffect_dFs.v_fsWriteFile nFs) path) content)) _u_ueffTok))))

# 324 "Vuna/Compiler/Driver/Compile.vuna"
let v_copyFfiFiles = (fun (dtb_u_u168 : string) (dtb_u_u169 : string) (dtb_u_u173 : string) (dtb_u_u174 : string) -> (let dtb_u_u175 = (dtb_u_u173 ^ "/ffi") in (Obj.repr ((fun (dtb_u_u180 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u183 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u168) dtb_u_u175) dtb_u_u180) in (let dtb_u_u189 = Obj.obj ((if dtb_u_u183 then ((B_dEffect_dFs.v_fsIsDirectory dtb_u_u168) dtb_u_u175) else (let dtb_u_u192 = false in (Obj.repr ((fun (dtb_u_u193 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u192)))))) in (let dtb_u_u194 = (dtb_u_u189 dtb_u_u180) in (if (if dtb_u_u183 then dtb_u_u194 else false) then (let dtb_u_u202 = (((B_dEffect_dFs.v_fsReadDir_u_udirect dtb_u_u168) dtb_u_u175) dtb_u_u180) in (let dtb_u_u203 = ((B_dData_dList.v_filter (fun (dtb_u_u233 : string) -> ((B_dData_dString.v_endsWith ".c") dtb_u_u233))) dtb_u_u202) in (let dtb_u_u211 = ((((v_ensureDirPath_u_udirect dtb_u_u168) dtb_u_u169) (dtb_u_u174 ^ "/ffi")) dtb_u_u180) in (let dtb_u_u228 = (((v_mapEff_u_udirect (fun (dtb_u_u219 : string) -> (Obj.repr ((fun (dtb_u_u224 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u227 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u168) (String.concat "" [dtb_u_u175; "/"; ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) dtb_u_u219)])) dtb_u_u224) in ((Obj.magic (((B_dEffect_dFs.v_fsWriteFile dtb_u_u168) (String.concat "" [dtb_u_u174; "/ffi/"; ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) dtb_u_u219)])) dtb_u_u227)) dtb_u_u224))))))) dtb_u_u203) dtb_u_u180) in (let dtb_u_u230 = ((B_dData_dList.v_map (fun (dtb_u_u232 : string) -> ("ffi/" ^ ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) dtb_u_u232)))) dtb_u_u203) in dtb_u_u230))))) else (let dtb_u_u235 = B_dData_dList.C_List_Nil in dtb_u_u235))))))))))

# 324 "Vuna/Compiler/Driver/Compile.vuna"
let v_copyFfiFiles_u_udirect = (fun (nFs : string) (nProcess : string) (ctxDir : string) (outDir : string) _u_ueffTok -> (let dtb_u_u175 = (ctxDir ^ "/ffi") in (let dtb_u_u183 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) dtb_u_u175) _u_ueffTok) in (let dtb_u_u189 = Obj.obj ((if dtb_u_u183 then ((B_dEffect_dFs.v_fsIsDirectory nFs) dtb_u_u175) else (let dtb_u_u192 = false in (Obj.repr ((fun (dtb_u_u193 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u192)))))) in (let dtb_u_u194 = (dtb_u_u189 _u_ueffTok) in (if (if dtb_u_u183 then dtb_u_u194 else false) then (let dtb_u_u202 = (((B_dEffect_dFs.v_fsReadDir_u_udirect nFs) dtb_u_u175) _u_ueffTok) in (let dtb_u_u203 = ((B_dData_dList.v_filter (fun (dtb_u_u233 : string) -> ((B_dData_dString.v_endsWith ".c") dtb_u_u233))) dtb_u_u202) in (let dtb_u_u211 = ((((v_ensureDirPath_u_udirect nFs) nProcess) (outDir ^ "/ffi")) _u_ueffTok) in (let dtb_u_u228 = (((v_mapEff_u_udirect (fun (dtb_u_u219 : string) -> (Obj.repr ((fun (dtb_u_u224 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u227 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) (String.concat "" [dtb_u_u175; "/"; ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) dtb_u_u219)])) dtb_u_u224) in ((Obj.magic (((B_dEffect_dFs.v_fsWriteFile nFs) (String.concat "" [outDir; "/ffi/"; ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) dtb_u_u219)])) dtb_u_u227)) dtb_u_u224))))))) dtb_u_u203) _u_ueffTok) in (let dtb_u_u230 = ((B_dData_dList.v_map (fun (dtb_u_u232 : string) -> ("ffi/" ^ ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) dtb_u_u232)))) dtb_u_u203) in dtb_u_u230))))) else (let dtb_u_u235 = B_dData_dList.C_List_Nil in dtb_u_u235)))))))

# 374 "Vuna/Compiler/Driver/Compile.vuna"
let v_metaSchema = 2

# 377 "Vuna/Compiler/Driver/Compile.vuna"
let v_metaFileName = "build-meta.json"

# 381 "Vuna/Compiler/Driver/Compile.vuna"
let v_textHash = (fun (s : string) -> (Base_dHash.v_contentKey s))

# 387 "Vuna/Compiler/Driver/Compile.vuna"
let v_compilerFingerprint = (fun (nFs : string) (nEnv : string) -> ((Loader_dFingerprint.v_compilerFingerprintEff nFs) nEnv))

# 387 "Vuna/Compiler/Driver/Compile.vuna"
let v_compilerFingerprint_u_udirect = (fun (nFs : string) (nEnv : string) _u_ueffTok -> ((Obj.magic ((Loader_dFingerprint.v_compilerFingerprintEff nFs) nEnv)) _u_ueffTok))

# 392 "Vuna/Compiler/Driver/Compile.vuna"
let v_cacheBase = (fun (nFs : string) (nEnv : string) (nProcess : string) -> (((Base_dStore.v_storeRootReadyEff nFs) nEnv) nProcess))

# 392 "Vuna/Compiler/Driver/Compile.vuna"
let v_cacheBase_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) _u_ueffTok -> ((Obj.magic (((Base_dStore.v_storeRootReadyEff nFs) nEnv) nProcess)) _u_ueffTok))

# 397 "Vuna/Compiler/Driver/Compile.vuna"
let v_collectVunaMeta = (fun (nFs : string) (dir : string) -> ((((Base_dWalk.v_collectFilesEff nFs) Frontend_dPackages_dSource.v_skipSourceDir) (fun (name : string) -> ((B_dData_dString.v_endsWith ".vuna") name))) dir))

# 397 "Vuna/Compiler/Driver/Compile.vuna"
let v_collectVunaMeta_u_udirect = (fun (nFs : string) (dir : string) _u_ueffTok -> ((Obj.magic ((((Base_dWalk.v_collectFilesEff nFs) Frontend_dPackages_dSource.v_skipSourceDir) (fun (dtb_u_u254 : string) -> ((B_dData_dString.v_endsWith ".vuna") dtb_u_u254))) dir)) _u_ueffTok))

# 400 "Vuna/Compiler/Driver/Compile.vuna"
let v_dropPrefixMeta = (fun (prefix : string) (s : string) -> (if ((B_dData_dString.v_startsWith prefix) s) then (((B_dData_dString.v_substring (B_dData_dString.v_byteLength prefix)) (bi_natSub (B_dData_dString.v_byteLength s) (B_dData_dString.v_byteLength prefix))) s) else s))

# 410 "Vuna/Compiler/Driver/Compile.vuna"
let v_slashToDot = (fun (c : int) -> (if (c = 47) then 46 else c))

# 407 "Vuna/Compiler/Driver/Compile.vuna"
let v_slashesToDots = (fun (s : string) -> (B_dData_dList.dtp_pack ((B_dData_dList.v_map v_slashToDot) (B_dData_dList.dtp_unpack s))))

# 413 "Vuna/Compiler/Driver/Compile.vuna"
let v_moduleNameOfPath = (fun (rootPath : string) (path : string) -> (let rel0 = ((v_dropPrefixMeta (rootPath ^ "/")) path) in (let rel = (if ((B_dData_dString.v_endsWith ".vuna") rel0) then (((B_dData_dString.v_substring 0) (bi_natSub (B_dData_dString.v_byteLength rel0) 5)) rel0) else rel0) in (v_slashesToDots rel))))

# 421 "Vuna/Compiler/Driver/Compile.vuna"
let v_rootSources = (fun (dtb_u_u263 : string) (dtb_u_u266 : Frontend_dPackages_dPkg.t_Root) -> (Obj.repr ((fun (dtb_u_u271 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u274 = (((v_collectVunaMeta_u_udirect dtb_u_u263) (Frontend_dPackages_dPkg.v_rootDir dtb_u_u266)) dtb_u_u271) in (let dtb_u_u294 = (((v_mapEff_u_udirect (fun (dtb_u_u282 : string) -> (Obj.repr ((fun (dtb_u_u287 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u290 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u263) dtb_u_u282) dtb_u_u287) in (let dtb_u_u292 = { B_dData_dPair.f_Pair_first = ((v_moduleNameOfPath (Frontend_dPackages_dPkg.v_rootDir dtb_u_u266)) dtb_u_u282); B_dData_dPair.f_Pair_second = (v_textHash dtb_u_u290) } in dtb_u_u292))))))) dtb_u_u274) dtb_u_u271) in (let dtb_u_u296 = ((B_dData_dSort.v_sortBy (fun (dtb_u_u298 : (string, int) B_dData_dPair.t_Pair) (dtb_u_u299 : (string, int) B_dData_dPair.t_Pair) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_u5afb3bbeddafcb50_uString) (B_dData_dPair.v_firstOf dtb_u_u298)) (B_dData_dPair.v_firstOf dtb_u_u299)))) dtb_u_u294) in dtb_u_u296)))))))

# 421 "Vuna/Compiler/Driver/Compile.vuna"
let v_rootSources_u_udirect = (fun (nFs : string) (root : Frontend_dPackages_dPkg.t_Root) _u_ueffTok -> (let dtb_u_u274 = (((v_collectVunaMeta_u_udirect nFs) (Frontend_dPackages_dPkg.v_rootDir root)) _u_ueffTok) in (let dtb_u_u294 = (((v_mapEff_u_udirect (fun (dtb_u_u282 : string) -> (Obj.repr ((fun (dtb_u_u287 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u290 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) dtb_u_u282) dtb_u_u287) in (let dtb_u_u292 = { B_dData_dPair.f_Pair_first = ((v_moduleNameOfPath (Frontend_dPackages_dPkg.v_rootDir root)) dtb_u_u282); B_dData_dPair.f_Pair_second = (v_textHash dtb_u_u290) } in dtb_u_u292))))))) dtb_u_u274) _u_ueffTok) in (let dtb_u_u296 = ((B_dData_dSort.v_sortBy (fun (dtb_u_u298 : (string, int) B_dData_dPair.t_Pair) (dtb_u_u299 : (string, int) B_dData_dPair.t_Pair) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_u5afb3bbeddafcb50_uString) (B_dData_dPair.v_firstOf dtb_u_u298)) (B_dData_dPair.v_firstOf dtb_u_u299)))) dtb_u_u294) in dtb_u_u296))))

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
let v_rootHash = (fun (dtb_u_u306 : string) (dtb_u_u309 : Frontend_dPackages_dPkg.t_Root) -> (Obj.repr ((fun (dtb_u_u314 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u317 = (((v_rootSources_u_udirect dtb_u_u306) dtb_u_u309) dtb_u_u314) in (let dtb_u_u319 = ((v_closureHashOf dtb_u_u317) 0) in dtb_u_u319))))))

# 434 "Vuna/Compiler/Driver/Compile.vuna"
let v_rootHash_u_udirect = (fun (nFs : string) (root : Frontend_dPackages_dPkg.t_Root) _u_ueffTok -> (let dtb_u_u317 = (((v_rootSources_u_udirect nFs) root) _u_ueffTok) in (let dtb_u_u319 = ((v_closureHashOf dtb_u_u317) 0) in dtb_u_u319)))

# 445 "Vuna/Compiler/Driver/Compile.vuna"
let v_entrySource = (fun (dtb_u_u321 : string) (dtb_u_u324 : string) -> (Obj.repr ((fun (dtb_u_u329 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u332 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u321) dtb_u_u324) dtb_u_u329) in (let dtb_u_u334 = { B_dData_dPair.f_Pair_first = "<entry>"; B_dData_dPair.f_Pair_second = (v_textHash dtb_u_u332) } in dtb_u_u334))))))

# 445 "Vuna/Compiler/Driver/Compile.vuna"
let v_entrySource_u_udirect = (fun (nFs : string) (entry : string) _u_ueffTok -> (let dtb_u_u332 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) entry) _u_ueffTok) in (let dtb_u_u334 = { B_dData_dPair.f_Pair_first = "<entry>"; B_dData_dPair.f_Pair_second = (v_textHash dtb_u_u332) } in dtb_u_u334)))

# 452 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownRootsOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> ((B_dData_dList.v_filter (fun (r : Frontend_dPackages_dPkg.t_Root) -> ((Frontend_dPackages_dPkg.v_rootName r) = (Frontend_dPackages_dPkg.v_contextPackageName ctx)))) (Frontend_dPackages_dPkg.v_contextRoots ctx)))

# 455 "Vuna/Compiler/Driver/Compile.vuna"
let v_contextSources = (fun (dtb_u_u338 : string) (dtb_u_u341 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u342 : string) -> (Obj.repr ((fun (dtb_u_u347 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u350 = (((v_concatMapEff_u_udirect (v_rootSources dtb_u_u338)) (v_ownRootsOf dtb_u_u341)) dtb_u_u347) in (let dtb_u_u358 = (((v_entrySource_u_udirect dtb_u_u338) dtb_u_u342) dtb_u_u347) in (let dtb_u_u360 = ((B_dData_dList.v_append dtb_u_u350) (B_dData_dList.C_List__x58__x58_ (dtb_u_u358, B_dData_dList.C_List_Nil))) in dtb_u_u360)))))))

# 455 "Vuna/Compiler/Driver/Compile.vuna"
let v_contextSources_u_udirect = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) _u_ueffTok -> (let dtb_u_u350 = (((v_concatMapEff_u_udirect (v_rootSources nFs)) (v_ownRootsOf ctx)) _u_ueffTok) in (let dtb_u_u358 = (((v_entrySource_u_udirect nFs) entry) _u_ueffTok) in (let dtb_u_u360 = ((B_dData_dList.v_append dtb_u_u350) (B_dData_dList.C_List__x58__x58_ (dtb_u_u358, B_dData_dList.C_List_Nil))) in dtb_u_u360))))

# 463 "Vuna/Compiler/Driver/Compile.vuna"
let v_dependencyHashes = (fun (dtb_u_u362 : string) (dtb_u_u365 : Frontend_dPackages_dPkg.t_PackageContext) -> (match (Frontend_dPackages_dPkg.v_contextRoots dtb_u_u365) with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u367 = B_dData_dList.C_List_Nil in (Obj.repr ((fun (dtb_u_u368 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u367))))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u369, dtb_u_u370) -> (Obj.repr ((fun (dtb_u_u375 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u390 = (((v_mapEff_u_udirect (fun (dtb_u_u378 : Frontend_dPackages_dPkg.t_Root) -> (Obj.repr ((fun (dtb_u_u383 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u386 = (((v_rootHash_u_udirect dtb_u_u362) dtb_u_u378) dtb_u_u383) in (let dtb_u_u388 = { B_dData_dPair.f_Pair_first = (Frontend_dPackages_dPkg.v_rootName dtb_u_u378); B_dData_dPair.f_Pair_second = dtb_u_u386 } in dtb_u_u388))))))) dtb_u_u370) dtb_u_u375) in (let dtb_u_u392 = ((B_dData_dSort.v_sortBy (fun (dtb_u_u394 : (string, int) B_dData_dPair.t_Pair) (dtb_u_u395 : (string, int) B_dData_dPair.t_Pair) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_u5afb3bbeddafcb50_uString) (B_dData_dPair.v_firstOf dtb_u_u394)) (B_dData_dPair.v_firstOf dtb_u_u395)))) dtb_u_u390) in dtb_u_u392)))))
  | _ -> failwith "DT: impossible branch"
))

# 463 "Vuna/Compiler/Driver/Compile.vuna"
let v_dependencyHashes_u_udirect = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) _u_ueffTok -> (match (Frontend_dPackages_dPkg.v_contextRoots ctx) with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u367 = B_dData_dList.C_List_Nil in dtb_u_u367)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u369, dtb_u_u370) -> (let dtb_u_u390 = (((v_mapEff_u_udirect (fun (dtb_u_u378 : Frontend_dPackages_dPkg.t_Root) -> (Obj.repr ((fun (dtb_u_u383 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u386 = (((v_rootHash_u_udirect nFs) dtb_u_u378) dtb_u_u383) in (let dtb_u_u388 = { B_dData_dPair.f_Pair_first = (Frontend_dPackages_dPkg.v_rootName dtb_u_u378); B_dData_dPair.f_Pair_second = dtb_u_u386 } in dtb_u_u388))))))) dtb_u_u370) _u_ueffTok) in (let dtb_u_u392 = ((B_dData_dSort.v_sortBy (fun (dtb_u_u394 : (string, int) B_dData_dPair.t_Pair) (dtb_u_u395 : (string, int) B_dData_dPair.t_Pair) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_u5afb3bbeddafcb50_uString) (B_dData_dPair.v_firstOf dtb_u_u394)) (B_dData_dPair.v_firstOf dtb_u_u395)))) dtb_u_u390) in dtb_u_u392))
  | _ -> failwith "DT: impossible branch"
))

# 485 "Vuna/Compiler/Driver/Compile.vuna"
let v_compilerClosureModule = "Vuna.Compiler.Loader.Fingerprint"

# 511 "Vuna/Compiler/Driver/Compile.vuna"
let v_manifestIdentityOf = (fun (dtb_u_u396 : string) (dtb_u_u399 : Frontend_dPackages_dPkg.t_Root) (dtb_u_u400 : int) -> (let dtb_u_u401 = ((Frontend_dPackages_dPkg.v_rootDir dtb_u_u399) ^ "/vuna.toml") in (Obj.repr ((fun (dtb_u_u406 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u409 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u396) dtb_u_u401) dtb_u_u406) in (let dtb_u_u415 = Obj.obj ((if dtb_u_u409 then ((B_dEffect_dFs.v_fsReadFile dtb_u_u396) dtb_u_u401) else (let dtb_u_u418 = "" in (Obj.repr ((fun (dtb_u_u419 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u418)))))) in (let dtb_u_u420 = (dtb_u_u415 dtb_u_u406) in (let dtb_u_u422 = { B_dData_dPair.f_Pair_first = (Frontend_dPackages_dPkg.v_rootName dtb_u_u399); B_dData_dPair.f_Pair_second = (String.concat "" ["manifest:"; (string_of_int (v_textHash dtb_u_u420)); ":"; (string_of_int dtb_u_u400)]) } in dtb_u_u422)))))))))

# 511 "Vuna/Compiler/Driver/Compile.vuna"
let v_manifestIdentityOf_u_udirect = (fun (nFs : string) (root : Frontend_dPackages_dPkg.t_Root) (h : int) _u_ueffTok -> (let dtb_u_u401 = ((Frontend_dPackages_dPkg.v_rootDir root) ^ "/vuna.toml") in (let dtb_u_u409 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) dtb_u_u401) _u_ueffTok) in (let dtb_u_u415 = Obj.obj ((if dtb_u_u409 then ((B_dEffect_dFs.v_fsReadFile nFs) dtb_u_u401) else (let dtb_u_u418 = "" in (Obj.repr ((fun (dtb_u_u419 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u418)))))) in (let dtb_u_u420 = (dtb_u_u415 _u_ueffTok) in (let dtb_u_u422 = { B_dData_dPair.f_Pair_first = (Frontend_dPackages_dPkg.v_rootName root); B_dData_dPair.f_Pair_second = (String.concat "" ["manifest:"; (string_of_int (v_textHash dtb_u_u420)); ":"; (string_of_int h)]) } in dtb_u_u422))))))

# 522 "Vuna/Compiler/Driver/Compile.vuna"
let v_depRootIdentityEff = (fun (dtb_u_u424 : string) (dtb_u_u425 : string) (dtb_u_u426 : string) (dtb_u_u431 : Frontend_dPackages_dPkg.t_Root) -> (Obj.repr ((fun (dtb_u_u436 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u439 = (((v_rootHash_u_udirect dtb_u_u424) dtb_u_u431) dtb_u_u436) in (let dtb_u_u440 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") (String.concat "" ["dep-identity="; (Frontend_dPackages_dPkg.v_rootName dtb_u_u431); " verdict=manifest src="; (string_of_int dtb_u_u439)])) else 0) in ((Obj.magic (((v_manifestIdentityOf dtb_u_u424) dtb_u_u431) dtb_u_u439)) dtb_u_u436)))))))

# 522 "Vuna/Compiler/Driver/Compile.vuna"
let v_depRootIdentityEff_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (root : Frontend_dPackages_dPkg.t_Root) _u_ueffTok -> (let dtb_u_u439 = (((v_rootHash_u_udirect nFs) root) _u_ueffTok) in (let dtb_u_u440 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") (String.concat "" ["dep-identity="; (Frontend_dPackages_dPkg.v_rootName root); " verdict=manifest src="; (string_of_int dtb_u_u439)])) else 0) in ((Obj.magic (((v_manifestIdentityOf nFs) root) dtb_u_u439)) _u_ueffTok))))

# 530 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIdentitiesEff = (fun (dtb_u_u441 : string) (dtb_u_u442 : string) (dtb_u_u443 : string) (dtb_u_u448 : Frontend_dPackages_dPkg.t_PackageContext) -> (match (Frontend_dPackages_dPkg.v_contextRoots dtb_u_u448) with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u450 = B_dData_dList.C_List_Nil in (Obj.repr ((fun (dtb_u_u451 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u450))))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u452, dtb_u_u453) -> ((v_mapEff (((v_depRootIdentityEff dtb_u_u441) dtb_u_u442) dtb_u_u443)) dtb_u_u453)
  | _ -> failwith "DT: impossible branch"
))

# 530 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIdentitiesEff_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) _u_ueffTok -> (match (Frontend_dPackages_dPkg.v_contextRoots ctx) with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u450 = B_dData_dList.C_List_Nil in dtb_u_u450)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u452, dtb_u_u453) -> ((Obj.magic ((v_mapEff (((v_depRootIdentityEff nFs) nEnv) nProcess)) dtb_u_u453)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))

# 539 "Vuna/Compiler/Driver/Compile.vuna"
let v_pairText = (fun (p : (string, string) B_dData_dPair.t_Pair) -> (String.concat "" [(B_dData_dPair.v_firstOf p); "="; (B_dData_dPair.v_secondOf p)]))

# 536 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIdentitiesHash = (fun (pairs : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ ("dep-identities", ((B_dData_dList.v_map v_pairText) pairs)))))

# 489 "Vuna/Compiler/Driver/Compile.vuna"
let v_buildIdForEff = (fun (dtb_u_u456 : string) (dtb_u_u457 : string) (dtb_u_u458 : string) (dtb_u_u463 : Frontend_dPackages_dPkg.t_PackageContext) -> (Obj.repr ((fun (dtb_u_u468 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u471 = (((v_concatMapEff_u_udirect (v_rootSources dtb_u_u456)) (v_ownRootsOf dtb_u_u463)) dtb_u_u468) in (if ((B_dData_dList.v_memName v_compilerClosureModule) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u471)) then (let dtb_u_u479 = (((((v_depIdentitiesEff_u_udirect dtb_u_u456) dtb_u_u457) dtb_u_u458) dtb_u_u463) dtb_u_u468) in (let dtb_u_u481 = ((Loader_dFingerprint.v_compilerIdOf dtb_u_u471) (v_depIdentitiesHash dtb_u_u479)) in dtb_u_u481)) else ((Obj.magic ((Loader_dFingerprint.v_compilerTagEff dtb_u_u456) dtb_u_u457)) dtb_u_u468)))))))

# 489 "Vuna/Compiler/Driver/Compile.vuna"
let v_buildIdForEff_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) _u_ueffTok -> (let dtb_u_u471 = (((v_concatMapEff_u_udirect (v_rootSources nFs)) (v_ownRootsOf ctx)) _u_ueffTok) in (if ((B_dData_dList.v_memName v_compilerClosureModule) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u471)) then (let dtb_u_u479 = (((((v_depIdentitiesEff_u_udirect nFs) nEnv) nProcess) ctx) _u_ueffTok) in (let dtb_u_u481 = ((Loader_dFingerprint.v_compilerIdOf dtb_u_u471) (v_depIdentitiesHash dtb_u_u479)) in dtb_u_u481)) else ((Obj.magic ((Loader_dFingerprint.v_compilerTagEff nFs) nEnv)) _u_ueffTok))))

# 296 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeCompiledNormalized = (fun (dtb_u_u483 : string) (dtb_u_u484 : string) (dtb_u_u485 : string) (dtb_u_u490 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u491 : string) (dtb_u_u492 : Driver_dSplit.t_SplitFile B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u497 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u500 = ((((v_ensureDirPath_u_udirect dtb_u_u483) dtb_u_u485) dtb_u_u491) dtb_u_u497) in (let dtb_u_u508 = (((((v_buildIdForEff_u_udirect dtb_u_u483) dtb_u_u484) dtb_u_u485) dtb_u_u490) dtb_u_u497) in (let dtb_u_u516 = ((((v_writeFileIfChanged_u_udirect dtb_u_u483) (String.concat "" [dtb_u_u491; "/"; Loader_dFingerprint.v_buildIdFileName])) (dtb_u_u508 ^ "\n")) dtb_u_u497) in (let dtb_u_u517 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") "write-compiled-start") else 0) in (let dtb_u_u525 = ((((Driver_dSplit.v_writeSplitFilesIfChanged_u_udirect dtb_u_u483) dtb_u_u491) dtb_u_u492) dtb_u_u497) in (match dtb_u_u525 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u526) -> (let dtb_u_u528 = (Base_dDiag.C_Check_ErrC (dtb_u_u526)) in dtb_u_u528)
  | Base_dDiag.C_Check_OkC (dtb_u_u530) -> (let dtb_u_u531 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") "write-split-files-done") else 0) in (let dtb_u_u532 = (Driver_dSplit.v_splitGraph dtb_u_u492) in (let dtb_u_u533 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") "split-graph-done") else 0) in (let dtb_u_u541 = (((((v_copyFfiFiles_u_udirect dtb_u_u483) dtb_u_u485) (Frontend_dPackages_dPkg.v_contextDir dtb_u_u490)) dtb_u_u491) dtb_u_u497) in (let dtb_u_u549 = ((((B_dEffect_dFs.v_fsWriteFile_u_udirect dtb_u_u483) (dtb_u_u491 ^ "/build.sh")) ((Driver_dSplit.v_buildScript dtb_u_u532) dtb_u_u541)) dtb_u_u497) in (let dtb_u_u550 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") "build-script-done") else 0) in (let dtb_u_u552 = (Base_dDiag.C_Check_OkC (dtb_u_u530)) in dtb_u_u552)))))))
  | _ -> failwith "DT: impossible branch"
))))))))))

# 296 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeCompiledNormalized_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (outDir : string) (files : Driver_dSplit.t_SplitFile B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u500 = ((((v_ensureDirPath_u_udirect nFs) nProcess) outDir) _u_ueffTok) in (let dtb_u_u508 = (((((v_buildIdForEff_u_udirect nFs) nEnv) nProcess) ctx) _u_ueffTok) in (let dtb_u_u516 = ((((v_writeFileIfChanged_u_udirect nFs) (String.concat "" [outDir; "/"; Loader_dFingerprint.v_buildIdFileName])) (dtb_u_u508 ^ "\n")) _u_ueffTok) in (let dtb_u_u517 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") "write-compiled-start") else 0) in (let dtb_u_u525 = ((((Driver_dSplit.v_writeSplitFilesIfChanged_u_udirect nFs) outDir) files) _u_ueffTok) in (match dtb_u_u525 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u526) -> (let dtb_u_u528 = (Base_dDiag.C_Check_ErrC (dtb_u_u526)) in dtb_u_u528)
  | Base_dDiag.C_Check_OkC (dtb_u_u530) -> (let dtb_u_u531 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") "write-split-files-done") else 0) in (let dtb_u_u532 = (Driver_dSplit.v_splitGraph files) in (let dtb_u_u533 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") "split-graph-done") else 0) in (let dtb_u_u541 = (((((v_copyFfiFiles_u_udirect nFs) nProcess) (Frontend_dPackages_dPkg.v_contextDir ctx)) outDir) _u_ueffTok) in (let dtb_u_u549 = ((((B_dEffect_dFs.v_fsWriteFile_u_udirect nFs) (outDir ^ "/build.sh")) ((Driver_dSplit.v_buildScript dtb_u_u532) dtb_u_u541)) _u_ueffTok) in (let dtb_u_u550 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") "build-script-done") else 0) in (let dtb_u_u552 = (Base_dDiag.C_Check_OkC (dtb_u_u530)) in dtb_u_u552)))))))
  | _ -> failwith "DT: impossible branch"
)))))))

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
let v_runBuildScript = (fun (dtb_u_u566 : string) (dtb_u_u569 : string) (dtb_u_u570 : string) (dtb_u_u571 : string) -> (Obj.repr ((fun (dtb_u_u576 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u579 = ((((B_dEffect_dProcess.v_processRunIn_u_udirect dtb_u_u566) dtb_u_u569) (B_dData_dList.C_List__x58__x58_ ("sh", (B_dData_dList.C_List__x58__x58_ ("build.sh", (B_dData_dList.C_List__x58__x58_ (dtb_u_u570, B_dData_dList.C_List_Nil))))))) dtb_u_u576) in (let dtb_u_u581 = (if (dtb_u_u579 = 0) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_err (String.concat "" ["build: "; dtb_u_u571; ": sh build.sh "; dtb_u_u570; " failed in "; dtb_u_u569; " (exit "; (string_of_int dtb_u_u579); ")"]))) in dtb_u_u581))))))

# 604 "Vuna/Compiler/Driver/Compile.vuna"
let v_runBuildScript_u_udirect = (fun (nProcess : string) (dir : string) (out : string) (name : string) _u_ueffTok -> (let dtb_u_u579 = ((((B_dEffect_dProcess.v_processRunIn_u_udirect nProcess) dir) (B_dData_dList.C_List__x58__x58_ ("sh", (B_dData_dList.C_List__x58__x58_ ("build.sh", (B_dData_dList.C_List__x58__x58_ (out, B_dData_dList.C_List_Nil))))))) _u_ueffTok) in (let dtb_u_u581 = (if (dtb_u_u579 = 0) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_err (String.concat "" ["build: "; name; ": sh build.sh "; out; " failed in "; dir; " (exit "; (string_of_int dtb_u_u579); ")"]))) in dtb_u_u581)))

# 612 "Vuna/Compiler/Driver/Compile.vuna"
let v_projectIdOf = (fun (dtb_u_u583 : string) (dtb_u_u586 : Frontend_dPackages_dPkg.t_PackageContext) -> (Obj.repr ((fun (dtb_u_u591 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u594 = (((Frontend_dPackages_dPkg.v_absolutePath_u_udirect dtb_u_u583) (Frontend_dPackages_dPkg.v_contextDir dtb_u_u586)) dtb_u_u591) in (let dtb_u_u596 = (Loader_dAddr.v_projectIdAddrOf dtb_u_u594) in dtb_u_u596))))))

# 612 "Vuna/Compiler/Driver/Compile.vuna"
let v_projectIdOf_u_udirect = (fun (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) _u_ueffTok -> (let dtb_u_u594 = (((Frontend_dPackages_dPkg.v_absolutePath_u_udirect nEnv) (Frontend_dPackages_dPkg.v_contextDir ctx)) _u_ueffTok) in (let dtb_u_u596 = (Loader_dAddr.v_projectIdAddrOf dtb_u_u594) in dtb_u_u596)))

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
let v_buildMetaText = (fun (dtb_u_u612 : string) (dtb_u_u613 : string) (dtb_u_u617 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u618 : string) (dtb_u_u619 : bool) -> (Obj.repr ((fun (dtb_u_u624 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u627 = ((((v_contextSources_u_udirect dtb_u_u612) dtb_u_u617) dtb_u_u618) dtb_u_u624) in (let dtb_u_u635 = (((v_dependencyHashes_u_udirect dtb_u_u612) dtb_u_u617) dtb_u_u624) in (let dtb_u_u643 = (((Loader_dFingerprint.v_cacheTagEff_u_udirect dtb_u_u612) dtb_u_u613) dtb_u_u624) in (let dtb_u_u644 = (v_textHash (v_manifestSemanticText (dtb_u_u617).Frontend_dPackages_dPkg.f_PackageContext_contextPackage)) in (let dtb_u_u645 = (v_lastSegment dtb_u_u618) in (let dtb_u_u646 = (if dtb_u_u619 then "true" else "false") in (let dtb_u_u648 = (String.concat "" ["{\"schema\":"; (string_of_int v_metaSchema); ",\"compiler\":\""; dtb_u_u643; "\",\"package\":\""; (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u617); "\",\"entry\":\""; dtb_u_u645; "\",\"linked\":"; dtb_u_u646; ",\"closure\":"; (string_of_int ((v_closureHashOf dtb_u_u627) 0)); ",\"manifest\":"; (string_of_int dtb_u_u644); ",\"sources\":["; (v_joinJsonList ((B_dData_dList.v_map v_metaPairText) dtb_u_u627)); "],\"dependencies\":["; (v_joinJsonList ((B_dData_dList.v_map v_metaPairText) dtb_u_u635)); "]}\n"]) in dtb_u_u648)))))))))))

# 562 "Vuna/Compiler/Driver/Compile.vuna"
let v_buildMetaText_u_udirect = (fun (nFs : string) (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (linked : bool) _u_ueffTok -> (let dtb_u_u627 = ((((v_contextSources_u_udirect nFs) ctx) entry) _u_ueffTok) in (let dtb_u_u635 = (((v_dependencyHashes_u_udirect nFs) ctx) _u_ueffTok) in (let dtb_u_u643 = (((Loader_dFingerprint.v_cacheTagEff_u_udirect nFs) nEnv) _u_ueffTok) in (let dtb_u_u644 = (v_textHash (v_manifestSemanticText (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage)) in (let dtb_u_u645 = (v_lastSegment entry) in (let dtb_u_u646 = (if linked then "true" else "false") in (let dtb_u_u648 = (String.concat "" ["{\"schema\":"; (string_of_int v_metaSchema); ",\"compiler\":\""; dtb_u_u643; "\",\"package\":\""; (Frontend_dPackages_dPkg.v_contextPackageName ctx); "\",\"entry\":\""; dtb_u_u645; "\",\"linked\":"; dtb_u_u646; ",\"closure\":"; (string_of_int ((v_closureHashOf dtb_u_u627) 0)); ",\"manifest\":"; (string_of_int dtb_u_u644); ",\"sources\":["; (v_joinJsonList ((B_dData_dList.v_map v_metaPairText) dtb_u_u627)); "],\"dependencies\":["; (v_joinJsonList ((B_dData_dList.v_map v_metaPairText) dtb_u_u635)); "]}\n"]) in dtb_u_u648))))))))

# 578 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeBuildMeta = (fun (dtb_u_u650 : string) (dtb_u_u651 : string) (dtb_u_u655 : string) (dtb_u_u656 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u657 : string) (dtb_u_u658 : bool) -> (Obj.repr ((fun (dtb_u_u663 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u666 = ((((((v_buildMetaText_u_udirect dtb_u_u650) dtb_u_u651) dtb_u_u656) dtb_u_u657) dtb_u_u658) dtb_u_u663) in (let dtb_u_u674 = ((((B_dEffect_dFs.v_fsWriteFile_u_udirect dtb_u_u650) (v_metaPathOf dtb_u_u655)) dtb_u_u666) dtb_u_u663) in (let dtb_u_u676 = dtb_u_u674 in dtb_u_u676)))))))

# 578 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeBuildMeta_u_udirect = (fun (nFs : string) (nEnv : string) (outDir : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (linked : bool) _u_ueffTok -> (let dtb_u_u666 = ((((((v_buildMetaText_u_udirect nFs) nEnv) ctx) entry) linked) _u_ueffTok) in (let dtb_u_u674 = ((((B_dEffect_dFs.v_fsWriteFile_u_udirect nFs) (v_metaPathOf outDir)) dtb_u_u666) _u_ueffTok) in (let dtb_u_u676 = dtb_u_u674 in dtb_u_u676))))

# 586 "Vuna/Compiler/Driver/Compile.vuna"
let v_metaUpToDate = (fun (dtb_u_u678 : string) (dtb_u_u679 : string) (dtb_u_u683 : string) (dtb_u_u684 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u685 : string) (dtb_u_u686 : string) -> (let dtb_u_u687 = (v_metaPathOf dtb_u_u683) in (Obj.repr ((fun (dtb_u_u692 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u695 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u678) dtb_u_u687) dtb_u_u692) in (let dtb_u_u701 = Obj.obj ((if dtb_u_u695 then ((B_dEffect_dFs.v_fsFileExists dtb_u_u678) dtb_u_u686) else (let dtb_u_u704 = false in (Obj.repr ((fun (dtb_u_u705 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u704)))))) in (let dtb_u_u706 = (dtb_u_u701 dtb_u_u692) in (if (if dtb_u_u695 then dtb_u_u706 else false) then (let dtb_u_u714 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u678) dtb_u_u687) dtb_u_u692) in (let dtb_u_u722 = ((((((v_buildMetaText_u_udirect dtb_u_u678) dtb_u_u679) dtb_u_u684) dtb_u_u685) true) dtb_u_u692) in (let dtb_u_u724 = (dtb_u_u714 = dtb_u_u722) in dtb_u_u724))) else (let dtb_u_u727 = false in dtb_u_u727))))))))))

# 586 "Vuna/Compiler/Driver/Compile.vuna"
let v_metaUpToDate_u_udirect = (fun (nFs : string) (nEnv : string) (outDir : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (binPath : string) _u_ueffTok -> (let dtb_u_u687 = (v_metaPathOf outDir) in (let dtb_u_u695 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) dtb_u_u687) _u_ueffTok) in (let dtb_u_u701 = Obj.obj ((if dtb_u_u695 then ((B_dEffect_dFs.v_fsFileExists nFs) binPath) else (let dtb_u_u704 = false in (Obj.repr ((fun (dtb_u_u705 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u704)))))) in (let dtb_u_u706 = (dtb_u_u701 _u_ueffTok) in (if (if dtb_u_u695 then dtb_u_u706 else false) then (let dtb_u_u714 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) dtb_u_u687) _u_ueffTok) in (let dtb_u_u722 = ((((((v_buildMetaText_u_udirect nFs) nEnv) ctx) entry) true) _u_ueffTok) in (let dtb_u_u724 = (dtb_u_u714 = dtb_u_u722) in dtb_u_u724))) else (let dtb_u_u727 = false in dtb_u_u727)))))))

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
let v_closureModOf = (fun (dtb_u_u762 : string) (dtb_u_u763 : string) (dtb_u_u764 : string) (dtb_u_u769 : t_PkgEntry) (dtb_u_u770 : string) (dtb_u_u771 : string) (dtb_u_u772 : string) -> (let dtb_u_u773 = ((v_moduleNameOfPath dtb_u_u770) dtb_u_u771) in (let dtb_u_u774 = (Base_dHash.v_contentAddress dtb_u_u772) in (Obj.repr ((fun (dtb_u_u779 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u782 = ((((Loader_dFlatten.v_parseFileWithPath_u_udirect dtb_u_u762) dtb_u_u771) dtb_u_u772) dtb_u_u779) in (let dtb_u_u783 = (match dtb_u_u782 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u787) -> B_dData_dList.C_List_Nil
  | Base_dDiag.C_Check_OkC (dtb_u_u788) -> (let dtb_u_u789 = ((Loader_dAddr.v_headerOfSource "") (B_dData_dPair.v_firstOf dtb_u_u788)) in (dtb_u_u789).Loader_dAddr.f_ModHeader_mhImports)
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u785 = { f_ClosureMod_cmPkg = (dtb_u_u769).f_PkgEntry_peName; f_ClosureMod_cmPkgKey = (dtb_u_u769).f_PkgEntry_peKey; f_ClosureMod_cmPkgEnv = (dtb_u_u769).f_PkgEntry_peEnv; f_ClosureMod_cmName = dtb_u_u773; f_ClosureMod_cmPath = dtb_u_u771; f_ClosureMod_cmSrc = dtb_u_u774; f_ClosureMod_cmImports = dtb_u_u783; f_ClosureMod_cmAddr = "" } in dtb_u_u785)))))))))

# 788 "Vuna/Compiler/Driver/Compile.vuna"
let v_closureModOf_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (pe : t_PkgEntry) (root : string) (p : string) (raw : string) _u_ueffTok -> (let dtb_u_u773 = ((v_moduleNameOfPath root) p) in (let dtb_u_u774 = (Base_dHash.v_contentAddress raw) in (let dtb_u_u782 = ((((Loader_dFlatten.v_parseFileWithPath_u_udirect nFs) p) raw) _u_ueffTok) in (let dtb_u_u783 = (match dtb_u_u782 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u787) -> B_dData_dList.C_List_Nil
  | Base_dDiag.C_Check_OkC (dtb_u_u788) -> (let dtb_u_u789 = ((Loader_dAddr.v_headerOfSource "") (B_dData_dPair.v_firstOf dtb_u_u788)) in (dtb_u_u789).Loader_dAddr.f_ModHeader_mhImports)
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u785 = { f_ClosureMod_cmPkg = (pe).f_PkgEntry_peName; f_ClosureMod_cmPkgKey = (pe).f_PkgEntry_peKey; f_ClosureMod_cmPkgEnv = (pe).f_PkgEntry_peEnv; f_ClosureMod_cmName = dtb_u_u773; f_ClosureMod_cmPath = p; f_ClosureMod_cmSrc = dtb_u_u774; f_ClosureMod_cmImports = dtb_u_u783; f_ClosureMod_cmAddr = "" } in dtb_u_u785))))))

# 768 "Vuna/Compiler/Driver/Compile.vuna"
let v_closureModsEff = (fun (dtb_u_u790 : string) (dtb_u_u791 : string) (dtb_u_u792 : string) (dtb_u_u797 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u798 : t_PkgEntry B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u803 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u828 = (((v_mapEff_u_udirect (fun (dtb_u_u806 : Frontend_dPackages_dPkg.t_Root) -> (match ((v_findPkgEntry (Frontend_dPackages_dPkg.v_rootName dtb_u_u806)) dtb_u_u798) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u808 = B_dData_dList.C_List_Nil in (Obj.repr ((fun (dtb_u_u809 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u808))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u810) -> (Obj.repr ((fun (dtb_u_u815 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u818 = (((v_collectVunaMeta_u_udirect dtb_u_u790) (Frontend_dPackages_dPkg.v_rootDir dtb_u_u806)) dtb_u_u815) in ((Obj.magic ((v_mapEff (fun (dtb_u_u819 : string) -> (Obj.repr ((fun (dtb_u_u824 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u827 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u790) dtb_u_u819) dtb_u_u824) in ((Obj.magic (((((((v_closureModOf dtb_u_u790) dtb_u_u791) dtb_u_u792) dtb_u_u810) (Frontend_dPackages_dPkg.v_rootDir dtb_u_u806)) dtb_u_u819) dtb_u_u827)) dtb_u_u824))))))) dtb_u_u818)) dtb_u_u815)))))
  | _ -> failwith "DT: impossible branch"
))) (Frontend_dPackages_dPkg.v_contextRoots dtb_u_u797)) dtb_u_u803) in (let dtb_u_u830 = ((B_dData_dList.v_concatMap (fun (dtb_u_u832 : t_ClosureMod B_dData_dList.t_List) -> dtb_u_u832)) dtb_u_u828) in dtb_u_u830))))))

# 768 "Vuna/Compiler/Driver/Compile.vuna"
let v_closureModsEff_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (pkgs : t_PkgEntry B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u828 = (((v_mapEff_u_udirect (fun (dtb_u_u806 : Frontend_dPackages_dPkg.t_Root) -> (match ((v_findPkgEntry (Frontend_dPackages_dPkg.v_rootName dtb_u_u806)) pkgs) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u808 = B_dData_dList.C_List_Nil in (Obj.repr ((fun (dtb_u_u809 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u808))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u810) -> (Obj.repr ((fun (dtb_u_u815 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u818 = (((v_collectVunaMeta_u_udirect nFs) (Frontend_dPackages_dPkg.v_rootDir dtb_u_u806)) dtb_u_u815) in ((Obj.magic ((v_mapEff (fun (dtb_u_u819 : string) -> (Obj.repr ((fun (dtb_u_u824 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u827 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) dtb_u_u819) dtb_u_u824) in ((Obj.magic (((((((v_closureModOf nFs) nEnv) nProcess) dtb_u_u810) (Frontend_dPackages_dPkg.v_rootDir dtb_u_u806)) dtb_u_u819) dtb_u_u827)) dtb_u_u824))))))) dtb_u_u818)) dtb_u_u815)))))
  | _ -> failwith "DT: impossible branch"
))) (Frontend_dPackages_dPkg.v_contextRoots ctx)) _u_ueffTok) in (let dtb_u_u830 = ((B_dData_dList.v_concatMap (fun (dtb_u_u832 : t_ClosureMod B_dData_dList.t_List) -> dtb_u_u832)) dtb_u_u828) in dtb_u_u830)))

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
let v_ifaceModsWithEff = (fun (dtb_u_u852 : string) (dtb_u_u853 : string) (dtb_u_u854 : string) (dtb_u_u855 : string) (dtb_u_u861 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u862 : t_PkgEntry B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u867 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u870 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.iface.compute") dtb_u_u867) in (let dtb_u_u878 = ((B_dEffect_dClock.v_clockNow_u_udirect dtb_u_u853) dtb_u_u867) in (let dtb_u_u886 = ((((((v_closureModsEff_u_udirect dtb_u_u852) dtb_u_u854) dtb_u_u855) dtb_u_u861) dtb_u_u862) dtb_u_u867) in (let dtb_u_u894 = ((B_dEffect_dClock.v_clockNow_u_udirect dtb_u_u853) dtb_u_u867) in (let dtb_u_u895 = ((B_dData_dList.v_memName "Prelude") ((B_dData_dList.v_map v_modNameOf) dtb_u_u886)) in (let dtb_u_u896 = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map v_pkgPreludePair) dtb_u_u862)) in (let dtb_u_u897 = ((B_dData_dList.v_map ((v_appendPrelude dtb_u_u896) dtb_u_u895)) dtb_u_u886) in (let dtb_u_u898 = (v_srcTblOf dtb_u_u897) in (let dtb_u_u899 = ((B_dData_dList.v_map (v_withAddr dtb_u_u898)) dtb_u_u897) in (let dtb_u_u905 = Obj.obj ((let dtb_u_u908 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") (String.concat "" ["iface-mods-phases n="; (string_of_int (B_dData_dList.v_length dtb_u_u897)); " closure="; (string_of_int (if 1000 = 0 then failwith "division by zero" else (dtb_u_u894 - dtb_u_u878) / 1000)); "ms assign=direct"])) else 0) in (Obj.repr ((fun (dtb_u_u909 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u908))))) in (let dtb_u_u910 = (dtb_u_u905 dtb_u_u867) in (let dtb_u_u918 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.iface.compute") dtb_u_u867) in (let dtb_u_u920 = dtb_u_u899 in dtb_u_u920)))))))))))))))))

# 887 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceModsWithEff_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (pkgs : t_PkgEntry B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u870 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.iface.compute") _u_ueffTok) in (let dtb_u_u878 = ((B_dEffect_dClock.v_clockNow_u_udirect nClock) _u_ueffTok) in (let dtb_u_u886 = ((((((v_closureModsEff_u_udirect nFs) nEnv) nProcess) ctx) pkgs) _u_ueffTok) in (let dtb_u_u894 = ((B_dEffect_dClock.v_clockNow_u_udirect nClock) _u_ueffTok) in (let dtb_u_u895 = ((B_dData_dList.v_memName "Prelude") ((B_dData_dList.v_map v_modNameOf) dtb_u_u886)) in (let dtb_u_u896 = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map v_pkgPreludePair) pkgs)) in (let dtb_u_u897 = ((B_dData_dList.v_map ((v_appendPrelude dtb_u_u896) dtb_u_u895)) dtb_u_u886) in (let dtb_u_u898 = (v_srcTblOf dtb_u_u897) in (let dtb_u_u899 = ((B_dData_dList.v_map (v_withAddr dtb_u_u898)) dtb_u_u897) in (let dtb_u_u905 = Obj.obj ((let dtb_u_u908 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") (String.concat "" ["iface-mods-phases n="; (string_of_int (B_dData_dList.v_length dtb_u_u897)); " closure="; (string_of_int (if 1000 = 0 then failwith "division by zero" else (dtb_u_u894 - dtb_u_u878) / 1000)); "ms assign=direct"])) else 0) in (Obj.repr ((fun (dtb_u_u909 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u908))))) in (let dtb_u_u910 = (dtb_u_u905 _u_ueffTok) in (let dtb_u_u918 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.iface.compute") _u_ueffTok) in (let dtb_u_u920 = dtb_u_u899 in dtb_u_u920))))))))))))))

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

# 973 "Vuna/Compiler/Driver/Compile.vuna"
let v_moduleStateDirEff_u_udirect = (fun (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (m : t_ClosureMod) _u_ueffTok -> (match ((v_rootOfName (m).f_ClosureMod_cmPkg) (Frontend_dPackages_dPkg.v_contextRoots ctx)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u931) -> ((Obj.magic ((Frontend_dPackages_dState.v_pkgStateDirEff nEnv) (Frontend_dPackages_dPkg.v_rootDir dtb_u_u931))) _u_ueffTok)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic ((Frontend_dPackages_dState.v_pkgStateDirEff nEnv) (Frontend_dPackages_dPkg.v_contextDir ctx))) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))

# 980 "Vuna/Compiler/Driver/Compile.vuna"
let v_moduleIfaceDirEff = (fun (dtb_u_u932 : string) (dtb_u_u935 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u936 : t_ClosureMod) -> (Obj.repr ((fun (dtb_u_u941 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u944 = ((((v_moduleStateDirEff_u_udirect dtb_u_u932) dtb_u_u935) dtb_u_u936) dtb_u_u941) in (let dtb_u_u946 = (Frontend_dPackages_dState.v_ifaceDirOf dtb_u_u944) in dtb_u_u946))))))

# 980 "Vuna/Compiler/Driver/Compile.vuna"
let v_moduleIfaceDirEff_u_udirect = (fun (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (m : t_ClosureMod) _u_ueffTok -> (let dtb_u_u944 = ((((v_moduleStateDirEff_u_udirect nEnv) ctx) m) _u_ueffTok) in (let dtb_u_u946 = (Frontend_dPackages_dState.v_ifaceDirOf dtb_u_u944) in dtb_u_u946)))

# 987 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownIfaceDirEff = (fun (dtb_u_u948 : string) (dtb_u_u949 : string) (dtb_u_u953 : Frontend_dPackages_dPkg.t_PackageContext) -> (Obj.repr ((fun (dtb_u_u958 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u961 = ((((Frontend_dPackages_dState.v_ensurePkgStateDirEff_u_udirect dtb_u_u948) dtb_u_u949) (Frontend_dPackages_dPkg.v_contextDir dtb_u_u953)) dtb_u_u958) in (let dtb_u_u962 = (Frontend_dPackages_dState.v_ifaceDirOf dtb_u_u961) in (let dtb_u_u970 = (((B_dEffect_dFs.v_fsMakeDir_u_udirect dtb_u_u948) dtb_u_u962) dtb_u_u958) in (let dtb_u_u972 = dtb_u_u962 in dtb_u_u972))))))))

# 987 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownIfaceDirEff_u_udirect = (fun (nFs : string) (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) _u_ueffTok -> (let dtb_u_u961 = ((((Frontend_dPackages_dState.v_ensurePkgStateDirEff_u_udirect nFs) nEnv) (Frontend_dPackages_dPkg.v_contextDir ctx)) _u_ueffTok) in (let dtb_u_u962 = (Frontend_dPackages_dState.v_ifaceDirOf dtb_u_u961) in (let dtb_u_u970 = (((B_dEffect_dFs.v_fsMakeDir_u_udirect nFs) dtb_u_u962) _u_ueffTok) in (let dtb_u_u972 = dtb_u_u962 in dtb_u_u972)))))

# 998 "Vuna/Compiler/Driver/Compile.vuna"
let v_readIfaceInEff = (fun (dtb_u_u974 : string) (dtb_u_u977 : string) (dtb_u_u978 : string) -> (((Base_dObs.v_obsSpanEff "vuna.cache.lookup") "vuna.cache") (Obj.repr ((fun (dtb_u_u983 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u986 = (((((Base_dStore.v_storeReadEff_u_udirect dtb_u_u974) (Base_dStore.v_storeObjectTag "module-iface")) v_ifaceObjectCodec) (String.concat "" [dtb_u_u977; "/"; dtb_u_u978])) dtb_u_u983) in (let dtb_u_u988 = (match dtb_u_u986 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u990) -> (Driver_dIface.v_decModuleIfaceComplete dtb_u_u990)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u988)))))))

# 998 "Vuna/Compiler/Driver/Compile.vuna"
let v_readIfaceInEff_u_udirect = (fun (nFs : string) (dir : string) (a : string) _u_ueffTok -> ((Obj.magic (((Base_dObs.v_obsSpanEff "vuna.cache.lookup") "vuna.cache") (Obj.repr ((fun (dtb_u_u983 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u986 = (((((Base_dStore.v_storeReadEff_u_udirect nFs) (Base_dStore.v_storeObjectTag "module-iface")) v_ifaceObjectCodec) (String.concat "" [dir; "/"; a])) dtb_u_u983) in (let dtb_u_u988 = (match dtb_u_u986 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u990) -> (Driver_dIface.v_decModuleIfaceComplete dtb_u_u990)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u988))))))) _u_ueffTok))

# 1010 "Vuna/Compiler/Driver/Compile.vuna"
let v_readIfaceOfModEff = (fun (dtb_u_u991 : string) (dtb_u_u992 : string) (dtb_u_u996 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u997 : t_ClosureMod) -> (Obj.repr ((fun (dtb_u_u1002 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1005 = ((((v_moduleIfaceDirEff_u_udirect dtb_u_u992) dtb_u_u996) dtb_u_u997) dtb_u_u1002) in ((Obj.magic (((v_readIfaceInEff dtb_u_u991) dtb_u_u1005) (dtb_u_u997).f_ClosureMod_cmAddr)) dtb_u_u1002))))))

# 1010 "Vuna/Compiler/Driver/Compile.vuna"
let v_readIfaceOfModEff_u_udirect = (fun (nFs : string) (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (m : t_ClosureMod) _u_ueffTok -> (let dtb_u_u1005 = ((((v_moduleIfaceDirEff_u_udirect nEnv) ctx) m) _u_ueffTok) in ((Obj.magic (((v_readIfaceInEff nFs) dtb_u_u1005) (m).f_ClosureMod_cmAddr)) _u_ueffTok)))

# 1019 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_readIfaceListPartialEff = (fun (dtb_u_u1006 : string) (dtb_u_u1007 : string) (dtb_u_u1011 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1012 : t_ClosureMod B_dData_dList.t_List) -> (match dtb_u_u1012 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1013, dtb_u_u1014) -> (Obj.repr ((fun (dtb_u_u1019 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1022 = (((((v_readIfaceOfModEff_u_udirect dtb_u_u1006) dtb_u_u1007) dtb_u_u1011) dtb_u_u1013) dtb_u_u1019) in (let dtb_u_u1030 = (((((v_readIfaceListPartialEff_u_udirect dtb_u_u1006) dtb_u_u1007) dtb_u_u1011) dtb_u_u1014) dtb_u_u1019) in (let dtb_u_u1032 = (match dtb_u_u1022 with
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u1030
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1034) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u1034, dtb_u_u1030))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1032))))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u1036 = B_dData_dList.C_List_Nil in (Obj.repr ((fun (dtb_u_u1037 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u1036))))
  | _ -> failwith "DT: impossible branch"
))
# 1019 "Vuna/Compiler/Driver/Compile.vuna"
and v_readIfaceListPartialEff_u_udirect = (fun (nFs : string) (nEnv : string) (mc0 : Frontend_dPackages_dPkg.t_PackageContext) (mc1 : t_ClosureMod B_dData_dList.t_List) _u_ueffTok -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1013, dtb_u_u1014) -> (let dtb_u_u1022 = (((((v_readIfaceOfModEff_u_udirect nFs) nEnv) mc0) dtb_u_u1013) _u_ueffTok) in (let dtb_u_u1030 = (((((v_readIfaceListPartialEff_u_udirect nFs) nEnv) mc0) dtb_u_u1014) _u_ueffTok) in (let dtb_u_u1032 = (match dtb_u_u1022 with
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u1030
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1034) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u1034, dtb_u_u1030))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1032)))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u1036 = B_dData_dList.C_List_Nil in dtb_u_u1036)
  | _ -> failwith "DT: impossible branch"
))

# 1031 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_readIfaceListInEff = (fun (dtb_u_u1038 : string) (dtb_u_u1039 : string) (dtb_u_u1043 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1044 : t_ClosureMod B_dData_dList.t_List) -> (match dtb_u_u1044 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1045, dtb_u_u1046) -> (Obj.repr ((fun (dtb_u_u1051 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1054 = (((((v_readIfaceOfModEff_u_udirect dtb_u_u1038) dtb_u_u1039) dtb_u_u1043) dtb_u_u1045) dtb_u_u1051) in (match dtb_u_u1054 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u1055 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") (String.concat "" ["iface-miss "; (dtb_u_u1045).f_ClosureMod_cmName; " "; (dtb_u_u1045).f_ClosureMod_cmAddr; " pkg="; (dtb_u_u1045).f_ClosureMod_cmPkg; " src="; (dtb_u_u1045).f_ClosureMod_cmSrc])) else 0) in (let dtb_u_u1056 = (Base_dObs.v_obsMark (String.concat "" ["vuna.tool.iface.miss:"; (dtb_u_u1045).f_ClosureMod_cmName; ":"; (dtb_u_u1045).f_ClosureMod_cmAddr])) in (let dtb_u_u1064 = (((Base_dObs.v_obsCountEff_u_udirect "vuna.counter.cache.miss") 1) dtb_u_u1051) in (let dtb_u_u1066 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u1066))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1068) -> (let dtb_u_u1076 = (((Base_dObs.v_obsCountEff_u_udirect "vuna.counter.cache.hit") 1) dtb_u_u1051) in (let dtb_u_u1084 = (((((v_readIfaceListInEff_u_udirect dtb_u_u1038) dtb_u_u1039) dtb_u_u1043) dtb_u_u1046) dtb_u_u1051) in (let dtb_u_u1086 = (match dtb_u_u1084 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1088) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb_u_u1068, dtb_u_u1088))))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1086)))
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u1090 = (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil)) in (Obj.repr ((fun (dtb_u_u1091 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u1090))))
  | _ -> failwith "DT: impossible branch"
))
# 1031 "Vuna/Compiler/Driver/Compile.vuna"
and v_readIfaceListInEff_u_udirect = (fun (nFs : string) (nEnv : string) (mc0 : Frontend_dPackages_dPkg.t_PackageContext) (mc1 : t_ClosureMod B_dData_dList.t_List) _u_ueffTok -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1045, dtb_u_u1046) -> (let dtb_u_u1054 = (((((v_readIfaceOfModEff_u_udirect nFs) nEnv) mc0) dtb_u_u1045) _u_ueffTok) in (match dtb_u_u1054 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u1055 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") (String.concat "" ["iface-miss "; (dtb_u_u1045).f_ClosureMod_cmName; " "; (dtb_u_u1045).f_ClosureMod_cmAddr; " pkg="; (dtb_u_u1045).f_ClosureMod_cmPkg; " src="; (dtb_u_u1045).f_ClosureMod_cmSrc])) else 0) in (let dtb_u_u1056 = (Base_dObs.v_obsMark (String.concat "" ["vuna.tool.iface.miss:"; (dtb_u_u1045).f_ClosureMod_cmName; ":"; (dtb_u_u1045).f_ClosureMod_cmAddr])) in (let dtb_u_u1064 = (((Base_dObs.v_obsCountEff_u_udirect "vuna.counter.cache.miss") 1) _u_ueffTok) in (let dtb_u_u1066 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u1066))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1068) -> (let dtb_u_u1076 = (((Base_dObs.v_obsCountEff_u_udirect "vuna.counter.cache.hit") 1) _u_ueffTok) in (let dtb_u_u1084 = (((((v_readIfaceListInEff_u_udirect nFs) nEnv) mc0) dtb_u_u1046) _u_ueffTok) in (let dtb_u_u1086 = (match dtb_u_u1084 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1088) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb_u_u1068, dtb_u_u1088))))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1086)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u1090 = (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil)) in dtb_u_u1090)
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
let rec v_probePairs = (fun (dtb_u_u1111 : string) (dtb_u_u1112 : string) (dtb_u_u1116 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1117 : t_ClosureMod B_dData_dList.t_List) -> (match dtb_u_u1117 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1118, dtb_u_u1119) -> (Obj.repr ((fun (dtb_u_u1124 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1127 = (((((v_readIfaceOfModEff_u_udirect dtb_u_u1111) dtb_u_u1112) dtb_u_u1116) dtb_u_u1118) dtb_u_u1124) in (let dtb_u_u1135 = (((((v_probePairs_u_udirect dtb_u_u1111) dtb_u_u1112) dtb_u_u1116) dtb_u_u1119) dtb_u_u1124) in (match dtb_u_u1127 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u1143 = (((Base_dObs.v_obsCountEff_u_udirect "vuna.counter.cache.miss") 1) dtb_u_u1124) in (let dtb_u_u1145 = dtb_u_u1135 in dtb_u_u1145))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1147) -> (let dtb_u_u1155 = (((Base_dObs.v_obsCountEff_u_udirect "vuna.counter.cache.hit") 1) dtb_u_u1124) in (let dtb_u_u1157 = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u1118; B_dData_dPair.f_Pair_second = dtb_u_u1147 }, dtb_u_u1135)) in dtb_u_u1157))
  | _ -> failwith "DT: impossible branch"
))))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u1160 = B_dData_dList.C_List_Nil in (Obj.repr ((fun (dtb_u_u1161 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u1160))))
  | _ -> failwith "DT: impossible branch"
))
# 1117 "Vuna/Compiler/Driver/Compile.vuna"
and v_probePairs_u_udirect = (fun (nFs : string) (nEnv : string) (mc0 : Frontend_dPackages_dPkg.t_PackageContext) (mc1 : t_ClosureMod B_dData_dList.t_List) _u_ueffTok -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1118, dtb_u_u1119) -> (let dtb_u_u1127 = (((((v_readIfaceOfModEff_u_udirect nFs) nEnv) mc0) dtb_u_u1118) _u_ueffTok) in (let dtb_u_u1135 = (((((v_probePairs_u_udirect nFs) nEnv) mc0) dtb_u_u1119) _u_ueffTok) in (match dtb_u_u1127 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u1143 = (((Base_dObs.v_obsCountEff_u_udirect "vuna.counter.cache.miss") 1) _u_ueffTok) in (let dtb_u_u1145 = dtb_u_u1135 in dtb_u_u1145))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1147) -> (let dtb_u_u1155 = (((Base_dObs.v_obsCountEff_u_udirect "vuna.counter.cache.hit") 1) _u_ueffTok) in (let dtb_u_u1157 = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u1118; B_dData_dPair.f_Pair_second = dtb_u_u1147 }, dtb_u_u1135)) in dtb_u_u1157))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u1160 = B_dData_dList.C_List_Nil in dtb_u_u1160)
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
let v_toolImportNamesOf = (fun (dtb_u_u1180 : string) (dtb_u_u1183 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1184 : string) (dtb_u_u1185 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u1190 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1193 = ((((((Loader_dFlatten.v_implicitPrelude_u_udirect dtb_u_u1180) (Frontend_dPackages_dPkg.v_contextRoots dtb_u_u1183)) (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u1183)) dtb_u_u1184) dtb_u_u1185) dtb_u_u1190) in (let dtb_u_u1195 = (match dtb_u_u1193 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1197) -> ((B_dData_dList.v_map v_importNameStr) dtb_u_u1185)
  | Base_dDiag.C_Check_OkC (dtb_u_u1198) -> ((B_dData_dList.v_map v_importNameStr) ((B_dData_dList.v_append dtb_u_u1185) dtb_u_u1198))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1195))))))

# 1248 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolImportNamesOf_u_udirect = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (current : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u1193 = ((((((Loader_dFlatten.v_implicitPrelude_u_udirect nFs) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) current) imports) _u_ueffTok) in (let dtb_u_u1195 = (match dtb_u_u1193 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1197) -> ((B_dData_dList.v_map v_importNameStr) imports)
  | Base_dDiag.C_Check_OkC (dtb_u_u1198) -> ((B_dData_dList.v_map v_importNameStr) ((B_dData_dList.v_append imports) dtb_u_u1198))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1195)))

# 1233 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolImportsOfSource = (fun (dtb_u_u1199 : string) (dtb_u_u1200 : string) (dtb_u_u1201 : string) (dtb_u_u1206 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1207 : string) (dtb_u_u1208 : string) -> (Obj.repr ((fun (dtb_u_u1213 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1216 = ((((Loader_dFlatten.v_parseFileWithPath_u_udirect dtb_u_u1199) dtb_u_u1207) dtb_u_u1208) dtb_u_u1213) in (match dtb_u_u1216 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1217) -> (let dtb_u_u1219 = B_dData_dList.C_List_Nil in dtb_u_u1219)
  | Base_dDiag.C_Check_OkC (dtb_u_u1221) -> (let dtb_u_u1222 = (B_dData_dPair.v_firstOf dtb_u_u1221) in (let dtb_u_u1223 = (dtb_u_u1222).Frontend_dAst.f_SourceFile_sourceFileModDecl in (let dtb_u_u1224 = (dtb_u_u1222).Frontend_dAst.f_SourceFile_sourceFileImports in (let dtb_u_u1225 = dtb_u_u1223 in (match dtb_u_u1225 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic ((((v_toolImportNamesOf dtb_u_u1199) dtb_u_u1206) "") dtb_u_u1224)) dtb_u_u1213)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1226) -> (match dtb_u_u1226 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb_u_u1227; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb_u_u1228; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb_u_u1229; Frontend_dAst.f_ModDecl_modDeclExports = dtb_u_u1230; Frontend_dAst.f_ModDecl_modDeclReexports = dtb_u_u1231; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb_u_u1232; Frontend_dAst.f_ModDecl_modDeclRef = dtb_u_u1233 } -> ((Obj.magic ((((v_toolImportNamesOf dtb_u_u1199) dtb_u_u1206) dtb_u_u1227) dtb_u_u1224)) dtb_u_u1213)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))))

# 1233 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolImportsOfSource_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) _u_ueffTok -> (let dtb_u_u1216 = ((((Loader_dFlatten.v_parseFileWithPath_u_udirect nFs) label) source) _u_ueffTok) in (match dtb_u_u1216 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1217) -> (let dtb_u_u1219 = B_dData_dList.C_List_Nil in dtb_u_u1219)
  | Base_dDiag.C_Check_OkC (dtb_u_u1221) -> (let dtb_u_u1222 = (B_dData_dPair.v_firstOf dtb_u_u1221) in (let dtb_u_u1223 = (dtb_u_u1222).Frontend_dAst.f_SourceFile_sourceFileModDecl in (let dtb_u_u1224 = (dtb_u_u1222).Frontend_dAst.f_SourceFile_sourceFileImports in (let dtb_u_u1225 = dtb_u_u1223 in (match dtb_u_u1225 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic ((((v_toolImportNamesOf nFs) ctx) "") dtb_u_u1224)) _u_ueffTok)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1226) -> (match dtb_u_u1226 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb_u_u1227; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb_u_u1228; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb_u_u1229; Frontend_dAst.f_ModDecl_modDeclExports = dtb_u_u1230; Frontend_dAst.f_ModDecl_modDeclReexports = dtb_u_u1231; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb_u_u1232; Frontend_dAst.f_ModDecl_modDeclRef = dtb_u_u1233 } -> ((Obj.magic ((((v_toolImportNamesOf nFs) ctx) dtb_u_u1227) dtb_u_u1224)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))

# 1263 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolEnabled = (fun (dtb_u_u1234 : string) -> (Obj.repr ((fun (dtb_u_u1241 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1244 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect dtb_u_u1234) "VUNA_IFACE_TOOL") dtb_u_u1241) in (let dtb_u_u1246 = (dtb_u_u1244 <> "0") in dtb_u_u1246))))))

# 1263 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolEnabled_u_udirect = (fun (nEnv : string) _u_ueffTok -> (let dtb_u_u1244 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect nEnv) "VUNA_IFACE_TOOL") _u_ueffTok) in (let dtb_u_u1246 = (dtb_u_u1244 <> "0") in dtb_u_u1246)))

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
let v_sourceInfoForPath = (fun (dtb_u_u1267 : string) (dtb_u_u1270 : string) -> (Obj.repr ((fun (dtb_u_u1275 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1278 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u1267) dtb_u_u1270) dtb_u_u1275) in (let dtb_u_u1284 = Obj.obj ((((fun dtb_u_u1288 dtb_u_u1289 -> (Obj.repr ((fun (dtb_u_u1290 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1291 = Obj.obj (dtb_u_u1289) in (dtb_u_u1288 (dtb_u_u1291 dtb_u_u1290))))))) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime dtb_u_u1267) dtb_u_u1270))) in (let dtb_u_u1292 = (dtb_u_u1284 dtb_u_u1275) in (let dtb_u_u1298 = Obj.obj ((((fun dtb_u_u1302 dtb_u_u1303 -> (Obj.repr ((fun (dtb_u_u1304 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1305 = Obj.obj (dtb_u_u1303) in (dtb_u_u1302 (dtb_u_u1305 dtb_u_u1304))))))) (fun (dtb_u_u1306 : int B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe 0) dtb_u_u1306))) ((B_dEffect_dFs.v_fsFileSize dtb_u_u1267) dtb_u_u1270))) in (let dtb_u_u1307 = (dtb_u_u1298 dtb_u_u1275) in (let dtb_u_u1309 = { Driver_dIface.f_SourceInfo_siPath = dtb_u_u1270; Driver_dIface.f_SourceInfo_siHash = (Driver_dIface.v_payloadDigest dtb_u_u1278); Driver_dIface.f_SourceInfo_siMtime = dtb_u_u1292; Driver_dIface.f_SourceInfo_siSize = dtb_u_u1307 } in dtb_u_u1309))))))))))

# 1366 "Vuna/Compiler/Driver/Compile.vuna"
let v_sourceInfoForPath_u_udirect = (fun (nFs : string) (path : string) _u_ueffTok -> (let dtb_u_u1278 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) path) _u_ueffTok) in (let dtb_u_u1284 = Obj.obj ((((fun dtb_u_u1288 dtb_u_u1289 -> (Obj.repr ((fun (dtb_u_u1290 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1291 = Obj.obj (dtb_u_u1289) in (dtb_u_u1288 (dtb_u_u1291 dtb_u_u1290))))))) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime nFs) path))) in (let dtb_u_u1292 = (dtb_u_u1284 _u_ueffTok) in (let dtb_u_u1298 = Obj.obj ((((fun dtb_u_u1302 dtb_u_u1303 -> (Obj.repr ((fun (dtb_u_u1304 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1305 = Obj.obj (dtb_u_u1303) in (dtb_u_u1302 (dtb_u_u1305 dtb_u_u1304))))))) (fun (dtb_u_u1306 : int B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe 0) dtb_u_u1306))) ((B_dEffect_dFs.v_fsFileSize nFs) path))) in (let dtb_u_u1307 = (dtb_u_u1298 _u_ueffTok) in (let dtb_u_u1309 = { Driver_dIface.f_SourceInfo_siPath = path; Driver_dIface.f_SourceInfo_siHash = (Driver_dIface.v_payloadDigest dtb_u_u1278); Driver_dIface.f_SourceInfo_siMtime = dtb_u_u1292; Driver_dIface.f_SourceInfo_siSize = dtb_u_u1307 } in dtb_u_u1309)))))))

# 1374 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolNowSec = (fun (dtb_u_u1311 : string) -> (Obj.repr ((fun (dtb_u_u1318 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1321 = ((B_dEffect_dClock.v_clockNow_u_udirect dtb_u_u1311) dtb_u_u1318) in (let dtb_u_u1323 = (if 1000000 = 0 then failwith "division by zero" else dtb_u_u1321 / 1000000) in dtb_u_u1323))))))

# 1374 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolNowSec_u_udirect = (fun (nClock : string) _u_ueffTok -> (let dtb_u_u1321 = ((B_dEffect_dClock.v_clockNow_u_udirect nClock) _u_ueffTok) in (let dtb_u_u1323 = (if 1000000 = 0 then failwith "division by zero" else dtb_u_u1321 / 1000000) in dtb_u_u1323)))

# 1382 "Vuna/Compiler/Driver/Compile.vuna"
let v_mtimeSafetyWindowSec = 5

# 1387 "Vuna/Compiler/Driver/Compile.vuna"
let v_sourceFresh = (fun (dtb_u_u1325 : string) (dtb_u_u1328 : int) (dtb_u_u1329 : Driver_dIface.t_SourceInfo) -> (let dtb_u_u1330 = (Driver_dIface.v_siPathOf dtb_u_u1329) in (Obj.repr ((fun (dtb_u_u1335 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1338 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u1325) dtb_u_u1330) dtb_u_u1335) in (if (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) dtb_u_u1338) false) then (let dtb_u_u1340 = false in dtb_u_u1340) else (let dtb_u_u1347 = Obj.obj ((((fun dtb_u_u1351 dtb_u_u1352 -> (Obj.repr ((fun (dtb_u_u1353 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1354 = Obj.obj (dtb_u_u1352) in (dtb_u_u1351 (dtb_u_u1354 dtb_u_u1353))))))) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime dtb_u_u1325) dtb_u_u1330))) in (let dtb_u_u1355 = (dtb_u_u1347 dtb_u_u1335) in (let dtb_u_u1361 = Obj.obj ((((fun dtb_u_u1365 dtb_u_u1366 -> (Obj.repr ((fun (dtb_u_u1367 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1368 = Obj.obj (dtb_u_u1366) in (dtb_u_u1365 (dtb_u_u1368 dtb_u_u1367))))))) (fun (dtb_u_u1369 : int B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe 0) dtb_u_u1369))) ((B_dEffect_dFs.v_fsFileSize dtb_u_u1325) dtb_u_u1330))) in (let dtb_u_u1370 = (dtb_u_u1361 dtb_u_u1335) in (if (if (if (dtb_u_u1355 = (Driver_dIface.v_siMtimeOf dtb_u_u1329)) then (dtb_u_u1370 = (Driver_dIface.v_siSizeOf dtb_u_u1329)) else false) then (((Driver_dIface.v_siMtimeOf dtb_u_u1329) + v_mtimeSafetyWindowSec) <= dtb_u_u1328) else false) then (let dtb_u_u1372 = true in dtb_u_u1372) else (let dtb_u_u1381 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u1325) dtb_u_u1330) dtb_u_u1335) in (let dtb_u_u1383 = ((Driver_dIface.v_payloadDigest dtb_u_u1381) = (Driver_dIface.v_siHashOf dtb_u_u1329)) in dtb_u_u1383))))))))))))))

# 1387 "Vuna/Compiler/Driver/Compile.vuna"
let v_sourceFresh_u_udirect = (fun (nFs : string) (builtSec : int) (si : Driver_dIface.t_SourceInfo) _u_ueffTok -> (let dtb_u_u1330 = (Driver_dIface.v_siPathOf si) in (let dtb_u_u1338 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) dtb_u_u1330) _u_ueffTok) in (if (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) dtb_u_u1338) false) then (let dtb_u_u1340 = false in dtb_u_u1340) else (let dtb_u_u1347 = Obj.obj ((((fun dtb_u_u1351 dtb_u_u1352 -> (Obj.repr ((fun (dtb_u_u1353 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1354 = Obj.obj (dtb_u_u1352) in (dtb_u_u1351 (dtb_u_u1354 dtb_u_u1353))))))) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime nFs) dtb_u_u1330))) in (let dtb_u_u1355 = (dtb_u_u1347 _u_ueffTok) in (let dtb_u_u1361 = Obj.obj ((((fun dtb_u_u1365 dtb_u_u1366 -> (Obj.repr ((fun (dtb_u_u1367 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1368 = Obj.obj (dtb_u_u1366) in (dtb_u_u1365 (dtb_u_u1368 dtb_u_u1367))))))) (fun (dtb_u_u1369 : int B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe 0) dtb_u_u1369))) ((B_dEffect_dFs.v_fsFileSize nFs) dtb_u_u1330))) in (let dtb_u_u1370 = (dtb_u_u1361 _u_ueffTok) in (if (if (if (dtb_u_u1355 = (Driver_dIface.v_siMtimeOf si)) then (dtb_u_u1370 = (Driver_dIface.v_siSizeOf si)) else false) then (((Driver_dIface.v_siMtimeOf si) + v_mtimeSafetyWindowSec) <= builtSec) else false) then (let dtb_u_u1372 = true in dtb_u_u1372) else (let dtb_u_u1381 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) dtb_u_u1330) _u_ueffTok) in (let dtb_u_u1383 = ((Driver_dIface.v_payloadDigest dtb_u_u1381) = (Driver_dIface.v_siHashOf si)) in dtb_u_u1383)))))))))))

# 1407 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_toolSessionFresh = (fun (dtb_u_u1385 : string) (dtb_u_u1388 : int) (dtb_u_u1389 : Driver_dIface.t_SourceInfo B_dData_dList.t_List) -> (match dtb_u_u1389 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1390, dtb_u_u1391) -> (Obj.repr ((fun (dtb_u_u1396 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1399 = ((((v_sourceFresh_u_udirect dtb_u_u1385) dtb_u_u1388) dtb_u_u1390) dtb_u_u1396) in (if dtb_u_u1399 then ((Obj.magic (((v_toolSessionFresh dtb_u_u1385) dtb_u_u1388) dtb_u_u1391)) dtb_u_u1396) else (let dtb_u_u1401 = false in dtb_u_u1401))))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u1404 = true in (Obj.repr ((fun (dtb_u_u1405 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u1404))))
  | _ -> failwith "DT: impossible branch"
))
# 1407 "Vuna/Compiler/Driver/Compile.vuna"
and v_toolSessionFresh_u_udirect = (fun (nFs : string) (mc0 : int) (mc1 : Driver_dIface.t_SourceInfo B_dData_dList.t_List) _u_ueffTok -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1390, dtb_u_u1391) -> (let dtb_u_u1399 = ((((v_sourceFresh_u_udirect nFs) mc0) dtb_u_u1390) _u_ueffTok) in (if dtb_u_u1399 then ((Obj.magic (((v_toolSessionFresh nFs) mc0) dtb_u_u1391)) _u_ueffTok) else (let dtb_u_u1401 = false in dtb_u_u1401)))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u1404 = true in dtb_u_u1404)
  | _ -> failwith "DT: impossible branch"
))

# 1456 "Vuna/Compiler/Driver/Compile.vuna"
let v_statOfClosureMod = (fun (dtb_u_u1406 : string) (dtb_u_u1409 : t_ClosureMod) -> (Obj.repr ((fun (dtb_u_u1414 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1415 = Obj.obj ((((fun dtb_u_u1419 dtb_u_u1420 -> (Obj.repr ((fun (dtb_u_u1421 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1422 = Obj.obj (dtb_u_u1420) in (dtb_u_u1419 (dtb_u_u1422 dtb_u_u1421))))))) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime dtb_u_u1406) (dtb_u_u1409).f_ClosureMod_cmPath))) in (let dtb_u_u1423 = (dtb_u_u1415 dtb_u_u1414) in (let dtb_u_u1429 = Obj.obj ((((fun dtb_u_u1433 dtb_u_u1434 -> (Obj.repr ((fun (dtb_u_u1435 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1436 = Obj.obj (dtb_u_u1434) in (dtb_u_u1433 (dtb_u_u1436 dtb_u_u1435))))))) (fun (dtb_u_u1437 : int B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe 0) dtb_u_u1437))) ((B_dEffect_dFs.v_fsFileSize dtb_u_u1406) (dtb_u_u1409).f_ClosureMod_cmPath))) in (let dtb_u_u1438 = (dtb_u_u1429 dtb_u_u1414) in (let dtb_u_u1440 = { Driver_dIface.f_SourceInfo_siPath = (dtb_u_u1409).f_ClosureMod_cmPath; Driver_dIface.f_SourceInfo_siHash = (dtb_u_u1409).f_ClosureMod_cmSrc; Driver_dIface.f_SourceInfo_siMtime = dtb_u_u1423; Driver_dIface.f_SourceInfo_siSize = dtb_u_u1438 } in dtb_u_u1440)))))))))

# 1456 "Vuna/Compiler/Driver/Compile.vuna"
let v_statOfClosureMod_u_udirect = (fun (nFs : string) (m : t_ClosureMod) _u_ueffTok -> (let dtb_u_u1415 = Obj.obj ((((fun dtb_u_u1419 dtb_u_u1420 -> (Obj.repr ((fun (dtb_u_u1421 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1422 = Obj.obj (dtb_u_u1420) in (dtb_u_u1419 (dtb_u_u1422 dtb_u_u1421))))))) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime nFs) (m).f_ClosureMod_cmPath))) in (let dtb_u_u1423 = (dtb_u_u1415 _u_ueffTok) in (let dtb_u_u1429 = Obj.obj ((((fun dtb_u_u1433 dtb_u_u1434 -> (Obj.repr ((fun (dtb_u_u1435 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1436 = Obj.obj (dtb_u_u1434) in (dtb_u_u1433 (dtb_u_u1436 dtb_u_u1435))))))) (fun (dtb_u_u1437 : int B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe 0) dtb_u_u1437))) ((B_dEffect_dFs.v_fsFileSize nFs) (m).f_ClosureMod_cmPath))) in (let dtb_u_u1438 = (dtb_u_u1429 _u_ueffTok) in (let dtb_u_u1440 = { Driver_dIface.f_SourceInfo_siPath = (m).f_ClosureMod_cmPath; Driver_dIface.f_SourceInfo_siHash = (m).f_ClosureMod_cmSrc; Driver_dIface.f_SourceInfo_siMtime = dtb_u_u1423; Driver_dIface.f_SourceInfo_siSize = dtb_u_u1438 } in dtb_u_u1440))))))

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

# 1603 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolCompilerFingerprint_u_udirect = (fun (nFs : string) (nEnv : string) _u_ueffTok -> ((Obj.magic ((v_compilerFingerprint nFs) nEnv)) _u_ueffTok))

# 1682 "Vuna/Compiler/Driver/Compile.vuna"
let v_elabFullRequested = (fun (dtb_u_u1452 : string) -> (Obj.repr ((fun (dtb_u_u1459 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1462 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect dtb_u_u1452) "VUNA_ELAB_FULL") dtb_u_u1459) in (let dtb_u_u1464 = (dtb_u_u1462 = "1") in dtb_u_u1464))))))

# 1682 "Vuna/Compiler/Driver/Compile.vuna"
let v_elabFullRequested_u_udirect = (fun (nEnv : string) _u_ueffTok -> (let dtb_u_u1462 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect nEnv) "VUNA_ELAB_FULL") _u_ueffTok) in (let dtb_u_u1464 = (dtb_u_u1462 = "1") in dtb_u_u1464)))

# 1690 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceAuditRequested = (fun (dtb_u_u1466 : string) -> (Obj.repr ((fun (dtb_u_u1473 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1476 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect dtb_u_u1466) "VUNA_IFACE_AUDIT") dtb_u_u1473) in (let dtb_u_u1478 = (dtb_u_u1476 = "1") in dtb_u_u1478))))))

# 1690 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceAuditRequested_u_udirect = (fun (nEnv : string) _u_ueffTok -> (let dtb_u_u1476 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect nEnv) "VUNA_IFACE_AUDIT") _u_ueffTok) in (let dtb_u_u1478 = (dtb_u_u1476 = "1") in dtb_u_u1478)))

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
let v_readOneModIface = (fun (dtb_u_u1493 : string) (dtb_u_u1494 : string) (dtb_u_u1495 : string) (dtb_u_u1500 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1501 : t_ClosureMod) -> (Obj.repr ((fun (dtb_u_u1506 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1509 = (((((v_readIfaceOfModEff_u_udirect dtb_u_u1493) dtb_u_u1494) dtb_u_u1500) dtb_u_u1501) dtb_u_u1506) in (let dtb_u_u1511 = { B_dData_dPair.f_Pair_first = dtb_u_u1501; B_dData_dPair.f_Pair_second = dtb_u_u1509 } in dtb_u_u1511))))))

# 1763 "Vuna/Compiler/Driver/Compile.vuna"
let v_readOneModIface_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (m : t_ClosureMod) _u_ueffTok -> (let dtb_u_u1509 = (((((v_readIfaceOfModEff_u_udirect nFs) nEnv) ctx) m) _u_ueffTok) in (let dtb_u_u1511 = { B_dData_dPair.f_Pair_first = m; B_dData_dPair.f_Pair_second = dtb_u_u1509 } in dtb_u_u1511)))

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
let v_ownCleanInfoWith = (fun (dtb_u_u1536 : string) (dtb_u_u1537 : string) (dtb_u_u1538 : string) (dtb_u_u1543 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1544 : t_ClosureMod B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u1549 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1552 = (((v_mapEff_u_udirect ((((v_readOneModIface dtb_u_u1536) dtb_u_u1537) dtb_u_u1538) dtb_u_u1543)) ((v_selfModsOf dtb_u_u1543) dtb_u_u1544)) dtb_u_u1549) in (let dtb_u_u1553 = ((B_dData_dList.v_map v_modNameOf) ((v_selfModsOf dtb_u_u1543) dtb_u_u1544)) in (let dtb_u_u1554 = (v_readIfaces dtb_u_u1552) in (let dtb_u_u1555 = ((B_dData_dList.v_filter (fun (dtb_u_u1560 : string) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName dtb_u_u1560) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) dtb_u_u1554))))) dtb_u_u1553) in (let dtb_u_u1556 = ((v_collectClean dtb_u_u1555) dtb_u_u1554) in (let dtb_u_u1558 = (if ((B_dData_dList.v_length dtb_u_u1556) = 0) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1556))) in dtb_u_u1558))))))))))

# 1776 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanInfoWith_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u1552 = (((v_mapEff_u_udirect ((((v_readOneModIface nFs) nEnv) nProcess) ctx)) ((v_selfModsOf ctx) mods)) _u_ueffTok) in (let dtb_u_u1553 = ((B_dData_dList.v_map v_modNameOf) ((v_selfModsOf ctx) mods)) in (let dtb_u_u1554 = (v_readIfaces dtb_u_u1552) in (let dtb_u_u1555 = ((B_dData_dList.v_filter (fun (dtb_u_u1560 : string) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName dtb_u_u1560) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) dtb_u_u1554))))) dtb_u_u1553) in (let dtb_u_u1556 = ((v_collectClean dtb_u_u1555) dtb_u_u1554) in (let dtb_u_u1558 = (if ((B_dData_dList.v_length dtb_u_u1556) = 0) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1556))) in dtb_u_u1558)))))))

# 1863 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanModulesWith = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> (((((v_ownCleanInfoWith nFs) nEnv) nProcess) ctx) mods))

# 1863 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanModulesWith_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) _u_ueffTok -> ((Obj.magic (((((v_ownCleanInfoWith nFs) nEnv) nProcess) ctx) mods)) _u_ueffTok))

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

# 1910 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceCompilerTag_u_udirect = (fun (nFs : string) (nEnv : string) _u_ueffTok -> ((Obj.magic ((Loader_dFingerprint.v_cacheTagEff nFs) nEnv)) _u_ueffTok))

# 929 "Vuna/Compiler/Driver/Compile.vuna"
let v_rootEnvHashOf = (fun (dtb_u_u1603 : string) (dtb_u_u1604 : string) (dtb_u_u1608 : string) -> (Obj.repr ((fun (dtb_u_u1613 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1614 = Obj.obj ((let dtb_u_u1617 = (dtb_u_u1608 ^ "/vuna.toml") in (Obj.repr ((fun (dtb_u_u1618 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u1617))))) in (let dtb_u_u1619 = (dtb_u_u1614 dtb_u_u1613) in (let dtb_u_u1627 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u1603) dtb_u_u1619) dtb_u_u1613) in (let dtb_u_u1633 = Obj.obj ((if dtb_u_u1627 then ((B_dEffect_dFs.v_fsReadFile dtb_u_u1603) dtb_u_u1619) else (let dtb_u_u1636 = "" in (Obj.repr ((fun (dtb_u_u1637 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u1636)))))) in (let dtb_u_u1638 = (dtb_u_u1633 dtb_u_u1613) in (let dtb_u_u1646 = (((v_ifaceCompilerTag_u_udirect dtb_u_u1603) dtb_u_u1604) dtb_u_u1613) in (let dtb_u_u1648 = (v_textHash (String.concat "" [(string_of_int (v_textHash dtb_u_u1638)); "|"; dtb_u_u1646; "|"])) in dtb_u_u1648)))))))))))

# 929 "Vuna/Compiler/Driver/Compile.vuna"
let v_rootEnvHashOf_u_udirect = (fun (nFs : string) (nEnv : string) (dir : string) _u_ueffTok -> (let dtb_u_u1614 = Obj.obj ((let dtb_u_u1617 = (dir ^ "/vuna.toml") in (Obj.repr ((fun (dtb_u_u1618 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u1617))))) in (let dtb_u_u1619 = (dtb_u_u1614 _u_ueffTok) in (let dtb_u_u1627 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) dtb_u_u1619) _u_ueffTok) in (let dtb_u_u1633 = Obj.obj ((if dtb_u_u1627 then ((B_dEffect_dFs.v_fsReadFile nFs) dtb_u_u1619) else (let dtb_u_u1636 = "" in (Obj.repr ((fun (dtb_u_u1637 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u1636)))))) in (let dtb_u_u1638 = (dtb_u_u1633 _u_ueffTok) in (let dtb_u_u1646 = (((v_ifaceCompilerTag_u_udirect nFs) nEnv) _u_ueffTok) in (let dtb_u_u1648 = (v_textHash (String.concat "" [(string_of_int (v_textHash dtb_u_u1638)); "|"; dtb_u_u1646; "|"])) in dtb_u_u1648))))))))

# 938 "Vuna/Compiler/Driver/Compile.vuna"
let v_rootPkgTableEff = (fun (dtb_u_u1650 : string) (dtb_u_u1651 : string) (dtb_u_u1655 : Frontend_dPackages_dPkg.t_PackageContext) -> ((v_mapEff (fun (dtb_u_u1656 : Frontend_dPackages_dPkg.t_Root) -> (Obj.repr ((fun (dtb_u_u1661 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1664 = ((((v_rootEnvHashOf_u_udirect dtb_u_u1650) dtb_u_u1651) (Frontend_dPackages_dPkg.v_rootDir dtb_u_u1656)) dtb_u_u1661) in (let dtb_u_u1666 = { f_PkgEntry_peName = (Frontend_dPackages_dPkg.v_rootName dtb_u_u1656); f_PkgEntry_peDir = (Frontend_dPackages_dPkg.v_rootDir dtb_u_u1656); f_PkgEntry_peKey = (v_pkgKeyOf (Frontend_dPackages_dPkg.v_rootName dtb_u_u1656)); f_PkgEntry_peEnv = (string_of_int dtb_u_u1664); f_PkgEntry_peImplicitPrelude = (Frontend_dPackages_dPkg.v_rootImplicitPrelude dtb_u_u1656) } in dtb_u_u1666))))))) (Frontend_dPackages_dPkg.v_contextRoots dtb_u_u1655)))

# 938 "Vuna/Compiler/Driver/Compile.vuna"
let v_rootPkgTableEff_u_udirect = (fun (nFs : string) (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) _u_ueffTok -> ((Obj.magic ((v_mapEff (fun (dtb_u_u1656 : Frontend_dPackages_dPkg.t_Root) -> (Obj.repr ((fun (dtb_u_u1661 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1664 = ((((v_rootEnvHashOf_u_udirect nFs) nEnv) (Frontend_dPackages_dPkg.v_rootDir dtb_u_u1656)) dtb_u_u1661) in (let dtb_u_u1666 = { f_PkgEntry_peName = (Frontend_dPackages_dPkg.v_rootName dtb_u_u1656); f_PkgEntry_peDir = (Frontend_dPackages_dPkg.v_rootDir dtb_u_u1656); f_PkgEntry_peKey = (v_pkgKeyOf (Frontend_dPackages_dPkg.v_rootName dtb_u_u1656)); f_PkgEntry_peEnv = (string_of_int dtb_u_u1664); f_PkgEntry_peImplicitPrelude = (Frontend_dPackages_dPkg.v_rootImplicitPrelude dtb_u_u1656) } in dtb_u_u1666))))))) (Frontend_dPackages_dPkg.v_contextRoots ctx))) _u_ueffTok))

# 955 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifacesForRootsEff = (fun (dtb_u_u1668 : string) (dtb_u_u1669 : string) (dtb_u_u1670 : string) (dtb_u_u1671 : string) (dtb_u_u1677 : Frontend_dPackages_dPkg.t_PackageContext) -> (Obj.repr ((fun (dtb_u_u1682 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1685 = ((((v_rootPkgTableEff_u_udirect dtb_u_u1668) dtb_u_u1670) dtb_u_u1677) dtb_u_u1682) in (let dtb_u_u1693 = (((((((v_ifaceModsWithEff_u_udirect dtb_u_u1668) dtb_u_u1669) dtb_u_u1670) dtb_u_u1671) dtb_u_u1677) dtb_u_u1685) dtb_u_u1682) in ((Obj.magic ((((v_readIfaceListInEff dtb_u_u1668) dtb_u_u1670) dtb_u_u1677) dtb_u_u1693)) dtb_u_u1682)))))))

# 955 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifacesForRootsEff_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) _u_ueffTok -> (let dtb_u_u1685 = ((((v_rootPkgTableEff_u_udirect nFs) nEnv) ctx) _u_ueffTok) in (let dtb_u_u1693 = (((((((v_ifaceModsWithEff_u_udirect nFs) nClock) nEnv) nProcess) ctx) dtb_u_u1685) _u_ueffTok) in ((Obj.magic ((((v_readIfaceListInEff nFs) nEnv) ctx) dtb_u_u1693)) _u_ueffTok))))

# 1332 "Vuna/Compiler/Driver/Compile.vuna"
let v_baseDepIfacesOf = (fun (dtb_u_u1694 : string) (dtb_u_u1695 : string) (dtb_u_u1696 : string) (dtb_u_u1697 : string) (dtb_u_u1703 : Frontend_dPackages_dPkg.t_PackageContext) -> (match (dtb_u_u1703).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1704) -> (let dtb_u_u1706 = B_dData_dMaybe.C_Maybe_Nothing in (Obj.repr ((fun (dtb_u_u1707 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u1706))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_ifacesForRootsEff dtb_u_u1694) dtb_u_u1695) dtb_u_u1696) dtb_u_u1697) dtb_u_u1703)
  | _ -> failwith "DT: impossible branch"
))

# 1332 "Vuna/Compiler/Driver/Compile.vuna"
let v_baseDepIfacesOf_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) _u_ueffTok -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1704) -> (let dtb_u_u1706 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u1706)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic (((((v_ifacesForRootsEff nFs) nClock) nEnv) nProcess) ctx)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))

# 1737 "Vuna/Compiler/Driver/Compile.vuna"
let v_packageEnvHash = (fun (dtb_u_u1708 : string) (dtb_u_u1709 : string) (dtb_u_u1710 : string) (dtb_u_u1715 : Frontend_dPackages_dPkg.t_PackageContext) -> (let dtb_u_u1716 = (v_textHash (v_manifestSemanticText (dtb_u_u1715).Frontend_dPackages_dPkg.f_PackageContext_contextPackage)) in (Obj.repr ((fun (dtb_u_u1721 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1724 = (((((v_depIdentitiesEff_u_udirect dtb_u_u1708) dtb_u_u1709) dtb_u_u1710) dtb_u_u1715) dtb_u_u1721) in (let dtb_u_u1732 = (((v_ifaceCompilerTag_u_udirect dtb_u_u1708) dtb_u_u1709) dtb_u_u1721) in (let dtb_u_u1734 = (v_textHash (String.concat "" [(string_of_int dtb_u_u1716); "|"; dtb_u_u1732; "|"; (v_joinLines ((B_dData_dList.v_map v_pairText) dtb_u_u1724))])) in dtb_u_u1734))))))))

# 1737 "Vuna/Compiler/Driver/Compile.vuna"
let v_packageEnvHash_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) _u_ueffTok -> (let dtb_u_u1716 = (v_textHash (v_manifestSemanticText (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage)) in (let dtb_u_u1724 = (((((v_depIdentitiesEff_u_udirect nFs) nEnv) nProcess) ctx) _u_ueffTok) in (let dtb_u_u1732 = (((v_ifaceCompilerTag_u_udirect nFs) nEnv) _u_ueffTok) in (let dtb_u_u1734 = (v_textHash (String.concat "" [(string_of_int dtb_u_u1716); "|"; dtb_u_u1732; "|"; (v_joinLines ((B_dData_dList.v_map v_pairText) dtb_u_u1724))])) in dtb_u_u1734)))))

# 732 "Vuna/Compiler/Driver/Compile.vuna"
let v_pkgTableEff = (fun (dtb_u_u1736 : string) (dtb_u_u1737 : string) (dtb_u_u1738 : string) (dtb_u_u1743 : Frontend_dPackages_dPkg.t_PackageContext) -> (Obj.repr ((fun (dtb_u_u1748 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1751 = (((((v_packageEnvHash_u_udirect dtb_u_u1736) dtb_u_u1737) dtb_u_u1738) dtb_u_u1743) dtb_u_u1748) in (let dtb_u_u1752 = { f_PkgEntry_peName = (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u1743); f_PkgEntry_peDir = (Frontend_dPackages_dPkg.v_contextDir dtb_u_u1743); f_PkgEntry_peKey = (v_pkgKeyOf (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u1743)); f_PkgEntry_peEnv = (string_of_int dtb_u_u1751); f_PkgEntry_peImplicitPrelude = (v_contextImplicitPrelude dtb_u_u1743) } in (let dtb_u_u1772 = (((v_mapEff_u_udirect (fun (dtb_u_u1760 : Frontend_dPackages_dPkg.t_Package) -> (Obj.repr ((fun (dtb_u_u1765 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1768 = (((((v_packageEnvHash_u_udirect dtb_u_u1736) dtb_u_u1737) dtb_u_u1738) (Frontend_dPackages_dPkg.v_packageContext dtb_u_u1760)) dtb_u_u1765) in (let dtb_u_u1770 = { f_PkgEntry_peName = (Frontend_dPackages_dPkg.v_packageName dtb_u_u1760); f_PkgEntry_peDir = (Frontend_dPackages_dPkg.v_packageDir dtb_u_u1760); f_PkgEntry_peKey = (v_pkgKeyOf (Frontend_dPackages_dPkg.v_packageName dtb_u_u1760)); f_PkgEntry_peEnv = (string_of_int dtb_u_u1768); f_PkgEntry_peImplicitPrelude = (Frontend_dPackages_dPkg.v_packageImplicitPrelude dtb_u_u1760) } in dtb_u_u1770))))))) (v_depPackageList dtb_u_u1743)) dtb_u_u1748) in (let dtb_u_u1774 = (B_dData_dList.C_List__x58__x58_ (dtb_u_u1752, dtb_u_u1772)) in dtb_u_u1774))))))))

# 732 "Vuna/Compiler/Driver/Compile.vuna"
let v_pkgTableEff_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) _u_ueffTok -> (let dtb_u_u1751 = (((((v_packageEnvHash_u_udirect nFs) nEnv) nProcess) ctx) _u_ueffTok) in (let dtb_u_u1752 = { f_PkgEntry_peName = (Frontend_dPackages_dPkg.v_contextPackageName ctx); f_PkgEntry_peDir = (Frontend_dPackages_dPkg.v_contextDir ctx); f_PkgEntry_peKey = (v_pkgKeyOf (Frontend_dPackages_dPkg.v_contextPackageName ctx)); f_PkgEntry_peEnv = (string_of_int dtb_u_u1751); f_PkgEntry_peImplicitPrelude = (v_contextImplicitPrelude ctx) } in (let dtb_u_u1772 = (((v_mapEff_u_udirect (fun (dtb_u_u1760 : Frontend_dPackages_dPkg.t_Package) -> (Obj.repr ((fun (dtb_u_u1765 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1768 = (((((v_packageEnvHash_u_udirect nFs) nEnv) nProcess) (Frontend_dPackages_dPkg.v_packageContext dtb_u_u1760)) dtb_u_u1765) in (let dtb_u_u1770 = { f_PkgEntry_peName = (Frontend_dPackages_dPkg.v_packageName dtb_u_u1760); f_PkgEntry_peDir = (Frontend_dPackages_dPkg.v_packageDir dtb_u_u1760); f_PkgEntry_peKey = (v_pkgKeyOf (Frontend_dPackages_dPkg.v_packageName dtb_u_u1760)); f_PkgEntry_peEnv = (string_of_int dtb_u_u1768); f_PkgEntry_peImplicitPrelude = (Frontend_dPackages_dPkg.v_packageImplicitPrelude dtb_u_u1760) } in dtb_u_u1770))))))) (v_depPackageList ctx)) _u_ueffTok) in (let dtb_u_u1774 = (B_dData_dList.C_List__x58__x58_ (dtb_u_u1752, dtb_u_u1772)) in dtb_u_u1774)))))

# 881 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceModsEff = (fun (dtb_u_u1776 : string) (dtb_u_u1777 : string) (dtb_u_u1778 : string) (dtb_u_u1779 : string) (dtb_u_u1785 : Frontend_dPackages_dPkg.t_PackageContext) -> (Obj.repr ((fun (dtb_u_u1790 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1793 = (((((v_pkgTableEff_u_udirect dtb_u_u1776) dtb_u_u1778) dtb_u_u1779) dtb_u_u1785) dtb_u_u1790) in ((Obj.magic ((((((v_ifaceModsWithEff dtb_u_u1776) dtb_u_u1777) dtb_u_u1778) dtb_u_u1779) dtb_u_u1785) dtb_u_u1793)) dtb_u_u1790))))))

# 881 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceModsEff_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) _u_ueffTok -> (let dtb_u_u1793 = (((((v_pkgTableEff_u_udirect nFs) nEnv) nProcess) ctx) _u_ueffTok) in ((Obj.magic ((((((v_ifaceModsWithEff nFs) nClock) nEnv) nProcess) ctx) dtb_u_u1793)) _u_ueffTok)))

# 909 "Vuna/Compiler/Driver/Compile.vuna"
let v_summaryClosureMods = (fun (dtb_u_u1794 : string) (dtb_u_u1795 : string) (dtb_u_u1796 : string) (dtb_u_u1797 : string) (dtb_u_u1803 : Frontend_dPackages_dPkg.t_PackageContext) -> (match (dtb_u_u1803).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u1805 = B_dData_dList.C_List_Nil in (Obj.repr ((fun (dtb_u_u1806 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u1805))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1807) -> (((((v_ifaceModsEff dtb_u_u1794) dtb_u_u1795) dtb_u_u1796) dtb_u_u1797) dtb_u_u1803)
  | _ -> failwith "DT: impossible branch"
))

# 909 "Vuna/Compiler/Driver/Compile.vuna"
let v_summaryClosureMods_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) _u_ueffTok -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u1805 = B_dData_dList.C_List_Nil in dtb_u_u1805)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1807) -> ((Obj.magic (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))

# 948 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifacesForContextEff = (fun (dtb_u_u1808 : string) (dtb_u_u1809 : string) (dtb_u_u1810 : string) (dtb_u_u1811 : string) (dtb_u_u1817 : Frontend_dPackages_dPkg.t_PackageContext) -> (Obj.repr ((fun (dtb_u_u1822 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1825 = ((((((v_ifaceModsEff_u_udirect dtb_u_u1808) dtb_u_u1809) dtb_u_u1810) dtb_u_u1811) dtb_u_u1817) dtb_u_u1822) in ((Obj.magic ((((v_readIfaceListInEff dtb_u_u1808) dtb_u_u1810) dtb_u_u1817) dtb_u_u1825)) dtb_u_u1822))))))

# 948 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifacesForContextEff_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) _u_ueffTok -> (let dtb_u_u1825 = ((((((v_ifaceModsEff_u_udirect nFs) nClock) nEnv) nProcess) ctx) _u_ueffTok) in ((Obj.magic ((((v_readIfaceListInEff nFs) nEnv) ctx) dtb_u_u1825)) _u_ueffTok)))

# 1301 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForToolSource = (fun (dtb_u_u1826 : string) (dtb_u_u1827 : string) (dtb_u_u1828 : string) (dtb_u_u1829 : string) (dtb_u_u1835 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1836 : string) (dtb_u_u1837 : string) -> (Obj.repr ((fun (dtb_u_u1842 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1845 = ((v_toolEnabled_u_udirect dtb_u_u1828) dtb_u_u1842) in (if dtb_u_u1845 then (let dtb_u_u1853 = ((((((v_ifaceModsEff_u_udirect dtb_u_u1826) dtb_u_u1827) dtb_u_u1828) dtb_u_u1829) dtb_u_u1835) dtb_u_u1842) in (let dtb_u_u1861 = (((((((v_toolImportsOfSource_u_udirect dtb_u_u1826) dtb_u_u1828) dtb_u_u1829) dtb_u_u1835) dtb_u_u1836) dtb_u_u1837) dtb_u_u1842) in (let dtb_u_u1862 = ((v_importClosureOf dtb_u_u1853) dtb_u_u1861) in (let dtb_u_u1863 = (((v_toolDepModsOf dtb_u_u1835) dtb_u_u1853) dtb_u_u1862) in (let dtb_u_u1864 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("tool-closure modules=" ^ (string_of_int (B_dData_dList.v_length dtb_u_u1863)))) else 0) in ((Obj.magic ((((v_readIfaceListInEff dtb_u_u1826) dtb_u_u1828) dtb_u_u1835) dtb_u_u1863)) dtb_u_u1842)))))) else (let dtb_u_u1866 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u1866)))))))

# 1301 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForToolSource_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) _u_ueffTok -> (let dtb_u_u1845 = ((v_toolEnabled_u_udirect nEnv) _u_ueffTok) in (if dtb_u_u1845 then (let dtb_u_u1853 = ((((((v_ifaceModsEff_u_udirect nFs) nClock) nEnv) nProcess) ctx) _u_ueffTok) in (let dtb_u_u1861 = (((((((v_toolImportsOfSource_u_udirect nFs) nEnv) nProcess) ctx) label) source) _u_ueffTok) in (let dtb_u_u1862 = ((v_importClosureOf dtb_u_u1853) dtb_u_u1861) in (let dtb_u_u1863 = (((v_toolDepModsOf ctx) dtb_u_u1853) dtb_u_u1862) in (let dtb_u_u1864 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("tool-closure modules=" ^ (string_of_int (B_dData_dList.v_length dtb_u_u1863)))) else 0) in ((Obj.magic ((((v_readIfaceListInEff nFs) nEnv) ctx) dtb_u_u1863)) _u_ueffTok)))))) else (let dtb_u_u1866 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u1866))))

# 1319 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForToolProgram = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) -> (((((((v_depIfacesForToolSource nFs) nClock) nEnv) nProcess) ctx) "<repl>") program))

# 1319 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForToolProgram_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) _u_ueffTok -> ((Obj.magic (((((((v_depIfacesForToolSource nFs) nClock) nEnv) nProcess) ctx) "<repl>") program)) _u_ueffTok))

# 1415 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolNeededOfImports = (fun (dtb_u_u1879 : string) (dtb_u_u1880 : string) (dtb_u_u1881 : string) (dtb_u_u1882 : string) (dtb_u_u1888 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1889 : t_ToolContext) (dtb_u_u1890 : string) (dtb_u_u1891 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u1896 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1899 = ((((((v_ifaceModsEff_u_udirect dtb_u_u1879) dtb_u_u1880) dtb_u_u1881) dtb_u_u1882) dtb_u_u1888) dtb_u_u1896) in (let dtb_u_u1907 = (((((v_toolImportNamesOf_u_udirect dtb_u_u1879) dtb_u_u1888) dtb_u_u1890) dtb_u_u1891) dtb_u_u1896) in (let dtb_u_u1909 = ((v_importClosureOf dtb_u_u1899) dtb_u_u1907) in dtb_u_u1909)))))))

# 1415 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolNeededOfImports_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (tool : t_ToolContext) (currentName : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u1899 = ((((((v_ifaceModsEff_u_udirect nFs) nClock) nEnv) nProcess) ctx) _u_ueffTok) in (let dtb_u_u1907 = (((((v_toolImportNamesOf_u_udirect nFs) ctx) currentName) imports) _u_ueffTok) in (let dtb_u_u1909 = ((v_importClosureOf dtb_u_u1899) dtb_u_u1907) in dtb_u_u1909))))

# 1424 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForToolSourceDetailed = (fun (dtb_u_u1911 : string) (dtb_u_u1912 : string) (dtb_u_u1913 : string) (dtb_u_u1914 : string) (dtb_u_u1920 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1921 : string) (dtb_u_u1922 : string) -> (Obj.repr ((fun (dtb_u_u1927 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1930 = ((v_toolEnabled_u_udirect dtb_u_u1913) dtb_u_u1927) in (if dtb_u_u1930 then (let dtb_u_u1938 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.tool.ifaces.lookup") dtb_u_u1927) in (let dtb_u_u1946 = ((((((v_ifaceModsEff_u_udirect dtb_u_u1911) dtb_u_u1912) dtb_u_u1913) dtb_u_u1914) dtb_u_u1920) dtb_u_u1927) in (let dtb_u_u1954 = (((((((v_toolImportsOfSource_u_udirect dtb_u_u1911) dtb_u_u1913) dtb_u_u1914) dtb_u_u1920) dtb_u_u1921) dtb_u_u1922) dtb_u_u1927) in (let dtb_u_u1955 = ((v_importClosureOf dtb_u_u1946) dtb_u_u1954) in (let dtb_u_u1956 = (((v_toolDepModsOf dtb_u_u1920) dtb_u_u1946) dtb_u_u1955) in (let dtb_u_u1957 = ((B_dData_dList.v_map v_modHashPair) dtb_u_u1956) in (let dtb_u_u1958 = ((B_dData_dList.v_map v_modNameOf) ((v_selfModsOf dtb_u_u1920) dtb_u_u1946)) in (let dtb_u_u1959 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("tool-closure modules=" ^ (string_of_int (B_dData_dList.v_length dtb_u_u1956)))) else 0) in (let dtb_u_u1967 = (((((v_readIfaceListInEff_u_udirect dtb_u_u1911) dtb_u_u1913) dtb_u_u1920) dtb_u_u1956) dtb_u_u1927) in (match dtb_u_u1967 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u1975 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.tool.ifaces.missing") dtb_u_u1927) in (let dtb_u_u1977 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u1977))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1979) -> (let dtb_u_u1987 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.tool.ifaces.ready") dtb_u_u1927) in (let dtb_u_u1995 = (((v_mapEff_u_udirect (v_statOfClosureMod dtb_u_u1911)) dtb_u_u1956) dtb_u_u1927) in (let dtb_u_u1997 = (B_dData_dMaybe.C_Maybe_Just ({ f_ToolContext_tcDepIfaces = dtb_u_u1979; f_ToolContext_tcDepHashes = dtb_u_u1957; f_ToolContext_tcNeeded = dtb_u_u1955; f_ToolContext_tcOwnNames = dtb_u_u1958; f_ToolContext_tcStats = dtb_u_u1995 })) in dtb_u_u1997)))
  | _ -> failwith "DT: impossible branch"
)))))))))) else (let dtb_u_u2006 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.tool.ifaces.disabled") dtb_u_u1927) in (let dtb_u_u2008 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u2008))))))))

# 1424 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForToolSourceDetailed_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) _u_ueffTok -> (let dtb_u_u1930 = ((v_toolEnabled_u_udirect nEnv) _u_ueffTok) in (if dtb_u_u1930 then (let dtb_u_u1938 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.tool.ifaces.lookup") _u_ueffTok) in (let dtb_u_u1946 = ((((((v_ifaceModsEff_u_udirect nFs) nClock) nEnv) nProcess) ctx) _u_ueffTok) in (let dtb_u_u1954 = (((((((v_toolImportsOfSource_u_udirect nFs) nEnv) nProcess) ctx) label) source) _u_ueffTok) in (let dtb_u_u1955 = ((v_importClosureOf dtb_u_u1946) dtb_u_u1954) in (let dtb_u_u1956 = (((v_toolDepModsOf ctx) dtb_u_u1946) dtb_u_u1955) in (let dtb_u_u1957 = ((B_dData_dList.v_map v_modHashPair) dtb_u_u1956) in (let dtb_u_u1958 = ((B_dData_dList.v_map v_modNameOf) ((v_selfModsOf ctx) dtb_u_u1946)) in (let dtb_u_u1959 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("tool-closure modules=" ^ (string_of_int (B_dData_dList.v_length dtb_u_u1956)))) else 0) in (let dtb_u_u1967 = (((((v_readIfaceListInEff_u_udirect nFs) nEnv) ctx) dtb_u_u1956) _u_ueffTok) in (match dtb_u_u1967 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u1975 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.tool.ifaces.missing") _u_ueffTok) in (let dtb_u_u1977 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u1977))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1979) -> (let dtb_u_u1987 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.tool.ifaces.ready") _u_ueffTok) in (let dtb_u_u1995 = (((v_mapEff_u_udirect (v_statOfClosureMod nFs)) dtb_u_u1956) _u_ueffTok) in (let dtb_u_u1997 = (B_dData_dMaybe.C_Maybe_Just ({ f_ToolContext_tcDepIfaces = dtb_u_u1979; f_ToolContext_tcDepHashes = dtb_u_u1957; f_ToolContext_tcNeeded = dtb_u_u1955; f_ToolContext_tcOwnNames = dtb_u_u1958; f_ToolContext_tcStats = dtb_u_u1995 })) in dtb_u_u1997)))
  | _ -> failwith "DT: impossible branch"
)))))))))) else (let dtb_u_u2006 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.tool.ifaces.disabled") _u_ueffTok) in (let dtb_u_u2008 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u2008)))))

# 1570 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeModuleIfaceGuarded = (fun (dtb_u_u2010 : string) (dtb_u_u2011 : string) (dtb_u_u2012 : string) (dtb_u_u2013 : string) (dtb_u_u2019 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2020 : Driver_dIface.t_ModuleIface) -> (if ((Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u2019) = "") then (let dtb_u_u2022 = 0 in (Obj.repr ((fun (dtb_u_u2023 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u2022)))) else (Obj.repr ((fun (dtb_u_u2028 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2031 = ((((((v_ifaceModsEff_u_udirect dtb_u_u2010) dtb_u_u2011) dtb_u_u2012) dtb_u_u2013) dtb_u_u2019) dtb_u_u2028) in (match ((v_findClosureMod (Driver_dIface.v_miNameOf dtb_u_u2020)) dtb_u_u2031) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u2033 = 0 in dtb_u_u2033)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2035) -> (let dtb_u_u2043 = ((((v_ownIfaceDirEff_u_udirect dtb_u_u2010) dtb_u_u2012) dtb_u_u2019) dtb_u_u2028) in (let dtb_u_u2051 = ((((Base_dObs.v_obsSpanEff_u_udirect "vuna.cache.write") "vuna.cache") (((((Base_dStore.v_storeWriteIfChangedEff dtb_u_u2010) (Base_dStore.v_storeObjectTag "module-iface")) v_ifaceObjectCodec) (String.concat "" [dtb_u_u2043; "/"; (dtb_u_u2035).f_ClosureMod_cmAddr])) (Driver_dIface.v_encModuleIface dtb_u_u2020))) dtb_u_u2028) in (let dtb_u_u2053 = 0 in dtb_u_u2053)))
  | _ -> failwith "DT: impossible branch"
)))))))

# 1570 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeModuleIfaceGuarded_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mi : Driver_dIface.t_ModuleIface) _u_ueffTok -> (if ((Frontend_dPackages_dPkg.v_contextPackageName ctx) = "") then (let dtb_u_u2022 = 0 in dtb_u_u2022) else (let dtb_u_u2031 = ((((((v_ifaceModsEff_u_udirect nFs) nClock) nEnv) nProcess) ctx) _u_ueffTok) in (match ((v_findClosureMod (Driver_dIface.v_miNameOf mi)) dtb_u_u2031) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u2033 = 0 in dtb_u_u2033)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2035) -> (let dtb_u_u2043 = ((((v_ownIfaceDirEff_u_udirect nFs) nEnv) ctx) _u_ueffTok) in (let dtb_u_u2051 = ((((Base_dObs.v_obsSpanEff_u_udirect "vuna.cache.write") "vuna.cache") (((((Base_dStore.v_storeWriteIfChangedEff nFs) (Base_dStore.v_storeObjectTag "module-iface")) v_ifaceObjectCodec) (String.concat "" [dtb_u_u2043; "/"; (dtb_u_u2035).f_ClosureMod_cmAddr])) (Driver_dIface.v_encModuleIface mi))) _u_ueffTok) in (let dtb_u_u2053 = 0 in dtb_u_u2053)))
  | _ -> failwith "DT: impossible branch"
))))

# 1555 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolWriteModuleIface = (fun (dtb_u_u2055 : string) (dtb_u_u2056 : string) (dtb_u_u2057 : string) (dtb_u_u2058 : string) (dtb_u_u2064 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2065 : t_ToolContext) (dtb_u_u2066 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u2067 : Driver_dDt.t_CheckedPackage) (dtb_u_u2068 : string) (dtb_u_u2069 : Driver_dIface.t_SourceInfo) -> (let dtb_u_u2070 = (v_ifaceLocNorm dtb_u_u2064) in (let dtb_u_u2071 = ((((((((((Driver_dIface.v_ifaceOfModule (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u2064)) dtb_u_u2069) (dtb_u_u2065).f_ToolContext_tcDepHashes) (dtb_u_u2067).Driver_dDt.f_CheckedPackage_checkedInherited) dtb_u_u2066) (dtb_u_u2067).Driver_dDt.f_CheckedPackage_checkedModules) (dtb_u_u2067).Driver_dDt.f_CheckedPackage_checkedEntryDecls) (dtb_u_u2067).Driver_dDt.f_CheckedPackage_checkedProgram) dtb_u_u2070) dtb_u_u2068) in (match dtb_u_u2071 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2072) -> (let dtb_u_u2074 = (Base_dDiag.C_Check_ErrC (dtb_u_u2072)) in (Obj.repr ((fun (dtb_u_u2075 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u2074))))
  | Base_dDiag.C_Check_OkC (dtb_u_u2076) -> (Obj.repr ((fun (dtb_u_u2081 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2084 = (((((((v_writeModuleIfaceGuarded_u_udirect dtb_u_u2055) dtb_u_u2056) dtb_u_u2057) dtb_u_u2058) dtb_u_u2064) dtb_u_u2076) dtb_u_u2081) in (let dtb_u_u2086 = (Base_dDiag.C_Check_OkC (dtb_u_u2076)) in dtb_u_u2086)))))
  | _ -> failwith "DT: impossible branch"
))))

# 1555 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolWriteModuleIface_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (tool : t_ToolContext) (clean : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (checked : Driver_dDt.t_CheckedPackage) (name : string) (si : Driver_dIface.t_SourceInfo) _u_ueffTok -> (let dtb_u_u2070 = (v_ifaceLocNorm ctx) in (let dtb_u_u2071 = ((((((((((Driver_dIface.v_ifaceOfModule (Frontend_dPackages_dPkg.v_contextPackageName ctx)) si) (tool).f_ToolContext_tcDepHashes) (checked).Driver_dDt.f_CheckedPackage_checkedInherited) clean) (checked).Driver_dDt.f_CheckedPackage_checkedModules) (checked).Driver_dDt.f_CheckedPackage_checkedEntryDecls) (checked).Driver_dDt.f_CheckedPackage_checkedProgram) dtb_u_u2070) name) in (match dtb_u_u2071 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2072) -> (let dtb_u_u2074 = (Base_dDiag.C_Check_ErrC (dtb_u_u2072)) in dtb_u_u2074)
  | Base_dDiag.C_Check_OkC (dtb_u_u2076) -> (let dtb_u_u2084 = (((((((v_writeModuleIfaceGuarded_u_udirect nFs) nClock) nEnv) nProcess) ctx) dtb_u_u2076) _u_ueffTok) in (let dtb_u_u2086 = (Base_dDiag.C_Check_OkC (dtb_u_u2076)) in dtb_u_u2086))
  | _ -> failwith "DT: impossible branch"
))))

# 1726 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfaceHashTable = (fun (dtb_u_u2088 : string) (dtb_u_u2089 : string) (dtb_u_u2090 : string) (dtb_u_u2091 : string) (dtb_u_u2097 : Frontend_dPackages_dPkg.t_PackageContext) -> (Obj.repr ((fun (dtb_u_u2102 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2105 = ((((((v_ifaceModsEff_u_udirect dtb_u_u2088) dtb_u_u2089) dtb_u_u2090) dtb_u_u2091) dtb_u_u2097) dtb_u_u2102) in (let dtb_u_u2107 = ((B_dData_dList.v_map v_modHashPair) ((v_depModsOf dtb_u_u2097) dtb_u_u2105)) in dtb_u_u2107))))))

# 1726 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfaceHashTable_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) _u_ueffTok -> (let dtb_u_u2105 = ((((((v_ifaceModsEff_u_udirect nFs) nClock) nEnv) nProcess) ctx) _u_ueffTok) in (let dtb_u_u2107 = ((B_dData_dList.v_map v_modHashPair) ((v_depModsOf ctx) dtb_u_u2105)) in dtb_u_u2107)))

# 1769 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanInfo = (fun (dtb_u_u2109 : string) (dtb_u_u2110 : string) (dtb_u_u2111 : string) (dtb_u_u2112 : string) (dtb_u_u2118 : Frontend_dPackages_dPkg.t_PackageContext) -> (Obj.repr ((fun (dtb_u_u2123 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2126 = ((((((v_ifaceModsEff_u_udirect dtb_u_u2109) dtb_u_u2110) dtb_u_u2111) dtb_u_u2112) dtb_u_u2118) dtb_u_u2123) in ((Obj.magic (((((v_ownCleanInfoWith dtb_u_u2109) dtb_u_u2111) dtb_u_u2112) dtb_u_u2118) dtb_u_u2126)) dtb_u_u2123))))))

# 1769 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanInfo_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) _u_ueffTok -> (let dtb_u_u2126 = ((((((v_ifaceModsEff_u_udirect nFs) nClock) nEnv) nProcess) ctx) _u_ueffTok) in ((Obj.magic (((((v_ownCleanInfoWith nFs) nEnv) nProcess) ctx) dtb_u_u2126)) _u_ueffTok)))

# 1835 "Vuna/Compiler/Driver/Compile.vuna"
let v_explainContextEff = (fun (dtb_u_u2127 : string) (dtb_u_u2128 : string) (dtb_u_u2129 : string) (dtb_u_u2130 : string) (dtb_u_u2136 : Frontend_dPackages_dPkg.t_PackageContext) -> (Obj.repr ((fun (dtb_u_u2141 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2144 = ((((((v_ifaceModsEff_u_udirect dtb_u_u2127) dtb_u_u2128) dtb_u_u2129) dtb_u_u2130) dtb_u_u2136) dtb_u_u2141) in (let dtb_u_u2152 = (((v_mapEff_u_udirect ((((v_readOneModIface dtb_u_u2127) dtb_u_u2129) dtb_u_u2130) dtb_u_u2136)) ((v_selfModsOf dtb_u_u2136) dtb_u_u2144)) dtb_u_u2141) in (let dtb_u_u2153 = ((v_selfModsOf dtb_u_u2136) dtb_u_u2144) in (let dtb_u_u2154 = ((B_dData_dList.v_map v_modNameOf) dtb_u_u2153) in (let dtb_u_u2155 = (v_readIfaces dtb_u_u2152) in (let dtb_u_u2156 = ((B_dData_dList.v_map Driver_dIface.v_miNameOf) dtb_u_u2155) in (let dtb_u_u2157 = ((B_dData_dList.v_filter (fun (dtb_u_u2173 : string) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName dtb_u_u2173) dtb_u_u2156)))) dtb_u_u2154) in (let dtb_u_u2158 = (((v_dirtyFix ((B_dData_dList.v_length dtb_u_u2155) + 1)) B_dData_dList.C_List_Nil) dtb_u_u2155) in (let dtb_u_u2159 = ((B_dData_dList.v_filter (fun (dtb_u_u2172 : string) -> (if (B_dData_dBool.v_not ((B_dData_dList.v_memName dtb_u_u2172) dtb_u_u2157)) then (B_dData_dBool.v_not ((B_dData_dList.v_memName dtb_u_u2172) dtb_u_u2158)) else false))) dtb_u_u2154) in (let dtb_u_u2160 = ((B_dData_dList.v_filter (fun (dtb_u_u2171 : string) -> ((B_dData_dList.v_memName dtb_u_u2171) dtb_u_u2158))) dtb_u_u2154) in (let dtb_u_u2161 = (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u2136) in (let dtb_u_u2162 = ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u2168 : string) -> (String.concat "" ["explain "; dtb_u_u2161; " "; ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) dtb_u_u2168); " hit"]))) dtb_u_u2159)) ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u2169 : string) -> (String.concat "" ["explain "; dtb_u_u2161; " "; ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) dtb_u_u2169); " stale:no-iface"]))) dtb_u_u2157)) ((B_dData_dList.v_map (fun (dtb_u_u2170 : string) -> (String.concat "" ["explain "; dtb_u_u2161; " "; ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) dtb_u_u2170); " stale:reexport-dirty"]))) dtb_u_u2160))) in (let dtb_u_u2164 = ((B_dData_dSort.v_sortBy (fun (dtb_u_u2166 : string) (dtb_u_u2167 : string) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_u5afb3bbeddafcb50_uString) dtb_u_u2166) dtb_u_u2167))) dtb_u_u2162) in dtb_u_u2164)))))))))))))))))

# 1835 "Vuna/Compiler/Driver/Compile.vuna"
let v_explainContextEff_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) _u_ueffTok -> (let dtb_u_u2144 = ((((((v_ifaceModsEff_u_udirect nFs) nClock) nEnv) nProcess) ctx) _u_ueffTok) in (let dtb_u_u2152 = (((v_mapEff_u_udirect ((((v_readOneModIface nFs) nEnv) nProcess) ctx)) ((v_selfModsOf ctx) dtb_u_u2144)) _u_ueffTok) in (let dtb_u_u2153 = ((v_selfModsOf ctx) dtb_u_u2144) in (let dtb_u_u2154 = ((B_dData_dList.v_map v_modNameOf) dtb_u_u2153) in (let dtb_u_u2155 = (v_readIfaces dtb_u_u2152) in (let dtb_u_u2156 = ((B_dData_dList.v_map Driver_dIface.v_miNameOf) dtb_u_u2155) in (let dtb_u_u2157 = ((B_dData_dList.v_filter (fun (dtb_u_u2173 : string) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName dtb_u_u2173) dtb_u_u2156)))) dtb_u_u2154) in (let dtb_u_u2158 = (((v_dirtyFix ((B_dData_dList.v_length dtb_u_u2155) + 1)) B_dData_dList.C_List_Nil) dtb_u_u2155) in (let dtb_u_u2159 = ((B_dData_dList.v_filter (fun (dtb_u_u2172 : string) -> (if (B_dData_dBool.v_not ((B_dData_dList.v_memName dtb_u_u2172) dtb_u_u2157)) then (B_dData_dBool.v_not ((B_dData_dList.v_memName dtb_u_u2172) dtb_u_u2158)) else false))) dtb_u_u2154) in (let dtb_u_u2160 = ((B_dData_dList.v_filter (fun (dtb_u_u2171 : string) -> ((B_dData_dList.v_memName dtb_u_u2171) dtb_u_u2158))) dtb_u_u2154) in (let dtb_u_u2161 = (Frontend_dPackages_dPkg.v_contextPackageName ctx) in (let dtb_u_u2162 = ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u2168 : string) -> (String.concat "" ["explain "; dtb_u_u2161; " "; ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) dtb_u_u2168); " hit"]))) dtb_u_u2159)) ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u2169 : string) -> (String.concat "" ["explain "; dtb_u_u2161; " "; ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) dtb_u_u2169); " stale:no-iface"]))) dtb_u_u2157)) ((B_dData_dList.v_map (fun (dtb_u_u2170 : string) -> (String.concat "" ["explain "; dtb_u_u2161; " "; ((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) dtb_u_u2170); " stale:reexport-dirty"]))) dtb_u_u2160))) in (let dtb_u_u2164 = ((B_dData_dSort.v_sortBy (fun (dtb_u_u2166 : string) (dtb_u_u2167 : string) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_u5afb3bbeddafcb50_uString) dtb_u_u2166) dtb_u_u2167))) dtb_u_u2162) in dtb_u_u2164))))))))))))))

# 1853 "Vuna/Compiler/Driver/Compile.vuna"
let v_explainPackageEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (pkg : Frontend_dPackages_dPkg.t_Package) -> (((((v_explainContextEff nFs) nClock) nEnv) nProcess) (Frontend_dPackages_dPkg.v_packageContext pkg)))

# 1853 "Vuna/Compiler/Driver/Compile.vuna"
let v_explainPackageEff_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (pkg : Frontend_dPackages_dPkg.t_Package) _u_ueffTok -> ((Obj.magic (((((v_explainContextEff nFs) nClock) nEnv) nProcess) (Frontend_dPackages_dPkg.v_packageContext pkg))) _u_ueffTok))

# 1856 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanModules = (fun (dtb_u_u2184 : string) (dtb_u_u2185 : string) (dtb_u_u2186 : string) (dtb_u_u2187 : string) (dtb_u_u2193 : Frontend_dPackages_dPkg.t_PackageContext) -> (Obj.repr ((fun (dtb_u_u2198 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2201 = ((((((v_ownCleanInfo_u_udirect dtb_u_u2184) dtb_u_u2185) dtb_u_u2186) dtb_u_u2187) dtb_u_u2193) dtb_u_u2198) in (let dtb_u_u2203 = dtb_u_u2201 in dtb_u_u2203))))))

# 1856 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownCleanModules_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) _u_ueffTok -> (let dtb_u_u2201 = ((((((v_ownCleanInfo_u_udirect nFs) nClock) nEnv) nProcess) ctx) _u_ueffTok) in (let dtb_u_u2203 = dtb_u_u2201 in dtb_u_u2203)))

# 1869 "Vuna/Compiler/Driver/Compile.vuna"
let v_cleanIfacesOrEmpty = (fun (dtb_u_u2205 : string) (dtb_u_u2206 : string) (dtb_u_u2207 : string) (dtb_u_u2208 : string) (dtb_u_u2214 : Frontend_dPackages_dPkg.t_PackageContext) -> (Obj.repr ((fun (dtb_u_u2219 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2222 = ((((((v_ownCleanModules_u_udirect dtb_u_u2205) dtb_u_u2206) dtb_u_u2207) dtb_u_u2208) dtb_u_u2214) dtb_u_u2219) in (let dtb_u_u2224 = (match dtb_u_u2222 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2226) -> dtb_u_u2226
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2224))))))

# 1869 "Vuna/Compiler/Driver/Compile.vuna"
let v_cleanIfacesOrEmpty_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) _u_ueffTok -> (let dtb_u_u2222 = ((((((v_ownCleanModules_u_udirect nFs) nClock) nEnv) nProcess) ctx) _u_ueffTok) in (let dtb_u_u2224 = (match dtb_u_u2222 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2226) -> dtb_u_u2226
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2224)))

# 1587 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolWriteModuleIfaceCold = (fun (dtb_u_u2227 : string) (dtb_u_u2228 : string) (dtb_u_u2229 : string) (dtb_u_u2230 : string) (dtb_u_u2236 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2237 : Driver_dDt.t_CheckedPackage) (dtb_u_u2238 : string) (dtb_u_u2239 : Driver_dIface.t_SourceInfo) -> (Obj.repr ((fun (dtb_u_u2244 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2247 = ((((((v_cleanIfacesOrEmpty_u_udirect dtb_u_u2227) dtb_u_u2228) dtb_u_u2229) dtb_u_u2230) dtb_u_u2236) dtb_u_u2244) in (let dtb_u_u2255 = ((((((v_depIfaceHashTable_u_udirect dtb_u_u2227) dtb_u_u2228) dtb_u_u2229) dtb_u_u2230) dtb_u_u2236) dtb_u_u2244) in (let dtb_u_u2256 = (v_ifaceLocNorm dtb_u_u2236) in (let dtb_u_u2257 = ((((((((((Driver_dIface.v_ifaceOfModule (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u2236)) dtb_u_u2239) dtb_u_u2255) (dtb_u_u2237).Driver_dDt.f_CheckedPackage_checkedInherited) dtb_u_u2247) (dtb_u_u2237).Driver_dDt.f_CheckedPackage_checkedModules) (dtb_u_u2237).Driver_dDt.f_CheckedPackage_checkedEntryDecls) (dtb_u_u2237).Driver_dDt.f_CheckedPackage_checkedProgram) dtb_u_u2256) dtb_u_u2238) in (match dtb_u_u2257 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2258) -> (let dtb_u_u2260 = (Base_dDiag.C_Check_ErrC (dtb_u_u2258)) in dtb_u_u2260)
  | Base_dDiag.C_Check_OkC (dtb_u_u2262) -> (let dtb_u_u2270 = (((((((v_writeModuleIfaceGuarded_u_udirect dtb_u_u2227) dtb_u_u2228) dtb_u_u2229) dtb_u_u2230) dtb_u_u2236) dtb_u_u2262) dtb_u_u2244) in (let dtb_u_u2272 = (Base_dDiag.C_Check_OkC (dtb_u_u2262)) in dtb_u_u2272))
  | _ -> failwith "DT: impossible branch"
)))))))))

# 1587 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolWriteModuleIfaceCold_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : Driver_dDt.t_CheckedPackage) (name : string) (si : Driver_dIface.t_SourceInfo) _u_ueffTok -> (let dtb_u_u2247 = ((((((v_cleanIfacesOrEmpty_u_udirect nFs) nClock) nEnv) nProcess) ctx) _u_ueffTok) in (let dtb_u_u2255 = ((((((v_depIfaceHashTable_u_udirect nFs) nClock) nEnv) nProcess) ctx) _u_ueffTok) in (let dtb_u_u2256 = (v_ifaceLocNorm ctx) in (let dtb_u_u2257 = ((((((((((Driver_dIface.v_ifaceOfModule (Frontend_dPackages_dPkg.v_contextPackageName ctx)) si) dtb_u_u2255) (checked).Driver_dDt.f_CheckedPackage_checkedInherited) dtb_u_u2247) (checked).Driver_dDt.f_CheckedPackage_checkedModules) (checked).Driver_dDt.f_CheckedPackage_checkedEntryDecls) (checked).Driver_dDt.f_CheckedPackage_checkedProgram) dtb_u_u2256) name) in (match dtb_u_u2257 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2258) -> (let dtb_u_u2260 = (Base_dDiag.C_Check_ErrC (dtb_u_u2258)) in dtb_u_u2260)
  | Base_dDiag.C_Check_OkC (dtb_u_u2262) -> (let dtb_u_u2270 = (((((((v_writeModuleIfaceGuarded_u_udirect nFs) nClock) nEnv) nProcess) ctx) dtb_u_u2262) _u_ueffTok) in (let dtb_u_u2272 = (Base_dDiag.C_Check_OkC (dtb_u_u2262)) in dtb_u_u2272))
  | _ -> failwith "DT: impossible branch"
))))))

# 1921 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownInfoOf = (fun (dtb_u_u2274 : string) (dtb_u_u2275 : string) (dtb_u_u2279 : t_ClosureMod) -> (Obj.repr ((fun (dtb_u_u2284 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2287 = (((Frontend_dPackages_dPkg.v_absolutePath_u_udirect dtb_u_u2275) (dtb_u_u2279).f_ClosureMod_cmPath) dtb_u_u2284) in (let dtb_u_u2293 = Obj.obj ((((fun dtb_u_u2297 dtb_u_u2298 -> (Obj.repr ((fun (dtb_u_u2299 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2300 = Obj.obj (dtb_u_u2298) in (dtb_u_u2297 (dtb_u_u2300 dtb_u_u2299))))))) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime dtb_u_u2274) dtb_u_u2287))) in (let dtb_u_u2301 = (dtb_u_u2293 dtb_u_u2284) in (let dtb_u_u2307 = Obj.obj ((((fun dtb_u_u2311 dtb_u_u2312 -> (Obj.repr ((fun (dtb_u_u2313 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2314 = Obj.obj (dtb_u_u2312) in (dtb_u_u2311 (dtb_u_u2314 dtb_u_u2313))))))) (fun (dtb_u_u2315 : int B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe 0) dtb_u_u2315))) ((B_dEffect_dFs.v_fsFileSize dtb_u_u2274) dtb_u_u2287))) in (let dtb_u_u2316 = (dtb_u_u2307 dtb_u_u2284) in (let dtb_u_u2318 = { B_dData_dPair.f_Pair_first = (dtb_u_u2279).f_ClosureMod_cmName; B_dData_dPair.f_Pair_second = { Driver_dIface.f_SourceInfo_siPath = dtb_u_u2287; Driver_dIface.f_SourceInfo_siHash = (dtb_u_u2279).f_ClosureMod_cmSrc; Driver_dIface.f_SourceInfo_siMtime = dtb_u_u2301; Driver_dIface.f_SourceInfo_siSize = dtb_u_u2316 } } in dtb_u_u2318))))))))))

# 1921 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownInfoOf_u_udirect = (fun (nFs : string) (nEnv : string) (m : t_ClosureMod) _u_ueffTok -> (let dtb_u_u2287 = (((Frontend_dPackages_dPkg.v_absolutePath_u_udirect nEnv) (m).f_ClosureMod_cmPath) _u_ueffTok) in (let dtb_u_u2293 = Obj.obj ((((fun dtb_u_u2297 dtb_u_u2298 -> (Obj.repr ((fun (dtb_u_u2299 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2300 = Obj.obj (dtb_u_u2298) in (dtb_u_u2297 (dtb_u_u2300 dtb_u_u2299))))))) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime nFs) dtb_u_u2287))) in (let dtb_u_u2301 = (dtb_u_u2293 _u_ueffTok) in (let dtb_u_u2307 = Obj.obj ((((fun dtb_u_u2311 dtb_u_u2312 -> (Obj.repr ((fun (dtb_u_u2313 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2314 = Obj.obj (dtb_u_u2312) in (dtb_u_u2311 (dtb_u_u2314 dtb_u_u2313))))))) (fun (dtb_u_u2315 : int B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe 0) dtb_u_u2315))) ((B_dEffect_dFs.v_fsFileSize nFs) dtb_u_u2287))) in (let dtb_u_u2316 = (dtb_u_u2307 _u_ueffTok) in (let dtb_u_u2318 = { B_dData_dPair.f_Pair_first = (m).f_ClosureMod_cmName; B_dData_dPair.f_Pair_second = { Driver_dIface.f_SourceInfo_siPath = dtb_u_u2287; Driver_dIface.f_SourceInfo_siHash = (m).f_ClosureMod_cmSrc; Driver_dIface.f_SourceInfo_siMtime = dtb_u_u2301; Driver_dIface.f_SourceInfo_siSize = dtb_u_u2316 } } in dtb_u_u2318)))))))

# 1918 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownSourceInfos = (fun (nFs : string) (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> ((v_mapEff ((v_ownInfoOf nFs) nEnv)) ((v_selfModsOf ctx) mods)))

# 1918 "Vuna/Compiler/Driver/Compile.vuna"
let v_ownSourceInfos_u_udirect = (fun (nFs : string) (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) _u_ueffTok -> ((Obj.magic ((v_mapEff ((v_ownInfoOf nFs) nEnv)) ((v_selfModsOf ctx) mods))) _u_ueffTok))

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
let v_shadowClosureMods = (fun (dtb_u_u2333 : string) (dtb_u_u2334 : string) (dtb_u_u2335 : string) (dtb_u_u2336 : string) (dtb_u_u2342 : Frontend_dPackages_dPkg.t_PackageContext) -> (if ((Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u2342) = "") then (let dtb_u_u2344 = B_dData_dMaybe.C_Maybe_Nothing in (Obj.repr ((fun (dtb_u_u2345 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u2344)))) else (if (B_dData_dBool.v_not (v_shadowAllowed dtb_u_u2342)) then (let dtb_u_u2347 = B_dData_dMaybe.C_Maybe_Nothing in (Obj.repr ((fun (dtb_u_u2348 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u2347)))) else (Obj.repr ((fun (dtb_u_u2353 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2356 = ((((((v_ifaceModsEff_u_udirect dtb_u_u2333) dtb_u_u2334) dtb_u_u2335) dtb_u_u2336) dtb_u_u2342) dtb_u_u2353) in (let dtb_u_u2358 = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u2356)) in dtb_u_u2358))))))))

# 916 "Vuna/Compiler/Driver/Compile.vuna"
let v_shadowClosureMods_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) _u_ueffTok -> (if ((Frontend_dPackages_dPkg.v_contextPackageName ctx) = "") then (let dtb_u_u2344 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u2344) else (if (B_dData_dBool.v_not (v_shadowAllowed ctx)) then (let dtb_u_u2347 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u2347) else (let dtb_u_u2356 = ((((((v_ifaceModsEff_u_udirect nFs) nClock) nEnv) nProcess) ctx) _u_ueffTok) in (let dtb_u_u2358 = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u2356)) in dtb_u_u2358)))))

# 1954 "Vuna/Compiler/Driver/Compile.vuna"
let v_nameExportedBy = (fun (names : string B_dData_dList.t_List) (m : t_ClosureMod) -> ((B_dData_dList.v_memName (m).f_ClosureMod_cmName) names))

# 1205 "Vuna/Compiler/Driver/Compile.vuna"
let v_exportedDepModsOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (p : string) (mods : t_ClosureMod B_dData_dList.t_List) -> (let inPkg = ((B_dData_dList.v_filter (v_pkgEq p)) mods) in (match ((v_rootExportsOf p) (Frontend_dPackages_dPkg.v_contextRoots ctx)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> inPkg
  | B_dData_dMaybe.C_Maybe_Just (dtb__413) -> ((B_dData_dList.v_filter (v_nameExportedBy dtb__413)) inPkg)
  | _ -> failwith "DT: impossible branch"
)))

# 1169 "Vuna/Compiler/Driver/Compile.vuna"
let v_probeRequired = (fun (dtb_u_u2367 : string) (dtb_u_u2368 : string) (dtb_u_u2372 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2373 : t_ClosureMod B_dData_dList.t_List) (dtb_u_u2374 : string) -> (Obj.repr ((fun (dtb_u_u2379 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2382 = (((((v_probePairs_u_udirect dtb_u_u2367) dtb_u_u2368) dtb_u_u2372) ((B_dData_dList.v_filter (v_pkgEq dtb_u_u2374)) dtb_u_u2373)) dtb_u_u2379) in (let dtb_u_u2383 = ((B_dData_dList.v_map (fun (dtb_u_u2388 : (t_ClosureMod, Driver_dIface.t_ModuleIface) B_dData_dPair.t_Pair) -> (v_modNameOf (B_dData_dPair.v_firstOf dtb_u_u2388)))) dtb_u_u2382) in (let dtb_u_u2384 = ((B_dData_dList.v_map v_modNameOf) (((v_exportedDepModsOf dtb_u_u2372) dtb_u_u2374) dtb_u_u2373)) in (let dtb_u_u2386 = (if ((v_allNamesIn dtb_u_u2384) dtb_u_u2383) then (B_dData_dMaybe.C_Maybe_Just ((v_orderClosurePairs dtb_u_u2382))) else B_dData_dMaybe.C_Maybe_Nothing) in dtb_u_u2386))))))))

# 1169 "Vuna/Compiler/Driver/Compile.vuna"
let v_probeRequired_u_udirect = (fun (nFs : string) (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (p : string) _u_ueffTok -> (let dtb_u_u2382 = (((((v_probePairs_u_udirect nFs) nEnv) ctx) ((B_dData_dList.v_filter (v_pkgEq p)) mods)) _u_ueffTok) in (let dtb_u_u2383 = ((B_dData_dList.v_map (fun (dtb_u_u2388 : (t_ClosureMod, Driver_dIface.t_ModuleIface) B_dData_dPair.t_Pair) -> (v_modNameOf (B_dData_dPair.v_firstOf dtb_u_u2388)))) dtb_u_u2382) in (let dtb_u_u2384 = ((B_dData_dList.v_map v_modNameOf) (((v_exportedDepModsOf ctx) p) mods)) in (let dtb_u_u2386 = (if ((v_allNamesIn dtb_u_u2384) dtb_u_u2383) then (B_dData_dMaybe.C_Maybe_Just ((v_orderClosurePairs dtb_u_u2382))) else B_dData_dMaybe.C_Maybe_Nothing) in dtb_u_u2386)))))

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
let v_ifaceWriteEnabled = (fun (dtb_u_u2393 : string) -> (Obj.repr ((fun (dtb_u_u2400 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2403 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect dtb_u_u2393) "VUNA_IFACE_WRITE") dtb_u_u2400) in (let dtb_u_u2405 = (dtb_u_u2403 <> "0") in dtb_u_u2405))))))

# 1977 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceWriteEnabled_u_udirect = (fun (nEnv : string) _u_ueffTok -> (let dtb_u_u2403 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect nEnv) "VUNA_IFACE_WRITE") _u_ueffTok) in (let dtb_u_u2405 = (dtb_u_u2403 <> "0") in dtb_u_u2405)))

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
let rec v_writeIfaceObjects = (fun (dtb_u_u2418 : string) (dtb_u_u2419 : string) (dtb_u_u2420 : string) (dtb_u_u2425 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2426 : t_ClosureMod B_dData_dList.t_List) (dtb_u_u2427 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match dtb_u_u2427 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2428, dtb_u_u2429) -> (match ((v_findClosureMod (Driver_dIface.v_miNameOf dtb_u_u2428)) dtb_u_u2426) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_writeIfaceObjects dtb_u_u2418) dtb_u_u2419) dtb_u_u2420) dtb_u_u2425) dtb_u_u2426) dtb_u_u2429)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2430) -> (Obj.repr ((fun (dtb_u_u2435 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2438 = ((((v_ownIfaceDirEff_u_udirect dtb_u_u2418) dtb_u_u2419) dtb_u_u2425) dtb_u_u2435) in (let dtb_u_u2446 = ((((v_readIfaceInEff_u_udirect dtb_u_u2418) dtb_u_u2438) (dtb_u_u2430).f_ClosureMod_cmAddr) dtb_u_u2435) in (let dtb_u_u2447 = ((Driver_dIface.v_mergeDefLocsFrom dtb_u_u2446) dtb_u_u2428) in (let dtb_u_u2455 = ((((Base_dObs.v_obsSpanEff_u_udirect "vuna.cache.write") "vuna.cache") (((((Base_dStore.v_storeWriteIfChangedEff dtb_u_u2418) (Base_dStore.v_storeObjectTag "module-iface")) v_ifaceObjectCodec) (String.concat "" [dtb_u_u2438; "/"; (dtb_u_u2430).f_ClosureMod_cmAddr])) (Driver_dIface.v_encModuleIface dtb_u_u2447))) dtb_u_u2435) in (let dtb_u_u2463 = (((((((v_writeIfaceObjects_u_udirect dtb_u_u2418) dtb_u_u2419) dtb_u_u2420) dtb_u_u2425) dtb_u_u2426) dtb_u_u2429) dtb_u_u2435) in (let dtb_u_u2465 = (if (dtb_u_u2455 > 0) then (dtb_u_u2463 + 1) else dtb_u_u2463) in dtb_u_u2465)))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (let dtb_u_u2468 = 0 in (Obj.repr ((fun (dtb_u_u2469 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u2468))))
  | _ -> failwith "DT: impossible branch"
))
# 2115 "Vuna/Compiler/Driver/Compile.vuna"
and v_writeIfaceObjects_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (mc0 : Frontend_dPackages_dPkg.t_PackageContext) (mc1 : t_ClosureMod B_dData_dList.t_List) (mc2 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) _u_ueffTok -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2428, dtb_u_u2429) -> (match ((v_findClosureMod (Driver_dIface.v_miNameOf dtb_u_u2428)) mc1) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic ((((((v_writeIfaceObjects nFs) nEnv) nProcess) mc0) mc1) dtb_u_u2429)) _u_ueffTok)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2430) -> (let dtb_u_u2438 = ((((v_ownIfaceDirEff_u_udirect nFs) nEnv) mc0) _u_ueffTok) in (let dtb_u_u2446 = ((((v_readIfaceInEff_u_udirect nFs) dtb_u_u2438) (dtb_u_u2430).f_ClosureMod_cmAddr) _u_ueffTok) in (let dtb_u_u2447 = ((Driver_dIface.v_mergeDefLocsFrom dtb_u_u2446) dtb_u_u2428) in (let dtb_u_u2455 = ((((Base_dObs.v_obsSpanEff_u_udirect "vuna.cache.write") "vuna.cache") (((((Base_dStore.v_storeWriteIfChangedEff nFs) (Base_dStore.v_storeObjectTag "module-iface")) v_ifaceObjectCodec) (String.concat "" [dtb_u_u2438; "/"; (dtb_u_u2430).f_ClosureMod_cmAddr])) (Driver_dIface.v_encModuleIface dtb_u_u2447))) _u_ueffTok) in (let dtb_u_u2463 = (((((((v_writeIfaceObjects_u_udirect nFs) nEnv) nProcess) mc0) mc1) dtb_u_u2429) _u_ueffTok) in (let dtb_u_u2465 = (if (dtb_u_u2455 > 0) then (dtb_u_u2463 + 1) else dtb_u_u2463) in dtb_u_u2465))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (let dtb_u_u2468 = 0 in dtb_u_u2468)
  | _ -> failwith "DT: impossible branch"
))

# 2139 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceSelfTestRequested = (fun (dtb_u_u2470 : string) -> (Obj.repr ((fun (dtb_u_u2477 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2480 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect dtb_u_u2470) "VUNA_IFACE_SELFTEST") dtb_u_u2477) in (let dtb_u_u2482 = (dtb_u_u2480 = "1") in dtb_u_u2482))))))

# 2139 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceSelfTestRequested_u_udirect = (fun (nEnv : string) _u_ueffTok -> (let dtb_u_u2480 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect nEnv) "VUNA_IFACE_SELFTEST") _u_ueffTok) in (let dtb_u_u2482 = (dtb_u_u2480 = "1") in dtb_u_u2482)))

# 1882 "Vuna/Compiler/Driver/Compile.vuna"
let v_payloadSelfOk = (fun (dtb_u_u2484 : string) (dtb_u_u2487 : Driver_dIface.t_ModuleIface) -> (Obj.repr ((fun (dtb_u_u2492 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2495 = ((v_ifaceSelfTestRequested_u_udirect dtb_u_u2484) dtb_u_u2492) in (let dtb_u_u2497 = (if dtb_u_u2495 then ((Driver_dIface.v_hashOfIface dtb_u_u2487) = (Driver_dIface.v_miIfaceHashOf dtb_u_u2487)) else true) in dtb_u_u2497))))))

# 1882 "Vuna/Compiler/Driver/Compile.vuna"
let v_payloadSelfOk_u_udirect = (fun (nEnv : string) (m : Driver_dIface.t_ModuleIface) _u_ueffTok -> (let dtb_u_u2495 = ((v_ifaceSelfTestRequested_u_udirect nEnv) _u_ueffTok) in (let dtb_u_u2497 = (if dtb_u_u2495 then ((Driver_dIface.v_hashOfIface m) = (Driver_dIface.v_miIfaceHashOf m)) else true) in dtb_u_u2497)))

# 1500 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_cleanSelfOk = (fun (dtb_u_u2499 : string) (dtb_u_u2500 : string) (dtb_u_u2504 : int) (dtb_u_u2505 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u2506 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match dtb_u_u2505 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2507, dtb_u_u2508) -> (Obj.repr ((fun (dtb_u_u2513 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2516 = (((v_payloadSelfOk_u_udirect dtb_u_u2500) dtb_u_u2507) dtb_u_u2513) in (let dtb_u_u2517 = (if dtb_u_u2516 then 0 else (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("iface-reject=self-hash " ^ (Driver_dIface.v_miNameOf dtb_u_u2507))) else 0)) in (let dtb_u_u2525 = ((((v_sourceFresh_u_udirect dtb_u_u2499) dtb_u_u2504) (Driver_dIface.v_miSourceOf dtb_u_u2507)) dtb_u_u2513) in (let dtb_u_u2526 = (Driver_dCache.v_cachedProgramValid (Driver_dIface.v_miCachedOf dtb_u_u2507)) in (let dtb_u_u2527 = (Driver_dIface.v_hasMissingDep (Driver_dIface.v_miDepHashesOf dtb_u_u2507)) in (let dtb_u_u2528 = (if (if (if dtb_u_u2525 then dtb_u_u2526 else false) then dtb_u_u2516 else false) then (B_dData_dBool.v_not dtb_u_u2527) else false) in (let dtb_u_u2529 = (if dtb_u_u2516 then 0 else ((Base_dObs.v_obsCounter "vuna.tool.clean.reject.self") 1)) in (let dtb_u_u2530 = (if dtb_u_u2525 then 0 else ((Base_dObs.v_obsCounter "vuna.tool.clean.reject.fresh") 1)) in (let dtb_u_u2531 = (if dtb_u_u2526 then 0 else ((Base_dObs.v_obsCounter "vuna.tool.clean.reject.cached") 1)) in (let dtb_u_u2532 = (if dtb_u_u2527 then ((Base_dObs.v_obsCounter "vuna.tool.clean.reject.missingdep") 1) else 0) in ((Obj.magic (((((v_cleanSelfOk dtb_u_u2499) dtb_u_u2500) dtb_u_u2504) dtb_u_u2508) (if dtb_u_u2528 then (B_dData_dList.C_List__x58__x58_ (dtb_u_u2507, dtb_u_u2506)) else dtb_u_u2506))) dtb_u_u2513))))))))))))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u2534 = (B_dData_dList.v_reverse dtb_u_u2506) in (Obj.repr ((fun (dtb_u_u2535 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u2534))))
  | _ -> failwith "DT: impossible branch"
))
# 1500 "Vuna/Compiler/Driver/Compile.vuna"
and v_cleanSelfOk_u_udirect = (fun (nFs : string) (nEnv : string) (mc0 : int) (mc1 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mc2 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) _u_ueffTok -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2507, dtb_u_u2508) -> (let dtb_u_u2516 = (((v_payloadSelfOk_u_udirect nEnv) dtb_u_u2507) _u_ueffTok) in (let dtb_u_u2517 = (if dtb_u_u2516 then 0 else (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("iface-reject=self-hash " ^ (Driver_dIface.v_miNameOf dtb_u_u2507))) else 0)) in (let dtb_u_u2525 = ((((v_sourceFresh_u_udirect nFs) mc0) (Driver_dIface.v_miSourceOf dtb_u_u2507)) _u_ueffTok) in (let dtb_u_u2526 = (Driver_dCache.v_cachedProgramValid (Driver_dIface.v_miCachedOf dtb_u_u2507)) in (let dtb_u_u2527 = (Driver_dIface.v_hasMissingDep (Driver_dIface.v_miDepHashesOf dtb_u_u2507)) in (let dtb_u_u2528 = (if (if (if dtb_u_u2525 then dtb_u_u2526 else false) then dtb_u_u2516 else false) then (B_dData_dBool.v_not dtb_u_u2527) else false) in (let dtb_u_u2529 = (if dtb_u_u2516 then 0 else ((Base_dObs.v_obsCounter "vuna.tool.clean.reject.self") 1)) in (let dtb_u_u2530 = (if dtb_u_u2525 then 0 else ((Base_dObs.v_obsCounter "vuna.tool.clean.reject.fresh") 1)) in (let dtb_u_u2531 = (if dtb_u_u2526 then 0 else ((Base_dObs.v_obsCounter "vuna.tool.clean.reject.cached") 1)) in (let dtb_u_u2532 = (if dtb_u_u2527 then ((Base_dObs.v_obsCounter "vuna.tool.clean.reject.missingdep") 1) else 0) in ((Obj.magic (((((v_cleanSelfOk nFs) nEnv) mc0) dtb_u_u2508) (if dtb_u_u2528 then (B_dData_dList.C_List__x58__x58_ (dtb_u_u2507, mc2)) else mc2))) _u_ueffTok)))))))))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u2534 = (B_dData_dList.v_reverse mc2) in dtb_u_u2534)
  | _ -> failwith "DT: impossible branch"
))

# 1494 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolCleanGo = (fun (dtb_u_u2536 : string) (dtb_u_u2537 : string) (dtb_u_u2541 : int) (dtb_u_u2542 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u2543 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u2544 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u2549 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2552 = ((((((v_cleanSelfOk_u_udirect dtb_u_u2536) dtb_u_u2537) dtb_u_u2541) dtb_u_u2543) B_dData_dList.C_List_Nil) dtb_u_u2549) in (let dtb_u_u2554 = ((((v_cleanFixpoint ((B_dData_dList.v_length dtb_u_u2552) + 1)) dtb_u_u2542) dtb_u_u2552) dtb_u_u2544) in dtb_u_u2554))))))

# 1494 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolCleanGo_u_udirect = (fun (nFs : string) (nEnv : string) (builtSec : int) (depTbl : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (cands : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanRev : Driver_dIface.t_ModuleIface B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u2552 = ((((((v_cleanSelfOk_u_udirect nFs) nEnv) builtSec) cands) B_dData_dList.C_List_Nil) _u_ueffTok) in (let dtb_u_u2554 = ((((v_cleanFixpoint ((B_dData_dList.v_length dtb_u_u2552) + 1)) depTbl) dtb_u_u2552) cleanRev) in dtb_u_u2554)))

# 1466 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolCleanOwnModules = (fun (dtb_u_u2556 : string) (dtb_u_u2557 : string) (dtb_u_u2558 : string) (dtb_u_u2559 : string) (dtb_u_u2565 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2566 : t_ToolContext) (dtb_u_u2567 : int) (dtb_u_u2568 : string B_dData_dMaybe.t_Maybe) (dtb_u_u2569 : string B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u2574 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2577 = ((((((v_ifaceModsEff_u_udirect dtb_u_u2556) dtb_u_u2557) dtb_u_u2558) dtb_u_u2559) dtb_u_u2565) dtb_u_u2574) in (let dtb_u_u2578 = ((B_dData_dList.v_filter ((v_ownCleanWanted dtb_u_u2569) dtb_u_u2568)) ((v_selfModsOf dtb_u_u2565) dtb_u_u2577)) in (let dtb_u_u2579 = ((Base_dObs.v_obsCounter "vuna.tool.clean.cands") (B_dData_dList.v_length dtb_u_u2578)) in (let dtb_u_u2587 = (((((v_readIfaceListPartialEff_u_udirect dtb_u_u2556) dtb_u_u2558) dtb_u_u2565) dtb_u_u2578) dtb_u_u2574) in (let dtb_u_u2588 = ((Base_dObs.v_obsCounter "vuna.tool.clean.read") (B_dData_dList.v_length dtb_u_u2587)) in ((Obj.magic ((((((v_toolCleanGo dtb_u_u2556) dtb_u_u2558) dtb_u_u2567) (dtb_u_u2566).f_ToolContext_tcDepHashes) dtb_u_u2587) B_dData_dList.C_List_Nil)) dtb_u_u2574))))))))))

# 1466 "Vuna/Compiler/Driver/Compile.vuna"
let v_toolCleanOwnModules_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (tool : t_ToolContext) (builtSec : int) (exclude : string B_dData_dMaybe.t_Maybe) (needed : string B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u2577 = ((((((v_ifaceModsEff_u_udirect nFs) nClock) nEnv) nProcess) ctx) _u_ueffTok) in (let dtb_u_u2578 = ((B_dData_dList.v_filter ((v_ownCleanWanted needed) exclude)) ((v_selfModsOf ctx) dtb_u_u2577)) in (let dtb_u_u2579 = ((Base_dObs.v_obsCounter "vuna.tool.clean.cands") (B_dData_dList.v_length dtb_u_u2578)) in (let dtb_u_u2587 = (((((v_readIfaceListPartialEff_u_udirect nFs) nEnv) ctx) dtb_u_u2578) _u_ueffTok) in (let dtb_u_u2588 = ((Base_dObs.v_obsCounter "vuna.tool.clean.read") (B_dData_dList.v_length dtb_u_u2587)) in ((Obj.magic ((((((v_toolCleanGo nFs) nEnv) builtSec) (tool).f_ToolContext_tcDepHashes) dtb_u_u2587) B_dData_dList.C_List_Nil)) _u_ueffTok)))))))

# 2092 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceSelfCheckEff = (fun (dtb_u_u2589 : string) (dtb_u_u2592 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u2597 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2600 = ((v_ifaceSelfTestRequested_u_udirect dtb_u_u2589) dtb_u_u2597) in (let dtb_u_u2602 = (if dtb_u_u2600 then (v_ifaceSelfCheckGo dtb_u_u2592) else true) in dtb_u_u2602))))))

# 2092 "Vuna/Compiler/Driver/Compile.vuna"
let v_ifaceSelfCheckEff_u_udirect = (fun (nEnv : string) (mods : Driver_dIface.t_ModuleIface B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u2600 = ((v_ifaceSelfTestRequested_u_udirect nEnv) _u_ueffTok) in (let dtb_u_u2602 = (if dtb_u_u2600 then (v_ifaceSelfCheckGo mods) else true) in dtb_u_u2602)))

# 1995 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeIfaceShadowGo = (fun (dtb_u_u2604 : string) (dtb_u_u2605 : string) (dtb_u_u2606 : string) (dtb_u_u2607 : string) (dtb_u_u2613 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2614 : Driver_dDt.t_CheckedPackage) (dtb_u_u2615 : t_ClosureMod B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (dtb_u_u2616 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (if ((Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u2613) = "") then (let dtb_u_u2618 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in (Obj.repr ((fun (dtb_u_u2619 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u2618)))) else (if (B_dData_dBool.v_not (v_shadowAllowed dtb_u_u2613)) then (let dtb_u_u2621 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in (Obj.repr ((fun (dtb_u_u2622 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u2621)))) else (Obj.repr ((fun (dtb_u_u2627 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2630 = ((((Frontend_dPackages_dState.v_ensurePkgStateDirEff_u_udirect dtb_u_u2604) dtb_u_u2606) (Frontend_dPackages_dPkg.v_contextDir dtb_u_u2613)) dtb_u_u2627) in (let dtb_u_u2631 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") "iface-shadow-start") else 0) in (let dtb_u_u2639 = ((B_dEffect_dClock.v_clockNow_u_udirect dtb_u_u2605) dtb_u_u2627) in (let dtb_u_u2645 = Obj.obj ((match dtb_u_u2615 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2647) -> (let dtb_u_u2649 = dtb_u_u2647 in (Obj.repr ((fun (dtb_u_u2650 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u2649))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_ifaceModsEff dtb_u_u2604) dtb_u_u2605) dtb_u_u2606) dtb_u_u2607) dtb_u_u2613)
  | _ -> failwith "DT: impossible branch"
)) in (let dtb_u_u2651 = (dtb_u_u2645 dtb_u_u2627) in (let dtb_u_u2659 = ((B_dEffect_dClock.v_clockNow_u_udirect dtb_u_u2605) dtb_u_u2627) in (let dtb_u_u2667 = (((((v_ownSourceInfos_u_udirect dtb_u_u2604) dtb_u_u2606) dtb_u_u2613) dtb_u_u2651) dtb_u_u2627) in (let dtb_u_u2675 = ((B_dEffect_dClock.v_clockNow_u_udirect dtb_u_u2605) dtb_u_u2627) in (let dtb_u_u2676 = ((B_dData_dList.v_map v_modHashPair) ((v_depModsOf dtb_u_u2613) dtb_u_u2651)) in (let dtb_u_u2677 = ((v_selfModsOf dtb_u_u2613) dtb_u_u2651) in (let dtb_u_u2678 = ((B_dData_dList.v_map Driver_dIface.v_miNameOf) dtb_u_u2616) in (let dtb_u_u2679 = ((v_exportedOwnOf dtb_u_u2613) dtb_u_u2677) in (match (((((((((Driver_dIface.v_ifaceOfPackage (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u2613)) dtb_u_u2667) dtb_u_u2676) (dtb_u_u2614).Driver_dDt.f_CheckedPackage_checkedInherited) dtb_u_u2616) (dtb_u_u2614).Driver_dDt.f_CheckedPackage_checkedModules) (dtb_u_u2614).Driver_dDt.f_CheckedPackage_checkedEntryDecls) (dtb_u_u2614).Driver_dDt.f_CheckedPackage_checkedProgram) (v_ifaceLocNorm dtb_u_u2613)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2680) -> (let dtb_u_u2681 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("iface-reject=compute iface-skip " ^ (Base_dDiag.v_diagText dtb_u_u2680))) else 0) in (let dtb_u_u2683 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u2683))
  | Base_dDiag.C_Check_OkC (dtb_u_u2685) -> (let dtb_u_u2693 = ((B_dEffect_dClock.v_clockNow_u_udirect dtb_u_u2605) dtb_u_u2627) in (let dtb_u_u2694 = ((v_missingNamesOf dtb_u_u2679) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) dtb_u_u2685)) in (let dtb_u_u2695 = ((B_dData_dList.v_filter (fun (dtb_u_u2740 : Driver_dIface.t_ModuleIface) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf dtb_u_u2740)) dtb_u_u2678)))) dtb_u_u2685) in (if ((B_dData_dList.v_length dtb_u_u2694) > 0) then (let dtb_u_u2696 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") (String.concat "" ["iface-skip partial closure="; (string_of_int (B_dData_dList.v_length dtb_u_u2677)); " required="; (string_of_int (B_dData_dList.v_length dtb_u_u2679)); " covered="; (string_of_int (B_dData_dList.v_length dtb_u_u2685)); " missing="; ((B_dData_dString.v_join ",") dtb_u_u2694)])) else 0) in (let dtb_u_u2698 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u2698)) else (let dtb_u_u2707 = (((v_ifaceSelfCheckEff_u_udirect dtb_u_u2606) dtb_u_u2695) dtb_u_u2627) in (if (B_dData_dBool.v_not dtb_u_u2707) then (let dtb_u_u2708 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("iface-selftest=skip-write " ^ (string_of_int (B_dData_dList.v_length dtb_u_u2695)))) else 0) in (let dtb_u_u2710 = (Base_dDiag.C_Check_OkC (dtb_u_u2685)) in dtb_u_u2710)) else (let dtb_u_u2719 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.iface.write") dtb_u_u2627) in (let dtb_u_u2727 = (((((((v_writeIfaceObjects_u_udirect dtb_u_u2604) dtb_u_u2606) dtb_u_u2607) dtb_u_u2613) dtb_u_u2677) dtb_u_u2695) dtb_u_u2627) in (let dtb_u_u2735 = ((B_dEffect_dClock.v_clockNow_u_udirect dtb_u_u2605) dtb_u_u2627) in (let dtb_u_u2736 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") (String.concat "" ["iface-write="; (string_of_int dtb_u_u2727); "/"; (string_of_int (B_dData_dList.v_length dtb_u_u2685)); " closure="; (string_of_int (B_dData_dList.v_length dtb_u_u2677)); " phases mods="; (string_of_int (if 1000 = 0 then failwith "division by zero" else (dtb_u_u2659 - dtb_u_u2639) / 1000)); "ms sources="; (string_of_int (if 1000 = 0 then failwith "division by zero" else (dtb_u_u2675 - dtb_u_u2659) / 1000)); "ms compute="; (string_of_int (if 1000 = 0 then failwith "division by zero" else (dtb_u_u2693 - dtb_u_u2675) / 1000)); "ms write="; (string_of_int (if 1000 = 0 then failwith "division by zero" else (dtb_u_u2735 - dtb_u_u2693) / 1000)); "ms"])) else 0) in (let dtb_u_u2738 = (Base_dDiag.C_Check_OkC (dtb_u_u2685)) in dtb_u_u2738)))))))))))
  | _ -> failwith "DT: impossible branch"
)))))))))))))))))))

# 1995 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeIfaceShadowGo_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : Driver_dDt.t_CheckedPackage) (pre : t_ClosureMod B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (clean : Driver_dIface.t_ModuleIface B_dData_dList.t_List) _u_ueffTok -> (if ((Frontend_dPackages_dPkg.v_contextPackageName ctx) = "") then (let dtb_u_u2618 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u2618) else (if (B_dData_dBool.v_not (v_shadowAllowed ctx)) then (let dtb_u_u2621 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u2621) else (let dtb_u_u2630 = ((((Frontend_dPackages_dState.v_ensurePkgStateDirEff_u_udirect nFs) nEnv) (Frontend_dPackages_dPkg.v_contextDir ctx)) _u_ueffTok) in (let dtb_u_u2631 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") "iface-shadow-start") else 0) in (let dtb_u_u2639 = ((B_dEffect_dClock.v_clockNow_u_udirect nClock) _u_ueffTok) in (let dtb_u_u2645 = Obj.obj ((match pre with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2647) -> (let dtb_u_u2649 = dtb_u_u2647 in (Obj.repr ((fun (dtb_u_u2650 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u2649))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_ifaceModsEff nFs) nClock) nEnv) nProcess) ctx)
  | _ -> failwith "DT: impossible branch"
)) in (let dtb_u_u2651 = (dtb_u_u2645 _u_ueffTok) in (let dtb_u_u2659 = ((B_dEffect_dClock.v_clockNow_u_udirect nClock) _u_ueffTok) in (let dtb_u_u2667 = (((((v_ownSourceInfos_u_udirect nFs) nEnv) ctx) dtb_u_u2651) _u_ueffTok) in (let dtb_u_u2675 = ((B_dEffect_dClock.v_clockNow_u_udirect nClock) _u_ueffTok) in (let dtb_u_u2676 = ((B_dData_dList.v_map v_modHashPair) ((v_depModsOf ctx) dtb_u_u2651)) in (let dtb_u_u2677 = ((v_selfModsOf ctx) dtb_u_u2651) in (let dtb_u_u2678 = ((B_dData_dList.v_map Driver_dIface.v_miNameOf) clean) in (let dtb_u_u2679 = ((v_exportedOwnOf ctx) dtb_u_u2677) in (match (((((((((Driver_dIface.v_ifaceOfPackage (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb_u_u2667) dtb_u_u2676) (checked).Driver_dDt.f_CheckedPackage_checkedInherited) clean) (checked).Driver_dDt.f_CheckedPackage_checkedModules) (checked).Driver_dDt.f_CheckedPackage_checkedEntryDecls) (checked).Driver_dDt.f_CheckedPackage_checkedProgram) (v_ifaceLocNorm ctx)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2680) -> (let dtb_u_u2681 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("iface-reject=compute iface-skip " ^ (Base_dDiag.v_diagText dtb_u_u2680))) else 0) in (let dtb_u_u2683 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u2683))
  | Base_dDiag.C_Check_OkC (dtb_u_u2685) -> (let dtb_u_u2693 = ((B_dEffect_dClock.v_clockNow_u_udirect nClock) _u_ueffTok) in (let dtb_u_u2694 = ((v_missingNamesOf dtb_u_u2679) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) dtb_u_u2685)) in (let dtb_u_u2695 = ((B_dData_dList.v_filter (fun (dtb_u_u2740 : Driver_dIface.t_ModuleIface) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf dtb_u_u2740)) dtb_u_u2678)))) dtb_u_u2685) in (if ((B_dData_dList.v_length dtb_u_u2694) > 0) then (let dtb_u_u2696 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") (String.concat "" ["iface-skip partial closure="; (string_of_int (B_dData_dList.v_length dtb_u_u2677)); " required="; (string_of_int (B_dData_dList.v_length dtb_u_u2679)); " covered="; (string_of_int (B_dData_dList.v_length dtb_u_u2685)); " missing="; ((B_dData_dString.v_join ",") dtb_u_u2694)])) else 0) in (let dtb_u_u2698 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u2698)) else (let dtb_u_u2707 = (((v_ifaceSelfCheckEff_u_udirect nEnv) dtb_u_u2695) _u_ueffTok) in (if (B_dData_dBool.v_not dtb_u_u2707) then (let dtb_u_u2708 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("iface-selftest=skip-write " ^ (string_of_int (B_dData_dList.v_length dtb_u_u2695)))) else 0) in (let dtb_u_u2710 = (Base_dDiag.C_Check_OkC (dtb_u_u2685)) in dtb_u_u2710)) else (let dtb_u_u2719 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.iface.write") _u_ueffTok) in (let dtb_u_u2727 = (((((((v_writeIfaceObjects_u_udirect nFs) nEnv) nProcess) ctx) dtb_u_u2677) dtb_u_u2695) _u_ueffTok) in (let dtb_u_u2735 = ((B_dEffect_dClock.v_clockNow_u_udirect nClock) _u_ueffTok) in (let dtb_u_u2736 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") (String.concat "" ["iface-write="; (string_of_int dtb_u_u2727); "/"; (string_of_int (B_dData_dList.v_length dtb_u_u2685)); " closure="; (string_of_int (B_dData_dList.v_length dtb_u_u2677)); " phases mods="; (string_of_int (if 1000 = 0 then failwith "division by zero" else (dtb_u_u2659 - dtb_u_u2639) / 1000)); "ms sources="; (string_of_int (if 1000 = 0 then failwith "division by zero" else (dtb_u_u2675 - dtb_u_u2659) / 1000)); "ms compute="; (string_of_int (if 1000 = 0 then failwith "division by zero" else (dtb_u_u2693 - dtb_u_u2675) / 1000)); "ms write="; (string_of_int (if 1000 = 0 then failwith "division by zero" else (dtb_u_u2735 - dtb_u_u2693) / 1000)); "ms"])) else 0) in (let dtb_u_u2738 = (Base_dDiag.C_Check_OkC (dtb_u_u2685)) in dtb_u_u2738)))))))))))
  | _ -> failwith "DT: impossible branch"
))))))))))))))))

# 1989 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeIfaceShadowWithClean = (fun (dtb_u_u2741 : string) (dtb_u_u2742 : string) (dtb_u_u2743 : string) (dtb_u_u2744 : string) (dtb_u_u2750 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2751 : Driver_dDt.t_CheckedPackage) (dtb_u_u2752 : t_ClosureMod B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (dtb_u_u2753 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u2758 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2761 = ((v_ifaceWriteEnabled_u_udirect dtb_u_u2743) dtb_u_u2758) in (if (B_dData_dBool.v_not dtb_u_u2761) then (let dtb_u_u2763 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u2763) else ((Obj.magic ((((((((v_writeIfaceShadowGo dtb_u_u2741) dtb_u_u2742) dtb_u_u2743) dtb_u_u2744) dtb_u_u2750) dtb_u_u2751) dtb_u_u2752) dtb_u_u2753)) dtb_u_u2758)))))))

# 1989 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeIfaceShadowWithClean_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : Driver_dDt.t_CheckedPackage) (pre : t_ClosureMod B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (clean : Driver_dIface.t_ModuleIface B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u2761 = ((v_ifaceWriteEnabled_u_udirect nEnv) _u_ueffTok) in (if (B_dData_dBool.v_not dtb_u_u2761) then (let dtb_u_u2763 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u2763) else ((Obj.magic ((((((((v_writeIfaceShadowGo nFs) nClock) nEnv) nProcess) ctx) checked) pre) clean)) _u_ueffTok))))

# 215 "Vuna/Compiler/Driver/Compile.vuna"
let v_rebuildSplit = (fun (dtb_u_u2765 : string) (dtb_u_u2766 : string) (dtb_u_u2767 : string) (dtb_u_u2768 : string) (dtb_u_u2769 : string) (dtb_u_u2776 : t_SplitInputs) (dtb_u_u2777 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2778 : string) (dtb_u_u2779 : bool) (dtb_u_u2780 : string) -> (Obj.repr ((fun (dtb_u_u2785 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2788 = ((((((v_ownCleanInfoWith_u_udirect dtb_u_u2765) dtb_u_u2768) dtb_u_u2769) dtb_u_u2777) (dtb_u_u2776).f_SplitInputs_siClosure) dtb_u_u2785) in (let dtb_u_u2789 = (match dtb_u_u2788 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2831) -> dtb_u_u2831
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u2797 = ((((((((((v_summarySplitParts_u_udirect dtb_u_u2765) dtb_u_u2766) dtb_u_u2767) dtb_u_u2768) dtb_u_u2769) dtb_u_u2777) (dtb_u_u2776).f_SplitInputs_siDepIfaces) dtb_u_u2778) dtb_u_u2779) dtb_u_u2785) in (match dtb_u_u2797 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2798) -> (let dtb_u_u2800 = (Base_dDiag.C_Check_ErrC (dtb_u_u2798)) in dtb_u_u2800)
  | Base_dDiag.C_Check_OkC (dtb_u_u2802) -> (let dtb_u_u2803 = (Driver_dSplit.v_canonicalTopo (B_dData_dPair.v_firstOf dtb_u_u2802)) in (let dtb_u_u2804 = (B_dData_dPair.v_secondOf dtb_u_u2802) in (let dtb_u_u2812 = (((((((((v_writeIfaceShadowWithClean_u_udirect dtb_u_u2765) dtb_u_u2767) dtb_u_u2768) dtb_u_u2769) dtb_u_u2777) dtb_u_u2804) (B_dData_dMaybe.C_Maybe_Just ((dtb_u_u2776).f_SplitInputs_siClosure))) dtb_u_u2789) dtb_u_u2785) in (match dtb_u_u2812 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2813) -> (let dtb_u_u2815 = (Base_dDiag.C_Check_ErrC (dtb_u_u2813)) in dtb_u_u2815)
  | Base_dDiag.C_Check_OkC (dtb_u_u2817) -> (let dtb_u_u2825 = (((((((v_writeCompiledNormalized_u_udirect dtb_u_u2765) dtb_u_u2768) dtb_u_u2769) dtb_u_u2777) dtb_u_u2780) dtb_u_u2803) dtb_u_u2785) in (let dtb_u_u2827 = (match dtb_u_u2825 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2829) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2829))
  | Base_dDiag.C_Check_OkC (dtb_u_u2830) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u2830; B_dData_dPair.f_Pair_second = (dtb_u_u2804).Driver_dDt.f_CheckedPackage_checkedWarnings }))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2827))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))))))

# 215 "Vuna/Compiler/Driver/Compile.vuna"
let v_rebuildSplit_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (inputs : t_SplitInputs) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) _u_ueffTok -> (let dtb_u_u2788 = ((((((v_ownCleanInfoWith_u_udirect nFs) nEnv) nProcess) ctx) (inputs).f_SplitInputs_siClosure) _u_ueffTok) in (let dtb_u_u2789 = (match dtb_u_u2788 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2831) -> dtb_u_u2831
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u2797 = ((((((((((v_summarySplitParts_u_udirect nFs) nConsole) nClock) nEnv) nProcess) ctx) (inputs).f_SplitInputs_siDepIfaces) entry) printResult) _u_ueffTok) in (match dtb_u_u2797 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2798) -> (let dtb_u_u2800 = (Base_dDiag.C_Check_ErrC (dtb_u_u2798)) in dtb_u_u2800)
  | Base_dDiag.C_Check_OkC (dtb_u_u2802) -> (let dtb_u_u2803 = (Driver_dSplit.v_canonicalTopo (B_dData_dPair.v_firstOf dtb_u_u2802)) in (let dtb_u_u2804 = (B_dData_dPair.v_secondOf dtb_u_u2802) in (let dtb_u_u2812 = (((((((((v_writeIfaceShadowWithClean_u_udirect nFs) nClock) nEnv) nProcess) ctx) dtb_u_u2804) (B_dData_dMaybe.C_Maybe_Just ((inputs).f_SplitInputs_siClosure))) dtb_u_u2789) _u_ueffTok) in (match dtb_u_u2812 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2813) -> (let dtb_u_u2815 = (Base_dDiag.C_Check_ErrC (dtb_u_u2813)) in dtb_u_u2815)
  | Base_dDiag.C_Check_OkC (dtb_u_u2817) -> (let dtb_u_u2825 = (((((((v_writeCompiledNormalized_u_udirect nFs) nEnv) nProcess) ctx) outDir) dtb_u_u2803) _u_ueffTok) in (let dtb_u_u2827 = (match dtb_u_u2825 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2829) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2829))
  | Base_dDiag.C_Check_OkC (dtb_u_u2830) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u2830; B_dData_dPair.f_Pair_second = (dtb_u_u2804).Driver_dDt.f_CheckedPackage_checkedWarnings }))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2827))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))

# 211 "Vuna/Compiler/Driver/Compile.vuna"
let v_compileToDirNormal = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (inputs : t_SplitInputs) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) -> ((((((((((v_rebuildSplit nFs) nConsole) nClock) nEnv) nProcess) inputs) ctx) entry) printResult) outDir))

# 211 "Vuna/Compiler/Driver/Compile.vuna"
let v_compileToDirNormal_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (inputs : t_SplitInputs) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) _u_ueffTok -> ((Obj.magic ((((((((((v_rebuildSplit nFs) nConsole) nClock) nEnv) nProcess) inputs) ctx) entry) printResult) outDir)) _u_ueffTok))

# 1985 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeIfaceShadowWith = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : Driver_dDt.t_CheckedPackage) (pre : t_ClosureMod B_dData_dList.t_List B_dData_dMaybe.t_Maybe) -> ((((((((v_writeIfaceShadowWithClean nFs) nClock) nEnv) nProcess) ctx) checked) pre) B_dData_dList.C_List_Nil))

# 1985 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeIfaceShadowWith_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : Driver_dDt.t_CheckedPackage) (pre : t_ClosureMod B_dData_dList.t_List B_dData_dMaybe.t_Maybe) _u_ueffTok -> ((Obj.magic ((((((((v_writeIfaceShadowWithClean nFs) nClock) nEnv) nProcess) ctx) checked) pre) B_dData_dList.C_List_Nil)) _u_ueffTok))

# 249 "Vuna/Compiler/Driver/Compile.vuna"
let v_auditCompile = (fun (dtb_u_u2860 : string) (dtb_u_u2861 : string) (dtb_u_u2862 : string) (dtb_u_u2863 : string) (dtb_u_u2864 : string) (dtb_u_u2871 : t_SplitInputs) (dtb_u_u2872 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2873 : string) (dtb_u_u2874 : bool) (dtb_u_u2875 : string) -> (Obj.repr ((fun (dtb_u_u2880 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2883 = ((((((((((v_summarySplitParts_u_udirect dtb_u_u2860) dtb_u_u2861) dtb_u_u2862) dtb_u_u2863) dtb_u_u2864) dtb_u_u2872) (dtb_u_u2871).f_SplitInputs_siDepIfaces) dtb_u_u2873) dtb_u_u2874) dtb_u_u2880) in (let dtb_u_u2891 = ((((((((Driver_dDt.v_dtSplitProjectParts_u_udirect dtb_u_u2860) dtb_u_u2861) dtb_u_u2863) dtb_u_u2864) dtb_u_u2872) dtb_u_u2873) dtb_u_u2874) dtb_u_u2880) in (let dtb_u_u2892 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") ("iface-audit subject=compile entry=" ^ dtb_u_u2873)) else 0) in (let dtb_u_u2898 = Obj.obj ((let dtb_u_u2901 = ((((v_auditCompare "compile") dtb_u_u2873) (v_splitSignatureOf dtb_u_u2883)) (v_splitSignatureOf dtb_u_u2891)) in (Obj.repr ((fun (dtb_u_u2902 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u2901))))) in (let dtb_u_u2903 = (dtb_u_u2898 dtb_u_u2880) in (match dtb_u_u2903 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2904) -> (let dtb_u_u2906 = (Base_dDiag.C_Check_ErrC (dtb_u_u2904)) in dtb_u_u2906)
  | Base_dDiag.C_Check_OkC (dtb_u_u2908) -> (match dtb_u_u2883 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2909) -> (let dtb_u_u2911 = (Base_dDiag.C_Check_ErrC (dtb_u_u2909)) in dtb_u_u2911)
  | Base_dDiag.C_Check_OkC (dtb_u_u2913) -> (let dtb_u_u2914 = (B_dData_dPair.v_firstOf dtb_u_u2913) in (let dtb_u_u2915 = (B_dData_dPair.v_secondOf dtb_u_u2913) in (let dtb_u_u2916 = (Driver_dSplit.v_canonicalTopo dtb_u_u2914) in (let dtb_u_u2924 = ((((((((v_writeIfaceShadowWith_u_udirect dtb_u_u2860) dtb_u_u2862) dtb_u_u2863) dtb_u_u2864) dtb_u_u2872) dtb_u_u2915) (B_dData_dMaybe.C_Maybe_Just ((dtb_u_u2871).f_SplitInputs_siClosure))) dtb_u_u2880) in (match dtb_u_u2924 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2925) -> (let dtb_u_u2927 = (Base_dDiag.C_Check_ErrC (dtb_u_u2925)) in dtb_u_u2927)
  | Base_dDiag.C_Check_OkC (dtb_u_u2929) -> (let dtb_u_u2937 = (((((((v_writeCompiledNormalized_u_udirect dtb_u_u2860) dtb_u_u2863) dtb_u_u2864) dtb_u_u2872) dtb_u_u2875) dtb_u_u2916) dtb_u_u2880) in (let dtb_u_u2939 = (match dtb_u_u2937 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2941) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2941))
  | Base_dDiag.C_Check_OkC (dtb_u_u2942) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u2942; B_dData_dPair.f_Pair_second = (dtb_u_u2915).Driver_dDt.f_CheckedPackage_checkedWarnings }))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2939))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))))

# 249 "Vuna/Compiler/Driver/Compile.vuna"
let v_auditCompile_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (inputs : t_SplitInputs) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) _u_ueffTok -> (let dtb_u_u2883 = ((((((((((v_summarySplitParts_u_udirect nFs) nConsole) nClock) nEnv) nProcess) ctx) (inputs).f_SplitInputs_siDepIfaces) entry) printResult) _u_ueffTok) in (let dtb_u_u2891 = ((((((((Driver_dDt.v_dtSplitProjectParts_u_udirect nFs) nConsole) nEnv) nProcess) ctx) entry) printResult) _u_ueffTok) in (let dtb_u_u2892 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") ("iface-audit subject=compile entry=" ^ entry)) else 0) in (let dtb_u_u2898 = Obj.obj ((let dtb_u_u2901 = ((((v_auditCompare "compile") entry) (v_splitSignatureOf dtb_u_u2883)) (v_splitSignatureOf dtb_u_u2891)) in (Obj.repr ((fun (dtb_u_u2902 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u2901))))) in (let dtb_u_u2903 = (dtb_u_u2898 _u_ueffTok) in (match dtb_u_u2903 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2904) -> (let dtb_u_u2906 = (Base_dDiag.C_Check_ErrC (dtb_u_u2904)) in dtb_u_u2906)
  | Base_dDiag.C_Check_OkC (dtb_u_u2908) -> (match dtb_u_u2883 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2909) -> (let dtb_u_u2911 = (Base_dDiag.C_Check_ErrC (dtb_u_u2909)) in dtb_u_u2911)
  | Base_dDiag.C_Check_OkC (dtb_u_u2913) -> (let dtb_u_u2914 = (B_dData_dPair.v_firstOf dtb_u_u2913) in (let dtb_u_u2915 = (B_dData_dPair.v_secondOf dtb_u_u2913) in (let dtb_u_u2916 = (Driver_dSplit.v_canonicalTopo dtb_u_u2914) in (let dtb_u_u2924 = ((((((((v_writeIfaceShadowWith_u_udirect nFs) nClock) nEnv) nProcess) ctx) dtb_u_u2915) (B_dData_dMaybe.C_Maybe_Just ((inputs).f_SplitInputs_siClosure))) _u_ueffTok) in (match dtb_u_u2924 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2925) -> (let dtb_u_u2927 = (Base_dDiag.C_Check_ErrC (dtb_u_u2925)) in dtb_u_u2927)
  | Base_dDiag.C_Check_OkC (dtb_u_u2929) -> (let dtb_u_u2937 = (((((((v_writeCompiledNormalized_u_udirect nFs) nEnv) nProcess) ctx) outDir) dtb_u_u2916) _u_ueffTok) in (let dtb_u_u2939 = (match dtb_u_u2937 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2941) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2941))
  | Base_dDiag.C_Check_OkC (dtb_u_u2942) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u2942; B_dData_dPair.f_Pair_second = (dtb_u_u2915).Driver_dDt.f_CheckedPackage_checkedWarnings }))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2939))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

# 180 "Vuna/Compiler/Driver/Compile.vuna"
let v_compileToDirGiven = (fun (dtb_u_u2943 : string) (dtb_u_u2944 : string) (dtb_u_u2945 : string) (dtb_u_u2946 : string) (dtb_u_u2947 : string) (dtb_u_u2954 : t_SplitInputs) (dtb_u_u2955 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2956 : string) (dtb_u_u2957 : bool) (dtb_u_u2958 : string) -> (Obj.repr ((fun (dtb_u_u2963 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2966 = ((v_ifaceAuditRequested_u_udirect dtb_u_u2946) dtb_u_u2963) in (if dtb_u_u2966 then ((Obj.magic ((((((((((v_auditCompile dtb_u_u2943) dtb_u_u2944) dtb_u_u2945) dtb_u_u2946) dtb_u_u2947) dtb_u_u2954) dtb_u_u2955) dtb_u_u2956) dtb_u_u2957) dtb_u_u2958)) dtb_u_u2963) else ((Obj.magic ((((((((((v_compileToDirNormal dtb_u_u2943) dtb_u_u2944) dtb_u_u2945) dtb_u_u2946) dtb_u_u2947) dtb_u_u2954) dtb_u_u2955) dtb_u_u2956) dtb_u_u2957) dtb_u_u2958)) dtb_u_u2963)))))))

# 180 "Vuna/Compiler/Driver/Compile.vuna"
let v_compileToDirGiven_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (inputs : t_SplitInputs) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) _u_ueffTok -> (let dtb_u_u2966 = ((v_ifaceAuditRequested_u_udirect nEnv) _u_ueffTok) in (if dtb_u_u2966 then ((Obj.magic ((((((((((v_auditCompile nFs) nConsole) nClock) nEnv) nProcess) inputs) ctx) entry) printResult) outDir)) _u_ueffTok) else ((Obj.magic ((((((((((v_compileToDirNormal nFs) nConsole) nClock) nEnv) nProcess) inputs) ctx) entry) printResult) outDir)) _u_ueffTok))))

# 1972 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeIfaceShadow = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : Driver_dDt.t_CheckedPackage) -> (((((((v_writeIfaceShadowWith nFs) nClock) nEnv) nProcess) ctx) checked) B_dData_dMaybe.C_Maybe_Nothing))

# 1972 "Vuna/Compiler/Driver/Compile.vuna"
let v_writeIfaceShadow_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : Driver_dDt.t_CheckedPackage) _u_ueffTok -> ((Obj.magic (((((((v_writeIfaceShadowWith nFs) nClock) nEnv) nProcess) ctx) checked) B_dData_dMaybe.C_Maybe_Nothing)) _u_ueffTok))

# 2149 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkAndShadowWith = (fun (dtb_u_u2978 : string) (dtb_u_u2979 : string) (dtb_u_u2980 : string) (dtb_u_u2981 : string) (dtb_u_u2987 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2988 : t_ClosureMod B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (dtb_u_u2989 : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, Driver_dDt.t_CheckedPackage) B_dData_dPair.t_Pair Base_dDiag.t_Check B_dEffect_dCore.t_Eff) -> (Obj.repr ((fun (dtb_u_u2994 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2995 = Obj.obj (dtb_u_u2989) in (let dtb_u_u2997 = (dtb_u_u2995 dtb_u_u2994) in (match dtb_u_u2997 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2998) -> (let dtb_u_u3000 = (Base_dDiag.C_Check_ErrC (dtb_u_u2998)) in dtb_u_u3000)
  | Base_dDiag.C_Check_OkC (dtb_u_u3002) -> (let dtb_u_u3010 = ((((((((v_writeIfaceShadowWith_u_udirect dtb_u_u2978) dtb_u_u2979) dtb_u_u2980) dtb_u_u2981) dtb_u_u2987) (B_dData_dPair.v_secondOf dtb_u_u3002)) dtb_u_u2988) dtb_u_u2994) in (match dtb_u_u3010 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u3011) -> (let dtb_u_u3013 = (Base_dDiag.C_Check_ErrC (dtb_u_u3011)) in dtb_u_u3013)
  | Base_dDiag.C_Check_OkC (dtb_u_u3015) -> (let dtb_u_u3017 = (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u3002); B_dData_dPair.f_Pair_second = dtb_u_u3015 })) in dtb_u_u3017)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))))

# 2149 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkAndShadowWith_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (pre : t_ClosureMod B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (checked : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, Driver_dDt.t_CheckedPackage) B_dData_dPair.t_Pair Base_dDiag.t_Check B_dEffect_dCore.t_Eff) _u_ueffTok -> (let dtb_u_u2995 = Obj.obj (checked) in (let dtb_u_u2997 = (dtb_u_u2995 _u_ueffTok) in (match dtb_u_u2997 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2998) -> (let dtb_u_u3000 = (Base_dDiag.C_Check_ErrC (dtb_u_u2998)) in dtb_u_u3000)
  | Base_dDiag.C_Check_OkC (dtb_u_u3002) -> (let dtb_u_u3010 = ((((((((v_writeIfaceShadowWith_u_udirect nFs) nClock) nEnv) nProcess) ctx) (B_dData_dPair.v_secondOf dtb_u_u3002)) pre) _u_ueffTok) in (match dtb_u_u3010 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u3011) -> (let dtb_u_u3013 = (Base_dDiag.C_Check_ErrC (dtb_u_u3011)) in dtb_u_u3013)
  | Base_dDiag.C_Check_OkC (dtb_u_u3015) -> (let dtb_u_u3017 = (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u3002); B_dData_dPair.f_Pair_second = dtb_u_u3015 })) in dtb_u_u3017)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))

# 1658 "Vuna/Compiler/Driver/Compile.vuna"
let v_fullCheckExe = (fun (dtb_u_u3019 : string) (dtb_u_u3020 : string) (dtb_u_u3021 : string) (dtb_u_u3022 : string) (dtb_u_u3028 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u3029 : string) -> (let dtb_u_u3030 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "cache-path=full") else 0) in (Obj.repr ((fun (dtb_u_u3035 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u3038 = ((((((v_shadowClosureMods_u_udirect dtb_u_u3019) dtb_u_u3020) dtb_u_u3021) dtb_u_u3022) dtb_u_u3028) dtb_u_u3035) in ((Obj.magic (((((((v_checkAndShadowWith dtb_u_u3019) dtb_u_u3020) dtb_u_u3021) dtb_u_u3022) dtb_u_u3028) dtb_u_u3038) (((((Driver_dDt.v_dtCheckWithProgramParts dtb_u_u3019) dtb_u_u3021) dtb_u_u3022) dtb_u_u3028) dtb_u_u3029))) dtb_u_u3035)))))))

# 1658 "Vuna/Compiler/Driver/Compile.vuna"
let v_fullCheckExe_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) _u_ueffTok -> (let dtb_u_u3030 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "cache-path=full") else 0) in (let dtb_u_u3038 = ((((((v_shadowClosureMods_u_udirect nFs) nClock) nEnv) nProcess) ctx) _u_ueffTok) in ((Obj.magic (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) dtb_u_u3038) (((((Driver_dDt.v_dtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry))) _u_ueffTok))))

# 2146 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkAndShadow = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, Driver_dDt.t_CheckedPackage) B_dData_dPair.t_Pair Base_dDiag.t_Check B_dEffect_dCore.t_Eff) -> (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) B_dData_dMaybe.C_Maybe_Nothing) checked))

# 2146 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkAndShadow_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (checked : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, Driver_dDt.t_CheckedPackage) B_dData_dPair.t_Pair Base_dDiag.t_Check B_dEffect_dCore.t_Eff) _u_ueffTok -> ((Obj.magic (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) B_dData_dMaybe.C_Maybe_Nothing) checked)) _u_ueffTok))

# 2210 "Vuna/Compiler/Driver/Compile.vuna"
let v_fullCheckLib = (fun (dtb_u_u3050 : string) (dtb_u_u3051 : string) (dtb_u_u3052 : string) (dtb_u_u3053 : string) (dtb_u_u3059 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u3060 : string B_dData_dList.t_List) -> (let dtb_u_u3061 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "cache-path=full") else 0) in (Obj.repr ((fun (dtb_u_u3066 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u3069 = ((((((v_shadowClosureMods_u_udirect dtb_u_u3050) dtb_u_u3051) dtb_u_u3052) dtb_u_u3053) dtb_u_u3059) dtb_u_u3066) in ((Obj.magic (((((((v_checkAndShadowWith dtb_u_u3050) dtb_u_u3051) dtb_u_u3052) dtb_u_u3053) dtb_u_u3059) dtb_u_u3069) (((((Driver_dDt.v_dtCheckLibraryWithProgramParts dtb_u_u3050) dtb_u_u3052) dtb_u_u3053) dtb_u_u3059) dtb_u_u3060))) dtb_u_u3066)))))))

# 2210 "Vuna/Compiler/Driver/Compile.vuna"
let v_fullCheckLib_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u3061 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "cache-path=full") else 0) in (let dtb_u_u3069 = ((((((v_shadowClosureMods_u_udirect nFs) nClock) nEnv) nProcess) ctx) _u_ueffTok) in ((Obj.magic (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) dtb_u_u3069) (((((Driver_dDt.v_dtCheckLibraryWithProgramParts nFs) nEnv) nProcess) ctx) names))) _u_ueffTok))))

# 94 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_checkPackageAt = (fun (dtb_u_u3070 : string) (dtb_u_u3071 : string) (dtb_u_u3072 : string) (dtb_u_u3073 : string) (dtb_u_u3079 : int) (dtb_u_u3080 : bool) (dtb_u_u3081 : bool) (dtb_u_u3082 : Frontend_dPackages_dPkg.t_Package) -> (let dtb_u_u3083 = ((Frontend_dPackages_dPkg.v_contextWithRelease dtb_u_u3080) (Frontend_dPackages_dPkg.v_packageContext dtb_u_u3082)) in (Obj.repr ((fun (dtb_u_u3088 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u3091 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u3070) (Frontend_dPackages_dPkg.v_packageEntry dtb_u_u3082)) dtb_u_u3088) in (if dtb_u_u3091 then (let dtb_u_u3099 = (((((((((v_checkUncachedExeAt_u_udirect dtb_u_u3070) dtb_u_u3071) dtb_u_u3072) dtb_u_u3073) dtb_u_u3079) dtb_u_u3081) dtb_u_u3083) (Frontend_dPackages_dPkg.v_packageEntry dtb_u_u3082)) dtb_u_u3088) in (let dtb_u_u3100 = dtb_u_u3099 in (match dtb_u_u3100 with
  | Base_dDiag.C_Check_OkC (dtb_u_u3101) -> (match dtb_u_u3101 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3102; B_dData_dPair.f_Pair_second = dtb_u_u3103 } -> (match (Frontend_dPackages_dPkg.v_packageExports dtb_u_u3082) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u3105 = (Base_dDiag.C_Check_OkC (dtb_u_u3102)) in dtb_u_u3105)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3107) -> (let dtb_u_u3115 = ((v_elabFullRequested_u_udirect dtb_u_u3072) dtb_u_u3088) in (let dtb_u_u3116 = ((v_allNamesIn dtb_u_u3107) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) dtb_u_u3103)) in (if (if (B_dData_dBool.v_not dtb_u_u3115) then dtb_u_u3116 else false) then (let dtb_u_u3117 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("check-lib-skip covered=" ^ (string_of_int (B_dData_dList.v_length dtb_u_u3107)))) else 0) in (let dtb_u_u3119 = (Base_dDiag.C_Check_OkC (dtb_u_u3102)) in dtb_u_u3119)) else (let dtb_u_u3128 = (((((((((v_checkUncachedLibAt_u_udirect dtb_u_u3070) dtb_u_u3071) dtb_u_u3072) dtb_u_u3073) dtb_u_u3079) false) dtb_u_u3083) dtb_u_u3107) dtb_u_u3088) in (let dtb_u_u3129 = dtb_u_u3128 in (match dtb_u_u3129 with
  | Base_dDiag.C_Check_OkC (dtb_u_u3130) -> (match dtb_u_u3130 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3131; B_dData_dPair.f_Pair_second = dtb_u_u3132 } -> (let dtb_u_u3134 = (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append dtb_u_u3102) dtb_u_u3131))) in dtb_u_u3134)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u3136) -> (let dtb_u_u3138 = (Base_dDiag.C_Check_ErrC (dtb_u_u3136)) in dtb_u_u3138)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u3140) -> (let dtb_u_u3142 = (Base_dDiag.C_Check_ErrC (dtb_u_u3140)) in dtb_u_u3142)
  | _ -> failwith "DT: impossible branch"
))) else (match (Frontend_dPackages_dPkg.v_packageExports dtb_u_u3082) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u3145 = ((((Base_dDiagnostics_dPkg.v_pkgAt1 ((Frontend_dPackages_dPkg.v_packageDir dtb_u_u3082) ^ "/vuna.toml")) 1) (Base_dDiagnostics_dPkg.C_PkgErr_LibraryWithoutEntry ((Frontend_dPackages_dPkg.v_packageName dtb_u_u3082)))) (Frontend_dPackages_dPkg.v_packageName dtb_u_u3082)) in dtb_u_u3145)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3147) -> (let dtb_u_u3155 = (((((((((v_checkUncachedLibAt_u_udirect dtb_u_u3070) dtb_u_u3071) dtb_u_u3072) dtb_u_u3073) dtb_u_u3079) dtb_u_u3081) dtb_u_u3083) dtb_u_u3147) dtb_u_u3088) in (let dtb_u_u3156 = dtb_u_u3155 in (match dtb_u_u3156 with
  | Base_dDiag.C_Check_OkC (dtb_u_u3157) -> (match dtb_u_u3157 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3158; B_dData_dPair.f_Pair_second = dtb_u_u3159 } -> (let dtb_u_u3161 = (Base_dDiag.C_Check_OkC (dtb_u_u3158)) in dtb_u_u3161)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u3163) -> (let dtb_u_u3165 = (Base_dDiag.C_Check_ErrC (dtb_u_u3163)) in dtb_u_u3165)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))))
# 1072 "Vuna/Compiler/Driver/Compile.vuna"
and v_depIfacesOfWithAt = (fun (dtb_u_u3167 : string) (dtb_u_u3168 : string) (dtb_u_u3169 : string) (dtb_u_u3170 : string) (dtb_u_u3176 : int) (dtb_u_u3177 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u3178 : t_ClosureMod B_dData_dList.t_List) -> (match (dtb_u_u3177).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u3180 = B_dData_dMaybe.C_Maybe_Nothing in (Obj.repr ((fun (dtb_u_u3181 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u3180))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3182) -> (Obj.repr ((fun (dtb_u_u3187 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u3190 = ((((((((v_depIfacePairsEffAt_u_udirect dtb_u_u3167) dtb_u_u3168) dtb_u_u3169) dtb_u_u3170) dtb_u_u3176) dtb_u_u3177) dtb_u_u3178) dtb_u_u3187) in (match dtb_u_u3190 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u3191 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "iface-reject=dep-iface-missing") else 0) in (let dtb_u_u3193 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u3193))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3195) -> (let dtb_u_u3197 = (B_dData_dMaybe.C_Maybe_Just (((B_dData_dList.v_map B_dData_dPair.v_secondOf) dtb_u_u3195))) in dtb_u_u3197)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))
# 1140 "Vuna/Compiler/Driver/Compile.vuna"
and v_buildDepEffAt = (fun (dtb_u_u3199 : string) (dtb_u_u3200 : string) (dtb_u_u3201 : string) (dtb_u_u3202 : string) (dtb_u_u3208 : int) (dtb_u_u3209 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u3210 : string) -> (if (dtb_u_u3208 <= 0) then (let dtb_u_u3212 = false in (Obj.repr ((fun (dtb_u_u3213 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u3212)))) else (match ((v_findDepPackage dtb_u_u3210) (v_depPackageList dtb_u_u3209)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u3215 = false in (Obj.repr ((fun (dtb_u_u3216 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u3215))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3217) -> (let dtb_u_u3218 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("dep-build=" ^ dtb_u_u3210)) else 0) in (Obj.repr ((fun (dtb_u_u3223 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u3226 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.iface.dep-build") dtb_u_u3223) in (let dtb_u_u3234 = (((((((((v_checkPackageAt_u_udirect dtb_u_u3199) dtb_u_u3200) dtb_u_u3201) dtb_u_u3202) (dtb_u_u3208 - 1)) false) false) dtb_u_u3217) dtb_u_u3223) in (let dtb_u_u3236 = (match dtb_u_u3234 with
  | Base_dDiag.C_Check_OkC (dtb_u_u3238) -> true
  | Base_dDiag.C_Check_ErrC (dtb_u_u3239) -> false
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u3236)))))))
  | _ -> failwith "DT: impossible branch"
)))
# 1158 "Vuna/Compiler/Driver/Compile.vuna"
and v_depPairsOfPkgAt = (fun (dtb_u_u3240 : string) (dtb_u_u3241 : string) (dtb_u_u3242 : string) (dtb_u_u3243 : string) (dtb_u_u3249 : int) (dtb_u_u3250 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u3251 : t_ClosureMod B_dData_dList.t_List) (dtb_u_u3252 : string) -> (Obj.repr ((fun (dtb_u_u3257 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u3260 = ((((((v_probeRequired_u_udirect dtb_u_u3240) dtb_u_u3242) dtb_u_u3250) dtb_u_u3251) dtb_u_u3252) dtb_u_u3257) in (match dtb_u_u3260 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3261) -> (let dtb_u_u3263 = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u3261)) in dtb_u_u3263)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u3272 = ((((((((v_buildDepEffAt_u_udirect dtb_u_u3240) dtb_u_u3241) dtb_u_u3242) dtb_u_u3243) dtb_u_u3249) dtb_u_u3250) dtb_u_u3252) dtb_u_u3257) in (if dtb_u_u3272 then ((Obj.magic (((((v_probeRequired dtb_u_u3240) dtb_u_u3242) dtb_u_u3250) dtb_u_u3251) dtb_u_u3252)) dtb_u_u3257) else (let dtb_u_u3274 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u3274)))
  | _ -> failwith "DT: impossible branch"
))))))
# 1178 "Vuna/Compiler/Driver/Compile.vuna"
and v_goPkgsAt = (fun (dtb_u_u3276 : string) (dtb_u_u3277 : string) (dtb_u_u3278 : string) (dtb_u_u3279 : string) (dtb_u_u3285 : int) (dtb_u_u3286 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u3287 : t_ClosureMod B_dData_dList.t_List) (dtb_u_u3288 : string B_dData_dList.t_List) (dtb_u_u3289 : (t_ClosureMod, Driver_dIface.t_ModuleIface) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u3288 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u3290, dtb_u_u3291) -> (Obj.repr ((fun (dtb_u_u3296 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u3299 = (((((((((v_depPairsOfPkgAt_u_udirect dtb_u_u3276) dtb_u_u3277) dtb_u_u3278) dtb_u_u3279) dtb_u_u3285) dtb_u_u3286) dtb_u_u3287) dtb_u_u3290) dtb_u_u3296) in (match dtb_u_u3299 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u3301 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u3301)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3303) -> ((Obj.magic (((((((((v_goPkgsAt dtb_u_u3276) dtb_u_u3277) dtb_u_u3278) dtb_u_u3279) dtb_u_u3285) dtb_u_u3286) dtb_u_u3287) dtb_u_u3291) ((B_dData_dList.v_append dtb_u_u3289) dtb_u_u3303))) dtb_u_u3296)
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dList.C_List_Nil -> (if (v_duplicatePairNames dtb_u_u3289) then (let dtb_u_u3304 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "iface-reject=dep-module-duplicate") else 0) in (let dtb_u_u3306 = B_dData_dMaybe.C_Maybe_Nothing in (Obj.repr ((fun (dtb_u_u3307 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u3306))))) else (let dtb_u_u3309 = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u3289)) in (Obj.repr ((fun (dtb_u_u3310 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u3309)))))
  | _ -> failwith "DT: impossible branch"
))
# 1219 "Vuna/Compiler/Driver/Compile.vuna"
and v_depIfacePairsEffAt = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (fuel : int) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) -> (((((((((v_goPkgsAt nFs) nClock) nEnv) nProcess) fuel) ctx) mods) ((v_distinctPkgs ((v_depModsOf ctx) mods)) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil))
# 1607 "Vuna/Compiler/Driver/Compile.vuna"
and v_checkUncachedExeAt = (fun (dtb_u_u3323 : string) (dtb_u_u3324 : string) (dtb_u_u3325 : string) (dtb_u_u3326 : string) (dtb_u_u3332 : int) (dtb_u_u3333 : bool) (dtb_u_u3334 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u3335 : string) -> (Obj.repr ((fun (dtb_u_u3340 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u3343 = ((v_elabFullRequested_u_udirect dtb_u_u3325) dtb_u_u3340) in (if dtb_u_u3343 then ((Obj.magic ((((((v_fullCheckExe dtb_u_u3323) dtb_u_u3324) dtb_u_u3325) dtb_u_u3326) dtb_u_u3334) dtb_u_u3335)) dtb_u_u3340) else (let dtb_u_u3351 = ((((((v_summaryClosureMods_u_udirect dtb_u_u3323) dtb_u_u3324) dtb_u_u3325) dtb_u_u3326) dtb_u_u3334) dtb_u_u3340) in (let dtb_u_u3359 = ((v_ifaceAuditRequested_u_udirect dtb_u_u3325) dtb_u_u3340) in (if dtb_u_u3359 then ((Obj.magic (((((((((v_auditCheckExeAt dtb_u_u3323) dtb_u_u3324) dtb_u_u3325) dtb_u_u3326) dtb_u_u3332) dtb_u_u3333) dtb_u_u3334) dtb_u_u3351) dtb_u_u3335)) dtb_u_u3340) else (let dtb_u_u3367 = ((((((((((v_summaryCheckExePartsAt_u_udirect dtb_u_u3323) dtb_u_u3324) dtb_u_u3325) dtb_u_u3326) dtb_u_u3332) dtb_u_u3333) dtb_u_u3334) dtb_u_u3351) dtb_u_u3335) dtb_u_u3340) in ((Obj.magic (((((((v_checkAndShadowWith dtb_u_u3323) dtb_u_u3324) dtb_u_u3325) dtb_u_u3326) dtb_u_u3334) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u3351))) (let dtb_u_u3369 = dtb_u_u3367 in (Obj.repr ((fun (dtb_u_u3370 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u3369)))))) dtb_u_u3340)))))))))))
# 1626 "Vuna/Compiler/Driver/Compile.vuna"
and v_summaryCheckExePartsAt = (fun (dtb_u_u3371 : string) (dtb_u_u3372 : string) (dtb_u_u3373 : string) (dtb_u_u3374 : string) (dtb_u_u3380 : int) (dtb_u_u3381 : bool) (dtb_u_u3382 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u3383 : t_ClosureMod B_dData_dList.t_List) (dtb_u_u3384 : string) -> (Obj.repr ((fun (dtb_u_u3389 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u3392 = ((((((((v_depIfacesOfWithAt_u_udirect dtb_u_u3371) dtb_u_u3372) dtb_u_u3373) dtb_u_u3374) dtb_u_u3380) dtb_u_u3382) dtb_u_u3383) dtb_u_u3389) in (match dtb_u_u3392 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u3393 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "cache-path=full") else 0) in ((Obj.magic (((((Driver_dDt.v_dtCheckWithProgramParts dtb_u_u3371) dtb_u_u3373) dtb_u_u3374) dtb_u_u3382) dtb_u_u3384)) dtb_u_u3389))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3394) -> (let dtb_u_u3402 = ((((((v_ownCleanModulesWith_u_udirect dtb_u_u3371) dtb_u_u3373) dtb_u_u3374) dtb_u_u3382) dtb_u_u3383) dtb_u_u3389) in (match dtb_u_u3402 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3403) -> (let dtb_u_u3404 = (if dtb_u_u3381 then B_dData_dList.C_List_Nil else dtb_u_u3403) in (let dtb_u_u3405 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-path=summary deps=" ^ (string_of_int (v_depPackageCount dtb_u_u3382)))) else 0) in (let dtb_u_u3406 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-own-clean=" ^ (string_of_int (B_dData_dList.v_length dtb_u_u3404)))) else 0) in ((Obj.magic (((((((Driver_dDt.v_dtCheckPackageIncrementalParts dtb_u_u3371) dtb_u_u3373) dtb_u_u3374) dtb_u_u3382) dtb_u_u3384) dtb_u_u3394) dtb_u_u3404)) dtb_u_u3389))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u3407 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-path=summary deps=" ^ (string_of_int (v_depPackageCount dtb_u_u3382)))) else 0) in ((Obj.magic ((((((Driver_dDt.v_dtCheckPackageWithIfacesParts dtb_u_u3371) dtb_u_u3373) dtb_u_u3374) dtb_u_u3382) dtb_u_u3384) dtb_u_u3394)) dtb_u_u3389))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))
# 1668 "Vuna/Compiler/Driver/Compile.vuna"
and v_auditCheckExeAt = (fun (dtb_u_u3408 : string) (dtb_u_u3409 : string) (dtb_u_u3410 : string) (dtb_u_u3411 : string) (dtb_u_u3417 : int) (dtb_u_u3418 : bool) (dtb_u_u3419 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u3420 : t_ClosureMod B_dData_dList.t_List) (dtb_u_u3421 : string) -> (Obj.repr ((fun (dtb_u_u3426 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u3429 = ((((((((((v_summaryCheckExePartsAt_u_udirect dtb_u_u3408) dtb_u_u3409) dtb_u_u3410) dtb_u_u3411) dtb_u_u3417) dtb_u_u3418) dtb_u_u3419) dtb_u_u3420) dtb_u_u3421) dtb_u_u3426) in (let dtb_u_u3437 = ((((((Driver_dDt.v_dtCheckWithProgramParts_u_udirect dtb_u_u3408) dtb_u_u3410) dtb_u_u3411) dtb_u_u3419) dtb_u_u3421) dtb_u_u3426) in (let dtb_u_u3438 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") ("iface-audit subject=check entry=" ^ dtb_u_u3421)) else 0) in (let dtb_u_u3444 = Obj.obj ((let dtb_u_u3447 = ((((v_auditCompare "check") dtb_u_u3421) (v_checkSignatureOf dtb_u_u3429)) (v_checkSignatureOf dtb_u_u3437)) in (Obj.repr ((fun (dtb_u_u3448 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u3447))))) in (let dtb_u_u3449 = (dtb_u_u3444 dtb_u_u3426) in (match dtb_u_u3449 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u3450) -> (let dtb_u_u3452 = (Base_dDiag.C_Check_ErrC (dtb_u_u3450)) in dtb_u_u3452)
  | Base_dDiag.C_Check_OkC (dtb_u_u3454) -> ((Obj.magic (((((((v_checkAndShadowWith dtb_u_u3408) dtb_u_u3409) dtb_u_u3410) dtb_u_u3411) dtb_u_u3419) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u3420))) (let dtb_u_u3456 = dtb_u_u3429 in (Obj.repr ((fun (dtb_u_u3457 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u3456)))))) dtb_u_u3426)
  | _ -> failwith "DT: impossible branch"
))))))))))
# 2162 "Vuna/Compiler/Driver/Compile.vuna"
and v_checkUncachedLibAt = (fun (dtb_u_u3458 : string) (dtb_u_u3459 : string) (dtb_u_u3460 : string) (dtb_u_u3461 : string) (dtb_u_u3467 : int) (dtb_u_u3468 : bool) (dtb_u_u3469 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u3470 : string B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u3475 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u3478 = ((v_elabFullRequested_u_udirect dtb_u_u3460) dtb_u_u3475) in (if dtb_u_u3478 then ((Obj.magic ((((((v_fullCheckLib dtb_u_u3458) dtb_u_u3459) dtb_u_u3460) dtb_u_u3461) dtb_u_u3469) dtb_u_u3470)) dtb_u_u3475) else (let dtb_u_u3486 = ((((((v_summaryClosureMods_u_udirect dtb_u_u3458) dtb_u_u3459) dtb_u_u3460) dtb_u_u3461) dtb_u_u3469) dtb_u_u3475) in (let dtb_u_u3494 = ((v_ifaceAuditRequested_u_udirect dtb_u_u3460) dtb_u_u3475) in (if dtb_u_u3494 then ((Obj.magic (((((((((v_auditCheckLibAt dtb_u_u3458) dtb_u_u3459) dtb_u_u3460) dtb_u_u3461) dtb_u_u3467) dtb_u_u3468) dtb_u_u3469) dtb_u_u3486) dtb_u_u3470)) dtb_u_u3475) else (let dtb_u_u3502 = ((((((((((v_summaryCheckLibPartsAt_u_udirect dtb_u_u3458) dtb_u_u3459) dtb_u_u3460) dtb_u_u3461) dtb_u_u3467) dtb_u_u3468) dtb_u_u3469) dtb_u_u3486) dtb_u_u3470) dtb_u_u3475) in ((Obj.magic (((((((v_checkAndShadowWith dtb_u_u3458) dtb_u_u3459) dtb_u_u3460) dtb_u_u3461) dtb_u_u3469) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u3486))) (let dtb_u_u3504 = dtb_u_u3502 in (Obj.repr ((fun (dtb_u_u3505 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u3504)))))) dtb_u_u3475)))))))))))
# 2179 "Vuna/Compiler/Driver/Compile.vuna"
and v_summaryCheckLibPartsAt = (fun (dtb_u_u3506 : string) (dtb_u_u3507 : string) (dtb_u_u3508 : string) (dtb_u_u3509 : string) (dtb_u_u3515 : int) (dtb_u_u3516 : bool) (dtb_u_u3517 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u3518 : t_ClosureMod B_dData_dList.t_List) (dtb_u_u3519 : string B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u3524 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u3527 = ((((((((v_depIfacesOfWithAt_u_udirect dtb_u_u3506) dtb_u_u3507) dtb_u_u3508) dtb_u_u3509) dtb_u_u3515) dtb_u_u3517) dtb_u_u3518) dtb_u_u3524) in (match dtb_u_u3527 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u3528 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "cache-path=full") else 0) in ((Obj.magic (((((Driver_dDt.v_dtCheckLibraryWithProgramParts dtb_u_u3506) dtb_u_u3508) dtb_u_u3509) dtb_u_u3517) dtb_u_u3519)) dtb_u_u3524))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3529) -> (let dtb_u_u3537 = ((((((v_ownCleanModulesWith_u_udirect dtb_u_u3506) dtb_u_u3508) dtb_u_u3509) dtb_u_u3517) dtb_u_u3518) dtb_u_u3524) in (match dtb_u_u3537 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3538) -> (let dtb_u_u3539 = (if dtb_u_u3516 then B_dData_dList.C_List_Nil else dtb_u_u3538) in (let dtb_u_u3540 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-path=summary deps=" ^ (string_of_int (v_depPackageCount dtb_u_u3517)))) else 0) in (let dtb_u_u3541 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-own-clean=" ^ (string_of_int (B_dData_dList.v_length dtb_u_u3539)))) else 0) in ((Obj.magic (((((((Driver_dDt.v_dtCheckLibraryPackageIncrementalParts dtb_u_u3506) dtb_u_u3508) dtb_u_u3509) dtb_u_u3517) dtb_u_u3519) dtb_u_u3529) dtb_u_u3539)) dtb_u_u3524))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u3542 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-path=summary deps=" ^ (string_of_int (v_depPackageCount dtb_u_u3517)))) else 0) in ((Obj.magic ((((((Driver_dDt.v_dtCheckLibraryPackageWithIfacesParts dtb_u_u3506) dtb_u_u3508) dtb_u_u3509) dtb_u_u3517) dtb_u_u3519) dtb_u_u3529)) dtb_u_u3524))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))
# 2218 "Vuna/Compiler/Driver/Compile.vuna"
and v_auditCheckLibAt = (fun (dtb_u_u3543 : string) (dtb_u_u3544 : string) (dtb_u_u3545 : string) (dtb_u_u3546 : string) (dtb_u_u3552 : int) (dtb_u_u3553 : bool) (dtb_u_u3554 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u3555 : t_ClosureMod B_dData_dList.t_List) (dtb_u_u3556 : string B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u3561 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u3564 = ((((((((((v_summaryCheckLibPartsAt_u_udirect dtb_u_u3543) dtb_u_u3544) dtb_u_u3545) dtb_u_u3546) dtb_u_u3552) dtb_u_u3553) dtb_u_u3554) dtb_u_u3555) dtb_u_u3556) dtb_u_u3561) in (let dtb_u_u3572 = ((((((Driver_dDt.v_dtCheckLibraryWithProgramParts_u_udirect dtb_u_u3543) dtb_u_u3545) dtb_u_u3546) dtb_u_u3554) dtb_u_u3556) dtb_u_u3561) in (let dtb_u_u3573 = (v_joinLines dtb_u_u3556) in (let dtb_u_u3574 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") ("iface-audit subject=check-lib entry=" ^ dtb_u_u3573)) else 0) in (let dtb_u_u3580 = Obj.obj ((let dtb_u_u3583 = ((((v_auditCompare "check-lib") dtb_u_u3573) (v_checkSignatureOf dtb_u_u3564)) (v_checkSignatureOf dtb_u_u3572)) in (Obj.repr ((fun (dtb_u_u3584 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u3583))))) in (let dtb_u_u3585 = (dtb_u_u3580 dtb_u_u3561) in (match dtb_u_u3585 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u3586) -> (let dtb_u_u3588 = (Base_dDiag.C_Check_ErrC (dtb_u_u3586)) in dtb_u_u3588)
  | Base_dDiag.C_Check_OkC (dtb_u_u3590) -> ((Obj.magic ((((((v_checkAndShadow dtb_u_u3543) dtb_u_u3544) dtb_u_u3545) dtb_u_u3546) dtb_u_u3554) (let dtb_u_u3592 = dtb_u_u3564 in (Obj.repr ((fun (dtb_u_u3593 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u3592)))))) dtb_u_u3561)
  | _ -> failwith "DT: impossible branch"
)))))))))))
# 94 "Vuna/Compiler/Driver/Compile.vuna"
and v_checkPackageAt_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (fuel : int) (release : bool) (wantWarnings : bool) (pkg : Frontend_dPackages_dPkg.t_Package) _u_ueffTok -> (let dtb_u_u3083 = ((Frontend_dPackages_dPkg.v_contextWithRelease release) (Frontend_dPackages_dPkg.v_packageContext pkg)) in (let dtb_u_u3091 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) (Frontend_dPackages_dPkg.v_packageEntry pkg)) _u_ueffTok) in (if dtb_u_u3091 then (let dtb_u_u3099 = (((((((((v_checkUncachedExeAt_u_udirect nFs) nClock) nEnv) nProcess) fuel) wantWarnings) dtb_u_u3083) (Frontend_dPackages_dPkg.v_packageEntry pkg)) _u_ueffTok) in (let dtb_u_u3100 = dtb_u_u3099 in (match dtb_u_u3100 with
  | Base_dDiag.C_Check_OkC (dtb_u_u3101) -> (match dtb_u_u3101 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3102; B_dData_dPair.f_Pair_second = dtb_u_u3103 } -> (match (Frontend_dPackages_dPkg.v_packageExports pkg) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u3105 = (Base_dDiag.C_Check_OkC (dtb_u_u3102)) in dtb_u_u3105)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3107) -> (let dtb_u_u3115 = ((v_elabFullRequested_u_udirect nEnv) _u_ueffTok) in (let dtb_u_u3116 = ((v_allNamesIn dtb_u_u3107) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) dtb_u_u3103)) in (if (if (B_dData_dBool.v_not dtb_u_u3115) then dtb_u_u3116 else false) then (let dtb_u_u3117 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("check-lib-skip covered=" ^ (string_of_int (B_dData_dList.v_length dtb_u_u3107)))) else 0) in (let dtb_u_u3119 = (Base_dDiag.C_Check_OkC (dtb_u_u3102)) in dtb_u_u3119)) else (let dtb_u_u3128 = (((((((((v_checkUncachedLibAt_u_udirect nFs) nClock) nEnv) nProcess) fuel) false) dtb_u_u3083) dtb_u_u3107) _u_ueffTok) in (let dtb_u_u3129 = dtb_u_u3128 in (match dtb_u_u3129 with
  | Base_dDiag.C_Check_OkC (dtb_u_u3130) -> (match dtb_u_u3130 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3131; B_dData_dPair.f_Pair_second = dtb_u_u3132 } -> (let dtb_u_u3134 = (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append dtb_u_u3102) dtb_u_u3131))) in dtb_u_u3134)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u3136) -> (let dtb_u_u3138 = (Base_dDiag.C_Check_ErrC (dtb_u_u3136)) in dtb_u_u3138)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u3140) -> (let dtb_u_u3142 = (Base_dDiag.C_Check_ErrC (dtb_u_u3140)) in dtb_u_u3142)
  | _ -> failwith "DT: impossible branch"
))) else (match (Frontend_dPackages_dPkg.v_packageExports pkg) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u3145 = ((((Base_dDiagnostics_dPkg.v_pkgAt1 ((Frontend_dPackages_dPkg.v_packageDir pkg) ^ "/vuna.toml")) 1) (Base_dDiagnostics_dPkg.C_PkgErr_LibraryWithoutEntry ((Frontend_dPackages_dPkg.v_packageName pkg)))) (Frontend_dPackages_dPkg.v_packageName pkg)) in dtb_u_u3145)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3147) -> (let dtb_u_u3155 = (((((((((v_checkUncachedLibAt_u_udirect nFs) nClock) nEnv) nProcess) fuel) wantWarnings) dtb_u_u3083) dtb_u_u3147) _u_ueffTok) in (let dtb_u_u3156 = dtb_u_u3155 in (match dtb_u_u3156 with
  | Base_dDiag.C_Check_OkC (dtb_u_u3157) -> (match dtb_u_u3157 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u3158; B_dData_dPair.f_Pair_second = dtb_u_u3159 } -> (let dtb_u_u3161 = (Base_dDiag.C_Check_OkC (dtb_u_u3158)) in dtb_u_u3161)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u3163) -> (let dtb_u_u3165 = (Base_dDiag.C_Check_ErrC (dtb_u_u3163)) in dtb_u_u3165)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
# 1072 "Vuna/Compiler/Driver/Compile.vuna"
and v_depIfacesOfWithAt_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (fuel : int) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) _u_ueffTok -> (match (ctx).Frontend_dPackages_dPkg.f_PackageContext_contextPackage with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u3180 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u3180)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3182) -> (let dtb_u_u3190 = ((((((((v_depIfacePairsEffAt_u_udirect nFs) nClock) nEnv) nProcess) fuel) ctx) mods) _u_ueffTok) in (match dtb_u_u3190 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u3191 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "iface-reject=dep-iface-missing") else 0) in (let dtb_u_u3193 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u3193))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3195) -> (let dtb_u_u3197 = (B_dData_dMaybe.C_Maybe_Just (((B_dData_dList.v_map B_dData_dPair.v_secondOf) dtb_u_u3195))) in dtb_u_u3197)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
# 1140 "Vuna/Compiler/Driver/Compile.vuna"
and v_buildDepEffAt_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (fuel : int) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (p : string) _u_ueffTok -> (if (fuel <= 0) then (let dtb_u_u3212 = false in dtb_u_u3212) else (match ((v_findDepPackage p) (v_depPackageList ctx)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u3215 = false in dtb_u_u3215)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3217) -> (let dtb_u_u3218 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("dep-build=" ^ p)) else 0) in (let dtb_u_u3226 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.iface.dep-build") _u_ueffTok) in (let dtb_u_u3234 = (((((((((v_checkPackageAt_u_udirect nFs) nClock) nEnv) nProcess) (fuel - 1)) false) false) dtb_u_u3217) _u_ueffTok) in (let dtb_u_u3236 = (match dtb_u_u3234 with
  | Base_dDiag.C_Check_OkC (dtb_u_u3238) -> true
  | Base_dDiag.C_Check_ErrC (dtb_u_u3239) -> false
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u3236))))
  | _ -> failwith "DT: impossible branch"
)))
# 1158 "Vuna/Compiler/Driver/Compile.vuna"
and v_depPairsOfPkgAt_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (fuel : int) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (p : string) _u_ueffTok -> (let dtb_u_u3260 = ((((((v_probeRequired_u_udirect nFs) nEnv) ctx) mods) p) _u_ueffTok) in (match dtb_u_u3260 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3261) -> (let dtb_u_u3263 = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u3261)) in dtb_u_u3263)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u3272 = ((((((((v_buildDepEffAt_u_udirect nFs) nClock) nEnv) nProcess) fuel) ctx) p) _u_ueffTok) in (if dtb_u_u3272 then ((Obj.magic (((((v_probeRequired nFs) nEnv) ctx) mods) p)) _u_ueffTok) else (let dtb_u_u3274 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u3274)))
  | _ -> failwith "DT: impossible branch"
)))
# 1178 "Vuna/Compiler/Driver/Compile.vuna"
and v_goPkgsAt_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (mc0 : int) (mc1 : Frontend_dPackages_dPkg.t_PackageContext) (mc2 : t_ClosureMod B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) (mc4 : (t_ClosureMod, Driver_dIface.t_ModuleIface) B_dData_dPair.t_Pair B_dData_dList.t_List) _u_ueffTok -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u3290, dtb_u_u3291) -> (let dtb_u_u3299 = (((((((((v_depPairsOfPkgAt_u_udirect nFs) nClock) nEnv) nProcess) mc0) mc1) mc2) dtb_u_u3290) _u_ueffTok) in (match dtb_u_u3299 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u3301 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u3301)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3303) -> ((Obj.magic (((((((((v_goPkgsAt nFs) nClock) nEnv) nProcess) mc0) mc1) mc2) dtb_u_u3291) ((B_dData_dList.v_append mc4) dtb_u_u3303))) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (v_duplicatePairNames mc4) then (let dtb_u_u3304 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "iface-reject=dep-module-duplicate") else 0) in (let dtb_u_u3306 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u3306)) else (let dtb_u_u3309 = (B_dData_dMaybe.C_Maybe_Just (mc4)) in dtb_u_u3309))
  | _ -> failwith "DT: impossible branch"
))
# 1219 "Vuna/Compiler/Driver/Compile.vuna"
and v_depIfacePairsEffAt_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (fuel : int) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) _u_ueffTok -> ((Obj.magic (((((((((v_goPkgsAt nFs) nClock) nEnv) nProcess) fuel) ctx) mods) ((v_distinctPkgs ((v_depModsOf ctx) mods)) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil)) _u_ueffTok))
# 1607 "Vuna/Compiler/Driver/Compile.vuna"
and v_checkUncachedExeAt_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (fuel : int) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) _u_ueffTok -> (let dtb_u_u3343 = ((v_elabFullRequested_u_udirect nEnv) _u_ueffTok) in (if dtb_u_u3343 then ((Obj.magic ((((((v_fullCheckExe nFs) nClock) nEnv) nProcess) ctx) entry)) _u_ueffTok) else (let dtb_u_u3351 = ((((((v_summaryClosureMods_u_udirect nFs) nClock) nEnv) nProcess) ctx) _u_ueffTok) in (let dtb_u_u3359 = ((v_ifaceAuditRequested_u_udirect nEnv) _u_ueffTok) in (if dtb_u_u3359 then ((Obj.magic (((((((((v_auditCheckExeAt nFs) nClock) nEnv) nProcess) fuel) wantWarnings) ctx) dtb_u_u3351) entry)) _u_ueffTok) else (let dtb_u_u3367 = ((((((((((v_summaryCheckExePartsAt_u_udirect nFs) nClock) nEnv) nProcess) fuel) wantWarnings) ctx) dtb_u_u3351) entry) _u_ueffTok) in ((Obj.magic (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u3351))) (let dtb_u_u3369 = dtb_u_u3367 in (Obj.repr ((fun (dtb_u_u3370 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u3369)))))) _u_ueffTok))))))))
# 1626 "Vuna/Compiler/Driver/Compile.vuna"
and v_summaryCheckExePartsAt_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (fuel : int) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (entry : string) _u_ueffTok -> (let dtb_u_u3392 = ((((((((v_depIfacesOfWithAt_u_udirect nFs) nClock) nEnv) nProcess) fuel) ctx) mods) _u_ueffTok) in (match dtb_u_u3392 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u3393 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "cache-path=full") else 0) in ((Obj.magic (((((Driver_dDt.v_dtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry)) _u_ueffTok))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3394) -> (let dtb_u_u3402 = ((((((v_ownCleanModulesWith_u_udirect nFs) nEnv) nProcess) ctx) mods) _u_ueffTok) in (match dtb_u_u3402 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3403) -> (let dtb_u_u3404 = (if wantWarnings then B_dData_dList.C_List_Nil else dtb_u_u3403) in (let dtb_u_u3405 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-path=summary deps=" ^ (string_of_int (v_depPackageCount ctx)))) else 0) in (let dtb_u_u3406 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-own-clean=" ^ (string_of_int (B_dData_dList.v_length dtb_u_u3404)))) else 0) in ((Obj.magic (((((((Driver_dDt.v_dtCheckPackageIncrementalParts nFs) nEnv) nProcess) ctx) entry) dtb_u_u3394) dtb_u_u3404)) _u_ueffTok))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u3407 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-path=summary deps=" ^ (string_of_int (v_depPackageCount ctx)))) else 0) in ((Obj.magic ((((((Driver_dDt.v_dtCheckPackageWithIfacesParts nFs) nEnv) nProcess) ctx) entry) dtb_u_u3394)) _u_ueffTok))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 1668 "Vuna/Compiler/Driver/Compile.vuna"
and v_auditCheckExeAt_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (fuel : int) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (entry : string) _u_ueffTok -> (let dtb_u_u3429 = ((((((((((v_summaryCheckExePartsAt_u_udirect nFs) nClock) nEnv) nProcess) fuel) wantWarnings) ctx) mods) entry) _u_ueffTok) in (let dtb_u_u3437 = ((((((Driver_dDt.v_dtCheckWithProgramParts_u_udirect nFs) nEnv) nProcess) ctx) entry) _u_ueffTok) in (let dtb_u_u3438 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") ("iface-audit subject=check entry=" ^ entry)) else 0) in (let dtb_u_u3444 = Obj.obj ((let dtb_u_u3447 = ((((v_auditCompare "check") entry) (v_checkSignatureOf dtb_u_u3429)) (v_checkSignatureOf dtb_u_u3437)) in (Obj.repr ((fun (dtb_u_u3448 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u3447))))) in (let dtb_u_u3449 = (dtb_u_u3444 _u_ueffTok) in (match dtb_u_u3449 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u3450) -> (let dtb_u_u3452 = (Base_dDiag.C_Check_ErrC (dtb_u_u3450)) in dtb_u_u3452)
  | Base_dDiag.C_Check_OkC (dtb_u_u3454) -> ((Obj.magic (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) (B_dData_dMaybe.C_Maybe_Just (mods))) (let dtb_u_u3456 = dtb_u_u3429 in (Obj.repr ((fun (dtb_u_u3457 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u3456)))))) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
)))))))
# 2162 "Vuna/Compiler/Driver/Compile.vuna"
and v_checkUncachedLibAt_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (fuel : int) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u3478 = ((v_elabFullRequested_u_udirect nEnv) _u_ueffTok) in (if dtb_u_u3478 then ((Obj.magic ((((((v_fullCheckLib nFs) nClock) nEnv) nProcess) ctx) names)) _u_ueffTok) else (let dtb_u_u3486 = ((((((v_summaryClosureMods_u_udirect nFs) nClock) nEnv) nProcess) ctx) _u_ueffTok) in (let dtb_u_u3494 = ((v_ifaceAuditRequested_u_udirect nEnv) _u_ueffTok) in (if dtb_u_u3494 then ((Obj.magic (((((((((v_auditCheckLibAt nFs) nClock) nEnv) nProcess) fuel) wantWarnings) ctx) dtb_u_u3486) names)) _u_ueffTok) else (let dtb_u_u3502 = ((((((((((v_summaryCheckLibPartsAt_u_udirect nFs) nClock) nEnv) nProcess) fuel) wantWarnings) ctx) dtb_u_u3486) names) _u_ueffTok) in ((Obj.magic (((((((v_checkAndShadowWith nFs) nClock) nEnv) nProcess) ctx) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u3486))) (let dtb_u_u3504 = dtb_u_u3502 in (Obj.repr ((fun (dtb_u_u3505 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u3504)))))) _u_ueffTok))))))))
# 2179 "Vuna/Compiler/Driver/Compile.vuna"
and v_summaryCheckLibPartsAt_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (fuel : int) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (names : string B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u3527 = ((((((((v_depIfacesOfWithAt_u_udirect nFs) nClock) nEnv) nProcess) fuel) ctx) mods) _u_ueffTok) in (match dtb_u_u3527 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u3528 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") "cache-path=full") else 0) in ((Obj.magic (((((Driver_dDt.v_dtCheckLibraryWithProgramParts nFs) nEnv) nProcess) ctx) names)) _u_ueffTok))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3529) -> (let dtb_u_u3537 = ((((((v_ownCleanModulesWith_u_udirect nFs) nEnv) nProcess) ctx) mods) _u_ueffTok) in (match dtb_u_u3537 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3538) -> (let dtb_u_u3539 = (if wantWarnings then B_dData_dList.C_List_Nil else dtb_u_u3538) in (let dtb_u_u3540 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-path=summary deps=" ^ (string_of_int (v_depPackageCount ctx)))) else 0) in (let dtb_u_u3541 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-own-clean=" ^ (string_of_int (B_dData_dList.v_length dtb_u_u3539)))) else 0) in ((Obj.magic (((((((Driver_dDt.v_dtCheckLibraryPackageIncrementalParts nFs) nEnv) nProcess) ctx) names) dtb_u_u3529) dtb_u_u3539)) _u_ueffTok))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u3542 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Compile") ("cache-path=summary deps=" ^ (string_of_int (v_depPackageCount ctx)))) else 0) in ((Obj.magic ((((((Driver_dDt.v_dtCheckLibraryPackageWithIfacesParts nFs) nEnv) nProcess) ctx) names) dtb_u_u3529)) _u_ueffTok))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 2218 "Vuna/Compiler/Driver/Compile.vuna"
and v_auditCheckLibAt_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (fuel : int) (wantWarnings : bool) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : t_ClosureMod B_dData_dList.t_List) (names : string B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u3564 = ((((((((((v_summaryCheckLibPartsAt_u_udirect nFs) nClock) nEnv) nProcess) fuel) wantWarnings) ctx) mods) names) _u_ueffTok) in (let dtb_u_u3572 = ((((((Driver_dDt.v_dtCheckLibraryWithProgramParts_u_udirect nFs) nEnv) nProcess) ctx) names) _u_ueffTok) in (let dtb_u_u3573 = (v_joinLines names) in (let dtb_u_u3574 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Compile") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Compile") ("iface-audit subject=check-lib entry=" ^ dtb_u_u3573)) else 0) in (let dtb_u_u3580 = Obj.obj ((let dtb_u_u3583 = ((((v_auditCompare "check-lib") dtb_u_u3573) (v_checkSignatureOf dtb_u_u3564)) (v_checkSignatureOf dtb_u_u3572)) in (Obj.repr ((fun (dtb_u_u3584 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u3583))))) in (let dtb_u_u3585 = (dtb_u_u3580 _u_ueffTok) in (match dtb_u_u3585 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u3586) -> (let dtb_u_u3588 = (Base_dDiag.C_Check_ErrC (dtb_u_u3586)) in dtb_u_u3588)
  | Base_dDiag.C_Check_OkC (dtb_u_u3590) -> ((Obj.magic ((((((v_checkAndShadow nFs) nClock) nEnv) nProcess) ctx) (let dtb_u_u3592 = dtb_u_u3564 in (Obj.repr ((fun (dtb_u_u3593 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u3592)))))) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))))))))

# 90 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkPackage = (fun nFs nClock nEnv nProcess -> (((((v_checkPackageAt nFs) nClock) nEnv) nProcess) 64))

# 90 "Vuna/Compiler/Driver/Compile.vuna"
let v_checkPackage_u_udirect = (fun _u_ueta0 _u_ueta1 _u_ueta2 _u_ueta3 _u_ueta4 _u_ueta5 _u_ueta6 _u_ueffTok -> ((Obj.magic (((((((v_checkPackage _u_ueta0) _u_ueta1) _u_ueta2) _u_ueta3) _u_ueta4) _u_ueta5) _u_ueta6)) _u_ueffTok))

# 1069 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesOfWith = (fun nFs nClock nEnv nProcess -> (((((v_depIfacesOfWithAt nFs) nClock) nEnv) nProcess) 64))

# 1069 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesOfWith_u_udirect = (fun _u_ueta0 _u_ueta1 _u_ueta2 _u_ueta3 _u_ueta4 _u_ueta5 _u_ueffTok -> ((Obj.magic ((((((v_depIfacesOfWith _u_ueta0) _u_ueta1) _u_ueta2) _u_ueta3) _u_ueta4) _u_ueta5)) _u_ueffTok))

# 1061 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesOf = (fun (dtb_u_u3612 : string) (dtb_u_u3613 : string) (dtb_u_u3614 : string) (dtb_u_u3615 : string) (dtb_u_u3621 : Frontend_dPackages_dPkg.t_PackageContext) -> (Obj.repr ((fun (dtb_u_u3626 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u3629 = ((((((v_ifaceModsEff_u_udirect dtb_u_u3612) dtb_u_u3613) dtb_u_u3614) dtb_u_u3615) dtb_u_u3621) dtb_u_u3626) in ((Obj.magic ((((((v_depIfacesOfWith dtb_u_u3612) dtb_u_u3613) dtb_u_u3614) dtb_u_u3615) dtb_u_u3621) dtb_u_u3629)) dtb_u_u3626))))))

# 1061 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesOf_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) _u_ueffTok -> (let dtb_u_u3629 = ((((((v_ifaceModsEff_u_udirect nFs) nClock) nEnv) nProcess) ctx) _u_ueffTok) in ((Obj.magic ((((((v_depIfacesOfWith nFs) nClock) nEnv) nProcess) ctx) dtb_u_u3629)) _u_ueffTok)))

# 1224 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForCheck = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (((((v_depIfacesOf nFs) nClock) nEnv) nProcess) ctx))

# 1224 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForCheck_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) _u_ueffTok -> ((Obj.magic (((((v_depIfacesOf nFs) nClock) nEnv) nProcess) ctx)) _u_ueffTok))

# 1322 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForTool = (fun (dtb_u_u3640 : string) (dtb_u_u3641 : string) (dtb_u_u3642 : string) (dtb_u_u3643 : string) (dtb_u_u3649 : Frontend_dPackages_dPkg.t_PackageContext) -> (Obj.repr ((fun (dtb_u_u3654 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u3657 = ((v_toolEnabled_u_udirect dtb_u_u3642) dtb_u_u3654) in (if dtb_u_u3657 then ((Obj.magic (((((v_depIfacesOf dtb_u_u3640) dtb_u_u3641) dtb_u_u3642) dtb_u_u3643) dtb_u_u3649)) dtb_u_u3654) else (let dtb_u_u3659 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u3659)))))))

# 1322 "Vuna/Compiler/Driver/Compile.vuna"
let v_depIfacesForTool_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) _u_ueffTok -> (let dtb_u_u3657 = ((v_toolEnabled_u_udirect nEnv) _u_ueffTok) in (if dtb_u_u3657 then ((Obj.magic (((((v_depIfacesOf nFs) nClock) nEnv) nProcess) ctx)) _u_ueffTok) else (let dtb_u_u3659 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u3659))))

# 2237 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitInputsOf = (fun (dtb_u_u3661 : string) (dtb_u_u3662 : string) (dtb_u_u3663 : string) (dtb_u_u3664 : string) (dtb_u_u3670 : Frontend_dPackages_dPkg.t_PackageContext) -> (Obj.repr ((fun (dtb_u_u3675 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u3678 = ((((((v_ifaceModsEff_u_udirect dtb_u_u3661) dtb_u_u3662) dtb_u_u3663) dtb_u_u3664) dtb_u_u3670) dtb_u_u3675) in (let dtb_u_u3686 = (((((((v_depIfacesOfWith_u_udirect dtb_u_u3661) dtb_u_u3662) dtb_u_u3663) dtb_u_u3664) dtb_u_u3670) dtb_u_u3678) dtb_u_u3675) in (let dtb_u_u3688 = { f_SplitInputs_siClosure = dtb_u_u3678; f_SplitInputs_siDepIfaces = dtb_u_u3686 } in dtb_u_u3688)))))))

# 2237 "Vuna/Compiler/Driver/Compile.vuna"
let v_splitInputsOf_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) _u_ueffTok -> (let dtb_u_u3678 = ((((((v_ifaceModsEff_u_udirect nFs) nClock) nEnv) nProcess) ctx) _u_ueffTok) in (let dtb_u_u3686 = (((((((v_depIfacesOfWith_u_udirect nFs) nClock) nEnv) nProcess) ctx) dtb_u_u3678) _u_ueffTok) in (let dtb_u_u3688 = { f_SplitInputs_siClosure = dtb_u_u3678; f_SplitInputs_siDepIfaces = dtb_u_u3686 } in dtb_u_u3688))))

# 172 "Vuna/Compiler/Driver/Compile.vuna"
let v_compileToDir = (fun (dtb_u_u3690 : string) (dtb_u_u3691 : string) (dtb_u_u3692 : string) (dtb_u_u3693 : string) (dtb_u_u3694 : string) (dtb_u_u3701 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u3702 : string) (dtb_u_u3703 : bool) (dtb_u_u3704 : string) -> (Obj.repr ((fun (dtb_u_u3709 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u3712 = ((((((v_splitInputsOf_u_udirect dtb_u_u3690) dtb_u_u3692) dtb_u_u3693) dtb_u_u3694) dtb_u_u3701) dtb_u_u3709) in ((Obj.magic ((((((((((v_compileToDirGiven dtb_u_u3690) dtb_u_u3691) dtb_u_u3692) dtb_u_u3693) dtb_u_u3694) dtb_u_u3712) dtb_u_u3701) dtb_u_u3702) dtb_u_u3703) dtb_u_u3704)) dtb_u_u3709))))))

# 172 "Vuna/Compiler/Driver/Compile.vuna"
let v_compileToDir_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) _u_ueffTok -> (let dtb_u_u3712 = ((((((v_splitInputsOf_u_udirect nFs) nClock) nEnv) nProcess) ctx) _u_ueffTok) in ((Obj.magic ((((((((((v_compileToDirGiven nFs) nConsole) nClock) nEnv) nProcess) dtb_u_u3712) ctx) entry) printResult) outDir)) _u_ueffTok)))

# 351 "Vuna/Compiler/Driver/Compile.vuna"
let v_buildSplit = (fun (dtb_u_u3713 : string) (dtb_u_u3714 : string) (dtb_u_u3715 : string) (dtb_u_u3716 : string) (dtb_u_u3717 : string) (dtb_u_u3724 : string) (dtb_u_u3725 : string) -> (Obj.repr ((fun (dtb_u_u3730 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u3733 = ((((Frontend_dPackages_dPkg.v_loadPackage_u_udirect dtb_u_u3713) dtb_u_u3716) dtb_u_u3724) dtb_u_u3730) in (match dtb_u_u3733 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u3734) -> (let dtb_u_u3736 = (Base_dDiag.C_Check_ErrC (dtb_u_u3734)) in dtb_u_u3736)
  | Base_dDiag.C_Check_OkC (dtb_u_u3738) -> (let dtb_u_u3746 = ((((((((((v_compileToDir_u_udirect dtb_u_u3713) dtb_u_u3714) dtb_u_u3715) dtb_u_u3716) dtb_u_u3717) (Frontend_dPackages_dPkg.v_packageContext dtb_u_u3738)) (Frontend_dPackages_dPkg.v_packageEntry dtb_u_u3738)) true) dtb_u_u3725) dtb_u_u3730) in (let dtb_u_u3748 = (match dtb_u_u3746 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u3750) -> (Base_dDiag.C_Check_ErrC (dtb_u_u3750))
  | Base_dDiag.C_Check_OkC (dtb_u_u3751) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb_u_u3751)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u3748))
  | _ -> failwith "DT: impossible branch"
))))))

# 351 "Vuna/Compiler/Driver/Compile.vuna"
let v_buildSplit_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (dir : string) (outDir : string) _u_ueffTok -> (let dtb_u_u3733 = ((((Frontend_dPackages_dPkg.v_loadPackage_u_udirect nFs) nEnv) dir) _u_ueffTok) in (match dtb_u_u3733 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u3734) -> (let dtb_u_u3736 = (Base_dDiag.C_Check_ErrC (dtb_u_u3734)) in dtb_u_u3736)
  | Base_dDiag.C_Check_OkC (dtb_u_u3738) -> (let dtb_u_u3746 = ((((((((((v_compileToDir_u_udirect nFs) nConsole) nClock) nEnv) nProcess) (Frontend_dPackages_dPkg.v_packageContext dtb_u_u3738)) (Frontend_dPackages_dPkg.v_packageEntry dtb_u_u3738)) true) outDir) _u_ueffTok) in (let dtb_u_u3748 = (match dtb_u_u3746 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u3750) -> (Base_dDiag.C_Check_ErrC (dtb_u_u3750))
  | Base_dDiag.C_Check_OkC (dtb_u_u3751) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb_u_u3751)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u3748))
  | _ -> failwith "DT: impossible branch"
)))

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
