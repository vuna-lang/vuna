open Vuna_runtime
type t_Base_dEffProcess_dProcessOp = C_Base_dEffProcess_dProcessOp_Args | C_Base_dEffProcess_dProcessOp_Exit of (int) | C_Base_dEffProcess_dProcessOp_RunIn of (string) * (string Base_dList.t_Base_dList_dList) | C_Base_dEffProcess_dProcessOp_Spawn of (string Base_dList.t_Base_dList_dList) | C_Base_dEffProcess_dProcessOp_Wait of (int)
and t_Base_dEffProcess_dProcessError = C_Base_dEffProcess_dProcessError_ProcessNoDir of (string) | C_Base_dEffProcess_dProcessError_ProcessLaunchDenied of (string) | C_Base_dEffProcess_dProcessError_ProcessHostIo of (string)
and t_Base_dEffProcess_dProcessErrorOp = C_Base_dEffProcess_dProcessErrorOp_ProcessFail of (t_Base_dEffProcess_dProcessError)

# 36 "Base/EffProcess.vuna"
let v_Base_dEffProcess_dprocessArgs = (fun n -> (((Base_dEff.v_Base_dEff_dsendCore "process") n) C_Base_dEffProcess_dProcessOp_Args))

# 40 "Base/EffProcess.vuna"
let v_Base_dEffProcess_dprocessExit = (fun n c -> (((Base_dEff.v_Base_dEff_dsendCore "process") n) (C_Base_dEffProcess_dProcessOp_Exit (c))))

# 44 "Base/EffProcess.vuna"
let v_Base_dEffProcess_dprocessRunIn = (fun n dir args -> (((Base_dEff.v_Base_dEff_dsendCore "process") n) (C_Base_dEffProcess_dProcessOp_RunIn (dir, args))))

# 49 "Base/EffProcess.vuna"
let v_Base_dEffProcess_dprocessSpawn = (fun n args -> (((Base_dEff.v_Base_dEff_dsendCore "process") n) (C_Base_dEffProcess_dProcessOp_Spawn (args))))

# 54 "Base/EffProcess.vuna"
let v_Base_dEffProcess_dprocessWait = (fun n h -> (((Base_dEff.v_Base_dEff_dsendCore "process") n) (C_Base_dEffProcess_dProcessOp_Wait (h))))

# 76 "Base/EffProcess.vuna"
let v_Base_dEffProcess_dprocessFail = (fun n e -> (((Base_dEff.v_Base_dEff_dsendCore "process-error") n) (C_Base_dEffProcess_dProcessErrorOp_ProcessFail (e))))

# 80 "Base/EffProcess.vuna"
let v_Base_dEffProcess_dprocessErrorOfCode = (fun mc0 mc1 -> (if (mc1 = 1) then (C_Base_dEffProcess_dProcessError_ProcessNoDir (mc0)) else (if (mc1 = 2) then (C_Base_dEffProcess_dProcessError_ProcessLaunchDenied (mc0)) else (C_Base_dEffProcess_dProcessError_ProcessHostIo (mc0)))))

# 86 "Base/EffProcess.vuna"
let v_Base_dEffProcess_dprocessErrorText = (fun mc0 -> (match mc0 with
  | C_Base_dEffProcess_dProcessError_ProcessHostIo (dtb__0) -> (String.concat "" ["process: "; dtb__0; ": host I/O error"])
  | C_Base_dEffProcess_dProcessError_ProcessLaunchDenied (dtb__1) -> (String.concat "" ["process: "; dtb__1; ": permission denied"])
  | C_Base_dEffProcess_dProcessError_ProcessNoDir (dtb__2) -> (String.concat "" ["process: "; dtb__2; ": no such directory"])
  | _ -> failwith "DT: impossible branch"
))

# 92 "Base/EffProcess.vuna"
let v_Base_dEffProcess_dhandleProcess = (fun n ret opH comp -> (((((Base_dEff.v_Base_dEff_dhandleCore "process") n) ret) (Obj.magic opH)) comp))

# 96 "Base/EffProcess.vuna"
let v_Base_dEffProcess_dprocessOpHIOWith = (fun onExit op k -> (match op with
  | C_Base_dEffProcess_dProcessOp_Args -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (Base_dList.dtp_listOf (dtp_getArgs ()))))) (fun xs -> ((Obj.magic k) xs)))
  | C_Base_dEffProcess_dProcessOp_Exit (dtb__3) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (onExit dtb__3)) (fun r -> ((Obj.magic k) r)))
  | C_Base_dEffProcess_dProcessOp_RunIn (dtb__4, dtb__5) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun dir args -> dtp_runIn dir (Base_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) dtb__4) dtb__5)) (fun c -> ((Obj.magic k) c)))
  | C_Base_dEffProcess_dProcessOp_Spawn (dtb__6) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun args -> dtp_spawn (Base_dList.dtp_ocamlOf args)) dtio_0)) dtb__6)) (fun h -> ((Obj.magic k) h)))
  | C_Base_dEffProcess_dProcessOp_Wait (dtb__7) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_wait dtio_0)) dtb__7)) (fun c -> ((Obj.magic k) c)))
  | _ -> failwith "DT: impossible branch"
))

