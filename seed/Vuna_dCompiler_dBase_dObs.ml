open Vuna_runtime
# 27 "Vuna/Compiler/Base/Obs.vuna"
let v_Vuna_dCompiler_dBase_dObs_dobsCheck = (fun name f -> (((dtp_obs_span name) "vuna.phase") (fun u -> (f u))))

# 33 "Vuna/Compiler/Base/Obs.vuna"
let v_Vuna_dCompiler_dBase_dObs_dobsDefCheck = (fun name def f -> (if ((Base_dData_dObs.v_Base_dData_dObs_dobsLevel 0) > 1) then ((((dtp_obs_span_lab name) "vuna.def") def) (fun u -> (f u))) else (f 0)))

# 38 "Vuna/Compiler/Base/Obs.vuna"
let v_Vuna_dCompiler_dBase_dObs_dobsMarkEff = (fun name -> (Base_dEffect_dCore.v_Base_dEffect_dCore_deffPrim (fun _u -> (Base_dData_dObs.v_Base_dData_dObs_dobsMark name))))

# 44 "Vuna/Compiler/Base/Obs.vuna"
let v_Vuna_dCompiler_dBase_dObs_dobsCountEff = (fun name v -> (Base_dEffect_dCore.v_Base_dEffect_dCore_deffPrim (fun _u -> ((Base_dData_dObs.v_Base_dData_dObs_dobsCounter name) v))))
