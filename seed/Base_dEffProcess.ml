open Vuna_runtime
type t_Base_dEffProcess_dProcessOp = C_Base_dEffProcess_dProcessOp_Args | C_Base_dEffProcess_dProcessOp_Exit of (int) | C_Base_dEffProcess_dProcessOp_RunIn of (string) * (string Base_dList.t_Base_dList_dList)

let v_Base_dEffProcess_dprocessArgs = (fun n -> (((Base_dEff.v_Base_dEff_dsendCore "process") n) C_Base_dEffProcess_dProcessOp_Args))

let v_Base_dEffProcess_dprocessExit = (fun n c -> (((Base_dEff.v_Base_dEff_dsendCore "process") n) (C_Base_dEffProcess_dProcessOp_Exit (c))))

let v_Base_dEffProcess_dprocessRunIn = (fun n dir args -> (((Base_dEff.v_Base_dEff_dsendCore "process") n) (C_Base_dEffProcess_dProcessOp_RunIn (dir, args))))

let v_Base_dEffProcess_dhandleProcess = (fun n ret opH comp -> (((((Base_dEff.v_Base_dEff_dhandleCore "process") n) ret) (Obj.magic opH)) comp))

let v_Base_dEffProcess_dprocessOpHIOWith = (fun onExit op k -> (match op with
  | C_Base_dEffProcess_dProcessOp_Args -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (Base_dList.dtp_listOf (dtp_getArgs ()))))) (fun xs -> ((Obj.magic k) xs)))
  | C_Base_dEffProcess_dProcessOp_Exit (dtb__0) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (onExit dtb__0)) (fun r -> ((Obj.magic k) r)))
  | C_Base_dEffProcess_dProcessOp_RunIn (dtb__1, dtb__2) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun dir args -> dtp_runIn dir (Base_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) dtb__1) dtb__2)) (fun c -> ((Obj.magic k) c)))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dEffProcess_dhandleProcessHostWith = (fun n onExit comp -> ((((v_Base_dEffProcess_dhandleProcess n) (fun a -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) a))) (v_Base_dEffProcess_dprocessOpHIOWith onExit)) comp))

let v_Base_dEffProcess_dprocessOpHIOWithHost = (fun onExit op k -> (match op with
  | C_Base_dEffProcess_dProcessOp_Args -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (Base_dList.dtp_listOf (dtp_getArgs ()))))) (fun xs -> ((Obj.magic k) xs)))
  | C_Base_dEffProcess_dProcessOp_Exit (dtb__3) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (onExit dtb__3)) (fun r -> ((Obj.magic k) r)))
  | C_Base_dEffProcess_dProcessOp_RunIn (dtb__4, dtb__5) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun dir args -> dtp_runIn dir (Base_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) dtb__4) dtb__5)) (fun c -> ((Obj.magic k) c)))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dEffProcess_dhandleProcessHostWithHost = (fun n onExit comp -> ((((v_Base_dEffProcess_dhandleProcess n) (fun a -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) a))) (v_Base_dEffProcess_dprocessOpHIOWithHost onExit)) comp))

let v_Base_dEffProcess_drunProcessHost = (fun comp -> (Base_dEff.v_Base_dEff_djoinEff (((v_Base_dEffProcess_dhandleProcessHostWithHost "default") (fun c -> ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_exit dtio_0)) c))) comp)))
