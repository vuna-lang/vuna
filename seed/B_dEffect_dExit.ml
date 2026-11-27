open Vuna_runtime
type t_ExitOp = C_ExitOp_ExitWith of (int)

# 15 "Base/Effect/Exit.vuna"
let v_exitWith = (fun (n : string) (code : int) -> (((((B_dEffect_dCore.v_sendCoreId "exit") n) 233642629) (dtp_effectId n)) (C_ExitOp_ExitWith (code))))

# 15 "Base/Effect/Exit.vuna"
let v_exitWith_u_udirect = (fun (n : string) (code : int) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "exit") n) 233642629) (dtp_effectId n)) (C_ExitOp_ExitWith (code)))) _u_ueffTok))

# 19 "Base/Effect/Exit.vuna"
let v_handleExit = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreId "exit") n) 233642629) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 19 "Base/Effect/Exit.vuna"
let v_handleExit_u_udirect = (fun (n : string) ret opH comp _u_ueffTok -> ((Obj.magic (((((((B_dEffect_dCore.v_handleCoreId "exit") n) 233642629) (dtp_effectId n)) ret) (Obj.magic opH)) comp)) _u_ueffTok))

# 27 "Base/Effect/Exit.vuna"
let v_exitOpHIOHost = (fun (dtb_u_u17 : t_ExitOp) dtb_u_u18 -> (match dtb_u_u17 with
  | C_ExitOp_ExitWith (dtb_u_u19) -> (Obj.repr ((fun (dtb_u_u24 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u25 = Obj.obj (((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_exit dtio_0)) dtb_u_u19)) in (let dtb_u_u27 = (dtb_u_u25 dtb_u_u24) in ((Obj.magic ((Obj.magic dtb_u_u18) 0)) dtb_u_u24))))))
  | _ -> failwith "DT: impossible branch"
))

# 27 "Base/Effect/Exit.vuna"
let v_exitOpHIOHost_u_udirect = (fun (op : t_ExitOp) k _u_ueffTok -> (match op with
  | C_ExitOp_ExitWith (dtb_u_u19) -> (let dtb_u_u25 = Obj.obj (((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_exit dtio_0)) dtb_u_u19)) in (let dtb_u_u27 = (dtb_u_u25 _u_ueffTok) in ((Obj.magic ((Obj.magic k) 0)) _u_ueffTok)))
  | _ -> failwith "DT: impossible branch"
))

# 36 "Base/Effect/Exit.vuna"
let v_handleExitHostHost = (fun (dtb_u_u30 : string) dtb_u_u31 -> (((((((B_dEffect_dCore.v_handleCoreAtId "exit") dtb_u_u30) 233642629) (dtp_effectId dtb_u_u30)) (fun dtb_u_u32 -> (let dtb_u_u34 = dtb_u_u32 in (Obj.repr ((fun (dtb_u_u35 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u34)))))) v_exitOpHIOHost) dtb_u_u31))

# 36 "Base/Effect/Exit.vuna"
let v_handleExitHostHost_u_udirect = (fun (n : string) comp _u_ueffTok -> ((Obj.magic (((((((B_dEffect_dCore.v_handleCoreAtId "exit") n) 233642629) (dtp_effectId n)) (fun dtb_u_u32 -> (let dtb_u_u34 = dtb_u_u32 in (Obj.repr ((fun (dtb_u_u35 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u34)))))) v_exitOpHIOHost) comp)) _u_ueffTok))

# 40 "Base/Effect/Exit.vuna"
let v_runExitHost = (fun comp -> (B_dEffect_dCore.v_joinEff ((v_handleExitHostHost "default") comp)))

# 40 "Base/Effect/Exit.vuna"
let v_runExitHost_u_udirect = (fun comp _u_ueffTok -> ((Obj.magic (B_dEffect_dCore.v_joinEff ((v_handleExitHostHost "default") comp))) _u_ueffTok))

# 44 "Base/Effect/Exit.vuna"
let v_runExitEff = (fun comp -> (B_dEffect_dHost.v_hostSync (v_runExitHost comp)))

# 44 "Base/Effect/Exit.vuna"
let v_runExitEff_u_udirect = (fun comp _u_ueffTok -> ((Obj.magic (B_dEffect_dHost.v_hostSync (v_runExitHost comp))) _u_ueffTok))
