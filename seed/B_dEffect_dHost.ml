open Vuna_runtime
type t_HostOp = |

# 25 "Base/Effect/Host.vuna"
let v_runHost = (fun e -> (B_dEffect_dCore.v_runEff e))

# 32 "Base/Effect/Host.vuna"
let v_hostSync = (fun e -> (B_dEffect_dCore.v_raise (B_dEffect_dCore.v_dropEffHead e)))
