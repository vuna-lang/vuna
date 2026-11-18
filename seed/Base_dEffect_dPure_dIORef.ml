open Vuna_runtime
# 11 "Base/Effect/Pure/IORef.vuna"
let v_Base_dEffect_dPure_dIORef_dnewRef = (fun x -> (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (fun x -> ref x) dtio_0)) x)))

# 15 "Base/Effect/Pure/IORef.vuna"
let v_Base_dEffect_dPure_dIORef_dreadRef = (fun r -> (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (fun r -> !r) dtio_0)) r)))

# 19 "Base/Effect/Pure/IORef.vuna"
let v_Base_dEffect_dPure_dIORef_dwriteRef = (fun r v -> (Base_dEffect_dCore.v_Base_dEffect_dCore_draise (((fun dtio_0 dtio_1 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (fun r v -> r := v; 0) dtio_0 dtio_1)) r) v)))

# 23 "Base/Effect/Pure/IORef.vuna"
let v_Base_dEffect_dPure_dIORef_dmodifyRef = (fun r f -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (v_Base_dEffect_dPure_dIORef_dreadRef r)) (fun x -> ((v_Base_dEffect_dPure_dIORef_dwriteRef r) (f x)))))
