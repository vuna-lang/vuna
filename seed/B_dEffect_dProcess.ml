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
  | C_ProcessOp_Args -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__4 = Obj.obj (e) in (let dtb__5 = Obj.obj ((k (dtb__4 u))) in (dtb__5 u)))))) (Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (B_dData_dList.dtp_listOf (dtp_getArgs ()))))) (fun xs -> ((Obj.magic k) xs)))
  | C_ProcessOp_Exit (dtb__6) -> ((Obj.magic k) dtb__6)
  | C_ProcessOp_RunIn (dtb__7, dtb__8) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__9 = Obj.obj (e) in (let dtb__10 = Obj.obj ((k (dtb__9 u))) in (dtb__10 u)))))) (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun dir args -> dtp_runIn dir (B_dData_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) dtb__7) dtb__8)) (fun c -> ((Obj.magic k) c)))
  | C_ProcessOp_Spawn (dtb__11) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__12 = Obj.obj (e) in (let dtb__13 = Obj.obj ((k (dtb__12 u))) in (dtb__13 u)))))) ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun args -> dtp_spawn (B_dData_dList.dtp_ocamlOf args)) dtio_0)) dtb__11)) (fun h -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__14 = Obj.obj (e) in (let dtb__15 = Obj.obj ((k (dtb__14 u))) in (dtb__15 u)))))) (B_dEffect_dHost.v_hostSync (Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_hostStatus ()))))) (fun ok -> (if (ok <> 0) then ((fun msg -> failwith msg) (v_processErrorText ((v_processErrorOfCode "spawn") ok))) else ((Obj.magic k) h))))))
  | C_ProcessOp_Wait (dtb__16) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__17 = Obj.obj (e) in (let dtb__18 = Obj.obj ((k (dtb__17 u))) in (dtb__18 u)))))) ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_wait dtio_0)) dtb__16)) (fun c -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__19 = Obj.obj (e) in (let dtb__20 = Obj.obj ((k (dtb__19 u))) in (dtb__20 u)))))) (B_dEffect_dHost.v_hostSync (Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_hostStatus ()))))) (fun ok -> (if (ok <> 0) then ((fun msg -> failwith msg) (v_processErrorText ((v_processErrorOfCode "wait") ok))) else ((Obj.magic k) c))))))
  | _ -> failwith "DT: impossible branch"
))

# 115 "Base/Effect/Process.vuna"
let v_handleProcessHostWith = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "process") n) 485051770) (dtp_effectId n)) (fun a -> (let x = a in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) v_processOpHIOWith) comp))

# 123 "Base/Effect/Process.vuna"
let v_processHostStatus = (B_dEffect_dHost.v_hostSync (Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_hostStatus ()))))

# 127 "Base/Effect/Process.vuna"
let v_processOpHIOWithHost = (fun (op : t_ProcessOp) k -> (match op with
  | C_ProcessOp_Args -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__21 = Obj.obj (e) in (let dtb__22 = Obj.obj ((k (dtb__21 u))) in (dtb__22 u)))))) (B_dEffect_dHost.v_hostSync (Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (B_dData_dList.dtp_listOf (dtp_getArgs ())))))) (fun xs -> ((Obj.magic k) xs)))
  | C_ProcessOp_Exit (dtb__23) -> ((Obj.magic k) (B_dEffect_dHost.v_runHost ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_exit dtio_0)) dtb__23)))
  | C_ProcessOp_RunIn (dtb__24, dtb__25) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__26 = Obj.obj (e) in (let dtb__27 = Obj.obj ((k (dtb__26 u))) in (dtb__27 u)))))) (B_dEffect_dHost.v_hostSync (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun dir args -> dtp_tryRunIn dir (B_dData_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) dtb__24) dtb__25))) (fun c -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__28 = Obj.obj (e) in (let dtb__29 = Obj.obj ((k (dtb__28 u))) in (dtb__29 u)))))) v_processHostStatus) (fun ok -> (if (ok <> 0) then ((v_processFail "process-error") ((v_processErrorOfCode ("runIn " ^ dtb__24)) ok)) else ((Obj.magic k) c))))))
  | C_ProcessOp_Spawn (dtb__30) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__31 = Obj.obj (e) in (let dtb__32 = Obj.obj ((k (dtb__31 u))) in (dtb__32 u)))))) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun args -> dtp_spawn (B_dData_dList.dtp_ocamlOf args)) dtio_0)) dtb__30))) (fun h -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__33 = Obj.obj (e) in (let dtb__34 = Obj.obj ((k (dtb__33 u))) in (dtb__34 u)))))) v_processHostStatus) (fun ok -> (if (ok <> 0) then ((v_processFail "process-error") ((v_processErrorOfCode "spawn") ok)) else ((Obj.magic k) h))))))
  | C_ProcessOp_Wait (dtb__35) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__36 = Obj.obj (e) in (let dtb__37 = Obj.obj ((k (dtb__36 u))) in (dtb__37 u)))))) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_wait dtio_0)) dtb__35))) (fun c -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__38 = Obj.obj (e) in (let dtb__39 = Obj.obj ((k (dtb__38 u))) in (dtb__39 u)))))) v_processHostStatus) (fun ok -> (if (ok <> 0) then ((v_processFail "process-error") ((v_processErrorOfCode "wait") ok)) else ((Obj.magic k) c))))))
  | _ -> failwith "DT: impossible branch"
))

# 152 "Base/Effect/Process.vuna"
let v_handleProcessHostWithHost = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "process") n) 485051770) (dtp_effectId n)) (fun a -> (let x = a in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) v_processOpHIOWithHost) comp))

# 157 "Base/Effect/Process.vuna"
let v_runProcessHost = (fun comp -> (B_dEffect_dCore.v_joinEff ((v_handleProcessHostWithHost "default") comp)))

# 161 "Base/Effect/Process.vuna"
let v_processErrorRet = (fun a -> (B_dData_dResult.C_Result_Ok (a)))

# 165 "Base/Effect/Process.vuna"
let v_processErrorOpHR = (fun (op : t_ProcessErrorOp) _u -> (match op with
  | C_ProcessErrorOp_ProcessFail (dtb__40) -> (B_dData_dResult.C_Result_Err ((v_processErrorText dtb__40)))
  | _ -> failwith "DT: impossible branch"
))

# 171 "Base/Effect/Process.vuna"
let v_runProcessError = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "process-error") n) 44116993) (dtp_effectId n)) v_processErrorRet) v_processErrorOpHR) comp))

# 176 "Base/Effect/Process.vuna"
let v_runProcessResult = (fun comp -> ((v_runProcessError "process-error") (v_runProcessHost comp)))

# 180 "Base/Effect/Process.vuna"
let v_runProcessErrorHost = (fun comp -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__41 = Obj.obj (e) in (let dtb__42 = Obj.obj ((k (dtb__41 u))) in (dtb__42 u)))))) ((v_runProcessError "process-error") comp)) (fun res -> (match res with
  | B_dData_dResult.C_Result_Ok (dtb__43) -> (let x = dtb__43 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dResult.C_Result_Err (dtb__44) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__45 = Obj.obj (e) in (let dtb__46 = Obj.obj ((k (dtb__45 u))) in (dtb__46 u)))))) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_eprint dtio_0)) (String.concat "" ["vuna: "; dtb__44; "\n"])))) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__47 = Obj.obj (e) in (let dtb__48 = Obj.obj ((k (dtb__47 u))) in (dtb__48 u)))))) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_exit dtio_0)) 1))) (fun _u -> ((fun msg -> failwith msg) "unreachable: process error handler")))))
  | _ -> failwith "DT: impossible branch"
))))
