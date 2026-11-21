open Vuna_runtime
# 31 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_unitCacheSchema = "vuna-unit-cache 2"

# 35 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_unitCacheCodec = "split-file 1"

# 38 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_unitCacheTag = (fun (nFs : string) (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Loader_dFingerprint.v_compilerTagEff nFs) nEnv)) (fun tag -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (String.concat "" [v_unitCacheSchema; "/"; tag])))))

# 52 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_hashTextOf = (fun (s : string) -> (bi_strFromInt (Loader_dFingerprint.v_textHashOf s)))

# 46 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_unitCacheDir = (fun (nFs : string) (nEnv : string) (nProcess : string) (pkg : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Base_dStore.v_storeRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (String.concat "" [root; "/units/"; (v_hashTextOf pkg)])))))

# 70 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_charSafe = (fun (c : int) -> (if (c = 46) then 95 else c))

# 67 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_unitNameSafe = (fun (s : string) -> (B_dData_dList.dtp_pack ((B_dData_dList.v_map v_charSafe) (B_dData_dList.dtp_unpack s))))

# 59 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_unitCacheFileName = (fun (name : string) (key : string) -> (let h1 = (Loader_dFingerprint.v_textHashOf ("k1:" ^ key)) in (let h2 = (Loader_dFingerprint.v_textHashOf ("k2:" ^ key)) in (let h3 = (Loader_dFingerprint.v_textHashOf ("k3:" ^ key)) in (String.concat "" [(v_unitNameSafe name); "-"; (bi_strFromInt h1); "-"; (bi_strFromInt h2); "-"; (bi_strFromInt h3); ".unit"])))))

# 55 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_unitCachePath = (fun (dir : string) (name : string) (key : string) -> (String.concat "" [dir; "/"; ((v_unitCacheFileName name) key)]))

# 76 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_unitCacheEntryDir = (fun (base : string) (entryKey : string) -> (String.concat "" [base; "/e-"; (bi_strFromInt (Loader_dFingerprint.v_textHashOf ("entry:" ^ entryKey))); "-"; (bi_strFromInt (Loader_dFingerprint.v_textHashOf ("entry2:" ^ entryKey)))]))

# 80 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_unitCacheEntryKeyOf = (fun (keys : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((B_dData_dList.v_lookupPair "__entry__") keys) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> dtb__0
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_safeRemoveFile = (fun (nFs : string) (nProcess : string) (path : string) -> ((B_dEffect_dFs.v_fsRemoveFile nFs) path))

# 122 "Vuna/Compiler/Driver/PerfCache.vuna"
let rec v_dropFiles = (fun (nFs : string) (nProcess : string) (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1, dtb__2) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_safeRemoveFile nFs) nProcess) (String.concat "" [mc0; "/"; dtb__1]))) (fun _u -> ((((v_dropFiles nFs) nProcess) mc0) dtb__2)))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_dropDirFiles = (fun (nFs : string) (nProcess : string) (dir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadDir nFs) dir)) (fun names -> ((((v_dropFiles nFs) nProcess) dir) names))))

# 97 "Vuna/Compiler/Driver/PerfCache.vuna"
let rec v_gcEntries = (fun (nFs : string) (nProcess : string) (mc0 : string) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> (let path = (String.concat "" [mc0; "/"; dtb__3]) in (if (path = mc1) then (((((v_gcEntries nFs) nProcess) mc0) mc1) dtb__4) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsIsDirectory nFs) path)) (fun isDir -> (if isDir then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_dropDirFiles nFs) nProcess) path)) (fun _u -> (((((v_gcEntries nFs) nProcess) mc0) mc1) dtb__4))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_safeRemoveFile nFs) nProcess) path)) (fun _u -> (((((v_gcEntries nFs) nProcess) mc0) mc1) dtb__4))))))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_unitCacheGc = (fun (nFs : string) (nProcess : string) (base : string) (keepDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Base_dStore.v_storeEnsureDirEff nFs) nProcess) base)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadDir nFs) base)) (fun names -> (((((v_gcEntries nFs) nProcess) base) keepDir) names))))))

# 141 "Vuna/Compiler/Driver/PerfCache.vuna"
let rec v_bucketGcGo = (fun (nFs : string) (nProcess : string) (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (let path = (String.concat "" [mc0; "/"; dtb__5]) in (if ((B_dData_dList.v_memName dtb__5) mc1) then (((((v_bucketGcGo nFs) nProcess) mc0) mc1) dtb__6) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if exists then ((B_dEffect_dFs.v_fsIsDirectory nFs) path) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false))) (fun isDir -> (if (if exists then isDir else false) then (((((v_bucketGcGo nFs) nProcess) mc0) mc1) dtb__6) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_safeRemoveFile nFs) nProcess) path)) (fun _u -> (((((v_bucketGcGo nFs) nProcess) mc0) mc1) dtb__6))))))))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 134 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_unitCacheBucketGc = (fun (nFs : string) (nProcess : string) (dir : string) (keepNames : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Base_dStore.v_storeEnsureDirEff nFs) nProcess) dir)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadDir nFs) dir)) (fun names -> (((((v_bucketGcGo nFs) nProcess) dir) keepNames) names))))))

# 159 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_unitCacheRead = (fun (nFs : string) (nEnv : string) (dir : string) (name : string) (key : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_unitCacheTag nFs) nEnv)) (fun tag -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((Base_dStore.v_storeReadEff nFs) tag) v_unitCacheCodec) (((v_unitCachePath dir) name) key))) (fun payload -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match payload with
  | B_dData_dMaybe.C_Maybe_Just (dtb__7) -> (Driver_dSplit.v_decSplitFileComplete dtb__7)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))))

# 170 "Vuna/Compiler/Driver/PerfCache.vuna"
let v_unitCacheWrite = (fun (nFs : string) (nEnv : string) (nProcess : string) (dir : string) (name : string) (key : string) (sf : Driver_dSplit.t_SplitFile) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Base_dStore.v_storeEnsureDirEff nFs) nProcess) dir)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_unitCacheTag nFs) nEnv)) (fun tag -> (((((Base_dStore.v_storeWriteEff nFs) tag) v_unitCacheCodec) (((v_unitCachePath dir) name) key)) ((Base_dBytes.v_encTop Driver_dSplit.v_encSplitFile) sf)))))))
