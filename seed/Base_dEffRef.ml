open Vuna_runtime
type t_Base_dEffRef_dRefOp = C_Base_dEffRef_dRefOp_RefTag

let v_Base_dEffRef_drefNew = (fun x -> ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun x -> ref x) dtio_0)) x))

let v_Base_dEffRef_drefRead = (fun r -> ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun r -> !r) dtio_0)) r))

let v_Base_dEffRef_drefWrite = (fun r v -> (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun r v -> r := v; 0) dtio_0 dtio_1)) r) v))
