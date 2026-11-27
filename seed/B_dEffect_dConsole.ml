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
  | C_ConsoleOp_Print (dtb__0) -> ((Obj.magic k) (bi_natFromInt (B_dEffect_dHost.v_runHost ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_print dtio_0)) dtb__0))))
  | C_ConsoleOp_EPrint (dtb__1) -> ((Obj.magic k) (B_dEffect_dHost.v_runHost ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_eprint dtio_0)) dtb__1)))
  | _ -> failwith "DT: impossible branch"
))

# 45 "Base/Effect/Console.vuna"
let v_consoleOpHILib = (fun (op : t_ConsoleOp) k -> (match op with
  | C_ConsoleOp_Print (dtb__2) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__3 = Obj.obj (e) in (let dtb__4 = Obj.obj ((k (dtb__3 u))) in (dtb__4 u)))))) (((fun f e -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__5 = Obj.obj (e) in (f (dtb__5 u)))))) bi_natFromInt) ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_print dtio_0)) dtb__2))) (fun r -> ((Obj.magic k) r)))
  | C_ConsoleOp_EPrint (dtb__6) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__7 = Obj.obj (e) in (let dtb__8 = Obj.obj ((k (dtb__7 u))) in (dtb__8 u)))))) ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_eprint dtio_0)) dtb__6)) (fun r -> ((Obj.magic k) r)))
  | _ -> failwith "DT: impossible branch"
))

# 58 "Base/Effect/Console.vuna"
let v_handleConsoleHostHost = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "console") n) 775068458) (dtp_effectId n)) (fun a -> (let x = a in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) v_consoleOpHILib) comp))

# 64 "Base/Effect/Console.vuna"
let v_runConsoleHost = (fun comp -> (B_dEffect_dCore.v_joinEff ((v_handleConsoleHostHost "default") comp)))

# 68 "Base/Effect/Console.vuna"
let v_runConsoleEff = (fun comp -> (B_dEffect_dHost.v_hostSync (v_runConsoleHost comp)))
