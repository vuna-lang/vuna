open Vuna_runtime
type t_Vuna_dCompiler_dCodegen_dTerm_dGenSt = { f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsShared : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrShared; f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual : Vuna_dCompiler_dCodegen_dDecl.t_Vuna_dCompiler_dCodegen_dDecl_dQualCtx; f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsDeps : string Base_dList.t_Base_dList_dList }

let v_Vuna_dCompiler_dCodegen_dTerm_ddtSchedRuntime = "(* ------------------------------------------------------------------ *)\n(* W9: single-threaded cooperative fiber scheduler (Layer 3).          *)\n(*                                                                     *)\n(* Fibers are one-shot OCaml 5 continuations captured by the root      *)\n(* Effect.Deep handler installed for every fiber. The scheduler loop   *)\n(* outside the fibers decides what runs next; suspension is requested  *)\n(* through private runtime effects (SchedYield/SchedAwait/WaitScope).  *)\n(* Tasks are `Eff Nil a` thunks: their user effects are handled       *)\n(* inside the fiber, and only the scheduler primitives cross fibers.   *)\n(* ------------------------------------------------------------------ *)\n\ntype _ Effect.t +=\n  | SchedYield : int Effect.t\n  | SchedAwait : int -> int Effect.t\n  | SchedWaitScope : int -> int Effect.t\n  | SchedWaitScopeTimeout : int * int -> int Effect.t\n\ntype dtp_sched_step =\n  | SchedStepYield of Obj.t\n  | SchedStepAwait of int * Obj.t\n  | SchedStepScope of int * Obj.t\n  | SchedStepScopeTimeout of int * int * Obj.t\n  | SchedStepDone of Obj.t\n  | SchedStepFailed of exn * Printexc.raw_backtrace\n\ntype dtp_sched_wait = SchedWaitNone | SchedWaitTask of int | SchedWaitScope of int | SchedWaitTimed\n\ntype dtp_sched_state =\n  | SchedQueued of Obj.t\n  | SchedRunning\n  | SchedSuspended\n  | SchedDone of Obj.t\n  | SchedFailed of exn * Printexc.raw_backtrace\n  | SchedCancelled\n\ntype dtp_sched_task = {\n  sched_tid : int;\n  mutable sched_state : dtp_sched_state;\n  mutable sched_start : (unit -> Obj.t) option;\n  mutable sched_cont : Obj.t option;\n  sched_scope : int;\n  mutable sched_wait : dtp_sched_wait;\n  mutable sched_waiters : int list;\n  mutable sched_cancel : bool;\n  mutable sched_grace : int;\n}\n\ntype dtp_sched_scope = {\n  sched_sid : int;\n  mutable sched_tasks : int list;\n  mutable sched_failed : string option;\n  mutable sched_waiters : int list;\n  mutable sched_timeout : bool;\n  mutable sched_completed : int;\n}\n\nlet dtp_sched_tasks : (int, dtp_sched_task) Hashtbl.t = Hashtbl.create 64\nlet dtp_sched_scopes : (int, dtp_sched_scope) Hashtbl.t = Hashtbl.create 16\nlet dtp_sched_ready : int Queue.t = Queue.create ()\nlet dtp_sched_next_task = ref 0\nlet dtp_sched_next_scope = ref 0\nlet dtp_sched_timeouts : (int * int * int) list ref = ref []\nlet dtp_sched_main_tid = ref 0\nlet dtp_sched_current = ref (-1)\nlet dtp_sched_main_result : Obj.t option ref = ref None\nlet dtp_sched_main_exn : (exn * Printexc.raw_backtrace) option ref = ref None\nlet dtp_sched_grace_steps = 64\n\nlet dtp_sched_reset () =\n  Hashtbl.reset dtp_sched_tasks;\n  Hashtbl.reset dtp_sched_scopes;\n  dtp_cleanup_reset ();\n  Queue.clear dtp_sched_ready;\n  dtp_sched_next_task := 0;\n  dtp_sched_next_scope := 0;\n  dtp_sched_timeouts := [];\n  dtp_sched_main_tid := 0;\n  dtp_sched_current := -1;\n  dtp_sched_main_result := None;\n  dtp_sched_main_exn := None\n\nlet dtp_sched_task id =\n  match Hashtbl.find_opt dtp_sched_tasks id with\n  | Some t -> t\n  | None -> failwith \"scheduler: invalid task handle\"\n\nlet dtp_sched_scope id =\n  match Hashtbl.find_opt dtp_sched_scopes id with\n  | Some s -> s\n  | None -> failwith \"scheduler: invalid scope handle\"\n\nlet dtp_sched_exn_msg e =\n  match e with\n  | Effect.Unhandled (Perform (key, name, _)) ->\n    Printf.sprintf \"unhandled effect %s (instance %s)\" key name\n  | Failure m -> m\n  | _ -> Printexc.to_string e\n\nlet dtp_sched_task_status t =\n  if t.sched_cancel then 1\n  else match t.sched_state with\n    | SchedDone _ -> 0\n    | SchedFailed _ -> 2\n    | SchedCancelled -> 1\n    | _ -> 0\n\nlet dtp_sched_enqueue t v =\n  t.sched_state <- SchedQueued v;\n  Queue.push t.sched_tid dtp_sched_ready\n\nlet dtp_sched_wake_scope s =\n  if s.sched_tasks = [] && s.sched_waiters <> [] then begin\n    let status =\n      if s.sched_timeout then 2\n      else if s.sched_failed <> None then 1\n      else 0\n    in\n    let ws = s.sched_waiters in\n    s.sched_waiters <- [];\n    dtp_sched_timeouts := List.filter (fun (w, _, _) -> not (List.mem w ws)) !dtp_sched_timeouts;\n    List.iter (fun wid ->\n      let w = dtp_sched_task wid in\n      w.sched_wait <- SchedWaitNone;\n      dtp_sched_enqueue w (Obj.repr status)) ws\n  end\n\nlet dtp_sched_finish t st =\n  t.sched_state <- st;\n  t.sched_wait <- SchedWaitNone;\n  let ws = t.sched_waiters in\n  t.sched_waiters <- [];\n  let status = dtp_sched_task_status t in\n  List.iter (fun wid ->\n    let w = dtp_sched_task wid in\n    w.sched_wait <- SchedWaitNone;\n    dtp_sched_enqueue w (Obj.repr status)) ws;\n  if t.sched_tid = !dtp_sched_main_tid then begin\n    match st with\n    | SchedDone v -> dtp_sched_main_result := Some v\n    | SchedFailed (e, bt) -> dtp_sched_main_exn := Some (e, bt)\n    | _ -> ()\n  end;\n  match Hashtbl.find_opt dtp_sched_scopes t.sched_scope with\n  | Some s ->\n    s.sched_tasks <- List.filter (fun x -> x <> t.sched_tid) s.sched_tasks;\n    s.sched_completed <- s.sched_completed + 1;\n    dtp_sched_wake_scope s\n  | None -> ()\n\nlet dtp_sched_remove_waiter t =\n  match t.sched_wait with\n  | SchedWaitTask id ->\n    let tg = dtp_sched_task id in\n    tg.sched_waiters <- List.filter (fun x -> x <> t.sched_tid) tg.sched_waiters\n  | SchedWaitScope id ->\n    let s = dtp_sched_scope id in\n    s.sched_waiters <- List.filter (fun x -> x <> t.sched_tid) s.sched_waiters\n  | SchedWaitTimed | SchedWaitNone -> ()\n\nlet dtp_sched_cancel_task t =\n  let terminal = match t.sched_state with\n    | SchedDone _ | SchedFailed _ | SchedCancelled -> true\n    | _ -> false\n  in\n  if t.sched_cancel || terminal then ()\n  else begin\n    t.sched_cancel <- true;\n    match t.sched_state with\n    | SchedQueued _ -> if t.sched_start <> None then dtp_sched_finish t SchedCancelled\n      else t.sched_state <- SchedQueued (Obj.repr 1)\n    | SchedSuspended ->\n      let code = match t.sched_wait with\n        | SchedWaitTask _ -> 1\n        | SchedWaitScope _ | SchedWaitTimed -> 3\n        | SchedWaitNone -> 1\n      in\n      dtp_sched_remove_waiter t;\n      dtp_sched_timeouts := List.filter (fun (w, _, _) -> w <> t.sched_tid) !dtp_sched_timeouts;\n      dtp_sched_enqueue t (Obj.repr code)\n    | _ -> ()\n  end\n\nlet dtp_sched_cancel_scope_tasks sid =\n  let s = dtp_sched_scope sid in\n  List.iter (fun id -> dtp_sched_cancel_task (dtp_sched_task id)) s.sched_tasks\n\nlet dtp_sched_effc (type a) (eff : a Effect.t)\n  : ((a, Obj.t) Effect.Deep.continuation -> Obj.t) option =\n  match eff with\n  | SchedYield -> Some (fun k -> Obj.repr (SchedStepYield (Obj.repr k)))\n  | SchedAwait id -> Some (fun k -> Obj.repr (SchedStepAwait (id, Obj.repr k)))\n  | SchedWaitScope id -> Some (fun k -> Obj.repr (SchedStepScope (id, Obj.repr k)))\n  | SchedWaitScopeTimeout (n, id) ->\n    Some (fun k -> Obj.repr (SchedStepScopeTimeout (n, id, Obj.repr k)))\n  | _ -> None\n\nlet dtp_sched_run_fresh t =\n  let start = match t.sched_start with\n    | Some f -> f\n    | None -> failwith \"scheduler: no start thunk\" in\n  t.sched_start <- None;\n  let r = Effect.Deep.match_with\n      (fun () -> start ())\n      ()\n      { retc = (fun x -> Obj.repr (SchedStepDone x));\n        exnc = (fun e -> Obj.repr (SchedStepFailed (e, Printexc.get_raw_backtrace ())));\n        effc = dtp_sched_effc } in\n  (Obj.obj r : dtp_sched_step)\n\nlet dtp_sched_run_resume t v =\n  let k = match t.sched_cont with\n    | Some rep -> (Obj.magic rep : (Obj.t, Obj.t) Effect.Deep.continuation)\n    | None -> failwith \"scheduler: no continuation\" in\n  let r = Effect.Deep.continue k v in\n  (Obj.obj r : dtp_sched_step)\n\nlet dtp_sched_new_task scope start =\n  let id = !dtp_sched_next_task in\n  dtp_sched_next_task := id + 1;\n  let t = {\n    sched_tid = id;\n    sched_state = SchedQueued (Obj.repr 0);\n    sched_start = Some start;\n    sched_cont = None;\n    sched_scope = scope;\n    sched_wait = SchedWaitNone;\n    sched_waiters = [];\n    sched_cancel = false;\n    sched_grace = dtp_sched_grace_steps;\n  } in\n  Hashtbl.replace dtp_sched_tasks id t;\n  (match Hashtbl.find_opt dtp_sched_scopes scope with\n   | Some s -> s.sched_tasks <- id :: s.sched_tasks\n   | None -> ());\n  Queue.push id dtp_sched_ready;\n  t\n\nlet dtp_sched_new_scope () =\n  let id = !dtp_sched_next_scope in\n  dtp_sched_next_scope := id + 1;\n  Hashtbl.replace dtp_sched_scopes id {\n    sched_sid = id;\n    sched_tasks = [];\n    sched_failed = None;\n    sched_waiters = [];\n    sched_timeout = false;\n    sched_completed = 0;\n  };\n  id\n\nlet dtp_sched_step t =\n  if t.sched_cancel then t.sched_grace <- t.sched_grace - 1;\n  if t.sched_cancel && t.sched_grace <= 0 then begin\n    (* \231\161\172\228\184\173\230\173\162\239\188\154\231\187\173\229\187\182\232\162\171\228\184\162\229\188\131\239\188\140bracket \231\154\132\229\186\147\229\177\130 finally \228\184\141\228\188\154\232\183\145\239\188\155\229\176\189\229\138\155\230\137\167\232\161\140\230\156\170\229\188\185\229\135\186\231\154\132\n       cleanup\239\188\136\229\174\131\228\187\172\229\143\170\232\131\189\229\129\154\230\151\160\230\149\136\229\186\148/\232\135\170\229\140\133\229\144\171\231\154\132\230\184\133\231\144\134\239\188\154\230\140\130\232\181\183\231\130\185\228\185\139\229\164\150\230\178\161\230\156\137 handler \230\160\136\239\188\137\227\128\130 *)\n    dtp_cleanup_run_all_for t.sched_tid;\n    dtp_cleanup_forget t.sched_tid;\n    dtp_sched_finish t SchedCancelled;\n    None\n  end\n  else Some (match t.sched_start with\n    | Some _ -> dtp_sched_run_fresh t\n    | None -> match t.sched_state with\n      | SchedQueued v -> t.sched_state <- SchedRunning; dtp_sched_run_resume t v\n      | _ -> failwith \"scheduler: bad task state\")\n\nlet dtp_sched_apply t (st : dtp_sched_step) =\n  match st with\n  | SchedStepYield krep ->\n    t.sched_cont <- Some krep;\n    t.sched_wait <- SchedWaitNone;\n    dtp_sched_enqueue t (Obj.repr (if t.sched_cancel then 1 else 0))\n  | SchedStepAwait (id, krep) ->\n    t.sched_cont <- Some krep;\n    t.sched_wait <- SchedWaitTask id;\n    t.sched_state <- SchedSuspended;\n    let tg = dtp_sched_task id in\n    tg.sched_waiters <- t.sched_tid :: tg.sched_waiters\n  | SchedStepScope (id, krep) ->\n    t.sched_cont <- Some krep;\n    t.sched_wait <- SchedWaitScope id;\n    t.sched_state <- SchedSuspended;\n    let s = dtp_sched_scope id in\n    s.sched_waiters <- t.sched_tid :: s.sched_waiters\n  | SchedStepScopeTimeout (n, id, krep) ->\n    t.sched_cont <- Some krep;\n    t.sched_wait <- SchedWaitTimed;\n    t.sched_state <- SchedSuspended;\n    let s = dtp_sched_scope id in\n    s.sched_waiters <- t.sched_tid :: s.sched_waiters;\n    (* n \230\152\175\227\128\140\229\188\128\229\167\139\231\173\137\229\190\133\228\185\139\229\144\142\227\128\141\231\154\132\232\176\131\229\186\166\230\173\165\233\162\132\231\174\151\239\188\154\230\173\166\232\163\133\232\191\153\230\172\161\231\173\137\229\190\133\231\154\132\233\130\163\228\184\128\230\173\165\228\184\141\231\174\151\227\128\130 *)\n    dtp_sched_timeouts := (t.sched_tid, id, n + 1) :: !dtp_sched_timeouts\n  | SchedStepDone v ->\n    (* \230\173\163\229\184\184\231\187\147\230\157\159\239\188\154bracket \229\183\178\232\135\170\232\161\140\229\188\185\229\135\186\239\188\155\230\174\139\231\149\153\239\188\136\229\188\130\229\184\184\232\190\185\232\167\146\239\188\137\228\185\159\228\184\128\229\185\182\230\184\133\230\142\137\227\128\130 *)\n    dtp_cleanup_run_all_for t.sched_tid;\n    dtp_cleanup_forget t.sched_tid;\n    dtp_sched_finish t (if t.sched_cancel then SchedCancelled else SchedDone v)\n  | SchedStepFailed (e, bt) ->\n    (* \229\188\130\229\184\184\231\169\191\232\191\135\231\186\164\231\168\139\230\160\185 handler\239\188\154\232\162\171\228\184\162\229\188\131\231\154\132\231\187\173\229\187\182\233\135\140\231\154\132 bracket cleanup \229\156\168\232\191\153\233\135\140\229\133\156\229\186\149\227\128\130 *)\n    dtp_cleanup_run_all_for t.sched_tid;\n    dtp_cleanup_forget t.sched_tid;\n    if t.sched_tid = !dtp_sched_main_tid then dtp_sched_finish t (SchedFailed (e, bt))\n    else begin\n      let s = dtp_sched_scope t.sched_scope in\n      if s.sched_failed = None then s.sched_failed <- Some (dtp_sched_exn_msg e);\n      dtp_sched_finish t (SchedFailed (e, bt));\n      dtp_sched_cancel_scope_tasks t.sched_scope\n    end\n\nlet dtp_sched_tick () =\n  let expired = ref [] in\n  dtp_sched_timeouts := List.map (fun (w, sc, n) -> (w, sc, n - 1)) !dtp_sched_timeouts;\n  dtp_sched_timeouts := List.filter (fun (w, sc, n) ->\n    if n > 0 then true else (expired := (w, sc) :: !expired; false)) !dtp_sched_timeouts;\n  List.iter (fun (_, sc) ->\n    let s = dtp_sched_scope sc in\n    if not s.sched_timeout then begin\n      s.sched_timeout <- true;\n      dtp_sched_cancel_scope_tasks sc\n    end) !expired\n\nlet dtp_sched_runnable t =\n  match t.sched_state with SchedQueued _ -> true | _ -> false\n\nlet dtp_sched_run_one t =\n  if dtp_sched_runnable t then begin\n    dtp_sched_current := t.sched_tid;\n    dtp_cleanup_fiber := t.sched_tid;\n    (match dtp_sched_step t with\n     | Some st -> dtp_sched_apply t st\n     | None -> ());\n    dtp_cleanup_fiber := -1;\n    dtp_sched_current := -1\n  end\n\nlet dtp_sched_deadlock () = failwith \"scheduler: deadlock (no runnable task)\"\n\nlet dtp_sched_loop () =\n  let rec loop () =\n    if !dtp_sched_main_result <> None || !dtp_sched_main_exn <> None then ()\n    else if Queue.is_empty dtp_sched_ready then dtp_sched_deadlock ()\n    else begin\n      let tid = Queue.pop dtp_sched_ready in\n      dtp_sched_run_one (dtp_sched_task tid);\n      dtp_sched_tick ();\n      loop ()\n    end\n  in loop ()\n\nlet dtp_sched_drain () =\n  let rec loop () =\n    if Queue.is_empty dtp_sched_ready then ()\n    else begin\n      let tid = Queue.pop dtp_sched_ready in\n      dtp_sched_run_one (dtp_sched_task tid);\n      loop ()\n    end\n  in loop ()\n\nlet dtp_sched_cancel_leftovers () =\n  Hashtbl.iter (fun _ t -> match t.sched_state with\n    | SchedDone _ | SchedFailed _ | SchedCancelled -> ()\n    | _ -> dtp_sched_cancel_task t) dtp_sched_tasks\n\nlet dtp_sched_main (th : unit -> 'a) : 'a =\n  dtp_sched_reset ();\n  ignore (dtp_sched_new_scope ());\n  let main = dtp_sched_new_task 0 (fun () -> Obj.repr (th ())) in\n  dtp_sched_main_tid := main.sched_tid;\n  (try dtp_sched_loop ()\n   with e -> dtp_sched_cancel_leftovers (); dtp_sched_drain (); raise e);\n  dtp_sched_cancel_leftovers ();\n  dtp_sched_drain ();\n  match !dtp_sched_main_exn with\n  | Some (e, bt) -> Printexc.raise_with_backtrace e bt\n  | None -> match !dtp_sched_main_result with\n    | Some v -> (Obj.obj v : 'a)\n    | None -> failwith \"scheduler: main did not finish\"\n\n(* scheduler primitives exposed to Base.EffSched through hidden intrinsics *)\n\nlet dtp_sched_fork (scope : int) (f : int -> 'a) : int =\n  (dtp_sched_new_task scope (fun () -> Obj.repr (f 0))).sched_tid\n\nlet dtp_sched_current_task () =\n  if !dtp_sched_current < 0 then failwith \"scheduler: no current fiber\"\n  else dtp_sched_task !dtp_sched_current\n\nlet dtp_sched_yield () : int = Effect.perform SchedYield\n\nlet dtp_sched_is_cancelled () : int =\n  match Hashtbl.find_opt dtp_sched_tasks !dtp_sched_current with\n  | Some t -> if t.sched_cancel then 1 else 0\n  | None -> 0\n\nlet dtp_sched_await (id : int) : int =\n  let self = dtp_sched_current_task () in\n  if self.sched_cancel then begin ignore (Effect.perform SchedYield); 1 end\n  else begin\n    let target = dtp_sched_task id in\n    match target.sched_state with\n    | SchedDone _ | SchedFailed _ | SchedCancelled -> dtp_sched_task_status target\n    | _ -> Effect.perform (SchedAwait id)\n  end\n\nlet dtp_sched_task_result (id : int) : 'a =\n  match (dtp_sched_task id).sched_state with\n  | SchedDone v -> Obj.obj v\n  | _ -> failwith \"scheduler: task has no result\"\n\nlet dtp_sched_task_error (id : int) : string =\n  match (dtp_sched_task id).sched_state with\n  | SchedFailed (e, _) -> dtp_sched_exn_msg e\n  | _ -> \"\"\n\nlet dtp_sched_cancel_task_prim (id : int) : int =\n  dtp_sched_cancel_task (dtp_sched_task id);\n  0\n\nlet dtp_sched_cancel_scope (id : int) : int =\n  dtp_sched_cancel_scope_tasks id;\n  0\n\nlet dtp_sched_scope_status (s : dtp_sched_scope) : int =\n  if s.sched_timeout then 2\n  else if s.sched_failed <> None then 1\n  else 0\n\nlet dtp_sched_scope_wait (id : int) : int =\n  let s = dtp_sched_scope id in\n  let self = dtp_sched_current_task () in\n  if self.sched_cancel then begin ignore (Effect.perform SchedYield); 3 end\n  else if s.sched_tasks = [] then dtp_sched_scope_status s\n  else Effect.perform (SchedWaitScope id)\n\nlet dtp_sched_scope_wait_timeout (steps : int) (id : int) : int =\n  let s = dtp_sched_scope id in\n  let self = dtp_sched_current_task () in\n  if self.sched_cancel then begin ignore (Effect.perform SchedYield); 3 end\n  else if s.sched_tasks = [] then dtp_sched_scope_status s\n  else if steps <= 0 then begin\n    s.sched_timeout <- true;\n    dtp_sched_cancel_scope_tasks id;\n    Effect.perform (SchedWaitScope id)\n  end else\n    Effect.perform (SchedWaitScopeTimeout (steps, id))\n\nlet dtp_sched_scope_error (id : int) : string =\n  let s = dtp_sched_scope id in\n  match s.sched_failed with\n  | Some msg -> msg\n  | None -> \"\"\n\nlet dtp_sched_scope_count (id : int) : int =\n  (dtp_sched_scope id).sched_completed\n"

