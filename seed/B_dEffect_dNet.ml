open Vuna_runtime
type t_NetOp = C_NetOp_Listen of (string) | C_NetOp_Port of (int) | C_NetOp_Accept of (int) | C_NetOp_Recv of (int) * (int) | C_NetOp_Send of (int) * (string) | C_NetOp_Close of (int) | C_NetOp_Connect of (string) | C_NetOp_AcceptWithin of (int) * (int) | C_NetOp_RecvWithin of (int) * (int) * (int) | C_NetOp_SendWithin of (int) * (string) * (int)
and 'a0 t_NetStep = C_NetStep_StepOk of ('a0) | C_NetStep_StepClosed | C_NetStep_StepTimeout
and t_NetError = C_NetError_NetRefused of (string) | C_NetError_NetTimeout of (string) | C_NetError_NetClosed of (string) | C_NetError_NetAddrInUse of (string) | C_NetError_NetBadAddr of (string) | C_NetError_NetBadHandle of (string) | C_NetError_NetIo of (string)
and t_NetErrorOp = C_NetErrorOp_NetFail of (t_NetError)

# 54 "Base/Effect/Net.vuna"
let v_netListen = (fun (n : string) (addr : string) -> (((((B_dEffect_dCore.v_sendCoreId "net") n) 630821208) (dtp_effectId n)) (C_NetOp_Listen (addr))))

# 60 "Base/Effect/Net.vuna"
let v_netPort = (fun (n : string) (h : int) -> (((((B_dEffect_dCore.v_sendCoreId "net") n) 630821208) (dtp_effectId n)) (C_NetOp_Port (h))))

# 66 "Base/Effect/Net.vuna"
let v_netAccept = (fun (n : string) (h : int) -> (((((B_dEffect_dCore.v_sendCoreId "net") n) 630821208) (dtp_effectId n)) (C_NetOp_Accept (h))))

# 72 "Base/Effect/Net.vuna"
let v_netRecv = (fun (n : string) (h : int) (bytes : int) -> (((((B_dEffect_dCore.v_sendCoreId "net") n) 630821208) (dtp_effectId n)) (C_NetOp_Recv (h, bytes))))

# 78 "Base/Effect/Net.vuna"
let v_netSend = (fun (n : string) (h : int) (s : string) -> (((((B_dEffect_dCore.v_sendCoreId "net") n) 630821208) (dtp_effectId n)) (C_NetOp_Send (h, s))))

# 84 "Base/Effect/Net.vuna"
let v_netClose = (fun (n : string) (h : int) -> (((((B_dEffect_dCore.v_sendCoreId "net") n) 630821208) (dtp_effectId n)) (C_NetOp_Close (h))))

# 90 "Base/Effect/Net.vuna"
let v_netConnect = (fun (n : string) (addr : string) -> (((((B_dEffect_dCore.v_sendCoreId "net") n) 630821208) (dtp_effectId n)) (C_NetOp_Connect (addr))))

# 96 "Base/Effect/Net.vuna"
let v_netAcceptWithin = (fun (n : string) (h : int) (micros : int) -> (((((B_dEffect_dCore.v_sendCoreId "net") n) 630821208) (dtp_effectId n)) (C_NetOp_AcceptWithin (h, micros))))

# 102 "Base/Effect/Net.vuna"
let v_netRecvWithin = (fun (n : string) (h : int) (bytes : int) (micros : int) -> (((((B_dEffect_dCore.v_sendCoreId "net") n) 630821208) (dtp_effectId n)) (C_NetOp_RecvWithin (h, bytes, micros))))

# 108 "Base/Effect/Net.vuna"
let v_netSendWithin = (fun (n : string) (h : int) (s : string) (micros : int) -> (((((B_dEffect_dCore.v_sendCoreId "net") n) 630821208) (dtp_effectId n)) (C_NetOp_SendWithin (h, s, micros))))

# 136 "Base/Effect/Net.vuna"
let v_netFail = (fun (n : string) (e : t_NetError) -> (((((B_dEffect_dCore.v_sendCoreId "net-error") n) 1000332959) (dtp_effectId n)) (C_NetErrorOp_NetFail (e))))

