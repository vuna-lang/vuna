open Vuna_runtime
# 25 "Vuna/Compiler/Base/Obs.vuna"
let v_obsLevel = (fun (dtb_u_u1 : int) -> (dtp_obs_level dtb_u_u1))

# 29 "Vuna/Compiler/Base/Obs.vuna"
let v_obsCounter = (fun (dtb_u_u2 : string) (dtb_u_u3 : int) -> ((dtp_obs_counter dtb_u_u2) dtb_u_u3))

# 33 "Vuna/Compiler/Base/Obs.vuna"
let v_obsMark = (fun (dtb_u_u4 : string) -> (dtp_obs_mark dtb_u_u4))

# 37 "Vuna/Compiler/Base/Obs.vuna"
let v_obsSpan = (fun (dtb_u_u6 : string) (dtb_u_u7 : string) dtb_u_u8 -> (((dtp_obs_span dtb_u_u6) dtb_u_u7) dtb_u_u8))

# 41 "Vuna/Compiler/Base/Obs.vuna"
let v_obsSpanEff = (fun (dtb_u_u11 : string) (dtb_u_u12 : string) dtb_u_u13 -> (Obj.repr ((fun (dtb_u_u18 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u19 = Obj.obj ((let dtb_u_u22 = ((dtp_obs_span_begin dtb_u_u11) dtb_u_u12) in (Obj.repr ((fun (dtb_u_u23 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u22))))) in (let dtb_u_u24 = (dtb_u_u19 dtb_u_u18) in ((Obj.magic ((B_dEffect_dCore.v_finally dtb_u_u13) (let dtb_u_u26 = (dtp_obs_span_end dtb_u_u24) in (Obj.repr ((fun (dtb_u_u27 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u26)))))) dtb_u_u18)))))))

# 41 "Vuna/Compiler/Base/Obs.vuna"
let v_obsSpanEff_u_udirect = (fun (name : string) (cat : string) action _u_ueffTok -> (let dtb_u_u19 = Obj.obj ((let dtb_u_u22 = ((dtp_obs_span_begin name) cat) in (Obj.repr ((fun (dtb_u_u23 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u22))))) in (let dtb_u_u24 = (dtb_u_u19 _u_ueffTok) in ((Obj.magic ((B_dEffect_dCore.v_finally action) (let dtb_u_u26 = (dtp_obs_span_end dtb_u_u24) in (Obj.repr ((fun (dtb_u_u27 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u26)))))) _u_ueffTok))))

# 48 "Vuna/Compiler/Base/Obs.vuna"
let v_obsSampleStart = (fun (dtb_u_u28 : string) (dtb_u_u29 : int) -> ((dtp_obs_sample_start dtb_u_u28) dtb_u_u29))

# 52 "Vuna/Compiler/Base/Obs.vuna"
let v_obsSampleStop = (fun (dtb_u_u30 : int) -> (dtp_obs_sample_stop dtb_u_u30))

# 60 "Vuna/Compiler/Base/Obs.vuna"
let v_obsCheck = (fun (dtb_u_u32 : string) dtb_u_u33 -> (((v_obsSpan dtb_u_u32) "vuna.phase") dtb_u_u33))

# 65 "Vuna/Compiler/Base/Obs.vuna"
let v_obsPure = (fun (dtb_u_u35 : string) dtb_u_u36 -> (((v_obsSpan dtb_u_u35) "vuna.phase") dtb_u_u36))

# 71 "Vuna/Compiler/Base/Obs.vuna"
let v_obsCountAt = (fun (dtb_u_u37 : int) (dtb_u_u38 : string) (dtb_u_u39 : int) -> (if ((v_obsLevel 0) >= dtb_u_u37) then ((v_obsCounter dtb_u_u38) dtb_u_u39) else 0))

# 77 "Vuna/Compiler/Base/Obs.vuna"
let v_obsDefCheckAt = (fun (dtb_u_u41 : int) (dtb_u_u42 : string) (dtb_u_u43 : string) dtb_u_u44 -> (if ((v_obsLevel 0) >= dtb_u_u41) then ((((dtp_obs_span_lab dtb_u_u42) "vuna.def") dtb_u_u43) (fun (dtb_u_u45 : int) -> (dtb_u_u44 dtb_u_u45))) else (dtb_u_u44 0)))

# 82 "Vuna/Compiler/Base/Obs.vuna"
let v_obsDefCheck = (fun (dtb_u_u47 : string) (dtb_u_u48 : string) dtb_u_u49 -> ((((v_obsDefCheckAt 2) dtb_u_u47) dtb_u_u48) dtb_u_u49))

# 86 "Vuna/Compiler/Base/Obs.vuna"
let v_obsMarkEff = (fun (dtb_u_u51 : string) -> (B_dEffect_dCore.v_effPrim (fun (dtb_u_u52 : int) -> (v_obsMark dtb_u_u51))))

# 86 "Vuna/Compiler/Base/Obs.vuna"
let v_obsMarkEff_u_udirect = (fun (name : string) _u_ueffTok -> ((Obj.magic (B_dEffect_dCore.v_effPrim (fun (dtb_u_u52 : int) -> (v_obsMark name)))) _u_ueffTok))

# 92 "Vuna/Compiler/Base/Obs.vuna"
let v_obsCountEff = (fun (dtb_u_u54 : string) (dtb_u_u55 : int) -> (B_dEffect_dCore.v_effPrim (fun (dtb_u_u56 : int) -> ((v_obsCounter dtb_u_u54) dtb_u_u55))))

# 92 "Vuna/Compiler/Base/Obs.vuna"
let v_obsCountEff_u_udirect = (fun (name : string) (v : int) _u_ueffTok -> ((Obj.magic (B_dEffect_dCore.v_effPrim (fun (dtb_u_u56 : int) -> ((v_obsCounter name) v)))) _u_ueffTok))
