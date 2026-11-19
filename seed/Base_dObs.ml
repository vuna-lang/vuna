open Vuna_runtime
# 27 "Vuna/Compiler/Base/Obs.vuna"
let v_obsCheck = (fun (name : string) f -> (((dtp_obs_span name) "vuna.phase") (fun (u : int) -> (f u))))

# 33 "Vuna/Compiler/Base/Obs.vuna"
let v_obsDefCheck = (fun (name : string) (def : string) f -> (if ((B_dData_dObs.v_obsLevel 0) > 1) then ((((dtp_obs_span_lab name) "vuna.def") def) (fun (u : int) -> (f u))) else (f 0)))

# 38 "Vuna/Compiler/Base/Obs.vuna"
let v_obsMarkEff = (fun (name : string) -> (B_dEffect_dCore.v_effPrim (fun (_u : int) -> (B_dData_dObs.v_obsMark name))))

# 44 "Vuna/Compiler/Base/Obs.vuna"
let v_obsCountEff = (fun (name : string) (v : int) -> (B_dEffect_dCore.v_effPrim (fun (_u : int) -> ((B_dData_dObs.v_obsCounter name) v))))
