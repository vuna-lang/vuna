open Vuna_runtime
# 38 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_Vuna_dCompiler_dLoader_dFingerprint_dbuildIdFileName = "build-id"

# 42 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_Vuna_dCompiler_dLoader_dFingerprint_dbuildIdSchema = "vuna-compiler-id 1"

# 53 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_Vuna_dCompiler_dLoader_dFingerprint_dsourceFrag = (fun p -> (String.concat "" [(Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); "="; (bi_strFromInt (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))]))

# 48 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_Vuna_dCompiler_dLoader_dFingerprint_dcompilerIdOf = (fun own depsDigest -> (Vuna_dCompiler_dLoader_dAddr.v_Vuna_dCompiler_dLoader_dAddr_daddrOf (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v_Vuna_dCompiler_dLoader_dFingerprint_dbuildIdSchema, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (depsDigest, ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLoader_dFingerprint_dsourceFrag) ((Base_dData_dSort.v_Base_dData_dSort_dsortBy (fun (a : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair) (b : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (((Base_dTrait_dOrd.v_Base_dTrait_dOrd_d_x60__x61_ Base_dData_dString.v_Ord_uString) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf a)) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf b)))) own))))))))

# 60 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_Vuna_dCompiler_dLoader_dFingerprint_dtextHashOf = (fun s -> (Vuna_dCompiler_dBase_dHash.v_Vuna_dCompiler_dBase_dHash_dcontentKey s))

# 57 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_Vuna_dCompiler_dLoader_dFingerprint_dfingerprintOfStat = (fun exe size mtime -> (v_Vuna_dCompiler_dLoader_dFingerprint_dtextHashOf (String.concat "" [exe; ":"; (bi_strFromInt size); ":"; (bi_strFromInt mtime)])))

# 89 "Vuna/Compiler/Loader/Fingerprint.vuna"
let rec v_Vuna_dCompiler_dLoader_dFingerprint_dreadFirstBuildId = (fun nFs (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) dtb__0)) (fun _x64_vuna_x64_effK_u91_u3_u7_x58_exists -> (if _x64_vuna_x64_effK_u91_u3_u7_x58_exists then (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadFile nFs) dtb__0)) (fun _x64_vuna_x64_effK_u93_u5_u8_x58_raw -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (if ((Base_dData_dString.v_Base_dData_dString_dtrim _x64_vuna_x64_effK_u93_u5_u8_x58_raw) = "") then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dString.v_Base_dData_dString_dtrim _x64_vuna_x64_effK_u93_u5_u8_x58_raw))))))) else ((v_Vuna_dCompiler_dLoader_dFingerprint_dreadFirstBuildId nFs) dtb__1))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_Vuna_dCompiler_dLoader_dFingerprint_dreadBuildIdNear = (fun nFs exe -> ((fun binDir -> ((fun outDir -> ((v_Vuna_dCompiler_dLoader_dFingerprint_dreadFirstBuildId nFs) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((String.concat "" [outDir; "/"; v_Vuna_dCompiler_dLoader_dFingerprint_dbuildIdFileName]), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((String.concat "" [binDir; "/"; v_Vuna_dCompiler_dLoader_dFingerprint_dbuildIdFileName]), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dparentOfPath binDir))) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dparentOfPath exe)))

# 64 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_Vuna_dCompiler_dLoader_dFingerprint_dcompilerTagEff = (fun nFs nEnv -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dEnv.v_Base_dEffect_dEnv_denvGetEnv nEnv) "VUNA_COMPILER_TAG")) (fun _x64_vuna_x64_effK_u65_u3_u5_x58_override -> (if (_x64_vuna_x64_effK_u65_u3_u5_x58_override <> "") then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) _x64_vuna_x64_effK_u65_u3_u5_x58_override) else (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dEnv.v_Base_dEffect_dEnv_denvExecPath nEnv)) (fun _x64_vuna_x64_effK_u68_u5_u6_x58_exe -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Vuna_dCompiler_dLoader_dFingerprint_dreadBuildIdNear nFs) _x64_vuna_x64_effK_u68_u5_u6_x58_exe)) (fun _x64_vuna_x64_effK_u69_u5_u7_x58_saved -> (match _x64_vuna_x64_effK_u69_u5_u7_x58_saved with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__2) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) dtb__2)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileSize nFs) _x64_vuna_x64_effK_u68_u5_u6_x58_exe)) (fun _x64_vuna_x64_effK_u73_u9_u9_x58_sizeOpt -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Base_dTrait_dFunctor.v_Base_dTrait_dFunctor_dfmap Base_dEffect_dCore.v_Functor_uBase_uEffect_uCore_uEff_ur) (Base_dData_dMaybe.v_Base_dData_dMaybe_dfromMaybe 0)) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileMtime nFs) _x64_vuna_x64_effK_u68_u5_u6_x58_exe))) (fun _x64_vuna_x64_effK_u74_u9_u10_x58_mtime -> (match _x64_vuna_x64_effK_u73_u9_u9_x58_sizeOpt with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) Vuna_dCompiler_dBase_dVersion.v_Vuna_dCompiler_dBase_dVersion_dvunaVersion)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__3) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ("stat:" ^ (bi_strFromInt (((v_Vuna_dCompiler_dLoader_dFingerprint_dfingerprintOfStat _x64_vuna_x64_effK_u68_u5_u6_x58_exe) dtb__3) _x64_vuna_x64_effK_u74_u9_u10_x58_mtime))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))))))))

# 99 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_Vuna_dCompiler_dLoader_dFingerprint_dcompilerFingerprintEff = (fun nFs nEnv -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Vuna_dCompiler_dLoader_dFingerprint_dcompilerTagEff nFs) nEnv)) (fun _x64_vuna_x64_effK_u100_u3_u5_x58_tag -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (v_Vuna_dCompiler_dLoader_dFingerprint_dtextHashOf _x64_vuna_x64_effK_u100_u3_u5_x58_tag)))))
