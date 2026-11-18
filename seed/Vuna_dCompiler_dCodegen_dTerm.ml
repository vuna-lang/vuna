open Vuna_runtime
type t_Vuna_dCompiler_dCodegen_dTerm_dGenSt = { f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsShared : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrShared; f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual : Vuna_dCompiler_dCodegen_dDecl.t_Vuna_dCompiler_dCodegen_dDecl_dQualCtx; f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsDeps : string Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsNormPath : (string) -> string }

# 578 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_ddtSchedRuntime = "(* ------------------------------------------------------------------ *)\n(* Single-threaded cooperative fiber scheduler.                        *)\n(*                                                                     *)\n(* Fibers are one-shot OCaml 5 continuations captured by the root      *)\n(* Effect.Deep handler installed for every fiber. The scheduler loop   *)\n(* outside the fibers decides what runs next; suspension is requested  *)\n(* through private runtime effects (SchedYield/SchedAwait/WaitScope).  *)\n(* Tasks are `Eff Nil a` thunks: their user effects are handled       *)\n(* inside the fiber, and only the scheduler primitives cross fibers.   *)\n(* ------------------------------------------------------------------ *)\n\ntype _ Effect.t +=\n  | SchedYield : int Effect.t\n  | SchedAwait : int -> int Effect.t\n  | SchedWaitScope : int -> int Effect.t\n  | SchedWaitScopeTimeout : int * int -> int Effect.t\n\ntype dtp_sched_step =\n  | SchedStepYield of Obj.t\n  | SchedStepAwait of int * Obj.t\n  | SchedStepScope of int * Obj.t\n  | SchedStepScopeTimeout of int * int * Obj.t\n  | SchedStepDone of Obj.t\n  | SchedStepFailed of exn * Printexc.raw_backtrace\n\ntype dtp_sched_wait = SchedWaitNone | SchedWaitTask of int | SchedWaitScope of int | SchedWaitTimed\n\ntype dtp_sched_state =\n  | SchedQueued of Obj.t\n  | SchedRunning\n  | SchedSuspended\n  | SchedDone of Obj.t\n  | SchedFailed of exn * Printexc.raw_backtrace\n  | SchedCancelled\n\ntype dtp_sched_task = {\n  sched_tid : int;\n  mutable sched_state : dtp_sched_state;\n  mutable sched_start : (unit -> Obj.t) option;\n  mutable sched_cont : Obj.t option;\n  sched_scope : int;\n  mutable sched_wait : dtp_sched_wait;\n  mutable sched_waiters : int list;\n  mutable sched_cancel : bool;\n  mutable sched_grace : int;\n}\n\ntype dtp_sched_scope = {\n  sched_sid : int;\n  mutable sched_tasks : int list;\n  mutable sched_failed : string option;\n  mutable sched_waiters : int list;\n  mutable sched_timeout : bool;\n  mutable sched_completed : int;\n}\n\nlet dtp_sched_tasks : (int, dtp_sched_task) Hashtbl.t = Hashtbl.create 64\nlet dtp_sched_scopes : (int, dtp_sched_scope) Hashtbl.t = Hashtbl.create 16\nlet dtp_sched_ready : int Queue.t = Queue.create ()\nlet dtp_sched_next_task = ref 0\nlet dtp_sched_next_scope = ref 0\nlet dtp_sched_timeouts : (int * int * int) list ref = ref []\nlet dtp_sched_main_tid = ref 0\nlet dtp_sched_current = ref (-1)\nlet dtp_sched_main_result : Obj.t option ref = ref None\nlet dtp_sched_main_exn : (exn * Printexc.raw_backtrace) option ref = ref None\nlet dtp_sched_grace_steps = 64\n\nlet dtp_sched_reset () =\n  Hashtbl.reset dtp_sched_tasks;\n  Hashtbl.reset dtp_sched_scopes;\n  dtp_cleanup_reset ();\n  Queue.clear dtp_sched_ready;\n  dtp_sched_next_task := 0;\n  dtp_sched_next_scope := 0;\n  dtp_sched_timeouts := [];\n  dtp_sched_main_tid := 0;\n  dtp_sched_current := -1;\n  dtp_sched_main_result := None;\n  dtp_sched_main_exn := None\n\nlet dtp_sched_task id =\n  match Hashtbl.find_opt dtp_sched_tasks id with\n  | Some t -> t\n  | None -> failwith \"scheduler: invalid task handle\"\n\nlet dtp_sched_scope id =\n  match Hashtbl.find_opt dtp_sched_scopes id with\n  | Some s -> s\n  | None -> failwith \"scheduler: invalid scope handle\"\n\nlet dtp_sched_exn_msg e =\n  match e with\n  | Effect.Unhandled (Perform (key, name, _)) ->\n    Printf.sprintf \"unhandled effect %s (instance %s)\" key name\n  | Failure m -> m\n  | _ -> Printexc.to_string e\n\nlet dtp_sched_task_status t =\n  if t.sched_cancel then 1\n  else match t.sched_state with\n    | SchedDone _ -> 0\n    | SchedFailed _ -> 2\n    | SchedCancelled -> 1\n    | _ -> 0\n\nlet dtp_sched_enqueue t v =\n  t.sched_state <- SchedQueued v;\n  Queue.push t.sched_tid dtp_sched_ready\n\nlet dtp_sched_wake_scope s =\n  if s.sched_tasks = [] && s.sched_waiters <> [] then begin\n    let status =\n      if s.sched_timeout then 2\n      else if s.sched_failed <> None then 1\n      else 0\n    in\n    let ws = s.sched_waiters in\n    s.sched_waiters <- [];\n    dtp_sched_timeouts := List.filter (fun (w, _, _) -> not (List.mem w ws)) !dtp_sched_timeouts;\n    List.iter (fun wid ->\n      let w = dtp_sched_task wid in\n      w.sched_wait <- SchedWaitNone;\n      dtp_sched_enqueue w (Obj.repr status)) ws\n  end\n\nlet dtp_sched_finish t st =\n  t.sched_state <- st;\n  t.sched_wait <- SchedWaitNone;\n  let ws = t.sched_waiters in\n  t.sched_waiters <- [];\n  let status = dtp_sched_task_status t in\n  List.iter (fun wid ->\n    let w = dtp_sched_task wid in\n    w.sched_wait <- SchedWaitNone;\n    dtp_sched_enqueue w (Obj.repr status)) ws;\n  if t.sched_tid = !dtp_sched_main_tid then begin\n    match st with\n    | SchedDone v -> dtp_sched_main_result := Some v\n    | SchedFailed (e, bt) -> dtp_sched_main_exn := Some (e, bt)\n    | _ -> ()\n  end;\n  match Hashtbl.find_opt dtp_sched_scopes t.sched_scope with\n  | Some s ->\n    s.sched_tasks <- List.filter (fun x -> x <> t.sched_tid) s.sched_tasks;\n    s.sched_completed <- s.sched_completed + 1;\n    dtp_sched_wake_scope s\n  | None -> ()\n\nlet dtp_sched_remove_waiter t =\n  match t.sched_wait with\n  | SchedWaitTask id ->\n    let tg = dtp_sched_task id in\n    tg.sched_waiters <- List.filter (fun x -> x <> t.sched_tid) tg.sched_waiters\n  | SchedWaitScope id ->\n    let s = dtp_sched_scope id in\n    s.sched_waiters <- List.filter (fun x -> x <> t.sched_tid) s.sched_waiters\n  | SchedWaitTimed | SchedWaitNone -> ()\n\nlet dtp_sched_cancel_task t =\n  let terminal = match t.sched_state with\n    | SchedDone _ | SchedFailed _ | SchedCancelled -> true\n    | _ -> false\n  in\n  if t.sched_cancel || terminal then ()\n  else begin\n    t.sched_cancel <- true;\n    match t.sched_state with\n    | SchedQueued _ -> if t.sched_start <> None then dtp_sched_finish t SchedCancelled\n      else t.sched_state <- SchedQueued (Obj.repr 1)\n    | SchedSuspended ->\n      let code = match t.sched_wait with\n        | SchedWaitTask _ -> 1\n        | SchedWaitScope _ | SchedWaitTimed -> 3\n        | SchedWaitNone -> 1\n      in\n      dtp_sched_remove_waiter t;\n      dtp_sched_timeouts := List.filter (fun (w, _, _) -> w <> t.sched_tid) !dtp_sched_timeouts;\n      dtp_sched_enqueue t (Obj.repr code)\n    | _ -> ()\n  end\n\nlet dtp_sched_cancel_scope_tasks sid =\n  let s = dtp_sched_scope sid in\n  List.iter (fun id -> dtp_sched_cancel_task (dtp_sched_task id)) s.sched_tasks\n\nlet dtp_sched_effc (type a) (eff : a Effect.t)\n  : ((a, Obj.t) Effect.Deep.continuation -> Obj.t) option =\n  match eff with\n  | SchedYield -> Some (fun k -> Obj.repr (SchedStepYield (Obj.repr k)))\n  | SchedAwait id -> Some (fun k -> Obj.repr (SchedStepAwait (id, Obj.repr k)))\n  | SchedWaitScope id -> Some (fun k -> Obj.repr (SchedStepScope (id, Obj.repr k)))\n  | SchedWaitScopeTimeout (n, id) ->\n    Some (fun k -> Obj.repr (SchedStepScopeTimeout (n, id, Obj.repr k)))\n  | _ -> None\n\nlet dtp_sched_run_fresh t =\n  let start = match t.sched_start with\n    | Some f -> f\n    | None -> failwith \"scheduler: no start thunk\" in\n  t.sched_start <- None;\n  let r = Effect.Deep.match_with\n      (fun () -> start ())\n      ()\n      { retc = (fun x -> Obj.repr (SchedStepDone x));\n        exnc = (fun e -> Obj.repr (SchedStepFailed (e, Printexc.get_raw_backtrace ())));\n        effc = dtp_sched_effc } in\n  (Obj.obj r : dtp_sched_step)\n\nlet dtp_sched_run_resume t v =\n  let k = match t.sched_cont with\n    | Some rep -> (Obj.magic rep : (Obj.t, Obj.t) Effect.Deep.continuation)\n    | None -> failwith \"scheduler: no continuation\" in\n  let r = Effect.Deep.continue k v in\n  (Obj.obj r : dtp_sched_step)\n\nlet dtp_sched_new_task scope start =\n  let id = !dtp_sched_next_task in\n  dtp_sched_next_task := id + 1;\n  let t = {\n    sched_tid = id;\n    sched_state = SchedQueued (Obj.repr 0);\n    sched_start = Some start;\n    sched_cont = None;\n    sched_scope = scope;\n    sched_wait = SchedWaitNone;\n    sched_waiters = [];\n    sched_cancel = false;\n    sched_grace = dtp_sched_grace_steps;\n  } in\n  Hashtbl.replace dtp_sched_tasks id t;\n  (match Hashtbl.find_opt dtp_sched_scopes scope with\n   | Some s -> s.sched_tasks <- id :: s.sched_tasks\n   | None -> ());\n  Queue.push id dtp_sched_ready;\n  t\n\nlet dtp_sched_new_scope () =\n  let id = !dtp_sched_next_scope in\n  dtp_sched_next_scope := id + 1;\n  Hashtbl.replace dtp_sched_scopes id {\n    sched_sid = id;\n    sched_tasks = [];\n    sched_failed = None;\n    sched_waiters = [];\n    sched_timeout = false;\n    sched_completed = 0;\n  };\n  id\n\nlet dtp_sched_step t =\n  if t.sched_cancel then t.sched_grace <- t.sched_grace - 1;\n  if t.sched_cancel && t.sched_grace <= 0 then begin\n    (* \231\161\172\228\184\173\230\173\162\239\188\154\231\187\173\229\187\182\232\162\171\228\184\162\229\188\131\239\188\140bracket \231\154\132\229\186\147\229\177\130 finally \228\184\141\228\188\154\232\183\145\239\188\155\229\176\189\229\138\155\230\137\167\232\161\140\230\156\170\229\188\185\229\135\186\231\154\132\n       cleanup\239\188\136\229\174\131\228\187\172\229\143\170\232\131\189\229\129\154\230\151\160\230\149\136\229\186\148/\232\135\170\229\140\133\229\144\171\231\154\132\230\184\133\231\144\134\239\188\154\230\140\130\232\181\183\231\130\185\228\185\139\229\164\150\230\178\161\230\156\137 handler \230\160\136\239\188\137\227\128\130 *)\n    dtp_cleanup_run_all_for t.sched_tid;\n    dtp_cleanup_forget t.sched_tid;\n    dtp_sched_finish t SchedCancelled;\n    None\n  end\n  else Some (match t.sched_start with\n    | Some _ -> dtp_sched_run_fresh t\n    | None -> match t.sched_state with\n      | SchedQueued v -> t.sched_state <- SchedRunning; dtp_sched_run_resume t v\n      | _ -> failwith \"scheduler: bad task state\")\n\nlet dtp_sched_apply t (st : dtp_sched_step) =\n  match st with\n  | SchedStepYield krep ->\n    t.sched_cont <- Some krep;\n    t.sched_wait <- SchedWaitNone;\n    dtp_sched_enqueue t (Obj.repr (if t.sched_cancel then 1 else 0))\n  | SchedStepAwait (id, krep) ->\n    t.sched_cont <- Some krep;\n    t.sched_wait <- SchedWaitTask id;\n    t.sched_state <- SchedSuspended;\n    let tg = dtp_sched_task id in\n    tg.sched_waiters <- t.sched_tid :: tg.sched_waiters\n  | SchedStepScope (id, krep) ->\n    t.sched_cont <- Some krep;\n    t.sched_wait <- SchedWaitScope id;\n    t.sched_state <- SchedSuspended;\n    let s = dtp_sched_scope id in\n    s.sched_waiters <- t.sched_tid :: s.sched_waiters\n  | SchedStepScopeTimeout (n, id, krep) ->\n    t.sched_cont <- Some krep;\n    t.sched_wait <- SchedWaitTimed;\n    t.sched_state <- SchedSuspended;\n    let s = dtp_sched_scope id in\n    s.sched_waiters <- t.sched_tid :: s.sched_waiters;\n    (* n \230\152\175\227\128\140\229\188\128\229\167\139\231\173\137\229\190\133\228\185\139\229\144\142\227\128\141\231\154\132\232\176\131\229\186\166\230\173\165\233\162\132\231\174\151\239\188\154\230\173\166\232\163\133\232\191\153\230\172\161\231\173\137\229\190\133\231\154\132\233\130\163\228\184\128\230\173\165\228\184\141\231\174\151\227\128\130 *)\n    dtp_sched_timeouts := (t.sched_tid, id, n + 1) :: !dtp_sched_timeouts\n  | SchedStepDone v ->\n    (* \230\173\163\229\184\184\231\187\147\230\157\159\239\188\154bracket \229\183\178\232\135\170\232\161\140\229\188\185\229\135\186\239\188\155\230\174\139\231\149\153\239\188\136\229\188\130\229\184\184\232\190\185\232\167\146\239\188\137\228\185\159\228\184\128\229\185\182\230\184\133\230\142\137\227\128\130 *)\n    dtp_cleanup_run_all_for t.sched_tid;\n    dtp_cleanup_forget t.sched_tid;\n    dtp_sched_finish t (if t.sched_cancel then SchedCancelled else SchedDone v)\n  | SchedStepFailed (e, bt) ->\n    (* \229\188\130\229\184\184\231\169\191\232\191\135\231\186\164\231\168\139\230\160\185 handler\239\188\154\232\162\171\228\184\162\229\188\131\231\154\132\231\187\173\229\187\182\233\135\140\231\154\132 bracket cleanup \229\156\168\232\191\153\233\135\140\229\133\156\229\186\149\227\128\130 *)\n    dtp_cleanup_run_all_for t.sched_tid;\n    dtp_cleanup_forget t.sched_tid;\n    if t.sched_tid = !dtp_sched_main_tid then dtp_sched_finish t (SchedFailed (e, bt))\n    else begin\n      let s = dtp_sched_scope t.sched_scope in\n      if s.sched_failed = None then s.sched_failed <- Some (dtp_sched_exn_msg e);\n      dtp_sched_finish t (SchedFailed (e, bt));\n      dtp_sched_cancel_scope_tasks t.sched_scope\n    end\n\nlet dtp_sched_tick () =\n  let expired = ref [] in\n  dtp_sched_timeouts := List.map (fun (w, sc, n) -> (w, sc, n - 1)) !dtp_sched_timeouts;\n  dtp_sched_timeouts := List.filter (fun (w, sc, n) ->\n    if n > 0 then true else (expired := (w, sc) :: !expired; false)) !dtp_sched_timeouts;\n  List.iter (fun (_, sc) ->\n    let s = dtp_sched_scope sc in\n    if not s.sched_timeout then begin\n      s.sched_timeout <- true;\n      dtp_sched_cancel_scope_tasks sc\n    end) !expired\n\nlet dtp_sched_runnable t =\n  match t.sched_state with SchedQueued _ -> true | _ -> false\n\nlet dtp_sched_run_one t =\n  if dtp_sched_runnable t then begin\n    dtp_sched_current := t.sched_tid;\n    dtp_cleanup_fiber := t.sched_tid;\n    (match dtp_sched_step t with\n     | Some st -> dtp_sched_apply t st\n     | None -> ());\n    dtp_cleanup_fiber := -1;\n    dtp_sched_current := -1\n  end\n\nlet dtp_sched_deadlock () = failwith \"scheduler: deadlock (no runnable task)\"\n\nlet dtp_sched_loop () =\n  let rec loop () =\n    if !dtp_sched_main_result <> None || !dtp_sched_main_exn <> None then ()\n    else if Queue.is_empty dtp_sched_ready then dtp_sched_deadlock ()\n    else begin\n      let tid = Queue.pop dtp_sched_ready in\n      dtp_sched_run_one (dtp_sched_task tid);\n      dtp_sched_tick ();\n      loop ()\n    end\n  in loop ()\n\nlet dtp_sched_drain () =\n  let rec loop () =\n    if Queue.is_empty dtp_sched_ready then ()\n    else begin\n      let tid = Queue.pop dtp_sched_ready in\n      dtp_sched_run_one (dtp_sched_task tid);\n      loop ()\n    end\n  in loop ()\n\nlet dtp_sched_cancel_leftovers () =\n  Hashtbl.iter (fun _ t -> match t.sched_state with\n    | SchedDone _ | SchedFailed _ | SchedCancelled -> ()\n    | _ -> dtp_sched_cancel_task t) dtp_sched_tasks\n\nlet dtp_sched_main (th : unit -> 'a) : 'a =\n  dtp_sched_reset ();\n  ignore (dtp_sched_new_scope ());\n  let main = dtp_sched_new_task 0 (fun () -> Obj.repr (th ())) in\n  dtp_sched_main_tid := main.sched_tid;\n  (try dtp_sched_loop ()\n   with e -> dtp_sched_cancel_leftovers (); dtp_sched_drain (); raise e);\n  dtp_sched_cancel_leftovers ();\n  dtp_sched_drain ();\n  match !dtp_sched_main_exn with\n  | Some (e, bt) -> Printexc.raise_with_backtrace e bt\n  | None -> match !dtp_sched_main_result with\n    | Some v -> (Obj.obj v : 'a)\n    | None -> failwith \"scheduler: main did not finish\"\n\n(* scheduler primitives exposed to Base.EffSched through hidden intrinsics *)\n\nlet dtp_sched_fork (scope : int) (f : int -> 'a) : int =\n  (dtp_sched_new_task scope (fun () -> Obj.repr (f 0))).sched_tid\n\nlet dtp_sched_current_task () =\n  if !dtp_sched_current < 0 then failwith \"scheduler: no current fiber\"\n  else dtp_sched_task !dtp_sched_current\n\nlet dtp_sched_yield () : int = Effect.perform SchedYield\n\nlet dtp_sched_is_cancelled () : int =\n  match Hashtbl.find_opt dtp_sched_tasks !dtp_sched_current with\n  | Some t -> if t.sched_cancel then 1 else 0\n  | None -> 0\n\nlet dtp_sched_await (id : int) : int =\n  let self = dtp_sched_current_task () in\n  if self.sched_cancel then begin ignore (Effect.perform SchedYield); 1 end\n  else begin\n    let target = dtp_sched_task id in\n    match target.sched_state with\n    | SchedDone _ | SchedFailed _ | SchedCancelled -> dtp_sched_task_status target\n    | _ -> Effect.perform (SchedAwait id)\n  end\n\nlet dtp_sched_task_result (id : int) : 'a =\n  match (dtp_sched_task id).sched_state with\n  | SchedDone v -> Obj.obj v\n  | _ -> failwith \"scheduler: task has no result\"\n\nlet dtp_sched_task_error (id : int) : string =\n  match (dtp_sched_task id).sched_state with\n  | SchedFailed (e, _) -> dtp_sched_exn_msg e\n  | _ -> \"\"\n\nlet dtp_sched_cancel_task_prim (id : int) : int =\n  dtp_sched_cancel_task (dtp_sched_task id);\n  0\n\nlet dtp_sched_cancel_scope (id : int) : int =\n  dtp_sched_cancel_scope_tasks id;\n  0\n\nlet dtp_sched_scope_status (s : dtp_sched_scope) : int =\n  if s.sched_timeout then 2\n  else if s.sched_failed <> None then 1\n  else 0\n\nlet dtp_sched_scope_wait (id : int) : int =\n  let s = dtp_sched_scope id in\n  let self = dtp_sched_current_task () in\n  if self.sched_cancel then begin ignore (Effect.perform SchedYield); 3 end\n  else if s.sched_tasks = [] then dtp_sched_scope_status s\n  else Effect.perform (SchedWaitScope id)\n\nlet dtp_sched_scope_wait_timeout (steps : int) (id : int) : int =\n  let s = dtp_sched_scope id in\n  let self = dtp_sched_current_task () in\n  if self.sched_cancel then begin ignore (Effect.perform SchedYield); 3 end\n  else if s.sched_tasks = [] then dtp_sched_scope_status s\n  else if steps <= 0 then begin\n    s.sched_timeout <- true;\n    dtp_sched_cancel_scope_tasks id;\n    Effect.perform (SchedWaitScope id)\n  end else\n    Effect.perform (SchedWaitScopeTimeout (steps, id))\n\nlet dtp_sched_scope_error (id : int) : string =\n  let s = dtp_sched_scope id in\n  match s.sched_failed with\n  | Some msg -> msg\n  | None -> \"\"\n\nlet dtp_sched_scope_count (id : int) : int =\n  (dtp_sched_scope id).sched_completed\n"

