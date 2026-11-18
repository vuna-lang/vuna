open Vuna_runtime
type t_Base_dEffNet_dNetOp = C_Base_dEffNet_dNetOp_Listen of (string) | C_Base_dEffNet_dNetOp_Port of (int) | C_Base_dEffNet_dNetOp_Accept of (int) | C_Base_dEffNet_dNetOp_Recv of (int) * (int) | C_Base_dEffNet_dNetOp_Send of (int) * (string) | C_Base_dEffNet_dNetOp_Close of (int) | C_Base_dEffNet_dNetOp_Connect of (string) | C_Base_dEffNet_dNetOp_AcceptWithin of (int) * (int) | C_Base_dEffNet_dNetOp_RecvWithin of (int) * (int) * (int) | C_Base_dEffNet_dNetOp_SendWithin of (int) * (string) * (int)
and 'a0 t_Base_dEffNet_dNetStep = C_Base_dEffNet_dNetStep_StepOk of ('a0) | C_Base_dEffNet_dNetStep_StepClosed | C_Base_dEffNet_dNetStep_StepTimeout
and t_Base_dEffNet_dNetError = C_Base_dEffNet_dNetError_NetRefused of (string) | C_Base_dEffNet_dNetError_NetTimeout of (string) | C_Base_dEffNet_dNetError_NetClosed of (string) | C_Base_dEffNet_dNetError_NetAddrInUse of (string) | C_Base_dEffNet_dNetError_NetBadAddr of (string) | C_Base_dEffNet_dNetError_NetBadHandle of (string) | C_Base_dEffNet_dNetError_NetIo of (string)
and t_Base_dEffNet_dNetErrorOp = C_Base_dEffNet_dNetErrorOp_NetFail of (t_Base_dEffNet_dNetError)

# 54 "Base/EffNet.vuna"
let v_Base_dEffNet_dnetListen = (fun n addr -> (((Base_dEff.v_Base_dEff_dsendCore "net") n) (C_Base_dEffNet_dNetOp_Listen (addr))))

# 59 "Base/EffNet.vuna"
let v_Base_dEffNet_dnetPort = (fun n h -> (((Base_dEff.v_Base_dEff_dsendCore "net") n) (C_Base_dEffNet_dNetOp_Port (h))))

# 64 "Base/EffNet.vuna"
let v_Base_dEffNet_dnetAccept = (fun n h -> (((Base_dEff.v_Base_dEff_dsendCore "net") n) (C_Base_dEffNet_dNetOp_Accept (h))))

# 69 "Base/EffNet.vuna"
let v_Base_dEffNet_dnetRecv = (fun n h bytes -> (((Base_dEff.v_Base_dEff_dsendCore "net") n) (C_Base_dEffNet_dNetOp_Recv (h, bytes))))

# 74 "Base/EffNet.vuna"
let v_Base_dEffNet_dnetSend = (fun n h s -> (((Base_dEff.v_Base_dEff_dsendCore "net") n) (C_Base_dEffNet_dNetOp_Send (h, s))))

# 79 "Base/EffNet.vuna"
let v_Base_dEffNet_dnetClose = (fun n h -> (((Base_dEff.v_Base_dEff_dsendCore "net") n) (C_Base_dEffNet_dNetOp_Close (h))))

# 84 "Base/EffNet.vuna"
let v_Base_dEffNet_dnetConnect = (fun n addr -> (((Base_dEff.v_Base_dEff_dsendCore "net") n) (C_Base_dEffNet_dNetOp_Connect (addr))))

# 89 "Base/EffNet.vuna"
let v_Base_dEffNet_dnetAcceptWithin = (fun n h micros -> (((Base_dEff.v_Base_dEff_dsendCore "net") n) (C_Base_dEffNet_dNetOp_AcceptWithin (h, micros))))

# 94 "Base/EffNet.vuna"
let v_Base_dEffNet_dnetRecvWithin = (fun n h bytes micros -> (((Base_dEff.v_Base_dEff_dsendCore "net") n) (C_Base_dEffNet_dNetOp_RecvWithin (h, bytes, micros))))

# 99 "Base/EffNet.vuna"
let v_Base_dEffNet_dnetSendWithin = (fun n h s micros -> (((Base_dEff.v_Base_dEff_dsendCore "net") n) (C_Base_dEffNet_dNetOp_SendWithin (h, s, micros))))

# 126 "Base/EffNet.vuna"
let v_Base_dEffNet_dnetFail = (fun n e -> (((Base_dEff.v_Base_dEff_dsendCore "net-error") n) (C_Base_dEffNet_dNetErrorOp_NetFail (e))))

# 130 "Base/EffNet.vuna"
let v_Base_dEffNet_dnetErrorOfCode = (fun mc0 mc1 -> (if (mc1 = 2) then (C_Base_dEffNet_dNetError_NetRefused (mc0)) else (if (mc1 = 3) then (C_Base_dEffNet_dNetError_NetTimeout (mc0)) else (if (mc1 = 4) then (C_Base_dEffNet_dNetError_NetClosed (mc0)) else (if (mc1 = 5) then (C_Base_dEffNet_dNetError_NetAddrInUse (mc0)) else (if (mc1 = 6) then (C_Base_dEffNet_dNetError_NetBadAddr (mc0)) else (if (mc1 = 7) then (C_Base_dEffNet_dNetError_NetTimeout (mc0)) else (if (mc1 = 8) then (C_Base_dEffNet_dNetError_NetBadHandle (mc0)) else (C_Base_dEffNet_dNetError_NetIo (mc0))))))))))

