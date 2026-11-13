open Vuna_runtime
type t_Base_dEffConsole_dConsoleOp = C_Base_dEffConsole_dConsoleOp_Print of (string) | C_Base_dEffConsole_dConsoleOp_EPrint of (string)

let v_Base_dEffConsole_dconsolePrint = (fun n s -> (((Base_dEff.v_Base_dEff_dsendCore "console") n) (C_Base_dEffConsole_dConsoleOp_Print (s))))

let v_Base_dEffConsole_dconsoleEprint = (fun n s -> (((Base_dEff.v_Base_dEff_dsendCore "console") n) (C_Base_dEffConsole_dConsoleOp_EPrint (s))))

let v_Base_dEffConsole_dhandleConsole = (fun n ret opH comp -> (((((Base_dEff.v_Base_dEff_dhandleCore "console") n) ret) (Obj.magic opH)) comp))

let v_Base_dEffConsole_dconsoleOpHIO = (fun op k -> (match op with
  | C_Base_dEffConsole_dConsoleOp_Print (dtb__0) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dMonad.v_Base_dMonad_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) bi_natFromInt) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) dtb__0))) (fun r -> ((Obj.magic k) r)))
  | C_Base_dEffConsole_dConsoleOp_EPrint (dtb__1) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun s -> prerr_string s; flush stderr; String.length s) dtio_0)) dtb__1)) (fun r -> ((Obj.magic k) r)))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dEffConsole_dconsoleOpHIOHost = (fun op k -> (match op with
  | C_Base_dEffConsole_dConsoleOp_Print (dtb__2) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dMonad.v_Base_dMonad_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) bi_natFromInt) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) dtb__2))) (fun r -> ((Obj.magic k) r)))
  | C_Base_dEffConsole_dConsoleOp_EPrint (dtb__3) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun s -> prerr_string s; flush stderr; String.length s) dtio_0)) dtb__3))) (fun r -> ((Obj.magic k) r)))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dEffConsole_dhandleConsoleHostHost = (fun n comp -> ((((v_Base_dEffConsole_dhandleConsole n) (fun a -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) a))) v_Base_dEffConsole_dconsoleOpHIOHost) comp))

let v_Base_dEffConsole_drunConsoleHost = (fun comp -> (Base_dEff.v_Base_dEff_djoinEff ((v_Base_dEffConsole_dhandleConsoleHostHost "default") comp)))