# 115 "Base/EffProcess.vuna"
let v_Base_dEffProcess_dhandleProcessHostWith = (fun n onExit comp -> ((((v_Base_dEffProcess_dhandleProcess n) (fun a -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) a))) (v_Base_dEffProcess_dprocessOpHIOWith onExit)) comp))

# 122 "Base/EffProcess.vuna"
let v_Base_dEffProcess_dprocessHostStatus = (Base_dEff.v_Base_dEff_draise (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_hostStatus ()))))

# 126 "Base/EffProcess.vuna"
let v_Base_dEffProcess_dprocessOpHIOWithHost = (fun onExit op k -> (match op with
  | C_Base_dEffProcess_dProcessOp_Args -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (Base_dList.dtp_listOf (dtp_getArgs ())))))) (fun xs -> ((Obj.magic k) xs)))
  | C_Base_dEffProcess_dProcessOp_Exit (dtb__8) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (onExit dtb__8)) (fun r -> ((Obj.magic k) r)))
  | C_Base_dEffProcess_dProcessOp_RunIn (dtb__9, dtb__10) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun dir args -> dtp_tryRunIn dir (Base_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) dtb__9) dtb__10))) (fun c -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffProcess_dprocessHostStatus) (fun ok -> (if (ok <> 0) then ((v_Base_dEffProcess_dprocessFail "process-error") ((v_Base_dEffProcess_dprocessErrorOfCode ("runIn " ^ dtb__9)) ok)) else ((Obj.magic k) c))))))
  | C_Base_dEffProcess_dProcessOp_Spawn (dtb__11) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun args -> dtp_spawn (Base_dList.dtp_ocamlOf args)) dtio_0)) dtb__11))) (fun h -> ((Obj.magic k) h)))
  | C_Base_dEffProcess_dProcessOp_Wait (dtb__12) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_wait dtio_0)) dtb__12))) (fun c -> ((Obj.magic k) c)))
  | _ -> failwith "DT: impossible branch"
))

# 146 "Base/EffProcess.vuna"
let v_Base_dEffProcess_dhandleProcessHostWithHost = (fun n onExit comp -> ((((v_Base_dEffProcess_dhandleProcess n) (fun a -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) a))) (v_Base_dEffProcess_dprocessOpHIOWithHost onExit)) comp))

# 151 "Base/EffProcess.vuna"
let v_Base_dEffProcess_drunProcessHost = (fun comp -> (Base_dEff.v_Base_dEff_djoinEff (((v_Base_dEffProcess_dhandleProcessHostWithHost "default") (fun c -> (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_exit dtio_0)) c)))) comp)))

# 157 "Base/EffProcess.vuna"
let v_Base_dEffProcess_dprocessErrorRet = (fun a -> (Base_dResult.C_Base_dResult_dResult_Ok (a)))

# 161 "Base/EffProcess.vuna"
let v_Base_dEffProcess_dprocessErrorOpHR = (fun op _u -> (match op with
  | C_Base_dEffProcess_dProcessErrorOp_ProcessFail (dtb__13) -> (Base_dResult.C_Base_dResult_dResult_Err ((v_Base_dEffProcess_dprocessErrorText dtb__13)))
  | _ -> failwith "DT: impossible branch"
))

# 166 "Base/EffProcess.vuna"
let v_Base_dEffProcess_drunProcessError = (fun n comp -> (((((Base_dEff.v_Base_dEff_dhandleCore "process-error") n) v_Base_dEffProcess_dprocessErrorRet) v_Base_dEffProcess_dprocessErrorOpHR) comp))

# 171 "Base/EffProcess.vuna"
let v_Base_dEffProcess_drunProcessErrorHost = (fun comp -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Base_dEffProcess_drunProcessError "process-error") comp)) (fun res -> (match res with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__14) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) dtb__14)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__15) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun s -> (try prerr_string s; flush stderr; String.length s with _ -> 0)) dtio_0)) (String.concat "" ["vuna: "; dtb__15; "\n"])))) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_exit dtio_0)) 1))) (fun _u -> ((fun msg -> failwith msg) "unreachable: process error handler")))))
  | _ -> failwith "DT: impossible branch"
))))
