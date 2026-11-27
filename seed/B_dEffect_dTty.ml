open Vuna_runtime
type t_TtyOp = C_TtyOp_IsTty

# 21 "Base/Effect/Tty.vuna"
let v_ttyIsTty = (fun (n : string) -> (((((B_dEffect_dCore.v_sendCoreId "tty") n) 808136164) (dtp_effectId n)) C_TtyOp_IsTty))

# 25 "Base/Effect/Tty.vuna"
let v_handleTty = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreId "tty") n) 808136164) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 32 "Base/Effect/Tty.vuna"
let v_ttyOpHIOHost = (fun (op : t_TtyOp) k -> (match op with
  | C_TtyOp_IsTty -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__0 = Obj.obj (e) in (let dtb__1 = Obj.obj ((k (dtb__0 u))) in (dtb__1 u)))))) (Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_isTty ())))) (fun b -> ((Obj.magic k) b)))
  | _ -> failwith "DT: impossible branch"
))

# 41 "Base/Effect/Tty.vuna"
let v_handleTtyHostHost = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "tty") n) 808136164) (dtp_effectId n)) (fun a -> (let x = a in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) v_ttyOpHIOHost) comp))

# 45 "Base/Effect/Tty.vuna"
let v_runTtyHost = (fun comp -> (B_dEffect_dCore.v_joinEff ((v_handleTtyHostHost "default") comp)))

# 49 "Base/Effect/Tty.vuna"
let v_runTtyEff = (fun comp -> (B_dEffect_dHost.v_hostSync (v_runTtyHost comp)))
