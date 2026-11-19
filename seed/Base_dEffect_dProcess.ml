open Vuna_runtime
type t_Base_dEffect_dProcess_dProcessOp = C_Base_dEffect_dProcess_dProcessOp_Args | C_Base_dEffect_dProcess_dProcessOp_Exit of (int) | C_Base_dEffect_dProcess_dProcessOp_RunIn of (string) * (string Base_dData_dList.t_Base_dData_dList_dList) | C_Base_dEffect_dProcess_dProcessOp_Spawn of (string Base_dData_dList.t_Base_dData_dList_dList) | C_Base_dEffect_dProcess_dProcessOp_Wait of (int)
and t_Base_dEffect_dProcess_dProcessError = C_Base_dEffect_dProcess_dProcessError_ProcessNoDir of (string) | C_Base_dEffect_dProcess_dProcessError_ProcessLaunchDenied of (string) | C_Base_dEffect_dProcess_dProcessError_ProcessHostIo of (string)
and t_Base_dEffect_dProcess_dProcessErrorOp = C_Base_dEffect_dProcess_dProcessErrorOp_ProcessFail of (t_Base_dEffect_dProcess_dProcessError)

# 28 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dprocessArgs = (fun (n : string) -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCoreId "process") n) 485051770) (dtp_effectId n)) C_Base_dEffect_dProcess_dProcessOp_Args))

# 32 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dprocessExit = (fun (n : string) (c : int) -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCoreId "process") n) 485051770) (dtp_effectId n)) (C_Base_dEffect_dProcess_dProcessOp_Exit (c))))

# 36 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dprocessRunIn = (fun (n : string) (dir : string) (args : string Base_dData_dList.t_Base_dData_dList_dList) -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCoreId "process") n) 485051770) (dtp_effectId n)) (C_Base_dEffect_dProcess_dProcessOp_RunIn (dir, args))))

# 42 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dprocessSpawn = (fun (n : string) (args : string Base_dData_dList.t_Base_dData_dList_dList) -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCoreId "process") n) 485051770) (dtp_effectId n)) (C_Base_dEffect_dProcess_dProcessOp_Spawn (args))))

# 48 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dprocessWait = (fun (n : string) (h : int) -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCoreId "process") n) 485051770) (dtp_effectId n)) (C_Base_dEffect_dProcess_dProcessOp_Wait (h))))

# 66 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dprocessFail = (fun (n : string) (e : t_Base_dEffect_dProcess_dProcessError) -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCoreId "process-error") n) 44116993) (dtp_effectId n)) (C_Base_dEffect_dProcess_dProcessErrorOp_ProcessFail (e))))

# 70 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dprocessErrorOfCode = (fun (mc0 : string) (mc1 : int) -> (if (mc1 = 1) then (C_Base_dEffect_dProcess_dProcessError_ProcessNoDir (mc0)) else (if (mc1 = 2) then (C_Base_dEffect_dProcess_dProcessError_ProcessLaunchDenied (mc0)) else (C_Base_dEffect_dProcess_dProcessError_ProcessHostIo (mc0)))))

# 76 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dprocessErrorText = (fun (mc0 : t_Base_dEffect_dProcess_dProcessError) -> (match mc0 with
  | C_Base_dEffect_dProcess_dProcessError_ProcessHostIo (dtb__0) -> (String.concat "" ["process: "; dtb__0; ": host I/O error"])
  | C_Base_dEffect_dProcess_dProcessError_ProcessLaunchDenied (dtb__1) -> (String.concat "" ["process: "; dtb__1; ": permission denied"])
  | C_Base_dEffect_dProcess_dProcessError_ProcessNoDir (dtb__2) -> (String.concat "" ["process: "; dtb__2; ": no such directory"])
  | _ -> failwith "DT: impossible branch"
))

# 82 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dhandleProcess = (fun (n : string) ret opH comp -> (((((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCoreId "process") n) 485051770) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 86 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dprocessOpHIOWith = (fun (op : t_Base_dEffect_dProcess_dProcessOp) k -> (match op with
  | C_Base_dEffect_dProcess_dProcessOp_Args -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (Base_dData_dList.dtp_listOf (dtp_getArgs ()))))) (fun xs -> ((Obj.magic k) xs)))
  | C_Base_dEffect_dProcess_dProcessOp_Exit (dtb__3) -> ((Obj.magic k) dtb__3)
  | C_Base_dEffect_dProcess_dProcessOp_RunIn (dtb__4, dtb__5) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((fun dtio_0 dtio_1 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (fun dir args -> dtp_runIn dir (Base_dData_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) dtb__4) dtb__5)) (fun c -> ((Obj.magic k) c)))
  | C_Base_dEffect_dProcess_dProcessOp_Spawn (dtb__6) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (fun args -> dtp_spawn (Base_dData_dList.dtp_ocamlOf args)) dtio_0)) dtb__6)) (fun h -> ((Obj.magic k) h)))
  | C_Base_dEffect_dProcess_dProcessOp_Wait (dtb__7) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_wait dtio_0)) dtb__7)) (fun c -> ((Obj.magic k) c)))
  | _ -> failwith "DT: impossible branch"
))

