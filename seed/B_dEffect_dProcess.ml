open Vuna_runtime
type t_ProcessOp = C_ProcessOp_Args | C_ProcessOp_Exit of (int) | C_ProcessOp_RunIn of (string) * (string B_dData_dList.t_List) | C_ProcessOp_Spawn of (string B_dData_dList.t_List) | C_ProcessOp_Wait of (int)
and t_ProcessError = C_ProcessError_ProcessNoDir of (string) | C_ProcessError_ProcessLaunchDenied of (string) | C_ProcessError_ProcessTooManyChildren of (string) | C_ProcessError_ProcessHostIo of (string)
and t_ProcessErrorOp = C_ProcessErrorOp_ProcessFail of (t_ProcessError)

# 29 "Base/Effect/Process.vuna"
let v_processArgs = (fun (dtb_u_u1 : string) -> (((((B_dEffect_dCore.v_sendCoreId "process") dtb_u_u1) 485051770) (dtp_effectId dtb_u_u1)) C_ProcessOp_Args))

# 33 "Base/Effect/Process.vuna"
let v_processExit = (fun (dtb_u_u4 : string) (dtb_u_u7 : int) -> (((((B_dEffect_dCore.v_sendCoreId "process") dtb_u_u4) 485051770) (dtp_effectId dtb_u_u4)) (C_ProcessOp_Exit (dtb_u_u7))))

# 37 "Base/Effect/Process.vuna"
let v_processRunIn = (fun (dtb_u_u8 : string) (dtb_u_u11 : string) (dtb_u_u12 : string B_dData_dList.t_List) -> (((((B_dEffect_dCore.v_sendCoreId "process") dtb_u_u8) 485051770) (dtp_effectId dtb_u_u8)) (C_ProcessOp_RunIn (dtb_u_u11, dtb_u_u12))))

# 43 "Base/Effect/Process.vuna"
let v_processSpawn = (fun (dtb_u_u13 : string) (dtb_u_u16 : string B_dData_dList.t_List) -> (((((B_dEffect_dCore.v_sendCoreId "process") dtb_u_u13) 485051770) (dtp_effectId dtb_u_u13)) (C_ProcessOp_Spawn (dtb_u_u16))))

# 49 "Base/Effect/Process.vuna"
let v_processWait = (fun (dtb_u_u17 : string) (dtb_u_u20 : int) -> (((((B_dEffect_dCore.v_sendCoreId "process") dtb_u_u17) 485051770) (dtp_effectId dtb_u_u17)) (C_ProcessOp_Wait (dtb_u_u20))))

# 69 "Base/Effect/Process.vuna"
let v_processFail = (fun (dtb_u_u21 : string) (dtb_u_u25 : t_ProcessError) -> (((((B_dEffect_dCore.v_sendCoreId "process-error") dtb_u_u21) 44116993) (dtp_effectId dtb_u_u21)) (C_ProcessErrorOp_ProcessFail (dtb_u_u25))))

# 73 "Base/Effect/Process.vuna"
let v_processErrorOfCode = (fun (dtb_u_u26 : string) (dtb_u_u27 : int) -> (if (dtb_u_u27 = 1) then (C_ProcessError_ProcessNoDir (dtb_u_u26)) else (if (dtb_u_u27 = 2) then (C_ProcessError_ProcessLaunchDenied (dtb_u_u26)) else (if (dtb_u_u27 = 10) then (C_ProcessError_ProcessTooManyChildren (dtb_u_u26)) else (C_ProcessError_ProcessHostIo (dtb_u_u26))))))

# 80 "Base/Effect/Process.vuna"
let v_processErrorText = (fun (dtb_u_u28 : t_ProcessError) -> (match dtb_u_u28 with
  | C_ProcessError_ProcessHostIo (dtb_u_u29) -> (String.concat "" ["process: "; dtb_u_u29; ": host I/O error"])
  | C_ProcessError_ProcessTooManyChildren (dtb_u_u30) -> (String.concat "" ["process: "; dtb_u_u30; ": too many concurrent child processes"])
  | C_ProcessError_ProcessLaunchDenied (dtb_u_u31) -> (String.concat "" ["process: "; dtb_u_u31; ": permission denied"])
  | C_ProcessError_ProcessNoDir (dtb_u_u32) -> (String.concat "" ["process: "; dtb_u_u32; ": no such directory"])
  | _ -> failwith "DT: impossible branch"
))

# 87 "Base/Effect/Process.vuna"
let v_handleProcess = (fun (dtb_u_u38 : string) dtb_u_u40 dtb_u_u41 dtb_u_u42 -> (((((((B_dEffect_dCore.v_handleCoreId "process") dtb_u_u38) 485051770) (dtp_effectId dtb_u_u38)) dtb_u_u40) (Obj.magic dtb_u_u41)) dtb_u_u42))