# 107 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_ddtPrimRuntime = ("type _ Effect.t += Perform : string * string * Obj.t -> Obj.t Effect.t\n\n(* bracket \231\154\132 abort cleanup \231\153\187\232\174\176\232\161\168\239\188\136\230\175\143\231\186\164\231\168\139\228\184\128\228\187\189\239\188\140LIFO\239\188\137\227\128\130\n   `prim_effectHandle` \229\156\168\229\174\137\232\163\133 handler \230\151\182\232\174\176\228\184\139\229\189\147\229\137\141\230\183\177\229\186\166 mark\239\188\155handler \230\173\163\229\184\184\232\191\148\229\155\158 /\n   \230\138\155\229\188\130\229\184\184 / \228\184\162\229\188\131\231\187\173\229\187\182\239\188\136abort\239\188\137\230\151\182\239\188\140\230\138\138 mark \228\185\139\228\184\138\228\187\141\230\156\170\229\188\185\229\135\186\231\154\132 cleanup \233\128\144\228\184\170\230\137\167\232\161\140\226\128\148\226\128\148\232\191\153\228\186\155\n   \230\173\163\230\152\175\232\162\171\228\184\162\229\188\131\231\154\132\231\187\173\229\187\182\233\135\140\230\137\147\229\188\128\231\154\132 bracket\227\128\130\231\186\164\231\168\139\231\148\168 `dtp_cleanup_fiber` \229\140\186\229\136\134\239\188\136\232\176\131\229\186\166\229\153\168\229\156\168\n   \232\191\144\232\161\140\230\159\144\228\184\170\228\187\187\229\138\161\230\151\182\232\174\190\231\189\174\229\174\131\239\188\137\239\188\155\233\157\158\232\176\131\229\186\166\229\153\168\228\184\138\228\184\139\230\150\135\239\188\136-1\239\188\137\230\156\137\228\184\128\228\187\189\231\139\172\231\171\139\230\160\136\227\128\130\n   \230\179\168\230\132\143\239\188\154cleanup \229\156\168 handler \233\128\128\229\135\186\231\130\185\230\137\167\232\161\140\239\188\140\229\143\170\232\131\189\232\174\191\233\151\174**\229\164\150\229\177\130** handler\239\188\136\229\189\147\229\137\141 handler\n   \231\154\132\230\149\136\229\186\148\229\156\168\232\175\165\231\130\185\228\184\141\229\143\175\231\148\168\239\188\137\239\188\155\230\137\167\232\161\140\230\156\159\229\188\130\229\184\184\232\162\171\229\144\158\230\142\137\239\188\140\233\129\191\229\133\141\230\177\161\230\159\147 abort \231\187\147\230\158\156\227\128\130 *)\nlet dtp_cleanup_fiber = ref (-1)\nlet dtp_cleanup_stacks : (int, (unit -> unit) list ref) Hashtbl.t = Hashtbl.create 8\nlet dtp_cleanup_stack_of (fid : int) =\n  match Hashtbl.find_opt dtp_cleanup_stacks fid with\n  | Some r -> r\n  | None ->\n    let r = ref [] in\n    Hashtbl.replace dtp_cleanup_stacks fid r;\n    r\nlet dtp_cleanup_current () = dtp_cleanup_stack_of !dtp_cleanup_fiber\nlet dtp_cleanup_mark () = List.length !(dtp_cleanup_current ())\nlet dtp_cleanup_push (f : int -> int) : int =\n  let r = dtp_cleanup_current () in\n  r := (fun () -> ignore (f 0)) :: !r;\n  0\nlet dtp_cleanup_pop (_ : int) : int =\n  let r = dtp_cleanup_current () in\n  (match !r with _ :: rest -> r := rest | [] -> ());\n  0\nlet dtp_cleanup_run_to (mark : int) =\n  let r = dtp_cleanup_current () in\n  let rec go fuel =\n    if fuel <= 0 then ()\n    else if List.length !r <= mark then ()\n    else match !r with\n      | [] -> ()\n      | f :: rest -> r := rest; (try f () with _ -> ()); go (fuel - 1)\n  in\n  go 256\nlet dtp_cleanup_run_all_for (fid : int) =\n  let r = dtp_cleanup_stack_of fid in\n  let rec go fuel =\n    if fuel <= 0 then ()\n    else match !r with\n      | [] -> ()\n      | f :: rest -> r := rest; (try f () with _ -> ()); go (fuel - 1)\n  in\n  go 256\nlet dtp_cleanup_forget (fid : int) = Hashtbl.remove dtp_cleanup_stacks fid\nlet dtp_cleanup_reset () =\n  Hashtbl.reset dtp_cleanup_stacks;\n  dtp_cleanup_fiber := -1\n\n(* handler \231\154\132\232\191\144\232\161\140\230\151\182\229\163\179\239\188\154\228\184\142\230\151\167\229\134\133\232\129\148\229\174\158\231\142\176\231\173\137\228\187\183\239\188\140\228\189\134 handler \233\128\128\229\135\186\230\151\182\230\184\133\230\142\137\229\133\182 extent \229\134\133\230\174\139\231\149\153\231\154\132\n   bracket cleanup\239\188\136abort = \231\187\173\229\187\182\232\162\171\228\184\162\229\188\131\239\188\140\229\186\147\229\177\130 finally \228\184\141\228\188\154\229\134\141\232\183\145\239\188\137\227\128\130 *)\n(* \229\189\147\229\137\141 handler \231\154\132 self \230\160\136\239\188\136\230\175\143\228\184\170 Domain \228\184\128\228\187\189\239\188\137\239\188\154opH \230\137\167\232\161\140\230\156\159\233\151\180\230\138\138\n   (key,name,ret,h) \229\142\139\230\160\136\239\188\140`prim_effectSelf` \231\148\168\229\174\131\230\138\138\229\173\144\232\174\161\231\174\151\233\135\141\230\150\176\232\163\133\232\191\155\229\144\140\228\184\128\228\184\170 handler\227\128\130 *)\nlet dtp_selfK = Domain.DLS.new_key (fun () -> ref ([] : (string * string * Obj.t * Obj.t) list))\nlet dtp_effect_run key name ret h th =\n  let mark = dtp_cleanup_mark () in\n  let run_cleanups () = dtp_cleanup_run_to mark in\n  (* \229\164\150\229\177\130 Obj.magic \228\184\142\230\151\167\229\134\133\232\129\148\229\174\158\231\142\176\228\184\128\232\135\180\239\188\154effc \231\154\132 continue \232\191\148\229\155\158 Obj.t\239\188\140\229\142\187\230\142\137\229\174\131\228\188\154\232\174\169\n     handler \231\154\132 answer \231\177\187\229\158\139\232\162\171\233\146\137\230\136\144 Obj.t\227\128\130 *)\n  Obj.magic\n    (match Effect.Deep.match_with th ()\n      { retc = (fun x -> (Obj.magic ret) x);\n        exnc = (fun e -> raise e);\n        effc = (fun (type a) (eff : a Effect.t) -> match eff with\n          | Perform (k, n, payload) when k = key && n = name ->\n            Some (fun (cont : (a, Obj.t) Effect.Deep.continuation) ->\n              let st = Domain.DLS.get dtp_selfK in\n              let saved = !st in\n              st := (key, name, Obj.repr ret, Obj.repr h) :: saved;\n              Fun.protect\n                ~finally:(fun () -> st := saved)\n                (fun () ->\n                  (Obj.magic h) payload (fun v -> Effect.Deep.continue cont (Obj.repr v))))\n          | _ -> None) }\n    with\n    | r -> run_cleanups (); r\n    | exception e -> run_cleanups (); raise e)\nlet dtp_effect_handle key name ret h th =\n  fun u -> dtp_effect_run key name ret h (fun () -> (Obj.magic th) u)\nlet dtp_effect_self th =\n  match !(Domain.DLS.get dtp_selfK) with\n  | (key, name, ret, h) :: _ -> dtp_effect_run key name ret h (fun () -> (Obj.magic th) 0)\n  | [] -> failwith \"self outside handler\"\nlet dtp_print s =\n  (try print_string s; flush stdout; String.length s\n   with _ -> 0)  (* \229\134\153\229\164\177\232\180\165\239\188\136\229\133\184\229\158\139 EPIPE\239\188\154`vuna \226\128\166 | head`\239\188\137\228\184\141\229\134\141\230\152\175\229\174\191\228\184\187\229\180\169\230\186\131\239\188\155\232\190\147\229\135\186\229\136\176\230\173\164\228\184\186\230\173\162 *)\nlet dtp_async_tbl : (int, unit -> Obj.t) Hashtbl.t = Hashtbl.create 16\nlet dtp_async_next = ref 0\nlet dtp_async_fork th =\n  let id = !dtp_async_next in\n  incr dtp_async_next;\n  let d = Domain.spawn (fun () -> th 0) in\n  Hashtbl.replace dtp_async_tbl id (fun () -> Obj.repr (Domain.join d));\n  id\nlet dtp_async_await (h : int) : Obj.t =\n  match Hashtbl.find_opt dtp_async_tbl h with\n  | Some join -> join ()\n  | None -> failwith \"async: invalid task handle\"\n(* \229\174\191\228\184\187\229\164\177\232\180\165\233\128\154\233\129\147\239\188\154try \229\143\152\228\189\147\228\184\141\230\138\155\229\174\191\228\184\187\229\188\130\229\184\184\239\188\140\232\128\140\230\152\175\230\138\138\229\164\177\232\180\165\231\160\129\229\134\153\232\191\155**\229\189\147\229\137\141 Domain** \231\154\132\231\138\182\230\128\129\230\167\189\239\188\140\n   \232\191\148\229\155\158\233\187\152\232\174\164\229\128\188\239\188\155base \231\154\132\229\174\191\228\184\187 handler \233\154\143\229\144\142\232\175\187 status \232\189\172\230\136\144 typed error\227\128\1300 = \230\136\144\229\138\159\227\128\130\n   \231\148\168 Domain.DLS \232\128\140\228\184\141\230\152\175\229\133\168\229\177\128 ref\239\188\154\229\188\130\230\173\165\228\187\187\229\138\161\228\188\154\229\156\168\229\136\171\231\154\132 Domain \228\184\138\232\183\145\227\128\130 *)\nlet dtp_hostStatusK = Domain.DLS.new_key (fun () -> ref 0)\nlet dtp_hostSetStatus c = (Domain.DLS.get dtp_hostStatusK) := c\nlet dtp_hostStatus () = !(Domain.DLS.get dtp_hostStatusK)\nlet dtp_hostCode (e : exn) : int =\n  match e with\n  | Unix.Unix_error (Unix.ENOENT, _, _) -> 1\n  | Unix.Unix_error ((Unix.EACCES | Unix.EPERM), _, _) -> 2\n  | Unix.Unix_error (Unix.ENOSPC, _, _) -> 3\n  | Unix.Unix_error (Unix.ENOTDIR, _, _) -> 4\n  | Unix.Unix_error (Unix.EISDIR, _, _) -> 5\n  | Unix.Unix_error (Unix.EEXIST, _, _) -> 6\n  | _ -> 9\n(* `Sys_error` \228\184\141\229\184\166 errno\239\188\155\229\133\136 `Unix.stat` \228\184\128\230\172\161\230\139\191\229\136\176\229\133\183\228\189\147\229\142\159\229\155\160\239\188\140\229\134\141\233\128\128\229\155\158\233\128\154\231\148\168\231\160\129\227\128\130 *)\nlet dtp_hostCodeAt path (e : exn) : int =\n  try ignore (Unix.stat path); dtp_hostCode e\n  with e2 -> dtp_hostCode e2\nlet dtp_hostFail code = dtp_hostSetStatus (if code = 0 then 9 else code)\nlet dtp_hostReset () = dtp_hostSetStatus 0\nlet dtp_hostMark code e =\n  ignore e;\n  dtp_hostSetStatus (if code = 0 then 9 else code)\nlet dtp_readFile path =\n  try\n    let ch = open_in_bin path in\n    Fun.protect ~finally:(fun () -> close_in_noerr ch)\n      (fun () -> really_input_string ch (in_channel_length ch))\n  with Sys_error msg -> failwith (\"readFile: \" ^ msg)\nlet dtp_writeFile path contents =\n  try\n    let ch = open_out_bin path in\n    Fun.protect ~finally:(fun () -> close_out_noerr ch)\n      (fun () -> output_string ch contents);\n    String.length contents\n  with Sys_error msg -> failwith (\"writeFile: \" ^ msg)\nlet dtp_writeFileAtomic path contents =\n  let tmp = path ^ \".\" ^ string_of_int (Unix.getpid ()) ^ \".tmp\" in\n  let write () =\n    let ch = open_out_bin tmp in\n    Fun.protect ~finally:(fun () -> close_out_noerr ch) (fun () -> output_string ch contents) in\n  (try write (); Sys.rename tmp path; String.length contents\n   with e -> (try Sys.remove tmp with _ -> ()); raise e)\nlet dtp_getArgs () =\n  let argv = Sys.argv in\n  let n = Array.length argv in\n  if n <= 1 then [] else Array.to_list (Array.sub argv 1 (n - 1))\nlet dtp_readLine () =\n  (try dtp_hostReset (); input_line stdin\n   with End_of_file -> dtp_hostSetStatus 1; \"\")\nlet dtp_readBytes n =\n  if n <= 0 then (dtp_hostSetStatus 1; \"\")\n  else\n    let b = Bytes.create n in\n    let k = (try dtp_hostReset (); input stdin b 0 n with _ -> 0) in\n    if k <= 0 then (dtp_hostSetStatus 1; \"\") else Bytes.sub_string b 0 k\nlet dtp_readDir path =\n  try List.sort compare (Array.to_list (Sys.readdir path))\n  with Sys_error msg -> failwith (\"readDir: \" ^ msg)\nlet dtp_isDirectory path =\n  try Sys.is_directory path with Sys_error msg -> failwith (\"isDirectory: \" ^ msg)\nlet dtp_makeDir path =\n  try (if Sys.file_exists path then 0 else (Sys.mkdir path 0o755; 0))\n  with Sys_error msg -> failwith (\"makeDir: \" ^ msg)\nlet dtp_removeFile path =\n  try (if Sys.file_exists path then (Sys.remove path; 0) else 0)\n  with Sys_error msg -> failwith (\"removeFile: \" ^ msg)\nlet dtp_fileExists path = Sys.file_exists path\nlet dtp_fileMtime path =\n  (try dtp_hostReset (); int_of_float (Unix.stat path).Unix.st_mtime\n   with e -> dtp_hostMark (dtp_hostCode e) e; 0)\nlet dtp_fileSize path =\n  (try dtp_hostReset (); (Unix.stat path).Unix.st_size\n   with e -> dtp_hostMark (dtp_hostCode e) e; 0)\nlet dtp_tryReadFile path =\n  (try\n     dtp_hostReset ();\n     let fd = Unix.openfile path [Unix.O_RDONLY] 0 in\n     Fun.protect ~finally:(fun () -> (try Unix.close fd with _ -> ()))\n       (fun () ->\n          let buf = Buffer.create 65536 in\n          let tmp = Bytes.create 65536 in\n          let rec go () =\n            let n = Unix.read fd tmp 0 (Bytes.length tmp) in\n            if n > 0 then (Buffer.add_subbytes buf tmp 0 n; go ()) in\n          go (); Buffer.contents buf)\n   with e -> dtp_hostMark (dtp_hostCode e) e; \"\")\nlet dtp_tryWriteFile path contents =\n  (try\n     dtp_hostReset ();\n     let fd = Unix.openfile path [Unix.O_WRONLY; Unix.O_CREAT; Unix.O_TRUNC] 0o666 in\n     Fun.protect ~finally:(fun () -> (try Unix.close fd with _ -> ()))\n       (fun () ->\n          let b = Bytes.of_string contents in\n          let n = Bytes.length b in\n          let rec go off =\n            if off < n then\n              let k = Unix.write fd b off (n - off) in\n              if k > 0 then go (off + k) in\n          go 0);\n     String.length contents\n   with e -> dtp_hostMark (dtp_hostCode e) e; 0)\nlet dtp_tryWriteFileAtomic path contents =\n  let tmp = path ^ \".\" ^ string_of_int (Unix.getpid ()) ^ \".tmp\" in\n  (try\n     dtp_hostReset ();\n     (let fd = Unix.openfile tmp [Unix.O_WRONLY; Unix.O_CREAT; Unix.O_TRUNC] 0o666 in\n      Fun.protect ~finally:(fun () -> (try Unix.close fd with _ -> ()))\n        (fun () ->\n           let b = Bytes.of_string contents in\n           let n = Bytes.length b in\n           let rec go off =\n             if off < n then\n               let k = Unix.write fd b off (n - off) in\n               if k > 0 then go (off + k) in\n           go 0));\n     Unix.rename tmp path;\n     String.length contents\n   with e -> (try Unix.unlink tmp with _ -> ()); dtp_hostFail (dtp_hostCode e); 0)\nlet dtp_tryReadDir path =\n  (try dtp_hostReset (); List.sort compare (Array.to_list (Sys.readdir path))\n   with e -> dtp_hostFail (dtp_hostCodeAt path e); [])\nlet dtp_tryIsDirectory path =\n  (try dtp_hostReset (); (Unix.stat path).Unix.st_kind = Unix.S_DIR\n   with e -> dtp_hostMark (dtp_hostCode e) e; false)\nlet dtp_tryMakeDir path =\n  (try\n     dtp_hostReset ();\n     (try Unix.mkdir path 0o755 with Unix.Unix_error (Unix.EEXIST, _, _) -> ());\n     0\n   with e -> dtp_hostMark (dtp_hostCode e) e; 1)\nlet dtp_tryRemoveFile path =\n  (try\n     dtp_hostReset ();\n     (try Unix.unlink path with Unix.Unix_error (Unix.ENOENT, _, _) -> ());\n     0\n   with e -> dtp_hostMark (dtp_hostCode e) e; 1)\nlet dtp_tryRemoveTree path =\n  let rec go p =\n    try\n      let st = Unix.lstat p in\n      (match st.Unix.st_kind with\n       | Unix.S_DIR ->\n           Array.iter (fun e -> go (Filename.concat p e)) (Sys.readdir p);\n           Unix.rmdir p\n       | _ -> Unix.unlink p)\n    with Unix.Unix_error (Unix.ENOENT, _, _) -> () in\n  (try dtp_hostReset (); go path; 0\n   with e -> dtp_hostMark (dtp_hostCode e) e; 1)\nlet dtp_tryRename src dst =\n  (try dtp_hostReset (); Unix.rename src dst; 0\n   with e -> dtp_hostMark (dtp_hostCode e) e; 1)\nlet dtp_trySymlink target link =\n  (try dtp_hostReset (); Unix.symlink target link; 0\n   with e -> dtp_hostMark (dtp_hostCode e) e; 1)\nlet dtp_tryMakeDirExclusive path =\n  (try dtp_hostReset (); Unix.mkdir path 0o755; 0\n   with e -> dtp_hostMark (dtp_hostCode e) e; 1)\nlet dtp_isTty () = Unix.isatty Unix.stdout\nlet dtp_tryRunIn dir args =\n  let cmd = String.concat \" \" (List.map Filename.quote args) in\n  (try\n     dtp_hostReset ();\n     let old = Sys.getcwd () in\n     Fun.protect ~finally:(fun () -> Sys.chdir old) (fun () -> Sys.chdir dir; Sys.command cmd)\n   with e -> dtp_hostFail (dtp_hostCodeAt dir e); -1)\nlet dtp_timeUs () = int_of_float (Unix.gettimeofday () *. 1000000.0)\nlet dtp_sleep us =\n  (if us > 0 then Unix.sleepf (float_of_int us /. 1000000.0));\n  0\nlet dtp_getenv k = try Sys.getenv k with Not_found -> \"\"\nlet dtp_getcwd () = try Sys.getcwd () with _ -> \".\"\nlet dtp_execPath () = try Unix.readlink \"/proc/self/exe\" with _ -> Sys.executable_name\nlet dtp_arraySet (a : 'a array) (i : int) (v : 'a) =\n  let b = Array.copy a in\n  Array.set b i v; b\nlet dtp_strHash (s : string) =\n  let h = ref 0 in\n  String.iter (fun c -> h := ((!h * 33) + Char.code c) land 1023) s;\n  !h\nlet dtp_strAt (s : string) (i : int) = if i < 0 || i >= String.length s then -1 else Char.code s.[i]\nlet dtp_substring start len s =\n  let n = String.length s in\n  let st = if start < 0 then 0 else if start > n then n else start in\n  let ln = if len < 0 then 0 else if st + len > n then n - st else len in\n  String.sub s st ln\nlet dtp_exit n = exit n\nlet dtp_runIn dir args =\n  let quote s = Filename.quote s in\n  let cmd = String.concat \" \" (List.map quote args) in\n  let old = Sys.getcwd () in\n  Fun.protect ~finally:(fun () -> Sys.chdir old) (fun () -> Sys.chdir dir; Sys.command cmd)\nlet dtp_spawn (args : string list) : int =\n  let prog = Sys.executable_name in\n  Unix.create_process prog (Array.of_list (prog :: args)) Unix.stdin Unix.stdout Unix.stderr\nlet dtp_wait (pid : int) : int =\n  let (_, st) = Unix.waitpid [] pid in\n  match st with Unix.WEXITED c -> c | _ -> 1\nlet dtp_net_tbl : (int, Unix.file_descr) Hashtbl.t = Hashtbl.create 16\nlet dtp_net_next = ref 1\nlet dtp_net_put (fd : Unix.file_descr) : int =\n  let k = !dtp_net_next in\n  dtp_net_next := k + 1;\n  Hashtbl.replace dtp_net_tbl k fd;\n  k\nlet dtp_net_get (h : int) : Unix.file_descr =\n  match Hashtbl.find_opt dtp_net_tbl h with\n  | Some fd -> fd\n  | None -> dtp_hostSetStatus 8; failwith \"net: invalid handle\"\nlet dtp_net_drop (h : int) = (try Hashtbl.remove dtp_net_tbl h with _ -> ())\nlet dtp_netCodeOf (ue : Unix.error) : int =\n  match ue with\n  | Unix.ECONNREFUSED | Unix.ENOENT -> 2\n  | Unix.ETIMEDOUT -> 3\n  | Unix.EPIPE | Unix.ECONNRESET -> 4\n  | Unix.EADDRINUSE -> 5\n  | _ -> 9\nlet dtp_net_error (what : string) (e : exn) : 'a =\n  (match e with\n   | Unix.Unix_error (ue, _, _) -> dtp_hostSetStatus (dtp_netCodeOf ue)\n   | _ -> dtp_hostSetStatus 9);\n  match e with\n  | Unix.Unix_error (ue, fn, arg) ->\n    failwith (\"net: \" ^ what ^ \": \" ^ Unix.error_message ue ^ (if arg = \"\" then \"\" else \" (\" ^ arg ^ \")\"))\n  | _ -> failwith (\"net: \" ^ what ^ \": \" ^ Printexc.to_string e)\nlet dtp_net_parse (addr : string) =\n  let n = String.length addr in\n  if n > 5 && String.sub addr 0 5 = \"unix:\" then `Unix (String.sub addr 5 (n - 5))\n  else if n > 4 && String.sub addr 0 4 = \"tcp:\" then\n    let rest = String.sub addr 4 (n - 4) in\n    (match (try Some (String.rindex rest ':') with Not_found -> None) with\n     | None -> failwith (\"net: invalid address (want tcp:HOST:PORT or unix:PATH): \" ^ addr)\n     | Some i ->\n       let host = String.sub rest 0 i in\n       let portstr = String.sub rest (i + 1) (String.length rest - i - 1) in\n       let port = try int_of_string portstr with _ -> failwith (\"net: invalid port: \" ^ portstr) in\n       `Tcp (host, port))\n  else failwith (\"net: invalid address (want tcp:HOST:PORT or unix:PATH): \" ^ addr)\nlet dtp_net_listen (addr : string) : int =\n  match dtp_net_parse addr with\n  | `Unix path ->\n    (try if Sys.file_exists path then Sys.remove path with _ -> ());\n    let s = Unix.socket Unix.PF_UNIX Unix.SOCK_STREAM 0 in\n    (try Unix.bind s (Unix.ADDR_UNIX path); Unix.listen s 8; dtp_net_put s\n     with e -> (try Unix.close s with _ -> ()); dtp_net_error \"listen\" e)\n  | `Tcp (host, port) ->\n    let s = Unix.socket Unix.PF_INET Unix.SOCK_STREAM 0 in\n    (try\n       Unix.setsockopt s Unix.SO_REUSEADDR true;\n       Unix.bind s (Unix.ADDR_INET (Unix.inet_addr_of_string host, port));\n       Unix.listen s 8;\n       dtp_net_put s\n     with e -> (try Unix.close s with _ -> ()); dtp_net_error \"listen\" e)\nlet dtp_net_port (h : int) : int =\n  match Unix.getsockname (dtp_net_get h) with\n  | Unix.ADDR_INET (_, p) -> p\n  | Unix.ADDR_UNIX _ -> 0\nlet dtp_net_accept (h : int) : int =\n  (try let (fd, _) = Unix.accept (dtp_net_get h) in dtp_net_put fd\n   with e -> dtp_net_error \"accept\" e)\nlet dtp_net_recv (h : int) (n : int) : string =\n  if n <= 0 then \"\"\n  else\n    let b = Bytes.create n in\n    (try\n       let k = Unix.read (dtp_net_get h) b 0 n in\n       if k <= 0 then \"\" else Bytes.sub_string b 0 k\n     with e -> dtp_net_error \"recv\" e)\nlet dtp_net_send (h : int) (s : string) : int =\n  let fd = dtp_net_get h in\n  let n = String.length s in\n  let rec go off =\n    if off >= n then ()\n    else\n      let k = (try Unix.write_substring fd s off (n - off) with e -> dtp_net_error \"send\" e) in\n      if k <= 0 then failwith \"net: send: connection closed\" else go (off + k)\n  in\n  go 0; n\nlet dtp_net_close (h : int) : int =\n  (try Unix.close (dtp_net_get h) with _ -> ());\n  dtp_net_drop h; 0\nlet dtp_netStatus (e : exn) : int =\n  match e with\n  | Unix.Unix_error (ue, _, _) -> dtp_netCodeOf ue\n  | _ -> 6\nlet dtp_netMarkStatus (e : exn) =\n  let c = dtp_hostStatus () in\n  dtp_hostMark (if c = 0 then dtp_netStatus e else c) e\nlet dtp_try_net_listen addr =\n  (try dtp_hostReset (); dtp_net_listen addr\n   with e -> dtp_netMarkStatus e; -1)\nlet dtp_try_net_port h =\n  (try dtp_hostReset (); dtp_net_port h\n   with e -> dtp_netMarkStatus e; -1)\nlet dtp_try_net_accept h =\n  (try dtp_hostReset (); dtp_net_accept h\n   with e -> dtp_netMarkStatus e; -1)\nlet dtp_try_net_send h s =\n  (try dtp_hostReset (); dtp_net_send h s\n   with e -> dtp_netMarkStatus e; 0)\nlet dtp_try_net_recv h n =\n  if n <= 0 then (dtp_hostSetStatus 1; \"\")\n  else\n    let b = Bytes.create n in\n    (try\n       let k = Unix.read (dtp_net_get h) b 0 n in\n       if k <= 0 then (dtp_hostSetStatus 1; \"\")\n       else (dtp_hostReset (); Bytes.sub_string b 0 k)\n     with e -> dtp_netMarkStatus e; \"\")\nlet dtp_try_net_close h =\n  (try dtp_hostReset (); dtp_net_close h\n   with e -> dtp_netMarkStatus e; 0)\nlet dtp_net_connect (addr : string) : int =\n  match dtp_net_parse addr with\n  | `Unix path ->\n    let s = Unix.socket Unix.PF_UNIX Unix.SOCK_STREAM 0 in\n    (try Unix.connect s (Unix.ADDR_UNIX path); dtp_net_put s\n     with e -> (try Unix.close s with _ -> ()); dtp_net_error \"connect\" e)\n  | `Tcp (host, port) ->\n    let s = Unix.socket Unix.PF_INET Unix.SOCK_STREAM 0 in\n    (try Unix.connect s (Unix.ADDR_INET (Unix.inet_addr_of_string host, port)); dtp_net_put s\n     with e -> (try Unix.close s with _ -> ()); dtp_net_error \"connect\" e)\nlet dtp_try_net_connect addr =\n  (try dtp_hostReset (); dtp_net_connect addr\n   with e -> dtp_netMarkStatus e; -1)\nlet dtp_try_net_accept_within h micros =\n  (try\n     dtp_hostReset ();\n     let lfd = dtp_net_get h in\n     let (r, _, _) = Unix.select [lfd] [] [] (float_of_int micros /. 1000000.0) in\n     if r = [] then (dtp_hostSetStatus 7; -1)\n     else let (fd, _) = Unix.accept lfd in dtp_net_put fd\n   with e -> dtp_netMarkStatus e; -1)\nlet dtp_try_net_recv_within h n micros =\n  if n <= 0 then (dtp_hostReset (); dtp_hostSetStatus 1; \"\")\n  else\n    (try\n       dtp_hostReset ();\n       let fd = dtp_net_get h in\n       let b = Bytes.create n in\n       let (r, _, _) = Unix.select [fd] [] [] (float_of_int micros /. 1000000.0) in\n       if r = [] then (dtp_hostSetStatus 7; \"\")\n       else\n         let k = Unix.read fd b 0 n in\n         if k <= 0 then (dtp_hostSetStatus 1; \"\") else Bytes.sub_string b 0 k\n     with e -> dtp_netMarkStatus e; \"\")\nlet dtp_try_net_send_within h s micros =\n  (try\n     dtp_hostReset ();\n     let fd = dtp_net_get h in\n     let n = String.length s in\n     let secs = float_of_int micros /. 1000000.0 in\n     let rec go off =\n       if off >= n then true\n       else\n         let (_, w, _) = Unix.select [] [fd] [] secs in\n         if w = [] then false\n         else\n           let k = Unix.write_substring fd s off (n - off) in\n           if k <= 0 then false else go (off + k) in\n     if go 0 then n else (dtp_hostSetStatus 7; 0)\n   with e -> dtp_netMarkStatus e; 0)\n" ^ v_Vuna_dCompiler_dCodegen_dTerm_ddtSchedRuntime)

