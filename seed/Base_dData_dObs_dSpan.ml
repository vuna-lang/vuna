open Vuna_runtime
# 17 "Base/Data/Obs/Span.vuna"
let v_Base_dData_dObs_dSpan_dobsSpan = (fun name cat f -> (((dtp_obs_span name) cat) f))

# 21 "Base/Data/Obs/Span.vuna"
let v_Base_dData_dObs_dSpan_dobsSpanP = (fun name f -> (((dtp_obs_span name) "vuna.user") f))

# 26 "Base/Data/Obs/Span.vuna"
let v_Base_dData_dObs_dSpan_dobsSpanEff = (fun name cat action -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Base_dData_dObs.v_Base_dData_dObs_dobsSpanBegin name) cat))) (fun tok -> ((Base_dEffect_dCore.v_Base_dEffect_dCore_dfinally action) ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dData_dObs.v_Base_dData_dObs_dobsSpanEnd tok))))))

# 34 "Base/Data/Obs/Span.vuna"
let v_Base_dData_dObs_dSpan_dobsSample = (fun mode intervalUs f -> ((fun _u -> ((fun r -> ((fun _u -> r) (dtp_obs_sample_stop 0))) (f 0))) ((dtp_obs_sample_start mode) intervalUs)))
