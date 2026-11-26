open Vuna_runtime
type t_ProcessOp = C_ProcessOp_Args | C_ProcessOp_Exit of (int) | C_ProcessOp_RunIn of (string) * (string B_dData_dList.t_List) | C_ProcessOp_Spawn of (string B_dData_dList.t_List) | C_ProcessOp_Wait of (int)
and t_ProcessError = C_ProcessError_ProcessNoDir of (string) | C_ProcessError_ProcessLaunchDenied of (string) | C_ProcessError_ProcessTooManyChildren of (string) | C_ProcessError_ProcessHostIo of (string)
and t_ProcessErrorOp = C_ProcessErrorOp_ProcessFail of (t_ProcessError)

# 29 "Base/Effect/Process.vuna"
let v_processArgs = (fun (n : string) -> (((((B_dEffect_dCore.v_sendCoreId "process") n) 485051770) (dtp_effectId n)) C_ProcessOp_Args))

# 33 "Base/Effect/Process.vuna"
let v_processExit = (fun (n : string) (c : int) -> (((((B_dEffect_dCore.v_sendCoreId "process") n) 485051770) (dtp_effectId n)) (C_ProcessOp_Exit (c))))

# 37 "Base/Effect/Process.vuna"
let v_processRunIn = (fun (n : string) (dir : string) (args : string B_dData_dList.t_List) -> (((((B_dEffect_dCore.v_sendCoreId "process") n) 485051770) (dtp_effectId n)) (C_ProcessOp_RunIn (dir, args))))

# 43 "Base/Effect/Process.vuna"
let v_processSpawn = (fun (n : string) (args : string B_dData_dList.t_List) -> (((((B_dEffect_dCore.v_sendCoreId "process") n) 485051770) (dtp_effectId n)) (C_ProcessOp_Spawn (args))))

# 49 "Base/Effect/Process.vuna"
let v_processWait = (fun (n : string) (h : int) -> (((((B_dEffect_dCore.v_sendCoreId "process") n) 485051770) (dtp_effectId n)) (C_ProcessOp_Wait (h))))

# 69 "Base/Effect/Process.vuna"
let v_processFail = (fun (n : string) (e : t_ProcessError) -> (((((B_dEffect_dCore.v_sendCoreId "process-error") n) 44116993) (dtp_effectId n)) (C_ProcessErrorOp_ProcessFail (e))))

# 73 "Base/Effect/Process.vuna"
let v_processErrorOfCode = (fun (mc0 : string) (mc1 : int) -> (if (mc1 = 1) then (C_ProcessError_ProcessNoDir (mc0)) else (if (mc1 = 2) then (C_ProcessError_ProcessLaunchDenied (mc0)) else (if (mc1 = 10) then (C_ProcessError_ProcessTooManyChildren (mc0)) else (C_ProcessError_ProcessHostIo (mc0))))))

# 80 "Base/Effect/Process.vuna"
let v_processErrorText = (fun (mc0 : t_ProcessError) -> (match mc0 with
  | C_ProcessError_ProcessHostIo (dtb__0) -> (String.concat "" ["process: "; dtb__0; ": host I/O error"])
  | C_ProcessError_ProcessTooManyChildren (dtb__1) -> (String.concat "" ["process: "; dtb__1; ": too many concurrent child processes"])
  | C_ProcessError_ProcessLaunchDenied (dtb__2) -> (String.concat "" ["process: "; dtb__2; ": permission denied"])
  | C_ProcessError_ProcessNoDir (dtb__3) -> (String.concat "" ["process: "; dtb__3; ": no such directory"])
  | _ -> failwith "DT: impossible branch"
))

# 87 "Base/Effect/Process.vuna"
let v_handleProcess = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreId "process") n) 485051770) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 91 "Base/Effect/Process.vuna"
let v_processOpHIOWith = (fun (op : t_ProcessOp) k -> (match op with
  | C_ProcessOp_Args -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (B_dData_dList.dtp_listOf (dtp_getArgs ()))))) (fun xs -> ((Obj.magic k) xs)))
  | C_ProcessOp_Exit (dtb__4) -> ((Obj.magic k) dtb__4)
  | C_ProcessOp_RunIn (dtb__5, dtb__6) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((fun dtio_0 dtio_1 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun dir args -> dtp_runIn dir (B_dData_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) dtb__5) dtb__6)) (fun c -> ((Obj.magic k) c)))
  | C_ProcessOp_Spawn (dtb__7) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun args -> dtp_spawn (B_dData_dList.dtp_ocamlOf args)) dtio_0)) dtb__7)) (fun h -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dHost.v_hostSync (B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_hostStatus ()))))) (fun ok -> (if (ok <> 0) then ((fun msg -> failwith msg) (v_processErrorText ((v_processErrorOfCode "spawn") ok))) else ((Obj.magic k) h))))))
  | C_ProcessOp_Wait (dtb__8) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_wait dtio_0)) dtb__8)) (fun c -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dHost.v_hostSync (B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_hostStatus ()))))) (fun ok -> (if (ok <> 0) then ((fun msg -> failwith msg) (v_processErrorText ((v_processErrorOfCode "wait") ok))) else ((Obj.magic k) c))))))
  | _ -> failwith "DT: impossible branch"
))

