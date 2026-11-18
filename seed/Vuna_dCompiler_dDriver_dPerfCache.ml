open Vuna_runtime
# 31 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheSchema = "vuna-unit-cache 2"

# 35 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheCodec = "split-file 1"

# 38 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheTag = (fun nFs nEnv -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dcompilerTagEff nFs) nEnv)) (fun _x64_vuna_x64_effK_u39_u3_u5_x58_tag -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (String.concat "" [v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheSchema; "/"; _x64_vuna_x64_effK_u39_u3_u5_x58_tag])))))

# 50 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dhashTextOf = (fun s -> (bi_strFromInt (Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dtextHashOf s)))

# 45 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheDir = (fun nFs nEnv nProcess pkg -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreRootReadyEff nFs) nEnv) nProcess)) (fun _x64_vuna_x64_effK_u46_u3_u8_x58_root -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (String.concat "" [_x64_vuna_x64_effK_u46_u3_u8_x58_root; "/units/"; (v_Vuna_dCompiler_dDriver_dPerfCache_dhashTextOf pkg)])))))

# 68 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dcharSafe = (fun c -> (if (c = 46) then 95 else c))

# 65 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitNameSafe = (fun s -> (Base_dData_dList.dtp_pack ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dDriver_dPerfCache_dcharSafe) (Base_dData_dList.dtp_unpack s))))

# 57 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheFileName = (fun name key -> ((fun h1 -> ((fun h2 -> ((fun h3 -> (String.concat "" [(v_Vuna_dCompiler_dDriver_dPerfCache_dunitNameSafe name); "-"; (bi_strFromInt h1); "-"; (bi_strFromInt h2); "-"; (bi_strFromInt h3); ".unit"])) (Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dtextHashOf ("k3:" ^ key)))) (Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dtextHashOf ("k2:" ^ key)))) (Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dtextHashOf ("k1:" ^ key))))

# 53 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCachePath = (fun dir name key -> (String.concat "" [dir; "/"; ((v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheFileName name) key)]))

# 74 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheEntryDir = (fun base entryKey -> (String.concat "" [base; "/e-"; (bi_strFromInt (Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dtextHashOf ("entry:" ^ entryKey))); "-"; (bi_strFromInt (Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dtextHashOf ("entry2:" ^ entryKey)))]))

# 78 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheEntryKeyOf = (fun keys -> (match ((Base_dData_dList.v_Base_dData_dList_dlookupPair "__entry__") keys) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__0) -> dtb__0
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 84 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dsafeRemoveFile = (fun nFs nProcess path -> ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsRemoveFile nFs) path))

# 113 "Vuna/Compiler/Driver/PerfCache.vuna"
let rec v_Vuna_dCompiler_dDriver_dPerfCache_ddropFiles = (fun nFs nProcess (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1, dtb__2) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dDriver_dPerfCache_dsafeRemoveFile nFs) nProcess) (String.concat "" [mc0; "/"; dtb__1]))) (fun _x64_vuna_x64_effK_u0_u0_u10_x58__u -> ((((v_Vuna_dCompiler_dDriver_dPerfCache_ddropFiles nFs) nProcess) mc0) dtb__2)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_ddropDirFiles = (fun nFs nProcess dir -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadDir nFs) dir)) (fun _x64_vuna_x64_effK_u109_u3_u6_x58_names -> ((((v_Vuna_dCompiler_dDriver_dPerfCache_ddropFiles nFs) nProcess) dir) _x64_vuna_x64_effK_u109_u3_u6_x58_names))))

