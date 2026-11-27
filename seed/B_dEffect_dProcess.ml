open Vuna_runtime
type t_ProcessOp = C_ProcessOp_Args | C_ProcessOp_Exit of (int) | C_ProcessOp_RunIn of (string) * (string B_dData_dList.t_List) | C_ProcessOp_Spawn of (string B_dData_dList.t_List) | C_ProcessOp_Wait of (int)
and t_ProcessError = C_ProcessError_ProcessNoDir of (string) | C_ProcessError_ProcessLaunchDenied of (string) | C_ProcessError_ProcessTooManyChildren of (string) | C_ProcessError_ProcessHostIo of (string)
and t_ProcessErrorOp = C_ProcessErrorOp_ProcessFail of (t_ProcessError)

# 29 "Base/Effect/Process.vuna"
let v_processArgs = (fun (n : string) -> (((((B_dEffect_dCore.v_sendCoreId "process") n) 485051770) (dtp_effectId n)) C_ProcessOp_Args))

# 29 "Base/Effect/Process.vuna"
let v_processArgs_u_udirect = (fun (n : string) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "process") n) 485051770) (dtp_effectId n)) C_ProcessOp_Args)) _u_ueffTok))

# 33 "Base/Effect/Process.vuna"
let v_processExit = (fun (n : string) (c : int) -> (((((B_dEffect_dCore.v_sendCoreId "process") n) 485051770) (dtp_effectId n)) (C_ProcessOp_Exit (c))))

# 33 "Base/Effect/Process.vuna"
let v_processExit_u_udirect = (fun (n : string) (c : int) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "process") n) 485051770) (dtp_effectId n)) (C_ProcessOp_Exit (c)))) _u_ueffTok))

# 37 "Base/Effect/Process.vuna"
let v_processRunIn = (fun (n : string) (dir : string) (args : string B_dData_dList.t_List) -> (((((B_dEffect_dCore.v_sendCoreId "process") n) 485051770) (dtp_effectId n)) (C_ProcessOp_RunIn (dir, args))))

# 37 "Base/Effect/Process.vuna"
let v_processRunIn_u_udirect = (fun (n : string) (dir : string) (args : string B_dData_dList.t_List) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "process") n) 485051770) (dtp_effectId n)) (C_ProcessOp_RunIn (dir, args)))) _u_ueffTok))

# 43 "Base/Effect/Process.vuna"
let v_processSpawn = (fun (n : string) (args : string B_dData_dList.t_List) -> (((((B_dEffect_dCore.v_sendCoreId "process") n) 485051770) (dtp_effectId n)) (C_ProcessOp_Spawn (args))))

# 43 "Base/Effect/Process.vuna"
let v_processSpawn_u_udirect = (fun (n : string) (args : string B_dData_dList.t_List) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "process") n) 485051770) (dtp_effectId n)) (C_ProcessOp_Spawn (args)))) _u_ueffTok))

# 49 "Base/Effect/Process.vuna"
let v_processWait = (fun (n : string) (h : int) -> (((((B_dEffect_dCore.v_sendCoreId "process") n) 485051770) (dtp_effectId n)) (C_ProcessOp_Wait (h))))

# 49 "Base/Effect/Process.vuna"
let v_processWait_u_udirect = (fun (n : string) (h : int) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "process") n) 485051770) (dtp_effectId n)) (C_ProcessOp_Wait (h)))) _u_ueffTok))

# 69 "Base/Effect/Process.vuna"
let v_processFail = (fun (n : string) (e : t_ProcessError) -> (((((B_dEffect_dCore.v_sendCoreId "process-error") n) 44116993) (dtp_effectId n)) (C_ProcessErrorOp_ProcessFail (e))))

# 69 "Base/Effect/Process.vuna"
let v_processFail_u_udirect = (fun (n : string) (e : t_ProcessError) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "process-error") n) 44116993) (dtp_effectId n)) (C_ProcessErrorOp_ProcessFail (e)))) _u_ueffTok))

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

# 87 "Base/Effect/Process.vuna"
let v_handleProcess_u_udirect = (fun (n : string) ret opH comp _u_ueffTok -> ((Obj.magic (((((((B_dEffect_dCore.v_handleCoreId "process") n) 485051770) (dtp_effectId n)) ret) (Obj.magic opH)) comp)) _u_ueffTok))