# 32 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_ddtRuntime = ("let () =\n  let c = Gc.get () in\n  Gc.set { c with minor_heap_size = 16 * 1024 * 1024; space_overhead = 200 }\nlet () =\n  if (try Sys.getenv \"VN_PERF_STATS\" with Not_found -> \"\") <> \"\" then\n    at_exit (fun () ->\n      let s = Gc.quick_stat () in\n      Printf.eprintf \"VN_PERF minor_words=%.0f major_words=%.0f minor_collections=%d major_collections=%d top_heap_words=%d\\n\"\n        s.Gc.minor_words s.Gc.major_words s.Gc.minor_collections s.Gc.major_collections s.Gc.top_heap_words)\nlet bi_add a b = a + b\nlet bi_sub a b = a - b\nlet bi_mul a b = a * b\nlet bi_div a b = if b = 0 then failwith \"division by zero\" else a / b\nlet bi_eq_int (a : int) (b : int) = a = b\nlet bi_neq_int (a : int) (b : int) = a <> b\nlet bi_eq_str (a : string) (b : string) = a = b\nlet bi_neq_str (a : string) (b : string) = a <> b\nlet bi_strFromInt (n : int) = string_of_int n\nlet bi_strLength (s : string) = String.length s\nlet bi_strUnpack (s : string) = List.init (String.length s) (fun i -> Char.code s.[i])\nlet bi_strPack (cs : int list) =\n  let a = Array.of_list cs in\n  String.init (Array.length a) (fun i -> Char.chr a.(i))\nlet bi_lt_int (a : int) (b : int) = a < b\nlet bi_le_int (a : int) (b : int) = a <= b\nlet bi_gt_int (a : int) (b : int) = a > b\nlet bi_ge_int (a : int) (b : int) = a >= b\nlet bi_lt_str (a : string) (b : string) = a < b\nlet bi_le_str (a : string) (b : string) = a <= b\nlet bi_gt_str (a : string) (b : string) = a > b\nlet bi_ge_str (a : string) (b : string) = a >= b\nlet bi_lt_bool (a : bool) (b : bool) = compare a b < 0\nlet bi_le_bool (a : bool) (b : bool) = compare a b <= 0\nlet bi_gt_bool (a : bool) (b : bool) = compare a b > 0\nlet bi_ge_bool (a : bool) (b : bool) = compare a b >= 0\nlet bi_concat a b = a ^ b\nlet bi_and a b = a && b\nlet bi_or a b = a || b\nlet bi_bitAnd (a : int) (b : int) = a land b\nlet bi_bitOr (a : int) (b : int) = a lor b\nlet bi_bitXor (a : int) (b : int) = a lxor b\nlet bi_bitNot (a : int) = lnot a\nlet bi_bitShl (a : int) (n : int) = if n < 0 || n >= 63 then 0 else a lsl n\nlet bi_bitShr (a : int) (n : int) = if n < 0 || n >= 63 then 0 else a lsr n\nlet bi_natSucc (n : int) = if n >= max_int then max_int else n + 1\nlet bi_natAdd (a : int) (b : int) = if a > max_int - b then max_int else a + b\nlet bi_natSub (a : int) (b : int) = if a <= b then 0 else a - b\nlet bi_natMul (a : int) (b : int) =\n  if a <= 0 || b <= 0 then 0 else if a > max_int / b then max_int else a * b\nlet bi_natDiv (a : int) (b : int) = if b = 0 then failwith \"division by zero\" else a / b\nlet bi_natToInt (n : int) = n\nlet bi_natFromInt (n : int) = if n <= 0 then 0 else n\nlet dt_show_bool b = if b then \"True\" else \"False\"\nlet dt_show_string s =\n  let buf = Buffer.create 16 in\n  Buffer.add_char buf (Char.chr 34);\n  String.iter (fun c ->\n    let n = Char.code c in\n    if n = 34 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 34))\n    else if n = 92 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 92))\n    else if n = 10 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"n\")\n    else if n = 9 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"t\")\n    else if n = 13 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"r\")\n    else Buffer.add_char buf c) s;\n  Buffer.add_char buf (Char.chr 34);\n  Buffer.contents buf\n" ^ v_Vuna_dCompiler_dCodegen_dTerm_ddtPrimRuntime)