# 91 "Base/Effect/Process.vuna"
let v_processOpHIOWith = (fun (dtb_u_u45 : t_ProcessOp) dtb_u_u46 -> (match dtb_u_u45 with
  | C_ProcessOp_Args -> (Obj.repr ((fun (dtb_u_u51 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u52 = Obj.obj ((Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (B_dData_dList.dtp_listOf (dtp_getArgs ()))))) in (let dtb_u_u54 = (dtb_u_u52 dtb_u_u51) in ((Obj.magic ((Obj.magic dtb_u_u46) dtb_u_u54)) dtb_u_u51))))))
  | C_ProcessOp_Exit (dtb_u_u55) -> ((Obj.magic dtb_u_u46) dtb_u_u55)
  | C_ProcessOp_RunIn (dtb_u_u56, dtb_u_u57) -> (Obj.repr ((fun (dtb_u_u62 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u63 = Obj.obj ((((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun dir args -> dtp_runIn dir (B_dData_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) dtb_u_u56) dtb_u_u57)) in (let dtb_u_u65 = (dtb_u_u63 dtb_u_u62) in ((Obj.magic ((Obj.magic dtb_u_u46) dtb_u_u65)) dtb_u_u62))))))
  | C_ProcessOp_Spawn (dtb_u_u66) -> (Obj.repr ((fun (dtb_u_u71 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u72 = Obj.obj (((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun args -> dtp_spawn (B_dData_dList.dtp_ocamlOf args)) dtio_0)) dtb_u_u66)) in (let dtb_u_u74 = (dtb_u_u72 dtb_u_u71) in (let dtb_u_u80 = Obj.obj ((B_dEffect_dHost.v_hostSync (Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_hostStatus ()))))) in (let dtb_u_u82 = (dtb_u_u80 dtb_u_u71) in (if (dtb_u_u82 <> 0) then ((Obj.magic ((fun msg -> failwith msg) (v_processErrorText ((v_processErrorOfCode "spawn") dtb_u_u82)))) dtb_u_u71) else ((Obj.magic ((Obj.magic dtb_u_u46) dtb_u_u74)) dtb_u_u71)))))))))
  | C_ProcessOp_Wait (dtb_u_u83) -> (Obj.repr ((fun (dtb_u_u88 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u89 = Obj.obj (((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_wait dtio_0)) dtb_u_u83)) in (let dtb_u_u91 = (dtb_u_u89 dtb_u_u88) in (let dtb_u_u97 = Obj.obj ((B_dEffect_dHost.v_hostSync (Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_hostStatus ()))))) in (let dtb_u_u99 = (dtb_u_u97 dtb_u_u88) in (if (dtb_u_u99 <> 0) then ((Obj.magic ((fun msg -> failwith msg) (v_processErrorText ((v_processErrorOfCode "wait") dtb_u_u99)))) dtb_u_u88) else ((Obj.magic ((Obj.magic dtb_u_u46) dtb_u_u91)) dtb_u_u88)))))))))
  | _ -> failwith "DT: impossible branch"
))

# 115 "Base/Effect/Process.vuna"
let v_handleProcessHostWith = (fun (dtb_u_u102 : string) dtb_u_u103 -> (((((((B_dEffect_dCore.v_handleCoreAtId "process") dtb_u_u102) 485051770) (dtp_effectId dtb_u_u102)) (fun dtb_u_u104 -> (let dtb_u_u106 = dtb_u_u104 in (Obj.repr ((fun (dtb_u_u107 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u106)))))) v_processOpHIOWith) dtb_u_u103))

# 123 "Base/Effect/Process.vuna"
let v_processHostStatus = (B_dEffect_dHost.v_hostSync (Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_hostStatus ()))))

