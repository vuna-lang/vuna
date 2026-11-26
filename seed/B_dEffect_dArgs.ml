open Vuna_runtime
type t_ArgsOp = C_ArgsOp_GetArgs

# 16 "Base/Effect/Args.vuna"
let v_argsGetArgs = (fun (n : string) -> (((((B_dEffect_dCore.v_sendCoreId "args") n) 487237436) (dtp_effectId n)) C_ArgsOp_GetArgs))

# 20 "Base/Effect/Args.vuna"
let v_handleArgs = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreId "args") n) 487237436) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 27 "Base/Effect/Args.vuna"
let v_argsOpHIOHost = (fun (op : t_ArgsOp) k -> (match op with
  | C_ArgsOp_GetArgs -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (B_dData_dList.dtp_listOf (dtp_getArgs ()))))) (fun xs -> ((Obj.magic k) xs)))
  | _ -> failwith "DT: impossible branch"
))

# 36 "Base/Effect/Args.vuna"
let v_handleArgsHostHost = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "args") n) 487237436) (dtp_effectId n)) (fun a -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) a))) v_argsOpHIOHost) comp))

# 40 "Base/Effect/Args.vuna"
let v_runArgsHost = (fun comp -> (B_dEffect_dCore.v_joinEff ((v_handleArgsHostHost "default") comp)))

# 44 "Base/Effect/Args.vuna"
let v_runArgsEff = (fun comp -> (B_dEffect_dHost.v_hostSync (v_runArgsHost comp)))