# 1040 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_ddtReporterRuntime = "let rec dt_frame_key parts =\n  match parts with\n  | [] -> None\n  | part :: rest -> if part = \"(fun)\" then dt_frame_key rest else Some part\nlet dt_frame_label slot =\n  match Printexc.Slot.name slot with\n  | None -> None\n  | Some nm ->\n    match dt_frame_key (List.rev (String.split_on_char '.' nm)) with\n    | None -> None\n    | Some key ->\n      (match List.assoc_opt key dt_def_locs with\n       | Some (display, loc) -> Some (display ^ \" (\" ^ loc ^ \")\")\n       | None -> None)\nlet dt_bt_labels (bt : Printexc.raw_backtrace) : string list =\n  match Printexc.backtrace_slots bt with\n  | None -> []\n  | Some slots ->\n    let rec go rest shown last acc =\n      if shown >= 12 then List.rev acc\n      else match rest with\n      | [] -> List.rev acc\n      | slot :: tl ->\n        (match dt_frame_label slot with\n         | Some s -> if s = last then go tl shown last acc else go tl (shown + 1) s (s :: acc)\n         | None -> go tl shown last acc)\n    in go (Array.to_list slots) 0 \"\" []\nlet dt_report_exn e bt =\n  let msg = match e with Effect.Unhandled (Perform (key, name, _)) -> Printf.sprintf \"unhandled effect %s (instance %s)\" key name | Failure m -> m | _ -> Printexc.to_string e in\n  Printf.eprintf \"vuna: runtime error: %s\\n%!\" msg;\n  List.iter (fun s -> Printf.eprintf \"  at %s\\n%!\" s) (dt_bt_labels bt)\n"

# 1076 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_ddtFloatRuntime = "let bi_add_float (a : float) (b : float) = a +. b\nlet bi_sub_float (a : float) (b : float) = a -. b\nlet bi_mul_float (a : float) (b : float) = a *. b\nlet bi_div_float (a : float) (b : float) = a /. b\nlet bi_eq_float (a : float) (b : float) = a = b\nlet bi_neq_float (a : float) (b : float) = a <> b\nlet bi_lt_float (a : float) (b : float) = a < b\nlet bi_le_float (a : float) (b : float) = a <= b\nlet bi_gt_float (a : float) (b : float) = a > b\nlet bi_ge_float (a : float) (b : float) = a >= b\n"

# 1093 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_ddtTraceRuntime = "let dtp_debug_on_lazy = lazy (\n  let has f = Array.exists (fun a -> a = f) Sys.argv in\n  has \"--debug-perf\" || (try Sys.getenv \"VUNA_DEBUG_PERF\" = \"1\" with Not_found -> false))\nlet dtp_debug_on (_ : int) = Lazy.force dtp_debug_on_lazy\nlet dtp_debug_line (s : string) =\n  Printf.eprintf \"DEBUG %d %s\n%!\" (dtp_timeUs ()) s;\n  0\n"

