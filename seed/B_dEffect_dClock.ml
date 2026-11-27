open Vuna_runtime
type t_ClockOp = C_ClockOp_Now | C_ClockOp_SleepMicros of (int)

# 19 "Base/Effect/Clock.vuna"
let v_clockNow = (fun (dtb_u_u1 : string) -> (((((B_dEffect_dCore.v_sendCoreId "clock") dtb_u_u1) 363073373) (dtp_effectId dtb_u_u1)) C_ClockOp_Now))

# 23 "Base/Effect/Clock.vuna"
let v_clockSleepMicros = (fun (dtb_u_u4 : string) (dtb_u_u7 : int) -> (((((B_dEffect_dCore.v_sendCoreId "clock") dtb_u_u4) 363073373) (dtp_effectId dtb_u_u4)) (C_ClockOp_SleepMicros (dtb_u_u7))))

# 27 "Base/Effect/Clock.vuna"
let v_handleClock = (fun (dtb_u_u13 : string) dtb_u_u15 dtb_u_u16 dtb_u_u17 -> (((((((B_dEffect_dCore.v_handleCoreId "clock") dtb_u_u13) 363073373) (dtp_effectId dtb_u_u13)) dtb_u_u15) (Obj.magic dtb_u_u16)) dtb_u_u17))

# 35 "Base/Effect/Clock.vuna"
let v_clockOpHIOHost = (fun (dtb_u_u20 : t_ClockOp) dtb_u_u21 -> (match dtb_u_u20 with
  | C_ClockOp_Now -> (Obj.repr ((fun (dtb_u_u26 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u27 = Obj.obj ((Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_timeUs ())))) in (let dtb_u_u29 = (dtb_u_u27 dtb_u_u26) in ((Obj.magic ((Obj.magic dtb_u_u21) dtb_u_u29)) dtb_u_u26))))))
  | C_ClockOp_SleepMicros (dtb_u_u30) -> (Obj.repr ((fun (dtb_u_u35 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u36 = Obj.obj (((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_sleep dtio_0)) dtb_u_u30)) in (let dtb_u_u38 = (dtb_u_u36 dtb_u_u35) in ((Obj.magic ((Obj.magic dtb_u_u21) 0)) dtb_u_u35))))))
  | _ -> failwith "DT: impossible branch"
))

# 48 "Base/Effect/Clock.vuna"
let v_handleClockHostHost = (fun (dtb_u_u41 : string) dtb_u_u42 -> (((((((B_dEffect_dCore.v_handleCoreAtId "clock") dtb_u_u41) 363073373) (dtp_effectId dtb_u_u41)) (fun dtb_u_u43 -> (let dtb_u_u45 = dtb_u_u43 in (Obj.repr ((fun (dtb_u_u46 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u45)))))) v_clockOpHIOHost) dtb_u_u42))

# 53 "Base/Effect/Clock.vuna"
let v_runClockHost = (fun dtb_u_u49 -> (B_dEffect_dCore.v_joinEff ((v_handleClockHostHost "default") dtb_u_u49)))

# 57 "Base/Effect/Clock.vuna"
let v_runClockEff = (fun dtb_u_u51 -> (B_dEffect_dHost.v_hostSync (v_runClockHost dtb_u_u51)))
