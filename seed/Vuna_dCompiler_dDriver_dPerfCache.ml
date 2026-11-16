open Vuna_runtime
# 31 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheSchema = "vuna-unit-cache 2"

# 35 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheCodec = "split-file 1"

# 38 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheTag = (fun nFs nEnv -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dcompilerTagEff nFs) nEnv)) (fun tag -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" [v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheSchema; "/"; tag])))))

# 50 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dhashTextOf = (fun s -> (bi_strFromInt (Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dtextHashOf s)))

# 45 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheDir = (fun nFs nEnv nProcess pkg -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" [root; "/units/"; (v_Vuna_dCompiler_dDriver_dPerfCache_dhashTextOf pkg)])))))

# 68 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dcharSafe = (fun c -> (if (c = 46) then 95 else c))

# 65 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitNameSafe = (fun s -> (Base_dList.dtp_pack ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dPerfCache_dcharSafe) (Base_dList.dtp_unpack s))))

# 57 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheFileName = (fun name key -> ((fun h1 -> ((fun h2 -> ((fun h3 -> (String.concat "" [(v_Vuna_dCompiler_dDriver_dPerfCache_dunitNameSafe name); "-"; (bi_strFromInt h1); "-"; (bi_strFromInt h2); "-"; (bi_strFromInt h3); ".unit"])) (Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dtextHashOf ("k3:" ^ key)))) (Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dtextHashOf ("k2:" ^ key)))) (Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dtextHashOf ("k1:" ^ key))))

# 53 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCachePath = (fun dir name key -> (String.concat "" [dir; "/"; ((v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheFileName name) key)]))

# 74 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheEntryDir = (fun base entryKey -> (String.concat "" [base; "/e-"; (bi_strFromInt (Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dtextHashOf ("entry:" ^ entryKey))); "-"; (bi_strFromInt (Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dtextHashOf ("entry2:" ^ entryKey)))]))

# 78 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheEntryKeyOf = (fun keys -> (match ((Base_dList.v_Base_dList_dlookupPair "__entry__") keys) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0) -> dtb__0
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 84 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dsafeRemoveFile = (fun nFs nProcess path -> ((Base_dEffFs.v_Base_dEffFs_dfsRemoveFile nFs) path))

# 113 "Vuna/Compiler/Driver/PerfCache.vuna"
let rec v_Vuna_dCompiler_dDriver_dPerfCache_ddropFiles = (fun nFs nProcess mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1, dtb__2) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dPerfCache_dsafeRemoveFile nFs) nProcess) (String.concat "" [mc0; "/"; dtb__1]))) (fun _u -> ((((v_Vuna_dCompiler_dDriver_dPerfCache_ddropFiles nFs) nProcess) mc0) dtb__2)))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_ddropDirFiles = (fun nFs nProcess dir -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadDir nFs) dir)) (fun names -> ((((v_Vuna_dCompiler_dDriver_dPerfCache_ddropFiles nFs) nProcess) dir) names))))

# 93 "Vuna/Compiler/Driver/PerfCache.vuna"
let rec v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries = (fun nFs nProcess mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__3, dtb__4) -> ((fun path -> (if (path = mc1) then (((((v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries nFs) nProcess) mc0) mc1) dtb__4) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsIsDirectory nFs) path)) (fun isDir -> (if isDir then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dPerfCache_ddropDirFiles nFs) nProcess) path)) (fun _u -> (((((v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries nFs) nProcess) mc0) mc1) dtb__4))) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dPerfCache_dsafeRemoveFile nFs) nProcess) path)) (fun _u -> (((((v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries nFs) nProcess) mc0) mc1) dtb__4)))))))) (String.concat "" [mc0; "/"; dtb__3]))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheGc = (fun nFs nProcess base keepDir -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirEff nFs) nProcess) base)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadDir nFs) base)) (fun names -> (((((v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries nFs) nProcess) base) keepDir) names))))))

# 130 "Vuna/Compiler/Driver/PerfCache.vuna"
let rec v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo = (fun nFs nProcess mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__5, dtb__6) -> ((fun path -> (if ((Base_dList.v_Base_dList_dmemName dtb__5) mc1) then (((((v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo nFs) nProcess) mc0) mc1) dtb__6) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path)) (fun exists -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if exists then ((Base_dEffFs.v_Base_dEffFs_dfsIsDirectory nFs) path) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))) (fun isDir -> (if (if exists then isDir else false) then (((((v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo nFs) nProcess) mc0) mc1) dtb__6) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dPerfCache_dsafeRemoveFile nFs) nProcess) path)) (fun _u -> (((((v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo nFs) nProcess) mc0) mc1) dtb__6)))))))))) (String.concat "" [mc0; "/"; dtb__5]))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 124 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheBucketGc = (fun nFs nProcess dir keepNames -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirEff nFs) nProcess) dir)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadDir nFs) dir)) (fun names -> (((((v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo nFs) nProcess) dir) keepNames) names))))))

# 144 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheRead = (fun nFs nEnv dir name key -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheTag nFs) nEnv)) (fun tag -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreReadEff nFs) tag) v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheCodec) (((v_Vuna_dCompiler_dDriver_dPerfCache_dunitCachePath dir) name) key))) (fun payload -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match payload with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__7) -> (Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_ddecSplitFileComplete dtb__7)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))))

# 153 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheWrite = (fun nFs nEnv nProcess dir name key sf -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirEff nFs) nProcess) dir)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheTag nFs) nEnv)) (fun tag -> (((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreWriteEff nFs) tag) v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheCodec) (((v_Vuna_dCompiler_dDriver_dPerfCache_dunitCachePath dir) name) key)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTop Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dencSplitFile) sf)))))))