# 93 "Vuna/Compiler/Driver/PerfCache.vuna"
let rec v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries = (fun nFs nProcess (mc0 : string) (mc1 : string) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__3, dtb__4) -> ((fun path -> (if (path = mc1) then (((((v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries nFs) nProcess) mc0) mc1) dtb__4) else (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsIsDirectory nFs) path)) (fun _x64_vuna_x64_effK_u99_u5_u12_x58_isDir -> (if _x64_vuna_x64_effK_u99_u5_u12_x58_isDir then (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dDriver_dPerfCache_ddropDirFiles nFs) nProcess) path)) (fun _x64_vuna_x64_effK_u0_u0_u13_x58__u -> (((((v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries nFs) nProcess) mc0) mc1) dtb__4))) else (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dDriver_dPerfCache_dsafeRemoveFile nFs) nProcess) path)) (fun _x64_vuna_x64_effK_u0_u0_u13_x58__u -> (((((v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries nFs) nProcess) mc0) mc1) dtb__4)))))))) (String.concat "" [mc0; "/"; dtb__3]))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheGc = (fun nFs nProcess base keepDir -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirEff nFs) nProcess) base)) (fun _x64_vuna_x64_effK_u0_u0_u7_x58__u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadDir nFs) base)) (fun _x64_vuna_x64_effK_u89_u3_u8_x58_names -> (((((v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries nFs) nProcess) base) keepDir) _x64_vuna_x64_effK_u89_u3_u8_x58_names))))))

# 130 "Vuna/Compiler/Driver/PerfCache.vuna"
let rec v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo = (fun nFs nProcess (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__5, dtb__6) -> ((fun path -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__5) mc1) then (((((v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo nFs) nProcess) mc0) mc1) dtb__6) else (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) path)) (fun _x64_vuna_x64_effK_u136_u5_u12_x58_exists -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (if _x64_vuna_x64_effK_u136_u5_u12_x58_exists then ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsIsDirectory nFs) path) else ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) false))) (fun _x64_vuna_x64_effK_u137_u5_u13_x58_isDir -> (if (if _x64_vuna_x64_effK_u136_u5_u12_x58_exists then _x64_vuna_x64_effK_u137_u5_u13_x58_isDir else false) then (((((v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo nFs) nProcess) mc0) mc1) dtb__6) else (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dDriver_dPerfCache_dsafeRemoveFile nFs) nProcess) path)) (fun _x64_vuna_x64_effK_u0_u0_u14_x58__u -> (((((v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo nFs) nProcess) mc0) mc1) dtb__6)))))))))) (String.concat "" [mc0; "/"; dtb__5]))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 124 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheBucketGc = (fun nFs nProcess dir keepNames -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirEff nFs) nProcess) dir)) (fun _x64_vuna_x64_effK_u0_u0_u7_x58__u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadDir nFs) dir)) (fun _x64_vuna_x64_effK_u126_u3_u8_x58_names -> (((((v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo nFs) nProcess) dir) keepNames) _x64_vuna_x64_effK_u126_u3_u8_x58_names))))))

# 144 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheRead = (fun nFs nEnv dir name key -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheTag nFs) nEnv)) (fun _x64_vuna_x64_effK_u145_u3_u8_x58_tag -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreReadEff nFs) _x64_vuna_x64_effK_u145_u3_u8_x58_tag) v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheCodec) (((v_Vuna_dCompiler_dDriver_dPerfCache_dunitCachePath dir) name) key))) (fun _x64_vuna_x64_effK_u146_u3_u9_x58_payload -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match _x64_vuna_x64_effK_u146_u3_u9_x58_payload with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__7) -> (Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_ddecSplitFileComplete dtb__7)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))))

# 153 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheWrite = (fun nFs nEnv nProcess dir name key sf -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirEff nFs) nProcess) dir)) (fun _x64_vuna_x64_effK_u0_u0_u11_x58__u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheTag nFs) nEnv)) (fun _x64_vuna_x64_effK_u155_u3_u12_x58_tag -> (((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreWriteEff nFs) _x64_vuna_x64_effK_u155_u3_u12_x58_tag) v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheCodec) (((v_Vuna_dCompiler_dDriver_dPerfCache_dunitCachePath dir) name) key)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTop Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dencSplitFile) sf)))))))
