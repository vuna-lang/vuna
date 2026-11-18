open Vuna_runtime
type t_Base_dEffect_dProcess_dProcessOp = C_Base_dEffect_dProcess_dProcessOp_Args | C_Base_dEffect_dProcess_dProcessOp_Exit of (int) | C_Base_dEffect_dProcess_dProcessOp_RunIn of (string) * (string Base_dData_dList.t_Base_dData_dList_dList) | C_Base_dEffect_dProcess_dProcessOp_Spawn of (string Base_dData_dList.t_Base_dData_dList_dList) | C_Base_dEffect_dProcess_dProcessOp_Wait of (int)
and t_Base_dEffect_dProcess_dProcessError = C_Base_dEffect_dProcess_dProcessError_ProcessNoDir of (string) | C_Base_dEffect_dProcess_dProcessError_ProcessLaunchDenied of (string) | C_Base_dEffect_dProcess_dProcessError_ProcessHostIo of (string)
and t_Base_dEffect_dProcess_dProcessErrorOp = C_Base_dEffect_dProcess_dProcessErrorOp_ProcessFail of (t_Base_dEffect_dProcess_dProcessError)

# 28 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dprocessArgs = (fun n -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "process") n) C_Base_dEffect_dProcess_dProcessOp_Args))

# 32 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dprocessExit = (fun n c -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "process") n) (C_Base_dEffect_dProcess_dProcessOp_Exit (c))))

# 36 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dprocessRunIn = (fun n dir args -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "process") n) (C_Base_dEffect_dProcess_dProcessOp_RunIn (dir, args))))

# 42 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dprocessSpawn = (fun n args -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "process") n) (C_Base_dEffect_dProcess_dProcessOp_Spawn (args))))

# 48 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dprocessWait = (fun n h -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "process") n) (C_Base_dEffect_dProcess_dProcessOp_Wait (h))))

# 66 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dprocessFail = (fun n e -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "process-error") n) (C_Base_dEffect_dProcess_dProcessErrorOp_ProcessFail (e))))

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
let v_Base_dEffect_dProcess_dhandleProcess = (fun n ret opH comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCore "process") n) ret) (Obj.magic opH)) comp))

# 86 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dprocessOpHIOWith = (fun onExit op k -> (match op with
  | C_Base_dEffect_dProcess_dProcessOp_Args -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (Base_dData_dList.dtp_listOf (dtp_getArgs ()))))) (fun _x64_vuna_x64_effK_u90_u9_u9_x58_xs -> ((Obj.magic k) _x64_vuna_x64_effK_u90_u9_u9_x58_xs)))
  | C_Base_dEffect_dProcess_dProcessOp_Exit (dtb__3) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (onExit dtb__3)) (fun _x64_vuna_x64_effK_u94_u9_u10_x58_r -> ((Obj.magic k) _x64_vuna_x64_effK_u94_u9_u10_x58_r)))
  | C_Base_dEffect_dProcess_dProcessOp_RunIn (dtb__4, dtb__5) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((fun dtio_0 dtio_1 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (fun dir args -> dtp_runIn dir (Base_dData_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) dtb__4) dtb__5)) (fun _x64_vuna_x64_effK_u98_u9_u11_x58_c -> ((Obj.magic k) _x64_vuna_x64_effK_u98_u9_u11_x58_c)))
  | C_Base_dEffect_dProcess_dProcessOp_Spawn (dtb__6) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (fun args -> dtp_spawn (Base_dData_dList.dtp_ocamlOf args)) dtio_0)) dtb__6)) (fun _x64_vuna_x64_effK_u102_u9_u10_x58_h -> ((Obj.magic k) _x64_vuna_x64_effK_u102_u9_u10_x58_h)))
  | C_Base_dEffect_dProcess_dProcessOp_Wait (dtb__7) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_wait dtio_0)) dtb__7)) (fun _x64_vuna_x64_effK_u106_u9_u10_x58_c -> ((Obj.magic k) _x64_vuna_x64_effK_u106_u9_u10_x58_c)))
  | _ -> failwith "DT: impossible branch"
))

# 111 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dhandleProcessHostWith = (fun n onExit comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCoreAt "process") n) (fun a -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) a))) (v_Base_dEffect_dProcess_dprocessOpHIOWith onExit)) comp))

# 119 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dprocessHostStatus = (Base_dEffect_dCore.v_Base_dEffect_dCore_draise (Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (dtp_hostStatus ()))))

