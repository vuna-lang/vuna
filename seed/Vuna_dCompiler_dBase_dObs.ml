open Vuna_runtime
# 27 "Vuna/Compiler/Base/Obs.vuna"
let v_Vuna_dCompiler_dBase_dObs_dobsCheck = (fun (name : string) f -> (((dtp_obs_span name) "vuna.phase") (fun (u : int) -> (f u))))

# 33 "Vuna/Compiler/Base/Obs.vuna"
let v_Vuna_dCompiler_dBase_dObs_dobsDefCheck = (fun (name : string) (def : string) f -> (if ((Base_dData_dObs.v_Base_dData_dObs_dobsLevel 0) > 1) then ((((dtp_obs_span_lab name) "vuna.def") def) (fun (u : int) -> (f u))) else (f 0)))

# 38 "Vuna/Compiler/Base/Obs.vuna"
let v_Vuna_dCompiler_dBase_dObs_dobsMarkEff = (fun (name : string) -> (Base_dEffect_dCore.v_Base_dEffect_dCore_deffPrim (fun (_u : int) -> (Base_dData_dObs.v_Base_dData_dObs_dobsMark name))))

# 44 "Vuna/Compiler/Base/Obs.vuna"
let v_Vuna_dCompiler_dBase_dObs_dobsCountEff = (fun (name : string) (v : int) -> (Base_dEffect_dCore.v_Base_dEffect_dCore_deffPrim (fun (_u : int) -> ((Base_dData_dObs.v_Base_dData_dObs_dobsCounter name) v))))
