open Vuna_runtime
type t_TtyOp = C_TtyOp_IsTty

# 21 "Base/Effect/Tty.vuna"
let v_ttyIsTty = (fun (n : string) -> (((((B_dEffect_dCore.v_sendCoreId "tty") n) 808136164) (dtp_effectId n)) C_TtyOp_IsTty))

# 25 "Base/Effect/Tty.vuna"
let v_handleTty = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreId "tty") n) 808136164) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 32 "Base/Effect/Tty.vuna"
let v_ttyOpHIOHost = (fun (op : t_TtyOp) k -> (match op with
  | C_TtyOp_IsTty -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_isTty ())))) (fun b -> ((Obj.magic k) b)))
  | _ -> failwith "DT: impossible branch"
))

# 41 "Base/Effect/Tty.vuna"
let v_handleTtyHostHost = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "tty") n) 808136164) (dtp_effectId n)) (fun a -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) a))) v_ttyOpHIOHost) comp))

# 45 "Base/Effect/Tty.vuna"
let v_runTtyHost = (fun comp -> (B_dEffect_dCore.v_joinEff ((v_handleTtyHostHost "default") comp)))

# 49 "Base/Effect/Tty.vuna"
let v_runTtyEff = (fun comp -> (B_dEffect_dHost.v_hostSync (v_runTtyHost comp)))