# 91 "Base/Effect/Process.vuna"
let v_processOpHIOWith = (fun (dtb_u_u45 : t_ProcessOp) dtb_u_u46 -> (match dtb_u_u45 with
  | C_ProcessOp_Args -> (Obj.repr ((fun (dtb_u_u51 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u52 = Obj.obj ((Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (B_dData_dList.dtp_listOf (dtp_getArgs ()))))) in (let dtb_u_u54 = (dtb_u_u52 dtb_u_u51) in ((Obj.magic ((Obj.magic dtb_u_u46) dtb_u_u54)) dtb_u_u51))))))
  | C_ProcessOp_Exit (dtb_u_u55) -> ((Obj.magic dtb_u_u46) dtb_u_u55)
  | C_ProcessOp_RunIn (dtb_u_u56, dtb_u_u57) -> (Obj.repr ((fun (dtb_u_u62 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u63 = Obj.obj ((((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun dir args -> dtp_runIn dir (B_dData_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) dtb_u_u56) dtb_u_u57)) in (let dtb_u_u65 = (dtb_u_u63 dtb_u_u62) in ((Obj.magic ((Obj.magic dtb_u_u46) dtb_u_u65)) dtb_u_u62))))))
  | C_ProcessOp_Spawn (dtb_u_u66) -> (Obj.repr ((fun (dtb_u_u71 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u72 = Obj.obj (((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun args -> dtp_spawn (B_dData_dList.dtp_ocamlOf args)) dtio_0)) dtb_u_u66)) in (let dtb_u_u74 = (dtb_u_u72 dtb_u_u71) in (let dtb_u_u82 = ((B_dEffect_dHost.v_hostSync_u_udirect (Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_hostStatus ())))) dtb_u_u71) in (if (dtb_u_u82 <> 0) then ((Obj.magic ((fun msg -> failwith msg) (v_processErrorText ((v_processErrorOfCode "spawn") dtb_u_u82)))) dtb_u_u71) else ((Obj.magic ((Obj.magic dtb_u_u46) dtb_u_u74)) dtb_u_u71))))))))
  | C_ProcessOp_Wait (dtb_u_u83) -> (Obj.repr ((fun (dtb_u_u88 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u89 = Obj.obj (((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_wait dtio_0)) dtb_u_u83)) in (let dtb_u_u91 = (dtb_u_u89 dtb_u_u88) in (let dtb_u_u99 = ((B_dEffect_dHost.v_hostSync_u_udirect (Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_hostStatus ())))) dtb_u_u88) in (if (dtb_u_u99 <> 0) then ((Obj.magic ((fun msg -> failwith msg) (v_processErrorText ((v_processErrorOfCode "wait") dtb_u_u99)))) dtb_u_u88) else ((Obj.magic ((Obj.magic dtb_u_u46) dtb_u_u91)) dtb_u_u88))))))))
  | _ -> failwith "DT: impossible branch"
))

# 91 "Base/Effect/Process.vuna"
let v_processOpHIOWith_u_udirect = (fun (op : t_ProcessOp) k _u_ueffTok -> (match op with
  | C_ProcessOp_Args -> (let dtb_u_u52 = Obj.obj ((Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (B_dData_dList.dtp_listOf (dtp_getArgs ()))))) in (let dtb_u_u54 = (dtb_u_u52 _u_ueffTok) in ((Obj.magic ((Obj.magic k) dtb_u_u54)) _u_ueffTok)))
  | C_ProcessOp_Exit (dtb_u_u55) -> ((Obj.magic ((Obj.magic k) dtb_u_u55)) _u_ueffTok)
  | C_ProcessOp_RunIn (dtb_u_u56, dtb_u_u57) -> (let dtb_u_u63 = Obj.obj ((((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun dir args -> dtp_runIn dir (B_dData_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) dtb_u_u56) dtb_u_u57)) in (let dtb_u_u65 = (dtb_u_u63 _u_ueffTok) in ((Obj.magic ((Obj.magic k) dtb_u_u65)) _u_ueffTok)))
  | C_ProcessOp_Spawn (dtb_u_u66) -> (let dtb_u_u72 = Obj.obj (((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun args -> dtp_spawn (B_dData_dList.dtp_ocamlOf args)) dtio_0)) dtb_u_u66)) in (let dtb_u_u74 = (dtb_u_u72 _u_ueffTok) in (let dtb_u_u82 = ((B_dEffect_dHost.v_hostSync_u_udirect (Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_hostStatus ())))) _u_ueffTok) in (if (dtb_u_u82 <> 0) then ((Obj.magic ((fun msg -> failwith msg) (v_processErrorText ((v_processErrorOfCode "spawn") dtb_u_u82)))) _u_ueffTok) else ((Obj.magic ((Obj.magic k) dtb_u_u74)) _u_ueffTok)))))
  | C_ProcessOp_Wait (dtb_u_u83) -> (let dtb_u_u89 = Obj.obj (((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_wait dtio_0)) dtb_u_u83)) in (let dtb_u_u91 = (dtb_u_u89 _u_ueffTok) in (let dtb_u_u99 = ((B_dEffect_dHost.v_hostSync_u_udirect (Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_hostStatus ())))) _u_ueffTok) in (if (dtb_u_u99 <> 0) then ((Obj.magic ((fun msg -> failwith msg) (v_processErrorText ((v_processErrorOfCode "wait") dtb_u_u99)))) _u_ueffTok) else ((Obj.magic ((Obj.magic k) dtb_u_u91)) _u_ueffTok)))))
  | _ -> failwith "DT: impossible branch"
))

