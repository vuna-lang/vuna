open Vuna_runtime
type t_ArgsOp = C_ArgsOp_GetArgs

# 15 "Base/Effect/Args.vuna"
let v_argsGetArgs = (fun (n : string) -> (((((B_dEffect_dCore.v_sendCoreId "args") n) 487237436) (dtp_effectId n)) C_ArgsOp_GetArgs))

# 19 "Base/Effect/Args.vuna"
let v_handleArgs = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreId "args") n) 487237436) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 23 "Base/Effect/Args.vuna"
let v_argsOpHIO = (fun (op : t_ArgsOp) k -> (match op with
  | C_ArgsOp_GetArgs -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (B_dData_dList.dtp_listOf (dtp_getArgs ()))))) (fun xs -> ((Obj.magic k) xs)))
  | _ -> failwith "DT: impossible branch"
))

# 35 "Base/Effect/Args.vuna"
let v_argsOpHIOHost = (fun (op : t_ArgsOp) k -> (match op with
  | C_ArgsOp_GetArgs -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise (B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (B_dData_dList.dtp_listOf (dtp_getArgs ())))))) (fun xs -> ((Obj.magic k) xs)))
  | _ -> failwith "DT: impossible branch"
))

# 44 "Base/Effect/Args.vuna"
let v_handleArgsHostHost = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "args") n) 487237436) (dtp_effectId n)) (fun a -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) a))) v_argsOpHIOHost) comp))

# 48 "Base/Effect/Args.vuna"
let v_runArgsHost = (fun comp -> (B_dEffect_dCore.v_joinEff ((v_handleArgsHostHost "default") comp)))