# 140 "Base/Effect/Net.vuna"
let v_netErrorOfCode = (fun (mc0 : string) (mc1 : int) -> (if (mc1 = 2) then (C_NetError_NetRefused (mc0)) else (if (mc1 = 3) then (C_NetError_NetTimeout (mc0)) else (if (mc1 = 4) then (C_NetError_NetClosed (mc0)) else (if (mc1 = 5) then (C_NetError_NetAddrInUse (mc0)) else (if (mc1 = 6) then (C_NetError_NetBadAddr (mc0)) else (if (mc1 = 7) then (C_NetError_NetTimeout (mc0)) else (if (mc1 = 8) then (C_NetError_NetBadHandle (mc0)) else (C_NetError_NetIo (mc0))))))))))

# 151 "Base/Effect/Net.vuna"
let v_netErrorText = (fun (mc0 : t_NetError) -> (match mc0 with
  | C_NetError_NetIo (dtb__0) -> (String.concat "" ["net: "; dtb__0; ": host I/O error"])
  | C_NetError_NetBadHandle (dtb__1) -> (String.concat "" ["net: "; dtb__1; ": invalid handle (closed or unknown)"])
  | C_NetError_NetBadAddr (dtb__2) -> (String.concat "" ["net: "; dtb__2; ": invalid address"])
  | C_NetError_NetAddrInUse (dtb__3) -> (String.concat "" ["net: "; dtb__3; ": address already in use"])
  | C_NetError_NetClosed (dtb__4) -> (String.concat "" ["net: "; dtb__4; ": connection closed"])
  | C_NetError_NetTimeout (dtb__5) -> (String.concat "" ["net: "; dtb__5; ": timed out"])
  | C_NetError_NetRefused (dtb__6) -> (String.concat "" ["net: "; dtb__6; ": connection refused"])
  | _ -> failwith "DT: impossible branch"
))

# 161 "Base/Effect/Net.vuna"
let v_handleNet = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreId "net") n) 630821208) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 165 "Base/Effect/Net.vuna"
let v_netHostStatus = (B_dEffect_dCore.v_raise (B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_hostStatus ()))))

# 169 "Base/Effect/Net.vuna"
let v_handleContext = (fun (h : int) -> ("handle " ^ (bi_strFromInt h)))

