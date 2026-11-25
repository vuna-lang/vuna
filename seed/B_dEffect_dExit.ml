open Vuna_runtime
type t_ExitOp = C_ExitOp_ExitWith of (int)

# 15 "Base/Effect/Exit.vuna"
let v_exitWith = (fun (n : string) (code : int) -> (((((B_dEffect_dCore.v_sendCoreId "exit") n) 233642629) (dtp_effectId n)) (C_ExitOp_ExitWith (code))))

# 19 "Base/Effect/Exit.vuna"
let v_handleExit = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreId "exit") n) 233642629) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 27 "Base/Effect/Exit.vuna"
let v_exitOpHIOHost = (fun (op : t_ExitOp) k -> (match op with
  | C_ExitOp_ExitWith (dtb__0) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_exit dtio_0)) dtb__0)) (fun _u -> ((Obj.magic k) 0)))
  | _ -> failwith "DT: impossible branch"
))

# 36 "Base/Effect/Exit.vuna"
let v_handleExitHostHost = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "exit") n) 233642629) (dtp_effectId n)) (fun a -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) a))) v_exitOpHIOHost) comp))

# 40 "Base/Effect/Exit.vuna"
let v_runExitHost = (fun comp -> (B_dEffect_dCore.v_joinEff ((v_handleExitHostHost "default") comp)))