# 1116 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_ddtObsRuntime = "(* ------------------------------------------------------------------ *)\n(* vuna observability runtime (generated; see docs/reference/          *)\n(* observability.md). Off by default: a probe pays one Lazy.force.     *)\n(* Events are Chrome Trace Event JSONL, one object per line.           *)\n(*                                                                     *)\n(* This text is embedded verbatim in Codegen.Term.dtObsRuntime. It      *)\n(* therefore contains NO backslash characters and NO line comments:    *)\n(* every quote is built from Char.chr 34 so the surrounding vuna string *)\n(* literal stays straightforward to escape.                            *)\n(* ------------------------------------------------------------------ *)\nlet dtp_obs_qc = Char.chr 34\nlet dtp_obs_bs = Char.chr 92\nlet dtp_obs_nl = Char.chr 10\nlet dtp_obs_colon = Char.chr 58\nlet dtp_obs_comma = Char.chr 44\nlet dtp_obs_lb = Char.chr 123\nlet dtp_obs_rb = Char.chr 125\nlet dtp_obs_ls = Char.chr 91\nlet dtp_obs_rs = Char.chr 93\n\nlet dtp_obs_level_lazy = lazy (\n  let env =\n    match int_of_string_opt (try Sys.getenv \"VUNA_OBS\" with Not_found -> \"\") with\n    | Some n -> n\n    | None -> 0\n  in\n  let rec scan i acc =\n    let n = Array.length Sys.argv in\n    if i >= n then acc\n    else if Sys.argv.(i) = \"--obs\" then scan (i + 1) (if acc > 2 then acc else 2)\n    else if Sys.argv.(i) = \"--obs-level\" && i + 1 < n then\n      (match int_of_string_opt Sys.argv.(i + 1) with\n       | Some v -> scan (i + 2) v\n       | None -> scan (i + 2) acc)\n    else if String.length Sys.argv.(i) > 11 && String.sub Sys.argv.(i) 0 11 = \"--obs-level\" then\n      (match int_of_string_opt (String.sub Sys.argv.(i) 12 (String.length Sys.argv.(i) - 12)) with\n       | Some v -> scan (i + 1) v\n       | None -> scan (i + 1) acc)\n    else scan (i + 1) acc\n  in\n  let l = scan 1 env in\n  if l < 0 then 0 else if l > 3 then 3 else l)\n\nlet dtp_obs_level (_ : int) = Lazy.force dtp_obs_level_lazy\nlet dtp_obs_on () = Lazy.force dtp_obs_level_lazy > 0\nlet dtp_obs_tid () = let t = !dtp_sched_current in if t < 0 then 0 else t\n\nlet dtp_obs_esc b (s : string) =\n  String.iter\n    (fun c ->\n      if Char.code c = 34 then begin Buffer.add_char b dtp_obs_bs; Buffer.add_char b dtp_obs_qc end\n      else if Char.code c = 92 then begin Buffer.add_char b dtp_obs_bs; Buffer.add_char b dtp_obs_bs end\n      else if Char.code c = 10 then begin Buffer.add_char b dtp_obs_bs; Buffer.add_char b (Char.chr 110) end\n      else if Char.code c = 13 then begin Buffer.add_char b dtp_obs_bs; Buffer.add_char b (Char.chr 114) end\n      else if Char.code c = 9 then begin Buffer.add_char b dtp_obs_bs; Buffer.add_char b (Char.chr 116) end\n      else if Char.code c < 32 then begin\n        Buffer.add_char b dtp_obs_bs;\n        Buffer.add_char b (Char.chr 117);\n        Buffer.add_string b (Printf.sprintf \"%04x\" (Char.code c))\n      end\n      else Buffer.add_char b c)\n    s\n\nlet dtp_obs_key b (k : string) =\n  Buffer.add_char b dtp_obs_qc;\n  dtp_obs_esc b k;\n  Buffer.add_char b dtp_obs_qc;\n  Buffer.add_char b dtp_obs_colon\n\nlet dtp_obs_str b (s : string) =\n  Buffer.add_char b dtp_obs_qc;\n  dtp_obs_esc b s;\n  Buffer.add_char b dtp_obs_qc\n\nlet dtp_obs_int b (n : int) = Buffer.add_string b (string_of_int n)\n\n\nlet dtp_obs_sink_path () =\n  match Sys.getenv_opt \"VUNA_OBS_FILE\" with\n  | Some p when p <> \"\" -> p\n  | _ ->\n    let d =\n      match Sys.getenv_opt \"VUNA_OBS_DIR\" with\n      | Some d when d <> \"\" -> d\n      | _ -> Filename.concat (Filename.get_temp_dir_name ()) \"vuna-obs\"\n    in\n    Filename.concat d (\"vuna-\" ^ string_of_int (Unix.getpid ()) ^ \".jsonl\")\n\nlet dtp_obs_chan : out_channel option ref = ref None\nlet dtp_obs_started = ref false\nlet dtp_obs_warned = ref false\nlet dtp_obs_count = ref 0\nlet dtp_obs_buf = Buffer.create 8192\n\nlet dtp_obs_open () =\n  match !dtp_obs_chan with\n  | Some c -> Some c\n  | None ->\n    let path = dtp_obs_sink_path () in\n    let dir = Filename.dirname path in\n    (try if not (Sys.file_exists dir) then Unix.mkdir dir 0o755 with _ -> ());\n    (match (try Some (open_out_bin path) with _ -> None) with\n     | None ->\n       if not !dtp_obs_warned then begin\n         dtp_obs_warned := true;\n         Printf.eprintf \"vuna: obs: cannot write %s, events dropped\" path;\n         output_char stderr dtp_obs_nl;\n         flush stderr\n       end;\n       None\n     | Some c ->\n       dtp_obs_chan := Some c;\n       Some c)\n\nlet dtp_obs_flush () =\n  (match !dtp_obs_chan with\n   | None -> ()\n   | Some c ->\n     if Buffer.length dtp_obs_buf > 0 then Buffer.output_buffer c dtp_obs_buf;\n     Buffer.clear dtp_obs_buf;\n     (try flush c with _ -> ()));\n  dtp_obs_count := 0;\n  0\n\nlet dtp_obs_hdr b (ph : string) (name : string) (ts : int) =\n  Buffer.add_char b dtp_obs_lb;\n  dtp_obs_key b \"ph\";\n  dtp_obs_str b ph;\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"ts\";\n  dtp_obs_int b ts;\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"pid\";\n  dtp_obs_int b (Unix.getpid ());\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"tid\";\n  dtp_obs_int b (dtp_obs_tid ());\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"name\";\n  dtp_obs_str b name\n\nlet dtp_obs_meta () =\n  let b = Buffer.create 256 in\n  Buffer.add_char b dtp_obs_lb;\n  dtp_obs_key b \"ph\";\n  dtp_obs_str b \"M\";\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"name\";\n  dtp_obs_str b \"vuna.obs.schema\";\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"pid\";\n  dtp_obs_int b (Unix.getpid ());\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"tid\";\n  dtp_obs_int b 0;\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"args\";\n  Buffer.add_char b dtp_obs_lb;\n  dtp_obs_key b \"schema\";\n  dtp_obs_str b \"vuna-obs 1\";\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"level\";\n  dtp_obs_int b (dtp_obs_level 0);\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"exec\";\n  dtp_obs_str b (try Sys.executable_name with _ -> \"\");\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"argv\";\n  Buffer.add_char b dtp_obs_ls;\n  Array.iteri\n    (fun i a ->\n      if i > 0 then Buffer.add_char b dtp_obs_comma;\n      dtp_obs_str b a)\n    Sys.argv;\n  Buffer.add_char b dtp_obs_rs;\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"t0\";\n  dtp_obs_int b (dtp_timeUs ());\n  Buffer.add_char b dtp_obs_rb;\n  Buffer.add_char b dtp_obs_rb;\n  Buffer.add_char b dtp_obs_nl;\n  Buffer.contents b\n\nlet dtp_obs_emit (ev : string) =\n  match dtp_obs_open () with\n  | None -> 0\n  | Some _ ->\n    if not !dtp_obs_started then begin\n      dtp_obs_started := true;\n      Buffer.add_string dtp_obs_buf (dtp_obs_meta ())\n    end;\n    Buffer.add_string dtp_obs_buf ev;\n    incr dtp_obs_count;\n    if !dtp_obs_count >= 256 then dtp_obs_flush () else 0\n\nlet dtp_obs_shutdown () =\n  ignore (dtp_obs_flush ());\n  (match !dtp_obs_chan with\n   | Some c -> dtp_obs_chan := None; (try close_out c with _ -> ())\n   | None -> ())\n\nlet () = at_exit dtp_obs_shutdown\n\nlet dtp_obs_span_emit (name : string) (cat : string) (label_opt : string option)\n    (t0 : int) (s0 : Gc.stat) (ok : bool) =\n  let t1 = dtp_timeUs () in\n  let s1 = Gc.quick_stat () in\n  let b = Buffer.create 192 in\n  dtp_obs_hdr b \"X\" name t0;\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"cat\";\n  dtp_obs_str b cat;\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"dur\";\n  dtp_obs_int b (if t1 - t0 < 0 then 0 else t1 - t0);\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"args\";\n  Buffer.add_char b dtp_obs_lb;\n  (match label_opt with\n   | None -> ()\n   | Some label ->\n     dtp_obs_key b \"def\";\n     dtp_obs_str b label;\n     Buffer.add_char b dtp_obs_comma);\n  dtp_obs_key b \"allocWords\";\n  dtp_obs_int b\n    (int_of_float\n       (s1.Gc.minor_words -. s0.Gc.minor_words +. (s1.Gc.major_words -. s0.Gc.major_words)));\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"heapWords\";\n  dtp_obs_int b s1.Gc.top_heap_words;\n  if not ok then begin\n    Buffer.add_char b dtp_obs_comma;\n    dtp_obs_key b \"error\";\n    Buffer.add_string b \"true\"\n  end;\n  Buffer.add_char b dtp_obs_rb;\n  Buffer.add_char b dtp_obs_rb;\n  Buffer.add_char b dtp_obs_nl;\n  ignore (dtp_obs_emit (Buffer.contents b))\n\nlet dtp_obs_span (name : string) (cat : string) (f : int -> 'a) : 'a =\n  if not (dtp_obs_on ()) then f 0\n  else begin\n    let t0 = dtp_timeUs () in\n    let s0 = Gc.quick_stat () in\n    let v = try f 0 with e -> dtp_obs_span_emit name cat None t0 s0 false; raise e in\n    dtp_obs_span_emit name cat None t0 s0 true;\n    v\n  end\n\nlet dtp_obs_span_lab (name : string) (cat : string) (label : string) (f : int -> 'a) : 'a =\n  if not (dtp_obs_on ()) then f 0\n  else begin\n    let t0 = dtp_timeUs () in\n    let s0 = Gc.quick_stat () in\n    let v = try f 0 with e -> dtp_obs_span_emit name cat (Some label) t0 s0 false; raise e in\n    dtp_obs_span_emit name cat (Some label) t0 s0 true;\n    v\n  end\n\nlet dtp_obs_open_spans : (int, string * string * int * Gc.stat) Hashtbl.t =\n  Hashtbl.create 64\n\nlet dtp_obs_span_seq = ref 0\n\nlet dtp_obs_span_begin (name : string) (cat : string) : int =\n  if not (dtp_obs_on ()) then 0\n  else begin\n    incr dtp_obs_span_seq;\n    let id = !dtp_obs_span_seq in\n    Hashtbl.replace dtp_obs_open_spans id (name, cat, dtp_timeUs (), Gc.quick_stat ());\n    id\n  end\n\nlet dtp_obs_span_end (id : int) : int =\n  if id = 0 then 0\n  else match Hashtbl.find_opt dtp_obs_open_spans id with\n    | None -> 0\n    | Some (name, cat, t0, s0) ->\n      Hashtbl.remove dtp_obs_open_spans id;\n      dtp_obs_span_emit name cat None t0 s0 true;\n      0\n\nlet dtp_obs_mark_like (ph : string) (name : string) (cat : string) (kv : (Buffer.t -> unit) option) =\n  let b = Buffer.create 160 in\n  dtp_obs_hdr b ph name (dtp_timeUs ());\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"cat\";\n  dtp_obs_str b cat;\n  (match kv with\n   | None -> ()\n   | Some put ->\n     Buffer.add_char b dtp_obs_comma;\n     dtp_obs_key b \"args\";\n     Buffer.add_char b dtp_obs_lb;\n     put b;\n     Buffer.add_char b dtp_obs_rb);\n  Buffer.add_char b dtp_obs_rb;\n  Buffer.add_char b dtp_obs_nl;\n  ignore (dtp_obs_emit (Buffer.contents b));\n  0\n\nlet dtp_obs_log (text : string) : int =\n  if not (dtp_obs_on ()) then 0\n  else begin\n    Printf.eprintf \"DEBUG %d %s\" (dtp_timeUs ()) text;\n    output_char stderr dtp_obs_nl;\n    flush stderr;\n    dtp_obs_mark_like \"i\" \"vuna.log\" \"vuna.log\"\n      (Some (fun b -> dtp_obs_key b \"text\"; dtp_obs_str b text))\n  end\n\nlet dtp_obs_counter (name : string) (v : int) : int =\n  if not (dtp_obs_on ()) then 0\n  else dtp_obs_mark_like \"C\" name \"vuna.counter\"\n    (Some (fun b -> dtp_obs_key b \"value\"; dtp_obs_int b v))\n\nlet dtp_obs_mark (name : string) : int =\n  if not (dtp_obs_on ()) then 0\n  else dtp_obs_mark_like \"i\" name \"vuna.mark\" None\n\nlet dtp_obs_cap = 8192\nlet dtp_obs_cpu : Printexc.raw_backtrace option array = Array.make 8192 None\nlet dtp_obs_cpu_n = ref 0\nlet dtp_obs_cpu_on = ref false\n\nlet dtp_obs_cpu_tick (_ : int) =\n  if !dtp_obs_cpu_on && !dtp_obs_cpu_n < dtp_obs_cap then begin\n    dtp_obs_cpu.(!dtp_obs_cpu_n) <- Some (Printexc.get_callstack 32);\n    incr dtp_obs_cpu_n\n  end\n\nlet dtp_obs_frames b (bt : Printexc.raw_backtrace) =\n  let slots = match Printexc.backtrace_slots bt with None -> [||] | Some s -> s in\n  Buffer.add_char b dtp_obs_ls;\n  let first = ref true in\n  Array.iter\n    (fun slot ->\n      let nm = match Printexc.Slot.name slot with Some n -> n | None -> \"\" in\n      let loc =\n        match Printexc.Slot.location slot with\n        | Some l -> Printf.sprintf \"%s:%d\" l.filename l.line_number\n        | None -> \"\"\n      in\n      if !first then first := false else Buffer.add_char b dtp_obs_comma;\n      dtp_obs_str b (if loc = \"\" then nm else nm ^ \"@\" ^ loc))\n    slots;\n  Buffer.add_char b dtp_obs_rs\n\nlet dtp_obs_mem : Printexc.raw_backtrace option array = Array.make 8192 None\nlet dtp_obs_mem_n = ref 0\nlet dtp_obs_mem_run : Gc.Memprof.t option ref = ref None\n\nlet dtp_obs_mem_add (bt : Printexc.raw_backtrace) =\n  if !dtp_obs_mem_n < dtp_obs_cap then begin\n    dtp_obs_mem.(!dtp_obs_mem_n) <- Some bt;\n    incr dtp_obs_mem_n\n  end\n\nlet dtp_obs_tracker : (unit, unit) Gc.Memprof.tracker =\n  { alloc_minor =\n      (fun (i : Gc.Memprof.allocation) -> dtp_obs_mem_add i.callstack; (None : unit option));\n    alloc_major =\n      (fun (i : Gc.Memprof.allocation) -> dtp_obs_mem_add i.callstack; (None : unit option));\n    promote = (fun () -> None);\n    dealloc_minor = (fun () -> ());\n    dealloc_major = (fun () -> ()) }\n\nlet dtp_obs_emit_samples (name : string) (n : int) (get : int -> Printexc.raw_backtrace option) =\n  for i = 0 to n - 1 do\n    match get i with\n    | None -> ()\n    | Some bt ->\n      let b = Buffer.create 256 in\n      dtp_obs_hdr b \"i\" name (dtp_timeUs ());\n      Buffer.add_char b dtp_obs_comma;\n      dtp_obs_key b \"cat\";\n      dtp_obs_str b \"vuna.sample\";\n      Buffer.add_char b dtp_obs_comma;\n      dtp_obs_key b \"args\";\n      Buffer.add_char b dtp_obs_lb;\n      dtp_obs_key b \"stack\";\n      dtp_obs_frames b bt;\n      Buffer.add_char b dtp_obs_rb;\n      Buffer.add_char b dtp_obs_rb;\n      Buffer.add_char b dtp_obs_nl;\n      ignore (dtp_obs_emit (Buffer.contents b))\n  done\n\nlet dtp_obs_sample_start (mode : string) (interval_us : int) : int =\n  if not (dtp_obs_on ()) then 0\n  else begin\n    (* `mode` \228\184\186\231\169\186\228\184\178\230\151\182\230\140\137 `VUNA_OBS_SAMPLE`\239\188\136env\239\188\137\229\143\150\231\188\186\231\156\129\239\188\136`cpu`\239\188\137\239\188\155\232\191\153\230\160\183 `vuna dev obs run\n       --sample both` \231\154\132 env \230\179\168\229\133\165\232\131\189\231\148\159\230\149\136\239\188\140\232\128\140\229\186\147\229\177\130\232\176\131\231\148\168\230\128\187\230\152\175\230\152\190\229\188\143\231\187\153 mode\227\128\130 *)\n    let mode2 =\n      if mode <> \"\" then mode\n      else match Sys.getenv_opt \"VUNA_OBS_SAMPLE\" with\n        | Some m when m <> \"\" -> m\n        | _ -> \"cpu\"\n    in\n    let iv2 =\n      if interval_us > 0 then interval_us\n      else\n        match int_of_string_opt (match Sys.getenv_opt \"VUNA_OBS_INTERVAL\" with Some v -> v | None -> \"\") with\n        | Some v when v > 0 -> v\n        | _ -> 1000\n    in\n    let want_cpu = mode2 = \"cpu\" || mode2 = \"both\" in\n    let want_mem = mode2 = \"mem\" || mode2 = \"both\" in\n    (if want_cpu then\n       try\n         Sys.set_signal Sys.sigprof (Sys.Signal_handle dtp_obs_cpu_tick);\n         dtp_obs_cpu_on := true;\n         ignore\n           (Unix.setitimer Unix.ITIMER_PROF\n              { Unix.it_interval = float_of_int iv2 /. 1000000.0;\n                it_value = float_of_int iv2 /. 1000000.0 })\n       with _ -> ());\n    (if want_mem then\n       try\n         dtp_obs_mem_run :=\n           Some (Gc.Memprof.start ~sampling_rate:1e-4 ~callstack_size:16 dtp_obs_tracker)\n       with _ -> ());\n    0\n  end\n\nlet dtp_obs_sample_stop (_ : int) : int =\n  if not (dtp_obs_on ()) then 0\n  else begin\n    (try\n       dtp_obs_cpu_on := false;\n       ignore (Unix.setitimer Unix.ITIMER_PROF { Unix.it_interval = 0.0; it_value = 0.0 })\n     with _ -> ());\n    (try (match !dtp_obs_mem_run with Some _ -> Gc.Memprof.stop () | None -> ()) with _ -> ());\n    dtp_obs_mem_run := None;\n    dtp_obs_emit_samples \"vuna.sample.cpu\" !dtp_obs_cpu_n (fun i -> dtp_obs_cpu.(i));\n    dtp_obs_emit_samples \"vuna.sample.mem\" !dtp_obs_mem_n (fun i -> dtp_obs_mem.(i));\n    dtp_obs_flush ()\n  end\n"