let v_Vuna_dCompiler_dCodegen_dTerm_ddtPrimRuntime = ("type _ Effect.t += Perform : string * string * Obj.t -> Obj.t Effect.t\n\n(* W7\239\188\154bracket \231\154\132 abort cleanup \231\153\187\232\174\176\232\161\168\239\188\136\230\175\143\231\186\164\231\168\139\228\184\128\228\187\189\239\188\140LIFO\239\188\137\227\128\130\n   `prim_effectHandle` \229\156\168\229\174\137\232\163\133 handler \230\151\182\232\174\176\228\184\139\229\189\147\229\137\141\230\183\177\229\186\166 mark\239\188\155handler \230\173\163\229\184\184\232\191\148\229\155\158 /\n   \230\138\155\229\188\130\229\184\184 / \228\184\162\229\188\131\231\187\173\229\187\182\239\188\136abort\239\188\137\230\151\182\239\188\140\230\138\138 mark \228\185\139\228\184\138\228\187\141\230\156\170\229\188\185\229\135\186\231\154\132 cleanup \233\128\144\228\184\170\230\137\167\232\161\140\226\128\148\226\128\148\232\191\153\228\186\155\n   \230\173\163\230\152\175\232\162\171\228\184\162\229\188\131\231\154\132\231\187\173\229\187\182\233\135\140\230\137\147\229\188\128\231\154\132 bracket\227\128\130\231\186\164\231\168\139\231\148\168 `dtp_cleanup_fiber` \229\140\186\229\136\134\239\188\136\232\176\131\229\186\166\229\153\168\229\156\168\n   \232\191\144\232\161\140\230\159\144\228\184\170\228\187\187\229\138\161\230\151\182\232\174\190\231\189\174\229\174\131\239\188\137\239\188\155\233\157\158\232\176\131\229\186\166\229\153\168\228\184\138\228\184\139\230\150\135\239\188\136-1\239\188\137\230\156\137\228\184\128\228\187\189\231\139\172\231\171\139\230\160\136\227\128\130\n   \230\179\168\230\132\143\239\188\154cleanup \229\156\168 handler \233\128\128\229\135\186\231\130\185\230\137\167\232\161\140\239\188\140\229\143\170\232\131\189\232\174\191\233\151\174**\229\164\150\229\177\130** handler\239\188\136\229\189\147\229\137\141 handler\n   \231\154\132\230\149\136\229\186\148\229\156\168\232\175\165\231\130\185\228\184\141\229\143\175\231\148\168\239\188\137\239\188\155\230\137\167\232\161\140\230\156\159\229\188\130\229\184\184\232\162\171\229\144\158\230\142\137\239\188\140\233\129\191\229\133\141\230\177\161\230\159\147 abort \231\187\147\230\158\156\227\128\130 *)\nlet dtp_cleanup_fiber = ref (-1)\nlet dtp_cleanup_stacks : (int, (unit -> unit) list ref) Hashtbl.t = Hashtbl.create 8\nlet dtp_cleanup_stack_of (fid : int) =\n  match Hashtbl.find_opt dtp_cleanup_stacks fid with\n  | Some r -> r\n  | None ->\n    let r = ref [] in\n    Hashtbl.replace dtp_cleanup_stacks fid r;\n    r\nlet dtp_cleanup_current () = dtp_cleanup_stack_of !dtp_cleanup_fiber\nlet dtp_cleanup_mark () = List.length !(dtp_cleanup_current ())\nlet dtp_cleanup_push (f : int -> int) : int =\n  let r = dtp_cleanup_current () in\n  r := (fun () -> ignore (f 0)) :: !r;\n  0\nlet dtp_cleanup_pop (_ : int) : int =\n  let r = dtp_cleanup_current () in\n  (match !r with _ :: rest -> r := rest | [] -> ());\n  0\nlet dtp_cleanup_run_to (mark : int) =\n  let r = dtp_cleanup_current () in\n  let rec go fuel =\n    if fuel <= 0 then ()\n    else if List.length !r <= mark then ()\n    else match !r with\n      | [] -> ()\n      | f :: rest -> r := rest; (try f () with _ -> ()); go (fuel - 1)\n  in\n  go 256\nlet dtp_cleanup_run_all_for (fid : int) =\n  let r = dtp_cleanup_stack_of fid in\n  let rec go fuel =\n    if fuel <= 0 then ()\n    else match !r with\n      | [] -> ()\n      | f :: rest -> r := rest; (try f () with _ -> ()); go (fuel - 1)\n  in\n  go 256\nlet dtp_cleanup_forget (fid : int) = Hashtbl.remove dtp_cleanup_stacks fid\nlet dtp_cleanup_reset () =\n  Hashtbl.reset dtp_cleanup_stacks;\n  dtp_cleanup_fiber := -1\n\n(* handler \231\154\132\232\191\144\232\161\140\230\151\182\229\163\179\239\188\154\228\184\142\230\151\167\229\134\133\232\129\148\229\174\158\231\142\176\231\173\137\228\187\183\239\188\140\228\189\134 handler \233\128\128\229\135\186\230\151\182\230\184\133\230\142\137\229\133\182 extent \229\134\133\230\174\139\231\149\153\231\154\132\n   bracket cleanup\239\188\136abort = \231\187\173\229\187\182\232\162\171\228\184\162\229\188\131\239\188\140\229\186\147\229\177\130 finally \228\184\141\228\188\154\229\134\141\232\183\145\239\188\137\227\128\130 *)\nlet dtp_effect_handle key name ret h th =\n  fun u ->\n    let mark = dtp_cleanup_mark () in\n    let run_cleanups () = dtp_cleanup_run_to mark in\n    (* \229\164\150\229\177\130 Obj.magic \228\184\142\230\151\167\229\134\133\232\129\148\229\174\158\231\142\176\228\184\128\232\135\180\239\188\154effc \231\154\132 continue \232\191\148\229\155\158 Obj.t\239\188\140\229\142\187\230\142\137\229\174\131\228\188\154\232\174\169\n       handler \231\154\132 answer \231\177\187\229\158\139\232\162\171\233\146\137\230\136\144 Obj.t\227\128\130 *)\n    Obj.magic\n      (match Effect.Deep.match_with (fun () -> (Obj.magic th) u) ()\n        { retc = (fun x -> (Obj.magic ret) x);\n          exnc = (fun e -> raise e);\n          effc = (fun (type a) (eff : a Effect.t) -> match eff with\n            | Perform (k, n, payload) when k = key && n = name ->\n              Some (fun (cont : (a, Obj.t) Effect.Deep.continuation) ->\n                (Obj.magic h) payload (fun v -> Effect.Deep.continue cont (Obj.repr v)))\n            | _ -> None) }\n      with\n      | r -> run_cleanups (); r\n      | exception e -> run_cleanups (); raise e)\nlet dtp_print s = print_string s; flush stdout; String.length s\nlet dtp_async_tbl : (int, unit -> Obj.t) Hashtbl.t = Hashtbl.create 16\nlet dtp_async_next = ref 0\nlet dtp_async_fork th =\n  let id = !dtp_async_next in\n  incr dtp_async_next;\n  let d = Domain.spawn (fun () -> th 0) in\n  Hashtbl.replace dtp_async_tbl id (fun () -> Obj.repr (Domain.join d));\n  id\nlet dtp_async_await (h : int) : Obj.t =\n  match Hashtbl.find_opt dtp_async_tbl h with\n  | Some join -> join ()\n  | None -> failwith \"async: invalid task handle\"\nlet dtp_readFile path =\n  try\n    let ch = open_in_bin path in\n    Fun.protect ~finally:(fun () -> close_in_noerr ch)\n      (fun () -> really_input_string ch (in_channel_length ch))\n  with Sys_error msg -> failwith (\"readFile: \" ^ msg)\nlet dtp_writeFile path contents =\n  try\n    let ch = open_out_bin path in\n    Fun.protect ~finally:(fun () -> close_out_noerr ch)\n      (fun () -> output_string ch contents);\n    String.length contents\n  with Sys_error msg -> failwith (\"writeFile: \" ^ msg)\nlet dtp_writeFileAtomic path contents =\n  let tmp = path ^ \".\" ^ string_of_int (Unix.getpid ()) ^ \".tmp\" in\n  let write () =\n    let ch = open_out_bin tmp in\n    Fun.protect ~finally:(fun () -> close_out_noerr ch) (fun () -> output_string ch contents) in\n  (try write (); Sys.rename tmp path; String.length contents\n   with e -> (try Sys.remove tmp with _ -> ()); raise e)\nlet dtp_getArgs () =\n  let argv = Sys.argv in\n  let n = Array.length argv in\n  if n <= 1 then [] else Array.to_list (Array.sub argv 1 (n - 1))\nlet dtp_readLine () = try input_line stdin with End_of_file -> \"\"\nlet dtp_readBytes n =\n  if n <= 0 then \"\"\n  else\n    let b = Bytes.create n in\n    let k = try input stdin b 0 n with _ -> 0 in\n    if k <= 0 then \"\" else Bytes.sub_string b 0 k\nlet dtp_readDir path =\n  try List.sort compare (Array.to_list (Sys.readdir path))\n  with Sys_error msg -> failwith (\"readDir: \" ^ msg)\nlet dtp_isDirectory path =\n  try Sys.is_directory path with Sys_error msg -> failwith (\"isDirectory: \" ^ msg)\nlet dtp_makeDir path =\n  try (if Sys.file_exists path then 0 else (Sys.mkdir path 0o755; 0))\n  with Sys_error msg -> failwith (\"makeDir: \" ^ msg)\nlet dtp_removeFile path =\n  try (if Sys.file_exists path then (Sys.remove path; 0) else 0)\n  with Sys_error msg -> failwith (\"removeFile: \" ^ msg)\nlet dtp_fileExists path = Sys.file_exists path\nlet dtp_fileMtime path =\n  try int_of_float (Unix.stat path).Unix.st_mtime with _ -> 0\nlet dtp_fileSize path =\n  try (Unix.stat path).Unix.st_size with _ -> 0\nlet dtp_timeUs () = int_of_float (Unix.gettimeofday () *. 1000000.0)\nlet dtp_sleep us =\n  (if us > 0 then Unix.sleepf (float_of_int us /. 1000000.0));\n  0\nlet dtp_getenv k = try Sys.getenv k with Not_found -> \"\"\nlet dtp_getcwd () = try Sys.getcwd () with _ -> \".\"\nlet dtp_execPath () = try Unix.readlink \"/proc/self/exe\" with _ -> Sys.executable_name\nlet dtp_arraySet (a : 'a array) (i : int) (v : 'a) =\n  let b = Array.copy a in\n  Array.set b i v; b\nlet dtp_strHash (s : string) =\n  let h = ref 0 in\n  String.iter (fun c -> h := ((!h * 33) + Char.code c) land 1023) s;\n  !h\nlet dtp_strAt (s : string) (i : int) = if i < 0 || i >= String.length s then -1 else Char.code s.[i]\nlet dtp_substring start len s =\n  let n = String.length s in\n  let st = if start < 0 then 0 else if start > n then n else start in\n  let ln = if len < 0 then 0 else if st + len > n then n - st else len in\n  String.sub s st ln\nlet dtp_exit n = exit n\nlet dtp_runIn dir args =\n  let quote s = Filename.quote s in\n  let cmd = String.concat \" \" (List.map quote args) in\n  let old = Sys.getcwd () in\n  Fun.protect ~finally:(fun () -> Sys.chdir old) (fun () -> Sys.chdir dir; Sys.command cmd)\nlet dtp_spawn (args : string list) : int =\n  let prog = Sys.executable_name in\n  Unix.create_process prog (Array.of_list (prog :: args)) Unix.stdin Unix.stdout Unix.stderr\nlet dtp_wait (pid : int) : int =\n  let (_, st) = Unix.waitpid [] pid in\n  match st with Unix.WEXITED c -> c | _ -> 1\nlet dtp_net_tbl : (int, Unix.file_descr) Hashtbl.t = Hashtbl.create 16\nlet dtp_net_next = ref 1\nlet dtp_net_put (fd : Unix.file_descr) : int =\n  let k = !dtp_net_next in\n  dtp_net_next := k + 1;\n  Hashtbl.replace dtp_net_tbl k fd;\n  k\nlet dtp_net_get (h : int) : Unix.file_descr =\n  match Hashtbl.find_opt dtp_net_tbl h with\n  | Some fd -> fd\n  | None -> failwith \"net: invalid handle\"\nlet dtp_net_drop (h : int) = (try Hashtbl.remove dtp_net_tbl h with _ -> ())\nlet dtp_net_error (what : string) (e : exn) : 'a =\n  match e with\n  | Unix.Unix_error (ue, fn, arg) ->\n    failwith (\"net: \" ^ what ^ \": \" ^ Unix.error_message ue ^ (if arg = \"\" then \"\" else \" (\" ^ arg ^ \")\"))\n  | _ -> failwith (\"net: \" ^ what ^ \": \" ^ Printexc.to_string e)\nlet dtp_net_parse (addr : string) =\n  let n = String.length addr in\n  if n > 5 && String.sub addr 0 5 = \"unix:\" then `Unix (String.sub addr 5 (n - 5))\n  else if n > 4 && String.sub addr 0 4 = \"tcp:\" then\n    let rest = String.sub addr 4 (n - 4) in\n    (match (try Some (String.rindex rest ':') with Not_found -> None) with\n     | None -> failwith (\"net: invalid address (want tcp:HOST:PORT or unix:PATH): \" ^ addr)\n     | Some i ->\n       let host = String.sub rest 0 i in\n       let portstr = String.sub rest (i + 1) (String.length rest - i - 1) in\n       let port = try int_of_string portstr with _ -> failwith (\"net: invalid port: \" ^ portstr) in\n       `Tcp (host, port))\n  else failwith (\"net: invalid address (want tcp:HOST:PORT or unix:PATH): \" ^ addr)\nlet dtp_net_listen (addr : string) : int =\n  match dtp_net_parse addr with\n  | `Unix path ->\n    (try if Sys.file_exists path then Sys.remove path with _ -> ());\n    let s = Unix.socket Unix.PF_UNIX Unix.SOCK_STREAM 0 in\n    (try Unix.bind s (Unix.ADDR_UNIX path); Unix.listen s 8; dtp_net_put s\n     with e -> (try Unix.close s with _ -> ()); dtp_net_error \"listen\" e)\n  | `Tcp (host, port) ->\n    let s = Unix.socket Unix.PF_INET Unix.SOCK_STREAM 0 in\n    (try\n       Unix.setsockopt s Unix.SO_REUSEADDR true;\n       Unix.bind s (Unix.ADDR_INET (Unix.inet_addr_of_string host, port));\n       Unix.listen s 8;\n       dtp_net_put s\n     with e -> (try Unix.close s with _ -> ()); dtp_net_error \"listen\" e)\nlet dtp_net_port (h : int) : int =\n  match Unix.getsockname (dtp_net_get h) with\n  | Unix.ADDR_INET (_, p) -> p\n  | Unix.ADDR_UNIX _ -> 0\nlet dtp_net_accept (h : int) : int =\n  (try let (fd, _) = Unix.accept (dtp_net_get h) in dtp_net_put fd\n   with e -> dtp_net_error \"accept\" e)\nlet dtp_net_recv (h : int) (n : int) : string =\n  if n <= 0 then \"\"\n  else\n    let b = Bytes.create n in\n    (try\n       let k = Unix.read (dtp_net_get h) b 0 n in\n       if k <= 0 then \"\" else Bytes.sub_string b 0 k\n     with e -> dtp_net_error \"recv\" e)\nlet dtp_net_send (h : int) (s : string) : int =\n  let fd = dtp_net_get h in\n  let n = String.length s in\n  let rec go off =\n    if off >= n then ()\n    else\n      let k = (try Unix.write_substring fd s off (n - off) with e -> dtp_net_error \"send\" e) in\n      if k <= 0 then failwith \"net: send: connection closed\" else go (off + k)\n  in\n  go 0; n\nlet dtp_net_close (h : int) : int =\n  (try Unix.close (dtp_net_get h) with _ -> ());\n  dtp_net_drop h; 0\nlet dtp_net_connect (addr : string) : int =\n  match dtp_net_parse addr with\n  | `Unix path ->\n    let s = Unix.socket Unix.PF_UNIX Unix.SOCK_STREAM 0 in\n    (try Unix.connect s (Unix.ADDR_UNIX path); dtp_net_put s\n     with e -> (try Unix.close s with _ -> ()); dtp_net_error \"connect\" e)\n  | `Tcp (host, port) ->\n    let s = Unix.socket Unix.PF_INET Unix.SOCK_STREAM 0 in\n    (try Unix.connect s (Unix.ADDR_INET (Unix.inet_addr_of_string host, port)); dtp_net_put s\n     with e -> (try Unix.close s with _ -> ()); dtp_net_error \"connect\" e)\n" ^ v_Vuna_dCompiler_dCodegen_dTerm_ddtSchedRuntime)