# 173 "Base/Effect/Net.vuna"
let v_netOpHIOHost = (fun (op : t_NetOp) k -> (match op with
  | C_NetOp_Listen (dtb__7) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_try_net_listen dtio_0)) dtb__7))) (fun h -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_netHostStatus) (fun ok -> (if (ok <> 0) then ((v_netFail "net-error") ((v_netErrorOfCode ("listen " ^ dtb__7)) ok)) else ((Obj.magic k) h))))))
  | C_NetOp_Port (dtb__8) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_try_net_port dtio_0)) dtb__8))) (fun p -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_netHostStatus) (fun ok -> (if (ok <> 0) then ((v_netFail "net-error") ((v_netErrorOfCode ("port " ^ (v_handleContext dtb__8))) ok)) else ((Obj.magic k) p))))))
  | C_NetOp_Accept (dtb__9) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_try_net_accept dtio_0)) dtb__9))) (fun c -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_netHostStatus) (fun ok -> (if (ok <> 0) then ((v_netFail "net-error") ((v_netErrorOfCode ("accept " ^ (v_handleContext dtb__9))) ok)) else ((Obj.magic k) c))))))
  | C_NetOp_Recv (dtb__10, dtb__11) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise (((fun dtio_0 dtio_1 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_try_net_recv dtio_0 dtio_1)) dtb__10) dtb__11))) (fun s -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_netHostStatus) (fun ok -> (if (ok = 0) then ((Obj.magic k) (B_dData_dMaybe.C_Maybe_Just (s))) else (if (ok = 1) then ((Obj.magic k) B_dData_dMaybe.C_Maybe_Nothing) else ((v_netFail "net-error") ((v_netErrorOfCode ("recv " ^ (v_handleContext dtb__10))) ok))))))))
  | C_NetOp_Send (dtb__12, dtb__13) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise (((fun dtio_0 dtio_1 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_try_net_send dtio_0 dtio_1)) dtb__12) dtb__13))) (fun n -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_netHostStatus) (fun ok -> (if (ok <> 0) then ((v_netFail "net-error") ((v_netErrorOfCode ("send " ^ (v_handleContext dtb__12))) ok)) else ((Obj.magic k) n))))))
  | C_NetOp_Close (dtb__14) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_try_net_close dtio_0)) dtb__14))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_netHostStatus) (fun ok -> (if (ok <> 0) then ((v_netFail "net-error") ((v_netErrorOfCode ("close " ^ (v_handleContext dtb__14))) ok)) else ((Obj.magic k) 0))))))
  | C_NetOp_Connect (dtb__15) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_try_net_connect dtio_0)) dtb__15))) (fun c -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_netHostStatus) (fun ok -> (if (ok <> 0) then ((v_netFail "net-error") ((v_netErrorOfCode ("connect " ^ dtb__15)) ok)) else ((Obj.magic k) c))))))
  | C_NetOp_AcceptWithin (dtb__16, dtb__17) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise (((fun dtio_0 dtio_1 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_try_net_accept_within dtio_0 dtio_1)) dtb__16) dtb__17))) (fun c -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_netHostStatus) (fun ok -> (if (ok = 0) then ((Obj.magic k) (C_NetStep_StepOk (c))) else (if (ok = 7) then ((Obj.magic k) C_NetStep_StepTimeout) else ((v_netFail "net-error") ((v_netErrorOfCode ("acceptWithin " ^ (v_handleContext dtb__16))) ok))))))))
  | C_NetOp_RecvWithin (dtb__18, dtb__19, dtb__20) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise ((((fun dtio_0 dtio_1 dtio_2 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_try_net_recv_within dtio_0 dtio_1 dtio_2)) dtb__18) dtb__19) dtb__20))) (fun s -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_netHostStatus) (fun ok -> (if (ok = 0) then ((Obj.magic k) (C_NetStep_StepOk (s))) else (if (ok = 1) then ((Obj.magic k) C_NetStep_StepClosed) else (if (ok = 7) then ((Obj.magic k) C_NetStep_StepTimeout) else ((v_netFail "net-error") ((v_netErrorOfCode ("recvWithin " ^ (v_handleContext dtb__18))) ok)))))))))
  | C_NetOp_SendWithin (dtb__21, dtb__22, dtb__23) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise ((((fun dtio_0 dtio_1 dtio_2 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_try_net_send_within dtio_0 dtio_1 dtio_2)) dtb__21) dtb__22) dtb__23))) (fun n -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_netHostStatus) (fun ok -> (if (ok = 0) then ((Obj.magic k) (C_NetStep_StepOk (n))) else (if (ok = 7) then ((Obj.magic k) C_NetStep_StepTimeout) else ((v_netFail "net-error") ((v_netErrorOfCode ("sendWithin " ^ (v_handleContext dtb__21))) ok))))))))
  | _ -> failwith "DT: impossible branch"
))

# 247 "Base/Effect/Net.vuna"
let v_handleNetHostHost = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "net") n) 630821208) (dtp_effectId n)) (fun a -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) a))) v_netOpHIOHost) comp))

# 251 "Base/Effect/Net.vuna"
let v_runNetHost = (fun comp -> (B_dEffect_dCore.v_joinEff ((v_handleNetHostHost "default") comp)))

# 255 "Base/Effect/Net.vuna"
let v_netErrorRet = (fun a -> (B_dData_dResult.C_Result_Ok (a)))

# 259 "Base/Effect/Net.vuna"
let v_netErrorOpHR = (fun (op : t_NetErrorOp) _u -> (match op with
  | C_NetErrorOp_NetFail (dtb__24) -> (B_dData_dResult.C_Result_Err ((v_netErrorText dtb__24)))
  | _ -> failwith "DT: impossible branch"
))

# 265 "Base/Effect/Net.vuna"
let v_runNetError = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "net-error") n) 1000332959) (dtp_effectId n)) v_netErrorRet) v_netErrorOpHR) comp))

# 269 "Base/Effect/Net.vuna"
let v_runNetErrorHost = (fun comp -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_runNetError "net-error") comp)) (fun res -> (match res with
  | B_dData_dResult.C_Result_Ok (dtb__25) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) dtb__25)
  | B_dData_dResult.C_Result_Err (dtb__26) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun s -> (try prerr_string s; flush stderr; String.length s with _ -> 0)) dtio_0)) (String.concat "" ["vuna: "; dtb__26; "\n"])))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_exit dtio_0)) 1))) (fun _u -> ((fun msg -> failwith msg) "unreachable: net error handler")))))
  | _ -> failwith "DT: impossible branch"
))))
