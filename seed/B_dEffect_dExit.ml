open Vuna_runtime
type t_ExitOp = C_ExitOp_ExitWith of (int)

# 15 "Base/Effect/Exit.vuna"
let v_exitWith = (fun (n : string) (code : int) -> (((((B_dEffect_dCore.v_sendCoreId "exit") n) 233642629) (dtp_effectId n)) (C_ExitOp_ExitWith (code))))

# 19 "Base/Effect/Exit.vuna"
let v_handleExit = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreId "exit") n) 233642629) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 27 "Base/Effect/Exit.vuna"
let v_exitOpHIOHost = (fun (op : t_ExitOp) k -> (match op with
  | C_ExitOp_ExitWith (dtb__0) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__1 = Obj.obj (e) in (let dtb__2 = Obj.obj ((k (dtb__1 u))) in (dtb__2 u)))))) ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_exit dtio_0)) dtb__0)) (fun _u -> ((Obj.magic k) 0)))
  | _ -> failwith "DT: impossible branch"
))

# 36 "Base/Effect/Exit.vuna"
let v_handleExitHostHost = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "exit") n) 233642629) (dtp_effectId n)) (fun a -> (let x = a in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) v_exitOpHIOHost) comp))

# 40 "Base/Effect/Exit.vuna"
let v_runExitHost = (fun comp -> (B_dEffect_dCore.v_joinEff ((v_handleExitHostHost "default") comp)))

# 44 "Base/Effect/Exit.vuna"
let v_runExitEff = (fun comp -> (B_dEffect_dHost.v_hostSync (v_runExitHost comp)))
