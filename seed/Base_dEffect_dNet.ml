open Vuna_runtime
type t_Base_dEffect_dNet_dNetOp = C_Base_dEffect_dNet_dNetOp_Listen of (string) | C_Base_dEffect_dNet_dNetOp_Port of (int) | C_Base_dEffect_dNet_dNetOp_Accept of (int) | C_Base_dEffect_dNet_dNetOp_Recv of (int) * (int) | C_Base_dEffect_dNet_dNetOp_Send of (int) * (string) | C_Base_dEffect_dNet_dNetOp_Close of (int) | C_Base_dEffect_dNet_dNetOp_Connect of (string) | C_Base_dEffect_dNet_dNetOp_AcceptWithin of (int) * (int) | C_Base_dEffect_dNet_dNetOp_RecvWithin of (int) * (int) * (int) | C_Base_dEffect_dNet_dNetOp_SendWithin of (int) * (string) * (int)
and 'a0 t_Base_dEffect_dNet_dNetStep = C_Base_dEffect_dNet_dNetStep_StepOk of ('a0) | C_Base_dEffect_dNet_dNetStep_StepClosed | C_Base_dEffect_dNet_dNetStep_StepTimeout
and t_Base_dEffect_dNet_dNetError = C_Base_dEffect_dNet_dNetError_NetRefused of (string) | C_Base_dEffect_dNet_dNetError_NetTimeout of (string) | C_Base_dEffect_dNet_dNetError_NetClosed of (string) | C_Base_dEffect_dNet_dNetError_NetAddrInUse of (string) | C_Base_dEffect_dNet_dNetError_NetBadAddr of (string) | C_Base_dEffect_dNet_dNetError_NetBadHandle of (string) | C_Base_dEffect_dNet_dNetError_NetIo of (string)
and t_Base_dEffect_dNet_dNetErrorOp = C_Base_dEffect_dNet_dNetErrorOp_NetFail of (t_Base_dEffect_dNet_dNetError)

# 54 "Base/Effect/Net.vuna"
let v_Base_dEffect_dNet_dnetListen = (fun n addr -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "net") n) (C_Base_dEffect_dNet_dNetOp_Listen (addr))))

# 59 "Base/Effect/Net.vuna"
let v_Base_dEffect_dNet_dnetPort = (fun n h -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "net") n) (C_Base_dEffect_dNet_dNetOp_Port (h))))

# 64 "Base/Effect/Net.vuna"
let v_Base_dEffect_dNet_dnetAccept = (fun n h -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "net") n) (C_Base_dEffect_dNet_dNetOp_Accept (h))))

# 69 "Base/Effect/Net.vuna"
let v_Base_dEffect_dNet_dnetRecv = (fun n h bytes -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "net") n) (C_Base_dEffect_dNet_dNetOp_Recv (h, bytes))))

# 74 "Base/Effect/Net.vuna"
let v_Base_dEffect_dNet_dnetSend = (fun n h s -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "net") n) (C_Base_dEffect_dNet_dNetOp_Send (h, s))))

# 79 "Base/Effect/Net.vuna"
let v_Base_dEffect_dNet_dnetClose = (fun n h -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "net") n) (C_Base_dEffect_dNet_dNetOp_Close (h))))

# 84 "Base/Effect/Net.vuna"
let v_Base_dEffect_dNet_dnetConnect = (fun n addr -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "net") n) (C_Base_dEffect_dNet_dNetOp_Connect (addr))))

# 89 "Base/Effect/Net.vuna"
let v_Base_dEffect_dNet_dnetAcceptWithin = (fun n h micros -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "net") n) (C_Base_dEffect_dNet_dNetOp_AcceptWithin (h, micros))))

# 94 "Base/Effect/Net.vuna"
let v_Base_dEffect_dNet_dnetRecvWithin = (fun n h bytes micros -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "net") n) (C_Base_dEffect_dNet_dNetOp_RecvWithin (h, bytes, micros))))

