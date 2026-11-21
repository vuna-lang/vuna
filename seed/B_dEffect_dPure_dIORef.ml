open Vuna_runtime
# 11 "Base/Effect/Pure/IORef.vuna"
let v_newRef = (fun x -> (B_dEffect_dCore.v_raise ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun x -> ref x) dtio_0)) x)))

# 15 "Base/Effect/Pure/IORef.vuna"
let v_readRef = (fun r -> (B_dEffect_dCore.v_raise ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun r -> !r) dtio_0)) r)))

# 19 "Base/Effect/Pure/IORef.vuna"
let v_writeRef = (fun r v -> (B_dEffect_dCore.v_raise (((fun dtio_0 dtio_1 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun r v -> r := v; 0) dtio_0 dtio_1)) r) v)))

# 23 "Base/Effect/Pure/IORef.vuna"
let v_modifyRef = (fun r f -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_readRef r)) (fun x -> ((v_writeRef r) (f x)))))