# 1559 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dinlineText = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (if (mc0 = "+") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (match dtb__1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__2, dtb__3) -> (match dtb__3 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__0; " + "; dtb__2; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "-") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__4, dtb__5) -> (match dtb__5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__6, dtb__7) -> (match dtb__7 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__4; " - "; dtb__6; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "*") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__8, dtb__9) -> (match dtb__9 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__10, dtb__11) -> (match dtb__11 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__8; " * "; dtb__10; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "/") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__12, dtb__13) -> (match dtb__13 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__14, dtb__15) -> (match dtb__15 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["(if "; dtb__14; " = 0 then failwith \"division by zero\" else "; dtb__12; " / "; dtb__14; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "&&") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__16, dtb__17) -> (match dtb__17 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__18, dtb__19) -> (match dtb__19 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__16; " && "; dtb__18; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "||") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__20, dtb__21) -> (match dtb__21 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__22, dtb__23) -> (match dtb__23 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__20; " || "; dtb__22; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bitAnd") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__24, dtb__25) -> (match dtb__25 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__26, dtb__27) -> (match dtb__27 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__24; " land "; dtb__26; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bitOr") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__28, dtb__29) -> (match dtb__29 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__30, dtb__31) -> (match dtb__31 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__28; " lor "; dtb__30; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bitXor") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__32, dtb__33) -> (match dtb__33 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__34, dtb__35) -> (match dtb__35 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__32; " lxor "; dtb__34; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bitNot") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__36, dtb__37) -> (match dtb__37 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["(lnot "; dtb__36; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bitShl") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__38, dtb__39) -> (match dtb__39 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__40, dtb__41) -> (match dtb__41 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["(if "; dtb__40; " < 0 || "; dtb__40; " >= 63 then 0 else "; dtb__38; " lsl "; dtb__40; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bitShr") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__42, dtb__43) -> (match dtb__43 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__44, dtb__45) -> (match dtb__45 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["(if "; dtb__44; " < 0 || "; dtb__44; " >= 63 then 0 else "; dtb__42; " lsr "; dtb__44; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "++") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__46, dtb__47) -> (match dtb__47 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__48, dtb__49) -> (match dtb__49 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__46; " ^ "; dtb__48; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_eq_int") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__50, dtb__51) -> (match dtb__51 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__52, dtb__53) -> (match dtb__53 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__50; " = "; dtb__52; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_neq_int") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__54, dtb__55) -> (match dtb__55 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__56, dtb__57) -> (match dtb__57 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__54; " <> "; dtb__56; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_eq_str") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__58, dtb__59) -> (match dtb__59 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__60, dtb__61) -> (match dtb__61 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__58; " = "; dtb__60; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_neq_str") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__62, dtb__63) -> (match dtb__63 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__64, dtb__65) -> (match dtb__65 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__62; " <> "; dtb__64; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_lt_int") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__66, dtb__67) -> (match dtb__67 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__68, dtb__69) -> (match dtb__69 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__66; " < "; dtb__68; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_le_int") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__70, dtb__71) -> (match dtb__71 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__72, dtb__73) -> (match dtb__73 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__70; " <= "; dtb__72; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_gt_int") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__74, dtb__75) -> (match dtb__75 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__76, dtb__77) -> (match dtb__77 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__74; " > "; dtb__76; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_ge_int") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__78, dtb__79) -> (match dtb__79 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__80, dtb__81) -> (match dtb__81 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__78; " >= "; dtb__80; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_lt_str") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__82, dtb__83) -> (match dtb__83 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__84, dtb__85) -> (match dtb__85 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__82; " < "; dtb__84; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_le_str") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__86, dtb__87) -> (match dtb__87 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__88, dtb__89) -> (match dtb__89 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__86; " <= "; dtb__88; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_gt_str") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__90, dtb__91) -> (match dtb__91 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__92, dtb__93) -> (match dtb__93 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__90; " > "; dtb__92; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_ge_str") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__94, dtb__95) -> (match dtb__95 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__96, dtb__97) -> (match dtb__97 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__94; " >= "; dtb__96; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_lt_bool") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__98, dtb__99) -> (match dtb__99 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__100, dtb__101) -> (match dtb__101 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["(compare "; dtb__98; " "; dtb__100; " < 0)"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_le_bool") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__102, dtb__103) -> (match dtb__103 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__104, dtb__105) -> (match dtb__105 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["(compare "; dtb__102; " "; dtb__104; " <= 0)"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_gt_bool") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__106, dtb__107) -> (match dtb__107 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__108, dtb__109) -> (match dtb__109 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["(compare "; dtb__106; " "; dtb__108; " > 0)"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_ge_bool") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__110, dtb__111) -> (match dtb__111 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__112, dtb__113) -> (match dtb__113 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["(compare "; dtb__110; " "; dtb__112; " >= 0)"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_add_float") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__114, dtb__115) -> (match dtb__115 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__116, dtb__117) -> (match dtb__117 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__114; " +. "; dtb__116; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_sub_float") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__118, dtb__119) -> (match dtb__119 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__120, dtb__121) -> (match dtb__121 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__118; " -. "; dtb__120; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_mul_float") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__122, dtb__123) -> (match dtb__123 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__124, dtb__125) -> (match dtb__125 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__122; " *. "; dtb__124; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_div_float") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__126, dtb__127) -> (match dtb__127 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__128, dtb__129) -> (match dtb__129 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__126; " /. "; dtb__128; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_eq_float") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__130, dtb__131) -> (match dtb__131 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__132, dtb__133) -> (match dtb__133 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__130; " = "; dtb__132; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_neq_float") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__134, dtb__135) -> (match dtb__135 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__136, dtb__137) -> (match dtb__137 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__134; " <> "; dtb__136; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_lt_float") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__138, dtb__139) -> (match dtb__139 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__140, dtb__141) -> (match dtb__141 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__138; " < "; dtb__140; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_le_float") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__142, dtb__143) -> (match dtb__143 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__144, dtb__145) -> (match dtb__145 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__142; " <= "; dtb__144; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_gt_float") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__146, dtb__147) -> (match dtb__147 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__148, dtb__149) -> (match dtb__149 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__146; " > "; dtb__148; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "bi_ge_float") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__150, dtb__151) -> (match dtb__151 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__152, dtb__153) -> (match dtb__153 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["("; dtb__150; " >= "; dtb__152; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "natToInt") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__154, dtb__155) -> (match dtb__155 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__154))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "natFromInt") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__156, dtb__157) -> (match dtb__157 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["(bi_natFromInt "; dtb__156; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "natAdd") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__158, dtb__159) -> (match dtb__159 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__160, dtb__161) -> (match dtb__161 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["(bi_natAdd "; dtb__158; " "; dtb__160; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "natSub") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__162, dtb__163) -> (match dtb__163 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__164, dtb__165) -> (match dtb__165 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["(bi_natSub "; dtb__162; " "; dtb__164; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "natMul") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__166, dtb__167) -> (match dtb__167 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__168, dtb__169) -> (match dtb__169 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["(bi_natMul "; dtb__166; " "; dtb__168; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "natDiv") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__170, dtb__171) -> (match dtb__171 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__172, dtb__173) -> (match dtb__173 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["(bi_natDiv "; dtb__170; " "; dtb__172; ")"])))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))))))))))))))))))))))))))))))))))))))))))))))

# 1616 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_ddtRuntimeWith = (fun locs usesFloat usesTrace usesObs -> (String.concat "" [v_Vuna_dCompiler_dCodegen_dTerm_ddtRuntime; (if usesFloat then v_Vuna_dCompiler_dCodegen_dTerm_ddtFloatRuntime else ""); (if (locs = "") then "let dt_def_locs = []\n" else (String.concat "" ["let dt_def_locs = [\n"; locs; "]\n"])); v_Vuna_dCompiler_dCodegen_dTerm_ddtReporterRuntime; (if usesTrace then v_Vuna_dCompiler_dCodegen_dTerm_ddtTraceRuntime else ""); (if usesObs then v_Vuna_dCompiler_dCodegen_dTerm_ddtObsRuntime else "")]))

# 1628 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_ddtListBridge = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrListFam Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__174) -> ((fun nilMl -> ((fun consMl -> (String.concat "" ["\nlet dtp_unpack (s : string) =\n  let rec go i acc = if i < 0 then acc else go (i - 1) ("; consMl; " (Char.code (String.unsafe_get s i), acc)) in\n  go (String.length s - 1) "; nilMl; "\nlet dtp_pack xs =\n  let rec len n l = match l with "; nilMl; " -> n | "; consMl; " (_, rest) -> len (n + 1) rest in\n  let buf = Bytes.create (len 0 xs) in\n  let rec go i l = match l with\n    | "; nilMl; " -> ()\n    | "; consMl; " (x, rest) -> Bytes.unsafe_set buf i (Char.chr x); go (i + 1) rest\n  in\n  (go 0 xs; Bytes.unsafe_to_string buf)\n\nlet dtp_listOf xs = List.fold_right (fun x acc -> "; consMl; " (x, acc)) xs "; nilMl; "\nlet dtp_ocamlOf xs =\n  let rec go l = match l with "; nilMl; " -> [] | "; consMl; " (x, rest) -> x :: go rest in\n  go xs\n\nlet dtp_concatMany xs = String.concat \"\" (dtp_ocamlOf xs)\n\nlet dtp_substTemplate tmpl xs =\n  let args = Array.of_list (dtp_ocamlOf xs) in\n  let n = String.length tmpl and na = Array.length args in\n  let buf = Buffer.create (n + 32) in\n  let rec go i =\n    if i >= n then ()\n    else if tmpl.[i] = '<' then begin\n      let j = ref (i + 1) and k = ref 0 in\n      while !j < n && tmpl.[!j] >= '0' && tmpl.[!j] <= '9' do\n        k := !k * 10 + (Char.code tmpl.[!j] - 48); incr j\n      done;\n      if !j < n && tmpl.[!j] = '>' && !j > i + 1 then begin\n        (if !k < na then Buffer.add_string buf args.(!k)\n         else Buffer.add_string buf (String.sub tmpl i (!j - i + 1)));\n        go (!j + 1)\n      end else (Buffer.add_char buf '<'; go (i + 1))\n    end else (Buffer.add_char buf tmpl.[i]; go (i + 1))\n  in go 0; Buffer.contents buf\n"])) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirListFamilyOf dtb__174)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirListConsOf dtb__174)))) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirListFamilyOf dtb__174)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirListNilOf dtb__174)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1683 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dsortLocRows = (fun rows -> ((Base_dData_dSort.v_Base_dData_dSort_dsortBy (fun (a : string) (b : string) -> (((Base_dTrait_dOrd.v_Base_dTrait_dOrd_d_x60__x61_ Base_dData_dString.v_Ord_uString) a) b))) rows))