let v_Vuna_dCompiler_dCodegen_dTerm_ddtRuntime = ("let () =\n  let c = Gc.get () in\n  Gc.set { c with minor_heap_size = 16 * 1024 * 1024; space_overhead = 200 }\nlet () =\n  if (try Sys.getenv \"VN_PERF_STATS\" with Not_found -> \"\") <> \"\" then\n    at_exit (fun () ->\n      let s = Gc.quick_stat () in\n      Printf.eprintf \"VN_PERF minor_words=%.0f major_words=%.0f minor_collections=%d major_collections=%d top_heap_words=%d\\n\"\n        s.Gc.minor_words s.Gc.major_words s.Gc.minor_collections s.Gc.major_collections s.Gc.top_heap_words)\nlet bi_add a b = a + b\nlet bi_sub a b = a - b\nlet bi_mul a b = a * b\nlet bi_div a b = if b = 0 then failwith \"division by zero\" else a / b\nlet bi_eq_int (a : int) (b : int) = a = b\nlet bi_neq_int (a : int) (b : int) = a <> b\nlet bi_eq_str (a : string) (b : string) = a = b\nlet bi_neq_str (a : string) (b : string) = a <> b\nlet bi_strFromInt (n : int) = string_of_int n\nlet bi_strLength (s : string) = String.length s\nlet bi_strUnpack (s : string) = List.init (String.length s) (fun i -> Char.code s.[i])\nlet bi_strPack (cs : int list) =\n  let a = Array.of_list cs in\n  String.init (Array.length a) (fun i -> Char.chr a.(i))\nlet bi_lt_int (a : int) (b : int) = a < b\nlet bi_le_int (a : int) (b : int) = a <= b\nlet bi_gt_int (a : int) (b : int) = a > b\nlet bi_ge_int (a : int) (b : int) = a >= b\nlet bi_lt_generic (a : 'a) (b : 'a) = compare a b < 0\nlet bi_le_generic (a : 'a) (b : 'a) = compare a b <= 0\nlet bi_gt_generic (a : 'a) (b : 'a) = compare a b > 0\nlet bi_ge_generic (a : 'a) (b : 'a) = compare a b >= 0\nlet bi_concat a b = a ^ b\nlet bi_and a b = a && b\nlet bi_or a b = a || b\nlet bi_bitAnd (a : int) (b : int) = a land b\nlet bi_bitOr (a : int) (b : int) = a lor b\nlet bi_bitXor (a : int) (b : int) = a lxor b\nlet bi_bitNot (a : int) = lnot a\nlet bi_bitShl (a : int) (n : int) = if n < 0 || n >= 63 then 0 else a lsl n\nlet bi_bitShr (a : int) (n : int) = if n < 0 || n >= 63 then 0 else a lsr n\nlet bi_natSucc (n : int) = if n >= max_int then max_int else n + 1\nlet bi_natAdd (a : int) (b : int) = if a > max_int - b then max_int else a + b\nlet bi_natSub (a : int) (b : int) = if a <= b then 0 else a - b\nlet bi_natMul (a : int) (b : int) =\n  if a <= 0 || b <= 0 then 0 else if a > max_int / b then max_int else a * b\nlet bi_natDiv (a : int) (b : int) = if b = 0 then failwith \"division by zero\" else a / b\nlet bi_natToInt (n : int) = n\nlet bi_natFromInt (n : int) = if n <= 0 then 0 else n\nlet dt_show_bool b = if b then \"True\" else \"False\"\nlet dt_show_string s =\n  let buf = Buffer.create 16 in\n  Buffer.add_char buf (Char.chr 34);\n  String.iter (fun c ->\n    let n = Char.code c in\n    if n = 34 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 34))\n    else if n = 92 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 92))\n    else if n = 10 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"n\")\n    else if n = 9 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"t\")\n    else if n = 13 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"r\")\n    else Buffer.add_char buf c) s;\n  Buffer.add_char buf (Char.chr 34);\n  Buffer.contents buf\n" ^ v_Vuna_dCompiler_dCodegen_dTerm_ddtPrimRuntime)