# 115 "Base/Effect/Process.vuna"
let v_handleProcessHostWith = (fun (dtb_u_u102 : string) dtb_u_u103 -> (((((((B_dEffect_dCore.v_handleCoreAtId "process") dtb_u_u102) 485051770) (dtp_effectId dtb_u_u102)) (fun dtb_u_u104 -> (let dtb_u_u106 = dtb_u_u104 in (Obj.repr ((fun (dtb_u_u107 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u106)))))) v_processOpHIOWith) dtb_u_u103))

# 115 "Base/Effect/Process.vuna"
let v_handleProcessHostWith_u_udirect = (fun (n : string) comp _u_ueffTok -> ((Obj.magic (((((((B_dEffect_dCore.v_handleCoreAtId "process") n) 485051770) (dtp_effectId n)) (fun dtb_u_u104 -> (let dtb_u_u106 = dtb_u_u104 in (Obj.repr ((fun (dtb_u_u107 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u106)))))) v_processOpHIOWith) comp)) _u_ueffTok))

# 123 "Base/Effect/Process.vuna"
let v_processHostStatus = (B_dEffect_dHost.v_hostSync (Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_hostStatus ()))))

# 127 "Base/Effect/Process.vuna"
let v_processOpHIOWithHost = (fun (dtb_u_u111 : t_ProcessOp) dtb_u_u112 -> (match dtb_u_u111 with
  | C_ProcessOp_Args -> (Obj.repr ((fun (dtb_u_u117 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u120 = ((B_dEffect_dHost.v_hostSync_u_udirect (Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (B_dData_dList.dtp_listOf (dtp_getArgs ()))))) dtb_u_u117) in ((Obj.magic ((Obj.magic dtb_u_u112) dtb_u_u120)) dtb_u_u117)))))
  | C_ProcessOp_Exit (dtb_u_u121) -> ((Obj.magic dtb_u_u112) (B_dEffect_dHost.v_runHost ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_exit dtio_0)) dtb_u_u121)))
  | C_ProcessOp_RunIn (dtb_u_u122, dtb_u_u123) -> (Obj.repr ((fun (dtb_u_u128 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u131 = ((B_dEffect_dHost.v_hostSync_u_udirect (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun dir args -> dtp_tryRunIn dir (B_dData_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) dtb_u_u122) dtb_u_u123)) dtb_u_u128) in (let dtb_u_u137 = Obj.obj (v_processHostStatus) in (let dtb_u_u139 = (dtb_u_u137 dtb_u_u128) in (if (dtb_u_u139 <> 0) then ((Obj.magic ((v_processFail "process-error") ((v_processErrorOfCode ("runIn " ^ dtb_u_u122)) dtb_u_u139))) dtb_u_u128) else ((Obj.magic ((Obj.magic dtb_u_u112) dtb_u_u131)) dtb_u_u128))))))))
  | C_ProcessOp_Spawn (dtb_u_u140) -> (Obj.repr ((fun (dtb_u_u145 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u148 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun args -> dtp_spawn (B_dData_dList.dtp_ocamlOf args)) dtio_0)) dtb_u_u140)) dtb_u_u145) in (let dtb_u_u154 = Obj.obj (v_processHostStatus) in (let dtb_u_u156 = (dtb_u_u154 dtb_u_u145) in (if (dtb_u_u156 <> 0) then ((Obj.magic ((v_processFail "process-error") ((v_processErrorOfCode "spawn") dtb_u_u156))) dtb_u_u145) else ((Obj.magic ((Obj.magic dtb_u_u112) dtb_u_u148)) dtb_u_u145))))))))
  | C_ProcessOp_Wait (dtb_u_u157) -> (Obj.repr ((fun (dtb_u_u162 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u165 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_wait dtio_0)) dtb_u_u157)) dtb_u_u162) in (let dtb_u_u171 = Obj.obj (v_processHostStatus) in (let dtb_u_u173 = (dtb_u_u171 dtb_u_u162) in (if (dtb_u_u173 <> 0) then ((Obj.magic ((v_processFail "process-error") ((v_processErrorOfCode "wait") dtb_u_u173))) dtb_u_u162) else ((Obj.magic ((Obj.magic dtb_u_u112) dtb_u_u165)) dtb_u_u162))))))))
  | _ -> failwith "DT: impossible branch"
))

