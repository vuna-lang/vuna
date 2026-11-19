open Vuna_runtime
type t_RefOp = C_RefOp_RefTag

# 16 "Base/Effect/Ref.vuna"
let v_refNew = (fun x -> ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun x -> ref x) dtio_0)) x))

# 20 "Base/Effect/Ref.vuna"
let v_refRead = (fun r -> ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun r -> !r) dtio_0)) r))

# 24 "Base/Effect/Ref.vuna"
let v_refWrite = (fun r v -> (((fun dtio_0 dtio_1 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun r v -> r := v; 0) dtio_0 dtio_1)) r) v))
