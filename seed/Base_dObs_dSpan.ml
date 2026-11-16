open Vuna_runtime
# 17 "Base/Obs/Span.vuna"
let v_Base_dObs_dSpan_dobsSpan = (fun name cat f -> (((dtp_obs_span name) cat) f))

# 21 "Base/Obs/Span.vuna"
let v_Base_dObs_dSpan_dobsSpanP = (fun name f -> (((dtp_obs_span name) "vuna.user") f))

# 26 "Base/Obs/Span.vuna"
let v_Base_dObs_dSpan_dobsSpanEff = (fun name cat action -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dObs.v_Base_dObs_dobsSpanBegin name) cat))) (fun tok -> ((Base_dEff.v_Base_dEff_dfinally action) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dObs.v_Base_dObs_dobsSpanEnd tok))))))

# 33 "Base/Obs/Span.vuna"
let v_Base_dObs_dSpan_dobsSample = (fun mode intervalUs f -> ((fun _u -> ((fun r -> ((fun _u -> r) (dtp_obs_sample_stop 0))) (f 0))) ((dtp_obs_sample_start mode) intervalUs)))