let v_Vuna_dCompiler_dCodegen_dTerm_ddtReporterRuntime = "let rec dt_frame_key parts =\n  match parts with\n  | [] -> None\n  | part :: rest -> if part = \"(fun)\" then dt_frame_key rest else Some part\nlet dt_frame_label slot =\n  match Printexc.Slot.name slot with\n  | None -> None\n  | Some nm ->\n    match dt_frame_key (List.rev (String.split_on_char '.' nm)) with\n    | None -> None\n    | Some key ->\n      (match List.assoc_opt key dt_def_locs with\n       | Some (display, loc) -> Some (display ^ \" (\" ^ loc ^ \")\")\n       | None -> None)\nlet dt_report_exn e bt =\n  let msg = match e with Effect.Unhandled (Perform (key, name, _)) -> Printf.sprintf \"unhandled effect %s (instance %s)\" key name | Failure m -> m | _ -> Printexc.to_string e in\n  Printf.eprintf \"vuna: runtime error: %s\\n%!\" msg;\n  match Printexc.backtrace_slots bt with\n  | None -> ()\n  | Some slots ->\n    let rec go rest shown =\n      if shown >= 12 then ()\n      else match rest with\n      | [] -> ()\n      | slot :: tl ->\n        (match dt_frame_label slot with\n         | Some s -> Printf.eprintf \"  at %s\\n%!\" s; go tl (shown + 1)\n         | None -> go tl shown)\n    in go (Array.to_list slots) 0\n"