# 141 "Base/EffNet.vuna"
let v_Base_dEffNet_dnetErrorText = (fun mc0 -> (match mc0 with
  | C_Base_dEffNet_dNetError_NetIo (dtb__0) -> (String.concat "" ["net: "; dtb__0; ": host I/O error"])
  | C_Base_dEffNet_dNetError_NetBadHandle (dtb__1) -> (String.concat "" ["net: "; dtb__1; ": invalid handle (closed or unknown)"])
  | C_Base_dEffNet_dNetError_NetBadAddr (dtb__2) -> (String.concat "" ["net: "; dtb__2; ": invalid address"])
  | C_Base_dEffNet_dNetError_NetAddrInUse (dtb__3) -> (String.concat "" ["net: "; dtb__3; ": address already in use"])
  | C_Base_dEffNet_dNetError_NetClosed (dtb__4) -> (String.concat "" ["net: "; dtb__4; ": connection closed"])
  | C_Base_dEffNet_dNetError_NetTimeout (dtb__5) -> (String.concat "" ["net: "; dtb__5; ": timed out"])
  | C_Base_dEffNet_dNetError_NetRefused (dtb__6) -> (String.concat "" ["net: "; dtb__6; ": connection refused"])
  | _ -> failwith "DT: impossible branch"
))

# 151 "Base/EffNet.vuna"
let v_Base_dEffNet_dhandleNet = (fun n ret opH comp -> (((((Base_dEff.v_Base_dEff_dhandleCore "net") n) ret) (Obj.magic opH)) comp))

# 155 "Base/EffNet.vuna"
let v_Base_dEffNet_dnetHostStatus = (Base_dEff.v_Base_dEff_draise (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_hostStatus ()))))

# 159 "Base/EffNet.vuna"
let v_Base_dEffNet_dhandleContext = (fun h -> ("handle " ^ (bi_strFromInt h)))

