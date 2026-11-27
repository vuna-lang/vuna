open Vuna_runtime
type t_ConsoleOp = C_ConsoleOp_Print of (string) | C_ConsoleOp_EPrint of (string)

# 22 "Base/Effect/Console.vuna"
let v_consolePrint = (fun (dtb_u_u1 : string) (dtb_u_u4 : string) -> (((((B_dEffect_dCore.v_sendCoreId "console") dtb_u_u1) 775068458) (dtp_effectId dtb_u_u1)) (C_ConsoleOp_Print (dtb_u_u4))))

# 22 "Base/Effect/Console.vuna"
let v_consolePrint_u_udirect = (fun (n : string) (s : string) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "console") n) 775068458) (dtp_effectId n)) (C_ConsoleOp_Print (s)))) _u_ueffTok))

# 26 "Base/Effect/Console.vuna"
let v_consoleEprint = (fun (dtb_u_u5 : string) (dtb_u_u8 : string) -> (((((B_dEffect_dCore.v_sendCoreId "console") dtb_u_u5) 775068458) (dtp_effectId dtb_u_u5)) (C_ConsoleOp_EPrint (dtb_u_u8))))

# 26 "Base/Effect/Console.vuna"
let v_consoleEprint_u_udirect = (fun (n : string) (s : string) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "console") n) 775068458) (dtp_effectId n)) (C_ConsoleOp_EPrint (s)))) _u_ueffTok))

# 30 "Base/Effect/Console.vuna"
let v_handleConsole = (fun (dtb_u_u14 : string) dtb_u_u16 dtb_u_u17 dtb_u_u18 -> (((((((B_dEffect_dCore.v_handleCoreId "console") dtb_u_u14) 775068458) (dtp_effectId dtb_u_u14)) dtb_u_u16) (Obj.magic dtb_u_u17)) dtb_u_u18))

# 30 "Base/Effect/Console.vuna"
let v_handleConsole_u_udirect = (fun (n : string) ret opH comp _u_ueffTok -> ((Obj.magic (((((((B_dEffect_dCore.v_handleCoreId "console") n) 775068458) (dtp_effectId n)) ret) (Obj.magic opH)) comp)) _u_ueffTok))

# 38 "Base/Effect/Console.vuna"
let v_consoleOpHIOHost = (fun (dtb_u_u21 : t_ConsoleOp) dtb_u_u22 -> (match dtb_u_u21 with
  | C_ConsoleOp_Print (dtb_u_u23) -> ((Obj.magic dtb_u_u22) (bi_natFromInt (B_dEffect_dHost.v_runHost ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_print dtio_0)) dtb_u_u23))))
  | C_ConsoleOp_EPrint (dtb_u_u24) -> ((Obj.magic dtb_u_u22) (B_dEffect_dHost.v_runHost ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_eprint dtio_0)) dtb_u_u24)))
  | _ -> failwith "DT: impossible branch"
))

# 45 "Base/Effect/Console.vuna"
let v_consoleOpHILib = (fun (dtb_u_u27 : t_ConsoleOp) dtb_u_u28 -> (match dtb_u_u27 with
  | C_ConsoleOp_Print (dtb_u_u29) -> (Obj.repr ((fun (dtb_u_u34 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u35 = Obj.obj ((((fun dtb_u_u39 dtb_u_u40 -> (Obj.repr ((fun (dtb_u_u41 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u42 = Obj.obj (dtb_u_u40) in (dtb_u_u39 (dtb_u_u42 dtb_u_u41))))))) bi_natFromInt) ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_print dtio_0)) dtb_u_u29))) in (let dtb_u_u43 = (dtb_u_u35 dtb_u_u34) in ((Obj.magic ((Obj.magic dtb_u_u28) dtb_u_u43)) dtb_u_u34))))))
  | C_ConsoleOp_EPrint (dtb_u_u44) -> (Obj.repr ((fun (dtb_u_u49 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u50 = Obj.obj (((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_eprint dtio_0)) dtb_u_u44)) in (let dtb_u_u52 = (dtb_u_u50 dtb_u_u49) in ((Obj.magic ((Obj.magic dtb_u_u28) dtb_u_u52)) dtb_u_u49))))))
  | _ -> failwith "DT: impossible branch"
))

# 45 "Base/Effect/Console.vuna"
let v_consoleOpHILib_u_udirect = (fun (op : t_ConsoleOp) k _u_ueffTok -> (match op with
  | C_ConsoleOp_Print (dtb_u_u29) -> (let dtb_u_u35 = Obj.obj ((((fun dtb_u_u39 dtb_u_u40 -> (Obj.repr ((fun (dtb_u_u41 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u42 = Obj.obj (dtb_u_u40) in (dtb_u_u39 (dtb_u_u42 dtb_u_u41))))))) bi_natFromInt) ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_print dtio_0)) dtb_u_u29))) in (let dtb_u_u43 = (dtb_u_u35 _u_ueffTok) in ((Obj.magic ((Obj.magic k) dtb_u_u43)) _u_ueffTok)))
  | C_ConsoleOp_EPrint (dtb_u_u44) -> (let dtb_u_u50 = Obj.obj (((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_eprint dtio_0)) dtb_u_u44)) in (let dtb_u_u52 = (dtb_u_u50 _u_ueffTok) in ((Obj.magic ((Obj.magic k) dtb_u_u52)) _u_ueffTok)))
  | _ -> failwith "DT: impossible branch"
))

# 58 "Base/Effect/Console.vuna"
let v_handleConsoleHostHost = (fun (dtb_u_u55 : string) dtb_u_u56 -> (((((((B_dEffect_dCore.v_handleCoreAtId "console") dtb_u_u55) 775068458) (dtp_effectId dtb_u_u55)) (fun dtb_u_u57 -> (let dtb_u_u59 = dtb_u_u57 in (Obj.repr ((fun (dtb_u_u60 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u59)))))) v_consoleOpHILib) dtb_u_u56))

# 58 "Base/Effect/Console.vuna"
let v_handleConsoleHostHost_u_udirect = (fun (n : string) comp _u_ueffTok -> ((Obj.magic (((((((B_dEffect_dCore.v_handleCoreAtId "console") n) 775068458) (dtp_effectId n)) (fun dtb_u_u57 -> (let dtb_u_u59 = dtb_u_u57 in (Obj.repr ((fun (dtb_u_u60 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u59)))))) v_consoleOpHILib) comp)) _u_ueffTok))

# 64 "Base/Effect/Console.vuna"
let v_runConsoleHost = (fun dtb_u_u63 -> (B_dEffect_dCore.v_joinEff ((v_handleConsoleHostHost "default") dtb_u_u63)))

# 64 "Base/Effect/Console.vuna"
let v_runConsoleHost_u_udirect = (fun comp _u_ueffTok -> ((Obj.magic (B_dEffect_dCore.v_joinEff ((v_handleConsoleHostHost "default") comp))) _u_ueffTok))

# 68 "Base/Effect/Console.vuna"
let v_runConsoleEff = (fun dtb_u_u65 -> (B_dEffect_dHost.v_hostSync (v_runConsoleHost dtb_u_u65)))

# 68 "Base/Effect/Console.vuna"
let v_runConsoleEff_u_udirect = (fun comp _u_ueffTok -> ((Obj.magic (B_dEffect_dHost.v_hostSync (v_runConsoleHost comp))) _u_ueffTok))
