open Vuna_runtime
type t_Base_dEffNet_dNetOp = C_Base_dEffNet_dNetOp_NetTag

let v_Base_dEffNet_dnetListen = (fun addr -> (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_net_listen dtio_0)) addr)))

let v_Base_dEffNet_dnetPort = (fun h -> (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_net_port dtio_0)) h)))

let v_Base_dEffNet_dnetAccept = (fun h -> (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_net_accept dtio_0)) h)))

let v_Base_dEffNet_dnetRecv = (fun h n -> (Base_dEff.v_Base_dEff_draise (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_net_recv dtio_0 dtio_1)) h) n)))

let v_Base_dEffNet_dnetSend = (fun h s -> (Base_dEff.v_Base_dEff_draise (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_net_send dtio_0 dtio_1)) h) s)))

let v_Base_dEffNet_dnetClose = (fun h -> (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_net_close dtio_0)) h)))

let v_Base_dEffNet_dnetConnect = (fun addr -> (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_net_connect dtio_0)) addr)))