# 99 "Base/Effect/Net.vuna"
let v_Base_dEffect_dNet_dnetSendWithin = (fun n h s micros -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "net") n) (C_Base_dEffect_dNet_dNetOp_SendWithin (h, s, micros))))

# 126 "Base/Effect/Net.vuna"
let v_Base_dEffect_dNet_dnetFail = (fun n e -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "net-error") n) (C_Base_dEffect_dNet_dNetErrorOp_NetFail (e))))

# 130 "Base/Effect/Net.vuna"
let v_Base_dEffect_dNet_dnetErrorOfCode = (fun (mc0 : string) (mc1 : int) -> (if (mc1 = 2) then (C_Base_dEffect_dNet_dNetError_NetRefused (mc0)) else (if (mc1 = 3) then (C_Base_dEffect_dNet_dNetError_NetTimeout (mc0)) else (if (mc1 = 4) then (C_Base_dEffect_dNet_dNetError_NetClosed (mc0)) else (if (mc1 = 5) then (C_Base_dEffect_dNet_dNetError_NetAddrInUse (mc0)) else (if (mc1 = 6) then (C_Base_dEffect_dNet_dNetError_NetBadAddr (mc0)) else (if (mc1 = 7) then (C_Base_dEffect_dNet_dNetError_NetTimeout (mc0)) else (if (mc1 = 8) then (C_Base_dEffect_dNet_dNetError_NetBadHandle (mc0)) else (C_Base_dEffect_dNet_dNetError_NetIo (mc0))))))))))

# 141 "Base/Effect/Net.vuna"
let v_Base_dEffect_dNet_dnetErrorText = (fun (mc0 : t_Base_dEffect_dNet_dNetError) -> (match mc0 with
  | C_Base_dEffect_dNet_dNetError_NetIo (dtb__0) -> (String.concat "" ["net: "; dtb__0; ": host I/O error"])
  | C_Base_dEffect_dNet_dNetError_NetBadHandle (dtb__1) -> (String.concat "" ["net: "; dtb__1; ": invalid handle (closed or unknown)"])
  | C_Base_dEffect_dNet_dNetError_NetBadAddr (dtb__2) -> (String.concat "" ["net: "; dtb__2; ": invalid address"])
  | C_Base_dEffect_dNet_dNetError_NetAddrInUse (dtb__3) -> (String.concat "" ["net: "; dtb__3; ": address already in use"])
  | C_Base_dEffect_dNet_dNetError_NetClosed (dtb__4) -> (String.concat "" ["net: "; dtb__4; ": connection closed"])
  | C_Base_dEffect_dNet_dNetError_NetTimeout (dtb__5) -> (String.concat "" ["net: "; dtb__5; ": timed out"])
  | C_Base_dEffect_dNet_dNetError_NetRefused (dtb__6) -> (String.concat "" ["net: "; dtb__6; ": connection refused"])
  | _ -> failwith "DT: impossible branch"
))

# 151 "Base/Effect/Net.vuna"
let v_Base_dEffect_dNet_dhandleNet = (fun n ret opH comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCore "net") n) ret) (Obj.magic opH)) comp))

# 155 "Base/Effect/Net.vuna"
let v_Base_dEffect_dNet_dnetHostStatus = (Base_dEffect_dCore.v_Base_dEffect_dCore_draise (Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (dtp_hostStatus ()))))

# 159 "Base/Effect/Net.vuna"
let v_Base_dEffect_dNet_dhandleContext = (fun h -> ("handle " ^ (bi_strFromInt h)))

