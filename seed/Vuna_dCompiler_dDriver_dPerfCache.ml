open Vuna_runtime
# 31 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheSchema = "vuna-unit-cache 2"

# 35 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheCodec = "split-file 1"

# 38 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheTag = (fun (nFs : string) (nEnv : string) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dcompilerTagEff nFs) nEnv)) (fun tag -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (String.concat "" [v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheSchema; "/"; tag])))))

# 52 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dhashTextOf = (fun (s : string) -> (bi_strFromInt (Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dtextHashOf s)))

# 46 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheDir = (fun (nFs : string) (nEnv : string) (nProcess : string) (pkg : string) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (String.concat "" [root; "/units/"; (v_Vuna_dCompiler_dDriver_dPerfCache_dhashTextOf pkg)])))))

# 70 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dcharSafe = (fun (c : int) -> (if (c = 46) then 95 else c))

# 67 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitNameSafe = (fun (s : string) -> (Base_dData_dList.dtp_pack ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dDriver_dPerfCache_dcharSafe) (Base_dData_dList.dtp_unpack s))))

# 59 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheFileName = (fun (name : string) (key : string) -> ((fun h1 -> ((fun h2 -> ((fun h3 -> (String.concat "" [(v_Vuna_dCompiler_dDriver_dPerfCache_dunitNameSafe name); "-"; (bi_strFromInt h1); "-"; (bi_strFromInt h2); "-"; (bi_strFromInt h3); ".unit"])) (Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dtextHashOf ("k3:" ^ key)))) (Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dtextHashOf ("k2:" ^ key)))) (Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dtextHashOf ("k1:" ^ key))))

# 55 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCachePath = (fun (dir : string) (name : string) (key : string) -> (String.concat "" [dir; "/"; ((v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheFileName name) key)]))

# 76 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheEntryDir = (fun (base : string) (entryKey : string) -> (String.concat "" [base; "/e-"; (bi_strFromInt (Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dtextHashOf ("entry:" ^ entryKey))); "-"; (bi_strFromInt (Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dtextHashOf ("entry2:" ^ entryKey)))]))

# 80 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheEntryKeyOf = (fun (keys : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match ((Base_dData_dList.v_Base_dData_dList_dlookupPair "__entry__") keys) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__0) -> dtb__0
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dsafeRemoveFile = (fun (nFs : string) (nProcess : string) (path : string) -> ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsRemoveFile nFs) path))

# 122 "Vuna/Compiler/Driver/PerfCache.vuna"
let rec v_Vuna_dCompiler_dDriver_dPerfCache_ddropFiles = (fun (nFs : string) (nProcess : string) (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1, dtb__2) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dDriver_dPerfCache_dsafeRemoveFile nFs) nProcess) (String.concat "" [mc0; "/"; dtb__1]))) (fun _u -> ((((v_Vuna_dCompiler_dDriver_dPerfCache_ddropFiles nFs) nProcess) mc0) dtb__2)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_ddropDirFiles = (fun (nFs : string) (nProcess : string) (dir : string) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadDir nFs) dir)) (fun names -> ((((v_Vuna_dCompiler_dDriver_dPerfCache_ddropFiles nFs) nProcess) dir) names))))

# 97 "Vuna/Compiler/Driver/PerfCache.vuna"
let rec v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries = (fun (nFs : string) (nProcess : string) (mc0 : string) (mc1 : string) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__3, dtb__4) -> ((fun path -> (if (path = mc1) then (((((v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries nFs) nProcess) mc0) mc1) dtb__4) else (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsIsDirectory nFs) path)) (fun isDir -> (if isDir then (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dDriver_dPerfCache_ddropDirFiles nFs) nProcess) path)) (fun _u -> (((((v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries nFs) nProcess) mc0) mc1) dtb__4))) else (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dDriver_dPerfCache_dsafeRemoveFile nFs) nProcess) path)) (fun _u -> (((((v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries nFs) nProcess) mc0) mc1) dtb__4)))))))) (String.concat "" [mc0; "/"; dtb__3]))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheGc = (fun (nFs : string) (nProcess : string) (base : string) (keepDir : string) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirEff nFs) nProcess) base)) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadDir nFs) base)) (fun names -> (((((v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries nFs) nProcess) base) keepDir) names))))))

# 141 "Vuna/Compiler/Driver/PerfCache.vuna"
let rec v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo = (fun (nFs : string) (nProcess : string) (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__5, dtb__6) -> ((fun path -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__5) mc1) then (((((v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo nFs) nProcess) mc0) mc1) dtb__6) else (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) path)) (fun exists -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (if exists then ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsIsDirectory nFs) path) else ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) false))) (fun isDir -> (if (if exists then isDir else false) then (((((v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo nFs) nProcess) mc0) mc1) dtb__6) else (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dDriver_dPerfCache_dsafeRemoveFile nFs) nProcess) path)) (fun _u -> (((((v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo nFs) nProcess) mc0) mc1) dtb__6)))))))))) (String.concat "" [mc0; "/"; dtb__5]))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 134 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheBucketGc = (fun (nFs : string) (nProcess : string) (dir : string) (keepNames : string Base_dData_dList.t_Base_dData_dList_dList) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirEff nFs) nProcess) dir)) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadDir nFs) dir)) (fun names -> (((((v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo nFs) nProcess) dir) keepNames) names))))))

# 159 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheRead = (fun (nFs : string) (nEnv : string) (dir : string) (name : string) (key : string) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheTag nFs) nEnv)) (fun tag -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreReadEff nFs) tag) v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheCodec) (((v_Vuna_dCompiler_dDriver_dPerfCache_dunitCachePath dir) name) key))) (fun payload -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match payload with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__7) -> (Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_ddecSplitFileComplete dtb__7)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))))

# 170 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheWrite = (fun (nFs : string) (nEnv : string) (nProcess : string) (dir : string) (name : string) (key : string) (sf : Vuna_dCompiler_dDriver_dSplit.t_Vuna_dCompiler_dDriver_dSplit_dSplitFile) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirEff nFs) nProcess) dir)) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheTag nFs) nEnv)) (fun tag -> (((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreWriteEff nFs) tag) v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheCodec) (((v_Vuna_dCompiler_dDriver_dPerfCache_dunitCachePath dir) name) key)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTop Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dencSplitFile) sf)))))))
