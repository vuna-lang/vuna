open Vuna_runtime
# 17 "Base/Data/Obs/Span.vuna"
let v_obsSpan = (fun (name : string) (cat : string) f -> (((dtp_obs_span name) cat) f))

# 21 "Base/Data/Obs/Span.vuna"
let v_obsSpanP = (fun (name : string) f -> (((dtp_obs_span name) "vuna.user") f))

# 26 "Base/Data/Obs/Span.vuna"
let v_obsSpanEff = (fun (name : string) (cat : string) action -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dData_dObs.v_obsSpanBegin name) cat))) (fun tok -> ((B_dEffect_dCore.v_finally action) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dObs.v_obsSpanEnd tok))))))

# 34 "Base/Data/Obs/Span.vuna"
let v_obsSample = (fun (mode : string) (intervalUs : int) f -> (let _u = ((dtp_obs_sample_start mode) intervalUs) in (let r = (f 0) in (let _u = (dtp_obs_sample_stop 0) in r))))
