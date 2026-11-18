open Vuna_runtime
type t_Base_dEffect_dRef_dRefOp = C_Base_dEffect_dRef_dRefOp_RefTag

# 16 "Base/Effect/Ref.vuna"
let v_Base_dEffect_dRef_drefNew = (fun x -> ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (fun x -> ref x) dtio_0)) x))

# 20 "Base/Effect/Ref.vuna"
let v_Base_dEffect_dRef_drefRead = (fun r -> ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (fun r -> !r) dtio_0)) r))

# 24 "Base/Effect/Ref.vuna"
let v_Base_dEffect_dRef_drefWrite = (fun r v -> (((fun dtio_0 dtio_1 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (fun r v -> r := v; 0) dtio_0 dtio_1)) r) v))