# 163 "Base/EffNet.vuna"
let v_Base_dEffNet_dnetOpHIOHost = (fun op k -> (match op with
  | C_Base_dEffNet_dNetOp_Listen (dtb__7) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_try_net_listen dtio_0)) dtb__7))) (fun h -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffNet_dnetHostStatus) (fun ok -> (if (ok <> 0) then ((v_Base_dEffNet_dnetFail "net-error") ((v_Base_dEffNet_dnetErrorOfCode ("listen " ^ dtb__7)) ok)) else ((Obj.magic k) h))))))
  | C_Base_dEffNet_dNetOp_Port (dtb__8) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_try_net_port dtio_0)) dtb__8))) (fun p -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffNet_dnetHostStatus) (fun ok -> (if (ok <> 0) then ((v_Base_dEffNet_dnetFail "net-error") ((v_Base_dEffNet_dnetErrorOfCode ("port " ^ (v_Base_dEffNet_dhandleContext dtb__8))) ok)) else ((Obj.magic k) p))))))
  | C_Base_dEffNet_dNetOp_Accept (dtb__9) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_try_net_accept dtio_0)) dtb__9))) (fun c -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffNet_dnetHostStatus) (fun ok -> (if (ok <> 0) then ((v_Base_dEffNet_dnetFail "net-error") ((v_Base_dEffNet_dnetErrorOfCode ("accept " ^ (v_Base_dEffNet_dhandleContext dtb__9))) ok)) else ((Obj.magic k) c))))))
  | C_Base_dEffNet_dNetOp_Recv (dtb__10, dtb__11) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_try_net_recv dtio_0 dtio_1)) dtb__10) dtb__11))) (fun s -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffNet_dnetHostStatus) (fun ok -> (if (ok = 0) then ((Obj.magic k) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (s))) else (if (ok = 1) then ((Obj.magic k) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else ((v_Base_dEffNet_dnetFail "net-error") ((v_Base_dEffNet_dnetErrorOfCode ("recv " ^ (v_Base_dEffNet_dhandleContext dtb__10))) ok))))))))
  | C_Base_dEffNet_dNetOp_Send (dtb__12, dtb__13) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_try_net_send dtio_0 dtio_1)) dtb__12) dtb__13))) (fun n -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffNet_dnetHostStatus) (fun ok -> (if (ok <> 0) then ((v_Base_dEffNet_dnetFail "net-error") ((v_Base_dEffNet_dnetErrorOfCode ("send " ^ (v_Base_dEffNet_dhandleContext dtb__12))) ok)) else ((Obj.magic k) n))))))
  | C_Base_dEffNet_dNetOp_Close (dtb__14) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_try_net_close dtio_0)) dtb__14))) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffNet_dnetHostStatus) (fun ok -> (if (ok <> 0) then ((v_Base_dEffNet_dnetFail "net-error") ((v_Base_dEffNet_dnetErrorOfCode ("close " ^ (v_Base_dEffNet_dhandleContext dtb__14))) ok)) else ((Obj.magic k) 0))))))
  | C_Base_dEffNet_dNetOp_Connect (dtb__15) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_try_net_connect dtio_0)) dtb__15))) (fun c -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffNet_dnetHostStatus) (fun ok -> (if (ok <> 0) then ((v_Base_dEffNet_dnetFail "net-error") ((v_Base_dEffNet_dnetErrorOfCode ("connect " ^ dtb__15)) ok)) else ((Obj.magic k) c))))))
  | C_Base_dEffNet_dNetOp_AcceptWithin (dtb__16, dtb__17) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_try_net_accept_within dtio_0 dtio_1)) dtb__16) dtb__17))) (fun c -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffNet_dnetHostStatus) (fun ok -> (if (ok = 0) then ((Obj.magic k) (C_Base_dEffNet_dNetStep_StepOk (c))) else (if (ok = 7) then ((Obj.magic k) C_Base_dEffNet_dNetStep_StepTimeout) else ((v_Base_dEffNet_dnetFail "net-error") ((v_Base_dEffNet_dnetErrorOfCode ("acceptWithin " ^ (v_Base_dEffNet_dhandleContext dtb__16))) ok))))))))
  | C_Base_dEffNet_dNetOp_RecvWithin (dtb__18, dtb__19, dtb__20) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((((fun dtio_0 dtio_1 dtio_2 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_try_net_recv_within dtio_0 dtio_1 dtio_2)) dtb__18) dtb__19) dtb__20))) (fun s -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffNet_dnetHostStatus) (fun ok -> (if (ok = 0) then ((Obj.magic k) (C_Base_dEffNet_dNetStep_StepOk (s))) else (if (ok = 1) then ((Obj.magic k) C_Base_dEffNet_dNetStep_StepClosed) else (if (ok = 7) then ((Obj.magic k) C_Base_dEffNet_dNetStep_StepTimeout) else ((v_Base_dEffNet_dnetFail "net-error") ((v_Base_dEffNet_dnetErrorOfCode ("recvWithin " ^ (v_Base_dEffNet_dhandleContext dtb__18))) ok)))))))))
  | C_Base_dEffNet_dNetOp_SendWithin (dtb__21, dtb__22, dtb__23) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((((fun dtio_0 dtio_1 dtio_2 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_try_net_send_within dtio_0 dtio_1 dtio_2)) dtb__21) dtb__22) dtb__23))) (fun n -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffNet_dnetHostStatus) (fun ok -> (if (ok = 0) then ((Obj.magic k) (C_Base_dEffNet_dNetStep_StepOk (n))) else (if (ok = 7) then ((Obj.magic k) C_Base_dEffNet_dNetStep_StepTimeout) else ((v_Base_dEffNet_dnetFail "net-error") ((v_Base_dEffNet_dnetErrorOfCode ("sendWithin " ^ (v_Base_dEffNet_dhandleContext dtb__21))) ok))))))))
  | _ -> failwith "DT: impossible branch"
))

# 212 "Base/EffNet.vuna"
let v_Base_dEffNet_dhandleNetHostHost = (fun n comp -> (((((Base_dEff.v_Base_dEff_dhandleCoreAt "net") n) (fun a -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) a))) v_Base_dEffNet_dnetOpHIOHost) comp))

# 216 "Base/EffNet.vuna"
let v_Base_dEffNet_drunNetHost = (fun comp -> (Base_dEff.v_Base_dEff_djoinEff ((v_Base_dEffNet_dhandleNetHostHost "default") comp)))

# 220 "Base/EffNet.vuna"
let v_Base_dEffNet_dnetErrorRet = (fun a -> (Base_dResult.C_Base_dResult_dResult_Ok (a)))

# 224 "Base/EffNet.vuna"
let v_Base_dEffNet_dnetErrorOpHR = (fun op _u -> (match op with
  | C_Base_dEffNet_dNetErrorOp_NetFail (dtb__24) -> (Base_dResult.C_Base_dResult_dResult_Err ((v_Base_dEffNet_dnetErrorText dtb__24)))
  | _ -> failwith "DT: impossible branch"
))

# 229 "Base/EffNet.vuna"
let v_Base_dEffNet_drunNetError = (fun n comp -> (((((Base_dEff.v_Base_dEff_dhandleCoreAt "net-error") n) v_Base_dEffNet_dnetErrorRet) v_Base_dEffNet_dnetErrorOpHR) comp))

# 233 "Base/EffNet.vuna"
let v_Base_dEffNet_drunNetErrorHost = (fun comp -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Base_dEffNet_drunNetError "net-error") comp)) (fun res -> (match res with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__25) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) dtb__25)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__26) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun s -> (try prerr_string s; flush stderr; String.length s with _ -> 0)) dtio_0)) (String.concat "" ["vuna: "; dtb__26; "\n"])))) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_exit dtio_0)) 1))) (fun _u -> ((fun msg -> failwith msg) "unreachable: net error handler")))))
  | _ -> failwith "DT: impossible branch"
))))
