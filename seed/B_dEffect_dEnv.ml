open Vuna_runtime
type t_EnvOp = C_EnvOp_GetEnv of (string) | C_EnvOp_GetCwd | C_EnvOp_ExecPath

# 24 "Base/Effect/Env.vuna"
let v_envGetEnv = (fun (n : string) (k : string) -> (((((B_dEffect_dCore.v_sendCoreId "env") n) 948865972) (dtp_effectId n)) (C_EnvOp_GetEnv (k))))

# 24 "Base/Effect/Env.vuna"
let v_envGetEnv_u_udirect = (fun (n : string) (k : string) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "env") n) 948865972) (dtp_effectId n)) (C_EnvOp_GetEnv (k)))) _u_ueffTok))

# 29 "Base/Effect/Env.vuna"
let v_envGetEnvNonEmpty = (fun (dtb_u_u5 : string) (dtb_u_u8 : string) -> (Obj.repr ((fun (dtb_u_u13 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u16 = (((v_envGetEnv_u_udirect dtb_u_u5) dtb_u_u8) dtb_u_u13) in (let dtb_u_u18 = (if (dtb_u_u16 = "") then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb_u_u16))) in dtb_u_u18))))))

# 29 "Base/Effect/Env.vuna"
let v_envGetEnvNonEmpty_u_udirect = (fun (n : string) (k : string) _u_ueffTok -> (let dtb_u_u16 = (((v_envGetEnv_u_udirect n) k) _u_ueffTok) in (let dtb_u_u18 = (if (dtb_u_u16 = "") then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb_u_u16))) in dtb_u_u18)))

# 36 "Base/Effect/Env.vuna"
let v_envGetCwd = (fun (n : string) -> (((((B_dEffect_dCore.v_sendCoreId "env") n) 948865972) (dtp_effectId n)) C_EnvOp_GetCwd))

# 36 "Base/Effect/Env.vuna"
let v_envGetCwd_u_udirect = (fun (n : string) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "env") n) 948865972) (dtp_effectId n)) C_EnvOp_GetCwd)) _u_ueffTok))

# 40 "Base/Effect/Env.vuna"
let v_envExecPath = (fun (n : string) -> (((((B_dEffect_dCore.v_sendCoreId "env") n) 948865972) (dtp_effectId n)) C_EnvOp_ExecPath))

# 40 "Base/Effect/Env.vuna"
let v_envExecPath_u_udirect = (fun (n : string) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "env") n) 948865972) (dtp_effectId n)) C_EnvOp_ExecPath)) _u_ueffTok))

# 44 "Base/Effect/Env.vuna"
let v_handleEnv = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreId "env") n) 948865972) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 44 "Base/Effect/Env.vuna"
let v_handleEnv_u_udirect = (fun (n : string) ret opH comp _u_ueffTok -> ((Obj.magic (((((((B_dEffect_dCore.v_handleCoreId "env") n) 948865972) (dtp_effectId n)) ret) (Obj.magic opH)) comp)) _u_ueffTok))

# 51 "Base/Effect/Env.vuna"
let v_envOpHIOHost = (fun (dtb_u_u38 : t_EnvOp) dtb_u_u39 -> (match dtb_u_u38 with
  | C_EnvOp_GetEnv (dtb_u_u40) -> (Obj.repr ((fun (dtb_u_u45 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u46 = Obj.obj (((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_getenv dtio_0)) dtb_u_u40)) in (let dtb_u_u48 = (dtb_u_u46 dtb_u_u45) in ((Obj.magic ((Obj.magic dtb_u_u39) dtb_u_u48)) dtb_u_u45))))))
  | C_EnvOp_GetCwd -> (Obj.repr ((fun (dtb_u_u53 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u54 = Obj.obj ((Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_getcwd ())))) in (let dtb_u_u56 = (dtb_u_u54 dtb_u_u53) in ((Obj.magic ((Obj.magic dtb_u_u39) dtb_u_u56)) dtb_u_u53))))))
  | C_EnvOp_ExecPath -> (Obj.repr ((fun (dtb_u_u61 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u62 = Obj.obj ((Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_execPath ())))) in (let dtb_u_u64 = (dtb_u_u62 dtb_u_u61) in ((Obj.magic ((Obj.magic dtb_u_u39) dtb_u_u64)) dtb_u_u61))))))
  | _ -> failwith "DT: impossible branch"
))

# 51 "Base/Effect/Env.vuna"
let v_envOpHIOHost_u_udirect = (fun (op : t_EnvOp) k _u_ueffTok -> (match op with
  | C_EnvOp_GetEnv (dtb_u_u40) -> (let dtb_u_u46 = Obj.obj (((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_getenv dtio_0)) dtb_u_u40)) in (let dtb_u_u48 = (dtb_u_u46 _u_ueffTok) in ((Obj.magic ((Obj.magic k) dtb_u_u48)) _u_ueffTok)))
  | C_EnvOp_GetCwd -> (let dtb_u_u54 = Obj.obj ((Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_getcwd ())))) in (let dtb_u_u56 = (dtb_u_u54 _u_ueffTok) in ((Obj.magic ((Obj.magic k) dtb_u_u56)) _u_ueffTok)))
  | C_EnvOp_ExecPath -> (let dtb_u_u62 = Obj.obj ((Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_execPath ())))) in (let dtb_u_u64 = (dtb_u_u62 _u_ueffTok) in ((Obj.magic ((Obj.magic k) dtb_u_u64)) _u_ueffTok)))
  | _ -> failwith "DT: impossible branch"
))

# 68 "Base/Effect/Env.vuna"
let v_handleEnvHostHost = (fun (dtb_u_u67 : string) dtb_u_u68 -> (((((((B_dEffect_dCore.v_handleCoreAtId "env") dtb_u_u67) 948865972) (dtp_effectId dtb_u_u67)) (fun dtb_u_u69 -> (let dtb_u_u71 = (Obj.magic dtb_u_u69) in (Obj.repr ((fun (dtb_u_u72 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u71)))))) v_envOpHIOHost) dtb_u_u68))

# 68 "Base/Effect/Env.vuna"
let v_handleEnvHostHost_u_udirect = (fun (n : string) comp _u_ueffTok -> ((Obj.magic (((((((B_dEffect_dCore.v_handleCoreAtId "env") n) 948865972) (dtp_effectId n)) (fun dtb_u_u69 -> (let dtb_u_u71 = (Obj.magic dtb_u_u69) in (Obj.repr ((fun (dtb_u_u72 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u71)))))) v_envOpHIOHost) comp)) _u_ueffTok))

# 72 "Base/Effect/Env.vuna"
let v_runEnvHost = (fun comp -> (B_dEffect_dCore.v_joinEff ((v_handleEnvHostHost "default") comp)))

# 72 "Base/Effect/Env.vuna"
let v_runEnvHost_u_udirect = (fun comp _u_ueffTok -> ((Obj.magic (B_dEffect_dCore.v_joinEff ((v_handleEnvHostHost "default") comp))) _u_ueffTok))

# 76 "Base/Effect/Env.vuna"
let v_runEnvEff = (fun comp -> (B_dEffect_dHost.v_hostSync (v_runEnvHost comp)))

# 76 "Base/Effect/Env.vuna"
let v_runEnvEff_u_udirect = (fun comp _u_ueffTok -> ((Obj.magic (B_dEffect_dHost.v_hostSync (v_runEnvHost comp))) _u_ueffTok))
