open Vuna_runtime
# 38 "Vuna/Compiler/Fingerprint.vuna"
let v_Vuna_dCompiler_dFingerprint_dbuildIdFileName = "build-id"

# 42 "Vuna/Compiler/Fingerprint.vuna"
let v_Vuna_dCompiler_dFingerprint_dbuildIdSchema = "vuna-compiler-id 1"

# 53 "Vuna/Compiler/Fingerprint.vuna"
let v_Vuna_dCompiler_dFingerprint_dsourceFrag = (fun p -> (String.concat "" [(Base_dPair.v_Base_dPair_dfirstOf p); "="; (bi_strFromInt (Base_dPair.v_Base_dPair_dsecondOf p))]))

# 48 "Vuna/Compiler/Fingerprint.vuna"
let v_Vuna_dCompiler_dFingerprint_dcompilerIdOf = (fun own depsDigest -> (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_daddrOf (Base_dList.C_Base_dList_dList_Cons (v_Vuna_dCompiler_dFingerprint_dbuildIdSchema, (Base_dList.C_Base_dList_dList_Cons (depsDigest, ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFingerprint_dsourceFrag) ((Base_dSort.v_Base_dSort_dsortBy (fun a b -> (((Base_dOrd.v_Base_dOrd_dle Base_dString.v_Ord_uString) (Base_dPair.v_Base_dPair_dfirstOf a)) (Base_dPair.v_Base_dPair_dfirstOf b)))) own))))))))

# 60 "Vuna/Compiler/Fingerprint.vuna"
let v_Vuna_dCompiler_dFingerprint_dtextHashOf = (fun s -> (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_dcontentKey s))

# 57 "Vuna/Compiler/Fingerprint.vuna"
let v_Vuna_dCompiler_dFingerprint_dfingerprintOfStat = (fun exe size mtime -> (v_Vuna_dCompiler_dFingerprint_dtextHashOf (String.concat "" [exe; ":"; (bi_strFromInt size); ":"; (bi_strFromInt mtime)])))

# 89 "Vuna/Compiler/Fingerprint.vuna"
let rec v_Vuna_dCompiler_dFingerprint_dreadFirstBuildId = (fun nFs mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) dtb__0)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) dtb__0)) (fun raw -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if ((Base_dString.v_Base_dString_dtrim raw) = "") then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dString.v_Base_dString_dtrim raw))))))) else ((v_Vuna_dCompiler_dFingerprint_dreadFirstBuildId nFs) dtb__1))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Fingerprint.vuna"
let v_Vuna_dCompiler_dFingerprint_dreadBuildIdNear = (fun nFs exe -> ((fun binDir -> ((fun outDir -> ((v_Vuna_dCompiler_dFingerprint_dreadFirstBuildId nFs) (Base_dList.C_Base_dList_dList_Cons ((String.concat "" [outDir; "/"; v_Vuna_dCompiler_dFingerprint_dbuildIdFileName]), (Base_dList.C_Base_dList_dList_Cons ((String.concat "" [binDir; "/"; v_Vuna_dCompiler_dFingerprint_dbuildIdFileName]), Base_dList.C_Base_dList_dList_Nil)))))) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dparentOfPath binDir))) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dparentOfPath exe)))

# 64 "Vuna/Compiler/Fingerprint.vuna"
let v_Vuna_dCompiler_dFingerprint_dcompilerTagEff = (fun nFs nEnv -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffEnv.v_Base_dEffEnv_denvGetEnv nEnv) "VUNA_COMPILER_TAG")) (fun override -> (if (override <> "") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) override) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffEnv.v_Base_dEffEnv_denvExecPath nEnv)) (fun exe -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dFingerprint_dreadBuildIdNear nFs) exe)) (fun saved -> (match saved with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__2) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) dtb__2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileSize nFs) exe)) (fun sizeOpt -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dMonad.v_Base_dMonad_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) (Base_dMaybe.v_Base_dMaybe_dfromMaybe 0)) ((Base_dEffFs.v_Base_dEffFs_dfsFileMtime nFs) exe))) (fun mtime -> (match sizeOpt with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__3) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ("stat:" ^ (bi_strFromInt (((v_Vuna_dCompiler_dFingerprint_dfingerprintOfStat exe) dtb__3) mtime))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))))))))

# 99 "Vuna/Compiler/Fingerprint.vuna"
let v_Vuna_dCompiler_dFingerprint_dcompilerFingerprintEff = (fun nFs nEnv -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dFingerprint_dcompilerTagEff nFs) nEnv)) (fun tag -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dFingerprint_dtextHashOf tag)))))
