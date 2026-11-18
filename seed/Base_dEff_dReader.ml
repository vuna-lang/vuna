open Vuna_runtime
type t_Base_dEff_dReader_dReaderOp = C_Base_dEff_dReader_dReaderOp_Ask

# 17 "Base/Eff/Reader.vuna"
let v_Base_dEff_dReader_dask = (fun n -> (((Base_dEff.v_Base_dEff_dsendCore "reader") n) C_Base_dEff_dReader_dReaderOp_Ask))

# 21 "Base/Eff/Reader.vuna"
let v_Base_dEff_dReader_dreaderLocalOp = (fun env f op k -> (match op with
  | C_Base_dEff_dReader_dReaderOp_Ask -> ((Obj.magic k) (f env))
  | _ -> failwith "DT: impossible branch"
))

# 26 "Base/Eff/Reader.vuna"
let v_Base_dEff_dReader_dlocalWith = (fun n f env comp -> (Base_dEff.v_Base_dEff_dweaken (((((Base_dEff.v_Base_dEff_dhandleCoreAt "reader") n) (fun a -> a)) ((v_Base_dEff_dReader_dreaderLocalOp env) f)) comp)))

# 31 "Base/Eff/Reader.vuna"
let v_Base_dEff_dReader_dlocal = (fun n f comp -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Base_dEff_dReader_dask n)) (fun env -> ((((v_Base_dEff_dReader_dlocalWith n) f) env) comp))))

# 37 "Base/Eff/Reader.vuna"
let v_Base_dEff_dReader_dhandleReader = (fun n ret opH comp -> (((((Base_dEff.v_Base_dEff_dhandleCore "reader") n) ret) (Obj.magic opH)) comp))

# 41 "Base/Eff/Reader.vuna"
let v_Base_dEff_dReader_dhandleReaderLin = (fun n ret opH comp -> (((((Base_dEff.v_Base_dEff_dhandleCoreLin "reader") n) ret) opH) comp))
