open Vuna_runtime
type t_Base_dEffArgs_dArgsOp = C_Base_dEffArgs_dArgsOp_GetArgs

let v_Base_dEffArgs_dargsGetArgs = (fun n -> (((Base_dEff.v_Base_dEff_dsendCore "args") n) C_Base_dEffArgs_dArgsOp_GetArgs))

let v_Base_dEffArgs_dhandleArgs = (fun n ret opH comp -> (((((Base_dEff.v_Base_dEff_dhandleCore "args") n) ret) (Obj.magic opH)) comp))

let v_Base_dEffArgs_dargsOpHIO = (fun op k -> (match op with
  | C_Base_dEffArgs_dArgsOp_GetArgs -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (Base_dList.dtp_listOf (dtp_getArgs ()))))) (fun xs -> ((Obj.magic k) xs)))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dEffArgs_dhandleArgsHost = (fun n comp -> ((((v_Base_dEffArgs_dhandleArgs n) (fun a -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) a))) v_Base_dEffArgs_dargsOpHIO) comp))

let v_Base_dEffArgs_drunArgs = (fun n comp -> (Base_dEff.v_Base_dEff_djoinEffNilOuter ((v_Base_dEffArgs_dhandleArgsHost n) comp)))

let v_Base_dEffArgs_dargsOpHIOHost = (fun op k -> (match op with
  | C_Base_dEffArgs_dArgsOp_GetArgs -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (Base_dList.dtp_listOf (dtp_getArgs ()))))) (fun xs -> ((Obj.magic k) xs)))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dEffArgs_dhandleArgsHostHost = (fun n comp -> ((((v_Base_dEffArgs_dhandleArgs n) (fun a -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) a))) v_Base_dEffArgs_dargsOpHIOHost) comp))

let v_Base_dEffArgs_drunArgsHost = (fun comp -> (Base_dEff.v_Base_dEff_djoinEff ((v_Base_dEffArgs_dhandleArgsHostHost "default") comp)))
