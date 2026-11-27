open Vuna_runtime
type t_ExitOp = C_ExitOp_ExitWith of (int)

# 15 "Base/Effect/Exit.vuna"
let v_exitWith = (fun (dtb_u_u1 : string) (dtb_u_u4 : int) -> (((((B_dEffect_dCore.v_sendCoreId "exit") dtb_u_u1) 233642629) (dtp_effectId dtb_u_u1)) (C_ExitOp_ExitWith (dtb_u_u4))))

# 19 "Base/Effect/Exit.vuna"
let v_handleExit = (fun (dtb_u_u10 : string) dtb_u_u12 dtb_u_u13 dtb_u_u14 -> (((((((B_dEffect_dCore.v_handleCoreId "exit") dtb_u_u10) 233642629) (dtp_effectId dtb_u_u10)) dtb_u_u12) (Obj.magic dtb_u_u13)) dtb_u_u14))

# 27 "Base/Effect/Exit.vuna"
let v_exitOpHIOHost = (fun (dtb_u_u17 : t_ExitOp) dtb_u_u18 -> (match dtb_u_u17 with
  | C_ExitOp_ExitWith (dtb_u_u19) -> (Obj.repr ((fun (dtb_u_u24 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u25 = Obj.obj (((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_exit dtio_0)) dtb_u_u19)) in (let dtb_u_u27 = (dtb_u_u25 dtb_u_u24) in ((Obj.magic ((Obj.magic dtb_u_u18) 0)) dtb_u_u24))))))
  | _ -> failwith "DT: impossible branch"
))

# 36 "Base/Effect/Exit.vuna"
let v_handleExitHostHost = (fun (dtb_u_u30 : string) dtb_u_u31 -> (((((((B_dEffect_dCore.v_handleCoreAtId "exit") dtb_u_u30) 233642629) (dtp_effectId dtb_u_u30)) (fun dtb_u_u32 -> (let dtb_u_u34 = dtb_u_u32 in (Obj.repr ((fun (dtb_u_u35 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u34)))))) v_exitOpHIOHost) dtb_u_u31))

# 40 "Base/Effect/Exit.vuna"
let v_runExitHost = (fun dtb_u_u38 -> (B_dEffect_dCore.v_joinEff ((v_handleExitHostHost "default") dtb_u_u38)))

# 44 "Base/Effect/Exit.vuna"
let v_runExitEff = (fun dtb_u_u40 -> (B_dEffect_dHost.v_hostSync (v_runExitHost dtb_u_u40)))
