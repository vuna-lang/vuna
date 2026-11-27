open Vuna_runtime
type t_ArgsOp = C_ArgsOp_GetArgs

# 16 "Base/Effect/Args.vuna"
let v_argsGetArgs = (fun (n : string) -> (((((B_dEffect_dCore.v_sendCoreId "args") n) 487237436) (dtp_effectId n)) C_ArgsOp_GetArgs))

# 16 "Base/Effect/Args.vuna"
let v_argsGetArgs_u_udirect = (fun (n : string) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "args") n) 487237436) (dtp_effectId n)) C_ArgsOp_GetArgs)) _u_ueffTok))

# 20 "Base/Effect/Args.vuna"
let v_handleArgs = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreId "args") n) 487237436) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 20 "Base/Effect/Args.vuna"
let v_handleArgs_u_udirect = (fun (n : string) ret opH comp _u_ueffTok -> ((Obj.magic (((((((B_dEffect_dCore.v_handleCoreId "args") n) 487237436) (dtp_effectId n)) ret) (Obj.magic opH)) comp)) _u_ueffTok))

# 27 "Base/Effect/Args.vuna"
let v_argsOpHIOHost = (fun (dtb_u_u16 : t_ArgsOp) dtb_u_u17 -> (match dtb_u_u16 with
  | C_ArgsOp_GetArgs -> (Obj.repr ((fun (dtb_u_u22 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u23 = Obj.obj ((Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (B_dData_dList.dtp_listOf (dtp_getArgs ()))))) in (let dtb_u_u25 = (dtb_u_u23 dtb_u_u22) in ((Obj.magic ((Obj.magic dtb_u_u17) dtb_u_u25)) dtb_u_u22))))))
  | _ -> failwith "DT: impossible branch"
))

# 27 "Base/Effect/Args.vuna"
let v_argsOpHIOHost_u_udirect = (fun (op : t_ArgsOp) k _u_ueffTok -> (match op with
  | C_ArgsOp_GetArgs -> (let dtb_u_u23 = Obj.obj ((Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (B_dData_dList.dtp_listOf (dtp_getArgs ()))))) in (let dtb_u_u25 = (dtb_u_u23 _u_ueffTok) in ((Obj.magic ((Obj.magic k) dtb_u_u25)) _u_ueffTok)))
  | _ -> failwith "DT: impossible branch"
))

# 36 "Base/Effect/Args.vuna"
let v_handleArgsHostHost = (fun (dtb_u_u28 : string) dtb_u_u29 -> (((((((B_dEffect_dCore.v_handleCoreAtId "args") dtb_u_u28) 487237436) (dtp_effectId dtb_u_u28)) (fun dtb_u_u30 -> (let dtb_u_u32 = (Obj.magic dtb_u_u30) in (Obj.repr ((fun (dtb_u_u33 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u32)))))) v_argsOpHIOHost) dtb_u_u29))

# 36 "Base/Effect/Args.vuna"
let v_handleArgsHostHost_u_udirect = (fun (n : string) comp _u_ueffTok -> ((Obj.magic (((((((B_dEffect_dCore.v_handleCoreAtId "args") n) 487237436) (dtp_effectId n)) (fun dtb_u_u30 -> (let dtb_u_u32 = (Obj.magic dtb_u_u30) in (Obj.repr ((fun (dtb_u_u33 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u32)))))) v_argsOpHIOHost) comp)) _u_ueffTok))

# 40 "Base/Effect/Args.vuna"
let v_runArgsHost = (fun comp -> (B_dEffect_dCore.v_joinEff ((v_handleArgsHostHost "default") comp)))

# 40 "Base/Effect/Args.vuna"
let v_runArgsHost_u_udirect = (fun comp _u_ueffTok -> ((Obj.magic (B_dEffect_dCore.v_joinEff ((v_handleArgsHostHost "default") comp))) _u_ueffTok))

# 44 "Base/Effect/Args.vuna"
let v_runArgsEff = (fun comp -> (B_dEffect_dHost.v_hostSync (v_runArgsHost comp)))

# 44 "Base/Effect/Args.vuna"
let v_runArgsEff_u_udirect = (fun comp _u_ueffTok -> ((Obj.magic (B_dEffect_dHost.v_hostSync (v_runArgsHost comp))) _u_ueffTok))
