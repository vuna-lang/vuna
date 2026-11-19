open Vuna_runtime
type t_EnvOp = C_EnvOp_GetEnv of (string) | C_EnvOp_GetCwd | C_EnvOp_ExecPath

# 23 "Base/Effect/Env.vuna"
let v_envGetEnv = (fun (n : string) (k : string) -> (((((B_dEffect_dCore.v_sendCoreId "env") n) 948865972) (dtp_effectId n)) (C_EnvOp_GetEnv (k))))

# 28 "Base/Effect/Env.vuna"
let v_envGetEnvNonEmpty = (fun (n : string) (k : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_envGetEnv n) k)) (fun v -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (if (v = "") then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (v)))))))

# 35 "Base/Effect/Env.vuna"
let v_envGetCwd = (fun (n : string) -> (((((B_dEffect_dCore.v_sendCoreId "env") n) 948865972) (dtp_effectId n)) C_EnvOp_GetCwd))

# 39 "Base/Effect/Env.vuna"
let v_envExecPath = (fun (n : string) -> (((((B_dEffect_dCore.v_sendCoreId "env") n) 948865972) (dtp_effectId n)) C_EnvOp_ExecPath))

# 43 "Base/Effect/Env.vuna"
let v_handleEnv = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreId "env") n) 948865972) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 47 "Base/Effect/Env.vuna"
let v_envOpHIO = (fun (op : t_EnvOp) k -> (match op with
  | C_EnvOp_GetEnv (dtb__0) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_getenv dtio_0)) dtb__0)) (fun v -> ((Obj.magic k) v)))
  | C_EnvOp_GetCwd -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_getcwd ())))) (fun v -> ((Obj.magic k) v)))
  | C_EnvOp_ExecPath -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_execPath ())))) (fun v -> ((Obj.magic k) v)))
  | _ -> failwith "DT: impossible branch"
))

# 67 "Base/Effect/Env.vuna"
let v_envOpHIOHost = (fun (op : t_EnvOp) k -> (match op with
  | C_EnvOp_GetEnv (dtb__1) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_getenv dtio_0)) dtb__1))) (fun v -> ((Obj.magic k) v)))
  | C_EnvOp_GetCwd -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise (B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_getcwd ()))))) (fun v -> ((Obj.magic k) v)))
  | C_EnvOp_ExecPath -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise (B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_execPath ()))))) (fun v -> ((Obj.magic k) v)))
  | _ -> failwith "DT: impossible branch"
))

# 84 "Base/Effect/Env.vuna"
let v_handleEnvHostHost = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "env") n) 948865972) (dtp_effectId n)) (fun a -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) a))) v_envOpHIOHost) comp))

# 88 "Base/Effect/Env.vuna"
let v_runEnvHost = (fun comp -> (B_dEffect_dCore.v_joinEff ((v_handleEnvHostHost "default") comp)))
