open Vuna_runtime
type 'a0 t_StateOp = C_StateOp_Get | C_StateOp_Put of ('a0)

# 18 "Base/Effect/State.vuna"
let v_get = (fun (n : string) -> (((((B_dEffect_dCore.v_sendCoreId "state") n) 942748406) (dtp_effectId n)) C_StateOp_Get))

# 22 "Base/Effect/State.vuna"
let v_put = (fun (n : string) x -> (((((B_dEffect_dCore.v_sendCoreId "state") n) 942748406) (dtp_effectId n)) (C_StateOp_Put (x))))

# 26 "Base/Effect/State.vuna"
let v_handleState = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreId "state") n) 942748406) (dtp_effectId n)) ret) (Obj.magic opH)) comp))
