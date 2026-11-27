open Vuna_runtime
type t_ArgsOp = C_ArgsOp_GetArgs

# 16 "Base/Effect/Args.vuna"
let v_argsGetArgs = (fun (dtb_u_u1 : string) -> (((((B_dEffect_dCore.v_sendCoreId "args") dtb_u_u1) 487237436) (dtp_effectId dtb_u_u1)) C_ArgsOp_GetArgs))

# 20 "Base/Effect/Args.vuna"
let v_handleArgs = (fun (dtb_u_u9 : string) dtb_u_u11 dtb_u_u12 dtb_u_u13 -> (((((((B_dEffect_dCore.v_handleCoreId "args") dtb_u_u9) 487237436) (dtp_effectId dtb_u_u9)) dtb_u_u11) (Obj.magic dtb_u_u12)) dtb_u_u13))

# 27 "Base/Effect/Args.vuna"
let v_argsOpHIOHost = (fun (dtb_u_u16 : t_ArgsOp) dtb_u_u17 -> (match dtb_u_u16 with
  | C_ArgsOp_GetArgs -> (Obj.repr ((fun (dtb_u_u22 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u23 = Obj.obj ((Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (B_dData_dList.dtp_listOf (dtp_getArgs ()))))) in (let dtb_u_u25 = (dtb_u_u23 dtb_u_u22) in ((Obj.magic ((Obj.magic dtb_u_u17) dtb_u_u25)) dtb_u_u22))))))
  | _ -> failwith "DT: impossible branch"
))

# 36 "Base/Effect/Args.vuna"
let v_handleArgsHostHost = (fun (dtb_u_u28 : string) dtb_u_u29 -> (((((((B_dEffect_dCore.v_handleCoreAtId "args") dtb_u_u28) 487237436) (dtp_effectId dtb_u_u28)) (fun dtb_u_u30 -> (let dtb_u_u32 = dtb_u_u30 in (Obj.repr ((fun (dtb_u_u33 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u32)))))) v_argsOpHIOHost) dtb_u_u29))

# 40 "Base/Effect/Args.vuna"
let v_runArgsHost = (fun dtb_u_u36 -> (B_dEffect_dCore.v_joinEff ((v_handleArgsHostHost "default") dtb_u_u36)))

# 44 "Base/Effect/Args.vuna"
let v_runArgsEff = (fun dtb_u_u38 -> (B_dEffect_dHost.v_hostSync (v_runArgsHost dtb_u_u38)))