let v_Vuna_dCompiler_dCodegen_dTerm_ddtFloatRuntime = "let bi_add_float (a : float) (b : float) = a +. b\nlet bi_sub_float (a : float) (b : float) = a -. b\nlet bi_mul_float (a : float) (b : float) = a *. b\nlet bi_div_float (a : float) (b : float) = a /. b\nlet bi_eq_float (a : float) (b : float) = a = b\nlet bi_neq_float (a : float) (b : float) = a <> b\nlet bi_lt_float (a : float) (b : float) = a < b\nlet bi_le_float (a : float) (b : float) = a <= b\nlet bi_gt_float (a : float) (b : float) = a > b\nlet bi_ge_float (a : float) (b : float) = a >= b\n"

let v_Vuna_dCompiler_dCodegen_dTerm_ddtTraceRuntime = "let dtp_debug_on_lazy = lazy (\n  let has f = Array.exists (fun a -> a = f) Sys.argv in\n  has \"--debug-perf\" || (try Sys.getenv \"VUNA_DEBUG_PERF\" = \"1\" with Not_found -> false))\nlet dtp_debug_on (_ : int) = Lazy.force dtp_debug_on_lazy\nlet dtp_debug_line (s : string) =\n  Printf.eprintf \"DEBUG %d %s\n%!\" (dtp_timeUs ()) s;\n  0\n"

let v_Vuna_dCompiler_dCodegen_dTerm_dinlineText = (fun mc0 mc1 -> (if (mc0 = "+") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (match dtb__1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__2, dtb__3) -> (match dtb__3 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__0; " + "; dtb__2; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "-") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (match dtb__5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__6, dtb__7) -> (match dtb__7 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__4; " - "; dtb__6; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "*") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (match dtb__9 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (match dtb__11 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__8; " * "; dtb__10; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "/") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (match dtb__13 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (match dtb__15 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["(if "; dtb__14; " = 0 then failwith \"division by zero\" else "; dtb__12; " / "; dtb__14; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "&&") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (match dtb__17 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (match dtb__19 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__16; " && "; dtb__18; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "||") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__20, dtb__21) -> (match dtb__21 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__22, dtb__23) -> (match dtb__23 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__20; " || "; dtb__22; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_bitAnd") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__24, dtb__25) -> (match dtb__25 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__26, dtb__27) -> (match dtb__27 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__24; " land "; dtb__26; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_bitOr") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__28, dtb__29) -> (match dtb__29 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__30, dtb__31) -> (match dtb__31 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__28; " lor "; dtb__30; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_bitXor") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__32, dtb__33) -> (match dtb__33 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__34, dtb__35) -> (match dtb__35 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__32; " lxor "; dtb__34; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_bitNot") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (match dtb__37 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["(lnot "; dtb__36; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "++") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__38, dtb__39) -> (match dtb__39 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__40, dtb__41) -> (match dtb__41 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__38; " ^ "; dtb__40; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_eq_int") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__42, dtb__43) -> (match dtb__43 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__44, dtb__45) -> (match dtb__45 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__42; " = "; dtb__44; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_neq_int") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__46, dtb__47) -> (match dtb__47 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__48, dtb__49) -> (match dtb__49 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__46; " <> "; dtb__48; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_eq_str") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (match dtb__51 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__52, dtb__53) -> (match dtb__53 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__50; " = "; dtb__52; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_neq_str") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__54, dtb__55) -> (match dtb__55 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__56, dtb__57) -> (match dtb__57 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__54; " <> "; dtb__56; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_lt_int") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__58, dtb__59) -> (match dtb__59 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__60, dtb__61) -> (match dtb__61 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__58; " < "; dtb__60; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_le_int") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__62, dtb__63) -> (match dtb__63 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__64, dtb__65) -> (match dtb__65 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__62; " <= "; dtb__64; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_gt_int") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__66, dtb__67) -> (match dtb__67 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__68, dtb__69) -> (match dtb__69 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__66; " > "; dtb__68; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_ge_int") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__70, dtb__71) -> (match dtb__71 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__72, dtb__73) -> (match dtb__73 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__70; " >= "; dtb__72; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_lt_generic") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__74, dtb__75) -> (match dtb__75 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__76, dtb__77) -> (match dtb__77 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__74; " < "; dtb__76; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_le_generic") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__78, dtb__79) -> (match dtb__79 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__80, dtb__81) -> (match dtb__81 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__78; " <= "; dtb__80; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_gt_generic") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__82, dtb__83) -> (match dtb__83 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__84, dtb__85) -> (match dtb__85 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__82; " > "; dtb__84; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_ge_generic") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__86, dtb__87) -> (match dtb__87 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__88, dtb__89) -> (match dtb__89 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__86; " >= "; dtb__88; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_add_float") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__90, dtb__91) -> (match dtb__91 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__92, dtb__93) -> (match dtb__93 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__90; " +. "; dtb__92; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_sub_float") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__94, dtb__95) -> (match dtb__95 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__96, dtb__97) -> (match dtb__97 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__94; " -. "; dtb__96; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_mul_float") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__98, dtb__99) -> (match dtb__99 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__100, dtb__101) -> (match dtb__101 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__98; " *. "; dtb__100; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_div_float") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__102, dtb__103) -> (match dtb__103 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__104, dtb__105) -> (match dtb__105 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__102; " /. "; dtb__104; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_eq_float") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__106, dtb__107) -> (match dtb__107 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__108, dtb__109) -> (match dtb__109 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__106; " = "; dtb__108; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_neq_float") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__110, dtb__111) -> (match dtb__111 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__112, dtb__113) -> (match dtb__113 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__110; " <> "; dtb__112; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_lt_float") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__114, dtb__115) -> (match dtb__115 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__116, dtb__117) -> (match dtb__117 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__114; " < "; dtb__116; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_le_float") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__118, dtb__119) -> (match dtb__119 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__120, dtb__121) -> (match dtb__121 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__118; " <= "; dtb__120; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_gt_float") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__122, dtb__123) -> (match dtb__123 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__124, dtb__125) -> (match dtb__125 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__122; " > "; dtb__124; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_ge_float") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__126, dtb__127) -> (match dtb__127 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__128, dtb__129) -> (match dtb__129 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__126; " >= "; dtb__128; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "natToInt") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__130, dtb__131) -> (match dtb__131 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__130))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "natFromInt") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__132, dtb__133) -> (match dtb__133 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["(bi_natFromInt "; dtb__132; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "natAdd") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__134, dtb__135) -> (match dtb__135 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__136, dtb__137) -> (match dtb__137 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["(bi_natAdd "; dtb__134; " "; dtb__136; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "natSub") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__138, dtb__139) -> (match dtb__139 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__140, dtb__141) -> (match dtb__141 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["(bi_natSub "; dtb__138; " "; dtb__140; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "natMul") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__142, dtb__143) -> (match dtb__143 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__144, dtb__145) -> (match dtb__145 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["(bi_natMul "; dtb__142; " "; dtb__144; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (mc0 = "natDiv") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__146, dtb__147) -> (match dtb__147 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__148, dtb__149) -> (match dtb__149 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["(bi_natDiv "; dtb__146; " "; dtb__148; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))))))))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dCodegen_dTerm_ddtRuntimeWith = (fun locs usesFloat usesTrace -> (String.concat "" [v_Vuna_dCompiler_dCodegen_dTerm_ddtRuntime; (if usesFloat then v_Vuna_dCompiler_dCodegen_dTerm_ddtFloatRuntime else ""); (if (locs = "") then "let dt_def_locs = []\n" else (String.concat "" ["let dt_def_locs = [\n"; locs; "]\n"])); v_Vuna_dCompiler_dCodegen_dTerm_ddtReporterRuntime; (if usesTrace then v_Vuna_dCompiler_dCodegen_dTerm_ddtTraceRuntime else "")]))

