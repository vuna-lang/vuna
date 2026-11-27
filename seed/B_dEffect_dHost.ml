open Vuna_runtime
type t_HostOp = |

# 26 "Base/Effect/Host.vuna"
let v_runHost = (fun dtb_u_u2 -> (B_dEffect_dCore.v_runEff dtb_u_u2))

# 33 "Base/Effect/Host.vuna"
let v_hostSync = (fun dtb_u_u5 -> (B_dEffect_dCore.v_raise (B_dEffect_dCore.v_dropEffHead dtb_u_u5)))

# 33 "Base/Effect/Host.vuna"
let v_hostSync_u_udirect = (fun e _u_ueffTok -> ((Obj.magic (B_dEffect_dCore.v_raise (B_dEffect_dCore.v_dropEffHead e))) _u_ueffTok))
