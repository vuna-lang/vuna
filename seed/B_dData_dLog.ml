open Vuna_runtime
# 21 "Base/Data/Log.vuna"
let v_logOn = (fun (level : int) (scope : string) -> ((dtp_log_on level) scope))

# 25 "Base/Data/Log.vuna"
let v_logAt = (fun (level : int) (scope : string) (text : string) -> (((dtp_log_emit level) scope) text))

# 29 "Base/Data/Log.vuna"
let v_logError = (fun (scope : string) (text : string) -> (((v_logAt 0) scope) text))

# 33 "Base/Data/Log.vuna"
let v_logWarn = (fun (scope : string) (text : string) -> (((v_logAt 1) scope) text))

# 37 "Base/Data/Log.vuna"
let v_logInfo = (fun (scope : string) (text : string) -> (((v_logAt 2) scope) text))

# 41 "Base/Data/Log.vuna"
let v_logDebug = (fun (scope : string) (text : string) -> (((v_logAt 3) scope) text))

# 45 "Base/Data/Log.vuna"
let v_logTrace = (fun (scope : string) (text : string) -> (((v_logAt 4) scope) text))

# 53 "Base/Data/Log.vuna"
let v_dbgShow = (fun _uctx0 x -> (let _u = (if ((dtp_log_on 3) "Base.Data.Log") then (((dtp_log_emit 3) "Base.Data.Log") ((B_dTrait_dShow.v_debugShow _uctx0) x)) else 0) in x))