let v_Vuna_dCompiler_dCodegen_dTerm_ddtListBridge = (fun listFam -> (match listFam with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__150) -> ((fun nilMl -> ((fun consMl -> (String.concat "" ["\nlet dtp_unpack (s : string) =\n  let cs = List.init (String.length s) (fun i -> Char.code s.[i]) in\n  List.fold_right (fun x acc -> "; consMl; " (x, acc)) cs "; nilMl; "\nlet dtp_pack xs =\n  let rec to_list xs = match xs with "; nilMl; " -> [] | "; consMl; " (x, rest) -> x :: to_list rest in\n  let cs = Array.of_list (to_list xs) in\n  String.init (Array.length cs) (fun i -> Char.chr cs.(i))\n\nlet dtp_listOf xs = List.fold_right (fun x acc -> "; consMl; " (x, acc)) xs "; nilMl; "\nlet dtp_ocamlOf xs =\n  let rec go l = match l with "; nilMl; " -> [] | "; consMl; " (x, rest) -> x :: go rest in\n  go xs\n\nlet dtp_concatMany xs = String.concat \"\" (dtp_ocamlOf xs)\n\nlet dtp_substTemplate tmpl xs =\n  let args = Array.of_list (dtp_ocamlOf xs) in\n  let n = String.length tmpl and na = Array.length args in\n  let buf = Buffer.create (n + 32) in\n  let rec go i =\n    if i >= n then ()\n    else if tmpl.[i] = '<' then begin\n      let j = ref (i + 1) and k = ref 0 in\n      while !j < n && tmpl.[!j] >= '0' && tmpl.[!j] <= '9' do\n        k := !k * 10 + (Char.code tmpl.[!j] - 48); incr j\n      done;\n      if !j < n && tmpl.[!j] = '>' && !j > i + 1 then begin\n        (if !k < na then Buffer.add_string buf args.(!k)\n         else Buffer.add_string buf (String.sub tmpl i (!j - i + 1)));\n        go (!j + 1)\n      end else (Buffer.add_char buf '<'; go (i + 1))\n    end else (Buffer.add_char buf tmpl.[i]; go (i + 1))\n  in go 0; Buffer.contents buf\n"])) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirListFamilyOf dtb__150)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirListConsOf dtb__150)))) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirListFamilyOf dtb__150)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirListNilOf dtb__150)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dinsertLocRow = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__151, dtb__152) -> (if (mc0 <= dtb__151) then (Base_dList.C_Base_dList_dList_Cons (mc0, (Base_dList.C_Base_dList_dList_Cons (dtb__151, dtb__152)))) else (Base_dList.C_Base_dList_dList_Cons (dtb__151, ((v_Vuna_dCompiler_dCodegen_dTerm_dinsertLocRow mc0) dtb__152))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dsortLocRows = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__153, dtb__154) -> ((v_Vuna_dCompiler_dCodegen_dTerm_dinsertLocRow dtb__153) (v_Vuna_dCompiler_dCodegen_dTerm_dsortLocRows dtb__154))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dlocRowOf = (fun norm row -> ((fun name -> ((fun file -> ((fun line -> (String.concat "" ["  ("; (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_docamlString (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dvalueName name)); ", ("; (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_docamlString name); ", "; (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_docamlString (String.concat "" [(norm file); ":"; (bi_strFromInt line)])); "));\n"])) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf row)))) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf row)))) (Base_dPair.v_Base_dPair_dfirstOf row)))

let v_Vuna_dCompiler_dCodegen_dTerm_ddtDefLocTable = (fun norm rows -> (Base_dList.dtp_concatMany (v_Vuna_dCompiler_dCodegen_dTerm_dsortLocRows ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dCodegen_dTerm_dlocRowOf norm)) rows))))

let v_Vuna_dCompiler_dCodegen_dTerm_dmkGenSt = (fun qc shared -> { f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsShared = shared; f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual = qc; f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsDeps = Base_dList.C_Base_dList_dList_Nil })

