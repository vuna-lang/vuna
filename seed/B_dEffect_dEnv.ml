open Vuna_runtime
type t_EnvOp = C_EnvOp_GetEnv of (string) | C_EnvOp_GetCwd | C_EnvOp_ExecPath

# 24 "Base/Effect/Env.vuna"
let v_envGetEnv = (fun (n : string) (k : string) -> (((((B_dEffect_dCore.v_sendCoreId "env") n) 948865972) (dtp_effectId n)) (C_EnvOp_GetEnv (k))))

# 29 "Base/Effect/Env.vuna"
let v_envGetEnvNonEmpty = (fun (n : string) (k : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__0 = Obj.obj (e) in (let dtb__1 = Obj.obj ((k (dtb__0 u))) in (dtb__1 u)))))) ((v_envGetEnv n) k)) (fun v -> (let x = (if (v = "") then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (v))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 36 "Base/Effect/Env.vuna"
let v_envGetCwd = (fun (n : string) -> (((((B_dEffect_dCore.v_sendCoreId "env") n) 948865972) (dtp_effectId n)) C_EnvOp_GetCwd))

# 40 "Base/Effect/Env.vuna"
let v_envExecPath = (fun (n : string) -> (((((B_dEffect_dCore.v_sendCoreId "env") n) 948865972) (dtp_effectId n)) C_EnvOp_ExecPath))

# 44 "Base/Effect/Env.vuna"
let v_handleEnv = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreId "env") n) 948865972) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 51 "Base/Effect/Env.vuna"
let v_envOpHIOHost = (fun (op : t_EnvOp) k -> (match op with
  | C_EnvOp_GetEnv (dtb__2) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__3 = Obj.obj (e) in (let dtb__4 = Obj.obj ((k (dtb__3 u))) in (dtb__4 u)))))) ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_getenv dtio_0)) dtb__2)) (fun v -> ((Obj.magic k) v)))
  | C_EnvOp_GetCwd -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__5 = Obj.obj (e) in (let dtb__6 = Obj.obj ((k (dtb__5 u))) in (dtb__6 u)))))) (Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_getcwd ())))) (fun v -> ((Obj.magic k) v)))
  | C_EnvOp_ExecPath -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__7 = Obj.obj (e) in (let dtb__8 = Obj.obj ((k (dtb__7 u))) in (dtb__8 u)))))) (Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_execPath ())))) (fun v -> ((Obj.magic k) v)))
  | _ -> failwith "DT: impossible branch"
))

# 68 "Base/Effect/Env.vuna"
let v_handleEnvHostHost = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "env") n) 948865972) (dtp_effectId n)) (fun a -> (let x = a in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) v_envOpHIOHost) comp))

# 72 "Base/Effect/Env.vuna"
let v_runEnvHost = (fun comp -> (B_dEffect_dCore.v_joinEff ((v_handleEnvHostHost "default") comp)))

# 76 "Base/Effect/Env.vuna"
let v_runEnvEff = (fun comp -> (B_dEffect_dHost.v_hostSync (v_runEnvHost comp)))