# 163 "Base/Effect/Net.vuna"
let v_Base_dEffect_dNet_dnetOpHIOHost = (fun op k -> (match op with
  | C_Base_dEffect_dNet_dNetOp_Listen (dtb__7) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_try_net_listen dtio_0)) dtb__7))) (fun _x64_vuna_x64_effK_u165_u5_u6_x58_h -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dNet_dnetHostStatus) (fun _x64_vuna_x64_effK_u166_u5_u7_x58_ok -> (if (_x64_vuna_x64_effK_u166_u5_u7_x58_ok <> 0) then ((v_Base_dEffect_dNet_dnetFail "net-error") ((v_Base_dEffect_dNet_dnetErrorOfCode ("listen " ^ dtb__7)) _x64_vuna_x64_effK_u166_u5_u7_x58_ok)) else ((Obj.magic k) _x64_vuna_x64_effK_u165_u5_u6_x58_h))))))
  | C_Base_dEffect_dNet_dNetOp_Port (dtb__8) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_try_net_port dtio_0)) dtb__8))) (fun _x64_vuna_x64_effK_u169_u5_u6_x58_p -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dNet_dnetHostStatus) (fun _x64_vuna_x64_effK_u170_u5_u7_x58_ok -> (if (_x64_vuna_x64_effK_u170_u5_u7_x58_ok <> 0) then ((v_Base_dEffect_dNet_dnetFail "net-error") ((v_Base_dEffect_dNet_dnetErrorOfCode ("port " ^ (v_Base_dEffect_dNet_dhandleContext dtb__8))) _x64_vuna_x64_effK_u170_u5_u7_x58_ok)) else ((Obj.magic k) _x64_vuna_x64_effK_u169_u5_u6_x58_p))))))
  | C_Base_dEffect_dNet_dNetOp_Accept (dtb__9) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_try_net_accept dtio_0)) dtb__9))) (fun _x64_vuna_x64_effK_u173_u5_u6_x58_c -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dNet_dnetHostStatus) (fun _x64_vuna_x64_effK_u174_u5_u7_x58_ok -> (if (_x64_vuna_x64_effK_u174_u5_u7_x58_ok <> 0) then ((v_Base_dEffect_dNet_dnetFail "net-error") ((v_Base_dEffect_dNet_dnetErrorOfCode ("accept " ^ (v_Base_dEffect_dNet_dhandleContext dtb__9))) _x64_vuna_x64_effK_u174_u5_u7_x58_ok)) else ((Obj.magic k) _x64_vuna_x64_effK_u173_u5_u6_x58_c))))))
  | C_Base_dEffect_dNet_dNetOp_Recv (dtb__10, dtb__11) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise (((fun dtio_0 dtio_1 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_try_net_recv dtio_0 dtio_1)) dtb__10) dtb__11))) (fun _x64_vuna_x64_effK_u177_u5_u7_x58_s -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dNet_dnetHostStatus) (fun _x64_vuna_x64_effK_u178_u5_u8_x58_ok -> (if (_x64_vuna_x64_effK_u178_u5_u8_x58_ok = 0) then ((Obj.magic k) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (_x64_vuna_x64_effK_u177_u5_u7_x58_s))) else (if (_x64_vuna_x64_effK_u178_u5_u8_x58_ok = 1) then ((Obj.magic k) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else ((v_Base_dEffect_dNet_dnetFail "net-error") ((v_Base_dEffect_dNet_dnetErrorOfCode ("recv " ^ (v_Base_dEffect_dNet_dhandleContext dtb__10))) _x64_vuna_x64_effK_u178_u5_u8_x58_ok))))))))
  | C_Base_dEffect_dNet_dNetOp_Send (dtb__12, dtb__13) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise (((fun dtio_0 dtio_1 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_try_net_send dtio_0 dtio_1)) dtb__12) dtb__13))) (fun _x64_vuna_x64_effK_u182_u5_u7_x58_n -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dNet_dnetHostStatus) (fun _x64_vuna_x64_effK_u183_u5_u8_x58_ok -> (if (_x64_vuna_x64_effK_u183_u5_u8_x58_ok <> 0) then ((v_Base_dEffect_dNet_dnetFail "net-error") ((v_Base_dEffect_dNet_dnetErrorOfCode ("send " ^ (v_Base_dEffect_dNet_dhandleContext dtb__12))) _x64_vuna_x64_effK_u183_u5_u8_x58_ok)) else ((Obj.magic k) _x64_vuna_x64_effK_u182_u5_u7_x58_n))))))
  | C_Base_dEffect_dNet_dNetOp_Close (dtb__14) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_try_net_close dtio_0)) dtb__14))) (fun _x64_vuna_x64_effK_u0_u0_u6_x58__u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dNet_dnetHostStatus) (fun _x64_vuna_x64_effK_u187_u5_u7_x58_ok -> (if (_x64_vuna_x64_effK_u187_u5_u7_x58_ok <> 0) then ((v_Base_dEffect_dNet_dnetFail "net-error") ((v_Base_dEffect_dNet_dnetErrorOfCode ("close " ^ (v_Base_dEffect_dNet_dhandleContext dtb__14))) _x64_vuna_x64_effK_u187_u5_u7_x58_ok)) else ((Obj.magic k) 0))))))
  | C_Base_dEffect_dNet_dNetOp_Connect (dtb__15) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_try_net_connect dtio_0)) dtb__15))) (fun _x64_vuna_x64_effK_u190_u5_u6_x58_c -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dNet_dnetHostStatus) (fun _x64_vuna_x64_effK_u191_u5_u7_x58_ok -> (if (_x64_vuna_x64_effK_u191_u5_u7_x58_ok <> 0) then ((v_Base_dEffect_dNet_dnetFail "net-error") ((v_Base_dEffect_dNet_dnetErrorOfCode ("connect " ^ dtb__15)) _x64_vuna_x64_effK_u191_u5_u7_x58_ok)) else ((Obj.magic k) _x64_vuna_x64_effK_u190_u5_u6_x58_c))))))
  | C_Base_dEffect_dNet_dNetOp_AcceptWithin (dtb__16, dtb__17) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise (((fun dtio_0 dtio_1 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_try_net_accept_within dtio_0 dtio_1)) dtb__16) dtb__17))) (fun _x64_vuna_x64_effK_u194_u5_u7_x58_c -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dNet_dnetHostStatus) (fun _x64_vuna_x64_effK_u195_u5_u8_x58_ok -> (if (_x64_vuna_x64_effK_u195_u5_u8_x58_ok = 0) then ((Obj.magic k) (C_Base_dEffect_dNet_dNetStep_StepOk (_x64_vuna_x64_effK_u194_u5_u7_x58_c))) else (if (_x64_vuna_x64_effK_u195_u5_u8_x58_ok = 7) then ((Obj.magic k) C_Base_dEffect_dNet_dNetStep_StepTimeout) else ((v_Base_dEffect_dNet_dnetFail "net-error") ((v_Base_dEffect_dNet_dnetErrorOfCode ("acceptWithin " ^ (v_Base_dEffect_dNet_dhandleContext dtb__16))) _x64_vuna_x64_effK_u195_u5_u8_x58_ok))))))))
  | C_Base_dEffect_dNet_dNetOp_RecvWithin (dtb__18, dtb__19, dtb__20) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((((fun dtio_0 dtio_1 dtio_2 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_try_net_recv_within dtio_0 dtio_1 dtio_2)) dtb__18) dtb__19) dtb__20))) (fun _x64_vuna_x64_effK_u199_u5_u8_x58_s -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dNet_dnetHostStatus) (fun _x64_vuna_x64_effK_u200_u5_u9_x58_ok -> (if (_x64_vuna_x64_effK_u200_u5_u9_x58_ok = 0) then ((Obj.magic k) (C_Base_dEffect_dNet_dNetStep_StepOk (_x64_vuna_x64_effK_u199_u5_u8_x58_s))) else (if (_x64_vuna_x64_effK_u200_u5_u9_x58_ok = 1) then ((Obj.magic k) C_Base_dEffect_dNet_dNetStep_StepClosed) else (if (_x64_vuna_x64_effK_u200_u5_u9_x58_ok = 7) then ((Obj.magic k) C_Base_dEffect_dNet_dNetStep_StepTimeout) else ((v_Base_dEffect_dNet_dnetFail "net-error") ((v_Base_dEffect_dNet_dnetErrorOfCode ("recvWithin " ^ (v_Base_dEffect_dNet_dhandleContext dtb__18))) _x64_vuna_x64_effK_u200_u5_u9_x58_ok)))))))))
  | C_Base_dEffect_dNet_dNetOp_SendWithin (dtb__21, dtb__22, dtb__23) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((((fun dtio_0 dtio_1 dtio_2 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_try_net_send_within dtio_0 dtio_1 dtio_2)) dtb__21) dtb__22) dtb__23))) (fun _x64_vuna_x64_effK_u205_u5_u8_x58_n -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dNet_dnetHostStatus) (fun _x64_vuna_x64_effK_u206_u5_u9_x58_ok -> (if (_x64_vuna_x64_effK_u206_u5_u9_x58_ok = 0) then ((Obj.magic k) (C_Base_dEffect_dNet_dNetStep_StepOk (_x64_vuna_x64_effK_u205_u5_u8_x58_n))) else (if (_x64_vuna_x64_effK_u206_u5_u9_x58_ok = 7) then ((Obj.magic k) C_Base_dEffect_dNet_dNetStep_StepTimeout) else ((v_Base_dEffect_dNet_dnetFail "net-error") ((v_Base_dEffect_dNet_dnetErrorOfCode ("sendWithin " ^ (v_Base_dEffect_dNet_dhandleContext dtb__21))) _x64_vuna_x64_effK_u206_u5_u9_x58_ok))))))))
  | _ -> failwith "DT: impossible branch"
))