# 127 "Base/Effect/Process.vuna"
let v_processOpHIOWithHost_u_udirect = (fun (op : t_ProcessOp) k _u_ueffTok -> (match op with
  | C_ProcessOp_Args -> (let dtb_u_u120 = ((B_dEffect_dHost.v_hostSync_u_udirect (Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (B_dData_dList.dtp_listOf (dtp_getArgs ()))))) _u_ueffTok) in ((Obj.magic ((Obj.magic k) dtb_u_u120)) _u_ueffTok))
  | C_ProcessOp_Exit (dtb_u_u121) -> ((Obj.magic ((Obj.magic k) (B_dEffect_dHost.v_runHost ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_exit dtio_0)) dtb_u_u121)))) _u_ueffTok)
  | C_ProcessOp_RunIn (dtb_u_u122, dtb_u_u123) -> (let dtb_u_u131 = ((B_dEffect_dHost.v_hostSync_u_udirect (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun dir args -> dtp_tryRunIn dir (B_dData_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) dtb_u_u122) dtb_u_u123)) _u_ueffTok) in (let dtb_u_u137 = Obj.obj (v_processHostStatus) in (let dtb_u_u139 = (dtb_u_u137 _u_ueffTok) in (if (dtb_u_u139 <> 0) then ((Obj.magic ((v_processFail "process-error") ((v_processErrorOfCode ("runIn " ^ dtb_u_u122)) dtb_u_u139))) _u_ueffTok) else ((Obj.magic ((Obj.magic k) dtb_u_u131)) _u_ueffTok)))))
  | C_ProcessOp_Spawn (dtb_u_u140) -> (let dtb_u_u148 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun args -> dtp_spawn (B_dData_dList.dtp_ocamlOf args)) dtio_0)) dtb_u_u140)) _u_ueffTok) in (let dtb_u_u154 = Obj.obj (v_processHostStatus) in (let dtb_u_u156 = (dtb_u_u154 _u_ueffTok) in (if (dtb_u_u156 <> 0) then ((Obj.magic ((v_processFail "process-error") ((v_processErrorOfCode "spawn") dtb_u_u156))) _u_ueffTok) else ((Obj.magic ((Obj.magic k) dtb_u_u148)) _u_ueffTok)))))
  | C_ProcessOp_Wait (dtb_u_u157) -> (let dtb_u_u165 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_wait dtio_0)) dtb_u_u157)) _u_ueffTok) in (let dtb_u_u171 = Obj.obj (v_processHostStatus) in (let dtb_u_u173 = (dtb_u_u171 _u_ueffTok) in (if (dtb_u_u173 <> 0) then ((Obj.magic ((v_processFail "process-error") ((v_processErrorOfCode "wait") dtb_u_u173))) _u_ueffTok) else ((Obj.magic ((Obj.magic k) dtb_u_u165)) _u_ueffTok)))))
  | _ -> failwith "DT: impossible branch"
))

