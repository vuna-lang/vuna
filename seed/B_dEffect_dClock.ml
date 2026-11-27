open Vuna_runtime
type t_ClockOp = C_ClockOp_Now | C_ClockOp_SleepMicros of (int)

# 19 "Base/Effect/Clock.vuna"
let v_clockNow = (fun (n : string) -> (((((B_dEffect_dCore.v_sendCoreId "clock") n) 363073373) (dtp_effectId n)) C_ClockOp_Now))

# 23 "Base/Effect/Clock.vuna"
let v_clockSleepMicros = (fun (n : string) (us : int) -> (((((B_dEffect_dCore.v_sendCoreId "clock") n) 363073373) (dtp_effectId n)) (C_ClockOp_SleepMicros (us))))

# 27 "Base/Effect/Clock.vuna"
let v_handleClock = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreId "clock") n) 363073373) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 35 "Base/Effect/Clock.vuna"
let v_clockOpHIOHost = (fun (op : t_ClockOp) k -> (match op with
  | C_ClockOp_Now -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__0 = Obj.obj (e) in (let dtb__1 = Obj.obj ((k (dtb__0 u))) in (dtb__1 u)))))) (Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_timeUs ())))) (fun t -> ((Obj.magic k) t)))
  | C_ClockOp_SleepMicros (dtb__2) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__3 = Obj.obj (e) in (let dtb__4 = Obj.obj ((k (dtb__3 u))) in (dtb__4 u)))))) ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_sleep dtio_0)) dtb__2)) (fun _u -> ((Obj.magic k) 0)))
  | _ -> failwith "DT: impossible branch"
))

# 48 "Base/Effect/Clock.vuna"
let v_handleClockHostHost = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "clock") n) 363073373) (dtp_effectId n)) (fun a -> (let x = a in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) v_clockOpHIOHost) comp))

# 53 "Base/Effect/Clock.vuna"
let v_runClockHost = (fun comp -> (B_dEffect_dCore.v_joinEff ((v_handleClockHostHost "default") comp)))

# 57 "Base/Effect/Clock.vuna"
let v_runClockEff = (fun comp -> (B_dEffect_dHost.v_hostSync (v_runClockHost comp)))
