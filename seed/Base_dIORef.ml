open Vuna_runtime
# 11 "Base/IORef.vuna"
let v_Base_dIORef_dnewRef = (fun x -> (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun x -> ref x) dtio_0)) x)))

# 15 "Base/IORef.vuna"
let v_Base_dIORef_dreadRef = (fun r -> (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun r -> !r) dtio_0)) r)))

# 19 "Base/IORef.vuna"
let v_Base_dIORef_dwriteRef = (fun r v -> (Base_dEff.v_Base_dEff_draise (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun r v -> r := v; 0) dtio_0 dtio_1)) r) v)))

# 23 "Base/IORef.vuna"
let v_Base_dIORef_dmodifyRef = (fun r f -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Base_dIORef_dreadRef r)) (fun x -> ((v_Base_dIORef_dwriteRef r) (f x)))))
