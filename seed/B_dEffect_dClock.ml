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
  | C_ClockOp_Now -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_timeUs ())))) (fun t -> ((Obj.magic k) t)))
  | C_ClockOp_SleepMicros (dtb__0) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_sleep dtio_0)) dtb__0)) (fun _u -> ((Obj.magic k) 0)))
  | _ -> failwith "DT: impossible branch"
))

# 48 "Base/Effect/Clock.vuna"
let v_handleClockHostHost = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "clock") n) 363073373) (dtp_effectId n)) (fun a -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) a))) v_clockOpHIOHost) comp))

# 53 "Base/Effect/Clock.vuna"
let v_runClockHost = (fun comp -> (B_dEffect_dCore.v_joinEff ((v_handleClockHostHost "default") comp)))

# 57 "Base/Effect/Clock.vuna"
let v_runClockEff = (fun comp -> (B_dEffect_dHost.v_hostSync (v_runClockHost comp)))