# 1686 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dlocRowOf = (fun norm row -> ((fun name -> ((fun file -> ((fun line -> (String.concat "" ["  ("; (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_docamlString (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dvalueName name)); ", ("; (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_docamlString name); ", "; (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_docamlString (String.concat "" [(norm file); ":"; (bi_strFromInt line)])); "));\n"])) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf row)))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf row)))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf row)))

# 1680 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_ddtDefLocTable = (fun norm rows -> (Base_dData_dList.dtp_concatMany (v_Vuna_dCompiler_dCodegen_dTerm_dsortLocRows ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dCodegen_dTerm_dlocRowOf norm)) rows))))

# 1716 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dmkGenStWith = (fun norm qc shared -> { f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsShared = shared; f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual = qc; f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsDeps = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsNormPath = norm })

# 1713 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dmkGenSt = (fun qc shared -> (((v_Vuna_dCompiler_dCodegen_dTerm_dmkGenStWith (fun (p : string) -> p)) qc) shared))

# 1720 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dgsAddDep = (fun st unit -> (if (if (unit = "") then true else ((Base_dData_dList.v_Base_dData_dList_dmemName unit) (st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsDeps)) then st else { f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsShared = (st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsShared; f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual = (st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual; f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsDeps = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (unit, (st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsDeps)); f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsNormPath = (st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsNormPath }))

# 1728 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dgenValueRef = (fun st name -> ((fun p -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dCodegen_dTerm_dgsAddDep st) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) }) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dqualValueText (st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual) name)))

# 1735 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dgenCtorRef = (fun st family ctor -> ((fun p -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dCodegen_dTerm_dgsAddDep st) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) }) (((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dqualCtorText (st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual) family) ctor)))

# 1742 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dgsDepOfFamily = (fun st family -> ((fun unit -> (if (if (unit = "") then true else (unit = ((st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual).Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit)) then st else ((v_Vuna_dCompiler_dCodegen_dTerm_dgsAddDep st) unit))) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl ((st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual).Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas) family)))

# 1748 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_drecordLabelOf = (fun st family label -> ((fun unit -> (if (if (unit = "") then true else (unit = ((st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual).Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit)) then label else (String.concat "" [unit; "."; label]))) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl ((st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual).Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas) family)))

# 1756 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dbridgeUnitOf = (fun st -> (match ((st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsShared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedListFam with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__175) -> ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl ((st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual).Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirListFamilyOf dtb__175))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1762 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dreplaceAll = (fun old new_ text -> ((Base_dData_dString.v_Base_dData_dString_djoin new_) ((Base_dData_dString.v_Base_dData_dString_dsplit old) text)))

# 1765 "Vuna/Compiler/Codegen/Term.vuna"
let rec v_Vuna_dCompiler_dCodegen_dTerm_dqualifyBridgeNames = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__176, dtb__177) -> (((v_Vuna_dCompiler_dCodegen_dTerm_dqualifyBridgeNames mc0) dtb__177) (((v_Vuna_dCompiler_dCodegen_dTerm_dreplaceAll dtb__176) (String.concat "" [mc0; "."; dtb__176])) mc2))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 1770 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dqualifyBridgeText = (fun unit text -> (if (unit = "") then text else (((v_Vuna_dCompiler_dCodegen_dTerm_dqualifyBridgeNames unit) Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_docamlRtHelperNames) text)))

# 1774 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dgenBridgeRef = (fun st text -> ((fun unit -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dCodegen_dTerm_dqualifyBridgeText unit) text); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dCodegen_dTerm_dgsAddDep st) unit) }) (v_Vuna_dCompiler_dCodegen_dTerm_dbridgeUnitOf st)))

# 1787 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_deffUnitTypeNameIr = "Base.Effect.Core.EffUnit"

# 1781 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_deffUnitTyPair = (fun st -> ((fun p -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dCodegen_dTerm_dgsAddDep st) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) }) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText (st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual) v_Vuna_dCompiler_dCodegen_dTerm_deffUnitTypeNameIr)))

# 1981 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dioParamNames = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("dtio_0", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("dtio_1", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("dtio_2", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("dtio_3", Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))

# 1984 "Vuna/Compiler/Codegen/Term.vuna"
let rec v_Vuna_dCompiler_dCodegen_dTerm_dtakeNames = (fun n names -> (if (n <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match names with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__178, dtb__179) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__178, ((v_Vuna_dCompiler_dCodegen_dTerm_dtakeNames (n - 1)) dtb__179)))
  | _ -> failwith "DT: impossible branch"
)))

# 1970 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_deffThunkText = (fun ctor unitTy rt arity -> ((fun argText -> (if (arity = 0) then (String.concat "" ["("; ctor; " (fun (_ : "; unitTy; ") -> "; rt; "))"]) else (String.concat "" ["(fun "; argText; " -> "; ctor; " (fun (_ : "; unitTy; ") -> "; rt; " "; argText; "))"]))) ((Vuna_dCompiler_dCodegen_dOcaml_dRender.v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith " ") ((v_Vuna_dCompiler_dCodegen_dTerm_dtakeNames arity) v_Vuna_dCompiler_dCodegen_dTerm_dioParamNames))))

# 2026 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dnonErasedBinderText = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder) -> (match mc0 with
  | { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = dtb__180; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = dtb__181; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy = dtb__182 } -> (if dtb__181 then "" else (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dirBinderText { Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderName = dtb__180; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased = false; Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing }))
  | _ -> failwith "DT: impossible branch"
))

# 2056 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dgsWithTyDeps = (fun st ty -> (((Base_dData_dList.v_Base_dData_dList_dfoldl (fun (acc : t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) (unit : string) -> ((v_Vuna_dCompiler_dCodegen_dTerm_dgsAddDep acc) unit))) st) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dirTyDeclDeps (st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (ty, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))

# 2032 "Vuna/Compiler/Codegen/Term.vuna"
let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenLamParams = (fun (mc0 : t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__183, dtb__184) -> (if (dtb__183).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased then ((v_Vuna_dCompiler_dCodegen_dTerm_dgenLamParams mc0) dtb__184) else (match (dtb__183).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenLamParams mc0) dtb__184)) (fun (p : ((string, string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__185; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__186 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dirBinderText dtb__183); Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing }, dtb__185)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__186 }))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__187) -> ((fun st1 -> ((fun annotation -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenLamParams st1) dtb__184)) (fun (p : ((string, string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__188; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__189 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dirBinderText dtb__183); Base_dData_dPair.f_Base_dData_dPair_dPair_second = annotation }, dtb__188)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__189 }))
  | _ -> failwith "DT: impossible branch"
)))) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dirTyText (mc0).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual) dtb__187))))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgsWithTyDeps mc0) dtb__187))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc0 }))
  | _ -> failwith "DT: impossible branch"
))

# 2059 "Vuna/Compiler/Codegen/Term.vuna"
let rec v_Vuna_dCompiler_dCodegen_dTerm_dhasCatchAll = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__190, dtb__191) -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltCtorOf dtb__190) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> true
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__192) -> (v_Vuna_dCompiler_dCodegen_dTerm_dhasCatchAll dtb__191)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 2106 "Vuna/Compiler/Codegen/Term.vuna"
let rec v_Vuna_dCompiler_dCodegen_dTerm_drecordPatFields = (fun (mc0 : t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) (mc1 : string) (mc2 : (int, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__193, dtb__194) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__195, dtb__196) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dCodegen_dTerm_drecordLabelOf mc0) mc1) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldLabel mc1) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__193))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOPat_OPVar (dtb__195)) }, ((((v_Vuna_dCompiler_dCodegen_dTerm_drecordPatFields mc0) mc1) dtb__194) dtb__196)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 2156 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dtermOrImpossible = (fun (mc0 : Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (mc1 : Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> mc1
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__197) -> dtb__197
  | _ -> failwith "DT: impossible branch"
))

