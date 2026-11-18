open Vuna_runtime
type t_Base_dEffect_dEnv_dEnvOp = C_Base_dEffect_dEnv_dEnvOp_GetEnv of (string) | C_Base_dEffect_dEnv_dEnvOp_GetCwd | C_Base_dEffect_dEnv_dEnvOp_ExecPath

# 23 "Base/Effect/Env.vuna"
let v_Base_dEffect_dEnv_denvGetEnv = (fun n k -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "env") n) (C_Base_dEffect_dEnv_dEnvOp_GetEnv (k))))

# 28 "Base/Effect/Env.vuna"
let v_Base_dEffect_dEnv_denvGetEnvNonEmpty = (fun n k -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Base_dEffect_dEnv_denvGetEnv n) k)) (fun _x64_vuna_x64_effK_u30_u5_u4_x58_v -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (if (_x64_vuna_x64_effK_u30_u5_u4_x58_v = "") then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (_x64_vuna_x64_effK_u30_u5_u4_x58_v)))))))

# 35 "Base/Effect/Env.vuna"
let v_Base_dEffect_dEnv_denvGetCwd = (fun n -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "env") n) C_Base_dEffect_dEnv_dEnvOp_GetCwd))

# 39 "Base/Effect/Env.vuna"
let v_Base_dEffect_dEnv_denvExecPath = (fun n -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "env") n) C_Base_dEffect_dEnv_dEnvOp_ExecPath))

# 43 "Base/Effect/Env.vuna"
let v_Base_dEffect_dEnv_dhandleEnv = (fun n ret opH comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCore "env") n) ret) (Obj.magic opH)) comp))

# 47 "Base/Effect/Env.vuna"
let v_Base_dEffect_dEnv_denvOpHIO = (fun op k -> (match op with
  | C_Base_dEffect_dEnv_dEnvOp_GetEnv (dtb__0) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_getenv dtio_0)) dtb__0)) (fun _x64_vuna_x64_effK_u51_u9_u6_x58_v -> ((Obj.magic k) _x64_vuna_x64_effK_u51_u9_u6_x58_v)))
  | C_Base_dEffect_dEnv_dEnvOp_GetCwd -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (dtp_getcwd ())))) (fun _x64_vuna_x64_effK_u55_u9_u5_x58_v -> ((Obj.magic k) _x64_vuna_x64_effK_u55_u9_u5_x58_v)))
  | C_Base_dEffect_dEnv_dEnvOp_ExecPath -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (dtp_execPath ())))) (fun _x64_vuna_x64_effK_u59_u9_u5_x58_v -> ((Obj.magic k) _x64_vuna_x64_effK_u59_u9_u5_x58_v)))
  | _ -> failwith "DT: impossible branch"
))

# 67 "Base/Effect/Env.vuna"
let v_Base_dEffect_dEnv_denvOpHIOHost = (fun op k -> (match op with
  | C_Base_dEffect_dEnv_dEnvOp_GetEnv (dtb__1) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_getenv dtio_0)) dtb__1))) (fun _x64_vuna_x64_effK_u71_u9_u6_x58_v -> ((Obj.magic k) _x64_vuna_x64_effK_u71_u9_u6_x58_v)))
  | C_Base_dEffect_dEnv_dEnvOp_GetCwd -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise (Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (dtp_getcwd ()))))) (fun _x64_vuna_x64_effK_u75_u9_u5_x58_v -> ((Obj.magic k) _x64_vuna_x64_effK_u75_u9_u5_x58_v)))
  | C_Base_dEffect_dEnv_dEnvOp_ExecPath -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise (Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (dtp_execPath ()))))) (fun _x64_vuna_x64_effK_u79_u9_u5_x58_v -> ((Obj.magic k) _x64_vuna_x64_effK_u79_u9_u5_x58_v)))
  | _ -> failwith "DT: impossible branch"
))

# 84 "Base/Effect/Env.vuna"
let v_Base_dEffect_dEnv_dhandleEnvHostHost = (fun n comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCoreAt "env") n) (fun a -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) a))) v_Base_dEffect_dEnv_denvOpHIOHost) comp))

# 88 "Base/Effect/Env.vuna"
let v_Base_dEffect_dEnv_drunEnvHost = (fun comp -> (Base_dEffect_dCore.v_Base_dEffect_dCore_djoinEff ((v_Base_dEffect_dEnv_dhandleEnvHostHost "default") comp)))
