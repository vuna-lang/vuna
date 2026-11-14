open Vuna_runtime
# 34 "Base/Obs.vuna"
let v_Base_dObs_dobsLevel = (fun n -> (dtp_obs_level n))

# 38 "Base/Obs.vuna"
let v_Base_dObs_dobsOn = (fun n -> (if ((dtp_obs_level n) > 0) then true else false))

# 45 "Base/Obs.vuna"
let v_Base_dObs_dobsLog = (fun text -> (dtp_obs_log text))

# 49 "Base/Obs.vuna"
let v_Base_dObs_dobsCounter = (fun name value -> ((dtp_obs_counter name) value))

# 53 "Base/Obs.vuna"
let v_Base_dObs_dobsMark = (fun name -> (dtp_obs_mark name))

# 60 "Base/Obs.vuna"
let v_Base_dObs_dobsSampleStart = (fun mode intervalUs -> ((dtp_obs_sample_start mode) intervalUs))

# 64 "Base/Obs.vuna"
let v_Base_dObs_dobsSampleStop = (fun n -> (dtp_obs_sample_stop n))