# 152 "Base/Effect/Process.vuna"
let v_handleProcessHostWithHost = (fun (dtb_u_u176 : string) dtb_u_u177 -> (((((((B_dEffect_dCore.v_handleCoreAtId "process") dtb_u_u176) 485051770) (dtp_effectId dtb_u_u176)) (fun dtb_u_u178 -> (let dtb_u_u180 = dtb_u_u178 in (Obj.repr ((fun (dtb_u_u181 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u180)))))) v_processOpHIOWithHost) dtb_u_u177))

# 152 "Base/Effect/Process.vuna"
let v_handleProcessHostWithHost_u_udirect = (fun (n : string) comp _u_ueffTok -> ((Obj.magic (((((((B_dEffect_dCore.v_handleCoreAtId "process") n) 485051770) (dtp_effectId n)) (fun dtb_u_u178 -> (let dtb_u_u180 = dtb_u_u178 in (Obj.repr ((fun (dtb_u_u181 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u180)))))) v_processOpHIOWithHost) comp)) _u_ueffTok))

# 157 "Base/Effect/Process.vuna"
let v_runProcessHost = (fun comp -> (B_dEffect_dCore.v_joinEff ((v_handleProcessHostWithHost "default") comp)))

# 157 "Base/Effect/Process.vuna"
let v_runProcessHost_u_udirect = (fun comp _u_ueffTok -> ((Obj.magic (B_dEffect_dCore.v_joinEff ((v_handleProcessHostWithHost "default") comp))) _u_ueffTok))

# 161 "Base/Effect/Process.vuna"
let v_processErrorRet = (fun a -> (B_dData_dResult.C_Result_Ok (a)))

# 165 "Base/Effect/Process.vuna"
let v_processErrorOpHR = (fun (op : t_ProcessErrorOp) _u -> (match op with
  | C_ProcessErrorOp_ProcessFail (dtb__40) -> (B_dData_dResult.C_Result_Err ((v_processErrorText dtb__40)))
  | _ -> failwith "DT: impossible branch"
))

# 171 "Base/Effect/Process.vuna"
let v_runProcessError = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "process-error") n) 44116993) (dtp_effectId n)) v_processErrorRet) v_processErrorOpHR) comp))

# 171 "Base/Effect/Process.vuna"
let v_runProcessError_u_udirect = (fun (n : string) comp _u_ueffTok -> ((Obj.magic (((((((B_dEffect_dCore.v_handleCoreAtId "process-error") n) 44116993) (dtp_effectId n)) v_processErrorRet) v_processErrorOpHR) comp)) _u_ueffTok))

# 176 "Base/Effect/Process.vuna"
let v_runProcessResult = (fun comp -> ((v_runProcessError "process-error") (v_runProcessHost comp)))

# 176 "Base/Effect/Process.vuna"
let v_runProcessResult_u_udirect = (fun comp _u_ueffTok -> ((Obj.magic ((v_runProcessError "process-error") (v_runProcessHost comp))) _u_ueffTok))

# 180 "Base/Effect/Process.vuna"
let v_runProcessErrorHost = (fun dtb_u_u200 -> (Obj.repr ((fun (dtb_u_u205 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u208 = (((v_runProcessError_u_udirect "process-error") dtb_u_u200) dtb_u_u205) in (match dtb_u_u208 with
  | B_dData_dResult.C_Result_Ok (dtb_u_u209) -> (let dtb_u_u211 = dtb_u_u209 in dtb_u_u211)
  | B_dData_dResult.C_Result_Err (dtb_u_u213) -> (let dtb_u_u221 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_eprint dtio_0)) (String.concat "" ["vuna: "; dtb_u_u213; "\n"]))) dtb_u_u205) in (let dtb_u_u229 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_exit dtio_0)) 1)) dtb_u_u205) in ((Obj.magic ((fun msg -> failwith msg) "unreachable: process error handler")) dtb_u_u205)))
  | _ -> failwith "DT: impossible branch"
))))))

# 180 "Base/Effect/Process.vuna"
let v_runProcessErrorHost_u_udirect = (fun comp _u_ueffTok -> (let dtb_u_u208 = (((v_runProcessError_u_udirect "process-error") comp) _u_ueffTok) in (match dtb_u_u208 with
  | B_dData_dResult.C_Result_Ok (dtb_u_u209) -> (let dtb_u_u211 = dtb_u_u209 in dtb_u_u211)
  | B_dData_dResult.C_Result_Err (dtb_u_u213) -> (let dtb_u_u221 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_eprint dtio_0)) (String.concat "" ["vuna: "; dtb_u_u213; "\n"]))) _u_ueffTok) in (let dtb_u_u229 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_exit dtio_0)) 1)) _u_ueffTok) in ((Obj.magic ((fun msg -> failwith msg) "unreachable: process error handler")) _u_ueffTok)))
  | _ -> failwith "DT: impossible branch"
)))