let v_Vuna_dCompiler_dCodegen_dTerm_dgsAddDep = (fun st unit -> (if (if (unit = "") then true else ((Base_dList.v_Base_dList_dmemName unit) (st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsDeps)) then st else { f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsShared = (st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsShared; f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual = (st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual; f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsDeps = (Base_dList.C_Base_dList_dList_Cons (unit, (st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsDeps)) }))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenValueRef = (fun st name -> ((fun p -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dCodegen_dTerm_dgsAddDep st) (Base_dPair.v_Base_dPair_dsecondOf p)) }) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dqualValueText (st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual) name)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenCtorRef = (fun st family ctor -> ((fun p -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dCodegen_dTerm_dgsAddDep st) (Base_dPair.v_Base_dPair_dsecondOf p)) }) (((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dqualCtorText (st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual) family) ctor)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsDepOfFamily = (fun st family -> ((fun unit -> (if (if (unit = "") then true else (unit = ((st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual).Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit)) then st else ((v_Vuna_dCompiler_dCodegen_dTerm_dgsAddDep st) unit))) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl ((st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual).Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas) family)))

let v_Vuna_dCompiler_dCodegen_dTerm_drecordLabelOf = (fun st family label -> ((fun unit -> (if (if (unit = "") then true else (unit = ((st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual).Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit)) then label else (String.concat "" [unit; "."; label]))) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl ((st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual).Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas) family)))

let v_Vuna_dCompiler_dCodegen_dTerm_dbridgeHelperNames = (Base_dList.C_Base_dList_dList_Cons ("dtp_unpack", (Base_dList.C_Base_dList_dList_Cons ("dtp_pack", (Base_dList.C_Base_dList_dList_Cons ("dtp_listOf", (Base_dList.C_Base_dList_dList_Cons ("dtp_ocamlOf", (Base_dList.C_Base_dList_dList_Cons ("dtp_concatMany", (Base_dList.C_Base_dList_dList_Cons ("dtp_substTemplate", Base_dList.C_Base_dList_dList_Nil))))))))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dbridgeUnitOf = (fun st -> (match ((st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsShared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedListFam with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__155) -> ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl ((st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual).Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirListFamilyOf dtb__155))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dreplaceAll = (fun old new_ text -> ((Base_dString.v_Base_dString_djoin new_) ((Base_dString.v_Base_dString_dsplit old) text)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dqualifyBridgeNames = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__156, dtb__157) -> (((v_Vuna_dCompiler_dCodegen_dTerm_dqualifyBridgeNames mc0) dtb__157) (((v_Vuna_dCompiler_dCodegen_dTerm_dreplaceAll dtb__156) (String.concat "" [mc0; "."; dtb__156])) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dqualifyBridgeText = (fun unit text -> (if (unit = "") then text else (((v_Vuna_dCompiler_dCodegen_dTerm_dqualifyBridgeNames unit) v_Vuna_dCompiler_dCodegen_dTerm_dbridgeHelperNames) text)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenBridgeRef = (fun st text -> ((fun unit -> { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dCodegen_dTerm_dqualifyBridgeText unit) text); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dCodegen_dTerm_dgsAddDep st) unit) }) (v_Vuna_dCompiler_dCodegen_dTerm_dbridgeUnitOf st)))

let v_Vuna_dCompiler_dCodegen_dTerm_deffUnitTypeNameIr = "Base.Eff.EffUnit"

let v_Vuna_dCompiler_dCodegen_dTerm_deffUnitTyPair = (fun st -> ((fun p -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dCodegen_dTerm_dgsAddDep st) (Base_dPair.v_Base_dPair_dsecondOf p)) }) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText (st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual) v_Vuna_dCompiler_dCodegen_dTerm_deffUnitTypeNameIr)))

let v_Vuna_dCompiler_dCodegen_dTerm_dioParamNames = (Base_dList.C_Base_dList_dList_Cons ("dtio_0", (Base_dList.C_Base_dList_dList_Cons ("dtio_1", (Base_dList.C_Base_dList_dList_Cons ("dtio_2", (Base_dList.C_Base_dList_dList_Cons ("dtio_3", Base_dList.C_Base_dList_dList_Nil))))))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dtakeNames = (fun n names -> (if (n <= 0) then Base_dList.C_Base_dList_dList_Nil else (match names with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__158, dtb__159) -> (Base_dList.C_Base_dList_dList_Cons (dtb__158, ((v_Vuna_dCompiler_dCodegen_dTerm_dtakeNames (n - 1)) dtb__159)))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dTerm_deffThunkText = (fun ctor unitTy rt arity -> ((fun argText -> (if (arity = 0) then (String.concat "" ["("; ctor; " (fun (_ : "; unitTy; ") -> "; rt; "))"]) else (String.concat "" ["(fun "; argText; " -> "; ctor; " (fun (_ : "; unitTy; ") -> "; rt; " "; argText; "))"]))) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " ") ((v_Vuna_dCompiler_dCodegen_dTerm_dtakeNames arity) v_Vuna_dCompiler_dCodegen_dTerm_dioParamNames))))

let v_Vuna_dCompiler_dCodegen_dTerm_dnonErasedBinderText = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = dtb__160; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = dtb__161 } -> (if dtb__161 then "" else (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dirBinderText { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = dtb__160; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = dtb__161 }))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dhasCatchAll = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__162, dtb__163) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltCtorOf dtb__162) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__164) -> (v_Vuna_dCompiler_dCodegen_dTerm_dhasCatchAll dtb__163)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_drecordPatAssigned = (fun st family fields pats -> (match fields with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__165, dtb__166) -> (match pats with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__167, dtb__168) -> (Base_dList.C_Base_dList_dList_Cons ((String.concat "" [(((v_Vuna_dCompiler_dCodegen_dTerm_drecordLabelOf st) family) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldLabel family) (Base_dPair.v_Base_dPair_dsecondOf dtb__165))); " = "; dtb__167]), ((((v_Vuna_dCompiler_dCodegen_dTerm_drecordPatAssigned st) family) dtb__166) dtb__168)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_drecordPatText = (fun st family fields pats -> (String.concat "" ["{ "; ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "; ") ((((v_Vuna_dCompiler_dCodegen_dTerm_drecordPatAssigned st) family) fields) pats)); " }"]))

let v_Vuna_dCompiler_dCodegen_dTerm_darmPatternText = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> (String.concat "" [mc0; " ("; ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") mc1); ")"])
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dfoldHandlers = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__169, dtb__170) -> ((fun p -> (((v_Vuna_dCompiler_dCodegen_dTerm_dfoldHandlers (Base_dPair.v_Base_dPair_dsecondOf p)) (String.concat "" ["("; (Base_dPair.v_Base_dPair_dfirstOf p); " "; mc1; ")"])) dtb__170)) ((v_Vuna_dCompiler_dCodegen_dTerm_dgenValueRef mc0) dtb__169))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = mc0 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dhookText = (fun showText body printResult -> ((fun action -> (String.concat "" ["\nlet () =\n  Printexc.record_backtrace true;\n  try "; action; "\n  with e -> dt_report_exn e (Printexc.get_raw_backtrace ()); exit 2\n"])) (if printResult then (String.concat "" ["print_endline ("; showText; " ("; body; "))"]) else (String.concat "" ["ignore ("; body; ")"]))))

let v_Vuna_dCompiler_dCodegen_dTerm_dconAppText = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__171, dtb__172) -> (match dtb__172 with
  | Base_dList.C_Base_dList_dList_Nil -> (String.concat "" ["("; mc0; " ("; dtb__171; "))"])
  | _ -> (String.concat "" ["("; mc0; " ("; ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") mc1); "))"])
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenIr = (fun st ir -> (match ir with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__173) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dirBinderText dtb__173); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__174) -> ((fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) }))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgenValueRef st) dtb__174))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__175, dtb__176, dtb__177) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIrArgs st) dtb__177)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__178; Base_dPair.f_Base_dPair_dPair_second = dtb__179 } -> ((fun r -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dCodegen_dTerm_dconAppText (Base_dPair.v_Base_dPair_dfirstOf r)) dtb__178); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) }))) (((v_Vuna_dCompiler_dCodegen_dTerm_dgenCtorRef dtb__179) dtb__175) dtb__176))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__180, dtb__181) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dTerm_dgenAssignedFields st) dtb__180) dtb__181)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__182; Base_dPair.f_Base_dPair_dPair_second = dtb__183 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (String.concat "" ["{ "; ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "; ") dtb__182); " }"]); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dCodegen_dTerm_dgsDepOfFamily dtb__183) dtb__180) }))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__184, dtb__185, dtb__186) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr st) dtb__184)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__187; Base_dPair.f_Base_dPair_dPair_second = dtb__188 } -> ((fun st2 -> ((fun label -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (String.concat "" ["("; dtb__187; ")."; (((v_Vuna_dCompiler_dCodegen_dTerm_drecordLabelOf st2) dtb__185) label)]); Base_dPair.f_Base_dPair_dPair_second = st2 }))) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldLabel dtb__185) dtb__186))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgsDepOfFamily dtb__188) dtb__185))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__189, dtb__190, dtb__191) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr st) dtb__189)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__192; Base_dPair.f_Base_dPair_dPair_second = dtb__193 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dTerm_dgenAssignedFields dtb__193) dtb__190) dtb__191)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__194; Base_dPair.f_Base_dPair_dPair_second = dtb__195 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (String.concat "" ["{ "; dtb__192; " with "; ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "; ") dtb__194); " }"]); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dCodegen_dTerm_dgsDepOfFamily dtb__195) dtb__190) }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRuntime (dtb__196) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__196; Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBridge (dtb__197) -> ((fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) }))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgenBridgeRef st) dtb__197))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__198) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr st) dtb__198)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__199; Base_dPair.f_Base_dPair_dPair_second = dtb__200 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (String.concat "" ["(Obj.magic "; dtb__199; ")"]); Base_dPair.f_Base_dPair_dPair_second = dtb__200 }))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__201) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (bi_strFromInt dtb__201); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__202) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_docamlString dtb__202); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__203) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dboolText dtb__203); Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__204) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__204; Base_dPair.f_Base_dPair_dPair_second = st }))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__205, dtb__206, dtb__207) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr st) dtb__206)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__208; Base_dPair.f_Base_dPair_dPair_second = dtb__209 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr dtb__209) dtb__207)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__210; Base_dPair.f_Base_dPair_dPair_second = dtb__211 } -> (match ((Base_dList.v_Base_dList_dfilter (fun n -> (n <> ""))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dTerm_dnonErasedBinderText) dtb__205)) with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (String.concat "" ["(let _ = "; dtb__208; " in "; dtb__210; ")"]); Base_dPair.f_Base_dPair_dPair_second = dtb__211 }))
  | Base_dList.C_Base_dList_dList_Cons (dtb__212, dtb__213) -> (match dtb__213 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (String.concat "" ["(let "; dtb__212; " = "; dtb__208; " in "; dtb__210; ")"]); Base_dPair.f_Base_dPair_dPair_second = dtb__211 }))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "unboxed case arm has more than one runtime binder")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__214, dtb__215) -> ((fun params -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr st) dtb__215)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__216; Base_dPair.f_Base_dPair_dPair_second = dtb__217 } -> (match params with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__216; Base_dPair.f_Base_dPair_dPair_second = dtb__217 }))
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (String.concat "" ["(fun "; ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " ") params); " -> "; dtb__216; ")"]); Base_dPair.f_Base_dPair_dPair_second = dtb__217 }))
)
  | _ -> failwith "DT: impossible branch"
)))) ((Base_dList.v_Base_dList_dfilter (fun n -> (n <> ""))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dTerm_dnonErasedBinderText) dtb__214)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__218, dtb__219) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr st) dtb__218)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__220; Base_dPair.f_Base_dPair_dPair_second = dtb__221 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr dtb__221) dtb__219)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__222; Base_dPair.f_Base_dPair_dPair_second = dtb__223 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (String.concat "" ["("; dtb__220; " "; dtb__222; ")"]); Base_dPair.f_Base_dPair_dPair_second = dtb__223 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__224, dtb__225, dtb__226) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr st) dtb__224)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__227; Base_dPair.f_Base_dPair_dPair_second = dtb__228 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr dtb__228) dtb__225)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__229; Base_dPair.f_Base_dPair_dPair_second = dtb__230 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr dtb__230) dtb__226)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__231; Base_dPair.f_Base_dPair_dPair_second = dtb__232 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (String.concat "" ["(if "; dtb__227; " then "; dtb__229; " else "; dtb__231; ")"]); Base_dPair.f_Base_dPair_dPair_second = dtb__232 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__233, dtb__234) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr st) dtb__233)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__235; Base_dPair.f_Base_dPair_dPair_second = dtb__236 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenArms dtb__236) dtb__234)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__237; Base_dPair.f_Base_dPair_dPair_second = dtb__238 } -> ((fun fallback -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (String.concat "" ["(match "; dtb__235; " with\n"; dtb__237; fallback; ")"]); Base_dPair.f_Base_dPair_dPair_second = dtb__238 }))) (if (v_Vuna_dCompiler_dCodegen_dTerm_dhasCatchAll dtb__234) then "" else "  | _ -> failwith \"DT: impossible branch\"\n"))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__239, dtb__240, dtb__241, dtb__242, dtb__243) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr st) dtb__239)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__244; Base_dPair.f_Base_dPair_dPair_second = dtb__245 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenNatBranches dtb__245) dtb__240) dtb__241) dtb__242) dtb__243)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__246; Base_dPair.f_Base_dPair_dPair_second = dtb__247 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (String.concat "" ["(let dtnat__"; (bi_strFromInt dtb__240); " = "; dtb__244; " in "; dtb__246; ")"]); Base_dPair.f_Base_dPair_dPair_second = dtb__247 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInline (dtb__248, dtb__249) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIrArgs st) dtb__249)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__250; Base_dPair.f_Base_dPair_dPair_second = dtb__251 } -> (match ((v_Vuna_dCompiler_dCodegen_dTerm_dinlineText dtb__248) dtb__250) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__252) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__252; Base_dPair.f_Base_dPair_dPair_second = dtb__251 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["no inline text for builtin `"; dtb__248; "`"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__253) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIrArgs st) dtb__253)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__254; Base_dPair.f_Base_dPair_dPair_second = dtb__255 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (String.concat "" ["(String.concat \"\" ["; ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "; ") dtb__254); "])"]); Base_dPair.f_Base_dPair_dPair_second = dtb__255 }))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__256, dtb__257, dtb__258, dtb__259, dtb__260) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr st) dtb__260)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__261; Base_dPair.f_Base_dPair_dPair_second = dtb__262 } -> ((fun ctorP -> ((fun st2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ((((v_Vuna_dCompiler_dCodegen_dTerm_deffThunkText (Base_dPair.v_Base_dPair_dfirstOf ctorP)) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dirTyText (st2).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual) dtb__258)) dtb__261) dtb__259); Base_dPair.f_Base_dPair_dPair_second = st2 }))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgsDepOfFamily (Base_dPair.v_Base_dPair_dsecondOf ctorP)) dtb__256))) (((v_Vuna_dCompiler_dCodegen_dTerm_dgenCtorRef dtb__262) dtb__256) dtb__257))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (dtb__263, dtb__264, dtb__265) -> ((fun ctorP -> ((fun st1 -> ((fun unitText -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (String.concat "" ["(fun m k -> "; (Base_dPair.v_Base_dPair_dfirstOf ctorP); " (fun (u : "; unitText; ") -> match m with "; (Base_dPair.v_Base_dPair_dfirstOf ctorP); " f -> (match k (f u) with "; (Base_dPair.v_Base_dPair_dfirstOf ctorP); " g -> g u)))"]); Base_dPair.f_Base_dPair_dPair_second = st1 }))) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dirTyText (st1).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual) dtb__265))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgsDepOfFamily (Base_dPair.v_Base_dPair_dsecondOf ctorP)) dtb__263))) (((v_Vuna_dCompiler_dCodegen_dTerm_dgenCtorRef st) dtb__263) dtb__264))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenIrArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__266, dtb__267) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr mc0) dtb__266)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__268; Base_dPair.f_Base_dPair_dPair_second = dtb__269 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIrArgs dtb__269) dtb__267)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__270; Base_dPair.f_Base_dPair_dPair_second = dtb__271 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__268, dtb__270)); Base_dPair.f_Base_dPair_dPair_second = dtb__271 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc0 }))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenAssignedFields = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__272, dtb__273) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr mc0) (Base_dPair.v_Base_dPair_dsecondOf dtb__272))) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__274; Base_dPair.f_Base_dPair_dPair_second = dtb__275 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dTerm_dgenAssignedFields dtb__275) mc1) dtb__273)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__276; Base_dPair.f_Base_dPair_dPair_second = dtb__277 } -> ((fun st3 -> ((fun label -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ((String.concat "" [label; " = "; dtb__274]), dtb__276)); Base_dPair.f_Base_dPair_dPair_second = st3 }))) (((v_Vuna_dCompiler_dCodegen_dTerm_drecordLabelOf st3) mc1) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldLabel mc1) (Base_dPair.v_Base_dPair_dfirstOf dtb__272))))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgsDepOfFamily dtb__277) mc1))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc0 }))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenArms = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__278, dtb__279) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenArm mc0) dtb__278)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__280; Base_dPair.f_Base_dPair_dPair_second = dtb__281 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenArms dtb__281) dtb__279)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__282; Base_dPair.f_Base_dPair_dPair_second = dtb__283 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__280 ^ dtb__282); Base_dPair.f_Base_dPair_dPair_second = dtb__283 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ""; Base_dPair.f_Base_dPair_dPair_second = mc0 }))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenArm = (fun st alt -> ((fun envPats -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr st) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf alt))) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__284; Base_dPair.f_Base_dPair_dPair_second = dtb__285 } -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__286) -> (match dtb__286 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__287; Base_dPair.f_Base_dPair_dPair_second = dtb__288 } -> (match ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirSharedRecordFieldsOf dtb__287) ((dtb__285).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsShared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedRecordFields) with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun r -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (String.concat "" ["  | "; ((v_Vuna_dCompiler_dCodegen_dTerm_darmPatternText (Base_dPair.v_Base_dPair_dfirstOf r)) envPats); " -> "; dtb__284; "\n"]); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) }))) (((v_Vuna_dCompiler_dCodegen_dTerm_dgenCtorRef dtb__285) dtb__287) dtb__288))
  | dtb__289 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (String.concat "" ["  | "; ((((v_Vuna_dCompiler_dCodegen_dTerm_drecordPatText dtb__285) dtb__287) dtb__289) envPats); " -> "; dtb__284; "\n"]); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dCodegen_dTerm_dgsDepOfFamily dtb__285) dtb__287) }))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun pat -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (String.concat "" ["  | "; pat; " -> "; dtb__284; "\n"]); Base_dPair.f_Base_dPair_dPair_second = dtb__285 }))) (match envPats with
  | Base_dList.C_Base_dList_dList_Nil -> "_"
  | Base_dList.C_Base_dList_dList_Cons (dtb__290, dtb__291) -> dtb__290
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltCtorOf alt))
  | _ -> failwith "DT: impossible branch"
)))) ((Base_dList.v_Base_dList_dfilter (fun n -> (n <> ""))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dTerm_dnonErasedBinderText) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf alt)))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenNatBranches = (fun st fresh zero succ catch -> ((fun sc -> ((fun predExpr -> ((fun impossible -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dTerm_dgenNatAlt st) zero) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (fun pz -> (match pz with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__292; Base_dPair.f_Base_dPair_dPair_second = dtb__293 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dTerm_dgenNatAlt dtb__293) succ) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (predExpr)))) (fun ps -> (match ps with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__294; Base_dPair.f_Base_dPair_dPair_second = dtb__295 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dTerm_dgenNatAlt dtb__295) catch) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (sc)))) (fun pc -> (match pc with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__296; Base_dPair.f_Base_dPair_dPair_second = dtb__297 } -> ((fun trueText -> ((fun falseText -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (String.concat "" ["(if "; sc; " = 0 then "; trueText; " else "; falseText; ")"]); Base_dPair.f_Base_dPair_dPair_second = dtb__297 }))) (match succ with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__298) -> dtb__294
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match catch with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__299) -> dtb__296
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> impossible
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) (match zero with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__300) -> dtb__292
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match catch with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__301) -> dtb__296
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> impossible
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) "(failwith \"DT: impossible branch\")")) (String.concat "" ["("; sc; " - 1)"]))) ("dtnat__" ^ (bi_strFromInt fresh))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenNatAlt = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__302) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr mc0) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__302))) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__303; Base_dPair.f_Base_dPair_dPair_second = dtb__304 } -> (match ((Base_dList.v_Base_dList_dfilter (fun n -> (n <> ""))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dTerm_dnonErasedBinderText) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf dtb__302))) with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__303; Base_dPair.f_Base_dPair_dPair_second = dtb__304 }))
  | Base_dList.C_Base_dList_dList_Cons (dtb__305, dtb__306) -> (match dtb__306 with
  | Base_dList.C_Base_dList_dList_Nil -> (match mc2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__307) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (String.concat "" ["(let "; dtb__305; " = "; dtb__307; " in "; dtb__303; ")"]); Base_dPair.f_Base_dPair_dPair_second = dtb__304 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "Nat case arm has a binder but no runtime binding")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "Nat case arm has more than one runtime binder")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ""; Base_dPair.f_Base_dPair_dPair_second = mc0 }))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenDef = (fun st d -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC ((((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithContext (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefSpan d)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName d)) (((((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagNoLoc Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevError) Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhInternal) Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatInternal) "IC_AxiomRuntime") "axiom reached runtime code generation (partition must erase it)"))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__308) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr st) dtb__308)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__309; Base_dPair.f_Base_dPair_dPair_second = dtb__310 } -> ((fun finalText -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (String.concat "" [(Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName d)); " = "; finalText]); Base_dPair.f_Base_dPair_dPair_second = dtb__310 }))) (if (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefInitGuard d) then (String.concat "" ["(try "; dtb__309; " with e -> dt_report_exn e (Printexc.get_raw_backtrace ()); exit 2)"]) else dtb__309))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__311) -> (match dtb__311 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__312; Base_dPair.f_Base_dPair_dPair_second = dtb__313 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (String.concat "" ["external "; (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName d)); " : "; ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dirTyText (st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual) dtb__312); " = "; (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_docamlString dtb__313)]); Base_dPair.f_Base_dPair_dPair_second = st }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefExtern d)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__314, dtb__315) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenDef mc0) dtb__314)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__316; Base_dPair.f_Base_dPair_dPair_second = dtb__317 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies dtb__317) dtb__315)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__318; Base_dPair.f_Base_dPair_dPair_second = dtb__319 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__316, dtb__318)); Base_dPair.f_Base_dPair_dPair_second = dtb__319 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc0 }))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGroup = (fun st group -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies st) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs group))) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__320; Base_dPair.f_Base_dPair_dPair_second = dtb__321 } -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__322, dtb__323) -> (match dtb__323 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefExtern dtb__322) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__324) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\n") dtb__320); Base_dPair.f_Base_dPair_dPair_second = dtb__321 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ((if (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupIsRec group) then "let rec " else "let ") ^ ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") dtb__320)); Base_dPair.f_Base_dPair_dPair_second = dtb__321 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ((if (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupIsRec group) then "let rec " else "let ") ^ ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") dtb__320)); Base_dPair.f_Base_dPair_dPair_second = dtb__321 }))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ((if (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupIsRec group) then "let rec " else "let ") ^ ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") dtb__320)); Base_dPair.f_Base_dPair_dPair_second = dtb__321 }))
)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs group))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__325, dtb__326) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroup mc0) dtb__325)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__327; Base_dPair.f_Base_dPair_dPair_second = dtb__328 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups dtb__328) dtb__326)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__329; Base_dPair.f_Base_dPair_dPair_second = dtb__330 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__327, dtb__329)); Base_dPair.f_Base_dPair_dPair_second = dtb__330 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc0 }))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenEntryHook = (fun st entry printResult -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr st) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryShowOf entry))) (fun sp -> (match sp with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__331; Base_dPair.f_Base_dPair_dPair_second = dtb__332 } -> (if (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryIsActionOf entry) then (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryRunMainOf entry) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "action entry has no runMain")
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__333) -> ((fun mainP -> ((fun st2 -> ((fun runP -> ((fun st3 -> (match (((v_Vuna_dCompiler_dCodegen_dTerm_dfoldHandlers st3) (Base_dPair.v_Base_dPair_dfirstOf mainP)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryHandlersOf entry)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__334; Base_dPair.f_Base_dPair_dPair_second = dtb__335 } -> ((fun body -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dCodegen_dTerm_dhookText dtb__331) body) printResult); Base_dPair.f_Base_dPair_dPair_second = (dtb__335).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsDeps }))) (String.concat "" ["dtp_sched_main (fun () -> "; (Base_dPair.v_Base_dPair_dfirstOf runP); " "; dtb__334; ")"]))
  | _ -> failwith "DT: impossible branch"
)) (Base_dPair.v_Base_dPair_dsecondOf runP))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgenValueRef st2) dtb__333))) (Base_dPair.v_Base_dPair_dsecondOf mainP))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgenValueRef dtb__332) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryMainOf entry)))
  | _ -> failwith "DT: impossible branch"
) else ((fun mainP -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dCodegen_dTerm_dhookText dtb__331) (Base_dPair.v_Base_dPair_dfirstOf mainP)) printResult); Base_dPair.f_Base_dPair_dPair_second = ((Base_dPair.v_Base_dPair_dsecondOf mainP)).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsDeps }))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgenValueRef dtb__332) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryMainOf entry))))
  | _ -> failwith "DT: impossible branch"
))))
