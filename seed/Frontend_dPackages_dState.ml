open Vuna_runtime
# 17 "Vuna/Compiler/Frontend/Packages/State.vuna"
let v_pkgStateDirName = ".vuna"

# 21 "Vuna/Compiler/Frontend/Packages/State.vuna"
let v_pkgStateEnv = "VUNA_PKG_STATE"

# 25 "Vuna/Compiler/Frontend/Packages/State.vuna"
let v_pkgStateDirOf = (fun (pkgDir : string) (override : string) -> (if (override = "") then (String.concat "" [pkgDir; "/"; v_pkgStateDirName]) else override))

# 29 "Vuna/Compiler/Frontend/Packages/State.vuna"
let v_pkgStateDirEff = (fun (nEnv : string) (pkgDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) v_pkgStateEnv)) (fun override -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_pkgStateDirOf pkgDir) override)))))

# 44 "Vuna/Compiler/Frontend/Packages/State.vuna"
let v_ifaceDirOf = (fun (stateDir : string) -> (stateDir ^ "/iface"))

# 66 "Vuna/Compiler/Frontend/Packages/State.vuna"
let v_pathIsDir = (fun (nFs : string) (path : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then ((B_dEffect_dFs.v_fsIsDirectory nFs) path) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false)))))

# 48 "Vuna/Compiler/Frontend/Packages/State.vuna"
let rec v_ensureDirEff = (fun (nFs : string) (fuel : int) (path : string) -> (if (fuel <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 1) else (if (if (if (path = "") then true else (path = ".")) then true else (path = "/")) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_pathIsDir nFs) path)) (fun here -> (if here then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_ensureDirEff nFs) (fuel - 1)) (Base_dSource.v_parentOfPath path))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_pathIsDir nFs) path)) (fun stillMissing -> (if stillMissing then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0) else ((B_dEffect_dFs.v_fsMakeDir nFs) path))))))))))))

# 36 "Vuna/Compiler/Frontend/Packages/State.vuna"
let v_ensurePkgStateDirEff = (fun (nFs : string) (nEnv : string) (pkgDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_pkgStateDirEff nEnv) pkgDir)) (fun dir -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_ensureDirEff nFs) ((String.length dir) + 2)) dir)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) dir))))))
