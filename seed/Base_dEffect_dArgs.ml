open Vuna_runtime
type t_Base_dEffect_dArgs_dArgsOp = C_Base_dEffect_dArgs_dArgsOp_GetArgs

# 15 "Base/Effect/Args.vuna"
let v_Base_dEffect_dArgs_dargsGetArgs = (fun n -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "args") n) C_Base_dEffect_dArgs_dArgsOp_GetArgs))

# 19 "Base/Effect/Args.vuna"
let v_Base_dEffect_dArgs_dhandleArgs = (fun n ret opH comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCore "args") n) ret) (Obj.magic opH)) comp))

# 23 "Base/Effect/Args.vuna"
let v_Base_dEffect_dArgs_dargsOpHIO = (fun op k -> (match op with
  | C_Base_dEffect_dArgs_dArgsOp_GetArgs -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (Base_dData_dList.dtp_listOf (dtp_getArgs ()))))) (fun xs -> ((Obj.magic k) xs)))
  | _ -> failwith "DT: impossible branch"
))

# 35 "Base/Effect/Args.vuna"
let v_Base_dEffect_dArgs_dargsOpHIOHost = (fun op k -> (match op with
  | C_Base_dEffect_dArgs_dArgsOp_GetArgs -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise (Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (Base_dData_dList.dtp_listOf (dtp_getArgs ())))))) (fun xs -> ((Obj.magic k) xs)))
  | _ -> failwith "DT: impossible branch"
))

# 44 "Base/Effect/Args.vuna"
let v_Base_dEffect_dArgs_dhandleArgsHostHost = (fun n comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCoreAt "args") n) (fun a -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) a))) v_Base_dEffect_dArgs_dargsOpHIOHost) comp))

# 48 "Base/Effect/Args.vuna"
let v_Base_dEffect_dArgs_drunArgsHost = (fun comp -> (Base_dEffect_dCore.v_Base_dEffect_dCore_djoinEff ((v_Base_dEffect_dArgs_dhandleArgsHostHost "default") comp)))
