open Vuna_runtime
# 25 "Vuna/Compiler/Base/Obs.vuna"
let v_obsLevel = (fun (n : int) -> (dtp_obs_level n))

# 29 "Vuna/Compiler/Base/Obs.vuna"
let v_obsCounter = (fun (name : string) (v : int) -> ((dtp_obs_counter name) v))

# 33 "Vuna/Compiler/Base/Obs.vuna"
let v_obsMark = (fun (name : string) -> (dtp_obs_mark name))

# 37 "Vuna/Compiler/Base/Obs.vuna"
let v_obsSpan = (fun (name : string) (cat : string) f -> (((dtp_obs_span name) cat) f))

# 41 "Vuna/Compiler/Base/Obs.vuna"
let v_obsSpanEff = (fun (name : string) (cat : string) action -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__0 = Obj.obj (e) in (let dtb__1 = Obj.obj ((k (dtb__0 u))) in (dtb__1 u)))))) (let x = ((dtp_obs_span_begin name) cat) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))) (fun tok -> ((B_dEffect_dCore.v_finally action) (let x = (dtp_obs_span_end tok) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))

# 48 "Vuna/Compiler/Base/Obs.vuna"
let v_obsSampleStart = (fun (mode : string) (intervalUs : int) -> ((dtp_obs_sample_start mode) intervalUs))

# 52 "Vuna/Compiler/Base/Obs.vuna"
let v_obsSampleStop = (fun (n : int) -> (dtp_obs_sample_stop n))

# 60 "Vuna/Compiler/Base/Obs.vuna"
let v_obsCheck = (fun (name : string) f -> (((v_obsSpan name) "vuna.phase") f))

# 65 "Vuna/Compiler/Base/Obs.vuna"
let v_obsPure = (fun (name : string) f -> (((v_obsSpan name) "vuna.phase") f))

# 71 "Vuna/Compiler/Base/Obs.vuna"
let v_obsCountAt = (fun (minLevel : int) (name : string) (v : int) -> (if ((v_obsLevel 0) >= minLevel) then ((v_obsCounter name) v) else 0))

# 77 "Vuna/Compiler/Base/Obs.vuna"
let v_obsDefCheckAt = (fun (minLevel : int) (name : string) (def : string) f -> (if ((v_obsLevel 0) >= minLevel) then ((((dtp_obs_span_lab name) "vuna.def") def) (fun (u : int) -> (f u))) else (f 0)))

# 82 "Vuna/Compiler/Base/Obs.vuna"
let v_obsDefCheck = (fun (name : string) (def : string) f -> ((((v_obsDefCheckAt 2) name) def) f))

# 86 "Vuna/Compiler/Base/Obs.vuna"
let v_obsMarkEff = (fun (name : string) -> (B_dEffect_dCore.v_effPrim (fun (_u : int) -> (v_obsMark name))))

# 92 "Vuna/Compiler/Base/Obs.vuna"
let v_obsCountEff = (fun (name : string) (v : int) -> (B_dEffect_dCore.v_effPrim (fun (_u : int) -> ((v_obsCounter name) v))))
