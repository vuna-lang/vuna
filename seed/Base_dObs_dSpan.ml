open Vuna_runtime
# 18 "Base/Obs/Span.vuna"
let v_Base_dObs_dSpan_dobsSpan = (fun name cat f -> (((dtp_obs_span name) cat) f))

# 22 "Base/Obs/Span.vuna"
let v_Base_dObs_dSpan_dobsSpanP = (fun name f -> (((dtp_obs_span name) "vuna.user") f))

# 27 "Base/Obs/Span.vuna"
let v_Base_dObs_dSpan_dobsSample = (fun mode intervalUs f -> ((fun _u -> ((fun r -> ((fun _u -> r) (dtp_obs_sample_stop 0))) (f 0))) ((dtp_obs_sample_start mode) intervalUs)))