# 212 "Base/Effect/Net.vuna"
let v_Base_dEffect_dNet_dhandleNetHostHost = (fun n comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCoreAt "net") n) (fun a -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) a))) v_Base_dEffect_dNet_dnetOpHIOHost) comp))

# 216 "Base/Effect/Net.vuna"
let v_Base_dEffect_dNet_drunNetHost = (fun comp -> (Base_dEffect_dCore.v_Base_dEffect_dCore_djoinEff ((v_Base_dEffect_dNet_dhandleNetHostHost "default") comp)))

# 220 "Base/Effect/Net.vuna"
let v_Base_dEffect_dNet_dnetErrorRet = (fun a -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (a)))

# 224 "Base/Effect/Net.vuna"
let v_Base_dEffect_dNet_dnetErrorOpHR = (fun op _u -> (match op with
  | C_Base_dEffect_dNet_dNetErrorOp_NetFail (dtb__24) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err ((v_Base_dEffect_dNet_dnetErrorText dtb__24)))
  | _ -> failwith "DT: impossible branch"
))

# 229 "Base/Effect/Net.vuna"
let v_Base_dEffect_dNet_drunNetError = (fun n comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCoreAt "net-error") n) v_Base_dEffect_dNet_dnetErrorRet) v_Base_dEffect_dNet_dnetErrorOpHR) comp))

# 233 "Base/Effect/Net.vuna"
let v_Base_dEffect_dNet_drunNetErrorHost = (fun comp -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Base_dEffect_dNet_drunNetError "net-error") comp)) (fun _x64_vuna_x64_effK_u234_u3_u3_x58_res -> (match _x64_vuna_x64_effK_u234_u3_u3_x58_res with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__25) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) dtb__25)
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__26) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (fun s -> (try prerr_string s; flush stderr; String.length s with _ -> 0)) dtio_0)) (String.concat "" ["vuna: "; dtb__26; "\n"])))) (fun _x64_vuna_x64_effK_u0_u0_u6_x58__u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_exit dtio_0)) 1))) (fun _x64_vuna_x64_effK_u0_u0_u7_x58__u -> ((fun msg -> failwith msg) "unreachable: net error handler")))))
  | _ -> failwith "DT: impossible branch"
))))
