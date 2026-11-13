open Vuna_runtime
type t_Base_dEffClock_dClockOp = C_Base_dEffClock_dClockOp_Now | C_Base_dEffClock_dClockOp_SleepMicros of (int)

let v_Base_dEffClock_dclockNow = (fun n -> (((Base_dEff.v_Base_dEff_dsendCore "clock") n) C_Base_dEffClock_dClockOp_Now))

let v_Base_dEffClock_dclockSleepMicros = (fun n us -> (((Base_dEff.v_Base_dEff_dsendCore "clock") n) (C_Base_dEffClock_dClockOp_SleepMicros (us))))

let v_Base_dEffClock_dhandleClock = (fun n ret opH comp -> (((((Base_dEff.v_Base_dEff_dhandleCore "clock") n) ret) (Obj.magic opH)) comp))

let v_Base_dEffClock_dclockOpHIO = (fun op k -> (match op with
  | C_Base_dEffClock_dClockOp_Now -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ())))) (fun t -> ((Obj.magic k) t)))
  | C_Base_dEffClock_dClockOp_SleepMicros (dtb__0) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_sleep dtio_0)) dtb__0)) (fun _u -> ((Obj.magic k) 0)))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dEffClock_dclockOpHIOHost = (fun op k -> (match op with
  | C_Base_dEffClock_dClockOp_Now -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ())))) (fun t -> ((Obj.magic k) t)))
  | C_Base_dEffClock_dClockOp_SleepMicros (dtb__1) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_sleep dtio_0)) dtb__1)) (fun _u -> ((Obj.magic k) 0)))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dEffClock_dhandleClockHostHost = (fun n comp -> ((((v_Base_dEffClock_dhandleClock n) (fun a -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) a))) v_Base_dEffClock_dclockOpHIOHost) comp))

let v_Base_dEffClock_drunClockHost = (fun comp -> (Base_dEff.v_Base_dEff_djoinEff ((v_Base_dEffClock_dhandleClockHostHost "default") comp)))
