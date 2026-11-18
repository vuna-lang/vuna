open Vuna_runtime
type t_Base_dEffect_dConsole_dConsoleOp = C_Base_dEffect_dConsole_dConsoleOp_Print of (string) | C_Base_dEffect_dConsole_dConsoleOp_EPrint of (string)

# 21 "Base/Effect/Console.vuna"
let v_Base_dEffect_dConsole_dconsolePrint = (fun n s -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "console") n) (C_Base_dEffect_dConsole_dConsoleOp_Print (s))))

# 25 "Base/Effect/Console.vuna"
let v_Base_dEffect_dConsole_dconsoleEprint = (fun n s -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "console") n) (C_Base_dEffect_dConsole_dConsoleOp_EPrint (s))))

# 29 "Base/Effect/Console.vuna"
let v_Base_dEffect_dConsole_dhandleConsole = (fun n ret opH comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCore "console") n) ret) (Obj.magic opH)) comp))

# 33 "Base/Effect/Console.vuna"
let v_Base_dEffect_dConsole_dconsoleOpHIO = (fun op k -> (match op with
  | C_Base_dEffect_dConsole_dConsoleOp_Print (dtb__0) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Base_dTrait_dFunctor.v_Base_dTrait_dFunctor_dfmap Base_dEffect_dCore.v_Functor_uBase_uEffect_uCore_uEff_ur) bi_natFromInt) ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_print dtio_0)) dtb__0))) (fun r -> ((Obj.magic k) r)))
  | C_Base_dEffect_dConsole_dConsoleOp_EPrint (dtb__1) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (fun s -> (try prerr_string s; flush stderr; String.length s with _ -> 0)) dtio_0)) dtb__1)) (fun r -> ((Obj.magic k) r)))
  | _ -> failwith "DT: impossible branch"
))

# 49 "Base/Effect/Console.vuna"
let v_Base_dEffect_dConsole_dconsoleOpHIOHost = (fun op k -> (match op with
  | C_Base_dEffect_dConsole_dConsoleOp_Print (dtb__2) -> ((Obj.magic k) (bi_natFromInt (Base_dEffect_dCore.v_Base_dEffect_dCore_drunPure ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_print dtio_0)) dtb__2))))
  | C_Base_dEffect_dConsole_dConsoleOp_EPrint (dtb__3) -> ((Obj.magic k) (Base_dEffect_dCore.v_Base_dEffect_dCore_drunPure ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (fun s -> (try prerr_string s; flush stderr; String.length s with _ -> 0)) dtio_0)) dtb__3)))
  | _ -> failwith "DT: impossible branch"
))

# 56 "Base/Effect/Console.vuna"
let v_Base_dEffect_dConsole_dhandleConsoleHostHost = (fun n comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCoreAt "console") n) (fun a -> a)) v_Base_dEffect_dConsole_dconsoleOpHIOHost) comp))

# 61 "Base/Effect/Console.vuna"
let v_Base_dEffect_dConsole_drunConsoleHost = (fun comp -> ((v_Base_dEffect_dConsole_dhandleConsoleHostHost "default") comp))
