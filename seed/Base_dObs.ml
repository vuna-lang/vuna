open Vuna_runtime
# 25 "Base/Obs.vuna"
let v_Base_dObs_dobsLevel = (fun n -> (dtp_obs_level n))

# 29 "Base/Obs.vuna"
let v_Base_dObs_dobsOn = (fun n -> (if ((dtp_obs_level n) > 0) then true else false))

# 36 "Base/Obs.vuna"
let v_Base_dObs_dobsLog = (fun text -> (dtp_obs_log text))

# 40 "Base/Obs.vuna"
let v_Base_dObs_dobsCounter = (fun name value -> ((dtp_obs_counter name) value))

# 44 "Base/Obs.vuna"
let v_Base_dObs_dobsMark = (fun name -> (dtp_obs_mark name))

# 49 "Base/Obs.vuna"
let v_Base_dObs_dobsSpanBegin = (fun name cat -> ((dtp_obs_span_begin name) cat))

# 53 "Base/Obs.vuna"
let v_Base_dObs_dobsSpanEnd = (fun tok -> (dtp_obs_span_end tok))

# 60 "Base/Obs.vuna"
let v_Base_dObs_dobsSampleStart = (fun mode intervalUs -> ((dtp_obs_sample_start mode) intervalUs))

# 64 "Base/Obs.vuna"
let v_Base_dObs_dobsSampleStop = (fun n -> (dtp_obs_sample_stop n))
