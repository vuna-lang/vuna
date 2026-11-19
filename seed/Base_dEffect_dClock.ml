open Vuna_runtime
type t_Base_dEffect_dClock_dClockOp = C_Base_dEffect_dClock_dClockOp_Now | C_Base_dEffect_dClock_dClockOp_SleepMicros of (int)

# 18 "Base/Effect/Clock.vuna"
let v_Base_dEffect_dClock_dclockNow = (fun (n : string) -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCoreId "clock") n) 363073373) (dtp_effectId n)) C_Base_dEffect_dClock_dClockOp_Now))

# 22 "Base/Effect/Clock.vuna"
let v_Base_dEffect_dClock_dclockSleepMicros = (fun (n : string) (us : int) -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCoreId "clock") n) 363073373) (dtp_effectId n)) (C_Base_dEffect_dClock_dClockOp_SleepMicros (us))))

# 26 "Base/Effect/Clock.vuna"
let v_Base_dEffect_dClock_dhandleClock = (fun (n : string) ret opH comp -> (((((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCoreId "clock") n) 363073373) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 30 "Base/Effect/Clock.vuna"
let v_Base_dEffect_dClock_dclockOpHIO = (fun (op : t_Base_dEffect_dClock_dClockOp) k -> (match op with
  | C_Base_dEffect_dClock_dClockOp_Now -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (dtp_timeUs ())))) (fun t -> ((Obj.magic k) t)))
  | C_Base_dEffect_dClock_dClockOp_SleepMicros (dtb__0) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_sleep dtio_0)) dtb__0)) (fun _u -> ((Obj.magic k) 0)))
  | _ -> failwith "DT: impossible branch"
))

# 46 "Base/Effect/Clock.vuna"
let v_Base_dEffect_dClock_dclockOpHIOHost = (fun (op : t_Base_dEffect_dClock_dClockOp) k -> (match op with
  | C_Base_dEffect_dClock_dClockOp_Now -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise (Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (dtp_timeUs ()))))) (fun t -> ((Obj.magic k) t)))
  | C_Base_dEffect_dClock_dClockOp_SleepMicros (dtb__1) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_sleep dtio_0)) dtb__1))) (fun _u -> ((Obj.magic k) 0)))
  | _ -> failwith "DT: impossible branch"
))

# 59 "Base/Effect/Clock.vuna"
let v_Base_dEffect_dClock_dhandleClockHostHost = (fun (n : string) comp -> (((((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCoreAtId "clock") n) 363073373) (dtp_effectId n)) (fun a -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) a))) v_Base_dEffect_dClock_dclockOpHIOHost) comp))

# 64 "Base/Effect/Clock.vuna"
let v_Base_dEffect_dClock_drunClockHost = (fun comp -> (Base_dEffect_dCore.v_Base_dEffect_dCore_djoinEff ((v_Base_dEffect_dClock_dhandleClockHostHost "default") comp)))
