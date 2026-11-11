open Vuna_runtime
let v_Base_dIORef_dnewRef = (fun x -> ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun x -> ref x) dtio_0)) x))

let v_Base_dIORef_dreadRef = (fun r -> ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun r -> !r) dtio_0)) r))

let v_Base_dIORef_dwriteRef = (fun r v -> (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun r v -> r := v; 0) dtio_0 dtio_1)) r) v))

let v_Base_dIORef_dmodifyRef = (fun r f -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Base_dIORef_dreadRef r)) (fun x -> ((v_Base_dIORef_dwriteRef r) (f x)))))