# 127 "Base/Effect/Process.vuna"
let v_processOpHIOWithHost = (fun (dtb_u_u111 : t_ProcessOp) dtb_u_u112 -> (match dtb_u_u111 with
  | C_ProcessOp_Args -> (Obj.repr ((fun (dtb_u_u117 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u118 = Obj.obj ((B_dEffect_dHost.v_hostSync (Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (B_dData_dList.dtp_listOf (dtp_getArgs ())))))) in (let dtb_u_u120 = (dtb_u_u118 dtb_u_u117) in ((Obj.magic ((Obj.magic dtb_u_u112) dtb_u_u120)) dtb_u_u117))))))
  | C_ProcessOp_Exit (dtb_u_u121) -> ((Obj.magic dtb_u_u112) (B_dEffect_dHost.v_runHost ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_exit dtio_0)) dtb_u_u121)))
  | C_ProcessOp_RunIn (dtb_u_u122, dtb_u_u123) -> (Obj.repr ((fun (dtb_u_u128 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u129 = Obj.obj ((B_dEffect_dHost.v_hostSync (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun dir args -> dtp_tryRunIn dir (B_dData_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) dtb_u_u122) dtb_u_u123))) in (let dtb_u_u131 = (dtb_u_u129 dtb_u_u128) in (let dtb_u_u137 = Obj.obj (v_processHostStatus) in (let dtb_u_u139 = (dtb_u_u137 dtb_u_u128) in (if (dtb_u_u139 <> 0) then ((Obj.magic ((v_processFail "process-error") ((v_processErrorOfCode ("runIn " ^ dtb_u_u122)) dtb_u_u139))) dtb_u_u128) else ((Obj.magic ((Obj.magic dtb_u_u112) dtb_u_u131)) dtb_u_u128)))))))))
  | C_ProcessOp_Spawn (dtb_u_u140) -> (Obj.repr ((fun (dtb_u_u145 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u146 = Obj.obj ((B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun args -> dtp_spawn (B_dData_dList.dtp_ocamlOf args)) dtio_0)) dtb_u_u140))) in (let dtb_u_u148 = (dtb_u_u146 dtb_u_u145) in (let dtb_u_u154 = Obj.obj (v_processHostStatus) in (let dtb_u_u156 = (dtb_u_u154 dtb_u_u145) in (if (dtb_u_u156 <> 0) then ((Obj.magic ((v_processFail "process-error") ((v_processErrorOfCode "spawn") dtb_u_u156))) dtb_u_u145) else ((Obj.magic ((Obj.magic dtb_u_u112) dtb_u_u148)) dtb_u_u145)))))))))
  | C_ProcessOp_Wait (dtb_u_u157) -> (Obj.repr ((fun (dtb_u_u162 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u163 = Obj.obj ((B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_wait dtio_0)) dtb_u_u157))) in (let dtb_u_u165 = (dtb_u_u163 dtb_u_u162) in (let dtb_u_u171 = Obj.obj (v_processHostStatus) in (let dtb_u_u173 = (dtb_u_u171 dtb_u_u162) in (if (dtb_u_u173 <> 0) then ((Obj.magic ((v_processFail "process-error") ((v_processErrorOfCode "wait") dtb_u_u173))) dtb_u_u162) else ((Obj.magic ((Obj.magic dtb_u_u112) dtb_u_u165)) dtb_u_u162)))))))))
  | _ -> failwith "DT: impossible branch"
))

# 152 "Base/Effect/Process.vuna"
let v_handleProcessHostWithHost = (fun (dtb_u_u176 : string) dtb_u_u177 -> (((((((B_dEffect_dCore.v_handleCoreAtId "process") dtb_u_u176) 485051770) (dtp_effectId dtb_u_u176)) (fun dtb_u_u178 -> (let dtb_u_u180 = dtb_u_u178 in (Obj.repr ((fun (dtb_u_u181 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u180)))))) v_processOpHIOWithHost) dtb_u_u177))

# 157 "Base/Effect/Process.vuna"
let v_runProcessHost = (fun dtb_u_u184 -> (B_dEffect_dCore.v_joinEff ((v_handleProcessHostWithHost "default") dtb_u_u184)))

# 161 "Base/Effect/Process.vuna"
let v_processErrorRet = (fun dtb_u_u186 -> (B_dData_dResult.C_Result_Ok (dtb_u_u186)))

# 165 "Base/Effect/Process.vuna"
let v_processErrorOpHR = (fun (dtb_u_u189 : t_ProcessErrorOp) dtb_u_u190 -> (match dtb_u_u189 with
  | C_ProcessErrorOp_ProcessFail (dtb_u_u191) -> (B_dData_dResult.C_Result_Err ((v_processErrorText dtb_u_u191)))
  | _ -> failwith "DT: impossible branch"
))

# 171 "Base/Effect/Process.vuna"
let v_runProcessError = (fun (dtb_u_u192 : string) dtb_u_u195 -> (((((((B_dEffect_dCore.v_handleCoreAtId "process-error") dtb_u_u192) 44116993) (dtp_effectId dtb_u_u192)) v_processErrorRet) v_processErrorOpHR) dtb_u_u195))

# 176 "Base/Effect/Process.vuna"
let v_runProcessResult = (fun dtb_u_u197 -> ((v_runProcessError "process-error") (v_runProcessHost dtb_u_u197)))

# 180 "Base/Effect/Process.vuna"
let v_runProcessErrorHost = (fun dtb_u_u200 -> (Obj.repr ((fun (dtb_u_u205 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u206 = Obj.obj (((v_runProcessError "process-error") dtb_u_u200)) in (let dtb_u_u208 = (dtb_u_u206 dtb_u_u205) in (match dtb_u_u208 with
  | B_dData_dResult.C_Result_Ok (dtb_u_u209) -> (let dtb_u_u211 = dtb_u_u209 in dtb_u_u211)
  | B_dData_dResult.C_Result_Err (dtb_u_u213) -> (let dtb_u_u219 = Obj.obj ((B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_eprint dtio_0)) (String.concat "" ["vuna: "; dtb_u_u213; "\n"])))) in (let dtb_u_u221 = (dtb_u_u219 dtb_u_u205) in (let dtb_u_u227 = Obj.obj ((B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_exit dtio_0)) 1))) in (let dtb_u_u229 = (dtb_u_u227 dtb_u_u205) in ((Obj.magic ((fun msg -> failwith msg) "unreachable: process error handler")) dtb_u_u205)))))
  | _ -> failwith "DT: impossible branch"
)))))))
