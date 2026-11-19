open Vuna_runtime
# 25 "Base/Data/Obs.vuna"
let v_obsLevel = (fun (n : int) -> (dtp_obs_level n))

# 29 "Base/Data/Obs.vuna"
let v_obsOn = (fun (n : int) -> (if ((dtp_obs_level n) > 0) then true else false))

# 36 "Base/Data/Obs.vuna"
let v_obsLog = (fun (text : string) -> (dtp_obs_log text))

# 40 "Base/Data/Obs.vuna"
let v_obsCounter = (fun (name : string) (value : int) -> ((dtp_obs_counter name) value))

# 44 "Base/Data/Obs.vuna"
let v_obsMark = (fun (name : string) -> (dtp_obs_mark name))

# 49 "Base/Data/Obs.vuna"
let v_obsSpanBegin = (fun (name : string) (cat : string) -> ((dtp_obs_span_begin name) cat))

# 53 "Base/Data/Obs.vuna"
let v_obsSpanEnd = (fun (tok : int) -> (dtp_obs_span_end tok))

# 60 "Base/Data/Obs.vuna"
let v_obsSampleStart = (fun (mode : string) (intervalUs : int) -> ((dtp_obs_sample_start mode) intervalUs))

# 64 "Base/Data/Obs.vuna"
let v_obsSampleStop = (fun (n : int) -> (dtp_obs_sample_stop n))