# 1793 "Vuna/Compiler/Codegen/Term.vuna"
let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenIr = (fun st node -> ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIrNode st) node))
# 1796 "Vuna/Compiler/Codegen/Term.vuna"
and v_Vuna_dCompiler_dCodegen_dTerm_dgenIrNode = (fun (mc0 : t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) -> (match mc1 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffBind (dtb__198, dtb__199, dtb__200) -> ((fun ctorP -> ((fun st1 -> ((fun unitText -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_ORaw ((String.concat "" ["(fun m k -> "; (Base_dData_dPair.v_Base_dData_dPair_dfirstOf ctorP); " (fun (u : "; unitText; ") -> match m with "; (Base_dData_dPair.v_Base_dData_dPair_dfirstOf ctorP); " f -> (match k (f u) with "; (Base_dData_dPair.v_Base_dData_dPair_dfirstOf ctorP); " g -> g u)))"]))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st1 }))) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dirTyText (st1).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual) dtb__200))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgsDepOfFamily (Base_dData_dPair.v_Base_dData_dPair_dsecondOf ctorP)) dtb__198))) (((v_Vuna_dCompiler_dCodegen_dTerm_dgenCtorRef mc0) dtb__198) dtb__199))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrEffThunk (dtb__201, dtb__202, dtb__203, dtb__204, dtb__205) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr mc0) dtb__205)) (fun (p : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__206; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__207 } -> ((fun ctorP -> ((fun st2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_ORaw (((((v_Vuna_dCompiler_dCodegen_dTerm_deffThunkText (Base_dData_dPair.v_Base_dData_dPair_dfirstOf ctorP)) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dirTyText (st2).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual) dtb__203)) (Vuna_dCompiler_dCodegen_dOcaml_dRender.v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm dtb__206)) dtb__204))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st2 }))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgsDepOfFamily (Base_dData_dPair.v_Base_dData_dPair_dsecondOf ctorP)) dtb__201))) (((v_Vuna_dCompiler_dCodegen_dTerm_dgenCtorRef dtb__207) dtb__201) dtb__202))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrConcatMany (dtb__208) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIrArgs mc0) dtb__208)) (fun (p : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__209; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__210 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OConcatStr (dtb__209)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__210 }))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRtApp (dtb__211, dtb__212) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIrArgs mc0) dtb__212)) (fun (p : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__213; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__214 } -> (match ((v_Vuna_dCompiler_dCodegen_dTerm_dinlineText dtb__211) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dCodegen_dOcaml_dRender.v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm) dtb__213)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__215) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_ORaw (dtb__215)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__214 }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["no inline text for builtin `"; dtb__211; "`"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrNatCase (dtb__216, dtb__217, dtb__218, dtb__219, dtb__220) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr mc0) dtb__216)) (fun (p : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__221; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__222 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenNatBranches dtb__222) dtb__217) dtb__218) dtb__219) dtb__220)) (fun (q : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__223; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__224 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OLet ((Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOPat_OPVar (("dtnat__" ^ (bi_strFromInt dtb__217)))), dtb__221, dtb__223)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__224 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCase (dtb__225, dtb__226, dtb__227) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr mc0) dtb__226)) (fun (p : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__228; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__229 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenArms dtb__229) dtb__227)) (fun (q : ((Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOPat, Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__230; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__231 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OMatch (dtb__228, dtb__230, (v_Vuna_dCompiler_dCodegen_dTerm_dhasCatchAll dtb__227))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__231 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrIf (dtb__232, dtb__233, dtb__234) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr mc0) dtb__232)) (fun (p : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__235; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__236 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr dtb__236) dtb__233)) (fun (q : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__237; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__238 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr dtb__238) dtb__234)) (fun (r : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match r with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__239; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__240 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OIf (dtb__235, dtb__237, dtb__239)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__240 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrApp (dtb__241, dtb__242, dtb__243) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr mc0) dtb__242)) (fun (p : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__244; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__245 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr dtb__245) dtb__243)) (fun (q : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__246; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__247 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OApp (dtb__244, dtb__246)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__247 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLam (dtb__248, dtb__249, dtb__250) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenLamParams mc0) dtb__248)) (fun (p : ((string, string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__251; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__252 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr dtb__252) dtb__250)) (fun (q : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__253; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__254 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OLam (dtb__251, dtb__253)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__254 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrLet (dtb__255, dtb__256, dtb__257) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr mc0) dtb__256)) (fun (p : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__258; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__259 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr dtb__259) dtb__257)) (fun (q : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__260; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__261 } -> (match ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (n : string) -> (n <> ""))) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dCodegen_dTerm_dnonErasedBinderText) dtb__255)) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OLet (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOPat_OPWild, dtb__258, dtb__260)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__261 }))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__262, dtb__263) -> (match dtb__263 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OLet ((Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOPat_OPVar (dtb__262)), dtb__258, dtb__260)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__261 }))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "unboxed case arm has more than one runtime binder")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrFloatLit (dtb__264) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OName (dtb__264)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc0 }))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrBool (dtb__265) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OName ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dboolText dtb__265))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc0 }))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrStr (dtb__266) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OName ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_docamlString dtb__266))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc0 }))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrInt (dtb__267) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OName ((bi_strFromInt dtb__267))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc0 }))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCast (dtb__268, dtb__269, dtb__270) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr mc0) dtb__270)) (fun (p : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__271; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__272 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OCast (dtb__271)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__272 }))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRt (dtb__273) -> (match (Vuna_dCompiler_dCodegen_dRuntime.v_Vuna_dCompiler_dCodegen_dRuntime_docamlRtText dtb__273) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["no OCaml runtime text for IR symbol `"; dtb__273; "`"]))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__274) -> (if (Vuna_dCompiler_dIr_dRuntime.v_Vuna_dCompiler_dIr_dRuntime_dirRtBridgesList dtb__273) then ((fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_ORaw ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) }))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgenBridgeRef mc0) dtb__274)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_ORaw (dtb__274)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc0 })))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecUpd (dtb__275, dtb__276, dtb__277) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr mc0) dtb__275)) (fun (p : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__278; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__279 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dTerm_dgenAssignedFields dtb__279) dtb__276) dtb__277)) (fun (q : ((string, Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__280; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__281 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_ORecordUpd (dtb__278, dtb__280)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dCodegen_dTerm_dgsDepOfFamily dtb__281) dtb__276) }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrProj (dtb__282, dtb__283, dtb__284) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr mc0) dtb__282)) (fun (p : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__285; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__286 } -> ((fun st2 -> ((fun label -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OProj (dtb__285, (((v_Vuna_dCompiler_dCodegen_dTerm_drecordLabelOf st2) dtb__283) label))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st2 }))) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldLabel dtb__283) dtb__284))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgsDepOfFamily dtb__286) dtb__283))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrRecord (dtb__287, dtb__288) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dTerm_dgenAssignedFields mc0) dtb__287) dtb__288)) (fun (p : ((string, Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__289; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__290 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_ORecordCon (dtb__289)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dCodegen_dTerm_dgsDepOfFamily dtb__290) dtb__287) }))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrCtor (dtb__291, dtb__292, dtb__293, dtb__294) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIrArgs mc0) dtb__294)) (fun (p : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__295; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__296 } -> ((fun r -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OCtorApp ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf r), dtb__295)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf r) }))) (((v_Vuna_dCompiler_dCodegen_dTerm_dgenCtorRef dtb__296) dtb__291) dtb__292))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrGlobal (dtb__297) -> ((fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OName ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) }))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgenValueRef mc0) dtb__297))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIr_IrVar (dtb__298) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OName ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dirBinderText dtb__298))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc0 }))
  | _ -> failwith "DT: impossible branch"
))
# 1993 "Vuna/Compiler/Codegen/Term.vuna"
and v_Vuna_dCompiler_dCodegen_dTerm_dgenIrArgs = (fun (mc0 : t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__299, dtb__300) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr mc0) dtb__299)) (fun (p : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__301; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__302 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIrArgs dtb__302) dtb__300)) (fun (q : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__303; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__304 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__301, dtb__303)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__304 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc0 }))
  | _ -> failwith "DT: impossible branch"
))
# 2008 "Vuna/Compiler/Codegen/Term.vuna"
and v_Vuna_dCompiler_dCodegen_dTerm_dgenAssignedFields = (fun (mc0 : t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) (mc1 : string) (mc2 : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__305, dtb__306) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr mc0) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__305))) (fun (p : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__307; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__308 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dTerm_dgenAssignedFields dtb__308) mc1) dtb__306)) (fun (q : ((string, Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__309; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__310 } -> ((fun st3 -> ((fun label -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = label; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__307 }, dtb__309)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st3 }))) (((v_Vuna_dCompiler_dCodegen_dTerm_drecordLabelOf st3) mc1) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldLabel mc1) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__305))))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgsDepOfFamily dtb__310) mc1))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc0 }))
  | _ -> failwith "DT: impossible branch"
))
# 2066 "Vuna/Compiler/Codegen/Term.vuna"
and v_Vuna_dCompiler_dCodegen_dTerm_dgenArms = (fun (mc0 : t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__311, dtb__312) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenArm mc0) dtb__311)) (fun (p : ((Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOPat, Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm) Base_dData_dPair.t_Base_dData_dPair_dPair, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__313; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__314 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenArms dtb__314) dtb__312)) (fun (q : ((Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOPat, Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__315; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__316 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__313, dtb__315)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__316 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc0 }))
  | _ -> failwith "DT: impossible branch"
))
# 2080 "Vuna/Compiler/Codegen/Term.vuna"
and v_Vuna_dCompiler_dCodegen_dTerm_dgenArm = (fun st alt -> ((fun envPats -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr st) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf alt))) (fun (p : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__317; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__318 } -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__319) -> (match dtb__319 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__320; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__321 } -> (match ((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirSharedRecordFieldsOf dtb__320) ((dtb__318).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsShared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedRecordFields) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun r -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOPat_OPCtorPat ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf r), ((Base_dData_dList.v_Base_dData_dList_dmap (fun _heta0 -> (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOPat_OPVar (_heta0)))) envPats))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__317 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf r) }))) (((v_Vuna_dCompiler_dCodegen_dTerm_dgenCtorRef dtb__318) dtb__320) dtb__321))
  | dtb__322 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOPat_OPRecordPat (((((v_Vuna_dCompiler_dCodegen_dTerm_drecordPatFields dtb__318) dtb__320) dtb__322) envPats))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__317 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dCodegen_dTerm_dgsDepOfFamily dtb__318) dtb__320) }))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun pat -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = pat; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__317 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__318 }))) (match envPats with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOPat_OPWild
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__323, dtb__324) -> (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOPat_OPVar (dtb__323))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltCtorOf alt))
  | _ -> failwith "DT: impossible branch"
)))) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (n : string) -> (n <> ""))) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dCodegen_dTerm_dnonErasedBinderText) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf alt)))))
# 2118 "Vuna/Compiler/Codegen/Term.vuna"
and v_Vuna_dCompiler_dCodegen_dTerm_dgenNatBranches = (fun st fresh zero succ catch -> ((fun sc -> ((fun predExpr -> ((fun impossible -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dTerm_dgenNatAlt st) zero) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)) (fun (pz : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match pz with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__325; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__326 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dTerm_dgenNatAlt dtb__326) succ) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (predExpr)))) (fun (ps : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match ps with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__327; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__328 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dTerm_dgenNatAlt dtb__328) catch) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (sc)))) (fun (pc : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match pc with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__329; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__330 } -> ((fun trueTerm -> ((fun falseTerm -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OIf ((Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_ORaw ((String.concat "" ["("; sc; " = 0)"]))), trueTerm, falseTerm)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__330 }))) (match succ with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__331) -> ((v_Vuna_dCompiler_dCodegen_dTerm_dtermOrImpossible dtb__327) impossible)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match catch with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__332) -> ((v_Vuna_dCompiler_dCodegen_dTerm_dtermOrImpossible dtb__329) impossible)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> impossible
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) (match zero with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__333) -> ((v_Vuna_dCompiler_dCodegen_dTerm_dtermOrImpossible dtb__325) impossible)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match catch with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__334) -> ((v_Vuna_dCompiler_dCodegen_dTerm_dtermOrImpossible dtb__329) impossible)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> impossible
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_ORaw ("(failwith \"DT: impossible branch\")")))) (String.concat "" ["("; sc; " - 1)"]))) ("dtnat__" ^ (bi_strFromInt fresh))))
# 2160 "Vuna/Compiler/Codegen/Term.vuna"
and v_Vuna_dCompiler_dCodegen_dTerm_dgenNatAlt = (fun (mc0 : t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrAlt Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (mc2 : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__335) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr mc0) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf dtb__335))) (fun (p : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__336; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__337 } -> (match ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (n : string) -> (n <> ""))) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dCodegen_dTerm_dnonErasedBinderText) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf dtb__335))) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__336)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__337 }))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__338, dtb__339) -> (match dtb__339 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__340) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_OLet ((Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOPat_OPVar (dtb__338)), (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_ORaw (dtb__340)), dtb__336)))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__337 }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "Nat case arm has a binder but no runtime binding")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "Nat case arm has more than one runtime binder")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc0 }))
  | _ -> failwith "DT: impossible branch"
))

# 2224 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dbindKeywordOf = (fun group -> (if (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupIsRec group) then "let rec " else "let "))

# 2234 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dlineDirectiveOf = (fun st d -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefSpan d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ""
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__341) -> ((fun file -> (if (file = "") then "" else (String.concat "" ["# "; (bi_strFromInt (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartLine dtb__341)); " "; (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_docamlString file); "\n"]))) ((st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsNormPath (dtb__341).Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile))
  | _ -> failwith "DT: impossible branch"
))

# 2257 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dgenDef = (fun st d -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefBody d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC ((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithContext (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefSpan d)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName d)) (((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_ddiagNoLoc Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dSeverity_SevError) Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dPhase_PhInternal) Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCategory_CatInternal) "IC_AxiomRuntime") "axiom reached runtime code generation (partition must erase it)"))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__342) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr st) dtb__342)) (fun (p : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__343; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__344 } -> ((fun guarded -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dODef_ODValue ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName d)), guarded)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__344 }))) (if (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefInitGuard d) then (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm_ORaw ((String.concat "" ["(try "; (Vuna_dCompiler_dCodegen_dOcaml_dRender.v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm dtb__343); " with e -> dt_report_exn e (Printexc.get_raw_backtrace ()); exit 2)"]))) else dtb__343))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__345) -> (match dtb__345 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__346; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__347 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dODef_ODExternal ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefName d)), ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dirTyText (st).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsQual) dtb__346), dtb__347)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = st }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefExtern d)))

# 2243 "Vuna/Compiler/Codegen/Term.vuna"
let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupDefs = (fun (mc0 : t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__348, dtb__349) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenDef mc0) dtb__348)) (fun (p : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dODef, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__350; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__351 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupDefs dtb__351) dtb__349)) (fun (q : ((Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef, Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dODef) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__352; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__353 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__348; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__350 }, dtb__352)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__353 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc0 }))
  | _ -> failwith "DT: impossible branch"
))

# 2278 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_drenderDefOf = (fun (mc0 : Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dODef) -> (match mc0 with
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dODef_ODExternal (dtb__354, dtb__355, dtb__356) -> (String.concat "" ["external "; dtb__354; " : "; dtb__355; " = "; (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_docamlString dtb__356)])
  | Vuna_dCompiler_dCodegen_dOcaml_dModel.C_Vuna_dCompiler_dCodegen_dOcaml_dModel_dODef_ODValue (dtb__357, dtb__358) -> (String.concat "" [dtb__357; " = "; (Vuna_dCompiler_dCodegen_dOcaml_dRender.v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm dtb__358)])
  | _ -> failwith "DT: impossible branch"
))

# 2218 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dbindFirstOf = (fun (mc0 : t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrGroup) (mc2 : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef, Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dODef) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc2 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__359; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__360 } -> (String.concat "" [((v_Vuna_dCompiler_dCodegen_dTerm_dlineDirectiveOf mc0) dtb__359); (v_Vuna_dCompiler_dCodegen_dTerm_dbindKeywordOf mc1); (v_Vuna_dCompiler_dCodegen_dTerm_drenderDefOf dtb__360)])
  | _ -> failwith "DT: impossible branch"
))

# 2221 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dbindAndOf = (fun (mc0 : t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) (mc1 : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef, Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dODef) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc1 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__361; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__362 } -> (String.concat "" [((v_Vuna_dCompiler_dCodegen_dTerm_dlineDirectiveOf mc0) dtb__361); "and "; (v_Vuna_dCompiler_dCodegen_dTerm_drenderDefOf dtb__362)])
  | _ -> failwith "DT: impossible branch"
))

# 2213 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dbindGroupOf = (fun (mc0 : t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrGroup) (mc2 : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef, Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dODef) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__363, dtb__364) -> ((Vuna_dCompiler_dCodegen_dOcaml_dRender.v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith "\n") (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dCodegen_dTerm_dbindFirstOf mc0) mc1) dtb__363), ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dCodegen_dTerm_dbindAndOf mc0)) dtb__364))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 2196 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dgenGroup = (fun st group -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupDefs st) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs group))) (fun (p : ((Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef, Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dODef) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__365; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__366 } -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__367, dtb__368) -> (match dtb__368 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirDefExtern dtb__367) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__369) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Vuna_dCompiler_dCodegen_dOcaml_dRender.v_Vuna_dCompiler_dCodegen_dOcaml_dRender_djoinWith "\n") ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrDef, Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dODef) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (v_Vuna_dCompiler_dCodegen_dTerm_drenderDefOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)))) dtb__365)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__366 }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dCodegen_dTerm_dbindGroupOf dtb__366) group) dtb__365); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__366 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dCodegen_dTerm_dbindGroupOf dtb__366) group) dtb__365); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__366 }))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dCodegen_dTerm_dbindGroupOf dtb__366) group) dtb__365); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__366 }))
)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirGroupDefs group))
  | _ -> failwith "DT: impossible branch"
))))

# 2182 "Vuna/Compiler/Codegen/Term.vuna"
let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups = (fun (mc0 : t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrGroup Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__370, dtb__371) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroup mc0) dtb__370)) (fun (p : (string, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__372; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__373 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups dtb__373) dtb__371)) (fun (q : (string Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__374; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__375 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__372, dtb__374)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__375 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc0 }))
  | _ -> failwith "DT: impossible branch"
))

# 2318 "Vuna/Compiler/Codegen/Term.vuna"
let rec v_Vuna_dCompiler_dCodegen_dTerm_dfoldHandlers = (fun (mc0 : t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) (mc1 : string) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__376, dtb__377) -> ((fun p -> (((v_Vuna_dCompiler_dCodegen_dTerm_dfoldHandlers (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) (String.concat "" ["("; (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); " "; mc1; ")"])) dtb__377)) ((v_Vuna_dCompiler_dCodegen_dTerm_dgenValueRef mc0) dtb__376))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc1; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc0 }
  | _ -> failwith "DT: impossible branch"
))

# 2325 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dhookText = (fun showText body printResult -> ((fun action -> (String.concat "" ["\nlet () =\n  Printexc.record_backtrace true;\n  try "; action; "\n  with e -> dt_report_exn e (Printexc.get_raw_backtrace ()); exit 2\n"])) (if printResult then (String.concat "" ["print_endline ("; showText; " ("; body; "))"]) else (String.concat "" ["ignore ("; body; ")"]))))

# 2290 "Vuna/Compiler/Codegen/Term.vuna"
let v_Vuna_dCompiler_dCodegen_dTerm_dgenEntryHook = (fun st entry printResult -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dTerm_dgenIr st) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryShowOf entry))) (fun (sp : (Vuna_dCompiler_dCodegen_dOcaml_dModel.t_Vuna_dCompiler_dCodegen_dOcaml_dModel_dOTerm, t_Vuna_dCompiler_dCodegen_dTerm_dGenSt) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match sp with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__378; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__379 } -> (if (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryIsActionOf entry) then (match (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryRunMainOf entry) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "action entry has no runMain")
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__380) -> ((fun mainP -> ((fun st2 -> ((fun runP -> ((fun st3 -> (match (((v_Vuna_dCompiler_dCodegen_dTerm_dfoldHandlers st3) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf mainP)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryHandlersOf entry)) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__381; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__382 } -> ((fun body -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dCodegen_dTerm_dhookText (Vuna_dCompiler_dCodegen_dOcaml_dRender.v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm dtb__378)) body) printResult); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (dtb__382).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsDeps }))) (String.concat "" ["dtp_sched_main (fun () -> "; (Base_dData_dPair.v_Base_dData_dPair_dfirstOf runP); " "; dtb__381; ")"]))
  | _ -> failwith "DT: impossible branch"
)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf runP))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgenValueRef st2) dtb__380))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf mainP))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgenValueRef dtb__379) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryMainOf entry)))
  | _ -> failwith "DT: impossible branch"
) else ((fun mainP -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dCodegen_dTerm_dhookText (Vuna_dCompiler_dCodegen_dOcaml_dRender.v_Vuna_dCompiler_dCodegen_dOcaml_dRender_drenderTerm dtb__378)) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf mainP)) printResult); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf mainP)).f_Vuna_dCompiler_dCodegen_dTerm_dGenSt_gsDeps }))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgenValueRef dtb__379) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirEntryMainOf entry))))
  | _ -> failwith "DT: impossible branch"
))))