# 108 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dhandleProcessHostWith = (fun (n : string) comp -> (((((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCoreAtId "process") n) 485051770) (dtp_effectId n)) (fun a -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) a))) v_Base_dEffect_dProcess_dprocessOpHIOWith) comp))

# 116 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dprocessHostStatus = (Base_dEffect_dCore.v_Base_dEffect_dCore_draise (Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (dtp_hostStatus ()))))

# 120 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dprocessOpHIOWithHost = (fun (op : t_Base_dEffect_dProcess_dProcessOp) k -> (match op with
  | C_Base_dEffect_dProcess_dProcessOp_Args -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise (Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (Base_dData_dList.dtp_listOf (dtp_getArgs ())))))) (fun xs -> ((Obj.magic k) xs)))
  | C_Base_dEffect_dProcess_dProcessOp_Exit (dtb__8) -> ((Obj.magic k) (Base_dEffect_dCore.v_Base_dEffect_dCore_drunPure ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_exit dtio_0)) dtb__8)))
  | C_Base_dEffect_dProcess_dProcessOp_RunIn (dtb__9, dtb__10) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise (((fun dtio_0 dtio_1 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (fun dir args -> dtp_tryRunIn dir (Base_dData_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) dtb__9) dtb__10))) (fun c -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dProcess_dprocessHostStatus) (fun ok -> (if (ok <> 0) then ((v_Base_dEffect_dProcess_dprocessFail "process-error") ((v_Base_dEffect_dProcess_dprocessErrorOfCode ("runIn " ^ dtb__9)) ok)) else ((Obj.magic k) c))))))
  | C_Base_dEffect_dProcess_dProcessOp_Spawn (dtb__11) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (fun args -> dtp_spawn (Base_dData_dList.dtp_ocamlOf args)) dtio_0)) dtb__11))) (fun h -> ((Obj.magic k) h)))
  | C_Base_dEffect_dProcess_dProcessOp_Wait (dtb__12) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_wait dtio_0)) dtb__12))) (fun c -> ((Obj.magic k) c)))
  | _ -> failwith "DT: impossible branch"
))

# 143 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dhandleProcessHostWithHost = (fun (n : string) comp -> (((((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCoreAtId "process") n) 485051770) (dtp_effectId n)) (fun a -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) a))) v_Base_dEffect_dProcess_dprocessOpHIOWithHost) comp))

# 148 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_drunProcessHost = (fun comp -> (Base_dEffect_dCore.v_Base_dEffect_dCore_djoinEff ((v_Base_dEffect_dProcess_dhandleProcessHostWithHost "default") comp)))

# 152 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dprocessErrorRet = (fun a -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (a)))

# 156 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dprocessErrorOpHR = (fun (op : t_Base_dEffect_dProcess_dProcessErrorOp) _u -> (match op with
  | C_Base_dEffect_dProcess_dProcessErrorOp_ProcessFail (dtb__13) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err ((v_Base_dEffect_dProcess_dprocessErrorText dtb__13)))
  | _ -> failwith "DT: impossible branch"
))

# 162 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_drunProcessError = (fun (n : string) comp -> (((((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCoreAtId "process-error") n) 44116993) (dtp_effectId n)) v_Base_dEffect_dProcess_dprocessErrorRet) v_Base_dEffect_dProcess_dprocessErrorOpHR) comp))

# 167 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_drunProcessErrorHost = (fun comp -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Base_dEffect_dProcess_drunProcessError "process-error") comp)) (fun res -> (match res with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__14) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) dtb__14)
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__15) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (fun s -> (try prerr_string s; flush stderr; String.length s with _ -> 0)) dtio_0)) (String.concat "" ["vuna: "; dtb__15; "\n"])))) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_exit dtio_0)) 1))) (fun _u -> ((fun msg -> failwith msg) "unreachable: process error handler")))))
  | _ -> failwith "DT: impossible branch"
))))
