open Vuna_runtime
type t_ConsoleOp = C_ConsoleOp_Print of (string) | C_ConsoleOp_EPrint of (string)

# 22 "Base/Effect/Console.vuna"
let v_consolePrint = (fun (n : string) (s : string) -> (((((B_dEffect_dCore.v_sendCoreId "console") n) 775068458) (dtp_effectId n)) (C_ConsoleOp_Print (s))))

# 26 "Base/Effect/Console.vuna"
let v_consoleEprint = (fun (n : string) (s : string) -> (((((B_dEffect_dCore.v_sendCoreId "console") n) 775068458) (dtp_effectId n)) (C_ConsoleOp_EPrint (s))))

# 30 "Base/Effect/Console.vuna"
let v_handleConsole = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreId "console") n) 775068458) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 38 "Base/Effect/Console.vuna"
let v_consoleOpHIOHost = (fun (op : t_ConsoleOp) k -> (match op with
  | C_ConsoleOp_Print (dtb__0) -> ((Obj.magic k) (bi_natFromInt (B_dEffect_dHost.v_runHost ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_print dtio_0)) dtb__0))))
  | C_ConsoleOp_EPrint (dtb__1) -> ((Obj.magic k) (B_dEffect_dHost.v_runHost ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_eprint dtio_0)) dtb__1)))
  | _ -> failwith "DT: impossible branch"
))

# 45 "Base/Effect/Console.vuna"
let v_consoleOpHILib = (fun (op : t_ConsoleOp) k -> (match op with
  | C_ConsoleOp_Print (dtb__2) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) bi_natFromInt) ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_print dtio_0)) dtb__2))) (fun r -> ((Obj.magic k) r)))
  | C_ConsoleOp_EPrint (dtb__3) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_eprint dtio_0)) dtb__3)) (fun r -> ((Obj.magic k) r)))
  | _ -> failwith "DT: impossible branch"
))

# 58 "Base/Effect/Console.vuna"
let v_handleConsoleHostHost = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "console") n) 775068458) (dtp_effectId n)) (fun a -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) a))) v_consoleOpHILib) comp))

# 64 "Base/Effect/Console.vuna"
let v_runConsoleHost = (fun comp -> (B_dEffect_dCore.v_joinEff ((v_handleConsoleHostHost "default") comp)))

# 68 "Base/Effect/Console.vuna"
let v_runConsoleEff = (fun comp -> (B_dEffect_dHost.v_hostSync (v_runConsoleHost comp)))
