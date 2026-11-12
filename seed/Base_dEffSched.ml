open Vuna_runtime
type t_Base_dEffSched_dTask = C_Base_dEffSched_dTask_MkTask of (int)
and t_Base_dEffSched_dScope = C_Base_dEffSched_dScope_MkScope of (int)
and t_Base_dEffSched_dTaskLin = C_Base_dEffSched_dTaskLin_MkTaskLin of (int)

let v_Base_dEffSched_dtaskId = (fun mc0 -> (match mc0 with
  | C_Base_dEffSched_dTask_MkTask (dtb__0) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dEffSched_dscopeId = (fun mc0 -> (match mc0 with
  | C_Base_dEffSched_dScope_MkScope (dtb__1) -> dtb__1
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dEffSched_dyieldNow = (Base_dEff.v_Base_dEff_deffPrim (fun _u -> ((fun _ -> dtp_sched_yield ()) 0)))

let v_Base_dEffSched_disCancelled = (Base_dEff.v_Base_dEff_deffPrim (fun _u -> ((fun _ -> dtp_sched_is_cancelled ()) 0)))

let v_Base_dEffSched_dnewScope = (Base_dEff.v_Base_dEff_deffPrim (fun _u -> (C_Base_dEffSched_dScope_MkScope (((fun _ -> dtp_sched_new_scope ()) 0)))))

let v_Base_dEffSched_dforkTask = (fun sc child -> (Base_dEff.v_Base_dEff_deffPrim (fun _u -> (C_Base_dEffSched_dTask_MkTask ((((fun sc th -> dtp_sched_fork sc th) (v_Base_dEffSched_dscopeId sc)) (fun _u -> (Base_dEff.v_Base_dEff_drunPure child))))))))

let v_Base_dEffSched_dawaitTask = (fun t -> (match t with
  | C_Base_dEffSched_dTask_MkTask (dtb__2) -> (Base_dEff.v_Base_dEff_deffPrim (fun _u -> ((fun st -> (if (st <= 0) then (Base_dResult.C_Base_dResult_dResult_Ok (((fun id -> Obj.obj (dtp_sched_task_result id)) dtb__2))) else (if (st <= 1) then (Base_dResult.C_Base_dResult_dResult_Err ("cancelled")) else (Base_dResult.C_Base_dResult_dResult_Err ((dtp_sched_task_error dtb__2)))))) (dtp_sched_await dtb__2))))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dEffSched_dcancelTask = (fun t -> (match t with
  | C_Base_dEffSched_dTask_MkTask (dtb__3) -> (Base_dEff.v_Base_dEff_deffPrim (fun _u -> (dtp_sched_cancel_task_prim dtb__3)))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dEffSched_dcancelScope = (fun sc -> (Base_dEff.v_Base_dEff_deffPrim (fun _u -> (dtp_sched_cancel_scope (v_Base_dEffSched_dscopeId sc)))))

let v_Base_dEffSched_dscopeWait = (fun sc -> (Base_dEff.v_Base_dEff_deffPrim (fun _u -> ((fun id -> ((fun st -> (if (st <= 0) then (Base_dResult.C_Base_dResult_dResult_Ok ((dtp_sched_scope_count id))) else (if (st <= 1) then (Base_dResult.C_Base_dResult_dResult_Err ((dtp_sched_scope_error id))) else (if (st <= 2) then (Base_dResult.C_Base_dResult_dResult_Err ("timeout")) else (Base_dResult.C_Base_dResult_dResult_Err ("cancelled")))))) (dtp_sched_scope_wait id))) (v_Base_dEffSched_dscopeId sc)))))

let v_Base_dEffSched_dscopeWaitTimeout = (fun steps sc -> (Base_dEff.v_Base_dEff_deffPrim (fun _u -> ((fun id -> ((fun st -> (if (st <= 0) then (Base_dResult.C_Base_dResult_dResult_Ok ((dtp_sched_scope_count id))) else (if (st <= 1) then (Base_dResult.C_Base_dResult_dResult_Err ((dtp_sched_scope_error id))) else (if (st <= 2) then (Base_dResult.C_Base_dResult_dResult_Err ("timeout")) else (Base_dResult.C_Base_dResult_dResult_Err ("cancelled")))))) ((dtp_sched_scope_wait_timeout steps) id))) (v_Base_dEffSched_dscopeId sc)))))

let v_Base_dEffSched_dwithScope = (fun body -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffSched_dnewScope) (fun sc -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (body sc)) (fun res -> (match res with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__4) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Base_dEffSched_dscopeWait sc)) (fun w -> (match w with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__5) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dResult.C_Base_dResult_dResult_Ok (dtb__4)))
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__6) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dResult.C_Base_dResult_dResult_Err (dtb__6)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__7) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Base_dEffSched_dcancelScope sc)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Base_dEffSched_dscopeWait sc)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dResult.C_Base_dResult_dResult_Err (dtb__7)))))))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Base_dEffSched_dwithScopeTimeout = (fun steps body -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffSched_dnewScope) (fun sc -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (body sc)) (fun res -> (match res with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__8) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Base_dEffSched_dscopeWaitTimeout steps) sc)) (fun w -> (match w with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__9) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dResult.C_Base_dResult_dResult_Ok (dtb__8)))
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__10) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dResult.C_Base_dResult_dResult_Err (dtb__10)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__11) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Base_dEffSched_dcancelScope sc)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Base_dEffSched_dscopeWaitTimeout steps) sc)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dResult.C_Base_dResult_dResult_Err (dtb__11)))))))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Base_dEffSched_dforkTaskLin = (fun sc child -> (C_Base_dEffSched_dTaskLin_MkTaskLin ((((fun sc th -> dtp_sched_fork sc th) (v_Base_dEffSched_dscopeId sc)) (fun _u -> (Base_dEff.v_Base_dEff_drunPure child))))))

let v_Base_dEffSched_dawaitTaskLin = (fun t -> (match t with
  | C_Base_dEffSched_dTaskLin_MkTaskLin (dtb__12) -> (v_Base_dEffSched_dawaitTask (C_Base_dEffSched_dTask_MkTask (dtb__12)))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dEffSched_dcancelTaskLin = (fun t -> (match t with
  | C_Base_dEffSched_dTaskLin_MkTaskLin (dtb__13) -> (v_Base_dEffSched_dcancelTask (C_Base_dEffSched_dTask_MkTask (dtb__13)))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dEffSched_dforkTaskWith = (fun sc handler comp -> ((v_Base_dEffSched_dforkTask sc) (handler comp)))
