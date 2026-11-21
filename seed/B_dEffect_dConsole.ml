open Vuna_runtime
type t_ConsoleOp = C_ConsoleOp_Print of (string) | C_ConsoleOp_EPrint of (string)

# 21 "Base/Effect/Console.vuna"
let v_consolePrint = (fun (n : string) (s : string) -> (((((B_dEffect_dCore.v_sendCoreId "console") n) 775068458) (dtp_effectId n)) (C_ConsoleOp_Print (s))))

# 25 "Base/Effect/Console.vuna"
let v_consoleEprint = (fun (n : string) (s : string) -> (((((B_dEffect_dCore.v_sendCoreId "console") n) 775068458) (dtp_effectId n)) (C_ConsoleOp_EPrint (s))))

# 29 "Base/Effect/Console.vuna"
let v_handleConsole = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreId "console") n) 775068458) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 33 "Base/Effect/Console.vuna"
let v_consoleOpHIO = (fun (op : t_ConsoleOp) k -> (match op with
  | C_ConsoleOp_Print (dtb__0) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) bi_natFromInt) ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_print dtio_0)) dtb__0))) (fun r -> ((Obj.magic k) r)))
  | C_ConsoleOp_EPrint (dtb__1) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun s -> (try prerr_string s; flush stderr; String.length s with _ -> 0)) dtio_0)) dtb__1)) (fun r -> ((Obj.magic k) r)))
  | _ -> failwith "DT: impossible branch"
))

# 49 "Base/Effect/Console.vuna"
let v_consoleOpHIOHost = (fun (op : t_ConsoleOp) k -> (match op with
  | C_ConsoleOp_Print (dtb__2) -> ((Obj.magic k) (bi_natFromInt (B_dEffect_dCore.v_runPure ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_print dtio_0)) dtb__2))))
  | C_ConsoleOp_EPrint (dtb__3) -> ((Obj.magic k) (B_dEffect_dCore.v_runPure ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun s -> (try prerr_string s; flush stderr; String.length s with _ -> 0)) dtio_0)) dtb__3)))
  | _ -> failwith "DT: impossible branch"
))

# 56 "Base/Effect/Console.vuna"
let v_handleConsoleHostHost = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "console") n) 775068458) (dtp_effectId n)) (fun a -> a)) v_consoleOpHIOHost) comp))

# 61 "Base/Effect/Console.vuna"
let v_runConsoleHost = (fun comp -> ((v_handleConsoleHostHost "default") comp))