# 123 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dprocessOpHIOWithHost = (fun onExit op k -> (match op with
  | C_Base_dEffect_dProcess_dProcessOp_Args -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise (Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (Base_dData_dList.dtp_listOf (dtp_getArgs ())))))) (fun _x64_vuna_x64_effK_u127_u9_u9_x58_xs -> ((Obj.magic k) _x64_vuna_x64_effK_u127_u9_u9_x58_xs)))
  | C_Base_dEffect_dProcess_dProcessOp_Exit (dtb__8) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (onExit dtb__8)) (fun _x64_vuna_x64_effK_u131_u9_u10_x58_r -> ((Obj.magic k) _x64_vuna_x64_effK_u131_u9_u10_x58_r)))
  | C_Base_dEffect_dProcess_dProcessOp_RunIn (dtb__9, dtb__10) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise (((fun dtio_0 dtio_1 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (fun dir args -> dtp_tryRunIn dir (Base_dData_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) dtb__9) dtb__10))) (fun _x64_vuna_x64_effK_u135_u9_u11_x58_c -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dProcess_dprocessHostStatus) (fun _x64_vuna_x64_effK_u136_u9_u12_x58_ok -> (if (_x64_vuna_x64_effK_u136_u9_u12_x58_ok <> 0) then ((v_Base_dEffect_dProcess_dprocessFail "process-error") ((v_Base_dEffect_dProcess_dprocessErrorOfCode ("runIn " ^ dtb__9)) _x64_vuna_x64_effK_u136_u9_u12_x58_ok)) else ((Obj.magic k) _x64_vuna_x64_effK_u135_u9_u11_x58_c))))))
  | C_Base_dEffect_dProcess_dProcessOp_Spawn (dtb__11) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (fun args -> dtp_spawn (Base_dData_dList.dtp_ocamlOf args)) dtio_0)) dtb__11))) (fun _x64_vuna_x64_effK_u140_u9_u10_x58_h -> ((Obj.magic k) _x64_vuna_x64_effK_u140_u9_u10_x58_h)))
  | C_Base_dEffect_dProcess_dProcessOp_Wait (dtb__12) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_wait dtio_0)) dtb__12))) (fun _x64_vuna_x64_effK_u144_u9_u10_x58_c -> ((Obj.magic k) _x64_vuna_x64_effK_u144_u9_u10_x58_c)))
  | _ -> failwith "DT: impossible branch"
))

# 149 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dhandleProcessHostWithHost = (fun n onExit comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCoreAt "process") n) (fun a -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) a))) (v_Base_dEffect_dProcess_dprocessOpHIOWithHost onExit)) comp))

# 154 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_drunProcessHost = (fun comp -> (Base_dEffect_dCore.v_Base_dEffect_dCore_djoinEff (((v_Base_dEffect_dProcess_dhandleProcessHostWithHost "default") (fun (c : int) -> (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_exit dtio_0)) c)))) comp)))

# 160 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dprocessErrorRet = (fun a -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (a)))

# 164 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_dprocessErrorOpHR = (fun op _u -> (match op with
  | C_Base_dEffect_dProcess_dProcessErrorOp_ProcessFail (dtb__13) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err ((v_Base_dEffect_dProcess_dprocessErrorText dtb__13)))
  | _ -> failwith "DT: impossible branch"
))

# 170 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_drunProcessError = (fun n comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCoreAt "process-error") n) v_Base_dEffect_dProcess_dprocessErrorRet) v_Base_dEffect_dProcess_dprocessErrorOpHR) comp))

# 175 "Base/Effect/Process.vuna"
let v_Base_dEffect_dProcess_drunProcessErrorHost = (fun comp -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Base_dEffect_dProcess_drunProcessError "process-error") comp)) (fun _x64_vuna_x64_effK_u177_u5_u3_x58_res -> (match _x64_vuna_x64_effK_u177_u5_u3_x58_res with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__14) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) dtb__14)
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__15) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (fun s -> (try prerr_string s; flush stderr; String.length s with _ -> 0)) dtio_0)) (String.concat "" ["vuna: "; dtb__15; "\n"])))) (fun _x64_vuna_x64_effK_u0_u0_u6_x58__u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_exit dtio_0)) 1))) (fun _x64_vuna_x64_effK_u0_u0_u7_x58__u -> ((fun msg -> failwith msg) "unreachable: process error handler")))))
  | _ -> failwith "DT: impossible branch"
))))
