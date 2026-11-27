open Vuna_runtime
type t_TtyOp = C_TtyOp_IsTty

# 21 "Base/Effect/Tty.vuna"
let v_ttyIsTty = (fun (dtb_u_u1 : string) -> (((((B_dEffect_dCore.v_sendCoreId "tty") dtb_u_u1) 808136164) (dtp_effectId dtb_u_u1)) C_TtyOp_IsTty))

# 21 "Base/Effect/Tty.vuna"
let v_ttyIsTty_u_udirect = (fun (n : string) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "tty") n) 808136164) (dtp_effectId n)) C_TtyOp_IsTty)) _u_ueffTok))

# 25 "Base/Effect/Tty.vuna"
let v_handleTty = (fun (dtb_u_u9 : string) dtb_u_u11 dtb_u_u12 dtb_u_u13 -> (((((((B_dEffect_dCore.v_handleCoreId "tty") dtb_u_u9) 808136164) (dtp_effectId dtb_u_u9)) dtb_u_u11) (Obj.magic dtb_u_u12)) dtb_u_u13))

# 25 "Base/Effect/Tty.vuna"
let v_handleTty_u_udirect = (fun (n : string) ret opH comp _u_ueffTok -> ((Obj.magic (((((((B_dEffect_dCore.v_handleCoreId "tty") n) 808136164) (dtp_effectId n)) ret) (Obj.magic opH)) comp)) _u_ueffTok))

# 32 "Base/Effect/Tty.vuna"
let v_ttyOpHIOHost = (fun (dtb_u_u16 : t_TtyOp) dtb_u_u17 -> (match dtb_u_u16 with
  | C_TtyOp_IsTty -> (Obj.repr ((fun (dtb_u_u22 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u23 = Obj.obj ((Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_isTty ())))) in (let dtb_u_u25 = (dtb_u_u23 dtb_u_u22) in ((Obj.magic ((Obj.magic dtb_u_u17) dtb_u_u25)) dtb_u_u22))))))
  | _ -> failwith "DT: impossible branch"
))

# 32 "Base/Effect/Tty.vuna"
let v_ttyOpHIOHost_u_udirect = (fun (op : t_TtyOp) k _u_ueffTok -> (match op with
  | C_TtyOp_IsTty -> (let dtb_u_u23 = Obj.obj ((Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_isTty ())))) in (let dtb_u_u25 = (dtb_u_u23 _u_ueffTok) in ((Obj.magic ((Obj.magic k) dtb_u_u25)) _u_ueffTok)))
  | _ -> failwith "DT: impossible branch"
))

# 41 "Base/Effect/Tty.vuna"
let v_handleTtyHostHost = (fun (dtb_u_u28 : string) dtb_u_u29 -> (((((((B_dEffect_dCore.v_handleCoreAtId "tty") dtb_u_u28) 808136164) (dtp_effectId dtb_u_u28)) (fun dtb_u_u30 -> (let dtb_u_u32 = dtb_u_u30 in (Obj.repr ((fun (dtb_u_u33 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u32)))))) v_ttyOpHIOHost) dtb_u_u29))

# 41 "Base/Effect/Tty.vuna"
let v_handleTtyHostHost_u_udirect = (fun (n : string) comp _u_ueffTok -> ((Obj.magic (((((((B_dEffect_dCore.v_handleCoreAtId "tty") n) 808136164) (dtp_effectId n)) (fun dtb_u_u30 -> (let dtb_u_u32 = dtb_u_u30 in (Obj.repr ((fun (dtb_u_u33 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u32)))))) v_ttyOpHIOHost) comp)) _u_ueffTok))

# 45 "Base/Effect/Tty.vuna"
let v_runTtyHost = (fun dtb_u_u36 -> (B_dEffect_dCore.v_joinEff ((v_handleTtyHostHost "default") dtb_u_u36)))

# 45 "Base/Effect/Tty.vuna"
let v_runTtyHost_u_udirect = (fun comp _u_ueffTok -> ((Obj.magic (B_dEffect_dCore.v_joinEff ((v_handleTtyHostHost "default") comp))) _u_ueffTok))

# 49 "Base/Effect/Tty.vuna"
let v_runTtyEff = (fun dtb_u_u38 -> (B_dEffect_dHost.v_hostSync (v_runTtyHost dtb_u_u38)))

# 49 "Base/Effect/Tty.vuna"
let v_runTtyEff_u_udirect = (fun comp _u_ueffTok -> ((Obj.magic (B_dEffect_dHost.v_hostSync (v_runTtyHost comp))) _u_ueffTok))