# 115 "Base/Effect/Process.vuna"
let v_handleProcessHostWith = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "process") n) 485051770) (dtp_effectId n)) (fun a -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) a))) v_processOpHIOWith) comp))

# 123 "Base/Effect/Process.vuna"
let v_processHostStatus = (B_dEffect_dHost.v_hostSync (B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_hostStatus ()))))

# 127 "Base/Effect/Process.vuna"
let v_processOpHIOWithHost = (fun (op : t_ProcessOp) k -> (match op with
  | C_ProcessOp_Args -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dHost.v_hostSync (B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (B_dData_dList.dtp_listOf (dtp_getArgs ())))))) (fun xs -> ((Obj.magic k) xs)))
  | C_ProcessOp_Exit (dtb__9) -> ((Obj.magic k) (B_dEffect_dHost.v_runHost ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_exit dtio_0)) dtb__9)))
  | C_ProcessOp_RunIn (dtb__10, dtb__11) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dHost.v_hostSync (((fun dtio_0 dtio_1 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun dir args -> dtp_tryRunIn dir (B_dData_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) dtb__10) dtb__11))) (fun c -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) v_processHostStatus) (fun ok -> (if (ok <> 0) then ((v_processFail "process-error") ((v_processErrorOfCode ("runIn " ^ dtb__10)) ok)) else ((Obj.magic k) c))))))
  | C_ProcessOp_Spawn (dtb__12) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun args -> dtp_spawn (B_dData_dList.dtp_ocamlOf args)) dtio_0)) dtb__12))) (fun h -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) v_processHostStatus) (fun ok -> (if (ok <> 0) then ((v_processFail "process-error") ((v_processErrorOfCode "spawn") ok)) else ((Obj.magic k) h))))))
  | C_ProcessOp_Wait (dtb__13) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_wait dtio_0)) dtb__13))) (fun c -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) v_processHostStatus) (fun ok -> (if (ok <> 0) then ((v_processFail "process-error") ((v_processErrorOfCode "wait") ok)) else ((Obj.magic k) c))))))
  | _ -> failwith "DT: impossible branch"
))

# 152 "Base/Effect/Process.vuna"
let v_handleProcessHostWithHost = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "process") n) 485051770) (dtp_effectId n)) (fun a -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) a))) v_processOpHIOWithHost) comp))

# 157 "Base/Effect/Process.vuna"
let v_runProcessHost = (fun comp -> (B_dEffect_dCore.v_joinEff ((v_handleProcessHostWithHost "default") comp)))

# 161 "Base/Effect/Process.vuna"
let v_processErrorRet = (fun a -> (B_dData_dResult.C_Result_Ok (a)))

# 165 "Base/Effect/Process.vuna"
let v_processErrorOpHR = (fun (op : t_ProcessErrorOp) _u -> (match op with
  | C_ProcessErrorOp_ProcessFail (dtb__14) -> (B_dData_dResult.C_Result_Err ((v_processErrorText dtb__14)))
  | _ -> failwith "DT: impossible branch"
))

# 171 "Base/Effect/Process.vuna"
let v_runProcessError = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "process-error") n) 44116993) (dtp_effectId n)) v_processErrorRet) v_processErrorOpHR) comp))

# 176 "Base/Effect/Process.vuna"
let v_runProcessResult = (fun comp -> ((v_runProcessError "process-error") (v_runProcessHost comp)))

# 180 "Base/Effect/Process.vuna"
let v_runProcessErrorHost = (fun comp -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_runProcessError "process-error") comp)) (fun res -> (match res with
  | B_dData_dResult.C_Result_Ok (dtb__15) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) dtb__15)
  | B_dData_dResult.C_Result_Err (dtb__16) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_eprint dtio_0)) (String.concat "" ["vuna: "; dtb__16; "\n"])))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_exit dtio_0)) 1))) (fun _u -> ((fun msg -> failwith msg) "unreachable: process error handler")))))
  | _ -> failwith "DT: impossible branch"
))))
