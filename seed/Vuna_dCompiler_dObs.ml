open Vuna_runtime
# 28 "Vuna/Compiler/Obs.vuna"
let v_Vuna_dCompiler_dObs_dobsCheck = (fun name f -> (((dtp_obs_span name) "vuna.phase") (fun u -> (f u))))

# 34 "Vuna/Compiler/Obs.vuna"
let v_Vuna_dCompiler_dObs_dobsDefCheck = (fun name def f -> (if ((Base_dObs.v_Base_dObs_dobsLevel 0) > 1) then ((((dtp_obs_span_lab name) "vuna.def") def) (fun u -> (f u))) else (f 0)))

# 39 "Vuna/Compiler/Obs.vuna"
let v_Vuna_dCompiler_dObs_dobsMarkEff = (fun name -> ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (Base_dEff.v_Base_dEff_deffPrim (fun _u -> (Base_dObs.v_Base_dObs_dobsMark name)))))
