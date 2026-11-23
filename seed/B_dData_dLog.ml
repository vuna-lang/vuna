open Vuna_runtime
# 19 "Base/Data/Log.vuna"
let v_logOn = (fun (level : int) (scope : string) -> ((dtp_log_on level) scope))

# 23 "Base/Data/Log.vuna"
let v_logAt = (fun (level : int) (scope : string) (text : string) -> (((dtp_log_emit level) scope) text))

# 27 "Base/Data/Log.vuna"
let v_logError = (fun (scope : string) (text : string) -> (((v_logAt 0) scope) text))

# 31 "Base/Data/Log.vuna"
let v_logWarn = (fun (scope : string) (text : string) -> (((v_logAt 1) scope) text))

# 35 "Base/Data/Log.vuna"
let v_logInfo = (fun (scope : string) (text : string) -> (((v_logAt 2) scope) text))

# 39 "Base/Data/Log.vuna"
let v_logDebug = (fun (scope : string) (text : string) -> (((v_logAt 3) scope) text))

# 43 "Base/Data/Log.vuna"
let v_logTrace = (fun (scope : string) (text : string) -> (((v_logAt 4) scope) text))
