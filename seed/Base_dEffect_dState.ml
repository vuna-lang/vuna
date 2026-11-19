open Vuna_runtime
type 'a0 t_Base_dEffect_dState_dStateOp = C_Base_dEffect_dState_dStateOp_Get | C_Base_dEffect_dState_dStateOp_Put of ('a0)

# 18 "Base/Effect/State.vuna"
let v_Base_dEffect_dState_dget = (fun (n : string) -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "state") n) C_Base_dEffect_dState_dStateOp_Get))

# 22 "Base/Effect/State.vuna"
let v_Base_dEffect_dState_dput = (fun (n : string) x -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "state") n) (C_Base_dEffect_dState_dStateOp_Put (x))))

# 26 "Base/Effect/State.vuna"
let v_Base_dEffect_dState_dhandleState = (fun (n : string) ret opH comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCore "state") n) ret) (Obj.magic opH)) comp))
