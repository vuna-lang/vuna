open Vuna_runtime
# 28 "Vuna/Compiler/Fingerprint.vuna"
let v_Vuna_dCompiler_dFingerprint_dtextHashOf = (fun s -> (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_dcontentKey s))

# 25 "Vuna/Compiler/Fingerprint.vuna"
let v_Vuna_dCompiler_dFingerprint_dfingerprintOfStat = (fun exe size mtime -> (v_Vuna_dCompiler_dFingerprint_dtextHashOf (String.concat "" [exe; ":"; (bi_strFromInt size); ":"; (bi_strFromInt mtime)])))

# 32 "Vuna/Compiler/Fingerprint.vuna"
let v_Vuna_dCompiler_dFingerprint_dcompilerFingerprintEff = (fun nFs nEnv -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffEnv.v_Base_dEffEnv_denvExecPath nEnv)) (fun exe -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileSize nFs) exe)) (fun size -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileMtime nFs) exe)) (fun mtime -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if (size > 0) then (((v_Vuna_dCompiler_dFingerprint_dfingerprintOfStat exe) size) mtime) else (v_Vuna_dCompiler_dFingerprint_dtextHashOf Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion))))))))))

# 40 "Vuna/Compiler/Fingerprint.vuna"
let v_Vuna_dCompiler_dFingerprint_dcompilerTagEff = (fun nFs nEnv -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dFingerprint_dcompilerFingerprintEff nFs) nEnv)) (fun fp -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" [Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion; "/"; (bi_strFromInt fp)])))))
