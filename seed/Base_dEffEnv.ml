open Vuna_runtime
type t_Base_dEffEnv_dEnvOp = C_Base_dEffEnv_dEnvOp_GetEnv of (string) | C_Base_dEffEnv_dEnvOp_GetCwd | C_Base_dEffEnv_dEnvOp_ExecPath

# 24 "Base/EffEnv.vuna"
let v_Base_dEffEnv_denvGetEnv = (fun n k -> (((Base_dEff.v_Base_dEff_dsendCore "env") n) (C_Base_dEffEnv_dEnvOp_GetEnv (k))))

# 28 "Base/EffEnv.vuna"
let v_Base_dEffEnv_denvGetCwd = (fun n -> (((Base_dEff.v_Base_dEff_dsendCore "env") n) C_Base_dEffEnv_dEnvOp_GetCwd))

# 32 "Base/EffEnv.vuna"
let v_Base_dEffEnv_denvExecPath = (fun n -> (((Base_dEff.v_Base_dEff_dsendCore "env") n) C_Base_dEffEnv_dEnvOp_ExecPath))

# 36 "Base/EffEnv.vuna"
let v_Base_dEffEnv_dhandleEnv = (fun n ret opH comp -> (((((Base_dEff.v_Base_dEff_dhandleCore "env") n) ret) (Obj.magic opH)) comp))

# 40 "Base/EffEnv.vuna"
let v_Base_dEffEnv_denvOpHIO = (fun op k -> (match op with
  | C_Base_dEffEnv_dEnvOp_GetEnv (dtb__0) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_getenv dtio_0)) dtb__0)) (fun v -> ((Obj.magic k) v)))
  | C_Base_dEffEnv_dEnvOp_GetCwd -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_getcwd ())))) (fun v -> ((Obj.magic k) v)))
  | C_Base_dEffEnv_dEnvOp_ExecPath -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_execPath ())))) (fun v -> ((Obj.magic k) v)))
  | _ -> failwith "DT: impossible branch"
))

# 56 "Base/EffEnv.vuna"
let v_Base_dEffEnv_denvOpHIOHost = (fun op k -> (match op with
  | C_Base_dEffEnv_dEnvOp_GetEnv (dtb__1) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_getenv dtio_0)) dtb__1)) (fun v -> ((Obj.magic k) v)))
  | C_Base_dEffEnv_dEnvOp_GetCwd -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_getcwd ())))) (fun v -> ((Obj.magic k) v)))
  | C_Base_dEffEnv_dEnvOp_ExecPath -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_execPath ())))) (fun v -> ((Obj.magic k) v)))
  | _ -> failwith "DT: impossible branch"
))

# 68 "Base/EffEnv.vuna"
let v_Base_dEffEnv_dhandleEnvHostHost = (fun n comp -> ((((v_Base_dEffEnv_dhandleEnv n) (fun a -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) a))) v_Base_dEffEnv_denvOpHIOHost) comp))

# 71 "Base/EffEnv.vuna"
let v_Base_dEffEnv_drunEnvHost = (fun comp -> (Base_dEff.v_Base_dEff_djoinEff ((v_Base_dEffEnv_dhandleEnvHostHost "default") comp)))
