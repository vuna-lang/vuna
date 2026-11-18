open Vuna_runtime
type 'a0 t_Base_dEffState_dStateOp = C_Base_dEffState_dStateOp_Get | C_Base_dEffState_dStateOp_Put of ('a0)

# 18 "Base/EffState.vuna"
let v_Base_dEffState_dget = (fun n -> (((Base_dEff.v_Base_dEff_dsendCore "state") n) C_Base_dEffState_dStateOp_Get))

# 22 "Base/EffState.vuna"
let v_Base_dEffState_dput = (fun n x -> (((Base_dEff.v_Base_dEff_dsendCore "state") n) (C_Base_dEffState_dStateOp_Put (x))))

# 26 "Base/EffState.vuna"
let v_Base_dEffState_dhandleState = (fun n ret opH comp -> (((((Base_dEff.v_Base_dEff_dhandleCore "state") n) ret) (Obj.magic opH)) comp))
