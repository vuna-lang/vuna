open Vuna_runtime
type t_ArgsOp = C_ArgsOp_GetArgs

# 16 "Base/Effect/Args.vuna"
let v_argsGetArgs = (fun (n : string) -> (((((B_dEffect_dCore.v_sendCoreId "args") n) 487237436) (dtp_effectId n)) C_ArgsOp_GetArgs))

# 20 "Base/Effect/Args.vuna"
let v_handleArgs = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreId "args") n) 487237436) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 27 "Base/Effect/Args.vuna"
let v_argsOpHIOHost = (fun (op : t_ArgsOp) k -> (match op with
  | C_ArgsOp_GetArgs -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__0 = Obj.obj (e) in (let dtb__1 = Obj.obj ((k (dtb__0 u))) in (dtb__1 u)))))) (Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (B_dData_dList.dtp_listOf (dtp_getArgs ()))))) (fun xs -> ((Obj.magic k) xs)))
  | _ -> failwith "DT: impossible branch"
))

# 36 "Base/Effect/Args.vuna"
let v_handleArgsHostHost = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "args") n) 487237436) (dtp_effectId n)) (fun a -> (let x = a in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) v_argsOpHIOHost) comp))

# 40 "Base/Effect/Args.vuna"
let v_runArgsHost = (fun comp -> (B_dEffect_dCore.v_joinEff ((v_handleArgsHostHost "default") comp)))

# 44 "Base/Effect/Args.vuna"
let v_runArgsEff = (fun comp -> (B_dEffect_dHost.v_hostSync (v_runArgsHost comp)))
