open Vuna_runtime
type t_EnvOp = C_EnvOp_GetEnv of (string) | C_EnvOp_GetCwd | C_EnvOp_ExecPath

# 24 "Base/Effect/Env.vuna"
let v_envGetEnv = (fun (dtb_u_u1 : string) (dtb_u_u4 : string) -> (((((B_dEffect_dCore.v_sendCoreId "env") dtb_u_u1) 948865972) (dtp_effectId dtb_u_u1)) (C_EnvOp_GetEnv (dtb_u_u4))))

# 29 "Base/Effect/Env.vuna"
let v_envGetEnvNonEmpty = (fun (dtb_u_u5 : string) (dtb_u_u8 : string) -> (Obj.repr ((fun (dtb_u_u13 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u14 = Obj.obj (((v_envGetEnv dtb_u_u5) dtb_u_u8)) in (let dtb_u_u16 = (dtb_u_u14 dtb_u_u13) in (let dtb_u_u18 = (if (dtb_u_u16 = "") then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb_u_u16))) in dtb_u_u18)))))))

# 36 "Base/Effect/Env.vuna"
let v_envGetCwd = (fun (dtb_u_u20 : string) -> (((((B_dEffect_dCore.v_sendCoreId "env") dtb_u_u20) 948865972) (dtp_effectId dtb_u_u20)) C_EnvOp_GetCwd))

# 40 "Base/Effect/Env.vuna"
let v_envExecPath = (fun (dtb_u_u23 : string) -> (((((B_dEffect_dCore.v_sendCoreId "env") dtb_u_u23) 948865972) (dtp_effectId dtb_u_u23)) C_EnvOp_ExecPath))

# 44 "Base/Effect/Env.vuna"
let v_handleEnv = (fun (dtb_u_u31 : string) dtb_u_u33 dtb_u_u34 dtb_u_u35 -> (((((((B_dEffect_dCore.v_handleCoreId "env") dtb_u_u31) 948865972) (dtp_effectId dtb_u_u31)) dtb_u_u33) (Obj.magic dtb_u_u34)) dtb_u_u35))

# 51 "Base/Effect/Env.vuna"
let v_envOpHIOHost = (fun (dtb_u_u38 : t_EnvOp) dtb_u_u39 -> (match dtb_u_u38 with
  | C_EnvOp_GetEnv (dtb_u_u40) -> (Obj.repr ((fun (dtb_u_u45 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u46 = Obj.obj (((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_getenv dtio_0)) dtb_u_u40)) in (let dtb_u_u48 = (dtb_u_u46 dtb_u_u45) in ((Obj.magic ((Obj.magic dtb_u_u39) dtb_u_u48)) dtb_u_u45))))))
  | C_EnvOp_GetCwd -> (Obj.repr ((fun (dtb_u_u53 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u54 = Obj.obj ((Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_getcwd ())))) in (let dtb_u_u56 = (dtb_u_u54 dtb_u_u53) in ((Obj.magic ((Obj.magic dtb_u_u39) dtb_u_u56)) dtb_u_u53))))))
  | C_EnvOp_ExecPath -> (Obj.repr ((fun (dtb_u_u61 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u62 = Obj.obj ((Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_execPath ())))) in (let dtb_u_u64 = (dtb_u_u62 dtb_u_u61) in ((Obj.magic ((Obj.magic dtb_u_u39) dtb_u_u64)) dtb_u_u61))))))
  | _ -> failwith "DT: impossible branch"
))

# 68 "Base/Effect/Env.vuna"
let v_handleEnvHostHost = (fun (dtb_u_u67 : string) dtb_u_u68 -> (((((((B_dEffect_dCore.v_handleCoreAtId "env") dtb_u_u67) 948865972) (dtp_effectId dtb_u_u67)) (fun dtb_u_u69 -> (let dtb_u_u71 = dtb_u_u69 in (Obj.repr ((fun (dtb_u_u72 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u71)))))) v_envOpHIOHost) dtb_u_u68))

# 72 "Base/Effect/Env.vuna"
let v_runEnvHost = (fun dtb_u_u75 -> (B_dEffect_dCore.v_joinEff ((v_handleEnvHostHost "default") dtb_u_u75)))

# 76 "Base/Effect/Env.vuna"
let v_runEnvEff = (fun dtb_u_u77 -> (B_dEffect_dHost.v_hostSync (v_runEnvHost dtb_u_u77)))
