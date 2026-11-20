open Vuna_runtime
# 27 "Vuna/Compiler/Base/Obs.vuna"
let v_obsCheck = (fun (name : string) f -> (((dtp_obs_span name) "vuna.phase") (fun (u : int) -> (f u))))

# 32 "Vuna/Compiler/Base/Obs.vuna"
let v_obsPure = (fun (name : string) f -> (((B_dData_dObs_dSpan.v_obsSpan name) "vuna.phase") f))

# 38 "Vuna/Compiler/Base/Obs.vuna"
let v_obsCountAt = (fun (minLevel : int) (name : string) (v : int) -> (if ((B_dData_dObs.v_obsLevel 0) >= minLevel) then ((B_dData_dObs.v_obsCounter name) v) else 0))

# 44 "Vuna/Compiler/Base/Obs.vuna"
let v_obsDefCheckAt = (fun (minLevel : int) (name : string) (def : string) f -> (if ((B_dData_dObs.v_obsLevel 0) >= minLevel) then ((((dtp_obs_span_lab name) "vuna.def") def) (fun (u : int) -> (f u))) else (f 0)))

# 49 "Vuna/Compiler/Base/Obs.vuna"
let v_obsDefCheck = (fun (name : string) (def : string) f -> ((((v_obsDefCheckAt 2) name) def) f))

# 53 "Vuna/Compiler/Base/Obs.vuna"
let v_obsMarkEff = (fun (name : string) -> (B_dEffect_dCore.v_effPrim (fun (_u : int) -> (B_dData_dObs.v_obsMark name))))

# 59 "Vuna/Compiler/Base/Obs.vuna"
let v_obsCountEff = (fun (name : string) (v : int) -> (B_dEffect_dCore.v_effPrim (fun (_u : int) -> ((B_dData_dObs.v_obsCounter name) v))))
