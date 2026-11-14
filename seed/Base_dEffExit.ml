open Vuna_runtime
type t_Base_dEffExit_dExitOp = C_Base_dEffExit_dExitOp_ExitWith of (int)

# 20 "Base/EffExit.vuna"
let v_Base_dEffExit_dexitWith = (fun n code -> (((Base_dEff.v_Base_dEff_dsendCore "exit") n) (C_Base_dEffExit_dExitOp_ExitWith (code))))

# 24 "Base/EffExit.vuna"
let v_Base_dEffExit_dhandleExit = (fun n ret opH comp -> (((((Base_dEff.v_Base_dEff_dhandleCore "exit") n) ret) (Obj.magic opH)) comp))

# 28 "Base/EffExit.vuna"
let v_Base_dEffExit_dexitOpHIO = (fun op k -> (match op with
  | C_Base_dEffExit_dExitOp_ExitWith (dtb__0) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_exit dtio_0)) dtb__0)) (fun _u -> ((Obj.magic k) 0)))
  | _ -> failwith "DT: impossible branch"
))

# 38 "Base/EffExit.vuna"
let v_Base_dEffExit_dexitOpHIOHost = (fun op k -> (match op with
  | C_Base_dEffExit_dExitOp_ExitWith (dtb__1) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_exit dtio_0)) dtb__1)) (fun _u -> ((Obj.magic k) 0)))
  | _ -> failwith "DT: impossible branch"
))

# 44 "Base/EffExit.vuna"
let v_Base_dEffExit_dhandleExitHostHost = (fun n comp -> ((((v_Base_dEffExit_dhandleExit n) (fun a -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) a))) v_Base_dEffExit_dexitOpHIOHost) comp))

# 47 "Base/EffExit.vuna"
let v_Base_dEffExit_drunExitHost = (fun comp -> (Base_dEff.v_Base_dEff_djoinEff ((v_Base_dEffExit_dhandleExitHostHost "default") comp)))
