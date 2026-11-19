open Vuna_runtime
# 38 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_buildIdFileName = "build-id"

# 42 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_buildIdSchema = "vuna-compiler-id 1"

# 53 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_sourceFrag = (fun (p : (string, int) B_dData_dPair.t_Pair) -> (String.concat "" [(B_dData_dPair.v_firstOf p); "="; (bi_strFromInt (B_dData_dPair.v_secondOf p))]))

# 48 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_compilerIdOf = (fun (own : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (depsDigest : string) -> (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ (v_buildIdSchema, (B_dData_dList.C_List__x58__x58_ (depsDigest, ((B_dData_dList.v_map v_sourceFrag) ((B_dData_dSort.v_sortBy (fun (a : (string, int) B_dData_dPair.t_Pair) (b : (string, int) B_dData_dPair.t_Pair) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_uString) (B_dData_dPair.v_firstOf a)) (B_dData_dPair.v_firstOf b)))) own))))))))

# 60 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_textHashOf = (fun (s : string) -> (Base_dHash.v_contentKey s))

# 57 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_fingerprintOfStat = (fun (exe : string) (size : int) (mtime : int) -> (v_textHashOf (String.concat "" [exe; ":"; (bi_strFromInt size); ":"; (bi_strFromInt mtime)])))

# 104 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_cacheTagFileName = "cache-tag"

# 120 "Vuna/Compiler/Loader/Fingerprint.vuna"
let rec v_readFirstBuildId = (fun (nFs : string) (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) dtb__0)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) dtb__0)) (fun raw -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (if ((B_dData_dString.v_trim raw) = "") then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ((B_dData_dString.v_trim raw))))))) else ((v_readFirstBuildId nFs) dtb__1))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 113 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_readNamedNear = (fun (nFs : string) (exe : string) (name : string) -> ((fun binDir -> ((fun outDir -> ((v_readFirstBuildId nFs) (B_dData_dList.C_List__x58__x58_ ((String.concat "" [outDir; "/"; name]), (B_dData_dList.C_List__x58__x58_ ((String.concat "" [binDir; "/"; name]), B_dData_dList.C_List_Nil)))))) (Base_dSource.v_parentOfPath binDir))) (Base_dSource.v_parentOfPath exe)))

# 109 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_readBuildIdNear = (fun (nFs : string) (exe : string) -> (((v_readNamedNear nFs) exe) v_buildIdFileName))

# 64 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_compilerTagEff = (fun (nFs : string) (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_COMPILER_TAG")) (fun override -> (if (override <> "") then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) override) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dEnv.v_envExecPath nEnv)) (fun exe -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_readBuildIdNear nFs) exe)) (fun saved -> (match saved with
  | B_dData_dMaybe.C_Maybe_Just (dtb__2) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) dtb__2)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileSize nFs) exe)) (fun sizeOpt -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_uBase_uEffect_uCore_uEff_ur) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime nFs) exe))) (fun mtime -> (match sizeOpt with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) Base_dVersion.v_vunaVersion)
  | B_dData_dMaybe.C_Maybe_Just (dtb__3) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ("stat:" ^ (bi_strFromInt (((v_fingerprintOfStat exe) dtb__3) mtime))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))))))))

# 89 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_cacheTagEff = (fun (nFs : string) (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_CACHE_TAG")) (fun override -> (if (override <> "") then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) override) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dEnv.v_envExecPath nEnv)) (fun exe -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_readNamedNear nFs) exe) v_cacheTagFileName)) (fun found -> (match found with
  | B_dData_dMaybe.C_Maybe_Just (dtb__4) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) dtb__4)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_compilerTagEff nFs) nEnv)
  | _ -> failwith "DT: impossible branch"
)))))))))

# 133 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_compilerFingerprintEff = (fun (nFs : string) (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_compilerTagEff nFs) nEnv)) (fun tag -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (v_textHashOf tag)))))
